#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

#set -x

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
adduser -s /bin/bash -u $USER_ID -S user
export HOME=/home/user

#id user

mkdir -p /var/lib/influxdb /var/log/influxdb

chown user /var/lib/influxdb -R
chown user /var/log/influxdb -R

exec /usr/local/bin/gosu user influxd

