#!/bin/bash
export LD_LIBRARY_PATH=/home/rust/rustserver:/home/rust/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH};

ip="0.0.0.0"
port="28011"
rconport="28012"
rconpassword="_CHANGEME_"
rconweb="1" # Value is: 1 for Facepunch's web panel; 0 for RCON tools like Rusty or Rustadmin
servername="UrFace"
maxplayers="2"

# Advanced Start Settings
seed="" #  default random; range : 1 to 2147483647 ; used to change or reproduce a procedural map
worldsize="2000" # default 3000; range : 1000 to 6000 ; map size in meters
saveinterval="300" # Auto-save in seconds
tickrate="30" # default 30; range : 15 to 100

/home/rust/rustserver/RustDedicated -batchmode +server.ip ${ip} +server.port ${port} +server.tickrate ${tickrate} +server.hostname ${servername} +server.identity test  +server.maxplayers ${maxplayers} +server.worldsize ${worldsize} +server.saveinterval ${saveinterval} +rcon.web ${rconweb} +rcon.ip ${ip} +rcon.port ${rconport} +rcon.password ${rconpassword} -logfile buttface.log
