FROM alpine:edge

COPY conf /etc/caddy/

RUN apk --update upgrade \
    && apk add --no-cache --no-progress tini ca-certificates \
    && apk add --no-cache --no-progress --virtual .build_tools wget curl tar bash \
    && wget -qO- https://getcaddy.com \
      | bash -s http.ipfilter \
    && apk del --purge .build_tools \
    && mkdir /.caddy \
    && rm -rf \
      /usr/share/doc \
      /usr/share/man \
      /tmp/* \
      /var/cache/apk/*

EXPOSE 7575

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["caddy", "-agree", "--conf", "/etc/caddy/Caddyfile"]
