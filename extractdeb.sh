#!/bin/bash -e

DIRNAME=$(dirname "$0")


containerID=$(docker run --detach magnetikonline/keepassxdeb)
docker cp "$containerID:/root/build/keepassx-2.0.3/build/keepassx_2.0.3-1_amd64.deb" "$DIRNAME"
sleep 1
docker rm $containerID
