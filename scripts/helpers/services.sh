#!/bin/bash
services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("bedrock" "jellyfin" "portainer" "scrutiny" "traefik" "watchtower")
fi