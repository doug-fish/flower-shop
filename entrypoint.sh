#!/bin/bash

# Copyright 2016 IBM Corp. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the “License”);
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an “AS IS” BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

MYIP=$(/sbin/ifconfig |grep 'inet '|grep -v 127.0.0.1|
    awk -F: '{print $2}'| awk '{print $1}');

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
