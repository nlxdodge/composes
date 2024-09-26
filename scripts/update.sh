#!/bin/bash
git pull

services=("traefik" "portainer" "scrutiny" "jellyfin")

for service in "${services[@]}"; do
  cd "../$service/"
  pushd .
  docker-compose down
  # docker-compose pull
  docker-compose up -d
  popd
done