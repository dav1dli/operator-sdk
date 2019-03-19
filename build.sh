#!/bin/bash
docker build -t operator-sdk:build . -f Dockerfile.sdk-build 
[ $(docker ps -a -f name=extract -q) ] && docker rm $(docker ps -a -f name=extract -q) 
docker container create --name extract operator-sdk:build
docker container cp extract:/operator-sdk ./operator-sdk
docker build -t operator-sdk-base . -f Dockerfile.sdk-base
rm -f operator-sdk
echo "Tag the image: docker tag operator-sdk-base <repo>/<project>/operator-sdk-base"
echo "Push the image: docker push <repo>/<project>/operator-sdk-base"

