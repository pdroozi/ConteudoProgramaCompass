import json

with open ('person.json', 'r', encoding='utf-8') as arquivo:
    infos = json.load(arquivo)
print(infos)