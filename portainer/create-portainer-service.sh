#!/bin/bash

docker service create \
--name portainer \
--publish 9000:9000 \
--constraint 'node.role == manager' \
--mount type=bind,src=//var/run/docker.sock,dst=/var/run/docker.sock \
--mount type=bind,src=/data/portainer,dst=/data \
portainer/portainer \
--host unix:///var/run/docker.sock \
--ssl \
--sslcert /data/certificate/portainer.crt \
--sslkey /data/certificate/portainer.key
