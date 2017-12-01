#!/bin/bash
touch /home/rust/rustserver/server.log
/home/rust/rustserver/RustDedicated \
  +server.ip ${IP} \
  +server.seed ${SEED} \
  +server.port ${PORT} \
  +server.tickrate ${TICKRATE} \
  +server.hostname ${SERVERNAME} \
  +server.identity ${SERVER_ID} \
  +server.maxplayers ${MAXPLAYERS} \
  +server.worldsize ${WORLDSIZE} \
  +server.saveinterval ${SAVEINTERVAL} \
  +rcon.web ${RCONWEB} \
  +rcon.ip ${IP} \
  +rcon.port ${RCONPORT} \
  +rcon.password ${RCONPASSWORD} \
  -logfile server.log &
tail -f /home/rust/rustserver/server.log
