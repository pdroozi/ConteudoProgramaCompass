CREATE OR REPLACE VIEW vw_nfilmes_melhores_avaliacoes AS
SELECT
  f.id_filme,
  df.title,
  f.rating_rottentomatoes,
  f.rating_imdb,
  f.rating_metacritic
FROM fato f
JOIN dim_filme df ON f.id_filme = df.id_filme
GROUP BY f.id_filme, df.title, f.rating_rottentomatoes, f.rating_imdb, f.rating_metacritic