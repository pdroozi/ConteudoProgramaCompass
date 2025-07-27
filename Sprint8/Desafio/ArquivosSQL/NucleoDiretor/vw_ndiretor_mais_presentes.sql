CREATE OR REPLACE VIEW vw_ndiretores_mais_presentes AS
SELECT
  dd.name,
  COUNT(DISTINCT pfd.id_filme) AS qtd_filmes
FROM ponte_filme_diretor pfd
JOIN dim_diretor dd ON dd.id_diretor = pfd.id_diretor
WHERE dd.name != 'Greta Gerwig'
GROUP BY dd.name
ORDER BY qtd_filmes DESC