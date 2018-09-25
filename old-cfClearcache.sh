#!/bin/bash

ZONE_ID="f884d5e5fd58c3b217f3e97eefa123f2"
API_KEY="122b0dde11c2869f785405a4e954ea6d3672a"
EMAIL_ID="tengyee@plus65.com.sg"

curl -X DELETE "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
-H "X-Auth-Email: $EMAIL_ID" \
-H "X-Auth-Key: $API_KEY" \
-H "Content-Type: application/json" \
--data '{"purge_everything":true}'

