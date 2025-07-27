CREATE OR REPLACE VIEW vw_nfilmes_participacao_greta AS
SELECT
  departamento,
  COUNT(DISTINCT id_filme) AS qtd_filmes,
FROM (
  SELECT pfa.id_filme, da.known_for_department AS departamento
  FROM dim_ator da
  JOIN ponte_filme_ator pfa ON da.id_ator = pfa.id_ator
  WHERE da.name = 'Greta Gerwig'

  UNION ALL

  SELECT pfd.id_filme, dd.known_for_department AS departamento
  FROM dim_diretor dd
  JOIN ponte_filme_diretor pfd ON dd.id_diretor = pfd.id_diretor
  WHERE dd.name = 'Greta Gerwig'
)
GROUP BY departamento