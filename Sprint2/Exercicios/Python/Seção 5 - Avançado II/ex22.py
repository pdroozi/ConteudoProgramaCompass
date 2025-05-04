from functools import reduce

def calcula_saldo(lancamentos) -> float:
    lista_tuplas = map(lambda x: x[0] if x[1] == 'C' else -x[0], lancamentos)
    resultado = reduce(lambda soma, x: soma + x, lista_tuplas, 0)
    return resultado