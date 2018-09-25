#!/bin/bash

if [ $# -lt 1 ]
then
	echo "Usage: $0 <Domain Name>"
	exit
fi

API_KEY="122b0dde11c2869f785405a4e954ea6d3672a"
EMAIL_ID="tengyee@plus65.com.sg"

case "$1" in
'dg-coin.com')
ZONE_ID="2bf1b78adb650052b9671d6f52483998"
echo "Clearing cache for $1, ZoneID is $ZONE_ID ..."
;;
'zazz-hotel.com')
ZONE_ID="f884d5e5fd58c3b217f3e97eefa123f2"
echo "Clearing cache for $1, ZoneID is $ZONE_ID ..."
;;
'zazz-island.com')
ZONE_ID="i3f866b9e71cef2932025150e26f3434d"
echo "Clearing cache for $1, ZoneID is $ZONE_ID ..."
;;
*) 
echo "Domain not found!"
;;
esac

curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
-H "X-Auth-Email: $EMAIL_ID" \
-H "X-Auth-Key: $API_KEY" \
-H "Content-Type: application/json" \
--data '{"purge_everything":true}'

