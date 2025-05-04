import csv

def processamentoDados(arquivo_csv):
    arquivo = open (arquivo_csv, mode = 'r')
    leitura = csv.reader(arquivo)
    dfEstudantes = list(leitura)
    
    infos = map(lambda linha: {
        'nome': linha[0],
        'maiores_notas': sorted(map(int, linha[1:]), reverse=True)[:3],
        'media_notas': round(sum(sorted(map(int, linha[1:]), reverse=True)[:3]) / 3, 2)
    }, dfEstudantes)
    
    infosOrdenadas = sorted(infos, key=lambda x: x['nome'])
    
    for estudante in infosOrdenadas:
        print(f"Nome: {estudante['nome']} Notas: {estudante['maiores_notas']} Média: {estudante['media_notas']}")

processamentoDados("estudantes.csv")