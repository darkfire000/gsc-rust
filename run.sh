#!/bin/bash
WORK_DIR="/home/gsc/server_files"
ESSENTIAL_FILE="$WORK_DIR/RustDedicated"
if [ ! -f "$ESSENTIAL_FILE" ]; then
  echo "Beginning initial bootstrap, please wait..."
  update
  echo "Bootstrap finished, launching server..."
fi
$WORK_DIR/RustDedicated \
  +server.ip ${IP} \
  +server.port ${PORT} \
  +server.tickrate ${TICKRATE} \
  +server.identity ${SERVER_ID} \
  +server.saveinterval ${SAVEINTERVAL} \
  +rcon.web ${RCONWEB} \
  +rcon.ip ${IP} \
  +rcon.port ${RCONPORT} \
  +rcon.password ${RCONPASSWORD} \
  -logfile $WORK_DIR/server.log &
tail -f $WORK_DIR/server.log
