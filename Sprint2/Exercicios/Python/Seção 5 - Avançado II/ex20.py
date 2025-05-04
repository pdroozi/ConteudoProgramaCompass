arquivo = open('number.txt', 'r')
numeros = list(map(int, arquivo))

listaParesOrdenados = sorted(list(filter(lambda x: x % 2 == 0, numeros)), reverse = True)
listaTop5 = listaParesOrdenados[:5]
listaSomaTop5 = sum(listaTop5)

print(listaTop5)
print(listaSomaTop5)
