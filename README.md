# Precificação · Figueiredo Bar e Cozinha

Sistema de precificação do Figueiredo: painel de CMV do cardápio, insumos com atualização de preço, fichas técnicas com sub-receitas, simulador e pendências.

Esta versão é um site estático (um `index.html`). Ela funciona de dois jeitos:

- **Sem Supabase** (padrão): usa os dados do Figueiredo (170 insumos, 123 receitas, 111 itens de cardápio) embutidos no próprio `index.html`. O que alguém alterar fica salvo só no navegador dessa pessoa.
- **Modo Supabase**: com `config.js` preenchido, pede login por e-mail, lê os números das views do banco e grava as alterações lá.

## Arquivos

| Arquivo | O que é |
|---|---|
| `index.html` | O sistema inteiro (telas, cálculos e ligação com o Supabase) |
| `config.js` | Onde entra a URL e a chave pública do Supabase. Vazio = dados embutidos, salvos no navegador |
| `brand/` | Logo do Figueiredo (também embutida no `index.html`) |
| `supabase/schema.sql` | Estrutura do banco: tabelas, cálculos, histórico de preço e permissões |
| `supabase/seed.sql` | Carga dos dados do Figueiredo |

## Passo 1 · GitHub

1. Em github.com, clique em **New repository**. Nome sugerido: `precificacao-figueiredo`. Marque **Private** e crie.
2. Na página do repositório, clique em **uploading an existing file** (ou **Add file › Upload files**).
3. Arraste todos os arquivos e pastas deste pacote (`index.html`, `config.js`, `README.md`, `brand/`, `supabase/`) e clique em **Commit changes**.

## Passo 2 · Vercel (colocar no ar)

1. Em vercel.com, entre com a conta do GitHub e clique em **Add New… › Project**.
2. Escolha o repositório `precificacao-figueiredo` e clique em **Import**.
3. Em **Framework Preset**, deixe **Other**. Não precisa de comando de build. Clique em **Deploy**.
4. Em cerca de um minuto sai um endereço como `precificacao-figueiredo.vercel.app`. Pronto: o sistema já está no ar.

Toda vez que um arquivo mudar no GitHub, a Vercel publica a nova versão sozinha.

## Passo 3 · Supabase (dados reais, com login)

1. Em supabase.com, clique em **New project**. Região: **South America (São Paulo)**. Guarde a senha do banco num lugar seguro (não mande no chat).
2. No projeto, abra **SQL Editor › New query**, cole todo o conteúdo de `supabase/schema.sql` e clique em **Run**. Depois faça o mesmo com `supabase/seed.sql`.
3. Em **Authentication › URL Configuration**, coloque em **Site URL** o endereço da Vercel (ex.: `https://precificacao-figueiredo.vercel.app`) e adicione o mesmo endereço em **Redirect URLs**.
4. Em **Project Settings › API**, copie **Project URL** e a chave **anon public**.
5. No GitHub, abra `config.js`, clique no lápis, cole os dois valores e salve (**Commit changes**). A Vercel publica de novo.
6. Abra o site, digite seu e-mail e clique no link que chegar. Vai aparecer "Sem acesso ainda": é esperado.
7. De volta ao **SQL Editor** do Supabase, rode (trocando o e-mail):

   ```sql
   insert into membros (empresa_id, user_id, papel)
   select e.id, u.id, 'admin'
   from empresas e, auth.users u
   where e.slug = 'figueiredo' and u.email = 'seu-email@exemplo.com';
   ```

8. Recarregue o site. Agora os números vêm do banco.

Para dar acesso a outras pessoas: elas entram uma vez pelo site e você roda o mesmo comando com o e-mail delas e o papel certo: `admin`, `gestor` (sócios), `compras` (atualiza preço de insumo), `cozinha` (edita fichas) ou `leitura`.

## Como os números são calculados

- Preço líquido do insumo = preço da unidade de compra ÷ quantidade por unidade × fator de correção.
- Custo da receita = soma de quantidade × preço líquido (ou custo por unidade da sub-receita).
- CMV = custo da porção ÷ preço de venda. Alvo inicial: 30% (provisório, editável em Parâmetros).
- Preço pelo markup = custo × 3 (markup de 300%). Preço p/ CMV alvo = custo ÷ CMV alvo.
- iFood: preço ideal = (custo + embalagem) × 5; preço mínimo = 70% do ideal.
- Preços sugeridos arredondados para cima terminando em ,90.

No modo Supabase, esses números saem das views do banco (`v_receita_custos`, `v_cardapio`). O cálculo dentro do `index.html` é usado só sem Supabase e nas simulações que ainda não foram gravadas.

