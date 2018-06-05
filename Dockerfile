FROM egeeio/steamcmd

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
RUN update
USER gsc
WORKDIR /home/gsc/rustserver
ENV LD_LIBRARY_PATH=/home/gsc/rustserver:/home/gsc/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
ENV update=/update
ENV run=/run

CMD ["run"]
