lista_nomes_animais = ["Cachorro", "Gato", "Passaro", "Peixe", "Coelho", "Tartaruga", "Lagarto", "Elefante", "Leao", "Tigre", "Urso", "Zebra",
"Girafa", "Cavalo", "Ovelha", "Porco", "Galinha", "Pato", "Ganso", "Rato"]

lista_nomes_animais.sort()

for x in lista_nomes_animais:
    print(x)

with open("animais.txt", "w") as arquivo:
    for x in lista_nomes_animais:
        arquivo.write(x + "\n")
