def my_map(lista, funcao):
    resultado = []
    for x in lista:
        resultado.append(funcao(x))
    return resultado

def funcao (x):
    return x * x

lista = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

listaFinal = my_map(lista, funcao)
print(listaFinal)