FROM drf-managed-image
COPY entrypoint.sh /entrypoint.sh
COPY images.txt /images.txt
COPY flower-shop.sh /flower-shop.sh
COPY stop-servers.sh /stop-servers.sh
EXPOSE 8080
CMD ["/entrypoint.sh"]
