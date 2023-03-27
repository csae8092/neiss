FROM python:3.8-buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install git vim libpq-dev python3-dev build-essential -y
RUN pip install -U pip setuptools

RUN mkdir -p /neiss
WORKDIR /neiss

RUN git clone -b 1.1.1 https://github.com/NEISSproject/tei_entity_enricher.git && git clone -b 1.2.6-ntee1.0.0 https://github.com/NEISSproject/tf2_neiss_nlp.git 
WORKDIR /neiss/tf2_neiss_nlp 
RUN pip install -r requirements.txt
RUN python -m setup develop
WORKDIR /neiss/tei_entity_enricher
RUN pip install -r requirements.txt
RUN python -m setup develop
WORKDIR /neiss
VOLUME /neiss/data

CMD ["ntee-start"]