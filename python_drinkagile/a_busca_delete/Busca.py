import mysql.connector
from mysql.connector import errorcode
from python_drinkagile.conexaoDB import conectar_database

def pesquisa_geral(tabela_origem, condicao_pesquisa, pesquisa):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        pesquisa = ("SELECT * FROM %s WHERE %s = '%s'" % (tabela_origem, condicao_pesquisa, pesquisa,))

        cursor.execute(pesquisa)

        resultados = cursor.fetchall()

        if tabela_origem == 'funcionarios':
            for busca in resultados:
                print("ID FUNCIONÁRIO:", busca[0])
                print("NOME:", busca[1])
                print("IDADE:", busca[2])
                print("CARGO:", busca[3])
                print("CPF:", busca[4])
                print("CIDADE:", busca[5])
                print("ESTADO:", busca[6])
                print("TELEFONE:", busca[7])
                print("E-MAIL:", busca[8])
                print("SALÁRIO:", busca[9])
                print("ATIVO:", busca[10])
                print("---------------------")

        elif tabela_origem == 'clientes':
            for busca in resultados:
                print("ID CLIENTE:", busca[0])
                print("NOME:", busca[1])
                print("E-MAIL:", busca[2])
                print("ENDEREÇO:", busca[3])

        elif tabela_origem == 'fornecedores':
            for busca in resultados:
                print("ID FORNECEDOR:", busca[0])
                print("NOME:", busca[1])
                print("CNPJ:", busca[2])
                print("ENDEREÇO:", busca[3])


        elif tabela_origem == 'produtos':
            for busca in resultados:
                print("ID PRODUTO:", busca[0])
                print("NOME:", busca[1])
                print("PREÇO:", busca[2])
                print("QUANTIDADE:", busca[3])
                print("OBSERVAÇÃO:", busca[4])
                print("ID FORNECEDOR:", busca[5])

        elif tabela_origem == 'vendas':
            for busca in resultados:
                print("ID VENDA:", busca[0])
                print("ID PRODUTO:", busca[1])
                print("ID CLIENTE:", busca[2])
                print("ID FUNCIONARIO:", busca[3])
                print("PREÇO PRODUTO:", busca[4])
                print("QUANTIDADE PRODUTO:", busca[5])
                print("PREÇO FINAL:", float(busca[4]) * int(busca[5]))
                print("DATA VENDA:", busca[7])

        print("Nenhum outro resultado foi encontrado...")



    except mysql.connector.Error as error:
        if error.errno == errorcode.ER_BAD_DB_ERROR:
            print("O Banco de Dados não existe")
        elif error.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("O Username ou Senha estão incorretos!")
        else:
            print(error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')

def chamar_busca():
    while True:
        tabela_origem = int(input("! Em qual tabela gostaria de pesquisar?\n"
                                  "1- Funcionario\n"
                                  "2- Clientes\n"
                                  "3- Fornecedores\n"
                                  "4- Produtos\n"
                                  "5- Vendas\n"
                                  "0- Voltar\n"
                                  "\n"
                                  "-> "))
        if tabela_origem == 1:
            tabela_origem = 'funcionarios'
            condicao_pesquisa = 'nome_funcionario'
            break
        elif tabela_origem == 2:
            tabela_origem = 'clientes'
            condicao_pesquisa = 'nome_cliente'
            break
        elif tabela_origem == 3:
            tabela_origem = 'fornecedores'
            condicao_pesquisa = 'nome_fornecedor'
            break
        elif tabela_origem == 4:
            tabela_origem = 'produtos'
            condicao_pesquisa = 'nome_produto'
            break
        elif tabela_origem == 5:
            tabela_origem = 'vendas'
            condicao_pesquisa = 'id_venda'
            pesquisa = int(input("! Digite o ID que gostaria de pesquisar\n"
                                    "\n"
                                    "-> "))
            pesquisa_geral(tabela_origem, condicao_pesquisa, pesquisa)
            break
        elif tabela_origem == 0:
            break
        else:
            print("⚠TABELA INEXISTENTE⚠")
    pesquisa = input("! Digite o NOME que gostaria de pesquisar\n"
                          "\n"
                          "-> ")
    pesquisa_geral(tabela_origem, condicao_pesquisa, pesquisa)