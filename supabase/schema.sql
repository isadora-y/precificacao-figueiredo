-- =====================================================================
-- Sistema de Precificação · Figueiredo Bar e Cozinha
-- Migração inicial do Supabase (Postgres 15+)
--
-- Princípios:
--   * Todo cálculo de custo/CMV/preço vive no banco (views/funções).
--     O front só lê as views e grava cadastros.
--   * Multiempresa desde o início (empresa_id em tudo + RLS).
--   * Dinheiro e quantidades em numeric (nunca float).
-- =====================================================================

create extension if not exists pgcrypto;

-- ---------------------------------------------------------------------
-- Tipos
-- ---------------------------------------------------------------------
do $$ begin
  create type tipo_receita as enum ('base', 'preparo', 'prato', 'drink');
exception when duplicate_object then null; end $$;

do $$ begin
  create type canal_venda as enum ('salao', 'ifood', 'delivery_proprio');
exception when duplicate_object then null; end $$;

do $$ begin
  create type papel_membro as enum ('admin', 'gestor', 'compras', 'cozinha', 'leitura');
exception when duplicate_object then null; end $$;

-- ---------------------------------------------------------------------
-- Empresas, unidades, membros, parâmetros
-- ---------------------------------------------------------------------
create table if not exists empresas (
  id            uuid primary key default gen_random_uuid(),
  nome          text not null,
  slug          text not null unique,
  logo_url      text,
  cor_primaria  text,
  created_at    timestamptz not null default now()
);

create table if not exists unidades (
  id          uuid primary key default gen_random_uuid(),
  empresa_id  uuid not null references empresas(id) on delete cascade,
  nome        text not null,
  unique (empresa_id, nome)
);

create table if not exists membros (
  empresa_id  uuid not null references empresas(id) on delete cascade,
  user_id     uuid not null references auth.users(id) on delete cascade,
  papel       papel_membro not null default 'leitura',
  primary key (empresa_id, user_id)
);

