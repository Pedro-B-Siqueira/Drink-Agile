import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def cadastro_fornecedor(p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_cadastro_produtos', (p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao cadastrar o produto:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def Chamar_Inserir_Produtos():
    p_nome_produto = input("Digite o nome do produto: ")
    p_preco_produto = float(input("Digite o preço do produto: "))
    p_qtd_produto_disponivel = int(input("Digite a quantidade de produtos disponíveis: "))
    p_obs_produto = input("Digite a observação do produto: ")
    p_fk_id_fornecedor = int(input("Digite o ID do fornecedor: "))
    cadastro_fornecedor(p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor)