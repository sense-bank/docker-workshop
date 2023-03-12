FROM debian
COPY . /opt/
EXPOSE 8080
RUN apt-get update && apt-get install -y curl
CMD while true; do { echo -e 'HTTP/1.1 200 OK\n\nVersion: v1.0.0'; }|nc -vlp 8080;done