def removerDuplicados (lista_duplicada):
    return list(set(lista_duplicada))

lista_duplicada= ['abc', 'abc', 'abc', '123', 'abc', '123', '123']

lista_unica = removerDuplicados(lista_duplicada)
print(lista_unica)