#!/bin/bash
TEMP_DIR="/home/gsc/rustserver"
WORK_DIR="/home/gsc/server_files"
if [ -d "$TEMP_DIR" ]; then
  echo "Beginning initial bootstrap, please wait..."
  cp -r $TEMP_DIR/* $WORK_DIR
  # rm -rf $TEMP_DIR
  echo "Bootstrap finished, launching server..."
fi
touch /home/gsc/server_files/server.log
/home/gsc/server_files/RustDedicated \
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
tail -f /home/gsc/server_files/server.log
