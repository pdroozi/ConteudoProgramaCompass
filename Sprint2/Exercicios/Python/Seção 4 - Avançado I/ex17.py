class Calculo:
    def soma (self, x, y):
        print(f'Somando: {x} + {y} = {x + y}')
        return
    def subt (self, x, y):
        print(f'Subtraindo: {x} - {y} = {x - y}')
        return
        
valores = Calculo()
valores.soma(4, 5)
valores.subt(4, 5)