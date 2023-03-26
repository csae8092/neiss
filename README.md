# try and fail repo to dockerize neiss

### building the image

* `docker build -t neiss:latest .`

`docker run -v $PWD:/neiss --name  neiss neiss:latest`