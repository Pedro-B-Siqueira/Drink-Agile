# Import's
import time
import random

class Estilos:
    RESET = "\033[0m"

    # Em uso
    AMARELO = "\033[33m"
    VERDE = "\033[32m"
    VERMELHO = "\033[31m"

    # Outras Cores
    NEGRITO = "\033[1m"
    ITALICO = "\033[3m"
    SUBLINHADO = "\033[4m"
    TACHADO = "\033[9m"
    AZUL = "\033[34m"
    MAGENTA = "\033[35m"
    CIANO = "\033[36m"
    BRANCO = "\033[37m"
    PRETO = "\033[30m"

    # Fundo do Texto
    FUNDO_AZUL = "\033[44m"
    FUNDO_MAGENTA = "\033[45m"
    FUNDO_CYAN = "\033[46m"
    FUNDO_PRETO = "\033[40m"
    FUNDO_VERMELHO = "\033[41m"
    FUNDO_AMARELO = "\033[43m"
    FUNDO_BRANCO = "\033[47m"

# Drink.Agile

def logo():
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")

    print_animado_amarelo("""                                   
██████      ██████      ██     ███    ██     ██   ██             █████       ██████      ██     ██          ███████ 
██   ██     ██   ██     ██     ████   ██     ██  ██             ██   ██     ██           ██     ██          ██      
██   ██     ██████      ██     ██ ██  ██     █████              ███████     ██   ███     ██     ██          █████   
██   ██     ██   ██     ██     ██  ██ ██     ██  ██             ██   ██     ██    ██     ██     ██          ██      
██████      ██   ██     ██     ██   ████     ██   ██     ██     ██   ██      ██████      ██     ███████     ███████                                                                                       
    """, 0.005)
    print_animado("Powered by XicoInter®, Dev.Agile®, Drink.Agile® Jiuberto™ & Roberto™", 0.02)

    print("\n\n\n\n")

def logo_final():
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
    acerto_print("Obrigado por Usar os Nossos Servições!")


    print_animado_amarelo("""
██████      ██████      ██     ███    ██     ██   ██             █████       ██████      ██     ██          ███████ 
██   ██     ██   ██     ██     ████   ██     ██  ██             ██   ██     ██           ██     ██          ██      
██   ██     ██████      ██     ██ ██  ██     █████              ███████     ██   ███     ██     ██          █████   
██   ██     ██   ██     ██     ██  ██ ██     ██  ██             ██   ██     ██    ██     ██     ██          ██      
██████      ██   ██     ██     ██   ████     ██   ██     ██     ██   ██      ██████      ██     ███████     ███████                                                                                                                                                                                                        
    """, 0.005)
    print_animado("Powered by XicoInter®, Dev.Agile®, Drink.Agile® Jiuberto™ & Roberto™", 0.02)

    print("\n\n\n\n")

def erro_print(texto):
    print(f"{Estilos.VERMELHO}{Estilos.NEGRITO}{texto}{Estilos.RESET}")

def acerto_print(texto):
    print(f"{Estilos.VERDE}{Estilos.NEGRITO}{texto}{Estilos.RESET}")

def indicador_print(texto):
    print(f"{Estilos.AMARELO}{Estilos.NEGRITO}{texto}{Estilos.RESET}")

def print_animado(texto, tempo):
    for char in texto:
        print(char, end='', flush=True)
        time.sleep(tempo)
    print()

def print_animado_amarelo(texto, tempo):
    for char in texto:
        print(f"{Estilos.AMARELO}{Estilos.NEGRITO}{char}{Estilos.RESET}", end='', flush=True)
        time.sleep(tempo)
    print()