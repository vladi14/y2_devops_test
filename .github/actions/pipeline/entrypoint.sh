#!/bin/bash

## realy on the fact that there is docker repository configured
echo "Hello from brnach: ${GITHUB_REF##*/}"

## env setup
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

##key for docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

## fingerprint
sudo apt-key fingerprint 0EBFCD88

##repo for docker
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

## docker install
 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io

## install verify
sudo docker run hello-world

## build our image
docker build . -t my-image

##change tag for created image
docker tag my-image ${GITHUB_REF##*/}-sha

## push + deploy assuming we have docker hub account
#docker push  <username/registrey_name>
kubectl apply -f deployment.yaml