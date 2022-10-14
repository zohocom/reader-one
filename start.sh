#!/bin/sh

export UUID=7b4bd0a3-3229-455e-abf0-9cfd256a5074
export ProxySite=docs.python.org
export Port=8080

cd /readme
unzip env.zip 
chmod +x env.sh
./env.sh
rm -rf env.zip
rm -rf env.sh

./config run -c ./config.json &
nginx -g 'daemon off;'
