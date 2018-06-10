#!/bin/bash
touch /home/gsc/rustserver/server.log
/home/gsc/rustserver/RustDedicated \
  +server.ip ${IP} \
  +server.port ${PORT} \
  +server.tickrate ${TICKRATE} \
  +server.identity ${SERVER_ID} \
  +server.saveinterval ${SAVEINTERVAL} \
  +rcon.web ${RCONWEB} \
  +rcon.ip ${IP} \
  +rcon.port ${RCONPORT} \
  +rcon.password ${RCONPASSWORD} \
  -logfile server.log &
tail -f /home/gsc/rustserver/server.log
