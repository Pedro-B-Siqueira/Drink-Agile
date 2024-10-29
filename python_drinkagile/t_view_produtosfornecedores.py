# Import's
import time
import random

# Import das Funções: Conectar ao Database & Funções Secundarias
from conexaoDB import conectar_database
from outras_funcoes import logo, Estilos, erro_print, acerto_print

# Import Principal do mySQL
import mysql.connector
from mysql.connector import errorcode

# Funções

def view_produtosfornecedores():
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        # Executa a consulta SQL para obter dados da view
        selectview = "SELECT * FROM produtosFornecedores;"
        cursor.execute(selectview)

        print("{:<25} {:<25} {:<25}".format('↓ Nome do Produto', '↓ Nome do Fornecedor', '↓ ID do Fornecedor'))
        # Exibe os resultados da consulta
        print('----------------------------------------------------------------------')
        for row in cursor.fetchall():
            print("{:<25} {:<25} {:<25}".format(row[0], row[1], row[2]))

    except mysql.connector.Error as error:
        print("Erro ao Vizualizar a Tabela:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            acerto_print('Conexão Encerrada.')


def chamar_view_produtosfornecedores():
    view_produtosfornecedores()

    while True:

        print(f"Pressione 'ENTER ↵' para Voltar")
        escolha4 = input("→ ")

        acerto_print("Voltando")
        print(end="", flush=True)
        tempo1 = 3
        while tempo1 > 0:
            time.sleep(0.5)
            print(".", end="", flush=True)
            tempo1 -= 1
        print("")
        break