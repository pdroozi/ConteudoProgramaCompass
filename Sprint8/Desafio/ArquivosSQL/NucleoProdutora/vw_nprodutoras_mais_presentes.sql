CREATE OR REPLACE VIEW vw_nprodutoras_mais_presentes AS
SELECT
  dp.name,
  COUNT(DISTINCT pfp.id_filme) AS qtd_filmes
FROM ponte_filme_produtora pfp
JOIN dim_produtora dp ON dp.id_produtora = pfp.id_produtora
GROUP BY dp.name