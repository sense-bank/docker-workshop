#prepare: docker rmi -f $(docker images -q) && docker system prune -f
#-layers
#-cache
#-dockerignore
FROM debian
COPY . /opt/
RUN apt-get update && apt-get install -y curl
# RUN rm -rf /var/lib/apt/lists/*
CMD while true; do { echo -e 'HTTP/1.1 200 OK\n\nVersion: v1.0.0'; }|nc -vlp 8080;done
EXPOSE 8080