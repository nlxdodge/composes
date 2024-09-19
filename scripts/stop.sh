#!/bin/bash
git pull

services=("traefik" "portainer" "scrutiny" "jellyfin")

for service in "${services[@]}"; do
  cd "../$service/"
  pushd .
  docker-compose stop
  popd
done
