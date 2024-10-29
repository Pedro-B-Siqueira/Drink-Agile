import mysql.connector
from python_drinkagile.conexaoDB import conectar_database
from mysql.connector import errorcode

def update_funcionarios(p_id_funcionario, p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario,
                         p_cpf_funcionario, p_cidade_funcionario, p_estado_funcionario,
                         p_telefone_funcionario, p_email_funcionario, p_salario_funcionario, p_ativo_funcionario):
    try:
        db_connection = conectar_database()
        cursor = db_connection.cursor()

        cursor.callproc('proc_atualizar_funcionarios', (p_id_funcionario, p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario,
                                                            p_cpf_funcionario, p_cidade_funcionario, p_estado_funcionario,
                                                            p_telefone_funcionario, p_email_funcionario, p_salario_funcionario, p_ativo_funcionario))
        db_connection.commit()

        for result in cursor.stored_results():
            print(result.fetchone()[0])

    except mysql.connector.Error as error:
        print("Erro ao atualizar:", error)

    finally:
        if 'db_connection' in locals() and db_connection.is_connected():
            cursor.close()
            db_connection.close()
            print('Conexão Encerrada.')


def chamar_atualizar_funcionarios():
    p_id_funcionario = int(input("Digite o ID do funcionário que você deseja atualizar: "))
    p_nome_funcionario = str(input("Digite o NOVO nome do funcionário: "))
    p_idade_funcionario = int(input("Digite a NOVA idade do funcionário: "))
    p_cargo_funcionario = input("Digite o NOVO cargo do funcionário: ")
    while True:
        p_cpf_funcionario = input("Digite o NOVO CPF do funcionário (apenas números): ")
        if len(p_cpf_funcionario) == 11:
            break
        else:
            print(f"POR FAVOR, UTILIZE 11 CARACTERES. QTD USADA: {len(p_cpf_funcionario)}")
    p_cidade_funcionario = input("Digite a NOVA cidade do funcionário: ")
    while True:
        p_estado_funcionario = input("Digite o NOVO estado (ABREVIADO) do funcionário: ")
        if len(p_estado_funcionario) == 2:
            break
        else:
            print(f"POR FAVOR, UTILIZE 2 CARACTERES. QTD USADA: {len(p_estado_funcionario)}")
    p_telefone_funcionario = input("Digite o NOVO telefone do funcionário: ")
    p_email_funcionario = input("Digite o NOVO e-mail do funcionário: ")
    p_salario_funcionario = float(input("Digite o NOVO salário do funcionário: "))
    while True:
        p_ativo_funcionario = input("O funcionário AINDA/NÃO ESTÁ está ativo? (S ou N): ")
        if p_ativo_funcionario.lower() == 's':
            p_ativo_funcionario = True
            break
        elif p_ativo_funcionario.lower() == 'n':
            p_ativo_funcionario = False
            break
        else:
            print("RESPONDA COM 'S' OU 'N'!!!")
    update_funcionarios(p_id_funcionario, p_nome_funcionario, p_idade_funcionario, p_cargo_funcionario,
                         p_cpf_funcionario, p_cidade_funcionario, p_estado_funcionario,
                         p_telefone_funcionario, p_email_funcionario, p_salario_funcionario, p_ativo_funcionario)
