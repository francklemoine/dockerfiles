# Firefox Docker Image

## Description

This Docker image provides Firefox :

- an oldest version (v29.0)
- with java (jre 8) included


## Usage

```
$ mkdir $(pwd)/docker-firefox-29
$ docker run -d --name eclipse_perl_epic \
             -v /etc/localtime:/etc/localtime:ro \
             -v /etc/timezone:/etc/timezone:ro \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -e DISPLAY=unix$DISPLAY \
             -v $(pwd)/docker-firefox-29:/home/developer \
             flem/firefox-29
```

