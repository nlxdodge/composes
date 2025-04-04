#!/bin/bash
source pull.sh

services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("traefik" "portainer" "scrutiny" "jellyfin" "bedrock" "immich")
fi

for service in "${services[@]}"; do
  cd ~/composes/$service/
  pushd .
  docker-compose down
  popd
done