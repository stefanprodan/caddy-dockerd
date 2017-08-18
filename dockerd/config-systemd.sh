#!/usr/bin/env bash

mkdir -p /etc/systemd/system/docker.service.d

cp docker.conf /etc/systemd/system/docker.service.d/docker.conf

systemctl daemon-reload
systemctl restart docker
