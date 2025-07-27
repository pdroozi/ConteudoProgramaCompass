CREATE OR REPLACE VIEW vw_nfilmes_receita_custo_lucro AS
SELECT
  dt.ano,
  SUM(f.budget) AS budget_total,
  SUM(f.revenue) AS receita_total,
  SUM(f.revenue - f.budget) AS lucro_total
FROM fato f
JOIN dim_tempo dt ON f.id_data = dt.id_data
GROUP BY dt.ano
ORDER BY dt.ano