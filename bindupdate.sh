#!/bin/sh
echo -e "\E[33;40m[*] Checking if Bind9 is installed.\e[0m"
if [ -f /etc/init.d/bind9 ];  then
  echo -e "\E[32;40m Bind9 is installed!!! \e[0m"
  echo -e "\E[32;40m[*] Updating your bind9 ad-block list Okay! [*]\e[0m"
  sleep 2
  wget -O /etc/bind/named.conf.ads  "http://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig;showintro=0&mimetype=plaintext"
  sleep 2
  echo"reloading Bind9"
  /etc/init.d/bind9 reload
  exit 1
else 
  echo -e "\e[0;31m Bind9 is not installed \e[0;31m"
  exit 1
fi

