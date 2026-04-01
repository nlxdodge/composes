#!/bin/bash
source scripts/helpers/pull.sh
source scripts/helpers/services.sh
source scripts/helpers/remove_portfolio.sh

for service in "${services[@]}"; do
  cd $service/
  pushd .
  docker-compose down
  popd
done

