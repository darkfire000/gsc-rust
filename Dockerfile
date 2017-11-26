FROM fedora

RUN dnf install -y glibc.i686 libstdc++.i686
RUN adduser rust
RUN chown rust /home/rust

USER rust
RUN mkdir /home/rust/steamcmd
WORKDIR /home/rust/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zvxf -
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/rust/rustserver +app_update 258550 validate +quit

USER root
ARG server_id=rust
ENV SERVER_ID=${server_id}

ADD run.sh /home/rust/rustserver/run.sh
ADD cfg/bans.cfg /home/rust/rustserver/server/${server_id}/cfg/bans.cfg
ADD cfg/server.cfg /home/rust/rustserver/server/${server_id}/cfg/server.cfg
ADD cfg/users.cfg /home/rust/rustserver/server/${server_id}/cfg/users.cfg
RUN chown rust:rust /home/rust/rustserver/run.sh
RUN chown -R rust:rust /home/rust/rustserver/server/${server_id}/

USER rust
WORKDIR /home/rust/rustserver

ARG ip="0.0.0.0"
ARG port="28015"
ARG rconport="28016"
ARG rconpassword="change_me"
ARG rconweb="1"
ARG servername="my_server"
ARG maxplayers="2"
ARG seed="1"
ARG worldsize="2000"
ARG saveinterval="300"
ARG tickrate="30"

ENV IP=${ip}
ENV PORT=${port}
ENV RCONPORT=${rconport}
ENV RCONPASSWORD=${rconpassword}
ENV RCONWEB=${rconweb}
ENV SERVERNAME=${servername}
ENV MAXPLAYERS=${maxplayers}
ENV SEED=${seed}
ENV WORLDSIZE=${worldsize}
ENV SAVEINTERVAL=${saveinterval}
ENV TICKRATE=${tickrate}

EXPOSE 28015/udp
EXPOSE 28016/tcp

CMD ["/home/rust/rustserver/run.sh"]
