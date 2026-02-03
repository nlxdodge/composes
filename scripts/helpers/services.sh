#!/bin/bash
services=("$@")
if [ ${#services[@]} -eq 0 ]; then
  services=("traefik" "arcane" "scrutiny" "jellyfin" "watchtower")
fi
