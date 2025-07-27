CREATE OR REPLACE VIEW vw_nprodutoras_pais_origem AS
SELECT
  dp.origin_country,
  COUNT(DISTINCT dp.id_produtora) AS qtd_produtoras
FROM ponte_filme_produtora pfp
JOIN dim_produtora dp ON dp.id_produtora = pfp.id_produtora
GROUP BY dp.origin_country