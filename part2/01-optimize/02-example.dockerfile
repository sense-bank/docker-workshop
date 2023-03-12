FROM alpine
COPY . /opt/
EXPOSE 8080
RUN apk add --no-cache curl
CMD while true; do { echo -e 'HTTP/1.1 200 OK\n\nVersion: v1.0.0'; }|nc -vlp 8080;done