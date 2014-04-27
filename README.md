Automatic-bind9-update
======================

This script is desgined to automatically update your name.conf file with URL's from  pgl.yoyo.org, what does  that mean? Means you block ads at the DNS level like a BOSS!


==================

(You will need to add this to named.conf.local  )
```bash 
include "/etc/bind/named.conf.ads";
```
**Curl** (Copy and paste install)
```bash
bash <(curl -s  https://raw.githubusercontent.com/MLWALK3R/Automatic-bind9-update/master/bindupdate.sh ) 
```
