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