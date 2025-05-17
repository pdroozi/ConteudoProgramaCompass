FROM python:3

WORKDIR /appJOB

COPY appJOB/ .

RUN pip install pandas matplotlib

RUN mkdir -p /saida

CMD ["python", "job.py"]
