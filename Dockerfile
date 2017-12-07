FROM fedora:27

RUN yum install -y glibc.i686 libstdc++.i686
RUN adduser rust
RUN chown -R rust:rust /home/rust

USER rust
RUN mkdir /home/rust/steamcmd
WORKDIR /home/rust/steamcmd
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zvxf -
RUN ./steamcmd.sh +login anonymous +force_install_dir /home/rust/rustserver +app_update 258550 validate +quit