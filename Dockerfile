FROM python:3.10-buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install git vim libpq-dev python3-dev build-essential -y

RUN mkdir -p /neiss
WORKDIR /neiss

RUN git clone -b 1.1.1 https://github.com/NEISSproject/tei_entity_enricher.git && git clone -b 1.2.6-ntee1.0.0 https://github.com/NEISSproject/tf2_neiss_nlp.git 
RUN cd /neiss/tf2_neiss_nlp.git && pip install -r requirements
RUN python -m setup develop
RUN cd /neis/tei_entity_enricher &&pip install -r requirements.txt
RUN python -m setup develop

CMD ["/bin/bash"]