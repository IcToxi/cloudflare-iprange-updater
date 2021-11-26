# cloudflare-iprange-updater
This script aims to automatically update nginx rules for only the servers from cloudflare to have access to your own server.
# usage
Add these following rules into your server block:
```
    include cf.conf;
    deny all;
```
then
```
chmod +x ./updater.sh
./updater.sh
```
By default, a `cf.conf` will be generated in `/etc/nginx/`.
# as a daily use
```
sudo crontab -e
@daily updater.sh &> /dev/null
```
