# caddy-dockerd

[![Docker Image](https://images.microbadger.com/badges/image/stefanprodan/caddy-dockerd.svg)](https://hub.docker.com/r/stefanprodan/caddy-dockerd)

Caddy reverse proxy for Docker Remote API with IP filtering. 

### Run Caddy

Filter Docker API access by IPv4 or IPv6 or range of IPs

```bash
docker run -d -e IP=86.124.244.168 \
    --net=host \
    --name=caddy-dockerd \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    stefanprodan/caddy-dockerd:sock
```

Docker Swarm service:

```bash
docker service create -d -e IP=188.27.83.136/30 \
    --network=host \
    --name=caddy-dockerd \
    --mode global \
    --constraint 'node.role == manager' \
    --mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
    stefanprodan/caddy-dockerd:sock
```

Test access on port 7575 with curl:

```bash
curl <DOCKER-IP>:7575/version
```

### Docker remote access

```bash
$ export DOCKER_HOST=tcp://<DOCKER-IP>:7575

$ docker info
```
