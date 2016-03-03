# Eclipse Docker Image

## Description

This Docker image is based on flem/eclipse and provides plugins :

- Eclipse Perl (EPIC - Eclipse Perl Integration)
- Eclipse Subversive (subversion - SVN)


## Usage

```
$ mkdir $(pwd)/docker-eclipse-perl-epic
$ docker run -d --name eclipse_perl_epic \
             -v /etc/localtime:/etc/localtime:ro \
             -v /etc/timezone:/etc/timezone:ro \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -e DISPLAY=unix$DISPLAY \
             -v $(pwd)/docker-eclipse-perl-epic:/home/developer \
             flem/eclipse-perl-epic
```

