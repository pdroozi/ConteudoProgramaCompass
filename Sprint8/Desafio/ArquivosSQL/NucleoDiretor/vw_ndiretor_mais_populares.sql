CREATE OR REPLACE VIEW vw_ndiretores_mais_populares AS
SELECT
  dd.name,
  dd.popularity
FROM dim_diretor dd
WHERE dd.name != 'Greta Gerwig'
GROUP BY dd.name, dd.popularity