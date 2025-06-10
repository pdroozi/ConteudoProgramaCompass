from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Contador").getOrCreate()

arquivo = spark.sparkContext.textFile("README.md")

map = arquivo.flatMap(lambda linha: linha.split()).map(lambda palavra: (palavra, 1)).reduceByKey(lambda a, b: a+b).sortBy(lambda x: x[1], ascending= False)

for x , y in map.collect():
    print(f"{x}: {y}")

spark.stop()