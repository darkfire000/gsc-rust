#!/bin/bash

# This export is required because the version of Steamworks.NET that Rust ships wish is broken
export LD_LIBRARY_PATH=/home/rust/rustserver:/home/rust/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH};

ip="0.0.0.0"
port="28015"
rconport="28015"
rconpassword="_CHANGEME_"
rconweb="1"
servername="egeeio"
serverid=$SERVER_ID
maxplayers="2"
seed=""
worldsize="2000"
saveinterval="300"
tickrate="30"

/home/rust/rustserver/RustDedicated -batchmode +server.ip ${ip} +server.port ${port} +server.tickrate ${tickrate} +server.hostname ${servername} +server.identity ${SERVER_ID} +server.maxplayers ${maxplayers} +server.worldsize ${worldsize} +server.saveinterval ${saveinterval} +rcon.web ${rconweb} +rcon.ip ${ip} +rcon.port ${rconport} +rcon.password ${rconpassword} -logfile buttface.log
