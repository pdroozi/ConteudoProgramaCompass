import pandas as pd
import re

# Função para limpar valores monetários
def parse_money(value):
    if pd.isna(value):
        return None
    return float(re.sub(r"[^\d.]", "", str(value)))

# Função para limpar strings: remove notas como [4][a], caracteres não ASCII e espaços extras
def clean_text(text):
    if pd.isna(text):
        return ""
    # Remove múltiplas anotações como [4], [a], [21][a]
    text = re.sub(r"(?:\[[^\]]*\])+?", "", text)
    # Remove asteriscos
    text = text.replace("*", "")
    # Remove caracteres não ASCII
    text = re.sub(r"[^\x00-\x7F]+", "", text)
    return text.strip()

# Função para extrair anos de início e fim
def extract_years(year_range):
    years = str(year_range).split('-')
    if len(years) == 2:
        return int(years[0]), int(years[1])
    else:
        year = int(years[0])
        return year, year

# Carregar o CSV original
df = pd.read_csv("concert_tours_by_women.csv")

# Limpar campos monetários
df["Actual gross"] = df["Actual gross"].apply(parse_money)
df["Adjustedgross (in 2022 dollars)"] = df["Adjustedgross (in 2022 dollars)"].apply(parse_money)
df["Average gross"] = df["Average gross"].apply(parse_money)

# Limpar campos de texto
df["Artist"] = df["Artist"].apply(clean_text)
df["Tour title"] = df["Tour title"].apply(clean_text)

# Extrair os anos de início e fim da turnê
df[["Start year", "End year"]] = df["Year(s)"].apply(lambda x: pd.Series(extract_years(x)))

# Selecionar e reordenar as colunas desejadas
df_final = df[[
    "Rank", "Actual gross", "Adjustedgross (in 2022 dollars)", "Artist",
    "Tour title", "Shows", "Average gross", "Start year", "End year"
]]

# Exportar para novo CSV
df_final.to_csv("csv_limpos.csv", index=False)

print("Arquivo 'csv_limpo.csv' gerado com sucesso!")
