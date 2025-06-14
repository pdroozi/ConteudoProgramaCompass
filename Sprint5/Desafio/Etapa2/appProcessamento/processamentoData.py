import json
import os
import boto3
import pandas as pd
import requests
import numpy as np
from io import BytesIO

def lambda_handler(event, context):


    #Carrega variaveis de ambiente
    API_KEY_TMDB = os.getenv('API_KEY_TMDB')
    API_KEY_OMDB = os.getenv('API_KEY_OMDB')


    #Cria listas para os ids e os dados a serem processados
    dados_filmes = []
    dados_atores = []
    dados_diretores = []
    atores_ids = set()
    diretores_ids = set()


    #Sessão boto3, bucket name e file path do arquivo movies no bucket s3
    s3 = boto3.client('s3')
    bucket_name = 'bucket-desafio-pedrofigueiredo'
    file_path_s3 = f's3://{bucket_name}/Raw/Local/CSV/Movies/2025/06/13/movies.csv'


    #Leitura do csv, filtro pelo nome da artista, e coleto is IDs dos filmes dela no csv
    obj = s3.get_object(Bucket=bucket_name, Key='Raw/Local/CSV/Movies/2025/06/13/movies.csv')
    df  = pd.read_csv(BytesIO(obj['Body'].read()), sep='|', low_memory=False)
    csv_ids = df[df['nomeArtista'].str.contains("Greta Gerwig", case=False, na=False)]['id'].dropna().unique().tolist()
    print('Dataframe lido com sucesso')


    #Com o nome dela, uso o endpoint "person" para encontrar o ID da artista no site do TMDB
    resposta_greta_id = requests.get("https://api.themoviedb.org/3/search/person", params={"api_key": API_KEY_TMDB, "query": "Greta Gerwig"}).json()
    greta_id = resposta_greta_id["results"][0]["id"]
    print('ID da Greta obtido com sucesso')


    # Com o ID da artista no site do TMDB, coleto todos os IDs dos filmes em que ela teve crédito por qualquer função, pelo endpoint "movie_credits"
    resposta_filmes_greta_credits = requests.get(f"https://api.themoviedb.org/3/person/{greta_id}/movie_credits", params={"api_key": API_KEY_TMDB}).json()
    filmes_greta_tmdb_ids = {item["id"] for tipo in ["cast", "crew"] for item in resposta_filmes_greta_credits.get(tipo, [])}
    print('IDS dos filmes da Greta obtidos com sucesso')


    #Converto todos os IDs do csv (que estão em IMDB) para TMDB usando o endpoint "find" e os adiciono na lista de IDs dos filmes da artista
    for id in csv_ids:
        resposta = requests.get(f"https://api.themoviedb.org/3/find/{id}", params={"api_key": API_KEY_TMDB, "external_source": "imdb_id"}).json()
        if resposta["movie_results"]:
            filmes_greta_tmdb_ids.add(resposta["movie_results"][0]["id"])
    print('IDS do csv convertidos de IMDB para TMDB com sucesso')


    #Agora com todos os IDs de todos os filmes da artista, inicio os requests dos dados dos filmes pelo endpoint "movie"
    for id in filmes_greta_tmdb_ids:
        resposta_processamento_filme_id = requests.get(f"https://api.themoviedb.org/3/movie/{id}", params={"api_key": API_KEY_TMDB}).json()
        filme_imdb_id = resposta_processamento_filme_id.get("imdb_id")


        campos_filme_tmdb = {item: resposta_processamento_filme_id.get(item) for item in [

            "budget", 
            "genres", 
            "id", 
            "imdb_id", 
            "origin_country", 
            "original_language",
            "popularity", 
            "production_companies", 
            "production_countries", 
            "release_date",
            "revenue", 
            "runtime", 
            "title", 
            "vote_average", 
            "vote_count"

        ]}


        #Utilizo o ID do mesmo filme para ir no URL do OMDB, e coletar dados complementares (mais especificamente premiações, avaliações e votos atualizados (2025))
        if filme_imdb_id:
            campos_filme_omdb = requests.get("http://www.omdbapi.com/", params={"apikey": API_KEY_OMDB, "i": filme_imdb_id}).json()

            for item in [
                
                "Ratings", 
                "Metascore", 
                "imdbRating",
                "imdbVotes", 
                "imdbID", 
                "Type", 
                "BoxOffice", 
                "Language", 
                "Country", 
                "Awards"
                
            ]:
                campos_filme_tmdb[item] = campos_filme_omdb.get(item)


        #Coleto pelo endpoint "credits" do filme o ID dos 3 principais atores, e do diretor daquele filme
        resposta_processamento_atores_diretores = requests.get(f"https://api.themoviedb.org/3/movie/{filme_imdb_id}/credits", params={"api_key": API_KEY_TMDB}).json()
        atores_ids.update(item["id"] for item in resposta_processamento_atores_diretores.get("cast", [])[:3])
        diretores_ids.update(item["id"] for item in resposta_processamento_atores_diretores.get("crew", []) if item.get("job") == "Director")

        
        #Adiciono esses IDs dentro dos dados dos filmes
        dados_filmes.append(campos_filme_tmdb) 
    print('Dados dos filmes processados com sucesso')


    # Com os IDs dos atores, uso o endpoint "person" para coletar as informações dos atores (mais especificamente a popularidade, genero, e local de nascimento)
    for id in atores_ids:
        campos_atores_tmdb = requests.get(f"https://api.themoviedb.org/3/person/{id}", params={"api_key": API_KEY_TMDB}).json()
        dados_atores.append({item: campos_atores_tmdb.get(item) 
        
        for item in [
            
            "gender", 
            "id", 
            "imdb_id", 
            "known_for_department", 
            "name", 
            "place_of_birth", 
            "popularity"
            
        ]})
    print('Dados dos atores obtidos com sucesso')


    # Com os IDs dos atores, uso o endpoint "person" para coletar as informaçõe dos diretores (mais especificamente a popularidade, genero e local de nascimento)
    for id in diretores_ids:
        campos_diretores_tmdb = requests.get(f"https://api.themoviedb.org/3/person/{id}", params={"api_key": API_KEY_TMDB}).json()
        dados_diretores.append({item: campos_diretores_tmdb.get(item) 
        
        for item in [
            
            "gender", 
            "id", 
            "imdb_id", 
            "known_for_department", 
            "name", 
            "place_of_birth", 
            "popularity"
            
        ]})
    print('Dados dos diretores obtidos com sucesso')


    #Sem precisar de arquivos temporarios, salva os json diretamente no S3
    s3.put_object(
        Bucket="bucket-desafio-pedrofigueiredo",
        Key="Raw/TMDB/JSON/2025/06/13/filmes.json",
        Body=json.dumps(dados_filmes, ensure_ascii=False, indent=2),
        ContentType="application/json"
    )

    s3.put_object(
        Bucket="bucket-desafio-pedrofigueiredo",
        Key="Raw/TMDB/JSON/2025/06/13/atores.json",
        Body=json.dumps(dados_atores, ensure_ascii=False, indent=2),
        ContentType="application/json"
    )

    s3.put_object(
        Bucket="bucket-desafio-pedrofigueiredo",
        Key="Raw/TMDB/JSON/2025/06/13/diretores.json",
        Body=json.dumps(dados_diretores, ensure_ascii=False, indent=2),
        ContentType="application/json"
    )

    print("Arquivos JSON exportados para o S3 com sucesso!")


    # TODO implement
    return {
        'statusCode': 200,
        'body': json.dumps('Processamento executado com sucesso')
    }


