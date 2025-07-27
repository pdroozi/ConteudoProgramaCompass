CREATE OR REPLACE VIEW vw_nfilmes_percentual_genero AS
SELECT
  nome_genero,
  COUNT(DISTINCT id_filme) AS qtd_filmes,
FROM ponte_filme_genero pfg
JOIN dim_genero dg ON pfg.id_genero = dg.id_genero
GROUP BY nome_genero