CREATE OR REPLACE VIEW vw_ndiretores_percentual_genero AS
SELECT
  CASE 
    WHEN dd.gender = 1 THEN 'Feminino'
    WHEN dd.gender = 2 THEN 'Masculino'
    ELSE 'Outro/Desconhecido'
  END AS genero,
  COUNT(DISTINCT dd.id_diretor) AS qtd_diretores
FROM ponte_filme_diretor pfd
JOIN dim_diretor dd ON dd.id_diretor = pfd.id_diretor
JOIN ponte_filme_ator pfa ON pfa.id_filme = pfd.id_filme
JOIN dim_ator da ON da.id_ator = pfa.id_ator
WHERE da.name = 'Greta Gerwig' AND dd.name != 'Greta Gerwig'
GROUP BY
    CASE 
        WHEN dd.gender = 1 THEN 'Feminino'
        WHEN dd.gender = 2 THEN 'Masculino'
        ELSE 'Outro/Desconhecido'
    END