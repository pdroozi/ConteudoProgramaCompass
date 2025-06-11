import requests

API_KEY = '7e445e966d6fea412f21014021c4d40f'
BASE = 'https://api.themoviedb.org/3/discover/movie'

params_and = {'api_key': API_KEY, 'with_genres': '18,10749', 'page': 1}
params_or  = {'api_key': API_KEY, 'with_genres': '18|10749', 'page': 1}

r_and = requests.get(BASE, params=params_and).json()
r_or = requests.get(BASE, params=params_or).json()

print("AND → total_results:", r_and.get('total_results'))
print("OR  → total_results:", r_or.get('total_results'))
