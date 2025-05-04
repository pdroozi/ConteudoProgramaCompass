def maiores_que_media(conteudo):
    media = sum(conteudo.values()) / len(conteudo)
    resultado = sorted(filter(lambda item: item[1] > media, conteudo.items()), key=lambda item: item[1])
    print(list(resultado))
    return list(resultado)

conteudo = {
    "arroz": 4.99,
    "feijão": 3.49,
    "macarrão": 2.99,
    "leite": 3.29,
    "pão": 1.99
}

maiores_que_media(conteudo)