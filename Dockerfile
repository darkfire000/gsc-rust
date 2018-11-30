FROM egeeio/steamcmd

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
ARG uid
RUN usermod -u ${uid} gsc
USER gsc
WORKDIR /home/gsc

ENV LD_LIBRARY_PATH=/home/gsc/rustserver:/home/gsc/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}

CMD ["run"]
