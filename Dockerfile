FROM ubuntu:14.04

COPY entrypoint.sh /entrypoint.sh
# reference to http://www.public-domain-photos.com/flowers/apricot-colored-rose-closeup-3.htm
CMD ["/entrypoint.sh", "http://www.public-domain-photos.com/free-stock-photos-3-big/flowers/apricot-colored-rose-closeup.jpg"]
