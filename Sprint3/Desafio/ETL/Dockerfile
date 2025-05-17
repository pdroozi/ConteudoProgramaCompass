FROM python:3

WORKDIR /appETL

COPY appETL/ .

RUN pip install pandas matplotlib

RUN mkdir -p /saida

CMD ["python", "etl.py"]
