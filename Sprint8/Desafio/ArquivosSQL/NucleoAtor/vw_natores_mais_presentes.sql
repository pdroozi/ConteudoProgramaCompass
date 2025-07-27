CREATE OR REPLACE VIEW vw_natores_mais_presentes AS
SELECT
  da.name,
  COUNT(DISTINCT pfa.id_filme) AS qtd_filmes
FROM ponte_filme_ator pfa
JOIN dim_ator da ON da.id_ator = pfa.id_ator
WHERE da.name != 'Greta Gerwig'
GROUP BY da.name