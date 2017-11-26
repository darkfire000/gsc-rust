FROM fedora
RUN dnf install -y glibc.i686 libstdc++.i686

RUN adduser rust
RUN chown rust /home/rust
USER rust

RUN mkdir /home/rust/steamcmd
WORKDIR /home/rust/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zvxf -
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/rust/rustserver +app_update 258550 validate +quit
ADD run.sh /home/rust/rustserver/run.sh
USER root
RUN chown rust /home/rust/rustserver/run.sh
USER rust
WORKDIR /home/rust/rustserver

EXPOSE 28015/udp
EXPOSE 28016/tcp

CMD ["/home/rust/rustserver/run.sh"]
