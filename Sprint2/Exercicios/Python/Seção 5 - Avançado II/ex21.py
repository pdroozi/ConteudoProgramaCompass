def conta_vogais(texto:str)-> int:
    return len(list(filter(lambda x: x in 'aAeEiIoOuU', texto)))
    
texto1 = "Esse é o teste1 da funcao"
texto2 = "E este é o test2 da funcao"

conta_vogais(texto1)
conta_vogais(texto2)