#!/bin/bash
# should run in the ash shell, but I don't have that installed

MYIP=$(/sbin/ifconfig |grep 'inet addr'|grep -v 127.0.0.1|awk -F: '{print $2}'| awk '{print $1}');

#make sure it starts with a 1 so it isn't negative.
HASHHEX=$(echo $MYIP | /usr/bin/md5sum | awk '{print 1$1}' | cut -c1-8)
HASH=$((16#$HASHHEX))
PICCOUNT=$(cat images.txt | wc -l)
PICINDEX=$(($HASH % $PICCOUNT + 1))
PICTURE=$(sed "$((PICINDEX))q;d" images.txt)

echo "about to start flower shop"
echo "hash: $HASH"
echo "hex: $HASHHEX"
echo "picture count: $PICCOUNT"
echo "index: $PICINDEX"
echo "picture: $PICTURE"


./flower-shop.sh $PICTURE &
# 60*60*24
sleep 86400
