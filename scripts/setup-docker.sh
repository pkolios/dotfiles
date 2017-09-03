#!/bin/bash

docker-machine create -d virtualbox \
    --virtualbox-boot2docker-url=https://github.com/boot2docker/boot2docker/releases/download/v17.07.0-ce/boot2docker.iso \
    --virtualbox-memory "4096" \
    --virtualbox-disk-size "40000" \
    default

docker-machine-nfs default \
    --mount-opts="noacl,async,nolock,vers=3,udp,noatime,actimeo=2" \
    --shared-folder="/Users/$USER/projects"
