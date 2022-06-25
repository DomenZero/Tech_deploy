FROM python:3.8.5-alpine
ARG BUILT_AT
ARG DEPLOY_AT
WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt

ENTRYPOINT ["python","app.py"]

EXPOSE 80 8080