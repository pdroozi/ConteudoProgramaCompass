def valorParametros(*args, **kwargs):
    for arg in args:
        print(arg)
        
    for key, value in kwargs.items():
        print(f'{value}')

valorParametros(1, 3, 4, 'hello', parametro_nomeado='alguma coisa', x=20)