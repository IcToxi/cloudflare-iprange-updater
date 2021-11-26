#!/bin/bash
#
#  This script aims to automatically update nginx rules for only the servers from cloudflare to have access to your own server.  
#
#  To make this work, you may need to add these following rules into your server block:
#    include cf.conf;
#    deny all;
#
#  AS a daily use, you could attach it to task scheduler, such as using crontab.
#

generateRules() {
	urlList=$1
	ips=''
	for e in ${urlList[@]}; do
		ips="$ips $(curl -s $e)"
	done
	echo -n $ips | awk -v RS=" " '{print "allow  " $0 ";"}'
}

updateFile() {
	targetFile=$1
	rules=$2
	$(>$targetFile)
	echo "$rules" >>$targetFile
}

urlList=('https://www.cloudflare.com/ips-v4' 'https://www.cloudflare.com/ips-v6')

targetFile='/etc/nginx/cf.conf'

updateFile $targetFile "$(generateRules $urlList)"

nginx -s reload

