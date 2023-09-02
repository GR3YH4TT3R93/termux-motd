#!/data/data/com.termux/files/usr/bin/env bash

clear

[ -d "/data/data/com.termux/files/usr/etc/motd" ] && MOTD="/data/data/com.termux/files/usr/etc/motd"

for i in $(find $MOTD -maxdepth 1 -regex '.+/[0-9\-].+' -not -regex ".+\.disabled" | sort)
do
    bash $i
done