-- Parâmetros de precificação
create table if not exists parametros (
  empresa_id          uuid primary key references empresas(id) on delete cascade,
  markup_padrao       numeric(8,4) not null default 3.0,   -- markup de 300% = custo × 3
  cmv_alvo            numeric(6,4) not null default 0.30,  -- usado no status do cardápio
  cmv_alvo_bebidas    numeric(6,4) not null default 0.25,
  markup_ifood        numeric(8,4) not null default 5.0,   -- preço ideal iFood = (custo + embalagem) × 5
  fator_preco_minimo  numeric(6,4) not null default 0.70,  -- preço mínimo ideal = 70% do ideal
  perda_bar           numeric(6,4) not null default 0.05,  -- drinks e doses
  taxa_ifood          numeric(6,4) not null default 0.27,
  final_preco         numeric(4,2) not null default 0.90,  -- preços sugeridos terminam em ,90
  updated_at          timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- Insumos  (unidade de compra → preço da unidade base)
-- ---------------------------------------------------------------------
create table if not exists insumos (
  id                      uuid primary key default gen_random_uuid(),
  empresa_id              uuid not null references empresas(id) on delete cascade,
  codigo                  integer not null,
  nome                    text not null,
  categoria               text not null default 'Mercearia',
  unidade_compra          text not null default 'kg',      -- ex.: "cx 36 un", "pct 5 kg", "galão 3,5 kg"
  qtd_por_unidade_compra  numeric(14,6) not null default 1 check (qtd_por_unidade_compra > 0),
  unidade_base            text not null default 'kg',      -- kg | L | un | maço | pct
  preco_unidade_compra    numeric(14,4) not null default 0 check (preco_unidade_compra >= 0),
  fator_correcao          numeric(8,4)  not null default 1 check (fator_correcao > 0),
  preco_base              numeric(18,6) generated always as (preco_unidade_compra / qtd_por_unidade_compra) stored,
  preco_liquido           numeric(18,6) generated always as (preco_unidade_compra / qtd_por_unidade_compra * fator_correcao) stored,
  fornecedor              text,
  atualizado_em           date,
  ativo                   boolean not null default true,
  created_at              timestamptz not null default now(),
  unique (empresa_id, codigo),
  unique (empresa_id, nome)
);
create index if not exists insumos_empresa_idx on insumos (empresa_id);

-- Histórico de preços (alimentado por trigger)
create table if not exists insumo_precos (
  id                      bigint generated always as identity primary key,
  insumo_id               uuid not null references insumos(id) on delete cascade,
  preco_unidade_compra    numeric(14,4) not null,
  qtd_por_unidade_compra  numeric(14,6) not null,
  fator_correcao          numeric(8,4)  not null,
  registrado_em           timestamptz not null default now(),
  registrado_por          uuid
);
create index if not exists insumo_precos_insumo_idx on insumo_precos (insumo_id, registrado_em desc);

-- security definer: o histórico é gravado pelo sistema, sem policy de insert para o usuário
create or replace function fn_registrar_preco() returns trigger language plpgsql security definer set search_path = public as $$
begin
  if tg_op = 'INSERT'
     or new.preco_unidade_compra   is distinct from old.preco_unidade_compra
     or new.qtd_por_unidade_compra is distinct from old.qtd_por_unidade_compra
     or new.fator_correcao         is distinct from old.fator_correcao then
    insert into insumo_precos (insumo_id, preco_unidade_compra, qtd_por_unidade_compra, fator_correcao, registrado_por)
    values (new.id, new.preco_unidade_compra, new.qtd_por_unidade_compra, new.fator_correcao, auth.uid());
  end if;
  return new;
end $$;

drop trigger if exists trg_registrar_preco on insumos;
create trigger trg_registrar_preco after insert or update on insumos
  for each row execute function fn_registrar_preco();

-- ---------------------------------------------------------------------
-- Receitas (bases, preparos, pratos, drinks) e itens
-- ---------------------------------------------------------------------
create table if not exists receitas (
  id                  uuid primary key default gen_random_uuid(),
  empresa_id          uuid not null references empresas(id) on delete cascade,
  slug                text not null,
  nome                text not null,
  tipo                tipo_receita not null,
  categoria           text,
  rendimento          numeric(14,6) not null default 1 check (rendimento > 0),
  unidade_rendimento  text not null default 'porção',     -- kg | L | un | porção
  porcao_g            numeric(10,2),                       -- gramatura servida (opcional)
  modo_preparo        text,
  foto_url            text,
  ativo               boolean not null default true,
  created_at          timestamptz not null default now(),
  updated_at          timestamptz not null default now(),
  unique (empresa_id, slug)
);
create index if not exists receitas_empresa_idx on receitas (empresa_id, tipo);

create table if not exists receita_itens (
  id               uuid primary key default gen_random_uuid(),
  receita_id       uuid not null references receitas(id) on delete cascade,
  ordem            integer not null default 0,
  insumo_id        uuid references insumos(id) on delete restrict,
  sub_receita_id   uuid references receitas(id) on delete restrict,
  quantidade       numeric(14,6) check (quantidade >= 0),  -- na unidade_base do insumo / unidade_rendimento da sub-receita
  observacao       text,
  check ((insumo_id is null) <> (sub_receita_id is null)),
  check (sub_receita_id is distinct from receita_id)
);
create index if not exists receita_itens_receita_idx on receita_itens (receita_id);
create index if not exists receita_itens_sub_idx on receita_itens (sub_receita_id);

-- Impede ciclos (A usa B que usa A)
create or replace function fn_bloquear_ciclo() returns trigger language plpgsql as $$
declare achou boolean;
begin
  if new.sub_receita_id is null then return new; end if;
  with recursive desce(id) as (
    select new.sub_receita_id
    union
    select ri.sub_receita_id from receita_itens ri join desce d on ri.receita_id = d.id
    where ri.sub_receita_id is not null
  )
  select exists (select 1 from desce where id = new.receita_id) into achou;
  if achou then
    raise exception 'Ciclo de receitas: a sub-receita já usa esta receita';
  end if;
  return new;
end $$;

drop trigger if exists trg_bloquear_ciclo on receita_itens;
create trigger trg_bloquear_ciclo before insert or update on receita_itens
  for each row execute function fn_bloquear_ciclo();

-- ---------------------------------------------------------------------
-- Cardápio, vendas, concorrência, produção, pendências
-- ---------------------------------------------------------------------
create table if not exists cardapio_itens (
  id               uuid primary key default gen_random_uuid(),
  empresa_id       uuid not null references empresas(id) on delete cascade,
  unidade_id       uuid references unidades(id) on delete set null,  -- null = vale para todas
  categoria        text not null,
  nome             text not null,
  canal            canal_venda not null default 'salao',
  receita_id       uuid references receitas(id) on delete set null,  -- prato / drink
  insumo_id        uuid references insumos(id) on delete set null,   -- revenda (cerveja, refri…)
  qtd_insumo       numeric(14,6),                                     -- revenda: quanto do insumo sai por venda
  custo_manual     numeric(14,4),                                     -- itens ainda sem ficha
  custo_embalagem  numeric(14,4) not null default 0,
  preco_venda      numeric(14,2),
  ordem            integer not null default 0,
  ativo            boolean not null default true,
  unique (empresa_id, canal, categoria, nome)
);
create index if not exists cardapio_empresa_idx on cardapio_itens (empresa_id, canal);

create table if not exists vendas_periodo (
  id                bigint generated always as identity primary key,
  cardapio_item_id  uuid not null references cardapio_itens(id) on delete cascade,
  periodo_inicio    date not null,
  periodo_fim       date not null,
  quantidade        numeric(14,2) not null check (quantidade >= 0),
  unique (cardapio_item_id, periodo_inicio, periodo_fim)
);

create table if not exists precos_concorrentes (
  id                  bigint generated always as identity primary key,
  empresa_id          uuid not null references empresas(id) on delete cascade,
  cardapio_item_id    uuid references cardapio_itens(id) on delete set null,
  concorrente         text not null,
  produto_referencia  text not null,
  canal               canal_venda not null default 'ifood',
  preco               numeric(14,2) not null,
  coletado_em         date not null default current_date
);

create table if not exists producao_planejada (
  id          bigint generated always as identity primary key,
  empresa_id  uuid not null references empresas(id) on delete cascade,
  semana      date not null,              -- segunda-feira da semana
  receita_id  uuid not null references receitas(id) on delete cascade,
  quantidade  numeric(14,2) not null      -- em unidades de rendimento da receita (porções, kg…)
);

create table if not exists pendencias (
  id          bigint generated always as identity primary key,
  empresa_id  uuid not null references empresas(id) on delete cascade,
  tipo        text not null,
  onde        text not null,
  detalhe     text not null,
  impacto     text,
  resolvida   boolean not null default false,
  created_at  timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- Cálculo (fonte única de verdade)
-- ---------------------------------------------------------------------
create or replace function fn_preco_final(valor numeric, final numeric default 0.90)
returns numeric language sql immutable as $$
  -- arredonda para cima terminando em ",90" (ou no final configurado), nunca abaixo do valor
  select case when valor is null or valor <= 0 then 0
              else ceil(valor + (1 - final)) - (1 - final) end
$$;

-- Explode cada receita até os insumos, multiplicando as quantidades pelos
-- rendimentos das sub-receitas. Profundidade máxima: 10 níveis.
create or replace view v_receita_explodida with (security_invoker = true) as
with recursive arvore as (
  select r.id as raiz, ri.insumo_id, ri.sub_receita_id, ri.quantidade::numeric as fator, 1 as nivel
  from receitas r
  join receita_itens ri on ri.receita_id = r.id
  union all
  select a.raiz, ri.insumo_id, ri.sub_receita_id, a.fator * ri.quantidade / s.rendimento, a.nivel + 1
  from arvore a
  join receitas s       on s.id = a.sub_receita_id
  join receita_itens ri on ri.receita_id = s.id
  where a.nivel < 10
)
select raiz as receita_id, insumo_id, sum(fator) as quantidade_total
from arvore
where insumo_id is not null
group by raiz, insumo_id;

create or replace view v_receita_custos with (security_invoker = true) as
select r.id as receita_id, r.empresa_id, r.slug, r.nome, r.tipo, r.categoria,
       r.rendimento, r.unidade_rendimento, r.porcao_g,
       coalesce(sum(e.quantidade_total * i.preco_liquido), 0)                     as custo_total,
       coalesce(sum(e.quantidade_total * i.preco_liquido), 0) / r.rendimento      as custo_por_unidade,
       count(*) filter (where i.id is not null and i.preco_liquido = 0)           as insumos_sem_preco
from receitas r
left join v_receita_explodida e on e.receita_id = r.id
left join insumos i            on i.id = e.insumo_id
group by r.id;

create or replace view v_cardapio with (security_invoker = true) as
with base as (
  select c.*, p.markup_padrao, p.cmv_alvo, p.cmv_alvo_bebidas, p.markup_ifood, p.fator_preco_minimo,
         p.perda_bar, p.final_preco,
         case
           when c.receita_id is not null then rc.custo_por_unidade * case when rc.tipo = 'drink' then 1 + p.perda_bar else 1 end
           when c.insumo_id  is not null then i.preco_liquido * coalesce(c.qtd_insumo, 1)
           else c.custo_manual
         end as custo_produto,
         case when c.receita_id is not null then 'ficha'
              when c.insumo_id  is not null then 'revenda'
              when c.custo_manual is not null then 'manual'
              else 'sem custo' end as origem_custo,
         rc.insumos_sem_preco,
         (c.insumo_id is not null or rc.tipo = 'drink') as eh_bebida
  from cardapio_itens c
  join parametros p          on p.empresa_id = c.empresa_id
  left join v_receita_custos rc on rc.receita_id = c.receita_id
  left join insumos i        on i.id = c.insumo_id
)
select b.id, b.empresa_id, b.unidade_id, b.categoria, b.nome, b.canal, b.receita_id, b.insumo_id, b.ordem, b.ativo,
       b.origem_custo, b.insumos_sem_preco, b.eh_bebida,
       b.custo_produto,
       b.custo_embalagem,
       b.custo_produto + b.custo_embalagem                                       as custo_total,
       b.preco_venda,
       case when b.preco_venda > 0 then (b.custo_produto + b.custo_embalagem) / b.preco_venda end as cmv,
       case when b.preco_venda > 0 then b.preco_venda - (b.custo_produto + b.custo_embalagem) end as lucro_bruto,
       fn_preco_final((b.custo_produto + b.custo_embalagem) * b.markup_padrao, b.final_preco)     as preco_markup,
       fn_preco_final((b.custo_produto + b.custo_embalagem) /
                      case when b.eh_bebida then b.cmv_alvo_bebidas else b.cmv_alvo end,
                      b.final_preco)                                                              as preco_cmv_alvo,
       fn_preco_final((b.custo_produto + b.custo_embalagem) * b.markup_ifood, b.final_preco)      as preco_ideal_ifood,
       fn_preco_final((b.custo_produto + b.custo_embalagem) * b.markup_ifood * b.fator_preco_minimo, b.final_preco) as preco_minimo_ifood,
       case
         when b.custo_produto is null then 'sem custo'
         when coalesce(b.preco_venda, 0) = 0 then 'sem preço'
         when (b.custo_produto + b.custo_embalagem) / b.preco_venda >
              case when b.eh_bebida then b.cmv_alvo_bebidas else b.cmv_alvo end then 'acima do alvo'
         else 'ok'
       end as status
from base b;

-- Representatividade e CMV ponderado por período
create or replace view v_representatividade with (security_invoker = true) as
select v.periodo_inicio, v.periodo_fim, c.empresa_id, c.id as cardapio_item_id, c.nome, c.categoria, c.canal,
       v.quantidade,
       v.quantidade / nullif(sum(v.quantidade) over (partition by c.empresa_id, v.periodo_inicio, v.periodo_fim), 0) as representatividade
from vendas_periodo v
join cardapio_itens c on c.id = v.cardapio_item_id;

-- Lista de compras da semana
create or replace view v_lista_compras with (security_invoker = true) as
select pp.empresa_id, pp.semana, i.id as insumo_id, i.codigo, i.nome, i.unidade_base,
       -- fichas guardam quantidade líquida (aproveitável); a compra é bruta = líquida × fator de correção
       sum(pp.quantidade * e.quantidade_total / r.rendimento) * i.fator_correcao  as quantidade_base,
       sum(pp.quantidade * e.quantidade_total / r.rendimento) * i.fator_correcao / i.qtd_por_unidade_compra as unidades_compra,
       i.unidade_compra,
       sum(pp.quantidade * e.quantidade_total / r.rendimento * i.preco_liquido)   as custo_estimado
from producao_planejada pp
join receitas r            on r.id = pp.receita_id
join v_receita_explodida e on e.receita_id = r.id
join insumos i             on i.id = e.insumo_id
group by pp.empresa_id, pp.semana, i.id;

-- Onde cada insumo é usado (direta ou indiretamente)
create or replace view v_insumo_uso with (security_invoker = true) as
select e.insumo_id, r.empresa_id, count(distinct r.id) filter (where r.tipo in ('prato','drink')) as pratos,
       count(distinct r.id) as receitas
from v_receita_explodida e
join receitas r on r.id = e.receita_id
group by e.insumo_id, r.empresa_id;

-- Simulação: novo preço de um insumo → impacto no cardápio (sem gravar nada)
create or replace function fn_simular_preco_insumo(p_insumo uuid, p_novo_preco_compra numeric)
returns table (cardapio_item_id uuid, nome text, canal canal_venda, custo_atual numeric, custo_novo numeric,
               cmv_atual numeric, cmv_novo numeric)
language sql stable security invoker as $$
  select c.id, c.nome, c.canal, c.custo_total,
         c.custo_total + coalesce(e.quantidade_total, 0) / r.rendimento
                       * (p_novo_preco_compra - i.preco_unidade_compra) / i.qtd_por_unidade_compra * i.fator_correcao,
         c.cmv,
         case when c.preco_venda > 0 then
           (c.custo_total + coalesce(e.quantidade_total, 0) / r.rendimento
                       * (p_novo_preco_compra - i.preco_unidade_compra) / i.qtd_por_unidade_compra * i.fator_correcao) / c.preco_venda end
  from v_cardapio c
  join receitas r on r.id = c.receita_id
  join v_receita_explodida e on e.receita_id = r.id and e.insumo_id = p_insumo
  join insumos i on i.id = p_insumo
$$;

-- ---------------------------------------------------------------------
-- RLS
-- ---------------------------------------------------------------------
create or replace function fn_eh_membro(p_empresa uuid, p_papeis papel_membro[] default null)
returns boolean language sql stable security definer set search_path = public as $$
  select exists (
    select 1 from membros m
    where m.empresa_id = p_empresa and m.user_id = auth.uid()
      and (p_papeis is null or m.papel = any (p_papeis))
  )
$$;

alter table empresas            enable row level security;
alter table unidades            enable row level security;
alter table membros             enable row level security;
alter table parametros          enable row level security;
alter table insumos             enable row level security;
alter table insumo_precos       enable row level security;
alter table receitas            enable row level security;
alter table receita_itens       enable row level security;
alter table cardapio_itens      enable row level security;
alter table vendas_periodo      enable row level security;
alter table precos_concorrentes enable row level security;
alter table producao_planejada  enable row level security;
alter table pendencias          enable row level security;

-- leitura: qualquer membro
create policy le_empresas   on empresas   for select using (fn_eh_membro(id));
create policy le_unidades   on unidades   for select using (fn_eh_membro(empresa_id));
create policy le_membros    on membros    for select using (fn_eh_membro(empresa_id));
create policy le_parametros on parametros for select using (fn_eh_membro(empresa_id));
create policy le_insumos    on insumos    for select using (fn_eh_membro(empresa_id));
create policy le_precos     on insumo_precos for select using (exists (select 1 from insumos i where i.id = insumo_id and fn_eh_membro(i.empresa_id)));
create policy le_receitas   on receitas   for select using (fn_eh_membro(empresa_id));
create policy le_itens      on receita_itens for select using (exists (select 1 from receitas r where r.id = receita_id and fn_eh_membro(r.empresa_id)));
create policy le_cardapio   on cardapio_itens for select using (fn_eh_membro(empresa_id));
create policy le_vendas     on vendas_periodo for select using (exists (select 1 from cardapio_itens c where c.id = cardapio_item_id and fn_eh_membro(c.empresa_id)));
create policy le_concorr    on precos_concorrentes for select using (fn_eh_membro(empresa_id));
create policy le_producao   on producao_planejada for select using (fn_eh_membro(empresa_id));
create policy le_pendencias on pendencias for select using (fn_eh_membro(empresa_id));

-- escrita
create policy gr_parametros on parametros for all
  using (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]));
