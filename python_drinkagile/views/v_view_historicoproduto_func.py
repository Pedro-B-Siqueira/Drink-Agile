# Import's
import time
import random

# Import Principal do mySQL
import mysql.connector
from mysql.connector import errorcode

# Import das Funções: Conectar ao Database & Funções Secundarias
from python_drinkagile.conexaoDB import conectar_database
from python_drinkagile.outras_funcoes import logo, Estilos, erro_print, acerto_print

def view_histprod():
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        # Executa a consulta SQL para obter dados da view
        selectFunc = "SELECT * FROM historicos_produtos"
        cursor.execute(selectFunc)

        print("{:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30}".format('ID HISTORICO', 'ID PRODUTO', 'NOME(OLD)', 'PREÇO(OLD)', 'QTD DISPONÍVEL(OLD)', 'OBSERVAÇÃO(OLD)', 'NOME(NEW)', 'PREÇO(NEW)', 'QTD DISPONÍVEL(NEW)', 'OBSERVAÇÃO(NEW)',))
        # Exibe os resultados da consulta
        print('-' * 340) # Tivemos que contar na "mão"
        for row in cursor.fetchall():
            print("{:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30} {:<30}".format(row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9]))

    except mysql.connector.Error as error:
        erro_print("Erro ao carregar a view:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            acerto_print('Conexão Encerrada.')

def executar_view():
   view_histprod()