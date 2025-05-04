class Aviao:
    
    cor = 'Azul'
    
    def __init__(self, modelo, velocidade_maxima, capacidade):
        self.modelo = modelo
        self.velocidade_maxima = velocidade_maxima
        self.capacidade = capacidade

a1 = Aviao("BOIENG456", "1500 km/h", 400)
a2 = Aviao("Embraer Praetor 600", "863 km/h", 14)
a3 = Aviao("Antonov An-2", "258 km/h", 12)

lista_avioes = [a1, a2, a3]

for x in lista_avioes:
    print(f'O avião de modelo {x.modelo} possui uma velocidade máxima de {x.velocidade_maxima}, capacidade para {x.capacidade} passageiros e é da cor {Aviao.cor}')