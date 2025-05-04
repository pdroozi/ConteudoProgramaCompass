class Ordenadora:

    def __init__(self, list):
        self.listaBaguncada = list

    def ordenacaoCrescente (self):
        self.listaOrdenadaCrescente = sorted(self.listaBaguncada)
        print(self.listaOrdenadaCrescente)
        return self.listaOrdenadaCrescente
 
    def ordenacaoDecrescente (self):
        self.listaOrdenadaDecrescente = sorted(self.listaBaguncada, reverse = True)
        return self.listaOrdenadaDecrescente


c1 = Ordenadora([3,4,2,1,5])
c1.ordenacaoCrescente()

dc1 = Ordenadora([9,7,6,8])
dc1.ordenacaoDecrescente()