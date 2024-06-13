git pull
docker-compose -f "traefik/docker-compose" down
docker-compose -f "traefik/docker-compose" up -d
docker-compose -f "portainer/docker-compose" down
docker-compose -f "portainer/docker-compose" up -d
docker-compose -f "jellyfin/docker-compose" down
docker-compose -f "jellyfin/docker-compose" up -d