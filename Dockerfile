FROM ubuntu:14.04
COPY entrypoint.sh /entrypoint.sh
COPY images.txt /images.txt
COPY flower-shop.sh /flower-shop.sh
CMD ["/entrypoint.sh"]
