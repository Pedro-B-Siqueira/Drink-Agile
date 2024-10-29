-- View

-- Vizualizar
drop view if exists produtosFornecedores;
create view produtosFornecedores as 
select p.nome_produto , f.nome_fornecedor , p.fk_id_fornecedor
from produtos p
join fornecedores f on p. fk_id_fornecedor = f.id_fornecedor; 