#!/bin/sh
  echo -e "\E[33;40m[*] Checking if Bind9 is installed.\e[0m"
  if [ -f /etc/init.d/bind9 ]; then
  echo -e "\E[32;40m Bind9 is installed \e[0m"
  sleep 1
  echo -e "\E[33;40m[*] Checking the Bind9 folder [*]\e[0m"
    if [ -f /etc/bind/named.conf.ads  ];  then
      echo -e "\E[32;40m[*] Check done [*]\e[0m" 
    echo -e "\E[33;40m[*] Updating your ad-block list [*]\e[0m"
    sleep 2
    curl -s "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig;showintro=0&mimetype=plaintext" > /etc/bind/named.conf.ads
    sed -i 's:null.zone.file:/etc/bind/null.zone.file:g' /etc/bind/named.conf.ads
    echo -e "reloading bind9"
    /etc/init.d/bind9 restart
    echo -e "\E[32;40m[*] updated ad list [*]\e[0m"
  else 
    echo -e "\E[32;40m[*] Check done [*]\e[0m" 
    echo -e "\E[32;40m[*] This is your first time running this script! [*]\e[0m"
    sleep 1
    echo -e "\E[32;40m[*] Updating your ad-block list [*]\e[0m"
    sleep 2
    curl -s "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig;showintro=0&mimetype=plaintext" > /etc/bind/named.conf.ads
    sed -i 's:null.zone.file:/etc/bind/null.zone.file:g' /etc/bind/named.conf.ads
    echo -e "reloading bind9"
    /etc/init.d/bind9 restart
    echo -e "\E[32;40m[*] Update done [*]\e[0m"

    fi
else 
  echo -e "\e[0;31m bind9 is not installed or missing \e[0m"
  exit 1
  fi

if [ -f /etc/cron.d/bind9ads.cron ]; then
  echo -e "\E[32;40m Cron already installed \e[0m"
  echo -e "\E[32;40m Finished Script \e[0m"
else
  echo -e "\E[33;40m Adding null zone file [*]\e[0m"
  touch /etc/bind/null.zone.file
  cat > /etc/bind/null.zone.file <<EOF
  \$TTL    86400   ; one day

  @       IN      SOA     ns0.example.net.      hostmaster.example.net. (
                         2002061000       ; serial number YYMMDDNN
                         28800   ; refresh  8 hours
                         7200    ; retry    2 hours
                         864000  ; expire  10 days
                         86400 ) ; min ttl  1 day
                 NS      ns0.example.net.
                 NS      ns1.example.net.

                 A       127.0.0.1

  *               IN      A       127.0.0.1

EOF
  read -p "Add to Cron? . (y/n) " REPLY
  if [ "$REPLY" = "y" ]; then
    echo -e "\E[33;40m[*] Adding Cron task [*]\e[0m"
    curl -s "https://raw.githubusercontent.com/MLWALK3R/Automatic-bind9-update/master/bind9ads.cron" > /etc/cron.d/bind9ads.cron
    echo -e "\E[32;40m[*] Done [*]\e[0m"
    exit 1
  else
    echo -e "\E[32;40m Ok have it your way \e[0m"
    exit 1

  fi
fi
