#!/bin/bash
services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("traefik" "portainer" "scrutiny" "jellyfin" "watchtower")
fi
