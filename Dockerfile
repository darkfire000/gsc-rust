FROM egeeio/rustserver

ARG server_id
ENV SERVER_ID ${server_id}

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
COPY cfg/bans.cfg /opt/rustserver/server/${SERVER_ID}/cfg/bans.cfg
COPY cfg/server.cfg /opt/rustserver/server/${SERVER_ID}/cfg/server.cfg
COPY cfg/users.cfg /opt/rustserver/server/${SERVER_ID}/cfg/users.cfg

WORKDIR /opt/rustserver
ENV LD_LIBRARY_PATH=/opt/rustserver:/opt/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
CMD ["run"]
