FROM ubuntu:14.04

COPY enabled.sh /enabled.sh
# reference to http://www.public-domain-photos.com/flowers/apricot-colored-rose-closeup-3.htm
CMD ["enabled.sh", "http://www.public-domain-photos.com/free-stock-photos-3-big/flowers/apricot-colored-rose-closeup.jpg"]
