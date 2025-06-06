#!/bin/bash
source helpers/pull.sh
source helpers/services.sh

for service in "${services[@]}"; do
  cd /home/nlxdodge/composes/$service/
  pushd .
  docker-compose up -d
  popd
done