#!/bin/bash
# should run in the ash shell, but I don't have that installed

MYIP=$(/sbin/ifconfig |grep 'inet addr'|grep -v 127.0.0.1|awk -F: '{print $2}'| awk '{print $1}');

HASHHEX=$(echo $MYIP | /usr/bin/md5sum | awk '{print $1}')
HASH=$((16#$HASHHEX))
PICCOUNT=$(cat images.txt | wc -l)
PICINDEX=$(($HASH % $PICCOUNT + 1))
PICTURE=$(sed "$((PICINDEX))q;d" images.txt)

./flower-shop.sh $PICTURE &
sleep 60*60*24
