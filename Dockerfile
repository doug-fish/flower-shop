FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y netcat-traditional
USER nobody
COPY entrypoint.sh /entrypoint.sh
COPY images.txt /images.txt
COPY flower-shop.sh /flower-shop.sh
COPY stop-servers.sh /stop-servers.sh
EXPOSE 8080
CMD ["/entrypoint.sh"]
