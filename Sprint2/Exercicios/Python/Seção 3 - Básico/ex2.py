listaPalavras = ['maça', 'arara', 'audio', 'radio', 'radar', 'moto']

for x in listaPalavras :
    palavraInvertida = x[::-1]
    
    if x == palavraInvertida:
        print ('A palavra: ' + x + ' é um palíndromo')
    else:
        print ('A palavra: ' + x + ' não é um palíndromo')
