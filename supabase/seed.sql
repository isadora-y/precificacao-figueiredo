-- Gerado por scripts/gerar_seed.py a partir de data/*.csv. Não edite à mão: edite os CSVs e gere de novo.
begin;
insert into empresas (nome, slug) values ('Figueiredo Bar e Cozinha', 'figueiredo') on conflict (slug) do update set nome = excluded.nome;
insert into parametros (empresa_id) select (select id from empresas where slug = 'figueiredo') on conflict (empresa_id) do nothing;
insert into unidades (empresa_id, nome) select (select id from empresas where slug = 'figueiredo'), n from (values ('Valparaíso'), ('Planaltina')) v(n) on conflict do nothing;
delete from cardapio_itens where empresa_id = (select id from empresas where slug = 'figueiredo');
delete from receita_itens where receita_id in (select id from receitas where empresa_id = (select id from empresas where slug = 'figueiredo'));
delete from receitas where empresa_id = (select id from empresas where slug = 'figueiredo');
delete from insumos where empresa_id = (select id from empresas where slug = 'figueiredo');
delete from pendencias where empresa_id = (select id from empresas where slug = 'figueiredo');

-- insumos
insert into insumos (empresa_id, codigo, nome, categoria, unidade_compra, qtd_por_unidade_compra, unidade_base, preco_unidade_compra, fator_correcao) values
((select id from empresas where slug = 'figueiredo'), 1, 'ANCHO ANGUS KG', 'Proteínas', 'kg', 1.0, 'kg', 63.0, 1.07),
((select id from empresas where slug = 'figueiredo'), 2, 'ANEIS DE LULA', 'Proteínas', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 3, 'BACALHAU KG', 'Proteínas', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 4, 'BANCON MANTA KG', 'Proteínas', 'kg', 1.0, 'kg', 23.0, 1.1),
((select id from empresas where slug = 'figueiredo'), 5, 'BARRIGA SUÍNA', 'Proteínas', 'kg', 1.0, 'kg', 30.0, 2.0),
((select id from empresas where slug = 'figueiredo'), 6, 'CALABRESA KG', 'Proteínas', 'kg', 1.0, 'kg', 17.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 7, 'CAMARAO 41/50 KG', 'Proteínas', 'kg', 1.0, 'kg', 70.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 8, 'CAMARAO GG KG', 'Proteínas', 'kg', 1.0, 'kg', 120.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 9, 'CARNE BURGER (BLEND)', 'Proteínas', 'kg', 1.0, 'kg', 33.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 10, 'CHORIZO ANGUS KG', 'Proteínas', 'kg', 1.0, 'kg', 74.0, 1.07),
((select id from empresas where slug = 'figueiredo'), 11, 'COSTELA BOVINA KG', 'Proteínas', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 12, 'COSTELA SUINA KG', 'Proteínas', 'kg', 1.0, 'kg', 28.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 13, 'COXAO DURO ANGUS KG', 'Proteínas', 'kg', 1.0, 'kg', 43.0, 1.3),
((select id from empresas where slug = 'figueiredo'), 14, 'COXAO DURO KG', 'Proteínas', 'kg', 1.0, 'kg', 33.5, 2.3),
((select id from empresas where slug = 'figueiredo'), 15, 'Cupim A', 'Proteínas', 'kg', 1.0, 'kg', 0.0, 2.0),
((select id from empresas where slug = 'figueiredo'), 16, 'FILE DE PEITO DE FRANGO KG', 'Proteínas', 'kg', 1.0, 'kg', 16.0, 1.25),
((select id from empresas where slug = 'figueiredo'), 17, 'FILE DE SALMAO 1500 A 1800 KG', 'Proteínas', 'kg', 1.0, 'kg', 64.0, 1.18),
((select id from empresas where slug = 'figueiredo'), 18, 'FILE DE TILAPÍA KG', 'Proteínas', 'kg', 1.0, 'kg', 41.0, 1.16),
((select id from empresas where slug = 'figueiredo'), 19, 'FILE MIGNON KG', 'Proteínas', 'kg', 1.0, 'kg', 75.0, 1.15),
((select id from empresas where slug = 'figueiredo'), 20, 'FLAT IRON KG', 'Proteínas', 'kg', 1.0, 'kg', 60.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 21, 'FRANGO A PASSARINHO', 'Proteínas', 'kg', 1.0, 'kg', 9.0, 1.5),
((select id from empresas where slug = 'figueiredo'), 22, 'OSSOBUCO KG', 'Proteínas', 'kg', 1.0, 'kg', 28.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 23, 'PEITO BOVINO KG', 'Proteínas', 'kg', 1.0, 'kg', 28.0, 2.0),
((select id from empresas where slug = 'figueiredo'), 24, 'PESCADA COMBUCU KG', 'Proteínas', 'kg', 1.0, 'kg', 38.0, 1.5),
((select id from empresas where slug = 'figueiredo'), 25, 'PICANHA KG', 'Proteínas', 'kg', 1.0, 'kg', 86.0, 1.1),
((select id from empresas where slug = 'figueiredo'), 26, 'RABO BOVINO KG', 'Proteínas', 'kg', 1.0, 'kg', 33.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 27, 'TENTÁCULOS DE POLVO', 'Proteínas', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 28, 'Abacaxi', 'Hortifrúti', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 29, 'Abobrinha', 'Hortifrúti', 'kg', 1.0, 'kg', 6.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 30, 'Agrião hidro', 'Hortifrúti', 'maço', 1.0, 'maço', 4.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 31, 'Alecrim', 'Hortifrúti', 'maço', 1.0, 'maço', 4.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 32, 'Alface Americana', 'Hortifrúti', 'maço', 1.0, 'maço', 4.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 33, 'Alface Frizee', 'Hortifrúti', 'maço', 1.0, 'maço', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 34, 'Alho Limpo', 'Hortifrúti', 'kg', 1.0, 'kg', 10.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 35, 'Banana Nanica', 'Hortifrúti', 'kg', 1.0, 'kg', 3.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 36, 'Banana Terra', 'Hortifrúti', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 37, 'Batata doce', 'Hortifrúti', 'kg', 1.0, 'kg', 4.99, 1.0),
((select id from empresas where slug = 'figueiredo'), 38, 'Batata Inglesa Diversas 25kg', 'Hortifrúti', 'kg', 1.0, 'kg', 4.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 39, 'Berinjela', 'Hortifrúti', 'kg', 1.0, 'kg', 3.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 40, 'Brócolis Japonês', 'Hortifrúti', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 41, 'Cebola', 'Hortifrúti', 'kg', 1.0, 'kg', 10.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 42, 'Cebola roxa', 'Hortifrúti', 'kg', 1.0, 'kg', 9.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 43, 'Cenoura', 'Hortifrúti', 'kg', 1.0, 'kg', 3.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 44, 'Coentro', 'Hortifrúti', 'maço', 1.0, 'maço', 2.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 45, 'Couve', 'Hortifrúti', 'maço', 1.0, 'maço', 3.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 46, 'Limão Siciliano', 'Hortifrúti', 'kg', 1.0, 'kg', 14.99, 1.0),
((select id from empresas where slug = 'figueiredo'), 47, 'Limão taiti', 'Hortifrúti', 'kg', 1.0, 'kg', 7.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 48, 'Mamão papaia', 'Hortifrúti', 'kg', 1.0, 'kg', 12.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 49, 'Mandioca', 'Hortifrúti', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 50, 'Manjericão', 'Hortifrúti', 'maço', 1.0, 'maço', 3.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 51, 'Manjericão (2)', 'Hortifrúti', 'maço', 1.0, 'maço', 4.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 52, 'Maracujá', 'Hortifrúti', 'kg', 1.0, 'kg', 60.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 53, 'Melancia', 'Hortifrúti', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 54, 'Morango minas', 'Hortifrúti', 'kg', 1.0, 'kg', 38.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 55, 'Pimenta dedo de moça', 'Hortifrúti', 'kg', 1.0, 'kg', 27.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 56, 'Pimentão amarelo', 'Hortifrúti', 'kg', 1.0, 'kg', 24.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 57, 'Pimentão verde', 'Hortifrúti', 'kg', 1.0, 'kg', 9.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 58, 'Pimentão vermelho', 'Hortifrúti', 'kg', 1.0, 'kg', 24.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 59, 'Rúcula hidro', 'Hortifrúti', 'maço', 1.0, 'maço', 4.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 60, 'Salsa', 'Hortifrúti', 'maço', 1.0, 'maço', 3.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 61, 'Salsão', 'Hortifrúti', 'maço', 1.0, 'maço', 7.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 62, 'Tomate Cereja', 'Hortifrúti', 'kg', 1.0, 'kg', 4.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 63, 'Tomate italiano', 'Hortifrúti', 'kg', 1.0, 'kg', 6.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 64, 'Tomate Molho', 'Hortifrúti', 'kg', 1.0, 'kg', 4.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 65, 'Tomate Salada', 'Hortifrúti', 'kg', 1.0, 'kg', 8.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 66, 'Tomilho', 'Hortifrúti', 'maço', 1.0, 'maço', 4.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 67, 'BACON FATIADO 1 KG', 'Queijos e frios', 'kg', 1.0, 'kg', 35.81, 1.0),
((select id from empresas where slug = 'figueiredo'), 68, 'GORGONZOLA', 'Queijos e frios', 'kg', 1.0, 'kg', 57.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 69, 'PRESUNTO COZIDO KG', 'Queijos e frios', 'kg', 1.0, 'kg', 17.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 70, 'QUEIJO CHEDAR FAT 2,27 KG', 'Queijos e frios', 'kg', 1.0, 'kg', 42.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 71, 'QUEIJO COALHO KG', 'Queijos e frios', 'kg', 1.0, 'kg', 46.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 72, 'QUEIJO MUSSARELA KG', 'Queijos e frios', 'kg', 1.0, 'kg', 35.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 73, 'QUEIJO PARMESAO +- 6G', 'Queijos e frios', 'kg', 1.0, 'kg', 56.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 74, 'açucar cristal 5KG', 'Mercearia', 'kg', 1.0, 'kg', 2.6, 1.0),
((select id from empresas where slug = 'figueiredo'), 75, 'açucar mascavo 1KG', 'Mercearia', 'kg', 1.0, 'kg', 11.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 76, 'açucar refinado 1 KG', 'Mercearia', 'kg', 1.0, 'kg', 4.69, 1.0),
((select id from empresas where slug = 'figueiredo'), 77, 'Água Filtrada', 'Mercearia', 'L', 1.0, 'L', 0.007, 1.0),
((select id from empresas where slug = 'figueiredo'), 78, 'alcaparras 2KG', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 79, 'amora congelada 1kg', 'Mercearia', 'kg', 1.0, 'kg', 23.54, 1.0),
((select id from empresas where slug = 'figueiredo'), 80, 'arroz arborio 1KG', 'Mercearia', 'kg', 1.0, 'kg', 18.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 81, 'arroz PCT 5KG', 'Mercearia', 'pct 5 kg', 5.0, 'kg', 21.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 82, 'azeite composto 5L', 'Mercearia', 'L', 1.0, 'L', 12.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 83, 'azeite de dende 900ML', 'Mercearia', 'L', 1.0, 'L', 25.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 84, 'azeite extra virgem', 'Mercearia', 'L', 1.0, 'L', 13.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 85, 'Azeitona preta com caroco KG', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 86, 'azeitona verde sem caroço ou fatiada BD 1,8KG', 'Mercearia', 'kg', 1.0, 'kg', 35.66, 1.0),
((select id from empresas where slug = 'figueiredo'), 87, 'Batata Frita congelada Mccain', 'Mercearia', 'kg', 1.0, 'kg', 15.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 88, 'BATATA SUPERCRISP 7MM 2,5KG', 'Mercearia', 'kg', 1.0, 'kg', 15.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 89, 'Baunilha', 'Mercearia', 'un', 1.0, 'un', 1.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 90, 'Cacau em pó', 'Mercearia', 'kg', 1.0, 'kg', 110.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 91, 'caldo de carne 1KG', 'Mercearia', 'kg', 1.0, 'kg', 18.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 92, 'caldo de frango 1KG', 'Mercearia', 'kg', 1.0, 'kg', 18.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 93, 'caldo de frutos do mar 1KG', 'Mercearia', 'kg', 1.0, 'kg', 18.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 94, 'caldo de legumes KG', 'Mercearia', 'kg', 1.0, 'kg', 33.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 95, 'Catchup cepêra galao 3,5kg', 'Mercearia', 'kg', 1.0, 'kg', 26.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 96, 'catupiry original 1,5KG', 'Mercearia', 'kg', 1.0, 'kg', 40.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 97, 'cebola em pó KG', 'Mercearia', 'kg', 1.0, 'kg', 45.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 98, 'Chocolate ao leite', 'Mercearia', 'L', 1.0, 'L', 95.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 99, 'chocolate branco', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 100, 'Chocolate meio amargo', 'Mercearia', 'kg', 1.0, 'kg', 97.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 101, 'COGUMELO FATIADO BD 2KG', 'Mercearia', 'kg', 1.0, 'kg', 53.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 102, 'colorau 1KG', 'Mercearia', 'kg', 1.0, 'kg', 12.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 103, 'Conhaque', 'Mercearia', 'L', 1.0, 'L', 19.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 104, 'COPA 100G', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 105, 'CREAM CHESSE 150G', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 106, 'creme de leite 17%OU 20%', 'Mercearia', 'L', 1.0, 'L', 13.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 107, 'CREME DE LEITE 25%', 'Mercearia', 'L', 1.0, 'L', 13.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 108, 'farinha de mandioca amarela 01KG', 'Mercearia', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 109, 'farinha de rosca KG', 'Mercearia', 'kg', 1.0, 'kg', 8.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 110, 'farinha de trigo KG', 'Mercearia', 'kg', 1.0, 'kg', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 111, 'farinha panko KG', 'Mercearia', 'kg', 1.0, 'kg', 15.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 112, 'feijão carioca', 'Mercearia', 'kg', 1.0, 'kg', 9.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 113, 'feijão fradinho da mamae 1KG', 'Mercearia', 'kg', 1.0, 'kg', 9.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 114, 'FETTUCINE 500G', 'Mercearia', 'kg', 1.0, 'kg', 13.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 115, 'fungui KG', 'Mercearia', 'kg', 1.0, 'kg', 184.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 116, 'geleia de pimenta KG', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 117, 'gergelim sem casca 1KG', 'Mercearia', 'kg', 1.0, 'kg', 24.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 118, 'Ketchup hemmer / Heinz', 'Mercearia', 'kg', 1.0, 'kg', 7.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 119, 'leite 1L', 'Mercearia', 'L', 1.0, 'L', 5.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 120, 'Leite condensado', 'Mercearia', 'L', 1.0, 'L', 23.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 121, 'Leite de coco 1l', 'Mercearia', 'L', 1.0, 'L', 14.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 122, 'Leite ninho', 'Mercearia', 'L', 1.0, 'L', 51.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 123, 'Licor de cassis', 'Mercearia', 'L', 1.0, 'L', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 124, 'Lombo canadense', 'Mercearia', 'kg', 1.0, 'kg', 28.95, 1.0),
((select id from empresas where slug = 'figueiredo'), 125, 'maionese Hellman''s 2,8kg', 'Mercearia', 'kg', 1.0, 'kg', 16.8, 1.0),
((select id from empresas where slug = 'figueiredo'), 126, 'manteiga de garrafa 1 L', 'Mercearia', 'L', 1.0, 'L', 20.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 127, 'manteiga sem sal 5kg', 'Mercearia', 'kg', 1.0, 'kg', 32.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 128, 'margarina 15 kg 80%', 'Mercearia', 'kg', 1.0, 'kg', 9.7, 1.0),
((select id from empresas where slug = 'figueiredo'), 129, 'massa de pastel petisco 1000g', 'Mercearia', 'kg', 1.0, 'kg', 13.1, 1.0),
((select id from empresas where slug = 'figueiredo'), 130, 'mel KG', 'Mercearia', 'kg', 1.0, 'kg', 39.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 131, 'melaço de cana KG', 'Mercearia', 'kg', 1.0, 'kg', 24.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 132, 'molho caesar', 'Mercearia', 'kg', 1.0, 'kg', 34.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 133, 'MOLHO DEMMI GLACE 1KG', 'Mercearia', 'kg', 1.0, 'kg', 74.54, 1.0),
((select id from empresas where slug = 'figueiredo'), 134, 'molho ingles 1L', 'Mercearia', 'L', 1.0, 'L', 9.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 135, 'Molho madeira em pó', 'Mercearia', 'kg', 1.0, 'kg', 127.6, 1.0),
((select id from empresas where slug = 'figueiredo'), 136, 'mostarde cepera 3,3kg', 'Mercearia', 'kg', 1.0, 'kg', 12.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 137, 'nata fresca 300G', 'Mercearia', 'kg', 1.0, 'kg', 47.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 138, 'Nutella 3kg', 'Mercearia', 'emb 3 kg', 3.0, 'kg', 172.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 139, 'oleo de algodao 14,5 KG', 'Mercearia', 'L', 1.0, 'L', 160.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 140, 'óleo de soja 900ML', 'Mercearia', 'L', 1.0, 'L', 7.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 141, 'Ovo bandeja 30', 'Mercearia', 'un', 1.0, 'un', 0.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 142, 'OVO EM PO 1KG', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 143, 'palmito 500G', 'Mercearia', 'kg', 1.0, 'kg', 32.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 144, 'Petit gataeu', 'Mercearia', 'un', 1.0, 'un', 5.56, 1.0),
((select id from empresas where slug = 'figueiredo'), 145, 'pimenta siracha', 'Mercearia', 'kg', 1.0, 'kg', 11.15, 1.0),
((select id from empresas where slug = 'figueiredo'), 146, 'PRESUNTO SERRANO (PHARMA) 100G', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 147, 'SALAME ITALIANO 100G', 'Mercearia', 'kg', 1.0, 'kg', 0.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 148, 'Sorvete', 'Mercearia', 'kg', 1.0, 'kg', 37.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 149, 'tomate pelatti lata 2,5 KG', 'Mercearia', 'emb 2.5 kg', 2.5, 'kg', 25.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 150, 'VINAGRE BALSSAMICO 500ML', 'Mercearia', 'L', 1.0, 'L', 13.32, 1.0),
((select id from empresas where slug = 'figueiredo'), 151, 'vinagre de alcool 750ML', 'Mercearia', 'L', 1.0, 'L', 2.5, 1.0),
((select id from empresas where slug = 'figueiredo'), 152, 'vinho branco seco (pra cozinhar) 4600ML', 'Mercearia', 'emb 4.6 L', 4.6, 'L', 73.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 153, 'vinho tinto seco (pra cozinhar)4600ML', 'Mercearia', 'emb 4.6 L', 4.6, 'L', 67.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 154, 'alho em pó 200G', 'Temperos', 'kg', 1.0, 'kg', 5.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 155, 'alho frito KG', 'Temperos', 'kg', 1.0, 'kg', 28.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 156, 'Cebola em pó', 'Temperos', 'kg', 1.0, 'kg', 20.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 157, 'Folha de louro kg', 'Temperos', 'kg', 1.0, 'kg', 32.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 158, 'gengibre em pó KG', 'Temperos', 'kg', 1.0, 'kg', 62.6, 1.0),
((select id from empresas where slug = 'figueiredo'), 159, 'nos moscada em grao 250G', 'Temperos', 'kg', 1.0, 'kg', 31.18, 1.0),
((select id from empresas where slug = 'figueiredo'), 160, 'nos moscada em po KG', 'Temperos', 'kg', 1.0, 'kg', 98.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 161, 'Orégano', 'Temperos', 'kg', 1.0, 'kg', 19.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 162, 'páprica defumada 250G', 'Temperos', 'kg', 1.0, 'kg', 5.9, 1.0),
((select id from empresas where slug = 'figueiredo'), 163, 'pimenta do reino em grãos 500G', 'Temperos', 'emb 0.5 kg', 0.5, 'kg', 23.34, 1.0),
((select id from empresas where slug = 'figueiredo'), 164, 'sal de cura (laboratorio exato)', 'Temperos', 'kg', 1.0, 'kg', 48.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 165, 'sal de parrilha KG', 'Temperos', 'kg', 1.0, 'kg', 7.2, 1.0),
((select id from empresas where slug = 'figueiredo'), 166, 'sal refinado 1KG', 'Temperos', 'kg', 1.0, 'kg', 3.76, 1.0),
((select id from empresas where slug = 'figueiredo'), 167, 'Pão baguete', 'Pães', 'un', 1.0, 'un', 2.0, 1.0),
((select id from empresas where slug = 'figueiredo'), 168, 'pão brioche bread maker CX 36 UNI', 'Pães', 'cx 36 un', 36.0, 'un', 68.12, 1.0),
((select id from empresas where slug = 'figueiredo'), 169, 'PAO DE FORMA 480G', 'Pães', 'pct', 1.0, 'pct', 8.99, 1.0),
((select id from empresas where slug = 'figueiredo'), 170, 'Pão frânces', 'Pães', 'kg', 1.0, 'kg', 7.0, 1.0);

-- receitas (bases, preparos, pratos)
insert into receitas (empresa_id, slug, nome, tipo, categoria, rendimento, unidade_rendimento, modo_preparo) values
((select id from empresas where slug = 'figueiredo'), 'arroz-branco', 'Arroz branco', 'base'::tipo_receita, null, 13.0, 'kg', 'Refogar o alho, cebola e sal no óleo de soja. Não deixe dourar o alho, antes disso adicione o arroz, mexa, adicione a água quente 2x a proporção do arroz. Tampe e aguarde ferver, abaixe o fogo e deixe cozinhar até chegar no ponto.'),
((select id from empresas where slug = 'figueiredo'), 'banana-a-milanesa', 'Banana à milanesa', 'base'::tipo_receita, null, 1.0, 'porção', null),
((select id from empresas where slug = 'figueiredo'), 'batata-frita-com-ketchup-guarnicao', 'Batata frita com ketchup (guarnição)', 'base'::tipo_receita, null, 4.0, 'porção', 'Manter as fritas congeladas, entrar com elas na fritadeira com o óleo a 180 graus. Fritar por 2,30min ou quando estiverem levemente douradas.'),
((select id from empresas where slug = 'figueiredo'), 'batata-frita-temperada', 'Batata frita temperada', 'base'::tipo_receita, null, 0.3, 'kg', 'Fritar a porção de 250g de batata a 180 graus por 2min e 30segundos, temperar com o tempero da batata sem excesso, servir com molho de queijo em cima, costela desfiada, e 5 tomatinhos cereja.'),
((select id from empresas where slug = 'figueiredo'), 'batata-palha', 'Batata palha', 'base'::tipo_receita, null, 11.0, 'kg', 'Descascar as batatas, ralas com ralador fino. Fritar em panela com oleo quente a 180 graus. Escorrer bem'),
((select id from empresas where slug = 'figueiredo'), 'brigadeiro-meio-amargo', 'Brigadeiro meio amargo', 'base'::tipo_receita, null, 2.28, 'kg', 'Aquecer o leite condensado, entrar com o creme de leite e chocolate ralado. Mexer sem parar até ficar na consistência de puxa.'),
((select id from empresas where slug = 'figueiredo'), 'brownie-bolinho', 'Brownie (bolinho)', 'base'::tipo_receita, null, 14.0, 'un', 'Grelhar o pão para aquecer e selar, grelhar a carne colocando sal dos dois lados. Quando virar adicionar o queijo e o bacon já frito. Maionese adicionar na coroa do pão. Servir o burger na tábua com a porção de fritas ao lado.'),
((select id from empresas where slug = 'figueiredo'), 'chapinha-figueiredo-unidade', 'Chapinha Figueiredo (unidade)', 'base'::tipo_receita, null, 4.0, 'un', null),
((select id from empresas where slug = 'figueiredo'), 'chimichurri', 'Chimichurri', 'base'::tipo_receita, null, 1.0, 'kg', 'misturar todos ingredientes e bater até ficar homogêneo'),
((select id from empresas where slug = 'figueiredo'), 'chips-de-batata-doce', 'Chips de batata doce', 'base'::tipo_receita, null, 1.5, 'kg', '1. Fatie as batatas, lava-se duas vezes e deixe dentro da água.
2. Escorrer bem a água antes de colocar no óleo que deve estar a 180 graus.
3. Depois que estiver frita, adicione o sal na batata.'),
((select id from empresas where slug = 'figueiredo'), 'consume-de-legumes', 'Consumê de legumes', 'base'::tipo_receita, null, 1.6, 'L', 'Em uma panela colocar tudo paracozinhar por 50min. Coar e reservar o caldo.'),
((select id from empresas where slug = 'figueiredo'), 'farofa-de-ovos', 'Farofa de ovos', 'base'::tipo_receita, null, 1.0, 'porção', '1. Aqueça a frigideira em fogo médio para não queimar a margarina, adicione a cebola e refogue, adicione os ovos e o sal, deixe em pedaços médios, acrescente a farinha, cheiro verde e misture.
2. Sirva imediatamente'),
((select id from empresas where slug = 'figueiredo'), 'feijao-tropeiro', 'Feijão tropeiro', 'base'::tipo_receita, null, 4.1, 'kg', '1. Em uma panela frite o bacon com a manteiga, quando estiver quase frito, adicione a calabresa, quando estiver frita coloque o alho e deixe dourar, depois a cebola, em seguida a couve e o feijão, refogue um pouco e coloque a farinha, acerte o sal.

Obs: Cozinhar o feijão com sal fino na panela sem pressão.'),
((select id from empresas where slug = 'figueiredo'), 'legumes-cozidos', 'Legumes cozidos', 'base'::tipo_receita, null, 0.5, 'kg', '1. Coloque a agua pra ferver, adicione os ingredientes e deixe ferver bem.
2. Escorra os legumes e finalize com o azeite um fio de azeite.
3. Embala em porções de 200g, coloque vácuo e congele.'),
((select id from empresas where slug = 'figueiredo'), 'mix-de-queijos-especial', 'Mix de queijos especial', 'base'::tipo_receita, null, 1.0, 'kg', 'Misturar os dois queijos e porcionar em um saquinho.'),
((select id from empresas where slug = 'figueiredo'), 'molho-branco', 'Molho branco', 'base'::tipo_receita, null, 14.0, 'kg', '1. Coloque o leite para ferver com a folha de louro, depois que ferver retire a folha de louro.
2. Em uma panela coloque a margarina, doure o alho em seguida, cebola e farinha de trigo, deixe cozinhar, acrescente o leite aos poucos, até finalizar o leite.
3. Adicione o leite, noz moscada e sal.'),
((select id from empresas where slug = 'figueiredo'), 'molho-de-tomate', 'Molho de tomate', 'base'::tipo_receita, null, 35.0, 'kg', '1. Lave os tomates, retire o "olho" coloque para cozinhar com as rodelas de cebola, salsão e água.
2. Depois de cozido bata no liquidificador e separe.
3. Em uma panela aqueça o azeite, doure o alho, adicione a cebola batida e coloque o tomate batido dentro.
4. Acrescente o tomate pelati batido no liquidificador e deixe ferver com fogo baixo, quando levantar fervura tire a espuma por várias vezes. Entre com o restante dos ingredientes, deixe cozinhar até o ponto de molho'),
((select id from empresas where slug = 'figueiredo'), 'molho-madeira', 'Molho madeira', 'base'::tipo_receita, null, 1.0, 'L', 'Caramelizar o açucar até derreter, adicionar todos os ingredientes. Misturar em fogo baixo até a goiabada derreter por completo (colocar em cubos). Deixar em fogo baixo por 15min.'),
((select id from empresas where slug = 'figueiredo'), 'molho-pesto', 'Molho pesto', 'base'::tipo_receita, null, 0.6, 'kg', 'Polvilhar o rub bovino (6 porçao de sal para 1 de pimenta do reino moída). Colocar as costelas no pit smoker e assar por 3h até ficarem vermelhas. Embrulhar no celofane, colocar em GN de inox e cobrir com aluminio. Manter o pit a 150 graus até a costela atingir 95 graus internos.'),
((select id from empresas where slug = 'figueiredo'), 'molho-tartaro', 'Molho tártaro', 'base'::tipo_receita, null, 4.0, 'kg', '1. No liquidificador coloque os ovos, limão, mostarda, sal, alho e pimenta.
2. Bata rapidamente, adicione 1 garrafa de óleo e aos poucos colocar o restante do óleo até chegar no ponto de maionese bem firme.
3. Coloque o restante dos ineredientes e bata até o ponto de molho.
4. Acrescente o restante do óleo para engrossar.'),
((select id from empresas where slug = 'figueiredo'), 'pao-de-alho-preparo', 'Pão de alho (preparo)', 'base'::tipo_receita, null, 1.0, 'porção', 'Misturar todos ingredientes até ficar homogêneo, passar no pão e embalar. Congelar. No momento de servir grelhar na churrasqueira ou usar salamandra.'),
((select id from empresas where slug = 'figueiredo'), 'pure-de-batata', 'Purê de batata', 'base'::tipo_receita, null, 0.6, 'kg', '1. Com a batata ainde quente e sem casca, espremer até virar purê;
2. Acrescentar todos ingredientes e deixar cozinhar em fogo baixo, sempre mexendo para não queimar.'),
((select id from empresas where slug = 'figueiredo'), 'rub-suino', 'Rub suíno', 'base'::tipo_receita, null, 13.0, 'kg', '4 partes de sal
1 parte de pimenta do reino
2 partes de paprica defumada ou doce
1 parte de alho em po
1 parte de cebola em pó
4 partes de açucar mascavo
MIsturar todos ingredientes'),
((select id from empresas where slug = 'figueiredo'), 'salada-do-executivo', 'Salada do executivo', 'base'::tipo_receita, null, 1.0, 'porção', 'Refogar o alho, cebola e sal no óleo de soja. Não deixe dourar o alho, antes disso adicione o arroz, mexa, adicione a água quente 2x a proporção do arroz. Tampe e aguarde ferver, abaixe o fogo e deixe cozinhar até chegar no ponto.'),
((select id from empresas where slug = 'figueiredo'), 'arroz-a-piamontese', 'Arroz à piamontese', 'preparo'::tipo_receita, null, 1.2, 'kg', '1. Em uma frigideira coloque margarina, cebola, champignon, acrescente o vinho e deixe evaporar o álcool.
2. Acrescente o molho branco, arroz e misture bem até esquentar. Finalize com a mussarela.'),
((select id from empresas where slug = 'figueiredo'), 'arroz-arboreo-pre-cozido', 'Arroz arbóreo pré-cozido', 'preparo'::tipo_receita, null, 1.44, 'kg', '1. Em uma panela, aqueça o azeite, refogue bem o alho e a cebola, em seguida adicione o arroz, vinho e deixe evaporar o alcool. Adicione e consomé e o sal. Quando ferver abaixe o fogo até secar. Fique atento ao ponto ao dente, caso necessário adicione mais consumé aos poucos.
2 Após cozido, coloque numa vasihla grande para estriar.
3. Faça porções de 300 gramas'),
((select id from empresas where slug = 'figueiredo'), 'arroz-biro-biro-inteira', 'Arroz biro biro (inteira)', 'preparo'::tipo_receita, null, 1.0, 'porção', '1. Em uma frigideira coloque a bacon para fritar, depois de frito retire um pouco da gordura.
2. Em outra frigideira frite os ovas e quebre em pedaços médios.
3. Na frigideira do bacon acrescente o arroz, batata palha, farinha, cheiro verde e os ovos em pedaços.
4. Misture bem e sirva na panelinha'),
((select id from empresas where slug = 'figueiredo'), 'arroz-biro-biro-meia', 'Arroz biro biro (meia)', 'preparo'::tipo_receita, null, 1.0, 'porção', '1. Em uma frigideira coloque a bacon para fritar, depois de frito retire um pouco da gordura.
2. Em outra frigideira frite os ovas e quebre em pedaços médios.
3. Na frigideira do bacon acrescente o arroz, batata palha, farinha, cheiro verde e os ovos em pedaços.
4. Misture bem e sirva na panelinha'),
((select id from empresas where slug = 'figueiredo'), 'arroz-com-brocolis', 'Arroz com brócolis', 'preparo'::tipo_receita, null, 0.5, 'kg', '1. Em uma frigideira coloque a bacon para fritar, depois de frito retire um pouco da gordura.
2. Em outra frigideira frite os ovas e quebre em pedaços médios.
3. Na frigideira do bacon acrescente o arroz, batata palha, farinha, cheiro verde e os ovos em pedaços.
4. Misture bem e sirva na panelinha'),
((select id from empresas where slug = 'figueiredo'), 'recheio-de-pastel-de-carne', 'Recheio de pastel de carne', 'preparo'::tipo_receita, null, 3.5, 'kg', 'Misturar os dois queijos e porcionar em um saquinho.'),
((select id from empresas where slug = 'figueiredo'), 'vinagrete', 'Vinagrete', 'preparo'::tipo_receita, null, 1.5, 'kg', '6 tomates maduros;
1 cebola roxa;
200ml de azeite;
1 limão espremido;
80ml de vinagre de maçã;
1 pimentão amarelo;
½ maço de cheiro verde picado;
2 colheres de ketchup;
1 colher de chimichurri.
Sal 1/2 colher
Picar bem os ingredientes, em brunoise, misturar todos ingredientes.'),
((select id from empresas where slug = 'figueiredo'), 'pastel-de-camarao', 'Pastel de Camarão', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite o pastel e coloque em uma travessa em pé
Acompanha Ketchup
8 unidades por porção'),
((select id from empresas where slug = 'figueiredo'), 'pastelzinho-de-carne', 'Pastelzinho de carne', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite o pastel e coloque em uma travessa em pé
Acompanha Ketchup
8 unidades por porção'),
((select id from empresas where slug = 'figueiredo'), 'pastelzinho-de-queijo', 'Pastelzinho de queijo', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite o pastel e coloque em uma travessa em pé
Acompanha Ketchup
8 unidades por porção'),
((select id from empresas where slug = 'figueiredo'), 'coxinha-figueiredo', 'Coxinha Figueiredo', 'prato'::tipo_receita, 'Petiscos', 50.0, 'porção', 'Temperar a carne com rub bovino e 4 folhas de salvia, refogar a cebola e alho com óleo, fritar a carne em pedaços até dourar, deglacear o fundo com vinho tinto, deixar evaporar o alcool, adicionar 400g tomate pelatti, água até metade da altura da carne e colocar na pressão por 60 minutos ou até desfiar. Resfriar e misturar com bechamel, catupiry e cheiro verde. Resfriar a massa em uma assadeira. Quando estiver fria fazer coxinhas de 30g, empanar passando na farinha de trigo, leite, rosca, leite e panko. Temperar as farinhas com sal e paprica doce. Pré fritar os bolinhos a 150 graus por 2min. Congelar. e porcionar após congelado'),
((select id from empresas where slug = 'figueiredo'), 'batata-especial', 'Batata Especial', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite as batatas a 180 graus até dourar, escorra bem, coloque sal e pimenta do reino, em seguida emprate no prato normal e finalize com os queijos e o bacon. Gratine.'),
((select id from empresas where slug = 'figueiredo'), 'batata-frita', 'Batata Frita', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', null),
((select id from empresas where slug = 'figueiredo'), 'batata-figueiredo', 'Batata Figueiredo', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite as batatas a 180 graus até dourar, escorra bem, aqueça na panela um pacote de costela desfiada, adicione um pouco de água. Após secar coloque sobre a batata já frita, adicione catupiry e gratine.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-alho-e-oleo', 'Camarão alho e oleo', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Modo de PREPARO: 
Em uma frigideira coloque o azeite e refogue o camarão, acrescente o alho, flambe com o conhaque, coloque sal e salsinha

Como servir: 
1- Coloque em uma travessa já decorada com o alface; 
2- Finalize com a salsinha e limão'),
((select id from empresas where slug = 'figueiredo'), 'camarao-a-milanesa', 'Camarão a milanesa', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Modo de PREPARO: 
Em uma frigideira coloque o azeite e refogue o camarão, acrescente o alho, flambe com o conhaque, coloque sal e salsinha

Como servir: 
1- Coloque em uma travessa já decorada com o alface; 
2- Finalize com a salsinha e limão'),
((select id from empresas where slug = 'figueiredo'), 'chapinha-figueiredo', 'CHAPINHA FIGUEIREDO', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', null),
((select id from empresas where slug = 'figueiredo'), 'isca-de-peixe', 'Isca de peixe', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'MODO DE PREPARO
1. Tempere a tilápia com sal, alho e limão.
2. Passe na farinha de trigo, depois na mistura de ovo com leite e empane na farinha panko.

COMO SERVIR:
1. Frite até ficar dourada.
2. Coloque em uma travessa com papel toalha.
3. Acompanha limão e molho tártaro.'),
((select id from empresas where slug = 'figueiredo'), 'frango-a-passarinho', 'Frango a passarinho', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite o frango até dourar:
Em uma travessa coloque as folhas de alface, depois coloque o frango e decore com o tomate,
Joque o alho frita em cima do frango;
Disponha o limão ao lado.'),
((select id from empresas where slug = 'figueiredo'), 'combinado', 'Combinado', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Fritar a panceta até dourar, fritar as iscas de frango e carne de sol, assar e gratinar o pão de alho. Servir na tábua'),
((select id from empresas where slug = 'figueiredo'), 'panceta-defumada', 'Panceta defumada', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Furar a pele da barriga, sal na pele, temperar a carne com o sal e sal de cura (5 porções de sal para 1 de sal de cura) de porco, enrolar a barriga sem sobrepor a pele, colocar no refrigerador por 12h. Assar sem embrulhar a 190 graus (sem vapor) até a temperatura interna de 85 graus.. Resfriar e porcionar em rodelas de 1 dedo de espessura. Amarrar as rodelas. Ao servir, fritar o torresmo refrigerado em óleo quente a 180 graus. Servir com limão siciliano e barbecue.'),
((select id from empresas where slug = 'figueiredo'), 'carne-de-sol-angus', 'Carne de sol Angus', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Frite as batatas a 180 graus até dourar, escorra bem, aqueça na panela um pacote de costela desfiada, adicione um pouco de água. Após secar coloque sobre a batata já frita, adicione catupiry e gratine.'),
((select id from empresas where slug = 'figueiredo'), 'file-ao-molho-de-queijo', 'Filé ao molho de queijo', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', '1. Tempere o file com sal, coloque para grelhar na chapa.
2. Em uma frigideira coloque a margarina, cebola e o gorgonzola, acrescente vinho e deixe evaporar o álcool.
3. Adicione o molho branco, deixe ferver.

COMO SERVIR:
1. Em uma travessa coloque o filé já grelhado e cubra com o molho de gorgonzola
2. Finalize com salsinha
3. Acompanha pãozinho'),
((select id from empresas where slug = 'figueiredo'), 'file-ao-molho-madeira', 'Filé ao molho madeira', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', '1. Tempere o filet com sal, coloque para grelhar na chapa.
2. Em uma frigideira coloque a margarina e o alho e deixe dourar, acrescente a cebola deixe evaporar a álcool, entre com o molho madeira e deixe ferver, depois acrescen sirva.

COMO SERVIR:
1. Em uma travessa coloque o filé com o molho madeira.
2. Finalize com salsinha.
3. Acompanha pãozinho'),
((select id from empresas where slug = 'figueiredo'), 'terra-e-mar', 'TERRA E MAR', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', null),
((select id from empresas where slug = 'figueiredo'), 'pao-de-alho-artesanal', 'Pão de alho artesanal', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', null),
((select id from empresas where slug = 'figueiredo'), 'queijo-coalho', 'Queijo Coalho', 'prato'::tipo_receita, 'Petiscos', 1.0, 'porção', 'Temperar os aneis de lula com sal, limão e pimenta do reino, empanar na farinha de trigo, mistura de ovo e leite, e farinha panko. Fritar a 180 graus, servir com molho tártaro'),
((select id from empresas where slug = 'figueiredo'), 'brusqueta-de-camarao', 'Brusqueta de camarão', 'prato'::tipo_receita, 'Entradas', 1.0, 'porção', 'Bater todos os ingredientes no liquidificador até que fique homogêneo. Manter em geladeira por 3 dias.'),
((select id from empresas where slug = 'figueiredo'), 'ceviche-de-tilapia', 'Ceviche de tilápia', 'prato'::tipo_receita, 'Entradas', 1.0, 'porção', 'Temperar o peixe, camarão e polvo em um bowl com limão, sal, pimenta do reino, deixar mariando por 10min. Picar a cebola roxa em finas fatias, juntamente com a pimenta dedo de moça. Servir no prato com os camarões por cima, decorar com salsa e colocar o chips de mandioca ao lado.'),
((select id from empresas where slug = 'figueiredo'), 'salada-caesar', 'Salada Caesar', 'prato'::tipo_receita, 'Saladas', 1.0, 'porção', 'Modo de Preparo: Em um bowl coloque o alface, frango, parmesão e o molho, mistures bem

Como Servir: Use o prato de salada (chapéu chinês), coloque as folhas de forma que o frango fique por cima. Finalize com o restante do parmesão, croutons e salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'salada-ligth', 'Salada Ligth', 'prato'::tipo_receita, 'Saladas', 1.0, 'porção', '1. Em um bowl coloque o alface limpo e seco, acrescente a cenoura, palmito, tomate, azeitona, lombo e o molho, misture bem.
COMO SERVIR:
Use o prato de salada (chapéu chinês), coloque as folhas por baixo, os ingredientes por cima.
2. Decore com tomate e salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'salada-mar', 'Salada mar', 'prato'::tipo_receita, 'Saladas', 1.0, 'porção', '1. Refogar a cebola e alho com azeite, entrar com os camarões até mudarem de cor e começarem a dourar. Reservar.
2. Montar o alface no prato chapeu, molho caesar sobre as folhas, ralar o parmesão;
3 Dispor os camarões por cima;'),
((select id from empresas where slug = 'figueiredo'), 'camarao-figueiredo-meia', 'Camarão Figueiredo meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha e salsinha'),
((select id from empresas where slug = 'figueiredo'), 'camarao-figueiredo-inteira', 'Camarão Figueiredo Inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha e salsinha'),
((select id from empresas where slug = 'figueiredo'), 'camarao-delicia-meia', 'Camarão Delícia meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira refogue a cebola e os camarões, coloque o molho bránco, misture bem até ficar bem cremoso.
3. Adicione a banana por cima e coloque o queijo.
4. Grarine e finalize com salsa'),
((select id from empresas where slug = 'figueiredo'), 'camarao-delicia-inteira', 'Camarão Delícia inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira refogue a cebola e os camarões, coloque o molho bránco, misture bem até ficar bem cremoso.
3. Adicione a banana por cima e coloque o queijo.
4. Grarine e finalize com salsa
5. Acompanha arroz.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-poro-meia', 'CAMARÃO PORO MEIA', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira refogue com margarina a cebola e os camarões, coloque o molho bránco, misture bem até ficar bem cremoso, adicione a muçarela e deixe derreter.
3. Coloque na travessa e queijo por cima
4. Grarine e finalize com salsa.
5. Acompanha arroz.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-poro-inteira', 'CAMARÃO PORÓ INTEIRA', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira refogue com margarina a cebola e os camarões, coloque o molho bránco, misture bem até ficar bem cremoso, adicione a muçarela e deixe derreter.
3. Coloque na travessa e queijo por cima
4. Grarine e finalize com salsa.
5. Acompanha arroz.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-imperador-meia', 'Camarão Imperador meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto, mil ede e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha e salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-imperador-inteira', 'Camarão Imperador inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha, os camarões lado a lado formando um círculo no meio e salsinha'),
((select id from empresas where slug = 'figueiredo'), 'camarao-mediterraneo-meia', 'Camarão mediterrâneo meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha, e salsinha e manjericão'),
((select id from empresas where slug = 'figueiredo'), 'camarao-mediterraneo-inteira', 'Camarão mediterrâneo inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha, e salsinha e manjericão'),
((select id from empresas where slug = 'figueiredo'), 'moqueca-de-peixe-com-camarao-meia', 'Moqueca de peixe com camarão meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere o peixe com sal, alho, limão, coloque para cozinhar na água com sal e caldo de frutos do mar.
2 Em outra frigideira coloque o azeite de dendé e doure a alho, coloque os pimentões, cebola, refogue um pouco e acrescente o caldo onde foi cozido o peixe, acrescente o leite de coco, cheiro verde e roux (engrossante - farinha de trigo dissolvida em água) para engrossar.
3. Na panela onde sai à moqueca de peixe coloque as radelas de tomate por baixo, em cima dos tomates coloque os pimentões, adicione o peixe e finalize com o molho da moqueca.
4. Separe um pouco do molho para fazer o pirão.
5. Em outra panela cozinhe os camarões

Modo de servir:
Finalize colocando os camarões por cima
1. Acompanha pirão e arroz branco
2. Para o pirão coloca o caldo que está separado pra ferver e entra com a farinha de mandioca aos poucos até o ponto de pirão fino.'),
((select id from empresas where slug = 'figueiredo'), 'moqueca-de-peixe-com-camarao-inteira', 'Moqueca de peixe com camarão inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere o peixe com sal, alho, limão, coloque para cozinhar na água com sal e caldo de frutos do mar.
2 Em outra frigideira coloque o azeite de dendé e doure a alho, coloque os pimentões, cebola, refogue um pouco e acrescente o caldo onde foi cozido o peixe, acrescente o leite de coco, cheiro verde e roux (engrossante - farinha de trigo dissolvida em água) para engrossar.
3. Na panela onde sai à moqueca de peixe coloque as radelas de tomate por baixo, em cima dos tomates coloque os pimentões, adicione o peixe e finalize com o molho da moqueca.
4. Separe um pouco do molho para fazer o pirão.
5. Em outra panela cozinhe os camarões

Modo de servir:
Finalize colocando os camarões por cima
1. Acompanha pirão e arroz branco
2. Para o pirão coloca o caldo que está separado pra ferver e entra com a farinha de mandioca aos poucos até o ponto de pirão fino.'),
((select id from empresas where slug = 'figueiredo'), 'santo-prazer-meia', 'Santo prazer meia', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida misture, reserve uns camarões para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os camarões que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'santo-prazer-inteira', 'Santo prazer Inteira', 'prato'::tipo_receita, 'Frutos do mar', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida misture, reserve uns camarões para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os camarões que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'moqueca-de-peixe-meia', 'Moqueca de peixe meia', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o peixe com sal, alho, limão, coloque para cozinhar na água com sal e caldo de frutos do mar.
2 Em outra frigideira coloque o azeite de dendé e doure a alho, coloque os pimentões, cebola, refogue um pouco e acrescente o caldo onde foi cozido o peixe, acrescente o leite de coco, cheiro verde e roux (engrossante - farinha de trigo dissolvida em água) para engrossar.
3. Na panela onde sai à moqueca de peixe coloque as radelas de tomate por baixo, em cima dos tomates coloque os pimentões, adicione o peixe e finalize com o molho da moqueca.
4. Separe um pouco do molho para fazer o pirão.

Modo de servir:
1. Acompanha pirão e arroz branco
2. Para o pirão coloca o caldo que está separado pra ferver e entra com a farinha de mandioca aos poucos até o ponto de pirão fino.'),
((select id from empresas where slug = 'figueiredo'), 'moqueca-de-peixe-inteira', 'Moqueca de peixe inteira', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o peixe com sal, alho, limão, coloque para cozinhar na água com sal e caldo de frutos do mar.
2 Em outra frigideira coloque o azeite de dendé e doure a alho, coloque os pimentões, cebola, refogue um pouco e acrescente o caldo onde foi cozido o peixe, acrescente o leite de coco, cheiro verde e roux (engrossante - farinha de trigo dissolvida em água) para engrossar.
3. Na panela onde sai à moqueca de peixe coloque as radelas de tomate por baixo, em cima dos tomates coloque os pimentões, adicione o peixe e finalize com o molho da moqueca.
4. Separe um pouco do molho para fazer o pirão.

Modo de servir:
1. Acompanha pirão e arroz branco
2. Para o pirão coloca o caldo que está separado pra ferver e entra com a farinha de mandioca aos poucos até o ponto de pirão fino.'),
((select id from empresas where slug = 'figueiredo'), 'peixe-a-delicia-meia', 'Peixe à delícia meia', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o peixe com sal, alho, e limão e coloque para grelhar, por cima do peixe coloque a banana já frita.
2. em uma frigideira misture o creme de leite com molho branco e sal, deixe ferver
3. Coloque o molho por cima do peixe e deixe gratinar.

Como servir:

1. Decore com salsinha;
2. Acompanha arroz branco e batata gratinada.'),
((select id from empresas where slug = 'figueiredo'), 'peixe-a-delicia-inteira', 'Peixe à delícia inteira', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o peixe com sal, alho, e limão e coloque para grelhar, por cima do peixe coloque a banana já frita.
2. em uma frigideira misture o creme de leite com molho branco e sal, deixe ferver
3. Coloque o molho por cima do peixe e deixe gratinar.

Como servir:

1. Decore com salsinha;
2. Acompanha arroz branco e batata gratinada.'),
((select id from empresas where slug = 'figueiredo'), 'tilapia-do-chef-meia', 'Tilápia do chef meia', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere a tilápia com sal, caldo de frutos do mar, alho e limão, passe no trigo na mistura de ovo com leite e por último na farinha panko, frite e reserve.

MODO DE SERVIR:
2. Na paellera de um lado a tilápia frita do outro o purê de batata.
3. Decore om pimenta biqainho e salsinha.
4. Acompanha arroz de brócolis a parte.'),
((select id from empresas where slug = 'figueiredo'), 'tilapia-do-chef-inteira', 'Tilápia do chef inteira', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere a tilápia com sal, caldo de frutos do mar, alho e limão, passe no trigo na mistura de ovo com leite e por último na farinha panko, frite e reserve.

MODO DE SERVIR:
2. Na paellera de um lado a tilápia frita do outro o purê de batata.
3. Decore om pimenta biqainho e salsinha.
4. Acompanha arroz de brócolis a parte.'),
((select id from empresas where slug = 'figueiredo'), 'salmao-meia', 'Salmão meia', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o salmão com sal, caldo de frutos do mar, grelhe na churrasqueira.

MODO DE SERVIR:
2. Na paellera de um lado o salmão do outro o purê de batata.
3. Decore com salsinha e coloque a alcaparras com azeite sobre o salmão
4. Acompanha arroz de brócolis a parte.'),
((select id from empresas where slug = 'figueiredo'), 'salmao-inteira', 'Salmão inteira', 'prato'::tipo_receita, 'Peixes', 1.0, 'porção', '1. Tempere o salmão com sal, caldo de frutos do mar, grelhe na churrasqueira.

MODO DE SERVIR:
2. Na paellera de um lado o salmão do outro o purê de batata.
3. Decore com salsinha e coloque a alcaparras com azeite sobre o salmão
4. Acompanha arroz de brócolis a parte.'),
((select id from empresas where slug = 'figueiredo'), 'biro-biro-meia', 'Biro Biro meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', 'Grelhe o filé em manta. Na travessa de servir coloque o arroz por baixo, e o filé por cima. Finalize com salsinha picada.'),
((select id from empresas where slug = 'figueiredo'), 'biro-biro-inteira', 'Biro Biro inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', 'Grelhe o filé em manta. Na travessa de servir coloque o arroz por baixo, e o filé por cima. Finalize com salsinha picada.'),
((select id from empresas where slug = 'figueiredo'), 'file-a-parmegiana-meia', 'Filé a parmegiana meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Corte o filé em fatias de 100g cada, bata o bife e tempere com sal.
2. Empane com farinha de trigo, mistura de ovo com leite, e na farinha de rosca.
3. Frite e coloque em uma paellera, adicione o molho de tomate, muçarela, orégano e gr dourar o queijo.

COMO SERVIR:
1 Depois que estiver gratinado coloque a batata ao lado.
2. Arroz branco a parte.'),
((select id from empresas where slug = 'figueiredo'), 'file-a-parmegiana-inteira', 'Filé a parmegiana inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Corte o filé em fatias de 100g cada, bata o bife e tempere com sal.
2. Empane com farinha de trigo, mistura de ovo com leite, e na farinha de rosca.
3. Frite e coloque em uma paellera, adicione o molho de tomate, muçarela, orégano e gr dourar o queijo.

COMO SERVIR:
1 Depois que estiver gratinado coloque a batata ao lado.
2. Arroz branco a parte.'),
((select id from empresas where slug = 'figueiredo'), 'carne-de-sol-do-sertao-meia', 'Carne de sol do sertão meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Em uma frigideira coloque a manteiga, cebola e a carne, acrescente o molho branco, nata e um pouco de leite e deixe ferver bem.
Em outra frigideira coloque o arroz, molho branco, nata, sal, queijo coalho e um pouco de leite, deixe ficar bem cremoso.

COMO SERVIR:
1. Coloque o arroz na travessa e cubra com o preparo da carne de sol, adicione o queijo coalho ralado.
2. Gratine até dourar o queijo completamente.
3. Finalize com salsinha
4. Acompanha mandioca frita'),
((select id from empresas where slug = 'figueiredo'), 'carne-de-sol-do-sertao-inteira', 'Carne de sol do sertão inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Em uma frigideira coloque a manteiga, cebola e a carne, acrescente o molho branco, nata e um pouco de leite e deixe ferver bem.
Em outra frigideira coloque o arroz, molho branco, nata, sal, queijo coalho e um pouco de leite, deixe ficar bem cremoso.

COMO SERVIR:
1. Coloque o arroz na travessa e cubra com o preparo da carne de sol, adicione o queijo coalho ralado.
2. Gratine até dourar o queijo completamente.
3. Finalize com salsinha
4. Acompanha mandioca frita'),
((select id from empresas where slug = 'figueiredo'), 'file-dos-deuses-meia', 'Filé dos Deuses meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os filés que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'file-dos-deuses-inteira', 'Filé dos Deuses inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os filés que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'frango-a-parmegiana-meia', 'Frango a parmegiana meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. tempere o filé de peito com sal;
2. Empane com farinha de trigo, mistura de ovo com leite, e na farinha de rosca.
3. Frite e coloque em uma paellera, adicione o molho de tomate, muçarela, orégano e gr dourar o queijo.

COMO SERVIR:
1 Depois que estiver gratinado coloque a batata ao lado.
2. Arroz branco a parte.'),
((select id from empresas where slug = 'figueiredo'), 'frango-a-parmegiana-inteira', 'Frango a parmegiana inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. tempere o filé de peito com sal;
2. Empane com farinha de trigo, mistura de ovo com leite, e na farinha de rosca.
3. Frite e coloque em uma paellera, adicione o molho de tomate, muçarela, orégano e gr dourar o queijo.

COMO SERVIR:
1 Depois que estiver gratinado coloque a batata ao lado.
2. Arroz branco a parte.'),
((select id from empresas where slug = 'figueiredo'), 'picadinho-figueiredo-meia', 'Picadinho Figueiredo meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque cada ingrediente em sua panelinha, sendo nas menores arroz, farofa de ovos e milanesa. Na panela maior o picadinho.'),
((select id from empresas where slug = 'figueiredo'), 'picadinho-figueiredo-inteira', 'Picadinho Figueiredo inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque cada ingrediente em sua panelinha, sendo nas menores arroz, farofa de ovos e milanesa. Na panela maior o picadinho.'),
((select id from empresas where slug = 'figueiredo'), 'file-a-piamontese-meia', 'Filé a piamontese meia', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Corte o filet em partes de 100g aproximadamente cada, temepere com sal e coloque para grelhar na frigideira
Em uma frigideira coloque a margarina, doure o alho, cebola e a vinho, deixe evaporar o álcool, entre com molho madeira, coloque o filet dentro do molho e sirva.

COMO SERVIR:

1. Coloque o filé na paellera, secore com salsinha;
2. Acompanha arroz piamontese'),
((select id from empresas where slug = 'figueiredo'), 'file-a-piamontese-inteira', 'Filé a piamontese inteira', 'prato'::tipo_receita, 'Tradicionais', 1.0, 'porção', '1. Corte o filet em partes de 100g aproximadamente cada, temepere com sal e coloque para grelhar na frigideira
Em uma frigideira coloque a margarina, doure o alho, cebola e a vinho, deixe evaporar o álcool, entre com molho madeira, coloque o filet dentro do molho e sirva.

COMO SERVIR:

1. Coloque o filé na paellera, secore com salsinha;
2. Acompanha arroz piamontese'),
((select id from empresas where slug = 'figueiredo'), 'picanha-na-parrilla', 'Picanha na parrilla', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'Fatiar a picanha com 1 dedo de espessura. Porcionar em pacotes de 500g'),
((select id from empresas where slug = 'figueiredo'), 'ancho-angus', 'Ancho angus', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'Fatiar o ancho com 1 dedo de espessura. Porcionar em pacotes de 500g'),
((select id from empresas where slug = 'figueiredo'), 'chorizo-angus', 'Chorizo Angus', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'Fatiar o chorizo com 1 dedo de espessura. Porcionar em pacotes de 500g'),
((select id from empresas where slug = 'figueiredo'), 'flat-iron-angus', 'Flat Iron angus', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'Porcionar em pacotes de 400G'),
((select id from empresas where slug = 'figueiredo'), 'carne-de-sol-angus-cortes-nobres', 'Carne de sol Angus (Cortes nobres)', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'Porcionar em pacotes de 500g'),
((select id from empresas where slug = 'figueiredo'), 'costela-suina', 'Costela suína', 'prato'::tipo_receita, 'Cortes nobres', 1.0, 'porção', 'temperar a costelinha com rub, assar em fogo baixo no forno 150 graus por 1h, embrulhar e assar por mais 2 horas até ficar macia soltando do osso.'),
((select id from empresas where slug = 'figueiredo'), 'cheese-bacon', 'CHEESE BACON', 'prato'::tipo_receita, 'Burger', 1.0, 'porção', 'Grelhar o pão para aquecer e selar, grelhar a carne colocando sal dos dois lados. Quando virar adicionar o queijo e o bacon já frito. Maionese adicionar na coroa do pão. Servir o burger na tábua com a porção de fritas ao lado.'),
((select id from empresas where slug = 'figueiredo'), 'risoto-de-camarao', 'Risoto de camarão', 'prato'::tipo_receita, 'Risotos', 1.0, 'porção', '1. Em uma frigideira coloque o azeite e alho, deixe dourar, acrescente cebola e refogue depois camarão.
2. Adicione o vinho e deixe evaporar o álcool, coloque o arroz pré-cozido, o molho de tomate, molho branco e o consomê de legumes.
3. Deixe reduzir até o ponto de risoto cremoso, acrescente o parmesão e mexa bem.

MODO DE SERVIR:
1. Use o prato chapéu chinês.
2. Coloque o risoto no prato, deixando os camarões por cima.
3. Finalize com queijo parmesão e salsinha'),
((select id from empresas where slug = 'figueiredo'), 'risoto-de-file-mignon', 'Risoto de filé mignon', 'prato'::tipo_receita, 'Risotos', 1.0, 'porção', '1. Em uma frigideira coloque o azeite e alho, deixe dourar, acrescente cebola.
2. Adicione a carne já temperada com sal e pré frita;
3 Adicione o vinho e deixe evaporar o álcool, coloque o arroz pré-cozido, molho branco e o consomê de legumes.
4. Deixe reduzir até o ponto de risoto cremoso, acrescente o parmesão e mexa bem.

MODO DE SERVIR:
1. Use o prato chapéu chinês.
2. Coloque o risoto no prato.
3. Finalize com queijo parmesão e salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'espaguete-de-abobrinha', 'Espaguete de Abobrinha', 'prato'::tipo_receita, 'Vegetarianos', 1.0, 'porção', '1. Em uma frigideira aquecida, doure 5 gramas do alho com 50 ml do azeite, em seguida a cebola e refogue bem. Adicione o espaguete de abobrinha, sal e reserve.
2. Em outra frigideira aquecida, doure o alho com 30 ml do azeite, tomate picado, manjerição, funghi e refogue bem. Acrescente o molho de tomate e deixe ferver.
3. Adicione o espaguete de abobrinha ao molho de tomate e deixe encorpar bem. Desligue a fogo e adicione o restante do azeite.

MODO DE SERVIR:
1. No prato Chapéu chinês, coloque o espaguete de forma que o funghi fique por cima.
Decore com chips de batata doce ao redor e por cima a biquinho.
3. finalize com a salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'parmegiana-de-beringela', 'Parmegiana de beringela', 'prato'::tipo_receita, 'Vegetarianos', 1.0, 'porção', 'Modo de Preparo:
1.Tempere a berinjela com sal.
2. passe o filé na farinha de trigo, depois na mistura de ovo com o leite em seguida na farinha Panko
3. Frite no óleo a 180° até dourar, escorra bem.
4. Em uma travessa coloque a berinjela, cubra com o molho de tomate, queijo e orégano para gratinar até que o queijo derreta completamente.

Como Servir: 
1. Use o prato raso grande
2. Coloque a berinjela atravessada, ao lado coloque o arroz de cabeça para baixo no ramaqueim e a batata frita ao lado. Finalize com salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'risoto-de-funghi', 'Risoto de funghi', 'prato'::tipo_receita, 'Vegetarianos', 1.0, 'porção', '1. Em uma frigideira coloque o azeite e alho, deixe dourar, acrescente cebola.
2. Adicione o funghui já temperado e hidratado; 
3 Adicione o vinho e deixe evaporar o álcool, coloque o arroz pré-cozido, molho branco e o consomê de legumes.
4. Deixe reduzir até o ponto de risoto cremoso, acrescente o parmesão e mexa bem.

MODO DE SERVIR:
1. Use o prato chapéu chinês.
2. Coloque o risoto no prato.
3. Finalize com queijo parmesão e salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'petit-gateau', 'Petit Gateau', 'prato'::tipo_receita, 'Sobremesas', 1.0, 'porção', 'Aquecer o bolinho no microondas por 30 segundos, colocar a bola de sorvete do lado, e despejar a ganache sobre'),
((select id from empresas where slug = 'figueiredo'), 'pudim-de-ninho-com-nutella', 'Pudim de ninho com nutella', 'prato'::tipo_receita, 'Sobremesas', 2.599937, 'porção', 'Bater todos ingredientes no liquidificador, assar por 2 horas em banho maria com forno a 150 graus.'),
((select id from empresas where slug = 'figueiredo'), 'brownie', 'Brownie', 'prato'::tipo_receita, 'Sobremesas', 1.0, 'porção', 'Brownie aquecido por 20 segundos, sorvete ao lado, ganache sobre e morangos enfeitando.'),
((select id from empresas where slug = 'figueiredo'), 'taca-de-brownie', 'Taça de Brownie', 'prato'::tipo_receita, 'Sobremesas', 1.0, 'porção', 'Colocar as 4 bolas de sorvete, despejando metade do brownie triturado, colocar os morangos, e por último o brigadeiro.'),
((select id from empresas where slug = 'figueiredo'), 'taca-de-ninho-com-nutella-e-morango', 'Taça de ninho com nutella e morango', 'prato'::tipo_receita, 'Sobremesas', 1.0, 'porção', 'Servir as 4 bolas de sorvete, polvilhar ninho, colocar a nutela e dispor os morangos fatiados.'),
((select id from empresas where slug = 'figueiredo'), 'creme-de-papaia-com-cassis', 'Creme de papaia com cassis', 'prato'::tipo_receita, 'Sobremesas', 1.0, 'porção', 'Aquecer o leite condensado, entrar com o creme de leite e chocolate ralado. Mexer sem parar até ficar na consistência de puxa.'),
((select id from empresas where slug = 'figueiredo'), 'picanha', 'Picanha', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Tempere o steak com sal, grelhe na churrasqueira.

MODO DE SERVIR:
1. Use o prato raso grande.
2. Coloque a picanha atravessada, ao lado coloque o arroz o tropeiro e a salada.
3. Finalize com salsinha..'),
((select id from empresas where slug = 'figueiredo'), 'file-a-parmegiana', 'Filé a parmegiana', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Modo de Preparo:
1. Bater o file e tempere com sal.
2. passe o filé na farinha de trigo, depois na mistura de ovo com o leite em seguida na farinha Panko
3. Frite no óleo a 180° até dourar, escorra bem o file .
4. Em uma travessa coloque o file, cubra com o molho de tomate, queijo e orégano para gratinar até que o queijo derreta completamente.

Como Servir: 
1. Use o prato raso grande
2. Coloque o Filé atravessado, ao lado coloque o arroz de cabeça para baixo no ramaqueim e a batata frita ao lado. Finalize com salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'frango-a-parmegiana', 'Frango a parmegiana', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Modo de Preparo:
1. Bater o filet de frango e tempere com sal.
2. passe o filé na farinha de trigo, depois na mistura de ovo com o leite em seguida na farinha Panko
3. Frite no óleo a 180° até dourar, escorra bem o filet de frango.
4. Em uma travessa coloque o filet de frango, cubra com o molho de tomate, queijo e orégano para gratinar até que o queijo derreta completamente.

Como Servir: 
1. Use o prato raso grande
2. Coloque o Filé de frango atravessado, ao lado coloque o arroz de cabeça para baixo no ramaqueim e a batata frita ao lado. Finalize com salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'file-de-frango-grelhado', 'Filé de frango grelhado', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Tempere o steak com sal, grelhe na churrasqueira.

MODO DE SERVIR:
1. Use o prato raso grande.
2. Coloque a picanha atravessada, ao lado coloque o arroz o tropeiro e a salada.
3. Finalize com salsinha..'),
((select id from empresas where slug = 'figueiredo'), 'tilapia', 'Tilápia', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Tempere a tilápia com sal, caldo de frutos do mar, alho e limão, passe no trigo na mistura de ovo com leite e por último na farinha panto, frite e reserve.

MODO DE SERVIR:
1. Use o prato raso grande
2. Coloque o filé de tilápia frito atravessado, ao lado coloque o arroz de cabeça para baixo no ramequim o purê de batata ao lado, a salada no canto do prato.
3. Finalize com salsinha.'),
((select id from empresas where slug = 'figueiredo'), 'carne-de-sol-do-sertao', 'Carne de sol do sertão', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. Em uma frigideira coloque a manteiga, cebola e a carne, acrescente o molho branco, nata e um pouco de leite e deixe ferver bem.
Em outra frigideira coloque o arroz, molho branco, nata, sal, queijo coalho e um pouco de leite, deixe ficar bem cremoso.

COMO SERVIR:
1. Coloque o arroz na travessa e cubra com o preparo da carne de sol, adicione o queijo coalho ralado.
2. Gratine até dourar o queijo completamente.
3. Finalize com salsinha
4. Acompanha mandioca frita'),
((select id from empresas where slug = 'figueiredo'), 'salmao', 'Salmão', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. tempere o salmão com sal e limão
2. Grelhe na parrilla o salmão até ficar dourado.

MODO DE SERVIR:
1. Use o prato raso grande.
2. Coloque o salmão atravessado, ao lado coloque o arroz e o puré de batata e salada.
3. Finalize com salsinha..'),
((select id from empresas where slug = 'figueiredo'), 'santo-prazer', 'Santo prazer', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida misture, reserve uns camarões para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o preparo na prato chapeu, finalize com queijo parmesão manjericão e os camarões que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'file-dos-deuses', 'Filé dos Deuses', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os filés que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'costelinha-suina', 'Costelinha suína', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Aquecer a costelinha em banho maria, servir no prato colocando o barbecue sobre ela.
MODO DE SERVIR:
1. Use o prato raso grande.
2. Coloque a costelinha, molho sobre, arroz e fritas ao lado.'),
((select id from empresas where slug = 'figueiredo'), 'camarao-figueiredo', 'Camarão figueiredo', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. Tempere os camarões com caldo de frutos do mar e sal.
2. Em uma frigideira coloque o molho bránco, presunto e o arroz, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o camarão temperado com caldo de frutos do mar e sal, em seguida coloque o molho, deixe esquentar bem.

MODO DE SERVIR:
1. Coloque o arroz na travessa, por cima coloque o camarão, cubra com queijo e gratine bem.
Palha
2. Finalize com batata palha e salsinha'),
((select id from empresas where slug = 'figueiredo'), 'picadinho-figueiredo', 'Picadinho Figueiredo', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', '1. Tempere os filés com alho e sal.
2. Em uma frigideira coloque o molho bránco, e o macarrão já cozido, misture bem até ficar bem cremoso.
3. Em outra frigideira coloque a margarina e a cebola e refogue bem, acrescente o filé temperad, em seguida misture, reserve uns filé para finalizar, deixe esquentar bem, adicione o manjericão ao final.

MODO DE SERVIR:
1. Coloque o arroz na travessa, finalize com queijo parmesão manjericão e os filés que havia reservado.'),
((select id from empresas where slug = 'figueiredo'), 'tilapia-com-legumes', 'Tilápia com legumes', 'prato'::tipo_receita, 'Executivos', 1.0, 'porção', 'Temperar a tilápia com sal, grelhar na panela
MODO DE SERVIR:
1. Use o prato raso grande.
2. Coloque a tilápia, purê de batatas e legumes salteados ao lado.');

-- itens das receitas
insert into receita_itens (receita_id, ordem, insumo_id, sub_receita_id, quantidade, observacao)
select r.id, v.ordem, i.id, s.id, v.qtd, v.obs from (values
('arroz-branco', 1, 81::int, null, 5.0::numeric, 'Arroz Branco'),
('arroz-branco', 2, 34::int, null, 0.15::numeric, 'Alho amassado'),
('arroz-branco', 3, 41::int, null, 0.015::numeric, 'Cebola amassada'),
('arroz-branco', 4, 166::int, null, 0.005::numeric, null),
('arroz-branco', 5, 77::int, null, 10.0::numeric, null),
('banana-a-milanesa', 1, 36::int, null, 1.2::numeric, 'Banana da terra madura'),
('banana-a-milanesa', 2, 141::int, null, 3.0::numeric, null),
('banana-a-milanesa', 3, 119::int, null, 0.1::numeric, null),
('banana-a-milanesa', 4, 111::int, null, 0.08::numeric, null),
('banana-a-milanesa', 5, 110::int, null, 0.08::numeric, null),
('batata-frita-com-ketchup-guarnicao', 1, 87::int, null, 0.4::numeric, null),
('batata-frita-com-ketchup-guarnicao', 2, 118::int, null, 0.055::numeric, null),
('batata-frita-temperada', 1, 88::int, null, 0.4::numeric, 'Fritas palito'),
('batata-frita-temperada', 2, 166::int, null, 0.001::numeric, 'Tempero fritas'),
('batata-palha', 1, 38::int, null, 11.0::numeric, null),
('batata-palha', 2, 140::int, null, 5.0::numeric, null),
('brigadeiro-meio-amargo', 1, 120::int, null, 1.25::numeric, null),
('brigadeiro-meio-amargo', 2, 106::int, null, 0.75::numeric, null),
('brigadeiro-meio-amargo', 3, 100::int, null, 0.3::numeric, null),
('brownie-bolinho', 1, 127::int, null, 0.6::numeric, null),
('brownie-bolinho', 2, 100::int, null, 0.33::numeric, null),
('brownie-bolinho', 3, 75::int, null, 0.56::numeric, null),
('brownie-bolinho', 4, 141::int, null, 7.0::numeric, 'ovos inteiros'),
('brownie-bolinho', 5, 110::int, null, 0.25::numeric, null),
('brownie-bolinho', 6, 90::int, null, 0.2::numeric, null),
('brownie-bolinho', 7, 166::int, null, 0.001::numeric, 'sal pitada'),
('brownie-bolinho', 8, 89::int, null, 0.01::numeric, null),
('chapinha-figueiredo-unidade', 1, 1::int, null, 0.3::numeric, null),
('chapinha-figueiredo-unidade', 2, 88::int, null, 0.3::numeric, 'BATATA FRITA'),
('chapinha-figueiredo-unidade', 3, 72::int, null, 0.1::numeric, null),
('chimichurri', 1, 34::int, null, 0.1::numeric, 'Alho amassado'),
('chimichurri', 2, 166::int, null, 0.02::numeric, null),
('chimichurri', 3, 163::int, null, 0.01::numeric, null),
('chimichurri', 4, 60::int, null, 3.0::numeric, 'Salsa picada pequena'),
('chimichurri', 5, 161::int, null, 0.1::numeric, 'Ervas secas / Oregano'),
('chimichurri', 6, 47::int, null, 0.5::numeric, 'Limão espremido'),
('chimichurri', 7, 77::int, null, 0.5::numeric, null),
('chimichurri', 8, 151::int, null, 0.5::numeric, 'Vinagre de vinho tinto'),
('chimichurri', 9, 42::int, null, 0.1::numeric, 'Uma Cebola roxa bem picada'),
('chimichurri', 10, 55::int, null, 0.08::numeric, null),
('chimichurri', 11, 44::int, null, 2.0::numeric, null),
('chimichurri', 12, 82::int, null, 0.4::numeric, null),
('chips-de-batata-doce', 1, 37::int, null, 1.5::numeric, 'Batata doce laminada'),
('chips-de-batata-doce', 2, 166::int, null, 0.005::numeric, 'Sal branco'),
('chips-de-batata-doce', 3, 77::int, null, 2.0::numeric, null),
('chips-de-batata-doce', 4, 140::int, null, 5.0::numeric, null),
('consume-de-legumes', 1, 77::int, null, 2.0::numeric, null),
('consume-de-legumes', 2, 41::int, null, 0.3::numeric, 'Cebola em pedaços'),
('consume-de-legumes', 3, 61::int, null, 0.15::numeric, 'Alho poró'),
('consume-de-legumes', 4, 43::int, null, 0.3::numeric, 'Cenoura rodelas'),
('consume-de-legumes', 5, 61::int, null, 0.2::numeric, null),
('farofa-de-ovos', 1, 128::int, null, 0.006::numeric, null),
('farofa-de-ovos', 2, 141::int, null, 4.0::numeric, 'Ovos'),
('farofa-de-ovos', 3, 41::int, null, 0.001::numeric, 'Cebola batida'),
('farofa-de-ovos', 4, 108::int, null, 0.15::numeric, 'Farinha fina amarela'),
('farofa-de-ovos', 5, 44::int, null, 0.005::numeric, 'Cheiro verde'),
('farofa-de-ovos', 6, 166::int, null, 0.001::numeric, 'Sal temperado'),
('feijao-tropeiro', 1, 113::int, null, 3.0::numeric, null),
('feijao-tropeiro', 2, 6::int, null, 0.3::numeric, null),
('feijao-tropeiro', 3, 4::int, null, 0.3::numeric, 'Bacon'),
('feijao-tropeiro', 4, 45::int, null, 0.18::numeric, null),
('feijao-tropeiro', 5, 41::int, null, 0.08::numeric, 'Cebola batida'),
('feijao-tropeiro', 6, 166::int, null, 0.003::numeric, 'Sal fino'),
('feijao-tropeiro', 7, 34::int, null, 0.03::numeric, null),
('feijao-tropeiro', 8, 108::int, null, 0.15::numeric, null),
('feijao-tropeiro', 9, 126::int, null, 0.05::numeric, null),
('legumes-cozidos', 1, 38::int, null, 0.3::numeric, null),
('legumes-cozidos', 2, 43::int, null, 0.15::numeric, 'Cenoura cozida'),
('legumes-cozidos', 3, 40::int, null, 0.18::numeric, 'Brócolis Cozido'),
('legumes-cozidos', 4, 166::int, null, 0.02::numeric, 'Sal temperado'),
('legumes-cozidos', 5, 84::int, null, 0.05::numeric, null),
('legumes-cozidos', 6, 77::int, null, 1.0::numeric, null),
('mix-de-queijos-especial', 1, 72::int, null, 0.5::numeric, 'Muçarela ralada'),
('mix-de-queijos-especial', 2, 70::int, null, 0.5::numeric, 'Chedar Ralado'),
('molho-branco', 1, 119::int, null, 15.0::numeric, null),
('molho-branco', 2, 110::int, null, 1.0::numeric, null),
('molho-branco', 3, 128::int, null, 1.3::numeric, null),
('molho-branco', 4, 41::int, null, 0.5::numeric, null),
('molho-branco', 5, 34::int, null, 0.04::numeric, 'Alho Batido'),
('molho-branco', 6, 107::int, null, 1.0::numeric, null),
('molho-branco', 7, 160::int, null, 0.001::numeric, 'Noz moscada'),
('molho-branco', 8, 166::int, null, 0.15::numeric, 'Sal temperado'),
('molho-branco', 9, 157::int, null, 0.0001::numeric, null),
('molho-de-tomate', 1, 64::int, null, 23.0::numeric, 'Tomate Italiano'),
('molho-de-tomate', 2, 77::int, null, 4.0::numeric, null),
('molho-de-tomate', 3, 41::int, null, 1.5::numeric, 'Cebola Rodelas'),
('molho-de-tomate', 4, 74::int, null, 0.2::numeric, null),
('molho-de-tomate', 5, 166::int, null, 0.2::numeric, 'Sal temperado'),
('molho-de-tomate', 6, 61::int, null, 0.5::numeric, null),
('molho-de-tomate', 7, 41::int, null, 0.5::numeric, 'Cebola batida'),
('molho-de-tomate', 8, 34::int, null, 0.5::numeric, null),
('molho-de-tomate', 9, 50::int, null, 1.0::numeric, null),
('molho-de-tomate', 10, 84::int, null, 1.0::numeric, 'Azeite de oliva'),
('molho-de-tomate', 11, 149::int, null, 10.0::numeric, null),
('molho-madeira', 1, 135::int, null, 0.09::numeric, null),
('molho-madeira', 2, 34::int, null, 0.02::numeric, 'Alho batido'),
('molho-madeira', 3, 140::int, null, 0.02::numeric, null),
('molho-madeira', 4, 77::int, null, 1.0::numeric, null),
('molho-pesto', 1, 50::int, null, 3.0::numeric, 'Mangericão'),
('molho-pesto', 2, 84::int, null, 0.5::numeric, null),
('molho-pesto', 3, 34::int, null, 0.1::numeric, null),
('molho-pesto', 4, 166::int, null, 0.002::numeric, null),
('molho-pesto', 5, 163::int, null, 0.001::numeric, null),
('molho-pesto', 6, 73::int, null, 0.1::numeric, 'Parmesão ralado'),
('molho-tartaro', 1, 43::int, null, 0.3::numeric, null),
('molho-tartaro', 2, 41::int, null, 0.35::numeric, null),
('molho-tartaro', 3, 61::int, null, 0.25::numeric, 'Salsão / Talo / folha'),
('molho-tartaro', 4, 136::int, null, 0.04::numeric, null),
('molho-tartaro', 5, 47::int, null, 1.0::numeric, null),
('molho-tartaro', 6, 34::int, null, 0.005::numeric, null),
('molho-tartaro', 7, 141::int, null, 6.0::numeric, 'Ovos gelados'),
('molho-tartaro', 8, 140::int, null, 3.0::numeric, null),
('molho-tartaro', 9, 163::int, null, 0.01::numeric, null),
('molho-tartaro', 10, 158::int, null, 0.003::numeric, null),
('molho-tartaro', 11, 166::int, null, 0.003::numeric, 'Sal branco'),
('pao-de-alho-preparo', 1, 167::int, null, 0.5::numeric, 'Meio pão baguete'),
('pao-de-alho-preparo', 2, 125::int, null, 0.05::numeric, null),
('pao-de-alho-preparo', 3, 34::int, null, 0.04::numeric, null),
('pao-de-alho-preparo', 4, 161::int, null, 0.01::numeric, null),
('pao-de-alho-preparo', 5, 72::int, null, 0.05::numeric, 'Queijo Muçarela'),
('pao-de-alho-preparo', 6, 60::int, null, 0.001::numeric, null),
('pure-de-batata', 1, 38::int, null, 0.5::numeric, 'Batata inglesa bem cozida'),
('pure-de-batata', 2, 106::int, null, 0.1::numeric, null),
('pure-de-batata', 3, 119::int, null, 0.1::numeric, 'Leite quente'),
('pure-de-batata', 4, 166::int, null, 0.001::numeric, 'Sal branco'),
('pure-de-batata', 5, 160::int, null, 0.001::numeric, 'Noz moscada'),
('pure-de-batata', 6, 128::int, null, 0.03::numeric, null),
('pure-de-batata', 7, 126::int, null, 0.01::numeric, null),
('rub-suino', 1, 166::int, null, 4.0::numeric, null),
('rub-suino', 2, 163::int, null, 1.0::numeric, null),
('rub-suino', 3, 162::int, null, 2.0::numeric, null),
('rub-suino', 4, 154::int, null, 1.0::numeric, null),
('rub-suino', 5, 154::int, null, 1.0::numeric, 'cebola em pó'),
('rub-suino', 6, 75::int, null, 4.0::numeric, null),
('salada-do-executivo', 1, 32::int, null, 0.04::numeric, null),
('salada-do-executivo', 2, 43::int, null, 0.06::numeric, 'Cenoura ralada'),
('salada-do-executivo', 3, 62::int, null, 0.04::numeric, null),
('arroz-a-piamontese', 1, null::int, 'arroz-branco', 1.0::numeric, null),
('arroz-a-piamontese', 2, null::int, 'molho-branco', 0.3::numeric, null),
('arroz-a-piamontese', 3, 72::int, null, 0.13::numeric, 'Muçarela'),
('arroz-a-piamontese', 4, 41::int, null, 0.002::numeric, null),
('arroz-a-piamontese', 5, 101::int, null, 0.1::numeric, 'champignon'),
('arroz-a-piamontese', 6, 128::int, null, 0.03::numeric, null),
('arroz-a-piamontese', 7, 152::int, null, 0.05::numeric, null),
('arroz-a-piamontese', 8, 119::int, null, 0.1::numeric, null),
('arroz-arboreo-pre-cozido', 1, 80::int, null, 1.0::numeric, null),
('arroz-arboreo-pre-cozido', 2, 84::int, null, 0.1::numeric, null),
('arroz-arboreo-pre-cozido', 3, 166::int, null, 0.001::numeric, 'Sal fino'),
('arroz-arboreo-pre-cozido', 4, null::int, 'consume-de-legumes', 1.6::numeric, null),
('arroz-arboreo-pre-cozido', 5, 34::int, null, 0.006::numeric, 'Alho batido'),
('arroz-arboreo-pre-cozido', 6, 41::int, null, 0.15::numeric, 'Cebola batida'),
('arroz-arboreo-pre-cozido', 7, 152::int, null, 0.2::numeric, null),
('arroz-biro-biro-inteira', 1, 4::int, null, 0.18::numeric, 'Bacon em cubos pequenos'),
('arroz-biro-biro-inteira', 2, 38::int, null, 0.07::numeric, 'Batata Palha'),
('arroz-biro-biro-inteira', 3, 141::int, null, 4.0::numeric, 'Ovos'),
('arroz-biro-biro-inteira', 4, 44::int, null, 0.001::numeric, 'Cheiro verde'),
('arroz-biro-biro-inteira', 5, null::int, 'arroz-branco', 1.5::numeric, null),
('arroz-biro-biro-inteira', 6, 126::int, null, 0.015::numeric, null),
('arroz-biro-biro-inteira', 7, 108::int, null, 0.03::numeric, null),
('arroz-biro-biro-meia', 1, 4::int, null, 0.12::numeric, 'Bacon em cubos pequenos'),
('arroz-biro-biro-meia', 2, 38::int, null, 0.05::numeric, 'Batata Palha'),
('arroz-biro-biro-meia', 3, 141::int, null, 3.0::numeric, 'Ovos'),
('arroz-biro-biro-meia', 4, 44::int, null, 0.001::numeric, 'Cheiro verde'),
('arroz-biro-biro-meia', 5, null::int, 'arroz-branco', 1.2::numeric, null),
('arroz-biro-biro-meia', 6, 126::int, null, 0.01::numeric, null),
('arroz-biro-biro-meia', 7, 108::int, null, 0.02::numeric, null),
('arroz-com-brocolis', 1, null::int, 'arroz-branco', 1.5::numeric, 'Arroz cozido'),
('arroz-com-brocolis', 2, 40::int, null, 0.2::numeric, 'Brócolis picado / batido'),
('arroz-com-brocolis', 3, 84::int, null, 0.02::numeric, 'Azeite de oliva'),
('arroz-com-brocolis', 4, 41::int, null, 0.01::numeric, 'Cebola batida'),
('arroz-com-brocolis', 5, 166::int, null, 0.002::numeric, null),
('recheio-de-pastel-de-carne', 1, 14::int, null, 0.5::numeric, 'Carne de sol desfiada'),
('recheio-de-pastel-de-carne', 2, 126::int, null, 0.5::numeric, null),
('recheio-de-pastel-de-carne', 3, 96::int, null, 1.24::numeric, null),
('recheio-de-pastel-de-carne', 4, 41::int, null, 0.2::numeric, 'Cebola picada'),
('recheio-de-pastel-de-carne', 5, null::int, 'molho-branco', 1.1::numeric, null),
('vinagrete', 1, 65::int, null, 1.0::numeric, 'Tomate cubos'),
('vinagrete', 2, 42::int, null, 0.1::numeric, null),
('vinagrete', 3, 82::int, null, 0.2::numeric, null),
('vinagrete', 4, 47::int, null, 0.1::numeric, null),
('vinagrete', 5, 151::int, null, 0.08::numeric, null),
('vinagrete', 6, 56::int, null, 0.2::numeric, null),
('vinagrete', 7, 44::int, null, 0.5::numeric, 'Cheiro verde'),
('vinagrete', 8, 118::int, null, 0.04::numeric, null),
('vinagrete', 9, null::int, 'chimichurri', 0.01::numeric, null),
('vinagrete', 10, 166::int, null, 0.01::numeric, null),
('pastel-de-camarao', 1, 7::int, null, 0.145::numeric, null),
('pastel-de-camarao', 2, 96::int, null, 0.0::numeric, null),
('pastel-de-camarao', 3, 166::int, null, 0.001::numeric, null),
('pastel-de-camarao', 4, 128::int, null, 0.0015::numeric, null),
('pastel-de-camarao', 5, 41::int, null, 0.001::numeric, null),
('pastel-de-camarao', 6, 129::int, null, 0.15::numeric, null),
('pastel-de-camarao', 7, 118::int, null, 0.055::numeric, null),
('pastelzinho-de-carne', 1, 129::int, null, 0.13::numeric, null),
('pastelzinho-de-carne', 2, null::int, 'recheio-de-pastel-de-carne', 0.15::numeric, null),
('pastelzinho-de-carne', 3, 118::int, null, 0.055::numeric, null),
('pastelzinho-de-queijo', 1, 129::int, null, 0.13::numeric, null),
('pastelzinho-de-queijo', 2, 72::int, null, 0.13::numeric, 'Queijo Muçarela'),
('pastelzinho-de-queijo', 3, 95::int, null, 0.055::numeric, 'Ketchup'),
('coxinha-figueiredo', 1, 26::int, null, 10.0::numeric, null),
('coxinha-figueiredo', 2, 22::int, null, 10.0::numeric, null),
('coxinha-figueiredo', 3, 41::int, null, 0.4::numeric, 'Cebola batida'),
('coxinha-figueiredo', 4, 77::int, null, 3.5::numeric, null),
('coxinha-figueiredo', 5, 140::int, null, 0.3::numeric, null),
('coxinha-figueiredo', 6, 160::int, null, 0.002::numeric, 'cominho'),
('coxinha-figueiredo', 7, 110::int, null, 2.0::numeric, null),
('coxinha-figueiredo', 8, 111::int, null, 2.0::numeric, null),
('coxinha-figueiredo', 9, 162::int, null, 0.06::numeric, 'Páprica doce'),
('coxinha-figueiredo', 10, 166::int, null, 0.04::numeric, null),
('coxinha-figueiredo', 11, 96::int, null, 1.5::numeric, null),
('coxinha-figueiredo', 12, 153::int, null, 1.0::numeric, null),
('coxinha-figueiredo', 13, 149::int, null, 0.5::numeric, null),
('coxinha-figueiredo', 14, 44::int, null, 2.0::numeric, 'Cheiro verde'),
('coxinha-figueiredo', 15, 141::int, null, 10.0::numeric, null),
('coxinha-figueiredo', 16, 119::int, null, 2.0::numeric, null),
('batata-especial', 1, 87::int, null, 0.4::numeric, 'Batata frizze Frita'),
('batata-especial', 2, null::int, 'mix-de-queijos-especial', 0.15::numeric, null),
('batata-especial', 3, 166::int, null, 0.001::numeric, 'Sal com pimenta'),
('batata-especial', 4, 4::int, null, 0.05::numeric, 'Bacon cubos'),
('batata-frita', 1, null::int, 'batata-frita-temperada', 0.3::numeric, null),
('batata-figueiredo', 1, 87::int, null, 0.4::numeric, 'Batata Frita palito'),
('batata-figueiredo', 2, 96::int, null, 0.1::numeric, null),
('batata-figueiredo', 3, 166::int, null, 0.001::numeric, 'Sal com pimenta'),
('batata-figueiredo', 4, 11::int, null, 0.1::numeric, 'Costela desfiada'),
('camarao-alho-e-oleo', 1, 7::int, null, 0.3::numeric, 'Camarão sem casca'),
('camarao-alho-e-oleo', 2, 166::int, null, 0.005::numeric, 'Sal temperado'),
('camarao-alho-e-oleo', 3, 93::int, null, 0.005::numeric, null),
('camarao-alho-e-oleo', 4, 103::int, null, 0.001::numeric, null),
('camarao-alho-e-oleo', 5, 34::int, null, 0.004::numeric, 'Alho laminado'),
('camarao-alho-e-oleo', 6, 47::int, null, 0.1::numeric, null),
('camarao-alho-e-oleo', 7, 33::int, null, 0.1::numeric, 'Folha de alface frizze'),
('camarao-alho-e-oleo', 8, 84::int, null, 0.001::numeric, null),
('camarao-a-milanesa', 1, 7::int, null, 0.25::numeric, 'Camarão sem casca'),
('camarao-a-milanesa', 2, 111::int, null, 0.1::numeric, null),
('camarao-a-milanesa', 3, 117::int, null, 0.03::numeric, null),
('camarao-a-milanesa', 4, 110::int, null, 0.07::numeric, null),
('camarao-a-milanesa', 5, 141::int, null, 1.0::numeric, null),
('camarao-a-milanesa', 6, 166::int, null, 0.005::numeric, null),
('camarao-a-milanesa', 7, 33::int, null, 0.1::numeric, 'Folha de alface frizze'),
('camarao-a-milanesa', 8, 34::int, null, 0.004::numeric, null),
('camarao-a-milanesa', 9, 47::int, null, 0.05::numeric, null),
('camarao-a-milanesa', 10, null::int, 'molho-tartaro', 0.055::numeric, null),
('camarao-a-milanesa', 11, 119::int, null, 0.1::numeric, null),
('camarao-a-milanesa', 12, 93::int, null, 0.005::numeric, null),
('chapinha-figueiredo', 1, null::int, 'chapinha-figueiredo-unidade', 4.0::numeric, null),
('isca-de-peixe', 1, 18::int, null, 0.4::numeric, null),
('isca-de-peixe', 2, 141::int, null, 1.0::numeric, null),
('isca-de-peixe', 3, 110::int, null, 0.06::numeric, null),
('isca-de-peixe', 4, 111::int, null, 0.1::numeric, null),
('isca-de-peixe', 5, 166::int, null, 0.003::numeric, 'Sal temperado'),
('isca-de-peixe', 6, null::int, 'molho-tartaro', 0.055::numeric, null),
('frango-a-passarinho', 1, 21::int, null, 0.7::numeric, 'Frango já temperado'),
('frango-a-passarinho', 2, 155::int, null, 0.002::numeric, null),
('frango-a-passarinho', 3, 65::int, null, 0.001::numeric, 'Rodelas de tomate salada'),
('frango-a-passarinho', 4, 33::int, null, 0.2::numeric, null),
('frango-a-passarinho', 5, 47::int, null, 0.03::numeric, null),
('combinado', 1, 5::int, null, 0.15::numeric, 'Panceta defumada'),
('combinado', 2, null::int, 'pao-de-alho-preparo', 1.0::numeric, null),
('combinado', 3, 13::int, null, 0.15::numeric, 'Carne de sol'),
('combinado', 4, 16::int, null, 0.15::numeric, 'Isca de frango'),
('combinado', 5, null::int, 'molho-tartaro', 0.05::numeric, null),
('panceta-defumada', 1, 5::int, null, 0.35::numeric, null),
('panceta-defumada', 2, 166::int, null, 0.05::numeric, null),
('panceta-defumada', 3, 164::int, null, 0.01::numeric, null),
('panceta-defumada', 4, null::int, 'vinagrete', null::numeric, null),
('panceta-defumada', 5, null::int, 'chimichurri', 0.05::numeric, null),
('carne-de-sol-angus', 1, 13::int, null, 0.5::numeric, 'Carne de sol em tiras'),
('carne-de-sol-angus', 2, 49::int, null, 0.3::numeric, null),
('file-ao-molho-de-queijo', 1, 19::int, null, 0.3::numeric, 'Filé mignon em cubos'),
('file-ao-molho-de-queijo', 2, 68::int, null, 0.075::numeric, 'queijo gorgonzola'),
('file-ao-molho-de-queijo', 3, null::int, 'molho-branco', 0.3::numeric, null),
('file-ao-molho-de-queijo', 4, 152::int, null, 0.05::numeric, null),
('file-ao-molho-de-queijo', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('file-ao-molho-de-queijo', 6, 170::int, null, 0.3::numeric, null),
('file-ao-molho-de-queijo', 7, 166::int, null, 0.001::numeric, null),
('file-ao-molho-de-queijo', 8, 128::int, null, 0.03::numeric, null),
('file-ao-molho-de-queijo', 9, 60::int, null, 0.001::numeric, 'Sasinha'),
('file-ao-molho-madeira', 1, 19::int, null, 0.3::numeric, 'Filé mignon em cubos'),
('file-ao-molho-madeira', 2, 34::int, null, 0.005::numeric, 'Alho batido'),
('file-ao-molho-madeira', 3, null::int, 'molho-madeira', 0.35::numeric, null),
('file-ao-molho-madeira', 4, 152::int, null, 0.05::numeric, null),
('file-ao-molho-madeira', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('file-ao-molho-madeira', 6, 170::int, null, 0.3::numeric, null),
('file-ao-molho-madeira', 7, 166::int, null, 0.001::numeric, null),
('file-ao-molho-madeira', 8, 128::int, null, 0.03::numeric, null),
('file-ao-molho-madeira', 9, 60::int, null, 0.001::numeric, 'Sasinha'),
('terra-e-mar', 1, 19::int, null, 0.3::numeric, 'FILE MINGON'),
('terra-e-mar', 2, 18::int, null, 0.2::numeric, 'ISCA'),
('terra-e-mar', 3, 88::int, null, 0.2::numeric, 'BATATA CHIP'),
('terra-e-mar', 4, 111::int, null, 0.2::numeric, null),
('terra-e-mar', 5, 110::int, null, 0.08::numeric, null),
('terra-e-mar', 6, 47::int, null, 0.03::numeric, null),
('terra-e-mar', 7, 166::int, null, 0.001::numeric, null),
('terra-e-mar', 8, 163::int, null, 0.001::numeric, null),
('terra-e-mar', 9, null::int, 'molho-tartaro', 0.05::numeric, null),
('pao-de-alho-artesanal', 1, null::int, 'pao-de-alho-preparo', 1.0::numeric, null),
('queijo-coalho', 1, 71::int, null, 0.3::numeric, null),
('queijo-coalho', 2, 141::int, null, 3.0::numeric, null),
('queijo-coalho', 3, 119::int, null, 0.1::numeric, null),
('queijo-coalho', 4, 111::int, null, 0.08::numeric, null),
('queijo-coalho', 5, 110::int, null, 0.08::numeric, null),
('queijo-coalho', 6, 131::int, null, 0.05::numeric, null),
('brusqueta-de-camarao', 1, 170::int, null, 0.15::numeric, 'Torradas'),
('brusqueta-de-camarao', 2, 63::int, null, 0.15::numeric, null),
('brusqueta-de-camarao', 3, 84::int, null, 0.0::numeric, null),
('brusqueta-de-camarao', 4, 7::int, null, 0.15::numeric, null),
('brusqueta-de-camarao', 5, null::int, 'molho-pesto', 0.05::numeric, null),
('ceviche-de-tilapia', 1, 18::int, null, 0.12::numeric, 'Peixe branco'),
('ceviche-de-tilapia', 2, 27::int, null, 0.0::numeric, null),
('ceviche-de-tilapia', 3, 7::int, null, 0.07::numeric, null),
('ceviche-de-tilapia', 4, 47::int, null, 0.03::numeric, null),
('ceviche-de-tilapia', 5, 166::int, null, 0.001::numeric, null),
('ceviche-de-tilapia', 6, 84::int, null, 0.03::numeric, null),
('ceviche-de-tilapia', 7, 163::int, null, 0.001::numeric, null),
('ceviche-de-tilapia', 8, 42::int, null, 0.05::numeric, null),
('ceviche-de-tilapia', 9, 55::int, null, 0.01::numeric, null),
('ceviche-de-tilapia', 10, 60::int, null, 0.001::numeric, null),
('ceviche-de-tilapia', 11, null::int, 'chips-de-batata-doce', 0.05::numeric, 'Chips de mandioca'),
('salada-caesar', 1, 32::int, null, 1.0::numeric, null),
('salada-caesar', 2, 16::int, null, 0.1::numeric, 'Frango desfiado'),
('salada-caesar', 3, 169::int, null, 0.09::numeric, 'Croutons'),
('salada-caesar', 4, 44::int, null, 0.01::numeric, 'Salsinha'),
('salada-caesar', 5, 73::int, null, 0.06::numeric, null),
('salada-caesar', 6, 132::int, null, 0.06::numeric, null),
('salada-ligth', 1, 32::int, null, 0.4::numeric, null),
('salada-ligth', 2, 59::int, null, 0.2::numeric, null),
('salada-ligth', 3, 43::int, null, 0.04::numeric, 'Cenoura Ralada'),
('salada-ligth', 4, 143::int, null, 0.2::numeric, 'Pamito Cortado'),
('salada-ligth', 5, 62::int, null, 0.15::numeric, null),
('salada-ligth', 6, 124::int, null, 0.1::numeric, null),
('salada-ligth', 7, 132::int, null, 0.06::numeric, null),
('salada-ligth', 8, 86::int, null, null::numeric, null),
('salada-mar', 1, 32::int, null, 0.13::numeric, null),
('salada-mar', 2, 7::int, null, 0.1::numeric, 'Camarões refogados'),
('salada-mar', 3, 41::int, null, 0.02::numeric, 'Cebola batida'),
('salada-mar', 4, 34::int, null, 0.01::numeric, 'Alho batido'),
('salada-mar', 5, 84::int, null, 0.02::numeric, null),
('salada-mar', 6, 73::int, null, 0.02::numeric, 'Parmesão ralado'),
('salada-mar', 7, 132::int, null, 0.08::numeric, null),
('camarao-figueiredo-meia', 1, 7::int, null, 0.25::numeric, null),
('camarao-figueiredo-meia', 2, 69::int, null, 0.07::numeric, 'Presunto em cubos'),
('camarao-figueiredo-meia', 3, null::int, 'molho-branco', 0.8::numeric, null),
('camarao-figueiredo-meia', 4, 72::int, null, 0.1::numeric, 'Muçarela'),
('camarao-figueiredo-meia', 5, null::int, 'batata-palha', 0.05::numeric, null),
('camarao-figueiredo-meia', 6, null::int, 'arroz-branco', 0.5::numeric, null),
('camarao-figueiredo-meia', 7, 128::int, null, 0.02::numeric, null),
('camarao-figueiredo-meia', 8, 41::int, null, 0.02::numeric, 'Cebola batida'),
('camarao-figueiredo-meia', 9, 60::int, null, 0.001::numeric, null),
('camarao-figueiredo-meia', 10, 166::int, null, 0.001::numeric, null),
('camarao-figueiredo-meia', 11, 93::int, null, 0.001::numeric, null),
('camarao-figueiredo-inteira', 1, 7::int, null, 0.45::numeric, null),
('camarao-figueiredo-inteira', 2, 69::int, null, 0.1::numeric, 'Presunto em cubos'),
('camarao-figueiredo-inteira', 3, null::int, 'molho-branco', 1.0::numeric, null),
('camarao-figueiredo-inteira', 4, 72::int, null, 0.18::numeric, 'Muçarela'),
('camarao-figueiredo-inteira', 5, null::int, 'batata-palha', 0.08::numeric, null),
('camarao-figueiredo-inteira', 6, null::int, 'arroz-branco', 0.7::numeric, null),
('camarao-figueiredo-inteira', 7, 128::int, null, 0.03::numeric, null),
('camarao-figueiredo-inteira', 8, 41::int, null, 0.03::numeric, 'Cebola batida'),
('camarao-figueiredo-inteira', 9, 60::int, null, 0.001::numeric, null),
('camarao-figueiredo-inteira', 10, 166::int, null, 0.002::numeric, null),
('camarao-figueiredo-inteira', 11, 93::int, null, 0.002::numeric, null),
('camarao-delicia-meia', 1, 7::int, null, 0.25::numeric, null),
('camarao-delicia-meia', 2, null::int, 'molho-branco', 0.8::numeric, null),
('camarao-delicia-meia', 3, 72::int, null, 0.1::numeric, 'Muçarela'),
('camarao-delicia-meia', 4, 84::int, null, 0.02::numeric, null),
('camarao-delicia-meia', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('camarao-delicia-meia', 6, 60::int, null, 0.001::numeric, null),
('camarao-delicia-meia', 7, 166::int, null, 0.001::numeric, null),
('camarao-delicia-meia', 8, 93::int, null, 0.001::numeric, null),
('camarao-delicia-meia', 9, 36::int, null, 0.3::numeric, null),
('camarao-delicia-meia', 10, null::int, 'arroz-branco', 0.4::numeric, null),
('camarao-delicia-inteira', 1, 7::int, null, 0.45::numeric, null),
('camarao-delicia-inteira', 2, null::int, 'molho-branco', 1.2::numeric, null),
('camarao-delicia-inteira', 3, 72::int, null, 0.18::numeric, 'Muçarela'),
('camarao-delicia-inteira', 4, 84::int, null, 0.03::numeric, null),
('camarao-delicia-inteira', 5, 41::int, null, 0.04::numeric, 'Cebola batida'),
('camarao-delicia-inteira', 6, 60::int, null, 0.001::numeric, null),
('camarao-delicia-inteira', 7, 166::int, null, 0.001::numeric, null),
('camarao-delicia-inteira', 8, 93::int, null, 0.001::numeric, null),
('camarao-delicia-inteira', 9, 36::int, null, 0.5::numeric, null),
('camarao-delicia-inteira', 10, null::int, 'arroz-branco', 0.7::numeric, null),
('camarao-poro-meia', 1, 7::int, null, 0.25::numeric, null),
('camarao-poro-meia', 2, null::int, 'molho-branco', 0.4::numeric, null),
('camarao-poro-meia', 3, 72::int, null, 0.1::numeric, 'Muçarela'),
('camarao-poro-meia', 4, 128::int, null, 0.02::numeric, 'Manteiga'),
('camarao-poro-meia', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('camarao-poro-meia', 6, 60::int, null, 0.001::numeric, null),
('camarao-poro-meia', 7, 166::int, null, 0.001::numeric, null),
('camarao-poro-meia', 8, 93::int, null, 0.001::numeric, null),
('camarao-poro-meia', 9, null::int, 'arroz-branco', 0.4::numeric, null),
('camarao-poro-meia', 10, 4::int, null, 0.07::numeric, 'BACON'),
('camarao-poro-inteira', 1, 7::int, null, 0.45::numeric, null),
('camarao-poro-inteira', 2, null::int, 'molho-branco', 1.4::numeric, null),
('camarao-poro-inteira', 3, 72::int, null, 0.2::numeric, 'Muçarela'),
('camarao-poro-inteira', 4, 128::int, null, 0.04::numeric, 'Manteiga'),
('camarao-poro-inteira', 5, 41::int, null, 0.04::numeric, 'Cebola batida'),
('camarao-poro-inteira', 6, 60::int, null, 0.001::numeric, null),
('camarao-poro-inteira', 7, 166::int, null, 0.001::numeric, null),
('camarao-poro-inteira', 8, 93::int, null, 0.001::numeric, null),
('camarao-poro-inteira', 9, null::int, 'arroz-branco', 0.7::numeric, null),
('camarao-poro-inteira', 10, 4::int, null, 0.15::numeric, 'BACON'),
('camarao-imperador-meia', 1, 7::int, null, 0.25::numeric, null),
('camarao-imperador-meia', 2, 69::int, null, 0.07::numeric, 'Presunto em cubos'),
('camarao-imperador-meia', 3, null::int, 'molho-branco', 0.8::numeric, null),
('camarao-imperador-meia', 4, 72::int, null, 0.1::numeric, 'Muçarela'),
('camarao-imperador-meia', 5, null::int, 'batata-palha', 0.05::numeric, null),
('camarao-imperador-meia', 6, null::int, 'arroz-branco', 0.5::numeric, null),
('camarao-imperador-meia', 7, 128::int, null, 0.02::numeric, null),
('camarao-imperador-meia', 8, 41::int, null, 0.02::numeric, 'Cebola batida'),
('camarao-imperador-meia', 9, 60::int, null, 0.001::numeric, null),
('camarao-imperador-meia', 10, 166::int, null, 0.001::numeric, null),
('camarao-imperador-meia', 11, 93::int, null, 0.001::numeric, null),
('camarao-imperador-meia', 12, null::int, 'chapinha-figueiredo-unidade', 6.0::numeric, 'Camarões empanados'),
('camarao-imperador-inteira', 1, 7::int, null, 0.4::numeric, null),
('camarao-imperador-inteira', 2, 69::int, null, 0.1::numeric, 'Presunto em cubos'),
('camarao-imperador-inteira', 3, null::int, 'molho-branco', 1.0::numeric, null),
('camarao-imperador-inteira', 4, 72::int, null, 0.18::numeric, 'Muçarela'),
('camarao-imperador-inteira', 5, null::int, 'batata-palha', 0.08::numeric, null),
('camarao-imperador-inteira', 6, null::int, 'arroz-branco', 0.7::numeric, null),
('camarao-imperador-inteira', 7, 128::int, null, 0.03::numeric, null),
('camarao-imperador-inteira', 8, 41::int, null, 0.03::numeric, 'Cebola batida'),
('camarao-imperador-inteira', 9, 60::int, null, 0.001::numeric, null),
('camarao-imperador-inteira', 10, 166::int, null, 0.002::numeric, null),
('camarao-imperador-inteira', 11, 93::int, null, 0.002::numeric, null),
('camarao-imperador-inteira', 12, null::int, 'chapinha-figueiredo-unidade', 12.0::numeric, 'Camarões empanados'),
('camarao-mediterraneo-meia', 1, 7::int, null, 0.25::numeric, null),
('camarao-mediterraneo-meia', 2, null::int, 'molho-branco', 0.8::numeric, null),
('camarao-mediterraneo-meia', 3, 72::int, null, 0.1::numeric, 'Muçarela'),
('camarao-mediterraneo-meia', 4, null::int, 'batata-palha', 0.05::numeric, null),
('camarao-mediterraneo-meia', 5, null::int, 'arroz-branco', 0.5::numeric, null),
('camarao-mediterraneo-meia', 6, 128::int, null, 0.02::numeric, null),
('camarao-mediterraneo-meia', 7, 41::int, null, 0.02::numeric, 'Cebola batida'),
('camarao-mediterraneo-meia', 8, 60::int, null, 0.001::numeric, null),
('camarao-mediterraneo-meia', 9, 166::int, null, 0.001::numeric, null),
('camarao-mediterraneo-meia', 10, 93::int, null, 0.001::numeric, null),
('camarao-mediterraneo-meia', 11, 51::int, null, 0.03::numeric, null),
('camarao-mediterraneo-inteira', 1, 7::int, null, 0.45::numeric, null),
('camarao-mediterraneo-inteira', 2, null::int, 'molho-branco', 1.0::numeric, null),
('camarao-mediterraneo-inteira', 3, 72::int, null, 0.18::numeric, 'Muçarela'),
('camarao-mediterraneo-inteira', 4, null::int, 'batata-palha', 0.08::numeric, null),
('camarao-mediterraneo-inteira', 5, null::int, 'arroz-branco', 0.7::numeric, null),
('camarao-mediterraneo-inteira', 6, 128::int, null, 0.03::numeric, null),
('camarao-mediterraneo-inteira', 7, 41::int, null, 0.03::numeric, 'Cebola batida'),
('camarao-mediterraneo-inteira', 8, 60::int, null, 0.001::numeric, null),
('camarao-mediterraneo-inteira', 9, 166::int, null, 0.002::numeric, null),
('camarao-mediterraneo-inteira', 10, 93::int, null, 0.002::numeric, null),
('camarao-mediterraneo-inteira', 11, 51::int, null, 0.06::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 1, 7::int, null, 0.1::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 2, 24::int, null, 0.4::numeric, 'filé de pescada'),
('moqueca-de-peixe-com-camarao-meia', 3, 57::int, null, 0.06::numeric, 'pimentão verde rodela'),
('moqueca-de-peixe-com-camarao-meia', 4, 58::int, null, 0.06::numeric, 'Pimentão vermelho rodela'),
('moqueca-de-peixe-com-camarao-meia', 5, 56::int, null, 0.06::numeric, 'Pimentão amarelo rodela'),
('moqueca-de-peixe-com-camarao-meia', 6, 41::int, null, 0.08::numeric, 'Cebola em rodelas'),
('moqueca-de-peixe-com-camarao-meia', 7, 65::int, null, 0.12::numeric, 'Tomate em rodelas'),
('moqueca-de-peixe-com-camarao-meia', 8, 106::int, null, 0.05::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 9, 44::int, null, 0.01::numeric, 'cheiro verde'),
('moqueca-de-peixe-com-camarao-meia', 10, 34::int, null, 0.015::numeric, 'alho batido'),
('moqueca-de-peixe-com-camarao-meia', 11, 47::int, null, 0.05::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 12, 83::int, null, 0.07::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 13, 121::int, null, 0.2::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 14, 110::int, null, 0.2::numeric, 'roux (engrossante)'),
('moqueca-de-peixe-com-camarao-meia', 15, 108::int, null, 0.05::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 16, null::int, 'consume-de-legumes', 1.5::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 17, 93::int, null, 0.003::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 18, 166::int, null, 0.003::numeric, null),
('moqueca-de-peixe-com-camarao-meia', 19, null::int, 'arroz-branco', 0.5::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 1, 7::int, null, 0.2::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 2, 24::int, null, 0.6::numeric, 'filé de pescada'),
('moqueca-de-peixe-com-camarao-inteira', 3, 57::int, null, 0.08::numeric, 'pimentão verde rodela'),
('moqueca-de-peixe-com-camarao-inteira', 4, 58::int, null, 0.08::numeric, 'Pimentão vermelho rodela'),
('moqueca-de-peixe-com-camarao-inteira', 5, 56::int, null, 0.08::numeric, 'Pimentão amarelo rodela'),
('moqueca-de-peixe-com-camarao-inteira', 6, 41::int, null, 0.12::numeric, 'Cebola em rodelas'),
('moqueca-de-peixe-com-camarao-inteira', 7, 65::int, null, 0.2::numeric, 'Tomate em rodelas'),
('moqueca-de-peixe-com-camarao-inteira', 8, 44::int, null, 0.01::numeric, 'cheiro verde'),
('moqueca-de-peixe-com-camarao-inteira', 9, 34::int, null, 0.02::numeric, 'alho batido'),
('moqueca-de-peixe-com-camarao-inteira', 10, 47::int, null, 0.3::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 11, 83::int, null, 0.07::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 12, 121::int, null, 0.2::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 13, 110::int, null, 0.2::numeric, 'roux (engrossante)'),
('moqueca-de-peixe-com-camarao-inteira', 14, 108::int, null, 0.05::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 15, null::int, 'consume-de-legumes', 1.5::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 16, 93::int, null, 0.007::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 17, 166::int, null, 0.003::numeric, null),
('moqueca-de-peixe-com-camarao-inteira', 18, null::int, 'arroz-branco', 0.5::numeric, null),
('santo-prazer-meia', 1, 7::int, null, 0.25::numeric, null),
('santo-prazer-meia', 2, null::int, 'molho-branco', 0.8::numeric, null),
('santo-prazer-meia', 3, 73::int, null, 0.1::numeric, null),
('santo-prazer-meia', 4, 51::int, null, 0.05::numeric, null),
('santo-prazer-meia', 5, 114::int, null, 0.25::numeric, 'Fattuccine'),
('santo-prazer-meia', 6, 128::int, null, 0.02::numeric, null),
('santo-prazer-meia', 7, 41::int, null, 0.02::numeric, 'Cebola batida'),
('santo-prazer-meia', 8, 60::int, null, 0.001::numeric, null),
('santo-prazer-meia', 9, 166::int, null, 0.001::numeric, null),
('santo-prazer-meia', 10, 93::int, null, 0.001::numeric, null),
('santo-prazer-meia', 11, 62::int, null, 0.06::numeric, 'Tomate confit'),
('santo-prazer-inteira', 1, 7::int, null, 0.45::numeric, null),
('santo-prazer-inteira', 2, null::int, 'molho-branco', 1.0::numeric, null),
('santo-prazer-inteira', 3, 73::int, null, 0.2::numeric, null),
('santo-prazer-inteira', 4, 51::int, null, 0.08::numeric, null),
('santo-prazer-inteira', 5, 114::int, null, 0.5::numeric, 'Fattuccine'),
('santo-prazer-inteira', 6, 128::int, null, 0.03::numeric, null),
('santo-prazer-inteira', 7, 41::int, null, 0.03::numeric, 'Cebola batida'),
('santo-prazer-inteira', 8, 60::int, null, 0.001::numeric, null),
('santo-prazer-inteira', 9, 166::int, null, 0.002::numeric, null),
('santo-prazer-inteira', 10, 93::int, null, 0.002::numeric, null),
('santo-prazer-inteira', 11, 62::int, null, 0.08::numeric, 'Tomate confit'),
('moqueca-de-peixe-meia', 1, 24::int, null, 0.4::numeric, 'filé de pescada'),
('moqueca-de-peixe-meia', 2, 57::int, null, 0.06::numeric, 'pimentão verde rodela'),
('moqueca-de-peixe-meia', 3, 58::int, null, 0.06::numeric, 'Pimentão vermelho rodela'),
('moqueca-de-peixe-meia', 4, 56::int, null, 0.06::numeric, 'Pimentão amarelo rodela'),
('moqueca-de-peixe-meia', 5, 41::int, null, 0.08::numeric, 'Cebola em rodelas'),
('moqueca-de-peixe-meia', 6, 65::int, null, 0.12::numeric, 'Tomate em rodelas'),
('moqueca-de-peixe-meia', 7, 106::int, null, 0.05::numeric, null),
('moqueca-de-peixe-meia', 8, 44::int, null, 0.01::numeric, 'cheiro verde'),
('moqueca-de-peixe-meia', 9, 34::int, null, 0.015::numeric, 'alho batido'),
('moqueca-de-peixe-meia', 10, 47::int, null, 0.05::numeric, null),
('moqueca-de-peixe-meia', 11, 83::int, null, 0.07::numeric, null),
('moqueca-de-peixe-meia', 12, 121::int, null, 0.2::numeric, null),
('moqueca-de-peixe-meia', 13, 110::int, null, 0.2::numeric, 'roux (engrossante)'),
('moqueca-de-peixe-meia', 14, 108::int, null, 0.05::numeric, null),
('moqueca-de-peixe-meia', 15, null::int, 'consume-de-legumes', 1.5::numeric, null),
('moqueca-de-peixe-meia', 16, 93::int, null, 0.003::numeric, null),
('moqueca-de-peixe-meia', 17, 166::int, null, 0.003::numeric, null),
('moqueca-de-peixe-meia', 18, null::int, 'arroz-branco', 0.5::numeric, null),
('moqueca-de-peixe-inteira', 1, 24::int, null, 0.6::numeric, 'filé de pescada'),
('moqueca-de-peixe-inteira', 2, 57::int, null, 0.08::numeric, 'pimentão verde rodela'),
('moqueca-de-peixe-inteira', 3, 58::int, null, 0.08::numeric, 'Pimentão vermelho rodela'),
('moqueca-de-peixe-inteira', 4, 56::int, null, 0.08::numeric, 'Pimentão amarelo rodela'),
('moqueca-de-peixe-inteira', 5, 41::int, null, 0.12::numeric, 'Cebola em rodelas'),
('moqueca-de-peixe-inteira', 6, 65::int, null, 0.2::numeric, 'Tomate em rodelas'),
('moqueca-de-peixe-inteira', 7, 106::int, null, 0.05::numeric, null),
('moqueca-de-peixe-inteira', 8, 44::int, null, 0.01::numeric, 'cheiro verde'),
('moqueca-de-peixe-inteira', 9, 34::int, null, 0.02::numeric, 'alho batido'),
('moqueca-de-peixe-inteira', 10, 47::int, null, 0.3::numeric, null),
('moqueca-de-peixe-inteira', 11, 83::int, null, 0.1::numeric, null),
('moqueca-de-peixe-inteira', 12, 121::int, null, 0.3::numeric, null),
('moqueca-de-peixe-inteira', 13, 110::int, null, 0.25::numeric, 'roux (engrossante)'),
('moqueca-de-peixe-inteira', 14, 108::int, null, 0.05::numeric, null),
('moqueca-de-peixe-inteira', 15, null::int, 'consume-de-legumes', 2.0::numeric, null),
('moqueca-de-peixe-inteira', 16, 93::int, null, 0.004::numeric, null),
('moqueca-de-peixe-inteira', 17, 166::int, null, 0.004::numeric, null),
('moqueca-de-peixe-inteira', 18, null::int, 'arroz-branco', 0.7::numeric, null),
('peixe-a-delicia-meia', 1, 18::int, null, 0.4::numeric, 'filé de pescada'),
('peixe-a-delicia-meia', 2, null::int, 'molho-branco', 0.3::numeric, null),
('peixe-a-delicia-meia', 3, 107::int, null, 0.2::numeric, null),
('peixe-a-delicia-meia', 4, 72::int, null, 0.12::numeric, 'muçarela'),
('peixe-a-delicia-meia', 5, 36::int, null, 0.5::numeric, null),
('peixe-a-delicia-meia', 6, null::int, 'arroz-branco', 0.3::numeric, null),
('peixe-a-delicia-meia', 7, 38::int, null, 0.2::numeric, 'batata gratinada'),
('peixe-a-delicia-meia', 8, 34::int, null, 0.001::numeric, null),
('peixe-a-delicia-meia', 9, 47::int, null, 0.3::numeric, null),
('peixe-a-delicia-meia', 10, 60::int, null, 0.001::numeric, null),
('peixe-a-delicia-meia', 11, 166::int, null, 0.003::numeric, null),
('peixe-a-delicia-inteira', 1, 18::int, null, 0.6::numeric, 'filé de pescada'),
('peixe-a-delicia-inteira', 2, null::int, 'molho-branco', 0.4::numeric, null),
('peixe-a-delicia-inteira', 3, 107::int, null, 0.3::numeric, null),
('peixe-a-delicia-inteira', 4, 72::int, null, 0.15::numeric, 'muçarela'),
('peixe-a-delicia-inteira', 5, 36::int, null, 0.7::numeric, null),
('peixe-a-delicia-inteira', 6, null::int, 'arroz-branco', 0.5::numeric, null),
('peixe-a-delicia-inteira', 7, 38::int, null, 0.4::numeric, 'batata gratinada'),
('peixe-a-delicia-inteira', 8, 34::int, null, 0.02::numeric, null),
('peixe-a-delicia-inteira', 9, 47::int, null, 0.4::numeric, null),
('peixe-a-delicia-inteira', 10, 60::int, null, 0.001::numeric, null),
('peixe-a-delicia-inteira', 11, 166::int, null, 0.005::numeric, null),
('tilapia-do-chef-meia', 1, 18::int, null, 0.4::numeric, null),
('tilapia-do-chef-meia', 2, 141::int, null, 2.0::numeric, 'Ovos'),
('tilapia-do-chef-meia', 3, 111::int, null, 0.07::numeric, null),
('tilapia-do-chef-meia', 4, 110::int, null, 0.03::numeric, null),
('tilapia-do-chef-meia', 5, null::int, 'arroz-com-brocolis', 0.5::numeric, null),
('tilapia-do-chef-meia', 6, null::int, 'pure-de-batata', 0.5::numeric, null),
('tilapia-do-chef-meia', 7, 119::int, null, 0.05::numeric, null),
('tilapia-do-chef-meia', 8, 166::int, null, 0.002::numeric, null),
('tilapia-do-chef-meia', 9, 47::int, null, 0.001::numeric, null),
('tilapia-do-chef-meia', 10, 93::int, null, 0.002::numeric, null),
('tilapia-do-chef-meia', 11, 34::int, null, 0.001::numeric, null),
('tilapia-do-chef-meia', 12, 60::int, null, 0.001::numeric, null),
('tilapia-do-chef-inteira', 1, 18::int, null, 0.6::numeric, null),
('tilapia-do-chef-inteira', 2, 141::int, null, 3.0::numeric, 'Ovos'),
('tilapia-do-chef-inteira', 3, 111::int, null, 0.1::numeric, null),
('tilapia-do-chef-inteira', 4, 110::int, null, 0.06::numeric, null),
('tilapia-do-chef-inteira', 5, null::int, 'arroz-com-brocolis', 0.7::numeric, null),
('tilapia-do-chef-inteira', 6, null::int, 'pure-de-batata', 0.7::numeric, null),
('tilapia-do-chef-inteira', 7, 119::int, null, 0.1::numeric, null),
('tilapia-do-chef-inteira', 8, 166::int, null, 0.003::numeric, null),
('tilapia-do-chef-inteira', 9, 47::int, null, 0.002::numeric, null),
('tilapia-do-chef-inteira', 10, 93::int, null, 0.003::numeric, null),
('tilapia-do-chef-inteira', 11, 34::int, null, 0.002::numeric, null),
('tilapia-do-chef-inteira', 12, 60::int, null, 0.001::numeric, null),
('salmao-meia', 1, 17::int, null, 0.4::numeric, null),
('salmao-meia', 2, 93::int, null, 0.002::numeric, null),
('salmao-meia', 3, null::int, 'arroz-com-brocolis', 0.5::numeric, null),
('salmao-meia', 4, null::int, 'pure-de-batata', 0.5::numeric, null),
('salmao-meia', 5, 78::int, null, 0.02::numeric, 'Molho de alcaparras'),
('salmao-meia', 6, 34::int, null, 0.001::numeric, null),
('salmao-meia', 7, 60::int, null, 0.001::numeric, null),
('salmao-meia', 8, 84::int, null, 0.02::numeric, null),
('salmao-inteira', 1, 17::int, null, 0.6::numeric, null),
('salmao-inteira', 2, 93::int, null, 0.003::numeric, null),
('salmao-inteira', 3, null::int, 'arroz-com-brocolis', 0.7::numeric, null),
('salmao-inteira', 4, null::int, 'pure-de-batata', 0.4::numeric, null),
('salmao-inteira', 5, 78::int, null, 0.04::numeric, 'Molho de alcaparras'),
('salmao-inteira', 6, 34::int, null, 0.002::numeric, null),
('salmao-inteira', 7, 60::int, null, 0.002::numeric, null),
('salmao-inteira', 8, 84::int, null, 0.03::numeric, null),
('biro-biro-meia', 1, 19::int, null, 0.4::numeric, 'Filé mignon em manta'),
('biro-biro-meia', 2, null::int, 'arroz-biro-biro-meia', 1.0::numeric, null),
('biro-biro-meia', 3, 60::int, null, 0.02::numeric, null),
('biro-biro-meia', 4, 166::int, null, 0.002::numeric, null),
('biro-biro-inteira', 1, 19::int, null, 0.6::numeric, 'Filé mignon em manta'),
('biro-biro-inteira', 2, null::int, 'arroz-biro-biro-inteira', 1.0::numeric, null),
('biro-biro-inteira', 3, 60::int, null, 0.02::numeric, null),
('biro-biro-inteira', 4, 166::int, null, 0.002::numeric, null),
('file-a-parmegiana-meia', 1, 19::int, null, 0.4::numeric, 'Filé mignon 4 fatias'),
('file-a-parmegiana-meia', 2, null::int, 'molho-de-tomate', 0.34::numeric, null),
('file-a-parmegiana-meia', 3, 72::int, null, 0.1::numeric, 'muçarela'),
('file-a-parmegiana-meia', 4, 141::int, null, 1.0::numeric, 'ovos'),
('file-a-parmegiana-meia', 5, 110::int, null, 0.03::numeric, null),
('file-a-parmegiana-meia', 6, null::int, 'arroz-branco', 0.4::numeric, null),
('file-a-parmegiana-meia', 7, null::int, 'batata-frita-temperada', 0.3::numeric, null),
('file-a-parmegiana-meia', 8, 119::int, null, 0.1::numeric, null),
('file-a-parmegiana-meia', 9, 166::int, null, 0.003::numeric, null),
('file-a-parmegiana-meia', 10, 60::int, null, 0.001::numeric, null),
('file-a-parmegiana-meia', 11, 111::int, null, 0.07::numeric, null),
('file-a-parmegiana-inteira', 1, 19::int, null, 0.6::numeric, 'Filé mignon 4 fatias'),
('file-a-parmegiana-inteira', 2, null::int, 'molho-de-tomate', 0.6::numeric, null),
('file-a-parmegiana-inteira', 3, 72::int, null, 0.2::numeric, 'muçarela'),
('file-a-parmegiana-inteira', 4, 141::int, null, 2.0::numeric, 'ovos'),
('file-a-parmegiana-inteira', 5, 110::int, null, 0.04::numeric, null),
('file-a-parmegiana-inteira', 6, null::int, 'arroz-branco', 0.7::numeric, null),
('file-a-parmegiana-inteira', 7, null::int, 'batata-frita-temperada', 0.5::numeric, null),
('file-a-parmegiana-inteira', 8, 119::int, null, 0.1::numeric, null),
('file-a-parmegiana-inteira', 9, 166::int, null, 0.005::numeric, null),
('file-a-parmegiana-inteira', 10, 60::int, null, 0.001::numeric, null),
('file-a-parmegiana-inteira', 11, 111::int, null, 0.07::numeric, null),
('carne-de-sol-do-sertao-meia', 1, 14::int, null, 0.2::numeric, 'Carne de sol desfiada'),
('carne-de-sol-do-sertao-meia', 2, 137::int, null, 0.15::numeric, null),
('carne-de-sol-do-sertao-meia', 3, null::int, 'molho-branco', 0.34::numeric, null),
('carne-de-sol-do-sertao-meia', 4, 119::int, null, 0.1::numeric, null),
('carne-de-sol-do-sertao-meia', 5, 126::int, null, 0.05::numeric, null),
('carne-de-sol-do-sertao-meia', 6, 71::int, null, 0.08::numeric, 'queijo coalho ralado'),
('carne-de-sol-do-sertao-meia', 7, 49::int, null, 0.1::numeric, 'mandioca frita'),
('carne-de-sol-do-sertao-meia', 8, 41::int, null, 0.02::numeric, 'cebola batida'),
('carne-de-sol-do-sertao-meia', 9, 71::int, null, 0.08::numeric, 'queijo coalho em cubos'),
('carne-de-sol-do-sertao-meia', 10, 60::int, null, 0.001::numeric, null),
('carne-de-sol-do-sertao-meia', 11, 166::int, null, 0.001::numeric, null),
('carne-de-sol-do-sertao-inteira', 1, 14::int, null, 0.3::numeric, 'Carne de sol desfiada'),
('carne-de-sol-do-sertao-inteira', 2, 137::int, null, 0.23::numeric, null),
('carne-de-sol-do-sertao-inteira', 3, null::int, 'molho-branco', 0.7::numeric, null),
('carne-de-sol-do-sertao-inteira', 4, 119::int, null, 0.2::numeric, null),
('carne-de-sol-do-sertao-inteira', 5, 126::int, null, 0.07::numeric, null),
('carne-de-sol-do-sertao-inteira', 6, 71::int, null, 0.15::numeric, 'queijo coalho ralado'),
('carne-de-sol-do-sertao-inteira', 7, 49::int, null, 0.2::numeric, 'mandioca frita'),
('carne-de-sol-do-sertao-inteira', 8, 41::int, null, 0.04::numeric, 'cebola batida'),
('carne-de-sol-do-sertao-inteira', 9, 71::int, null, 0.15::numeric, 'queijo coalho em cubos'),
('carne-de-sol-do-sertao-inteira', 10, 60::int, null, 0.001::numeric, null),
('carne-de-sol-do-sertao-inteira', 11, 166::int, null, 0.002::numeric, null),
('file-dos-deuses-meia', 1, 19::int, null, 0.4::numeric, null),
('file-dos-deuses-meia', 2, null::int, 'molho-branco', 0.8::numeric, null),
('file-dos-deuses-meia', 3, 73::int, null, 0.1::numeric, null),
('file-dos-deuses-meia', 4, 51::int, null, 0.05::numeric, null),
('file-dos-deuses-meia', 5, 114::int, null, 0.25::numeric, 'Fattuccine'),
('file-dos-deuses-meia', 6, 128::int, null, 0.02::numeric, null),
('file-dos-deuses-meia', 7, 41::int, null, 0.02::numeric, 'Cebola batida'),
('file-dos-deuses-meia', 8, 60::int, null, 0.001::numeric, null),
('file-dos-deuses-meia', 9, 166::int, null, 0.001::numeric, null),
('file-dos-deuses-meia', 10, 62::int, null, 0.06::numeric, 'Tomate confit'),
('file-dos-deuses-inteira', 1, 19::int, null, 0.6::numeric, null),
('file-dos-deuses-inteira', 2, null::int, 'molho-branco', 1.0::numeric, null),
('file-dos-deuses-inteira', 3, 73::int, null, 0.2::numeric, null),
('file-dos-deuses-inteira', 4, 51::int, null, 0.08::numeric, null),
('file-dos-deuses-inteira', 5, 114::int, null, 0.5::numeric, 'Fattuccine'),
('file-dos-deuses-inteira', 6, 128::int, null, 0.03::numeric, null),
('file-dos-deuses-inteira', 7, 41::int, null, 0.03::numeric, 'Cebola batida'),
('file-dos-deuses-inteira', 8, 60::int, null, 0.001::numeric, null),
('file-dos-deuses-inteira', 9, 166::int, null, 0.002::numeric, null),
('file-dos-deuses-inteira', 10, 62::int, null, 0.08::numeric, 'Tomate confit'),
('frango-a-parmegiana-meia', 1, 16::int, null, 0.4::numeric, null),
('frango-a-parmegiana-meia', 2, null::int, 'molho-de-tomate', 0.34::numeric, null),
('frango-a-parmegiana-meia', 3, 72::int, null, 0.1::numeric, 'muçarela'),
('frango-a-parmegiana-meia', 4, 141::int, null, 1.0::numeric, 'ovos'),
('frango-a-parmegiana-meia', 5, 110::int, null, 0.03::numeric, null),
('frango-a-parmegiana-meia', 6, null::int, 'arroz-branco', 0.4::numeric, null),
('frango-a-parmegiana-meia', 7, null::int, 'batata-frita-temperada', 0.3::numeric, null),
('frango-a-parmegiana-meia', 8, 119::int, null, 0.1::numeric, null),
('frango-a-parmegiana-meia', 9, 166::int, null, 0.003::numeric, null),
('frango-a-parmegiana-meia', 10, 60::int, null, 0.001::numeric, null),
('frango-a-parmegiana-meia', 11, 111::int, null, 0.07::numeric, null),
('frango-a-parmegiana-inteira', 1, 16::int, null, 0.6::numeric, null),
('frango-a-parmegiana-inteira', 2, null::int, 'molho-de-tomate', 0.6::numeric, null),
('frango-a-parmegiana-inteira', 3, 72::int, null, 0.2::numeric, 'muçarela'),
('frango-a-parmegiana-inteira', 4, 141::int, null, 2.0::numeric, 'ovos'),
('frango-a-parmegiana-inteira', 5, 110::int, null, 0.04::numeric, null),
('frango-a-parmegiana-inteira', 6, null::int, 'arroz-branco', 0.7::numeric, null),
('frango-a-parmegiana-inteira', 7, null::int, 'batata-frita-temperada', 0.5::numeric, null),
('frango-a-parmegiana-inteira', 8, 119::int, null, 0.1::numeric, null),
('frango-a-parmegiana-inteira', 9, 166::int, null, 0.003::numeric, null),
('frango-a-parmegiana-inteira', 10, 60::int, null, 0.001::numeric, null),
('frango-a-parmegiana-inteira', 11, 111::int, null, 0.1::numeric, null),
('picadinho-figueiredo-meia', 1, 19::int, null, 0.4::numeric, null),
('picadinho-figueiredo-meia', 2, null::int, 'molho-madeira', 0.8::numeric, null),
('picadinho-figueiredo-meia', 3, null::int, 'arroz-branco', 0.5::numeric, null),
('picadinho-figueiredo-meia', 4, 128::int, null, 0.02::numeric, null),
('picadinho-figueiredo-meia', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('picadinho-figueiredo-meia', 6, 60::int, null, 0.001::numeric, null),
('picadinho-figueiredo-meia', 7, 166::int, null, 0.001::numeric, null),
('picadinho-figueiredo-meia', 8, null::int, 'banana-a-milanesa', 0.2::numeric, null),
('picadinho-figueiredo-meia', 9, null::int, 'farofa-de-ovos', 1.0::numeric, 'Farofa de ovos porção'),
('picadinho-figueiredo-meia', 10, 101::int, null, 0.08::numeric, 'Champignon'),
('picadinho-figueiredo-inteira', 1, 19::int, null, 0.6::numeric, null),
('picadinho-figueiredo-inteira', 2, null::int, 'molho-madeira', 1.2::numeric, null),
('picadinho-figueiredo-inteira', 3, null::int, 'arroz-branco', 0.7::numeric, null),
('picadinho-figueiredo-inteira', 4, 128::int, null, 0.04::numeric, null),
('picadinho-figueiredo-inteira', 5, 41::int, null, 0.04::numeric, 'Cebola batida'),
('picadinho-figueiredo-inteira', 6, 60::int, null, 0.002::numeric, null),
('picadinho-figueiredo-inteira', 7, 166::int, null, 0.002::numeric, null),
('picadinho-figueiredo-inteira', 8, null::int, 'banana-a-milanesa', 0.4::numeric, null),
('picadinho-figueiredo-inteira', 9, null::int, 'farofa-de-ovos', 2.0::numeric, 'Farofa de ovos porção'),
('picadinho-figueiredo-inteira', 10, 101::int, null, 0.1::numeric, 'Champignon'),
('file-a-piamontese-meia', 1, 19::int, null, 0.4::numeric, null),
('file-a-piamontese-meia', 2, null::int, 'arroz-a-piamontese', 0.5::numeric, null),
('file-a-piamontese-meia', 3, null::int, 'molho-madeira', 0.3::numeric, null),
('file-a-piamontese-meia', 4, 152::int, null, 0.04::numeric, null),
('file-a-piamontese-meia', 5, 41::int, null, 0.02::numeric, 'Cebola batida'),
('file-a-piamontese-meia', 6, 128::int, null, 0.02::numeric, null),
('file-a-piamontese-meia', 7, 166::int, null, 0.003::numeric, 'Sal temperado'),
('file-a-piamontese-meia', 8, 60::int, null, 0.001::numeric, null),
('file-a-piamontese-meia', 9, 34::int, null, 0.003::numeric, 'Alho batido'),
('file-a-piamontese-inteira', 1, 19::int, null, 0.6::numeric, null),
('file-a-piamontese-inteira', 2, null::int, 'arroz-a-piamontese', 0.7::numeric, null),
('file-a-piamontese-inteira', 3, null::int, 'molho-madeira', 0.45::numeric, null),
('file-a-piamontese-inteira', 4, 152::int, null, 0.05::numeric, null),
('file-a-piamontese-inteira', 5, 41::int, null, 0.03::numeric, 'Cebola batida'),
('file-a-piamontese-inteira', 6, 128::int, null, 0.03::numeric, null),
('file-a-piamontese-inteira', 7, 166::int, null, 0.004::numeric, 'Sal temperado'),
('file-a-piamontese-inteira', 8, 60::int, null, 0.001::numeric, null),
('file-a-piamontese-inteira', 9, 34::int, null, 0.005::numeric, 'Alho batido'),
('picanha-na-parrilla', 1, 25::int, null, 0.5::numeric, 'Picanha fatiada'),
('picanha-na-parrilla', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('ancho-angus', 1, 1::int, null, 0.5::numeric, 'Picanha fatiada'),
('ancho-angus', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('chorizo-angus', 1, 10::int, null, 0.5::numeric, 'Picanha fatiada'),
('chorizo-angus', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('flat-iron-angus', 1, 20::int, null, 0.4::numeric, null),
('flat-iron-angus', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('flat-iron-angus', 3, 68::int, null, 0.08::numeric, null),
('flat-iron-angus', 4, null::int, 'molho-branco', 0.1::numeric, null),
('carne-de-sol-angus-cortes-nobres', 1, 13::int, null, 0.5::numeric, 'Carne de sol'),
('carne-de-sol-angus-cortes-nobres', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('carne-de-sol-angus-cortes-nobres', 3, 49::int, null, 0.3::numeric, null),
('costela-suina', 1, 12::int, null, 1.2::numeric, null),
('costela-suina', 2, null::int, 'arroz-a-piamontese', 0.6::numeric, 'Guarnição média'),
('costela-suina', 3, null::int, 'rub-suino', 0.08::numeric, null),
('cheese-bacon', 1, 168::int, null, 1.0::numeric, null),
('cheese-bacon', 2, 70::int, null, 0.05::numeric, 'Queijo cheedar'),
('cheese-bacon', 3, 125::int, null, 0.02::numeric, null),
('cheese-bacon', 4, 9::int, null, 0.18::numeric, null),
('cheese-bacon', 5, 67::int, null, 0.05::numeric, null),
('cheese-bacon', 6, null::int, 'batata-frita-com-ketchup-guarnicao', 2.0::numeric, null),
('risoto-de-camarao', 1, null::int, 'arroz-arboreo-pre-cozido', 0.2::numeric, null),
('risoto-de-camarao', 2, 7::int, null, 0.1::numeric, 'Camarão sem casca'),
('risoto-de-camarao', 3, 152::int, null, 0.08::numeric, null),
('risoto-de-camarao', 4, null::int, 'molho-branco', 0.01::numeric, null),
('risoto-de-camarao', 5, 34::int, null, 0.01::numeric, null),
('risoto-de-camarao', 6, 41::int, null, 0.03::numeric, null),
('risoto-de-camarao', 7, 73::int, null, 0.015::numeric, 'Parmesão finalização'),
('risoto-de-camarao', 8, 93::int, null, 0.015::numeric, null),
('risoto-de-camarao', 9, 84::int, null, 0.01::numeric, null),
('risoto-de-camarao', 10, null::int, 'molho-de-tomate', 0.06::numeric, null),
('risoto-de-camarao', 11, 73::int, null, 0.03::numeric, 'Parmesão ralado'),
('risoto-de-camarao', 12, null::int, 'consume-de-legumes', 0.05::numeric, null),
('risoto-de-camarao', 13, 166::int, null, 0.001::numeric, null),
('risoto-de-camarao', 14, 60::int, null, 0.001::numeric, null),
('risoto-de-file-mignon', 1, null::int, 'arroz-arboreo-pre-cozido', 0.2::numeric, null),
('risoto-de-file-mignon', 2, 19::int, null, 0.1::numeric, 'Filé Mingon'),
('risoto-de-file-mignon', 3, 152::int, null, 0.08::numeric, null),
('risoto-de-file-mignon', 4, null::int, 'molho-branco', 0.1::numeric, null),
('risoto-de-file-mignon', 5, 34::int, null, 0.01::numeric, null),
('risoto-de-file-mignon', 6, 41::int, null, 0.03::numeric, null),
('risoto-de-file-mignon', 7, 73::int, null, 0.015::numeric, 'Parmesão finalização'),
('risoto-de-file-mignon', 8, 84::int, null, 0.001::numeric, null),
('risoto-de-file-mignon', 9, 73::int, null, 0.03::numeric, 'Parmesão ralado'),
('risoto-de-file-mignon', 10, null::int, 'consume-de-legumes', 0.05::numeric, null),
('risoto-de-file-mignon', 11, 166::int, null, 0.001::numeric, null),
('risoto-de-file-mignon', 12, 60::int, null, 0.001::numeric, null),
('espaguete-de-abobrinha', 1, 29::int, null, 0.3::numeric, 'Espaguete de abobrinha crua (fitado)'),
('espaguete-de-abobrinha', 2, null::int, 'chips-de-batata-doce', 0.05::numeric, null),
('espaguete-de-abobrinha', 3, 115::int, null, 0.02::numeric, 'Funghi seco em cubos pequenos'),
('espaguete-de-abobrinha', 4, 60::int, null, 0.01::numeric, null),
('espaguete-de-abobrinha', 5, 62::int, null, 0.1::numeric, null),
('espaguete-de-abobrinha', 6, null::int, 'molho-de-tomate', 0.3::numeric, null),
('espaguete-de-abobrinha', 7, 41::int, null, 0.015::numeric, 'Cebola batida'),
('espaguete-de-abobrinha', 8, 34::int, null, 0.015::numeric, 'Alho batido'),
('espaguete-de-abobrinha', 9, 84::int, null, 0.05::numeric, 'Azeite de oliva'),
('espaguete-de-abobrinha', 10, 166::int, null, 0.001::numeric, 'sal temperado'),
('espaguete-de-abobrinha', 11, 51::int, null, 0.02::numeric, 'folha de manjericão'),
('parmegiana-de-beringela', 1, 39::int, null, 0.2::numeric, 'Beringela 2 fatias'),
('parmegiana-de-beringela', 2, 111::int, null, 0.022::numeric, null),
('parmegiana-de-beringela', 3, 110::int, null, 0.012::numeric, null),
('parmegiana-de-beringela', 4, 141::int, null, 1.0::numeric, null),
('parmegiana-de-beringela', 5, 119::int, null, 0.05::numeric, null),
('parmegiana-de-beringela', 6, null::int, 'molho-de-tomate', 0.2::numeric, null),
('parmegiana-de-beringela', 7, 72::int, null, 0.05::numeric, 'Queijo Muçarela'),
('parmegiana-de-beringela', 8, null::int, 'arroz-branco', 0.17::numeric, null),
('parmegiana-de-beringela', 9, null::int, 'batata-frita-com-ketchup-guarnicao', 1.0::numeric, null),
('parmegiana-de-beringela', 10, 60::int, null, 0.001::numeric, null),
('parmegiana-de-beringela', 11, 166::int, null, 0.001::numeric, null),
('risoto-de-funghi', 1, null::int, 'arroz-a-piamontese', 0.2::numeric, 'Arroz Arbóreo pré cozido'),
('risoto-de-funghi', 2, 115::int, null, 0.02::numeric, 'Funghi seco em cubos'),
('risoto-de-funghi', 3, 152::int, null, 0.08::numeric, null),
('risoto-de-funghi', 4, null::int, 'molho-branco', 0.01::numeric, null),
('risoto-de-funghi', 5, 34::int, null, 0.1::numeric, null),
('risoto-de-funghi', 6, 41::int, null, 0.3::numeric, null),
('risoto-de-funghi', 7, 73::int, null, 0.015::numeric, 'Parmesão finalização'),
('risoto-de-funghi', 8, 84::int, null, 0.001::numeric, null),
('risoto-de-funghi', 9, 73::int, null, 0.03::numeric, 'Parmesão ralado'),
('risoto-de-funghi', 10, null::int, 'consume-de-legumes', 0.05::numeric, null),
('risoto-de-funghi', 11, 166::int, null, 0.001::numeric, null),
('risoto-de-funghi', 12, 60::int, null, 0.001::numeric, null),
('petit-gateau', 1, 144::int, null, 1.0::numeric, 'Petit gateau'),
('petit-gateau', 2, 148::int, null, 0.095::numeric, null),
('petit-gateau', 3, 106::int, null, 0.08::numeric, null),
('petit-gateau', 4, 98::int, null, 0.05::numeric, null),
('pudim-de-ninho-com-nutella', 1, 120::int, null, 0.395::numeric, null),
('pudim-de-ninho-com-nutella', 2, 141::int, null, 6.0::numeric, 'ovos gema'),
('pudim-de-ninho-com-nutella', 3, 119::int, null, 0.395::numeric, null),
('pudim-de-ninho-com-nutella', 4, 122::int, null, 0.1::numeric, null),
('pudim-de-ninho-com-nutella', 5, 138::int, null, 0.05::numeric, null),
('brownie', 1, null::int, 'brownie-bolinho', 1.0::numeric, null),
('brownie', 2, 54::int, null, 0.08::numeric, null),
('brownie', 3, 106::int, null, 0.08::numeric, null),
('brownie', 4, 98::int, null, 0.05::numeric, null),
('brownie', 5, 148::int, null, 0.095::numeric, null),
('taca-de-brownie', 1, null::int, 'brownie-bolinho', 1.0::numeric, null),
('taca-de-brownie', 2, 54::int, null, 0.06::numeric, null),
('taca-de-brownie', 3, null::int, 'brigadeiro-meio-amargo', 0.08::numeric, null),
('taca-de-brownie', 4, 148::int, null, 0.38::numeric, null),
('taca-de-ninho-com-nutella-e-morango', 1, 54::int, null, 0.06::numeric, null),
('taca-de-ninho-com-nutella-e-morango', 2, 148::int, null, 0.38::numeric, null),
('taca-de-ninho-com-nutella-e-morango', 3, 138::int, null, 0.035::numeric, null),
('taca-de-ninho-com-nutella-e-morango', 4, 122::int, null, 0.04::numeric, null),
('creme-de-papaia-com-cassis', 1, 48::int, null, 0.12::numeric, null),
('creme-de-papaia-com-cassis', 2, 148::int, null, 0.285::numeric, null),
('creme-de-papaia-com-cassis', 3, 123::int, null, 0.05::numeric, null),
('picanha', 1, 25::int, null, 0.15::numeric, 'Steak de picanha'),
('picanha', 2, null::int, 'arroz-branco', 0.17::numeric, null),
('picanha', 3, null::int, 'feijao-tropeiro', 0.1::numeric, null),
('picanha', 4, null::int, 'salada-do-executivo', 1.0::numeric, null),
('picanha', 5, null::int, 'batata-frita-com-ketchup-guarnicao', 1.0::numeric, null),
('file-a-parmegiana', 1, 19::int, null, 0.1::numeric, null),
('file-a-parmegiana', 2, 111::int, null, 0.085::numeric, null),
('file-a-parmegiana', 3, 110::int, null, 0.012::numeric, null),
('file-a-parmegiana', 4, 141::int, null, 1.0::numeric, null),
('file-a-parmegiana', 5, 119::int, null, 0.05::numeric, null),
('file-a-parmegiana', 6, null::int, 'molho-de-tomate', 0.2::numeric, null),
('file-a-parmegiana', 7, 72::int, null, 0.05::numeric, 'Queijo Muçarela'),
('file-a-parmegiana', 8, null::int, 'arroz-branco', 0.17::numeric, null),
('file-a-parmegiana', 9, null::int, 'batata-frita-com-ketchup-guarnicao', 1.0::numeric, null),
('file-a-parmegiana', 10, 60::int, null, 0.001::numeric, null),
('file-a-parmegiana', 11, 166::int, null, 0.001::numeric, null),
('frango-a-parmegiana', 1, 16::int, null, 0.1::numeric, null),
('frango-a-parmegiana', 2, 111::int, null, 0.022::numeric, null),
('frango-a-parmegiana', 3, 110::int, null, 0.012::numeric, null),
('frango-a-parmegiana', 4, 141::int, null, 1.0::numeric, null),
('frango-a-parmegiana', 5, 119::int, null, 0.05::numeric, null),
('frango-a-parmegiana', 6, null::int, 'molho-de-tomate', 0.2::numeric, null),
('frango-a-parmegiana', 7, 72::int, null, 0.05::numeric, 'Queijo Muçarela'),
('frango-a-parmegiana', 8, null::int, 'arroz-branco', 0.17::numeric, null),
('frango-a-parmegiana', 9, null::int, 'batata-frita-com-ketchup-guarnicao', 1.0::numeric, null),
('frango-a-parmegiana', 10, 60::int, null, 0.001::numeric, null),
('frango-a-parmegiana', 11, 166::int, null, 0.001::numeric, null),
('file-de-frango-grelhado', 1, 16::int, null, 0.2::numeric, 'Filé de peito grelhado'),
('file-de-frango-grelhado', 2, null::int, 'arroz-com-brocolis', 0.17::numeric, null),
('file-de-frango-grelhado', 3, null::int, 'salada-do-executivo', 1.0::numeric, null),
('file-de-frango-grelhado', 4, null::int, 'pure-de-batata', 0.1::numeric, null),
('tilapia', 1, 18::int, null, 0.15::numeric, null),
('tilapia', 2, 111::int, null, 0.02::numeric, null),
('tilapia', 3, 141::int, null, 1.0::numeric, null),
('tilapia', 4, 119::int, null, 0.05::numeric, null),
('tilapia', 5, 110::int, null, 0.01::numeric, null),
('tilapia', 6, 166::int, null, 0.001::numeric, null),
('tilapia', 7, 93::int, null, 0.001::numeric, null),
('tilapia', 8, 34::int, null, 0.001::numeric, 'Alho batido'),
('tilapia', 9, 60::int, null, 0.001::numeric, null),
('tilapia', 10, null::int, 'arroz-com-brocolis', 0.17::numeric, null),
('tilapia', 11, 47::int, null, 0.0::numeric, null),
('tilapia', 12, null::int, 'pure-de-batata', 0.23::numeric, null),
('carne-de-sol-do-sertao', 1, 13::int, null, 0.1::numeric, 'Carne de sol desfiada'),
('carne-de-sol-do-sertao', 2, 137::int, null, 0.04::numeric, null),
('carne-de-sol-do-sertao', 3, null::int, 'molho-branco', 0.04::numeric, null),
('carne-de-sol-do-sertao', 4, 119::int, null, 0.04::numeric, null),
('carne-de-sol-do-sertao', 5, 126::int, null, 0.02::numeric, null),
('carne-de-sol-do-sertao', 6, 71::int, null, 0.03::numeric, 'queijo coalho ralado'),
('carne-de-sol-do-sertao', 7, 49::int, null, 0.08::numeric, 'mandioca frita'),
('carne-de-sol-do-sertao', 8, 41::int, null, 0.01::numeric, 'cebola batida'),
('carne-de-sol-do-sertao', 9, 71::int, null, 0.05::numeric, 'queijo coalho em cubos'),
('carne-de-sol-do-sertao', 10, 60::int, null, 0.001::numeric, null),
('carne-de-sol-do-sertao', 11, 166::int, null, 0.001::numeric, null),
('carne-de-sol-do-sertao', 12, null::int, 'arroz-branco', 0.2::numeric, null),
('salmao', 1, 17::int, null, 0.15::numeric, null),
('salmao', 2, null::int, 'arroz-com-brocolis', 0.17::numeric, null),
('salmao', 3, 47::int, null, 0.0::numeric, null),
('salmao', 4, null::int, 'banana-a-milanesa', 0.12::numeric, null),
('salmao', 5, 60::int, null, 0.001::numeric, null),
('salmao', 6, null::int, 'pure-de-batata', 0.2::numeric, null),
('salmao', 7, 166::int, null, 0.002::numeric, null),
('santo-prazer', 1, 7::int, null, 0.1::numeric, null),
('santo-prazer', 2, null::int, 'molho-branco', 0.1::numeric, null),
('santo-prazer', 3, 73::int, null, 0.04::numeric, null),
('santo-prazer', 4, 50::int, null, 0.05::numeric, null),
('santo-prazer', 5, 114::int, null, 0.2::numeric, 'Fattuccine'),
('santo-prazer', 6, 128::int, null, 0.02::numeric, null),
('santo-prazer', 7, 41::int, null, 0.02::numeric, 'Cebola batida'),
('santo-prazer', 8, 60::int, null, 0.001::numeric, null),
('santo-prazer', 9, 166::int, null, 0.001::numeric, null),
('santo-prazer', 10, 93::int, null, 0.001::numeric, null),
('santo-prazer', 11, 62::int, null, 0.03::numeric, 'Tomate confit'),
('file-dos-deuses', 1, 19::int, null, 0.1::numeric, null),
('file-dos-deuses', 2, null::int, 'molho-branco', 0.1::numeric, null),
('file-dos-deuses', 3, 73::int, null, 0.05::numeric, null),
('file-dos-deuses', 4, 50::int, null, 0.05::numeric, null),
('file-dos-deuses', 5, 114::int, null, 0.2::numeric, 'Fattuccine'),
('file-dos-deuses', 6, 128::int, null, 0.02::numeric, null),
('file-dos-deuses', 7, 41::int, null, 0.02::numeric, 'Cebola batida'),
('file-dos-deuses', 8, 60::int, null, 0.001::numeric, null),
('file-dos-deuses', 9, 166::int, null, 0.001::numeric, null),
('file-dos-deuses', 10, 62::int, null, 0.06::numeric, 'Tomate confit'),
('costelinha-suina', 1, 12::int, null, 0.3::numeric, 'Costela – parte de Costela suína (preparo)'),
('costelinha-suina', 2, null::int, 'arroz-a-piamontese', 0.15::numeric, 'Guarnição média – parte de Costela suína (preparo)'),
('costelinha-suina', 3, null::int, 'rub-suino', 0.02::numeric, 'Rub – parte de Costela suína (preparo)'),
('costelinha-suina', 4, null::int, 'arroz-branco', 0.17::numeric, null),
('costelinha-suina', 5, null::int, 'batata-frita-com-ketchup-guarnicao', 1.0::numeric, null),
('costelinha-suina', 6, 95::int, null, 0.07::numeric, 'Barbecue'),
('camarao-figueiredo', 1, 7::int, null, 0.1::numeric, null),
('camarao-figueiredo', 2, 69::int, null, 0.04::numeric, 'Presunto em cubos'),
('camarao-figueiredo', 3, null::int, 'molho-branco', 0.1::numeric, null),
('camarao-figueiredo', 4, 72::int, null, 0.04::numeric, 'Muçarela'),
('camarao-figueiredo', 5, null::int, 'batata-palha', 0.03::numeric, null),
('camarao-figueiredo', 6, null::int, 'arroz-branco', 0.2::numeric, null),
('camarao-figueiredo', 7, 128::int, null, 0.01::numeric, null),
('camarao-figueiredo', 8, 41::int, null, 0.01::numeric, 'Cebola batida'),
('camarao-figueiredo', 9, 60::int, null, 0.001::numeric, null),
('camarao-figueiredo', 10, 166::int, null, 0.001::numeric, null),
('camarao-figueiredo', 11, 93::int, null, 0.001::numeric, null),
('picadinho-figueiredo', 1, 19::int, null, 0.1::numeric, null),
('picadinho-figueiredo', 2, null::int, 'molho-madeira', 0.1::numeric, null),
('picadinho-figueiredo', 3, null::int, 'arroz-branco', 0.17::numeric, null),
('picadinho-figueiredo', 4, 128::int, null, 0.01::numeric, null),
('picadinho-figueiredo', 5, 41::int, null, 0.01::numeric, 'Cebola batida'),
('picadinho-figueiredo', 6, 60::int, null, 0.001::numeric, null),
('picadinho-figueiredo', 7, 166::int, null, 0.001::numeric, null),
('picadinho-figueiredo', 8, null::int, 'banana-a-milanesa', 0.1::numeric, null),
('picadinho-figueiredo', 9, null::int, 'farofa-de-ovos', 1.0::numeric, 'Farofa de ovos porção'),
('picadinho-figueiredo', 10, 101::int, null, 0.03::numeric, 'Champignon'),
('tilapia-com-legumes', 1, 18::int, null, 0.15::numeric, null),
('tilapia-com-legumes', 2, null::int, 'pure-de-batata', 0.1::numeric, null),
('tilapia-com-legumes', 3, null::int, 'legumes-cozidos', 0.1::numeric, null),
('tilapia-com-legumes', 4, 84::int, null, 0.02::numeric, null)
) v(slug, ordem, codigo, sub_slug, qtd, obs)
join receitas r on r.slug = v.slug and r.empresa_id = (select id from empresas where slug = 'figueiredo')
left join insumos i on i.codigo = v.codigo and i.empresa_id = (select id from empresas where slug = 'figueiredo')
left join receitas s on s.slug = v.sub_slug and s.empresa_id = (select id from empresas where slug = 'figueiredo');

-- cardápio (salão)
insert into cardapio_itens (empresa_id, categoria, nome, canal, receita_id, preco_venda, custo_manual, ordem)
select (select id from empresas where slug = 'figueiredo'), v.cat, v.nome, v.canal::canal_venda, r.id, v.preco, v.manual, v.ordem from (values
('Petiscos', 'Pastel de Camarão', 'pastel-de-camarao', 'salao', 54.9::numeric, null::numeric, 1),
('Petiscos', 'Pastelzinho de carne', 'pastelzinho-de-carne', 'salao', 44.9::numeric, null::numeric, 2),
('Petiscos', 'Pastelzinho de queijo', 'pastelzinho-de-queijo', 'salao', 44.9::numeric, null::numeric, 3),
('Petiscos', 'Coxinha Figueiredo', 'coxinha-figueiredo', 'salao', 46.9::numeric, null::numeric, 4),
('Petiscos', 'Batata Especial', 'batata-especial', 'salao', 52.9::numeric, null::numeric, 5),
('Petiscos', 'Batata Frita', 'batata-frita', 'salao', 32.9::numeric, null::numeric, 6),
('Petiscos', 'Batata Figueiredo', 'batata-figueiredo', 'salao', 49.9::numeric, null::numeric, 7),
('Petiscos', 'Camarão alho e oleo', 'camarao-alho-e-oleo', 'salao', 84.9::numeric, null::numeric, 8),
('Petiscos', 'Camarão a milanesa', 'camarao-a-milanesa', 'salao', 89.9::numeric, null::numeric, 9),
('Petiscos', 'CHAPINHA FIGUEIREDO', 'chapinha-figueiredo', 'salao', 84.9::numeric, null::numeric, 10),
('Petiscos', 'Isca de peixe', 'isca-de-peixe', 'salao', 74.9::numeric, null::numeric, 11),
('Petiscos', 'Frango a passarinho', 'frango-a-passarinho', 'salao', 42.9::numeric, null::numeric, 12),
('Petiscos', 'Combinado', 'combinado', 'salao', 89.9::numeric, null::numeric, 13),
('Petiscos', 'Panceta defumada', 'panceta-defumada', 'salao', 54.9::numeric, null::numeric, 14),
('Petiscos', 'Carne de sol Angus', 'carne-de-sol-angus', 'salao', 94.9::numeric, null::numeric, 15),
('Petiscos', 'Filé ao molho de queijo', 'file-ao-molho-de-queijo', 'salao', 99.9::numeric, null::numeric, 16),
('Petiscos', 'Filé ao molho madeira', 'file-ao-molho-madeira', 'salao', 99.9::numeric, null::numeric, 17),
('Petiscos', 'TERRA E MAR', 'terra-e-mar', 'salao', 99.9::numeric, null::numeric, 18),
('Petiscos', 'Pão de alho artesanal', 'pao-de-alho-artesanal', 'salao', 16.9::numeric, null::numeric, 19),
('Petiscos', 'CROQUETE DE FRANGO', null, 'salao', 42.9::numeric, 8.31::numeric, 20),
('Petiscos', 'CROQUETE DE TILAPIA', null, 'salao', 49.9::numeric, 17.51::numeric, 21),
('Petiscos', 'Queijo Coalho', 'queijo-coalho', 'salao', 49.9::numeric, null::numeric, 22),
('Entradas', 'Brusqueta de camarão', 'brusqueta-de-camarao', 'salao', 44.9::numeric, null::numeric, 23),
('Entradas', 'Ceviche de tilápia', 'ceviche-de-tilapia', 'salao', 49.9::numeric, null::numeric, 24),
('Saladas', 'Salada Caesar', 'salada-caesar', 'salao', 36.9::numeric, null::numeric, 25),
('Saladas', 'Salada Ligth', 'salada-ligth', 'salao', 39.9::numeric, null::numeric, 26),
('Saladas', 'Salada mar', 'salada-mar', 'salao', 41.9::numeric, null::numeric, 27),
('Frutos do mar', 'Camarão Figueiredo meia', 'camarao-figueiredo-meia', 'salao', 109.9::numeric, null::numeric, 28),
('Frutos do mar', 'Camarão Figueiredo Inteira', 'camarao-figueiredo-inteira', 'salao', 199.9::numeric, null::numeric, 29),
('Frutos do mar', 'Camarão Delícia meia', 'camarao-delicia-meia', 'salao', 129.9::numeric, null::numeric, 30),
('Frutos do mar', 'Camarão Delícia inteira', 'camarao-delicia-inteira', 'salao', 219.9::numeric, null::numeric, 31),
('Frutos do mar', 'CAMARÃO PORO MEIA', 'camarao-poro-meia', 'salao', 119.9::numeric, null::numeric, 32),
('Frutos do mar', 'CAMARÃO PORÓ INTEIRA', 'camarao-poro-inteira', 'salao', 209.9::numeric, null::numeric, 33),
('Frutos do mar', 'Camarão Imperador meia', 'camarao-imperador-meia', 'salao', 199.9::numeric, null::numeric, 34),
('Frutos do mar', 'Camarão Imperador inteira', 'camarao-imperador-inteira', 'salao', 349.9::numeric, null::numeric, 35),
('Frutos do mar', 'Camarão mediterrâneo meia', 'camarao-mediterraneo-meia', 'salao', 109.9::numeric, null::numeric, 36),
('Frutos do mar', 'Camarão mediterrâneo inteira', 'camarao-mediterraneo-inteira', 'salao', 199.9::numeric, null::numeric, 37),
('Frutos do mar', 'Moqueca de peixe com camarão meia', 'moqueca-de-peixe-com-camarao-meia', 'salao', 149.9::numeric, null::numeric, 38),
('Frutos do mar', 'Moqueca de peixe com camarão inteira', 'moqueca-de-peixe-com-camarao-inteira', 'salao', 249.9::numeric, null::numeric, 39),
('Frutos do mar', 'Santo prazer meia', 'santo-prazer-meia', 'salao', 129.9::numeric, null::numeric, 40),
('Frutos do mar', 'Santo prazer Inteira', 'santo-prazer-inteira', 'salao', 219.9::numeric, null::numeric, 41),
('Frutos do mar', 'TILAPIA FIGUEIREDO 2P', null, 'salao', 119.9::numeric, 36.1::numeric, 42),
('Peixes', 'Moqueca de peixe meia', 'moqueca-de-peixe-meia', 'salao', 129.9::numeric, null::numeric, 43),
('Peixes', 'Moqueca de peixe inteira', 'moqueca-de-peixe-inteira', 'salao', 229.9::numeric, null::numeric, 44),
('Peixes', 'Peixe à delícia meia', 'peixe-a-delicia-meia', 'salao', 119.9::numeric, null::numeric, 45),
('Peixes', 'Peixe à delícia inteira', 'peixe-a-delicia-inteira', 'salao', 219.9::numeric, null::numeric, 46),
('Peixes', 'Tilápia do chef meia', 'tilapia-do-chef-meia', 'salao', 109.9::numeric, null::numeric, 47),
('Peixes', 'Tilápia do chef inteira', 'tilapia-do-chef-inteira', 'salao', 199.9::numeric, null::numeric, 48),
('Peixes', 'Salmão meia', 'salmao-meia', 'salao', 139.9::numeric, null::numeric, 49),
('Peixes', 'Salmão inteira', 'salmao-inteira', 'salao', 239.9::numeric, null::numeric, 50),
('Peixes', 'TILAPIA AO MOLHO DE LIMAO SICILIANO MEIA', null, 'salao', 109.9::numeric, 37.59::numeric, 51),
('Peixes', 'TILAPIA AO MOLHO DE LIMAO SICILIANO INTEIRA', null, 'salao', 199.9::numeric, 54.87::numeric, 52),
('Tradicionais', 'Biro Biro meia', 'biro-biro-meia', 'salao', 139.9::numeric, null::numeric, 53),
('Tradicionais', 'Biro Biro inteira', 'biro-biro-inteira', 'salao', 239.9::numeric, null::numeric, 54),
('Tradicionais', 'Filé a parmegiana meia', 'file-a-parmegiana-meia', 'salao', 139.9::numeric, null::numeric, 55),
('Tradicionais', 'Filé a parmegiana inteira', 'file-a-parmegiana-inteira', 'salao', 239.9::numeric, null::numeric, 56),
('Tradicionais', 'Carne de sol do sertão meia', 'carne-de-sol-do-sertao-meia', 'salao', 109.9::numeric, null::numeric, 57),
('Tradicionais', 'Carne de sol do sertão inteira', 'carne-de-sol-do-sertao-inteira', 'salao', 199.9::numeric, null::numeric, 58),
('Tradicionais', 'Filé dos Deuses meia', 'file-dos-deuses-meia', 'salao', 129.9::numeric, null::numeric, 59),
('Tradicionais', 'Filé dos Deuses inteira', 'file-dos-deuses-inteira', 'salao', 219.9::numeric, null::numeric, 60),
('Tradicionais', 'Frango a parmegiana meia', 'frango-a-parmegiana-meia', 'salao', 109.9::numeric, null::numeric, 61),
('Tradicionais', 'Frango a parmegiana inteira', 'frango-a-parmegiana-inteira', 'salao', 199.9::numeric, null::numeric, 62),
('Tradicionais', 'Picadinho Figueiredo meia', 'picadinho-figueiredo-meia', 'salao', 139.9::numeric, null::numeric, 63),
('Tradicionais', 'Picadinho Figueiredo inteira', 'picadinho-figueiredo-inteira', 'salao', 239.9::numeric, null::numeric, 64),
('Tradicionais', 'Filé a piamontese meia', 'file-a-piamontese-meia', 'salao', 139.9::numeric, null::numeric, 65),
('Tradicionais', 'Filé a piamontese inteira', 'file-a-piamontese-inteira', 'salao', 239.9::numeric, null::numeric, 66),
('Tradicionais', 'CARNE DE SOL FIGUEIREDO MEIA', null, 'salao', 119.9::numeric, 34.74::numeric, 67),
('Tradicionais', 'CARNE DE SOL FIGUEIREDO INTEIRA', null, 'salao', 209.9::numeric, 57.12::numeric, 68),
('Cortes nobres', 'Picanha na parrilla', 'picanha-na-parrilla', 'salao', 169.9::numeric, null::numeric, 69),
('Cortes nobres', 'Ancho angus', 'ancho-angus', 'salao', 149.9::numeric, null::numeric, 70),
('Cortes nobres', 'Chorizo Angus', 'chorizo-angus', 'salao', 139.9::numeric, null::numeric, 71),
('Cortes nobres', 'Flat Iron angus', 'flat-iron-angus', 'salao', 129.9::numeric, null::numeric, 72),
('Cortes nobres', 'Carne de sol Angus', 'carne-de-sol-angus-cortes-nobres', 'salao', 139.9::numeric, null::numeric, 73),
('Cortes nobres', 'Costela suína', 'costela-suina', 'salao', 129.9::numeric, null::numeric, 74),
('Burger', 'CHEESE BACON', 'cheese-bacon', 'salao', 39.9::numeric, null::numeric, 75),
('Burger', 'CHESSE BURGUER', null, 'salao', null::numeric, null::numeric, 76),
('Risotos', 'Risoto de camarão', 'risoto-de-camarao', 'salao', 59.9::numeric, null::numeric, 77),
('Risotos', 'Risoto de filé mignon', 'risoto-de-file-mignon', 'salao', 59.9::numeric, null::numeric, 78),
('Vegetarianos', 'Espaguete de Abobrinha', 'espaguete-de-abobrinha', 'salao', 29.9::numeric, null::numeric, 79),
('Vegetarianos', 'Parmegiana de beringela', 'parmegiana-de-beringela', 'salao', 29.9::numeric, null::numeric, 80),
('Vegetarianos', 'Risoto de funghi', 'risoto-de-funghi', 'salao', 49.9::numeric, null::numeric, 81),
('Sobremesas', 'Petit Gateau', 'petit-gateau', 'salao', 29.9::numeric, null::numeric, 82),
('Sobremesas', 'Pudim de ninho com nutella', 'pudim-de-ninho-com-nutella', 'salao', 24.9::numeric, null::numeric, 83),
('Sobremesas', 'Brownie', 'brownie', 'salao', 29.9::numeric, null::numeric, 84),
('Sobremesas', 'Taça de Brownie', 'taca-de-brownie', 'salao', 39.9::numeric, null::numeric, 85),
('Sobremesas', 'Taça de ninho com nutella e morango', 'taca-de-ninho-com-nutella-e-morango', 'salao', 39.9::numeric, null::numeric, 86),
('Sobremesas', 'Creme de papaia com cassis', 'creme-de-papaia-com-cassis', 'salao', 29.9::numeric, null::numeric, 87),
('Sobremesas', 'Café espresso', null, 'salao', 5.9::numeric, 1.62::numeric, 88),
('Executivos', 'Picanha', 'picanha', 'salao', 59.9::numeric, null::numeric, 89),
('Executivos', 'Filé a parmegiana', 'file-a-parmegiana', 'salao', 49.9::numeric, null::numeric, 90),
('Executivos', 'Frango a parmegiana', 'frango-a-parmegiana', 'salao', 39.9::numeric, null::numeric, 91),
('Executivos', 'Filé de frango grelhado', 'file-de-frango-grelhado', 'salao', 37.9::numeric, null::numeric, 92),
('Executivos', 'Tilápia', 'tilapia', 'salao', 42.9::numeric, null::numeric, 93),
('Executivos', 'Carne de sol do sertão', 'carne-de-sol-do-sertao', 'salao', 44.9::numeric, null::numeric, 94),
('Executivos', 'Salmão', 'salmao', 'salao', 64.9::numeric, null::numeric, 95),
('Executivos', 'Santo prazer', 'santo-prazer', 'salao', 49.9::numeric, null::numeric, 96),
('Executivos', 'Filé dos Deuses', 'file-dos-deuses', 'salao', 49.9::numeric, null::numeric, 97),
('Executivos', 'Costelinha suína', 'costelinha-suina', 'salao', 39.9::numeric, null::numeric, 98),
('Executivos', 'Camarão figueiredo', 'camarao-figueiredo', 'salao', 47.9::numeric, null::numeric, 99),
('Executivos', 'Picadinho Figueiredo', 'picadinho-figueiredo', 'salao', 49.9::numeric, null::numeric, 100),
('Executivos', 'Tilápia com legumes', 'tilapia-com-legumes', 'salao', 37.9::numeric, null::numeric, 101),
('Executivos', 'Espaguete de abobrinha', 'espaguete-de-abobrinha', 'salao', 39.9::numeric, null::numeric, 102),
('Executivos', 'Parmegiana de beringela', 'parmegiana-de-beringela', 'salao', 34.9::numeric, null::numeric, 103),
('Executivos', 'Risoto de camarão', 'risoto-de-camarao', 'salao', 64.9::numeric, null::numeric, 104),
('Executivos', 'Risoto de funghi', 'risoto-de-funghi', 'salao', 54.9::numeric, null::numeric, 105),
('Executivos', 'Risoto de filé mignon', 'risoto-de-file-mignon', 'salao', 64.9::numeric, null::numeric, 106),
('Executivos', 'Carne de sol angus', null, 'salao', 37.9::numeric, 11.81::numeric, 107),
('Executivos', 'CARNE DE SOL FIGUEIREDO', null, 'salao', 44.9::numeric, 12.93::numeric, 108),
('Executivos', 'CAMARÃO PORO', null, 'salao', 47.9::numeric, 10.67::numeric, 109),
('Executivos', 'ANCHO', null, 'salao', 69.9::numeric, 20.45::numeric, 110),
('Executivos', 'CHORIZO', null, 'salao', null::numeric, null::numeric, 111)
) v(cat, nome, slug, canal, preco, manual, ordem)
left join receitas r on r.slug = v.slug and r.empresa_id = (select id from empresas where slug = 'figueiredo');

-- pendências a confirmar
insert into pendencias (empresa_id, tipo, onde, detalhe, impacto) values
((select id from empresas where slug = 'figueiredo'), 'Insumo sem preço', 'INSUMOS › COSTELA BOVINA KG', 'Está com preço zero e é usado em: Batata Figueiredo. O custo dessas receitas está subestimado até o preço ser preenchido.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo sem preço', 'INSUMOS › Licor de cassis', 'Está com preço zero e é usado em: Creme de papaia com cassis. O custo dessas receitas está subestimado até o preço ser preenchido.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo sem preço', 'INSUMOS › TENTÁCULOS DE POLVO', 'Está com preço zero e é usado em: Ceviche de tilápia. O custo dessas receitas está subestimado até o preço ser preenchido.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo sem preço', 'INSUMOS › alcaparras 2KG', 'Está com preço zero e é usado em: Salmão inteira, Salmão meia. O custo dessas receitas está subestimado até o preço ser preenchido.', null),
((select id from empresas where slug = 'figueiredo'), 'Preço a conferir', 'INSUMOS › Catchup cepêra galao 3,5kg', 'R$ 26,00 parece ser o preço do galão, não do kg. Como as fichas multiplicam por kg, o custo do ketchup sai alto.', null),
((select id from empresas where slug = 'figueiredo'), 'Preço a conferir', 'INSUMOS › arroz PCT 5KG', 'O preço (R$ 21,50) é do pacote de 5 kg (R$ 4,30 por kg). Confirme o valor atual.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo a conferir', 'Coxinha Figueiredo › cominho', 'Cominho não está cadastrado; por enquanto a ficha usa o preço da noz-moscada em pó. Cadastre o cominho e troque na ficha.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo a conferir', 'Camarão Poró (meia e inteira) › manteiga', 'A ficha usa o preço da margarina para "manteiga". Se for manteiga de verdade, troque pelo insumo certo.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo a conferir', 'Consumê de legumes › alho poró', 'Alho-poró não está cadastrado; por enquanto a ficha usa o preço do salsão. Cadastre o alho-poró e troque na ficha.', null),
((select id from empresas where slug = 'figueiredo'), 'Insumo a conferir', 'Arroz biro biro › batata palha', 'A ficha usa o preço da batata inglesa crua. Se for a batata palha pronta, troque pelo preparo "Batata palha".', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Petiscos › CROQUETE DE FRANGO', 'Usa custo informado manualmente (R$ 8,31), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Petiscos › CROQUETE DE TILAPIA', 'Usa custo informado manualmente (R$ 17,51), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Frutos do mar › TILAPIA FIGUEIREDO 2P', 'Usa custo informado manualmente (R$ 36,10), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Peixes › TILAPIA AO MOLHO DE LIMAO SICILIANO MEIA', 'Usa custo informado manualmente (R$ 37,59), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Peixes › TILAPIA AO MOLHO DE LIMAO SICILIANO INTEIRA', 'Usa custo informado manualmente (R$ 54,87), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Tradicionais › CARNE DE SOL FIGUEIREDO MEIA', 'Usa custo informado manualmente (R$ 34,74), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Tradicionais › CARNE DE SOL FIGUEIREDO INTEIRA', 'Usa custo informado manualmente (R$ 57,12), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Sobremesas › Café espresso', 'Usa custo informado manualmente (R$ 1,62), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Executivos › Carne de sol angus', 'Usa custo informado manualmente (R$ 11,81), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Executivos › CARNE DE SOL FIGUEIREDO', 'Usa custo informado manualmente (R$ 12,93), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Executivos › CAMARÃO PORO', 'Usa custo informado manualmente (R$ 10,67), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Executivos › ANCHO', 'Usa custo informado manualmente (R$ 20,45), que não acompanha a mudança de preço dos insumos. Cadastre a ficha técnica.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Burger › CHESSE BURGUER', 'Sem ficha técnica e sem custo informado. Cadastre a ficha e o preço de venda.', null),
((select id from empresas where slug = 'figueiredo'), 'Item sem ficha técnica', 'Executivos › CHORIZO', 'Sem ficha técnica e sem custo informado. Cadastre a ficha e o preço de venda.', null);
commit;
