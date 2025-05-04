def divisaoListas (listaOriginal):
    divInteiro = len(listaOriginal) // 3

    lista0 = listaOriginal[0:divInteiro]
    lista1 = listaOriginal[divInteiro:(divInteiro*2)]
    lista2 = listaOriginal[(divInteiro*2):(divInteiro*3)]
    print(lista0, lista1, lista2)

listaOriginal = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
divisaoListas(listaOriginal)