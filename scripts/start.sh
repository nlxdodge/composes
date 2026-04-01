#!/bin/bash
source scripts/helpers/pull.sh
source scripts/helpers/services.sh
source scripts/helpers/remove_portfolio.sh
source scripts/helpers/setup_portfolio.sh

for service in "${services[@]}"; do
  cd $service/
  pushd .
  docker-compose up -d
  popd
done
