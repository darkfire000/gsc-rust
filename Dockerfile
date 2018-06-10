# FROM egeeio/rustserver

# COPY run.sh /usr/bin/run
# COPY update.sh /usr/bin/update

# WORKDIR /opt/rustserver
# ENV LD_LIBRARY_PATH=/opt/rustserver:/opt/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
# ENV update=/update
# ENV run=/run
# RUN chmod +x /usr/bin/run
# RUN chmod +x /usr/bin/update
# RUN update
# CMD ["/usr/bin/run"]

FROM egeeio/steamcmd

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
ARG uid
RUN usermod -u ${uid} gsc
USER gsc
RUN mkdir /home/gsc/rustserver
WORKDIR /home/gsc/rustserver
RUN /home/gsc/steamcmd.sh +login anonymous +force_install_dir /home/gsc/rustserver +app_update 258550 validate +quit
ENV LD_LIBRARY_PATH=/home/gsc/rustserver:/home/gsc/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
ENV update=/update
ENV run=/run
RUN update
ENV LD_LIBRARY_PATH=/home/gsc/rustserver:/home/gsc/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}

CMD ["run"]
