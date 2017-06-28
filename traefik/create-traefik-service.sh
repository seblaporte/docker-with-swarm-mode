#!/bin/bash

docker service create \
--name traefik \
--publish 80:80 \
--publish 443:443 \
--publish 8080:8080 \
--network external-network \
--constraint=node.role==manager \
--replicas 2 \
--mount type=bind,src=/data/traefik/traefik.toml,dst=/etc/traefik/traefik.toml \
--mount type=bind,src=/data/traefik/certificate,dst=/etc/traefik/certificate \
--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
traefik \
--docker \
--docker.swarmmode \
--docker.watch \
--web

