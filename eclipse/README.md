# Eclipse Docker Image

## Description

This Docker image provides a container with a base installation of Eclipse

## Usage

```
$ mkdir $(pwd)/docker-eclipse
$ docker run -d --name eclipse \
             -v /etc/localtime:/etc/localtime:ro \
             -v /etc/timezone:/etc/timezone:ro \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -e DISPLAY=unix$DISPLAY \
             -v $(pwd)/docker-eclipse:/home/developer \
             flem/eclipse
```

