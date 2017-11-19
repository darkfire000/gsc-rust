FROM ubuntu:16.04
ENV TERM=xterm-256color

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y nano mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc tmux lib32gcc1 libstdc++6 libstdc++6:i386 libcurl4-gnutls-dev:i386 libtcmalloc-minimal4:i386 lib32tinfo5 lib32ncurses5

RUN adduser rust
RUN chown rust /home/rust

ADD linuxgsm.sh /home/rust/linuxgsm.sh
RUN chown rust /home/rust/linuxgsm.sh
USER rust
WORKDIR /home/rust
RUN bash linuxgsm.sh rustserver
RUN ./rustserver auto-install

USER root

ADD cfg/server.cfg /home/rust/serverfiles/server/rustserver/cfg/server.cfg
RUN chown rust /home/rust/serverfiles/server/rustserver/cfg/server.cfg

USER rust
RUN sed -i s/_CHANGEME_/CHANGEME/g /home/rust/lgsm/config-lgsm/rustserver/_default.cfg
RUN echo rconpassword="__PASSWORD__" > /home/rust/lgsm/config-lgsm/rustserver/rustserver.cfg
RUN touch /home/rust/lgsm/config-lgsm/rustserver/test.cfg

EXPOSE 28015/udp
EXPOSE 28016/tcp

CMD ["/home/rust/rustserver", "debug"]
