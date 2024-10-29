-- ------------------------------------------------------------------------------------------------------------------
-- Cadastro Funcionários

drop procedure if exists proc_cadastro_funcionario;
delimiter //
create procedure proc_cadastro_funcionario(
    in p_nome_funcionario varchar(100),
    in p_idade_funcionario int,
    in p_cargo_funcionario varchar(100),
    in p_cpf_funcionario char(11),
    in p_cidade_funcionario varchar(100),
    in p_estado_funcionario char(2),
    in p_telefone_funcionario varchar(100),
    in p_email_funcionario varchar(100),
    in p_salario_funcionario float(10, 2),
    in p_ativo_funcionario boolean
)
begin
    if not exists (select 1 from funcionarios where cpf_funcionario = p_cpf_funcionario) then
        insert into funcionarios(nome_funcionario, idade_funcionario, cargo_funcionario, cpf_funcionario, cidade_funcionario, estado_funcionario, telefone_funcionario, email_funcionario, salario_funcionario, ativo_funcionario) 
        values (p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario, p_cpf_funcionario, p_cidade_funcionario, p_estado_funcionario, p_telefone_funcionario, p_email_funcionario, p_salario_funcionario, p_ativo_funcionario);
        select 'Funcionário cadastrado com sucesso!' as mensagem;
    else
        select 'Este CPF já está cadastrado no nosso sistema.' as mensagem;
    end if;
end //
delimiter ;

-- ------------------------------------------------------------------------------------------------------------------
-- Cadastro Clientes

drop procedure if exists proc_cadastro_clientes;
delimiter //
create procedure proc_cadastro_clientes(
    in p_nome_cliente varchar(100),
    in p_email_cliente varchar(100),
    in p_endereco_cliente varchar(100)
)
begin
    if not exists (select 1 from clientes where nome_cliente = p_nome_cliente) then
        insert into clientes(nome_cliente, email_cliente, endereco_cliente) 
        values (p_nome_cliente, p_email_cliente, p_endereco_cliente);
        select 'Cliente cadastrado com sucesso!' as mensagem;
    else
        select 'Este Cliente já está cadastrado no nosso sistema.' as mensagem;
    end if;
end //
delimiter ;

-- ------------------------------------------------------------------------------------------------------------------
-- Cadastro Fornecedores

drop procedure if exists proc_cadastro_fornecedores;
delimiter //
create procedure proc_cadastro_fornecedores(
    in p_nome_fornecedor varchar(100),
    in p_cnpj_fornecedor char(14),
    in p_endereco_fornecedor varchar(100)
)
begin
    if not exists (select 1 from fornecedores where cnpj_fornecedor = p_cnpj_fornecedor) then
        insert into fornecedores(nome_fornecedor, cnpj_fornecedor, endereco_fornecedor) 
        values (p_nome_fornecedor, p_cnpj_fornecedor, p_endereco_fornecedor);
        select 'Fornecedor cadastrado com sucesso!' as mensagem;
    else
        select 'Este CNPJ já está cadastrado no nosso sistema.' as mensagem;
    end if;
end //
delimiter ;

-- ------------------------------------------------------------------------------------------------------------------
-- Cadastro Produtos

drop procedure if exists proc_cadastro_produtos;
delimiter //
create procedure proc_cadastro_produtos(
    in p_nome_produto varchar(100),
    in p_preco_produto float,
    in p_qtd_produto_disponivel int,
    in p_obs_produto varchar(100),
    in p_fk_id_fornecedor int
)
begin
    if not exists (select 1 from produtos where nome_produto = p_nome_produto) then
        if exists (select 1 from fornecedores where id_fornecedor = p_fk_id_fornecedor) then
            insert into produtos(nome_produto, preco_produto, qtd_produto_disponivel, obs_produto, fk_id_fornecedor) 
            values (p_nome_produto, p_preco_produto, p_qtd_produto_disponivel, p_obs_produto, p_fk_id_fornecedor);
            select 'Produto cadastrado com sucesso!' as mensagem;
        else
            select 'Este forncedor não existe!' as mensagem;
        end if;
    else
        select 'Este Produto já está cadastrado no nosso sistema.' as mensagem;
    end if;
end //
delimiter ;