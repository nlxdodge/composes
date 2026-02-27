#!/bin/bash
if [[ "${services[@]}" =~ "portfolio" ]]; then
    echo "Remove portfolio container and image from local registry"
    docker rmi -f portfolio:latest
fi
