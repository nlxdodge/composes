#!/bin/bash
source helpers/pull.sh
source helpers/services.sh
source helpers/remove_portfolio.sh

for service in "${services[@]}"; do
  cd /home/nlxdodge/composes/$service/
  pushd .
  docker-compose down
  docker-compose pull
  docker-compose up -d
  popd
done