import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def update_clientes(p_id_cliente, p_nome_cliente, p_email_cliente, p_endereco_cliente):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_atualizar_clientes', (p_id_cliente, p_nome_cliente, p_email_cliente, p_endereco_cliente))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao atualizar:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def chamar_atualizar_clientes():
    p_id_cliente = int(input("Digite o ID do cliente que você deseja atualizar: "))
    p_nome_cliente = input("Digite o NOVO nome do cliente: ")
    p_email_cliente = input("Digite o NOVO e-mail do cliente: ")
    p_endereco_cliente = input("Digite o NOVO endereço do cliente: ")
    update_clientes(p_id_cliente, p_nome_cliente, p_email_cliente, p_endereco_cliente)
