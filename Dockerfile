FROM alpine:latest
RUN apk add --no-cache socat

COPY forwarder.sh /forwarder.sh

RUN chmod +x /forwarder.sh

ENTRYPOINT ["/forwarder.sh"]
