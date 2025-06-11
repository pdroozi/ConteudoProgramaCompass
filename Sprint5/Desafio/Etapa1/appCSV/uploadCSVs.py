import boto3

session = boto3.Session(profile_name='pdroozi')
s3_client = session.client('s3')

bucket_name = 'bucket-desafio-pedrofigueiredo'

file_name1 = 'movies.csv'
file_name2 = 'series.csv'

s3_client.create_bucket(Bucket=bucket_name)
print("Bucket criado com sucesso!")

s3_client.upload_file('data/movies.csv', bucket_name, f'Raw/Local/CSV/Movies/2025/06/10/movies.csv')
print("Arquivo movies.csv enviado com sucesso!")

s3_client.upload_file('data/series.csv', bucket_name, f'Raw/Local/CSV/Series/2025/06/10/series.csv')
print("Arquivo series.csv enviado com sucesso!")