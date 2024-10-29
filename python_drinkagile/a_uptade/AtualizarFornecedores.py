import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def update_fornecedores(p_id_fornecedor, p_nome_fornecedor, p_cnpj_fornecedor, p_endereco_fornecedor):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_atualizar_fornecedores', (p_id_fornecedor, p_nome_fornecedor, p_cnpj_fornecedor, p_endereco_fornecedor))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao cadastrar aluno:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def chamar_uptade_fornecedores():
    p_id_fornecedor = int(input("Digite o ID do fornecedor que você deseja atualizar: "))
    p_nome_fornecedor = input("Digite o NOVO nome do fornecedor: ")
    while True:
        p_cnpj_fornecedor = input("Digite o NOVO cnpj do fornecedor: ")
        if len(p_cnpj_fornecedor) == 14:
            break
        else:
            print(f"O CNPJ CONTÉM 14 CARACTERES!!! QTD USADA: {len(p_cnpj_fornecedor)}")
    p_endereco_fornecedor = input("Digite o NOVO endereço do fornecedor: ")
    update_fornecedores(p_id_fornecedor, p_nome_fornecedor, p_cnpj_fornecedor, p_endereco_fornecedor)
