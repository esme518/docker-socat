#
# Dockerfile for socat
#

FROM alpine

RUN set -ex \
    && apk add --update socat \
    && rm -rf /var/cache/apk

ENV PORT  8388
ENV HOST  example.com

EXPOSE $PORT/tcp
EXPOSE $PORT/udp

CMD socat -d -d TCP4-LISTEN:$PORT,fork,reuseaddr TCP4:$HOST:$PORT & \
    socat -d -d UDP4-LISTEN:$PORT,fork,reuseaddr UDP4:$HOST:$PORT
