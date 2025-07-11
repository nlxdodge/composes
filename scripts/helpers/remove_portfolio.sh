#!/bin/bash
if [[ " ${services[@]} " =~ " portfolio " ]]; then
  docker rm portfolio
  docker image rm portfolio_portfolio
fi