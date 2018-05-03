FROM egeeio/steamcmd

RUN ./steamcmd.sh +login anonymous +force_install_dir /opt/rustserver +app_update 258550 validate +quit
RUN dnf install -y wget unzip
RUN cd /tmp/ && wget https://github.com/OxideMod/Oxide/releases/download/latest/Oxide-Rust.zip
RUN cd /tmp/ && unzip Oxide-Rust.zip
RUN cp -rf /tmp/RustDedicated_Data /opt/rustserver/
