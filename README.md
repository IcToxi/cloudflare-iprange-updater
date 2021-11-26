# cloudflare-iprange-updater
This script aims to automatically update nginx rules for only the servers from cloudflare to have access to your own server.
# usage
```
chmod +x ./updater.sh
./updater.sh
```
# as a daily use
```
sudo crontab -e
@daily updater.sh &> /dev/null
```
