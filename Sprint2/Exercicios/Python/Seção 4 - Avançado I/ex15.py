class Passaro:
    def voar(self):
        print('Voando..')
    def emitirsom(self):
        print('Animal emitindo som...')

class Pato(Passaro):
    def emitirsom(self):
        print('Pato emitindo som...')
        print('Quack Quack')

class Pardal(Passaro):
    def emitirsom(self):
        print('Pardal emitindo som...')
        print('Piu Piu')


print('Pato')
p1 = Pato()
p1.voar()
p1.emitirsom()

print('Pardal')
pa1 = Pardal()
pa1.voar()
pa1.emitirsom()