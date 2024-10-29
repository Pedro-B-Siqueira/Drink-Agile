# pip install mysql-connector-python==8.0.13
from outras_funcoes import logo, Estilos, erro_print, acerto_print

# Import Principal do mySQL
import mysql.connector
from mysql.connector import errorcode

def conectar_database():
    try:
        db_connection = mysql.connector.connect(
            host='localhost',
            user='tecmysql',
            password='devmysql',
            database='ofc_drinkagile_bd'
        )
        acerto_print("Conexão Realizada com Sucesso!")
        return db_connection

    except mysql.connector.Error as error:
        if error.errno == mysql.connector.errorcode.ER_BAD_DB_ERROR:
            erro_print("O Banco de dados não existe")
        elif error.errno == mysql.connector.errorcode.ER_ACCESS_DENIED_ERROR:
            erro_print("O Username ou o Password está errado!")
        else:
            erro_print(error)


# db_connection = conexaoBDmysql.connect_database()
#         cursor = db_connection.cursor()