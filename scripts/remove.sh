#!/bin/bash
source helpers/pull.sh
source helpers/services.sh

for service in "${services[@]}"; do
  cd ~/composes/$service/
  pushd .
  docker-compose down
  popd
done