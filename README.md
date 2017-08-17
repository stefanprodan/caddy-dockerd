# caddy-dockerd

Caddy reverse proxy for Docker Remote API with IP filter

### Setup dockerd

Expose Docker remote API on localhost in /etc/systemd/system/docker.service.d/docker.conf

```bash
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// \
  -H tcp://127.0.0.1:2375 \
  --storage-driver=overlay2 \
  --dns 8.8.4.4 --dns 8.8.8.8 \
  --log-driver json-file \
  --log-opt max-size=50m --log-opt max-file=10 
```

### Run Caddy

Filter Docker API access by IPv4 or IPv6 or range of IPs

```bash
docker run -d -e IP=86.124.244.168 \
    --net=host \
    --name=caddy-dockerd \
    --restart=always \
    stefanprodan/caddy-dockerd
```

### Docker remote access

```bash
$ export DOCKER_HOST=tcp://<DOCKER-IP>:7575

$ docker info
```
