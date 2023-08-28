#!/data/data/com.termux/files/usr/bin/env bash

git clone https://github.com/Generator/termux-motd.git /data/data/com.termux/files/usr/etc/motd

[ $(basename $SHELL) == "zsh" ] && _PROFILE=/data/data/com.termux/files/usr/zprofile || _PROFILE=/data/data/com.termux/files/usr/etc/profile
[ $(grep "/data/data/com.termux/files/usr/etc/motd/init.sh" $_PROFILE) != "0" ] && echo "/data/data/com.termux/files/usr/etc/motd/init.sh" >> $_PROFILE
