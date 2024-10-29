# Import's
import time

# Import das Funções: Conectar ao Database & Funções Secundarias
from outras_funcoes import erro_print, acerto_print
from conexaoDB import conectar_database

# Import's das Funções
from python_drinkagile.a_inserts.InserirFornecedor import chamar_inserir_fornecedores
from python_drinkagile.a_uptade.AtualizarFornecedores import chamar_uptade_fornecedores
from python_drinkagile.views.v_view_historicofornecedor_func import executar_view

# Funções

def cadastrar_fornecedor():
    chamar_inserir_fornecedores()
def editar_fornecedor():
    chamar_uptade_fornecedores()
def exibir_historico_fornecedor():
    executar_view()

def chamar_secao_fornecedores():

    while True:
        print("""
    Opções dos Fornecedores:
        1. Cadastar novos Fornecedores
        2. Editar dados de Fornecedores
        3. Exibir Históricos de Fornecedores
        4. Exibir Tabela
        0. Voltar
                """)
        escolha2 = int(input("→ "))


        if escolha2 == 1:
            cadastrar_fornecedor()
        elif escolha2 == 2:
            editar_fornecedor()
        elif escolha2 == 3:
            exibir_historico_fornecedor()
        elif escolha2 == 4:
            db_connection = conectar_database()
            cursor = db_connection.cursor()

            pesquisa = ("SELECT * FROM fornecedores")

            cursor.execute(pesquisa)

            resultados = cursor.fetchall()

            for busca in resultados:
                print("ID FORNECEDOR:", busca[0])
                print("NOME:", busca[1])
                print("CNPJ:", busca[2])
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
