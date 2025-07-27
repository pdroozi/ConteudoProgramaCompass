CREATE OR REPLACE VIEW vw_natores_percentual_genero AS
SELECT
  CASE 
    WHEN da.gender = 1 THEN 'Feminino'
    WHEN da.gender = 2 THEN 'Masculino'
    ELSE 'Outro/Desconhecido'
  END AS genero,
  COUNT(DISTINCT da.id_ator) AS qtd_atores
FROM ponte_filme_ator pfa
JOIN dim_ator da ON da.id_ator = pfa.id_ator
WHERE da.name != 'Greta Gerwig'
GROUP BY 
    CASE 
        WHEN da.gender = 1 THEN 'Feminino'
        WHEN da.gender = 2 THEN 'Masculino'
        ELSE 'Outro/Desconhecido'
    END