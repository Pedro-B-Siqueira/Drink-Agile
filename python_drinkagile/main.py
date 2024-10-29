# Import's
import time
import random

# Import das Funções: Conectar ao Database & Funções Secundarias
from conexaoDB import conectar_database
from outras_funcoes import logo, Estilos, erro_print, acerto_print, indicador_print, logo_final

# Import Principal do mySQL
import mysql.connector
from mysql.connector import errorcode

# Import para chamar as Seções
from secao_funcionarios import chamar_secao_funcionarios
from secao_clientes import chamar_secao_clientes
from secao_produtos import chamar_secao_produtos
from secao_fornecedores import chamar_secao_fornecedores
from t_realizar_vendas import chamar_realizar_vendas
from views.v_view_historicovenda_func import executar_view_vendas
from t_view_produtosfornecedores import chamar_view_produtosfornecedores
from python_drinkagile.a_busca_delete.Delete import chamar_deletar
from python_drinkagile.a_busca_delete.Busca import chamar_busca

def main():
    # Conectando ao Database
    db_connection = conectar_database()
    cursor = db_connection.cursor()
    logo()

    while True:
        print("=====")

        while True:
            try:
                print(f"""
Serviços Disponíveis:
    1. Registrar novas Vendas
    2. Vizualizar Vendas
    3. Sessão para Buscar
    4. Listar Produtos com Fornecedores
    5. Sessão dos Funcionários
    6. Sessão dos Clientes
    7. Sessão dos Produtos
    8. Sessão dos Fornecedores
    9. Sessão para Deletar
    0. Finalizar Programa
                    """)
                escolha1 = int(input("→ "))
                break
            except ValueError:
                erro_print("!!!!! Por Favor, Insira um número !!!!!")
                continue

        if escolha1 == 1:
            chamar_realizar_vendas()
        elif escolha1 == 2:
            executar_view_vendas()
        elif escolha1 == 3:
            chamar_busca()
        elif escolha1 == 4:
            chamar_view_produtosfornecedores()
        elif escolha1 == 5:
            chamar_secao_funcionarios()
        elif escolha1 == 6:
            chamar_secao_clientes()
        elif escolha1 == 7:
            chamar_secao_produtos()
        elif escolha1 == 8:
            chamar_secao_fornecedores()
        elif escolha1 == 9:
            chamar_deletar()

        elif escolha1 == 0:
            acerto_print("Finalizando")
            print(end="", flush=True)
            tempo1 = 3
            while tempo1 > 0:
                time.sleep(0.5)
                print(".", end="", flush=True)
                tempo1 -= 1
            print()
            logo_final()
            break

        else:
            erro_print("Essa não é uma Opção!")
            print("")

if __name__ == '__main__':
    main()