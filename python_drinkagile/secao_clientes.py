# Import's
import time

# Import das Funções: Conectar ao Database & Funções Secundarias
from outras_funcoes import erro_print, acerto_print
from conexaoDB import conectar_database

# Import's das Funções
# Clientes
from python_drinkagile.a_inserts.InserirCliente import chamar_inserir_clientes
from python_drinkagile.a_uptade.AtualizarClientes import chamar_atualizar_clientes
from python_drinkagile.views.v_view_historicocliente_func import executar_view

# Funções

def cadastrar_cliente():
    chamar_inserir_clientes()
def editar_cliente():
    chamar_atualizar_clientes()
def exibir_historico_cliente():
    executar_view()

def chamar_secao_clientes():

    while True:
        print(f"""
    Opções dos Clientes:
        1. Cadastar novos Clientes
        2. Editar dados de Clientes
        3. Exibir Históricos de Clientes
        4. Exibir Tabela
        0. Voltar
                """)
        escolha2 = int(input("→ "))


        if escolha2 == 1:
            cadastrar_cliente()
        elif escolha2 == 2:
            editar_cliente()
        elif escolha2 == 3:
            exibir_historico_cliente()
        elif escolha2 == 4:
            db_connection = conectar_database()
            cursor = db_connection.cursor()

            pesquisa = ("SELECT * FROM clientes")

            cursor.execute(pesquisa)

            resultados = cursor.fetchall()

            for busca in resultados:
                print("ID CLIENTE:", busca[0])
                print("NOME:", busca[1])
                print("E-MAIL:", busca[2])
                print("ENDEREÇO:", busca[3])
                print("---------------------")
            print("Nada mais foi encontrado...")
        elif escolha2 == 0:
            acerto_print("Voltando")
            print(end="", flush=True)
            tempo1 = 3
            while tempo1 > 0:
                time.sleep(0.5)
                print(".", end="", flush=True)
                tempo1 -= 1
            print("")
            break
        else:
            erro_print("!!!!! Por Favor, Insira uma Opção !!!!!")
            print()