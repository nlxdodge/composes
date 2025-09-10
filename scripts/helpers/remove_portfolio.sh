#!/bin/bash
if [[ "${services[@]}" =~ "portfolio" ]]; then
  docker stop portfolio
  docker rm portfolio
  docker image rm portfolio_portfolio
fi