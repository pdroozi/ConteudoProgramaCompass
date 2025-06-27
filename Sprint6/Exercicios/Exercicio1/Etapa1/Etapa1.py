import random

lista_numeros = []

for i in range(250):
    numero = random.randint(1, 1000)
    lista_numeros.append(numero)
print(lista_numeros)

lista_numeros_invertida = list(reversed(lista_numeros))
print(lista_numeros_invertida)

if lista_numeros_invertida == lista_numeros[::-1]:
    print("A lista foi invertida com sucesso!")