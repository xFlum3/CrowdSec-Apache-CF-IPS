#!/bin/bash

TARGET_FILE=/etc/apache2/conf-available/remoteip.conf
REAL_HEADER="CF-Connecting-IP"

echo "# AUTOGENERATED FILE" > $TARGET_FILE

echo "RemoteIPHeader $REAL_HEADER" >> $TARGET_FILE

echo "# Cloudflare IPv4 ranges" >> $TARGET_FILE
for i in $(curl -s https://www.cloudflare.com/ips-v4); do
   echo "RemoteIPTrustedProxy $i" >> $TARGET_FILE
done

echo "# Cloudflare IPv6 ranges" >> $TARGET_FILE
for i in $(curl -s https://www.cloudflare.com/ips-v6); do
   echo "RemoteIPTrustedProxy $i" >> $TARGET_FILE
done

