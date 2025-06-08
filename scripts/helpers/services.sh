#!/bin/bash
services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("bedrock" "immich" "jellyfin" "portainer" "portfolio" "scrutiny" "traefik" "watchtower")
fi