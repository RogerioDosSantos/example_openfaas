#!/usr/bin/env bash

pushd "$(dirname "$0")"

#Start Docker Swarm
docker swarm init

#Login to the DockerHub that will receive the immages
docker login

# Intall OpenFaaS cli
curl -sL cli.openfaas.com | sudo sh

# Deploy OpenFaaS
git clone https://github.com/openfaas/faas
cd faas
git checkout master
./deploy_stack.sh --no-auth

popd
