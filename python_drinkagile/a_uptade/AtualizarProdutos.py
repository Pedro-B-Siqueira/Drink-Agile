import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def update_produto(p_id_produto, p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_atualizar_produtos', (p_id_produto, p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor))
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


def Chamar_Atualizar_Produtos():
    p_id_produto = int(input("Digite o ID do produto que você deseja atualizar: "))
    p_nome_produto = input("Digite o NOVO nome do produto: ")
    p_preco_produto = float(input("Digite o NOVO preço do produto: "))
    p_qtd_produto_disponivel = int(input("Digite a NOVA quantidade de produtos disponíveis: "))
    p_obs_produto = input("Digite a NOVA observação do produto: ")
    p_fk_id_fornecedor = int(input("Digite o NOVO ID do fornecedor: "))
    update_produto(p_id_produto, p_nome_produto, p_preco_produto, p_qtd_produto_disponivel,
                        p_obs_produto, p_fk_id_fornecedor)
