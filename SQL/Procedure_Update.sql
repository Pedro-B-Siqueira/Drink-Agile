-- ------------------------------------------------------------------------------------------------------------------
-- Update Fornecedores

drop procedure if exists proc_atualizar_funcionarios;
delimiter //
create procedure proc_atualizar_funcionarios(
	in p_id_funcionario int,
	in p_nome_funcionario varchar(100),
	in p_idade_funcionario int,
    in p_cargo_funcionario varchar(100),
    in p_cpf_funcionario char(11),
    in p_cidade_funcionario varchar(100),
    in p_estado_funcionario char(2),
    in p_telefone_funcionario varchar(100),
    in p_email_funcionario varchar(100),
    in p_salario_funcionario int,
    in p_ativo_funcionario boolean)
begin
    if exists (select 1 from funcionarios where id_funcionario = p_id_funcionario) then
		update funcionarios set id_funcionario = p_id_funcionario,
								nome_funcionario = p_nome_funcionario,
								idade_funcionario = p_idade_funcionario,
                                cargo_funcionario = p_cargo_funcionario,
                                cpf_funcionario = p_cpf_funcionario,
                                cidade_funcionario = p_cidade_funcionario,
                                estado_funcionario = p_estado_funcionario,
                                telefone_funcionario = p_telefone_funcionario,
                                email_funcionario = p_email_funcionario,
                                salario_funcionario = p_salario_funcionario,
                                ativo_funcionario = p_ativo_funcionario
                                where id_funcionario = p_id_funcionario;
		select 'Funcionário atualizado com sucesso' as mensagem;
	else
		select 'Funcionário não encontrado' as mensagem;
	end if;
end//
delimiter ;    

-- ------------------------------------------------------------------------------------------------------------------
-- Update Clientes

drop procedure if exists proc_atualizar_clientes;
delimiter //
create procedure proc_atualizar_clientes(
	in p_id_cliente int,
	in p_nome_cliente varchar(100),
    in p_email_cliente varchar(100),
    in p_endereco_cliente varchar(100)
)
begin
    if exists (select 1 from clientes where id_cliente = p_id_cliente) then
		update clientes set nome_cliente = p_nome_cliente,
								email_cliente = p_email_cliente,
                                endereco_cliente = p_endereco_cliente
                                where id_cliente = p_id_cliente;
		select 'Cliente atualizado com sucesso' as mensagem;
	else
		select 'Cliente não encontrado' as mensagem;
	end if;
end//
delimiter ;    

-- ------------------------------------------------------------------------------------------------------------------
-- Update Fornecedores

drop procedure if exists proc_atualizar_fornecedores;
delimiter //
create procedure proc_atualizar_fornecedores(
	in p_id_fornecedor int,
	in p_nome_fornecedor varchar(100),
    in p_cnpj_fornecedor char(14),
    in p_endereco_fornecedor varchar(100)
)
begin
    if exists (select 1 from fornecedores where id_fornecedor = p_id_fornecedor) then
		update fornecedores set nome_fornecedor = p_nome_fornecedor,
                                cnpj_fornecedor = p_cnpj_fornecedor,
                                endereco_fornecedor = p_endereco_fornecedor
                                where id_fornecedor = p_id_fornecedor;
		select 'Fornecedor atualizado com sucesso' as mensagem;
	else
		select 'Fornecedor não encontrado' as mensagem;
	end if;
end//
delimiter ;    

-- ------------------------------------------------------------------------------------------------------------------
-- Update Produtos

drop procedure if exists proc_atualizar_produtos;
delimiter //
create procedure proc_atualizar_produtos(
	in p_id_produto int,
	in p_nome_produto varchar(100),
    in p_preco_produto int,
    in p_qtd_produto_disponivel int,
    in p_obs_produto varchar(100),
    in p_fk_id_fornecedor int
)
begin
    if exists (select 1 from produtos where id_produto = p_id_produto) and (select 1 from fornecedores where id_fornecedor = p_fk_id_fornecedor) then
		update produtos set nome_produto = p_nome_produto,
								preco_produto = p_preco_produto,
								qtd_produto_disponivel = p_qtd_produto_disponivel,
								obs_produto = p_obs_produto,
								fk_id_fornecedor = p_fk_id_fornecedor
                                where id_produto = p_id_produto;
		select 'Produto atualizado com sucesso' as mensagem;
	else
		select 'Produto ou fornecedor não encontrado' as mensagem;
	end if;
end//
delimiter ;    