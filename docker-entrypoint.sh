#!/bin/bash

cd /opt/steamcmd/
echo "nameserver 8.8.8.8" > /etc/resolv.conf
ping -c 10 www.ru
if [ ! -f /opt/steamcmd/csgo/finish ]; then
    ./steamcmd.sh +login anonymous +force_install_dir /opt/steamcmd/csgo +app_update 740 validate +quit
    echo "Done" > /opt/steamcmd/csgo/finish
fi
cd /opt/steamcmd/csgo
exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_bomb
