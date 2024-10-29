import mysql.connector
from conexaoDB import conectar_database
from mysql.connector import errorcode

def  cadastro_vendas(p_id_produto, p_id_cliente, p_id_funcionario, p_qtd_produto):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_realizar_venda', (p_id_produto, p_id_cliente, p_id_funcionario, p_qtd_produto))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao cadastrar a venda:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def chamar_realizar_vendas():
    p_id_produto= int(input("Digite o ID do produto vendido: "))
    p_id_cliente = int(input("Digite ID do cliente comprador: "))
    p_id_funcionario = int(input("Digite ID do funcionario que vendeu: "))
    p_qtd_produto = int(input("Digite a quantidade de itens vendidos: "))
    cadastro_vendas(p_id_produto, p_id_cliente, p_id_funcionario, p_qtd_produto)