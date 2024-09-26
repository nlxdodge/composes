#!/bin/bash
git pull

services=("jellyfin")

for service in "${services[@]}"; do
  cd "../$service/"
  pushd .
  docker-compose down
  docker-compose up -d
  popd
done