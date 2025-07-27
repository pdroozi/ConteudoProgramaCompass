CREATE OR REPLACE VIEW vw_natores_mais_populares AS
SELECT
  da.name,
  da.popularity
FROM ponte_filme_ator pfa
JOIN dim_ator da ON da.id_ator = pfa.id_ator
WHERE da.name != 'Greta Gerwig'
GROUP BY da.name, da.popularity