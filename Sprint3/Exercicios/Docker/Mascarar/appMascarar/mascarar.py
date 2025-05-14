import hashlib

def mascarar():
    dados = input("Digite os dados que quer mascarar: ")

    hashing = hashlib.sha1()
    hashing.update(dados.encode('utf-8'))
    dados_hash = hashing.hexdigest()

    print(f"Hash dos dados: {dados_hash}")

    continuar = input("Deseja continuar? (s/n): ")
    if continuar.lower() == 's':
        mascarar()
    elif continuar.lower() == 'n':
        print("Progrmaa encerrado.")
    else:
        print("Opção inválida. Encerrando o programa.")
        return

mascarar()
