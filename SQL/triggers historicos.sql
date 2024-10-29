-- Funcionários
drop trigger if exists trig_registro_historico_funcionario;
delimiter //
create trigger trig_registro_historico_funcionario
after update on funcionarios
for each row
begin
	insert into historicos_funcionarios(fk_id_funcionario, old_nome_funcionario, old_idade_funcionario, old_cargo_funcionario, old_cpf_funcionario, old_cidade_funcionario, old_estado_funcionario, old_telefone_funcionario, old_email_funcionario, old_salario_funcionario, old_ativo_funcionario, new_nome_funcionario, new_idade_funcionario, new_cargo_funcionario, new_cpf_funcionario, new_cidade_funcionario, new_estado_funcionario, new_telefone_funcionario, new_email_funcionario, new_salario_funcionario, new_ativo_funcionario)
    values
    (old.id_funcionario, old.nome_funcionario, old.idade_funcionario, old.cargo_funcionario, old.cpf_funcionario, old.cidade_funcionario, old.estado_funcionario, old.telefone_funcionario, old.email_funcionario, old.salario_funcionario, old.ativo_funcionario, new.nome_funcionario, new.idade_funcionario, new.cargo_funcionario, new.cpf_funcionario, new.cidade_funcionario, new.estado_funcionario, new.telefone_funcionario, new.email_funcionario, new.salario_funcionario, new.ativo_funcionario);
end //
delimiter ;


-- Clientes
drop trigger if exists trig_registro_historico_cliente;
delimiter //
create trigger trig_registro_historico_cliente
after update on clientes
for each row
begin
	insert into historicos_clientes(fk_id_cliente, old_nome_cliente, old_email_cliente, old_endereco_cliente, new_nome_cliente, new_email_cliente, new_endereco_cliente)
    values
    (old.id_cliente, old.nome_cliente, old.email_cliente, old.endereco_cliente, new.nome_cliente, new.email_cliente, new.endereco_cliente);
end //
delimiter ;


-- Produtos
drop trigger if exists trig_registro_historico_produto;
delimiter //
create trigger trig_registro_historico_produto
after update on produtos
for each row
begin
	insert into historicos_produtos(fk_id_produto, old_nome_produto, old_preco_produto, old_qtd_produto_disponivel, old_obs_produto, new_nome_produto, new_preco_produto, new_qtd_produto_disponivel, new_obs_produto)
    values
    (old.id_produto, old.nome_produto, old.preco_produto, old.qtd_produto_disponivel, old.obs_produto, new.nome_produto, new.preco_produto, new.qtd_produto_disponivel, new.obs_produto);
end //
delimiter ;


-- Fornecedores
drop trigger if exists trig_registro_historico_fornecedor;
delimiter //
create trigger trig_registro_historico_fornecedor
after update on fornecedores
for each row
begin
	insert into historicos_fornecedores(fk_id_fornecedor, old_nome_fornecedor, old_cnpj_fornecedor, old_endereco_fornecedor, new_nome_fornecedor, new_cnpj_fornecedor, new_endereco_fornecedor)
    values
    (old.id_fornecedor, old.nome_fornecedor, old.cnpj_fornecedor, old.endereco_fornecedor, new.nome_fornecedor, new.cnpj_fornecedor, new.endereco_fornecedor);
end //
delimiter ;