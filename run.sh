#!/bin/bash
# This export is required because the version of Steamworks.NET that Rust ships wish is broken
export LD_LIBRARY_PATH=/home/rust/rustserver:/home/rust/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH};

/home/rust/rustserver/RustDedicated -batchmode +server.ip ${IP} +server.seed ${SEED} +server.port ${PORT} +server.tickrate ${TICKRATE} +server.hostname ${SERVERNAME} +server.identity ${SERVER_ID} +server.maxplayers ${MAXPLAYERS} +server.worldsize ${WORLDSIZE} +server.saveinterval ${SAVEINTERVAL} +rcon.web ${RCONWEB} +rcon.ip ${IP} +rcon.port ${RCONPORT} +rcon.password ${RCONPASSWORD} -logfile buttface.log
