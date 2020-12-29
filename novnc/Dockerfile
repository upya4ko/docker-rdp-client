FROM debian:buster
LABEL com.local.version="0.0.3"
LABEL com.local.is-production="True"

ARG appPath=/app \
    appUser=novnc

RUN apt update \
    && apt install -y \
    novnc \
    && apt clean \
    && rm -rf /var/cache/* \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --home-dir $appPath \
    --create-home \
    $appUser

WORKDIR $appPath

ENV HOME=$appPath 

EXPOSE 80

USER $appUser

CMD ["/usr/bin/websockify",\
     "--web","/usr/share/novnc/", \
     "80", \
     "app:5900", \
     "--verbose"]

