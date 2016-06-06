build the project with 

    git clone https://github.rtp.raleigh.ibm.com/drfish-us/flower-shop
    cd flower-shop
    cf ic build -t registry.ng.bluemix.net/drfish/flower-shop .

launch the container in a group with

    cf ic group create -p 80 --auto --name flower-shop registry.ng.bluemix.net/drfish/flower-shop

make it available with

    cf ic route map -n drf-flowershop -d mybluemix.net flower-shop

Used images
http://www.public-domain-photos.com/flowers/daisy-detail-4.htm
http://www.public-domain-photos.com/flowers/apricot-colored-rose-closeup-3.htm
http://www.public-domain-photos.com/flowers/pink-flowers-4.htm
can we do this?
