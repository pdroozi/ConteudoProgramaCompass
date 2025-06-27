import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

args = getResolvedOptions(sys.argv, [
    
    'JOB_NAME',
    
    'S3_INPUT_PATH_CSV',
    
    'S3_OUTPUT_PATH_CSV'
])

sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

def conversor_parquet(caminho_entrada, caminho_saida):
    
    df_glue_dynamic = glueContext.create_dynamic_frame.from_options(
        connection_type="s3",
        connection_options={"paths": [caminho_entrada]},
        format="csv",
        format_options={"withHeader": True, "separator": "|"}
    )

    glueContext.write_dynamic_frame.from_options(
        frame=df_glue_dynamic,
        connection_type="s3",
        connection_options={"path": caminho_saida},
        format="parquet"
    )

conversor_parquet(args["S3_INPUT_PATH_CSV"], args["S3_OUTPUT_PATH_CSV"])
job.commit()
