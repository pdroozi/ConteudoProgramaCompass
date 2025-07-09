Table fato_filme {
  id_filme int [pk]
  id_data date
  orcamento bigint
  revenue bigint
  box_office bigint
  vote_average float
  vote_count int
  vote_imdb int
  rating_imdb string
  rating_rotten_tomatoes string
  rating_metacritic string
  oscars int
  wins int
  nominations int
}


Table dim_filme {
  id_filme int [pk]
  imdb_id string
  titulo string
  runtime int
  type string
  idioma string
  pais_origem string
  data_lancamento date
}
Table dim_tempo {
  id_data date [pk]
  ano int
  mes int
  dia int
  bimestre int
  trimestre int
  semestre int
  dia_semana string
}

Ref: fato_filme.id_filme > dim_filme.id_filme
Ref: fato_filme.id_data > dim_tempo.id_data


Table dim_ator {
  id_ator int [pk]
  nome string
  genero int
  popularity float
  personagem string
  ordem int
  departamento string
}
Table fato_filme_ator {
  id_filme int
  id_ator int
}

Ref: fato_filme_ator.id_filme > fato_filme.id_filme
Ref: fato_filme_ator.id_ator > dim_ator.id_ator


Table dim_diretor {
  id_diretor int [pk]
  nome string
  genero int
  popularity float
  departamento string
}
Table fato_filme_diretor {
  id_filme int
  id_diretor int
}

Ref: fato_filme_diretor.id_filme > fato_filme.id_filme
Ref: fato_filme_diretor.id_diretor > dim_diretor.id_diretor


Table dim_produtora {
  id_produtora int [pk]
  nome_produtora string
  origin_country string
  headquarters string
}
Table fato_filme_produtora {
  id_filme int
  id_produtora int
}

Ref: fato_filme_produtora.id_filme > fato_filme.id_filme
Ref: fato_filme_produtora.id_produtora > dim_produtora.id_produtora


Table dim_genero {
  id_genero int [pk]
  nome_genero string
}
Table fato_filme_genero {
  id_filme int
  id_genero int
}

Ref: fato_filme_genero.id_filme > fato_filme.id_filme
Ref: fato_filme_genero.id_genero > dim_genero.id_genero
