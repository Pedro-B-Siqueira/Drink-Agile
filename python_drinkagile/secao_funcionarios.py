# Import's
import time

# Import das Funções: Conectar ao Database & Funções Secundarias
from outras_funcoes import erro_print, acerto_print
from conexaoDB import conectar_database

# Import's das Funções
from python_drinkagile.a_inserts.InserirFuncionarios import chamar_inserir_funcionarios
from python_drinkagile.a_uptade.AtualizarFuncionarios import chamar_atualizar_funcionarios
from python_drinkagile.views.v_view_historicofuncionario_func import executar_view

# Funções

def cadastrar_funcionario():
    chamar_inserir_funcionarios()
def editar_funcionario():
    chamar_atualizar_funcionarios()
def exibir_historico_funcionario():
    executar_view()

def chamar_secao_funcionarios():

    while True:
        print("""
    Opções dos Funcionários:
        1. Cadastar novos Funcionários
        2. Editar dados de Funcionários
        3. Exibir Históricos de Funcionários
        4. Exibir Tabela 
        0. Voltar
                """)
        escolha2 = int(input("→ "))


        if escolha2 == 1:
            cadastrar_funcionario()
        elif escolha2 == 2:
            editar_funcionario()
        elif escolha2 == 3:
            exibir_historico_funcionario()
        elif escolha2 == 4:
            db_connection = conectar_database()
            cursor = db_connection.cursor()

            pesquisa = ("SELECT * FROM funcionarios")

            cursor.execute(pesquisa)

            resultados = cursor.fetchall()

            for busca in resultados:
                print("ID FUNCIONÁRIO:", busca[0])
                print("NOME:", busca[1])
                print("IDADE:", busca[2])
                print("CARGO:", busca[3])
                print("CPF:", busca[4])
                print("CIDADE:", busca[5])
                print("ESTADO:", busca[6])
                print("TELEFONE:", busca[7])
                print("E-MAIL:", busca[8])
                print("SALÁRIO:", busca[9])
                print("ATIVO:", busca[10])
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