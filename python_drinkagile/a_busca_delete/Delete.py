import mysql.connector
from mysql.connector import errorcode
from python_drinkagile.conexaoDB import conectar_database

def delete_geral(tabela_origem, condicao_delete, id_delete):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        if tabela_origem == 'funcionarios':
            deleteQuery = ("DELETE FROM historicos_funcionarios WHERE fk_id_funcionario = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM vendas WHERE fk_id_funcionario = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM %s WHERE %s = %s" % (tabela_origem, condicao_delete, id_delete,))

        elif tabela_origem == 'clientes':
            deleteQuery = ("DELETE FROM historicos_clientes WHERE fk_id_cliente = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM vendas WHERE fk_id_cliente = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM %s WHERE %s = %s" % (tabela_origem, condicao_delete, id_delete,))

        elif tabela_origem == 'fornecedores':
            deleteQuery = ("DELETE FROM historicos_fornecedores WHERE fk_id_fornecedor = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM vendas WHERE fk_id_produto = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM produtos WHERE fk_id_fornecedor = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM %s WHERE %s = %s" % (tabela_origem, condicao_delete, id_delete,))

        elif tabela_origem == 'produtos':
            deleteQuery = ("DELETE FROM historicos_produtos WHERE fk_id_produto = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM vendas WHERE fk_id_produto = %s" % (id_delete,))
            cursor.execute(deleteQuery)
            deleteQuery = ("DELETE FROM %s WHERE %s = %s" % (tabela_origem, condicao_delete, id_delete,))
        else:
            print("Tabela INEXISTENTE!!!")

        cursor.execute(deleteQuery)

        db_connection.commit()
        print("Registro Excluído com Sucesso!")

    except mysql.connector.Error as error:
        print("Erro ao deletar:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')

def chamar_deletar():
    while True:
        tabela_origem = int(input("! De qual tabela gostaria deletar?\n"
                              "1- Funcionario\n"
                              "2- Clientes\n"
                              "3- Fornecedores\n"
                              "4- Produtos\n"
                              "0- Voltar\n"
                              "\n"
                              "-> "))
        if tabela_origem == 1:
            tabela_origem = 'funcionarios'
            condicao_delete = 'id_funcionario'
            break
        elif tabela_origem == 2:
            tabela_origem = 'clientes'
            condicao_delete = 'id_cliente'
            break
        elif tabela_origem == 3:
            tabela_origem = 'fornecedores'
            condicao_delete = 'id_fornecedor'
            break
        elif tabela_origem == 4:
            tabela_origem = 'produtos'
            condicao_delete = 'id_produto'
            break
        elif tabela_origem == 0:
            break
        else:
            print("⚠TABELA INEXISTENTE⚠")
    id_delete = int(input("! Digite o ID que gostaria de apagar\n"
                          "\n"
                          "-> "))
    delete_geral(tabela_origem, condicao_delete, id_delete)
