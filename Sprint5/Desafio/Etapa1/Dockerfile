FROM python:3

WORKDIR /app

COPY appCSV/ /app/

RUN pip install --no-cache-dir boto3

CMD ["python", "processamentoCSVs.py"]