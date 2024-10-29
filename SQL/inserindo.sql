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