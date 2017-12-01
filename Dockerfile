FROM fedora:27

RUN yum install -y glibc.i686 libstdc++.i686
RUN adduser rust
RUN chown -R rust:rust /home/rust

USER rust
RUN mkdir /home/rust/steamcmd
WORKDIR /home/rust/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zvxf -
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/rust/rustserver +app_update 258550 validate +quit

USER root
COPY run.sh /home/rust/rustserver/run.sh
COPY cfg/bans.cfg /home/rust/rustserver/server/${server_id}/cfg/bans.cfg
COPY cfg/server.cfg /home/rust/rustserver/server/${server_id}/cfg/server.cfg
COPY cfg/users.cfg /home/rust/rustserver/server/${server_id}/cfg/users.cfg
RUN chown rust:rust /home/rust/rustserver/run.sh
RUN chown -R rust:rust /home/rust/rustserver/server/${server_id}/

USER rust
WORKDIR /home/rust/rustserver
ENV LD_LIBRARY_PATH=/home/rust/rustserver:/home/rust/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
CMD ["/home/rust/rustserver/run.sh"]
