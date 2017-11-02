#!/bin/bash
docker stop registry
docker rm registry
docker run -d -p 5000:5000 --restart=always --name registry -v /mnt/100ext4/registry/:/var/lib/registry registry:2

