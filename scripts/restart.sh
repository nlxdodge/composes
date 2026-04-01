#!/bin/bash
source scripts/helpers/pull.sh
source scripts/helpers/services.sh

for service in "${services[@]}"; do
  cd $service/
  pushd .
  docker-compose down
  docker-compose up -d
  popd
done
