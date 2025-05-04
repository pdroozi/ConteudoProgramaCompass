def calcular_valor_maximo(operadores, operandos) -> float:
    operacoes = {
        '+': lambda a, b: a + b,
        '-': lambda a, b: a - b,
        '*': lambda a, b: a * b,
        '/': lambda a, b: a / b,
        '%': lambda a, b: a % b
    }

    valores = map(lambda tupla: operacoes[tupla[0]](tupla[1][0], tupla[1][1]),zip(operadores, operandos))
    return float(max(valores))
    
operadores = ['+','-','*','/','+']
operandos  = [(3,6), (-7,4.9), (8,-8), (10,2), (8,4)]