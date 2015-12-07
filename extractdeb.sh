#!/bin/bash -e

containerID=$(docker run --detach magnetikonline/buildkeepassx)
docker cp $containerID:/root/build/keepassx-2.0/build/keepassx_2.0-1_amd64.deb .
sleep 1
docker rm $containerID
