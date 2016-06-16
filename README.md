Flower shop is an app suitable for demonstrating that load balancing is happening. It includes a Dockerfile to build it into a container image, and startup scripting to make it easier to show a failure scenario.

In order to use this this with the IBM container service follow Step 1 of this
tutorial:
https://new-console.ng.bluemix.net/docs/containers/container_gettingstarted_tutorial_lesson1.html#container_gettingstarted_tutorial_lesson_1

(The other steps are informative, but not directly required for using the demo)

build the project with 

    git clone https://github.rtp.raleigh.ibm.com/drfish-us/flower-shop
    cd flower-shop
    cf ic build -t registry.ng.bluemix.net/drfish/flower-shop .

launch the container in a group with

    cf ic group create -p 80 --auto --name flower-shop registry.ng.bluemix.net/drfish/flower-shop

make it available with: (You'll probably need to change demo-flowershop to a different name.
I'm using that one!)

    cf ic route map -n demo-flowershop -d mybluemix.net flower-shop

You can see the containers in the group with the command

    cf ic group instances flower-shop

You can interact with a container with this command, then issue commands inside the container

    cf ic exec -t -i [containerid] bash

For example, to stop the flower-shop app to show failover, kill the processes for the flower-shop.sh
script, plus any `nc` processes.

    cf ic exec -i -t a79afc8c-02db-4925-95bb-1140829a9a2a bash
    root@instance-0047d230:/# ps aux                                                                                                                                                                                                                                               
    USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    root           1  0.0  0.0  17972  2792 ?        Ss   14:31   0:00 /bin/bash /entrypoint.sh
    root          38  0.0  0.0  18064  2916 ?        S    14:31   0:00 /bin/bash ./flower-shop.sh http://www.public-domain-photos.com/free-stock-photos-4-big/flowers/daisy-detail.jpg
    root          39  0.0  0.0   4348   640 ?        S    14:31   0:00 sleep 86400
    root         789  0.0  0.0  46012  3072 ?        S    15:41   0:00 sudo nc -l -p 80 -w 1
    root         790  0.0  0.0   9132   800 ?        S    15:41   0:00 nc -l -p 80 -w 1
    root         791  0.1  0.0  18144  3004 ?        Ss   15:52   0:00 bash
    root         834  0.0  0.0  15568  2116 ?        R+   15:54   0:00 ps aux
    root@instance-0047d230:/# kill -9 38 789 790
 
Used images:

		http://www.public-domain-photos.com/flowers/daisy-detail-4.htm
		http://www.public-domain-photos.com/flowers/apricot-colored-rose-closeup-3.htm
		http://www.public-domain-photos.com/flowers/pink-flowers-4.htm
		http://www.public-domain-photos.com/flowers/hibiscus-3-4.htm
		http://www.public-domain-photos.com/flowers/red-tulips-3.htm
		http://www.public-domain-photos.com/flowers/sun-flower-3-4.htm
		http://www.public-domain-photos.com/flowers/orchids-4.htm
		http://www.public-domain-photos.com/flowers/iris-blue-3.htm
		http://www.public-domain-photos.com/flowers/lily-3-1.htm

