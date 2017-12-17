FROM egeeio/rustserver

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
COPY cfg/bans.cfg /opt/rustserver/server/${server_id}/cfg/bans.cfg
COPY cfg/server.cfg /opt/rustserver/server/${server_id}/cfg/server.cfg
COPY cfg/users.cfg /opt/rustserver/server/${server_id}/cfg/users.cfg

WORKDIR /opt/rustserver
ENV LD_LIBRARY_PATH=/opt/rustserver:/opt/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
CMD ["run"]
