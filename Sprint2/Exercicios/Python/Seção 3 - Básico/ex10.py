def somaNumeros (str):
    numerosString = str.split(',')
    soma = 0
    for x in numerosString:
        if x.isdigit():
            soma = soma + int(x)
    return soma

string = '1,3,4,6,10,76'
print(somaNumeros(string))