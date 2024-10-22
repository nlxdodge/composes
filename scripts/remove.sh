#!/bin/bash
git pull

services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("traefik" "portainer" "scrutiny" "jellyfin" "bedrock")
fi

for service in "${services[@]}"; do
  cd "../$service/"
  pushd .
  docker-compose down
  popd
done