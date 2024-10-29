# Import's
import time

# Import das Funções: Conectar ao Database & Funções Secundarias
from outras_funcoes import erro_print, acerto_print
from conexaoDB import  conectar_database

# Import's das Funções
from python_drinkagile.a_inserts.InserirProdutos import Chamar_Inserir_Produtos
from python_drinkagile.a_uptade.AtualizarProdutos import Chamar_Atualizar_Produtos
from python_drinkagile.views.v_view_historicoproduto_func import executar_view

# Funções

def cadastrar_produto():
   Chamar_Inserir_Produtos()
def editar_produto():
    Chamar_Atualizar_Produtos()
def exibir_historico_produto():
    executar_view()

def chamar_secao_produtos():

    while True:
        print("""
    Opções dos Produtos:
        1. Cadastar novos Produtos
        2. Editar dados de Produtos
        3. Exibir Históricos de Produtos
        4. Exibir Tabela
        0. Voltar
                """)
        escolha2 = int(input("→ "))


        if escolha2 == 1:
            cadastrar_produto()
        elif escolha2 == 2:
            editar_produto()
        elif escolha2 == 3:
            exibir_historico_produto()
        elif escolha2 == 4:
            db_connection = conectar_database()
            cursor = db_connection.cursor()

            pesquisa = ("SELECT * FROM produtos")

            cursor.execute(pesquisa)

            resultados = cursor.fetchall()

            for busca in resultados:
                print("ID PRODUTO:", busca[0])
                print("NOME:", busca[1])
                print("PREÇO:", busca[2])
                print("QUANTIDADE:", busca[3])
                print("OBSERVAÇÃO:", busca[4])
                print("ID FORNECEDOR:", busca[5])
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