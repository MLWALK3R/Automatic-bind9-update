#!/bin/sh
echo -e "\E[32;40m[*] Updating your bind9 ad-block list Okay! [*]\e[0m"
sleep 2
wget -O /etc/bind/named.conf.ads  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig;showintro=0&mimetype=plaintext"
sleep 2
echo"reloading Bind9"
/etc/init.d/bind9 reload

