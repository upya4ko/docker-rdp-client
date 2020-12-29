FROM  debian:latest
LABEL com.local.version="0.0.4"
LABEL com.local.is-production="True"

ARG appPath=/app
ARG appUser=vncserver

RUN apt update \
  && apt install -y \
#  sudo \
  openbox \
  xterm \
  x11vnc \
  xvfb \
  rdesktop \
  && apt-get clean \
  && rm -rf /var/cache/* \
  && rm -rf /var/lib/apt/lists/*

RUN useradd --home-dir $appPath \
    --create-home \
    $appUser

# Need for debug
#RUN echo "$appUser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$appUser

RUN chown -R $appUser: $appPath

WORKDIR $appPath
USER $appUser

RUN echo "exec openbox-session & \n \
         hostIp=\$(/sbin/ip route|awk '/default/ { print \$3 }') \n \
         rdpUsername=\$(cat /run/secrets/username) \n \
         rdpPassword=\$(cat /run/secrets/password) \n \
         rdesktop -f \$hostIp \
         -u \$rdpUsername \
         -p \$rdpPassword \
         " > ~/.xinitrc \
         && chmod 755 ~/.xinitrc

ENV USER=$appUser \
    HOME=$appPath \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0 \
    RUN_XTERM=no \
    RUN_FLUXBOX=no \
#    X11VNC_CREATE_GEOM=1475x770x16
    X11VNC_CREATE_GEOM=1475x700x16

EXPOSE 5900

CMD ["/usr/bin/x11vnc",\
     "-forever", \
     "-shared", \
     "-sloppy_keys", \
     "-clear_mods", \
     "-desktop", "RDP",\
     "-create"]

