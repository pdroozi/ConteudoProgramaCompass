import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter

dataframeLimpo = pd.read_csv("dataframeLimpo.csv")

## Q1

contagem = dataframeLimpo['Artist'].value_counts()
artistaFrequente = contagem.idxmax()

dadosArtistaFrequente = dataframeLimpo[dataframeLimpo['Artist'] == artistaFrequente]

mediaArtistaFrequente = dadosArtistaFrequente['Actual gross'].mean()

respostaQ1 = f"{artistaFrequente} com media de faturamento bruto de {mediaArtistaFrequente:,.0f}"
print(respostaQ1 + '\n')

## Q2

turnesMesmoaAno = dataframeLimpo[dataframeLimpo['Start year'] == dataframeLimpo['End year']]

mediaTurnesMesmoAno = turnesMesmoaAno.groupby('Tour title')['Average gross'].mean()

turne_nm1 = mediaTurnesMesmoAno.idxmax()
media_turne_nm1 = mediaTurnesMesmoAno.max()

respostaQ2 = f"{turne_nm1} com media de {media_turne_nm1:,.0f}"
print(respostaQ2 + '\n')

## Q3

dataframeLimpo['Adusted_Gross_PerShow'] = dataframeLimpo['Adjustedgross (in 2022 dollars)'] / dataframeLimpo['Shows']

gps_top3 = dataframeLimpo.sort_values(by='Adusted_Gross_PerShow', ascending=False).head(3)

respostaQ3 = "\n".join(
    [f"{i+1}. {row['Tour title']} | {row['Artist']} | {row['Adusted_Gross_PerShow']:,.0f}" for i, row in gps_top3.iterrows()]
)
print(respostaQ3 + '\n')

with open("/saida/respostas.txt", "w") as arquivo_resposta:
    arquivo_resposta.write("Q1:\n\n")
    arquivo_resposta.write(f"--- {respostaQ1}\n\n")

    arquivo_resposta.write("Q2:\n\n")
    arquivo_resposta.write(f"--- {respostaQ2}\n\n")

    arquivo_resposta.write("Q3:\n\n")
    arquivo_resposta.write(f"--- {respostaQ3}\n\n")

## Q4

dataframeArtistaTurnes = dataframeLimpo[dataframeLimpo['Artist'] == artistaFrequente]
dataframeArtistaTurnes = dataframeArtistaTurnes.groupby('Start year')['Actual gross'].sum().sort_index()

plt.style.use('dark_background')

plt.figure(figsize=(12, 8))

plt.plot(dataframeArtistaTurnes.index, dataframeArtistaTurnes.values, marker='o', color='yellow')

plt.title(f'Faturamento por ano das turnês do/a artista {artistaFrequente}', fontsize=18, color='white', pad=20)
plt.xlabel('Start year', fontsize=14, color='white')
plt.ylabel('Actual Gross (em milhões)', fontsize=14, color='white')

formatter = FuncFormatter(lambda x, pos: f'{x / 1e6:.0f}M')
plt.gca().yaxis.set_major_formatter(formatter)

plt.tick_params(axis='x', colors='white')
plt.tick_params(axis='y', colors='white')

plt.grid(color='white', linestyle='--', linewidth=0.5, alpha=0.3)

plt.gca().spines['top'].set_visible(False)
plt.gca().spines['right'].set_visible(False)
plt.gca().spines['left'].set_color('white')
plt.gca().spines['bottom'].set_color('white')

plt.tight_layout()
plt.savefig("/saida/Q4.png")

## Q5

dataQTDShows = dataframeLimpo.groupby('Artist')['Shows'].sum().nlargest(5)

plt.style.use('dark_background')
plt.figure(figsize=(12, 8))
dataQTDShows.plot(kind='bar', color='purple', edgecolor='white', linewidth=1)

plt.grid(color='white', linestyle='--', linewidth=0.5, alpha=0.3)

plt.title('Artistas que realizaram mais shows', fontsize=18, color='white', pad=20)
plt.xlabel('Artist', fontsize=14, color='white')
plt.ylabel('Quantidade Shows', fontsize=14, color='white')

plt.tick_params(axis='x', colors='white')
plt.tick_params(axis='y', colors='white')
plt.xticks(rotation=45, ha='right', fontsize=12, color='white')

plt.gca().spines['top'].set_visible(False)
plt.gca().spines['right'].set_visible(False)
plt.gca().spines['left'].set_color('white')
plt.gca().spines['bottom'].set_color('white')

plt.tight_layout()
plt.savefig("/saida/Q5.png")
