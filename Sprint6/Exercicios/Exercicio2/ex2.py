from pyspark.sql import SparkSession
from pyspark.sql import functions as F
from pyspark import SparkContext, SQLContext





spark = SparkSession .builder \
    .master("local[*]") \
    .appName("Exercicio Intro") \
    .getOrCreate()





df_nomes = spark.read.csv("../Exercicio1/Etapa3/nomes_aleatorios.txt")
df_nomes.show(5)





df_nomes.printSchema()





df_nomes = df_nomes.withColumnRenamed("_c0", "Nomes")
df_nomes.show(10)





df_nomes = df_nomes.withColumn("Escolaridade", F.element_at( F.array( F.lit("Fundamental"), F.lit("Medio"), F.lit("Superior")),( F.floor( F.rand() * 3) + 1).cast("int")))






df_nomes = df_nomes.withColumn("Pais", F.element_at( F.array( F.lit("Brasil"), F.lit("Argentina"), F.lit("Chile"), F.lit("Uruguai"), F.lit("Paraguai"),
                                                              F.lit("Bolivia"), F.lit("Peru"), F.lit("Colombia"), F.lit("Venezuela"), F.lit("Equador"), 
                                                              F.lit("Suriname"), F.lit("Guiana Francesa"), F.lit("Guiana")),
                                                              ( F.floor( F.rand() * 13) + 1).cast("int")))





df_nomes = df_nomes.withColumn("AnoNascimento", (F.floor(F.rand() * (2010 - 1945 + 1)) + 1945).cast("int"))





df_select = df_nomes.select("Nomes", "Escolaridade", "Pais", "AnoNascimento").filter(F.col("AnoNascimento") >= 2001)
df_select.show(10)





df_nomes.createOrReplaceTempView("pessoas")
spark.sql("SELECT * FROM pessoas WHERE AnoNascimento >= 2001").show(10)





df_nomes.filter((F.col("AnoNascimento") >= 1980) & (F.col("AnoNascimento") <= 1994)).count()





df_nomes.createOrReplaceTempView("millenials")
spark.sql("SELECT COUNT(*) as qtd FROM millenials where AnoNascimento >= 1980 AND AnoNascimento <= 1994").show()





df_nomes.createOrReplaceTempView("geracoes")





resultado = spark.sql("""
    select
        Pais,
        CASE
            WHEN AnoNascimento >= 1944 AND AnoNascimento <= 1964 THEN 'Baby Boomers'
            WHEN AnoNascimento >= 1965 AND AnoNascimento <= 1979 THEN 'Geração X'
            WHEN AnoNascimento >= 1980 AND AnoNascimento <= 1994 THEN 'Millennials'
            WHEN AnoNascimento >= 1995 AND AnoNascimento <= 2015 THEN 'Geração Z'
        END AS Geracao,
        COUNT(*) AS Quantidade
    FROM geracoes
    WHERE AnoNascimento BETWEEN 1944 AND 2015
    GROUP BY Pais, Geracao
    ORDER BY Pais asc, Geracao asc, Quantidade asc
""")
resultado.show()
