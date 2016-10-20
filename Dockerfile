FROM ubuntu:14.04
COPY entrypoint.sh /entrypoint.sh
COPY images.txt /images.txt
COPY flower-shop.sh /flower-shop.sh
COPY stop-servers.sh /stop-servers.sh
EXPOSE 80
CMD ["/entrypoint.sh"]