create policy gr_insumos on insumos for all
  using (fn_eh_membro(empresa_id, array['admin','gestor','compras']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor','compras']::papel_membro[]));
create policy gr_receitas on receitas for all
  using (fn_eh_membro(empresa_id, array['admin','gestor','cozinha']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor','cozinha']::papel_membro[]));
create policy gr_itens on receita_itens for all
  using (exists (select 1 from receitas r where r.id = receita_id and fn_eh_membro(r.empresa_id, array['admin','gestor','cozinha']::papel_membro[])))
  with check (exists (select 1 from receitas r where r.id = receita_id and fn_eh_membro(r.empresa_id, array['admin','gestor','cozinha']::papel_membro[])));
create policy gr_cardapio on cardapio_itens for all
  using (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]));
create policy gr_vendas on vendas_periodo for all
  using (exists (select 1 from cardapio_itens c where c.id = cardapio_item_id and fn_eh_membro(c.empresa_id, array['admin','gestor']::papel_membro[])))
  with check (exists (select 1 from cardapio_itens c where c.id = cardapio_item_id and fn_eh_membro(c.empresa_id, array['admin','gestor']::papel_membro[])));
create policy gr_concorr on precos_concorrentes for all
  using (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]));
create policy gr_producao on producao_planejada for all
  using (fn_eh_membro(empresa_id, array['admin','gestor','cozinha','compras']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin','gestor','cozinha','compras']::papel_membro[]));
create policy gr_pendencias on pendencias for update
  using (fn_eh_membro(empresa_id, array['admin','gestor']::papel_membro[]));
create policy gr_membros on membros for all
  using (fn_eh_membro(empresa_id, array['admin']::papel_membro[]))
  with check (fn_eh_membro(empresa_id, array['admin']::papel_membro[]));
