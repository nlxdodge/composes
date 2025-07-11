#!/bin/bash
source helpers/pull.sh
source helpers/services.sh

if "portfolio" in "${services[@]}"; do
  docker rm portfolio
  docker image remove portfolio_portfolio
done

for service in "${services[@]}"; do
  cd /home/nlxdodge/composes/$service/
  pushd .
  docker-compose stop
  popd
done