CREATE OR REPLACE VIEW vw_nprodutoras_receita_custo_lucro AS
SELECT
  dp.name,
  df.id_filme,
  df.title,
  f.revenue,
  f.budget,
  (f.revenue - f.budget) AS lucro
FROM ponte_filme_produtora pfp
JOIN dim_produtora dp ON dp.id_produtora = pfp.id_produtora
JOIN fato f ON f.id_filme = pfp.id_filme
JOIN dim_filme df ON df.id_filme = pfp.id_filme
GROUP BY dp.name, df.id_filme, df.title, f.revenue, f.budget