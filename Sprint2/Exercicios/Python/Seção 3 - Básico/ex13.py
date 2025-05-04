import random

random_list = random.sample(range(500), 50)
random_list_ordenada = sorted(random_list)
numeros = len(random_list)

if numeros % 2 == 0:
    mediana = (random_list_ordenada[(numeros // 2) - 1] + random_list_ordenada[numeros // 2]) /2
else:
    mediana = random_list_ordenada[numeros // 2]
media = sum(random_list) / numeros
valor_minimo = min(random_list)
valor_maximo = max(random_list)

print(f'Media: {media}, Mediana: {mediana}, Mínimo: {valor_minimo}, Máximo: {valor_maximo}')