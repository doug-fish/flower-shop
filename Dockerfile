FROM drf-managed-image
RUN adduser --uid 1001 --gid 0 -c "Flower User" flower-user
RUN mkdir -m 775 /test-dir && chown flower-user:root /test-dir
RUN yum install -y nc && \
    yum install -y net-tools
COPY entrypoint.sh /entrypoint.sh
COPY images.txt /images.txt
COPY flower-shop.sh /flower-shop.sh
COPY stop-servers.sh /stop-servers.sh
USER 1001
EXPOSE 8080
CMD ["/entrypoint.sh"]
