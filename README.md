[![Build and publish Docker image](https://github.com/csae8092/neiss/actions/workflows/build.yml/badge.svg)](https://github.com/csae8092/neiss/actions/workflows/build.yml)

# dockerized neiss tei enricher

repo for a dockerized verison on [NEISS tei_entity_enricher](https://github.com/NEISSproject/tei_entity_enricher)

## building the image

* `docker build -t neiss:latest .`

## running the image

Make sure you have a directory called `data` in your current working direcotry so you can mount XML/TEI files you'd want to process.

`docker run -v $PWD/data:/neiss/data --name neiss neiss:latest`

### using the published image

`docker run -v $PWD/data:/neiss/data --name neiss ghcr.io/csae8092/neiss:main`