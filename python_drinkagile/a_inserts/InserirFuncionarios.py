import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def cadastro_funcionario(p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario, p_cpf_funcionario, p_cidade_funcionario,
                         p_estado_funcionario, p_telefone_funcionario, p_email_funcionario, p_salario_funcionario,
                         p_ativo_funcionario):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_cadastro_funcionario', (p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario, p_cpf_funcionario,
                         p_cidade_funcionario, p_estado_funcionario, p_telefone_funcionario, p_email_funcionario, p_salario_funcionario,
                         p_ativo_funcionario))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao cadastrar o funcionário:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def chamar_inserir_funcionarios():
    p_nome_funcionario = input("Digite o nome do funcionário: ")
    p_idade_funcionario = int(input("Digite a idade do funcionário: "))
    p_cargo_funcionario = input("Digite o cargo do funcionário: ")
    while True:
        p_cpf_funcionario = input("Digite o CPF do funcionário (apenas números): ")
        if len(p_cpf_funcionario) == 11:
            break
        else:
            print(f"POR FAVOR, UTILIZE 11 CARACTERES. QTD USADA: {len(p_cpf_funcionario)}")
    p_cidade_funcionario = input("Digite a cidade do funcionário: ")
    while True:
        p_estado_funcionario = input("Digite o estado (ABREVIADO) do funcionário: ")
        if len(p_estado_funcionario) == 2:
            break
        else:
            print(f"POR FAVOR, UTILIZE 2 CARACTERES. QTD USADA: {len(p_estado_funcionario)}")
    p_telefone_funcionario = input("Digite o telefone do funcionário: ")
    p_email_funcionario = input("Digite o e-mail do funcionário: ")
    p_salario_funcionario = float(input("Digite o salário do funcionário: "))
    while True:
        p_ativo_funcionario = input("O funcionário está ativo? (S ou N): ")
        if p_ativo_funcionario.lower() == 's':
            p_ativo_funcionario = True
            break
        elif p_ativo_funcionario.lower() == 'n':
            p_ativo_funcionario = False
            break
        else:
            print("RESPONDA COM 'S' OU 'N'!!!")
    cadastro_funcionario(p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario, p_cpf_funcionario, p_cidade_funcionario,
                         p_estado_funcionario, p_telefone_funcionario, p_email_funcionario, p_salario_funcionario,
                         p_ativo_funcionario)