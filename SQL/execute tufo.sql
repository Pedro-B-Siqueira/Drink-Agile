create database if not exists ofc_drinkagile_bd;
use ofc_drinkagile_bd;

-- Informações Obrigadorias

create table if not exists funcionarios (
	id_funcionario int not null auto_increment,
    nome_funcionario varchar(100) not null,
    idade_funcionario int not null,
    cargo_funcionario varchar(100),
    cpf_funcionario char(11) not null,
    cidade_funcionario varchar(100) not null,
    estado_funcionario char(2) not null,
    telefone_funcionario varchar(100) not null,
	email_funcionario varchar(100) not null,
    salario_funcionario float(10,2) not null,
    ativo_funcionario boolean not null,
    -- Chaves
    primary key(id_funcionario)
);

create table if not exists clientes (
	id_cliente int not null auto_increment,
    nome_cliente varchar(100),
    email_cliente varchar(100),
    endereco_cliente varchar(100),
    -- Chaves
    primary key(id_cliente)
);

create table if not exists fornecedores (
	id_fornecedor int not null auto_increment,
    nome_fornecedor varchar(100) not null,
    cnpj_fornecedor char(14) not null,
    endereco_fornecedor varchar(100) not null,
    primary key(id_fornecedor)
);

create table if not exists produtos (
	id_produto int not null auto_increment,
    nome_produto varchar(100) not null,
    preco_produto float(10,2) not null,
    qtd_produto_disponivel int not null,
    obs_produto varchar(100),
    -- Chaves
    primary key(id_produto),
    fk_id_fornecedor int,
    foreign key (fk_id_fornecedor) references fornecedores(id_fornecedor)
);

create table if not exists vendas (
	id_venda int not null auto_increment,
    -- Chave
    primary key (id_venda),
    fk_id_produto int,
    fk_id_cliente int,
    fk_id_funcionario int,
    foreign key (fk_id_produto) references produtos(id_produto),
    foreign key (fk_id_cliente) references clientes(id_cliente),
    foreign key (fk_id_funcionario) references funcionarios(id_funcionario),
	--
	preco_produto float(10,2),
    qtd_produto int,
    preco_final float(10,2),
    data_venda datetime
);

-- Historicos

create table if not exists historicos_funcionarios (
	his_id_funcionario int not null auto_increment,
    fk_id_funcionario int,
	-- Old
    old_nome_funcionario varchar(100) not null,
    old_idade_funcionario int not null,
    old_cargo_funcionario varchar(100) not null,
    old_cpf_funcionario char(11) not null,
    old_cidade_funcionario varchar(100) not null,
    old_estado_funcionario char(2) not null,
    old_telefone_funcionario varchar(100) not null,
	old_email_funcionario varchar(100) not null,
    old_salario_funcionario float(10,2) not null,
    old_ativo_funcionario boolean not null,
    -- New
    new_nome_funcionario varchar(100) not null,
    new_idade_funcionario int not null,
    new_cargo_funcionario varchar(100) not null,
    new_cpf_funcionario char(11) not null,
    new_cidade_funcionario varchar(100) not null,
    new_estado_funcionario char(2) not null,
    new_telefone_funcionario varchar(100) not null,
	new_email_funcionario varchar(100) not null,
    new_salario_funcionario float(10,2) not null,
    new_ativo_funcionario boolean not null,
	-- Chaves
	primary key(his_id_funcionario),
    foreign key (fk_id_funcionario) references funcionarios(id_funcionario)
);

create table if not exists historicos_fornecedores (
	his_id_fornecedor int not null auto_increment,
    fk_id_fornecedor int,
    -- Old
    old_nome_fornecedor varchar(100),
    old_cnpj_fornecedor char(14),
    old_endereco_fornecedor varchar(100),
    -- New
    new_nome_fornecedor varchar(100),
    new_cnpj_fornecedor char(14),
    new_endereco_fornecedor varchar(100),
    -- Chaves
    primary key(his_id_fornecedor),
    foreign key (fk_id_fornecedor) references fornecedores(id_fornecedor)
);

