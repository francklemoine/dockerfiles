# DESCRIPTION: Run Firefox into a container
#              For specific use, I needed an oldest version with Java include in it
# BUILD:       docker build -t flem/firefox-29 .
# RUN:         mkdir $(pwd)/docker-firefox-29
#              docker run -d --name eclipse_perl_epic \
#                         -v /etc/localtime:/etc/localtime:ro \
#                         -v /etc/timezone:/etc/timezone:ro \
#                         -v /tmp/.X11-unix:/tmp/.X11-unix \
#                         -e DISPLAY=unix$DISPLAY \
#                         -v $(pwd)/docker-firefox-29/.cache/mozilla:/root/.cache/mozilla \
#                         -v $(pwd)/docker-firefox-29/.mozilla:/root/.mozilla \
#                         -v $(pwd)/docker-firefox-29/Downloads:/root/Downloads \
#                         -v $(pwd)/docker-firefox-29/Pictures:/root/Pictures \
#                         -v $(pwd)/docker-firefox-29/Torrents:/root/Torrents \
#                         flem/firefox-29


FROM java:8-jre
MAINTAINER Franck Lemoine <franck.lemoine@flem.fr>

# properly setup debian sources
ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
	&& test -z ${http_proxy}  || /bin/echo -e "Acquire::http::proxy \"${http_proxy}\";\n" >>/etc/apt/apt.conf \
	&& test -z ${https_proxy} || /bin/echo -e "Acquire::https::proxy \"${https_proxy}\";\n" >>/etc/apt/apt.conf \
	&& sed -i.bak 's/\(debian [a-z]\+ main\)/\1 contrib/g' /etc/apt/sources.list \
	&& apt-get -y update \
	&& apt-get install -y \
		bzip2 \
		ca-certificates \
		curl \
		flashplugin-nonfree \
		hicolor-icon-theme \
		libasound2 \
		libdbus-glib-1-2 \
		libgl1-mesa-dri \
		libgl1-mesa-glx \
		libcanberra-gtk-module \
		--no-install-recommends \
	&& apt-get clean autoclean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /tmp/*

ENV FIREFOX_VERSION 29.0
ENV LANG en-US

RUN curl -sSL "https://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${FIREFOX_VERSION}/linux-x86_64/${LANG}/firefox-${FIREFOX_VERSION}.tar.bz2" -o /tmp/firefox.tar.bz2 \
	&& mkdir -p /opt/firefox \
	&& tar -xjf /tmp/firefox.tar.bz2 -C /opt/firefox --strip-components 1 \
	&& rm /tmp/firefox.tar.bz2* \
	&& ln -s /opt/firefox/firefox /usr/bin/firefox

COPY local.conf /etc/fonts/local.conf

ENTRYPOINT [ "/usr/bin/firefox" ]

