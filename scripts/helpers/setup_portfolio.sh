#!/bin/bash
if [[ "${services[@]}" =~ "portfolio" ]]; then
    echo "Pulling portfolio Git changes"
    git -C /home/nlxdodge/composes/portfolio/repo fetch origin
    git -C /home/nlxdodge/composes/portfolio/repo reset --hard origin/master
    
    echo "Building docker portfolio image for local registry"
    docker build --no-cache -t portfolio:latest /home/nlxdodge/composes/portfolio  
fi