create table if not exists historicos_clientes (
	his_id_cliente int not null auto_increment,
    fk_id_cliente int,
    -- Old
    old_nome_cliente varchar(100) not null,
    old_email_cliente varchar(100),
    old_endereco_cliente varchar(100),
    -- New
    new_nome_cliente varchar(100) not null,
    new_email_cliente varchar(100),
    new_endereco_cliente varchar(100),
    primary key(his_id_cliente),
    foreign key (fk_id_cliente) references clientes(id_cliente)
);

create table if not exists historicos_produtos (
	his_id_produto int not null auto_increment,
    fk_id_produto int,
    -- Old
    old_nome_produto varchar(100),
    old_preco_produto int,
    old_qtd_produto_disponivel int,
    old_obs_produto varchar(100),
    -- New
    new_nome_produto varchar(100),
    new_preco_produto int,
    new_qtd_produto_disponivel int,
    new_obs_produto varchar(100),
    -- Chaves
    primary key(his_id_produto),
    foreign key (fk_id_produto) references produtos(id_produto)
);

SET sql_mode = "";

-- Funcionários
INSERT INTO funcionarios (nome_funcionario, idade_funcionario, cargo_funcionario, cpf_funcionario, cidade_funcionario, estado_funcionario, telefone_funcionario, email_funcionario, salario_funcionario, ativo_funcionario) 
VALUES 
('João Silva', 35, 'Gerente de Vendas', '12345678901', 'São Paulo', 'SP', '(11) 9999-8888', 'joao.silva@email.com', 5000, true),
('Maria Souza', 28, 'Vendedor', '23456789012', 'Rio de Janeiro', 'RJ', '(21) 7777-6666', 'maria.souza@email.com', 3000, true),
('Carlos Oliveira', 40, 'Assistente de Estoque', '34567890123', 'Belo Horizonte', 'MG', '(31) 3333-2222', 'carlos.oliveira@email.com', 2500, true),
('Ana Santos', 32, 'Atendente', '45678901234', 'Curitiba', 'PR', '(41) 5555-4444', 'ana.santos@email.com', 2800, true),
('Pedro Costa', 27, 'Assistente Administrativo', '56789012345', 'Porto Alegre', 'RS', '(51) 2222-1111', 'pedro.costa@email.com', 3200, true),
('Luciana Lima', 33, 'Analista de Marketing', '67890123456', 'Salvador', 'BA', '(71) 8888-7777', 'luciana.lima@email.com', 4000, true),
('Fernando Oliveira', 45, 'Contador', '78901234567', 'Recife', 'PE', '(81) 9999-0000', 'fernando.oliveira@email.com', 6000, true),
('Juliana Pereira', 29, 'Analista de RH', '89012345678', 'Brasília', 'DF', '(61) 4444-3333', 'juliana.pereira@email.com', 3800, true),
('Gabriel Almeida', 36, 'Supervisor de Produção', '90123456789', 'Fortaleza', 'CE', '(85) 7777-8888', 'gabriel.almeida@email.com', 4500, true),
('Mariana Costa', 31, 'Coordenador de Logística', '01234567890', 'Manaus', 'AM', '(92) 3333-4444', 'mariana.costa@email.com', 5200, true);

