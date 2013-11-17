Automatic-bind9-update
======================

Automatically update pgl.yoyo.org bind9 zonefile


==================
```bash
cd /etc/bind
```
```bash
wget -O /etc/bind/bindupdate.sh https://raw.github.com/MLWALK3R/Automatic-bind9-update/master/bindupdate.sh
```
```bash
chmod +x /etc/bind/bindupdate.sh
```
```bash
nano /etc/cron.d/bindupdate
```

```bash

#minute (0-59)
#|   hour (0-23)
#|   |    day of the month (1-31)
#|   |    |   month of the year (1-12 or Jan-Dec)
#|   |    |   |   day of the week (0-6 with 0=Sun or Sun-Sat)
#|   |    |   |   |   commands
#|   |    |   |   |   |
#### refresh bind anti-ad server list
 15   7   *  *   1   /3 /etc/bind/bindupdate.sh>> /dev/null 2>&1
```
