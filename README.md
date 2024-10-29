# 🍷 DrinkAgile

Sistema de gerenciamento para distribuidora de bebidas, desenvolvido em Python com integração MySQL. O sistema permite controle completo de vendas, estoque, funcionários, clientes e fornecedores. Projeto feito para entrega de trabalho no curso de ADS do Senai.

## 📋 Funcionalidades Principais

* Registro e visualização de vendas
* Gerenciamento de funcionários
* Cadastro e controle de clientes
* Gestão de produtos e estoque
* Controle de fornecedores
* Sistema de busca integrado
* Funcionalidade de exclusão de registros
* Visualização de produtos por fornecedor

## 🛠️ Tecnologias Utilizadas

* [Python](https://www.python.org/) - Linguagem de programação principal
* [MySQL](https://www.mysql.com/) - Sistema de gerenciamento de banco de dados
* [mysql-connector-python](https://pypi.org/project/mysql-connector-python/) - Conector Python para MySQL

## ⚙️ Pré-requisitos

* Python 3.x
* MySQL Server
* mysql-connector-python

## 🚀 Como Executar

1. Clone o repositório

> bash
`git clone https://github.com/seu-usuario/DrinkAgile.git`


2. Instale as dependências

> bash
`pip install mysql-connector-python`

3. Configure as credenciais do banco de dados no arquivo `conexaoDB.py`
4. Execute o programa

> bash
`python main.py`


## 📊 Estrutura do Menu Principal

1. Registrar novas Vendas
2. Visualizar Vendas
3. Sessão para Buscar
4. Listar Produtos com Fornecedores
5. Sessão dos Funcionários
6. Sessão dos Clientes
7. Sessão dos Produtos
8. Sessão dos Fornecedores
9. Sessão para Deletar
0. Finalizar Programa

## 📁 Estrutura do Projeto

* `main.py` - Arquivo principal do sistema
* `conexaoDB.py` - Configurações de conexão com o banco de dados
* `outras_funcoes.py` - Funções auxiliares e estilização
* `secao_*.py` - Módulos específicos para cada área do sistema
* `views/` - Diretório com as views do sistema
* `a_busca_delete/` - Módulos de busca e deleção

## 👥 Autor

* Pedro Bernardes Siqueira
* Luiz Francisco Neves Mendes
* Maria Clara Honorato Pavezzi
* Pedro Henrique Paes

---
⌨️ Desenvolvido com ❤️ por [seu-nome]