-- Clientes
INSERT INTO clientes (nome_cliente, email_cliente, endereco_cliente) 
VALUES 
('Empresa A', 'empresaA@email.com', 'Rua A, 123, Bairro X, Cidade Y'),
('Empresa B', 'empresaB@email.com', 'Rua B, 456, Bairro Z, Cidade W'),
('Empresa C', 'empresaC@email.com', 'Rua C, 789, Bairro W, Cidade X'),
('Empresa D', 'empresaD@email.com', 'Rua D, 012, Bairro Y, Cidade Z'),
('Empresa E', 'empresaE@email.com', 'Rua E, 345, Bairro X, Cidade Y'),
('Empresa F', 'empresaF@email.com', 'Rua F, 678, Bairro Z, Cidade W'),
('Empresa G', 'empresaG@email.com', 'Rua G, 901, Bairro W, Cidade X'),
('Empresa H', 'empresaH@email.com', 'Rua H, 234, Bairro Y, Cidade Z'),
('Empresa I', 'empresaI@email.com', 'Rua I, 567, Bairro X, Cidade Y'),
('Empresa J', 'empresaJ@email.com', 'Rua J, 890, Bairro Z, Cidade W');

-- Fornecedores
INSERT INTO fornecedores (nome_fornecedor, cnpj_fornecedor, endereco_fornecedor) 
VALUES 
('Fornecedor 1', '12345678901234', 'Rua Fornecedor 1, 123, Bairro A, Cidade X'),
('Fornecedor 2', '23456789012345', 'Rua Fornecedor 2, 456, Bairro B, Cidade Y'),
('Fornecedor 3', '34567890123456', 'Rua Fornecedor 3, 789, Bairro C, Cidade Z'),
('Fornecedor 4', '45678901234567', 'Rua Fornecedor 4, 012, Bairro D, Cidade W'),
('Fornecedor 5', '56789012345678', 'Rua Fornecedor 5, 345, Bairro E, Cidade X'),
('Fornecedor 6', '67890123456789', 'Rua Fornecedor 6, 678, Bairro F, Cidade Y'),
('Fornecedor 7', '78901234567890', 'Rua Fornecedor 7, 901, Bairro G, Cidade Z'),
('Fornecedor 8', '89012345678901', 'Rua Fornecedor 8, 234, Bairro H, Cidade W'),
('Fornecedor 9', '90123456789012', 'Rua Fornecedor 9, 567, Bairro I, Cidade X'),
('Fornecedor 10', '01234567890123', 'Rua Fornecedor 10, 890, Bairro J, Cidade Y');

-- Produtos
INSERT INTO produtos (nome_produto, preco_produto, qtd_produto_disponivel, obs_produto, fk_id_fornecedor) 
VALUES 
('Produto 1', 100, 50, 'Obs Produto 1', 1),
('Produto 2', 150, 30, 'Obs Produto 2', 2),
('Produto 3', 200, 20, 'Obs Produto 3', 3),
('Produto 4', 80, 100, 'Obs Produto 4', 4),
('Produto 5', 120, 40, 'Obs Produto 5', 5),
('Produto 6', 90, 60, 'Obs Produto 6', 6),
('Produto 7', 180, 25, 'Obs Produto 7', 7),
('Produto 8', 250, 15, 'Obs Produto 8', 8),
('Produto 9', 300, 10, 'Obs Produto 9', 9),
('Produto 10', 70, 75, 'Obs Produto 10', 10);

-- Vendas
INSERT INTO vendas (fk_id_produto, fk_id_cliente, fk_id_funcionario, preco_produto, qtd_produto, preco_final, data_venda) 
VALUES 
(1, 1, 1, 15.00, 5, 75.00, '2024-05-21 09:25:59');

-- Historico

-- Histórico de Funcionários
INSERT INTO historicos_funcionarios (fk_id_funcionario,
old_nome_funcionario, old_idade_funcionario, old_cargo_funcionario, old_cpf_funcionario, old_cidade_funcionario, old_estado_funcionario, old_telefone_funcionario, old_email_funcionario, old_salario_funcionario, old_ativo_funcionario,
new_nome_funcionario, new_idade_funcionario, new_cargo_funcionario, new_cpf_funcionario, new_cidade_funcionario, new_estado_funcionario, new_telefone_funcionario, new_email_funcionario, new_salario_funcionario, new_ativo_funcionario
) 
VALUES ('1', 
'João Silva', 35, 'Gerente de Vendas', '12345678901', 'São Paulo', 'SP', '(11) 9999-8888', 'joao.silva@email.com', 5000, true,
'João Silva', 36, 'Gerente de Vendas', '12345678901', 'São Paulo', 'SP', '(11) 9999-8888', 'joao.silva@email.com', 5200, false);

