FROM stefanprodan/caddy

COPY conf /etc/caddy/

EXPOSE 7575

HEALTHCHECK --interval=1m --timeout=15s \
    CMD curl -f http://127.0.0.1:7575/version || exit 1

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["caddy", "-agree", "--conf", "/etc/caddy/Caddyfile"]
