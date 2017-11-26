FROM fedora
RUN dnf install -y glibc.i686 libstdc++.i686
RUN mkdir /steamcmd
WORKDIR /steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zvxf -
RUN ./steamcmd.sh +login anonymous +force_install_dir \rust +app_update 258550 validate +quit

# RUN adduser rust
# RUN chown rust /home/rust

# ADD linuxgsm.sh /home/rust/linuxgsm.sh
# RUN chown rust /home/rust/linuxgsm.sh
# USER rust
# WORKDIR /home/rust
# RUN bash linuxgsm.sh rustserver
# RUN ./rustserver auto-install

# USER root

# ADD cfg/server.cfg /home/rust/serverfiles/server/rustserver/cfg/server.cfg
# RUN chown rust /home/rust/serverfiles/server/rustserver/cfg/server.cfg

# USER rust
# RUN echo rconpassword="__PASSWORD__" > /home/rust/lgsm/config-lgsm/rustserver/rustserver.cfg

# EXPOSE 28015/udp
# EXPOSE 28016/tcp

CMD ["/steamcmd/steamcmd.sh"]