-- Histórico de Fornecedores
INSERT INTO historicos_fornecedores (fk_id_fornecedor,
old_nome_fornecedor, old_cnpj_fornecedor, old_endereco_fornecedor,
new_nome_fornecedor, new_cnpj_fornecedor, new_endereco_fornecedor
) 
VALUES ('1',
'Fornecedor 1', '12345678901234', 'Rua Fornecedor 1, 123, Bairro A, Cidade X',
'Fornecedor 1', '12345678901234', 'Rua Fornecedor 3, 123, Bairro E, Cidade A');

-- Histórico de Clientes
INSERT INTO historicos_clientes (fk_id_cliente,
old_nome_cliente, old_email_cliente, old_endereco_cliente,
new_nome_cliente, new_email_cliente, new_endereco_cliente
) 
VALUES ('1', 
'Empresa A', 'empresaA@email.com', 'Rua A, 123, Bairro X, Cidade Y',
'Empresa A', 'empresaA@newemail.com', 'Rua A, 123, Bairro X, Cidade L');

-- Histórico de Produtos
INSERT INTO historicos_produtos (fk_id_produto,
old_nome_produto, old_preco_produto, old_qtd_produto_disponivel, old_obs_produto,
new_nome_produto, new_preco_produto, new_qtd_produto_disponivel, new_obs_produto
) 
VALUES ('1', 
'Produto 1', 100, 50, 'Obs Produto 1',
'Produto 1', 110, 60, 'Nova Obs Produto 1');

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

drop procedure if exists proc_realizar_venda;
delimiter //
create procedure proc_realizar_venda(
    in p_id_produto int,
    in p_id_cliente int,
    in p_id_funcionario int,
    in p_qtd_produto int
)
begin
    if exists (select 1 from produtos where id_produto = p_id_produto) then
        if exists (select 1 from clientes where id_cliente = p_id_cliente) then
            if exists (select 1 from funcionarios where id_funcionario = p_id_funcionario) then
                if ((select qtd_produto_disponivel from produtos where id_produto = p_id_produto) > p_qtd_produto) then
                    insert into vendas(fk_id_produto, fk_id_cliente, fk_id_funcionario, preco_produto, qtd_produto, preco_final, data_venda) 
                
                    values (p_id_produto, p_id_cliente, p_id_funcionario, (select preco_produto from produtos where id_produto = p_id_produto), 
                            p_qtd_produto, (p_qtd_produto * (select preco_produto from produtos where id_produto = p_id_produto)),
                            now());
                    
                    update produtos set qtd_produto_disponivel = qtd_produto_disponivel - p_qtd_produto
                                where id_produto = p_id_produto;
                                
                    select 'Venda realizada com sucesso!' as mensagem;
                else
                    select 'Quantidade dísponivel menor que a solicitada!' as mensagem;
                end if;
            else
                select 'Este FUNCIONÁRIO NÃO EXISTE no nosso sistema.' as mensagem;
            end if;
        else
            select 'Este CLIENTE NÃO EXISTE no nosso sistema.' as mensagem;
        end if;
    else
        select 'Este PRODUTO NÃO EXISTE no nosso sistema.' as mensagem;
    end if;
        
    
end //
delimiter ;

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

-- View

-- Vizualizar
drop view if exists produtosFornecedores;
create view produtosFornecedores as 
select p.nome_produto , f.nome_fornecedor , p.fk_id_fornecedor
from produtos p
join fornecedores f on p. fk_id_fornecedor = f.id_fornecedor; 