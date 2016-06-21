#'Flower Shop' Overview

Flower Shop is an app suitable for demonstrating that container load balancing is happening. It includes a Dockerfile to build it into a container image, and startup scripting to make it easier to show a failure scenario.

Flower Shop includes the IP address of the OS it has been served from. This is for the purpose of understanding how load balancing is performing. The IP address is hashed into an index to choose a flower that associated with the server. Again, the purpose is to expose different servers running behind a load balance; the flower image is intended to make the difference more visual.

Flower Shop has scripting included to break the service. Basically you just exec into the container and run stop-servers.sh. See below for details.

## Running Flower Shop on Bluemix

You can deploy Flower-Shop into your own IBM Bluemix space by clicking this button:

[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/doug-fish/flower-shop)

You'll be guided through logging in to your IBM Bluemix account, or signed up for a trial one if you don't already have one. Then a new container group with 2 instances will be deployed into IBM Containers.

This tutorial will be helpful in getting started with IBM Containers. Tutorial 1 will help you get the command line set up so you are ready to interact with your containers. 
https://new-console.ng.bluemix.net/docs/containers/container_gettingstarted_tutorial_lesson1.html#container_gettingstarted_tutorial_lesson_1

The other steps are informative, but not directly required for using the demo.

Once your command line is set up, you can see the containers in the group with the command

    cf ic group instances flower-shop

You can interact with a container with this command, then issue commands inside the container

    cf ic exec -t -i [containerid] bash

For example, to stop the flower-shop app to show failover or otherwise test load balancing, stop the processes for flower-shop.sh script, plus any `nc` processes. You just need to run ./stop-services.sh to accomplish this.

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
    root@instance-0047d230:/# ./stop-services.sh

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

