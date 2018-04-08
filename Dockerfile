FROM alpine:latest
LABEL MAINTAINER="layker <waterzds@gmail.com>"

ENV CONFD_VERSION="0.15.0" \
    CONFD_URL="https://github.com/kelseyhightower/confd/releases/download"

RUN apk --no-cache --update add ca-certificates openssl \
 && wget -T 5 ${CONFD_URL}/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 -O /bin/confd \
 && chmod +x /bin/confd \
 && apk del ca-certificates openssl

RUN apk add --no-cache nginx \
 && mkdir -p /run/nginx \
 && rm -rf /var/cache/apk/* \
 && rm -rf /etc/nginx/*

ADD config /etc/confd
COPY run.sh /run.sh

CMD ["sh", "/run.sh"]
