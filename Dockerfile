FROM python:3.10-slim-buster
USER root
RUN mkdir /app
COPY . /app/
WORKDIR /app/
RUN apt-get update && apt-get install -y python3 && pip install -r requirements.txt
ENV AWS_DEFAULT_REGION = "us-east-1"
ENV BUCKET_NAME="mynetworksecurityproject"
ENV PREDICTION_BUCKET_NAME="my-network-datasource"
ENV AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW_CORE_DAGBAG_IMPORT_TIMEOUT=1000
ENV AIRFLOW_CORE_ENABLE_XCOM_PICKLING=True
RUN airflow db init
RUN airflow users create -e bhaveshwaghbw.49@gmail.com -f bhavesh -l wagh -p admin -r Admin -u admin
RUN chmod 777 start.sh
RUN apt update -y
ENTRYPOINT [ "/bin/sh" ]
CMD ["start.sh"]