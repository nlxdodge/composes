git pull
docker network inspect global >/dev/null 2>&1
docker-compose -f "traefik/docker-compose.yml" down
docker-compose -f "portainer/docker-compose.yml" down
docker-compose -f "jellyfin/docker-compose.yml" down
docker-compose -f "scrutiny/docker-compose.yml" down

docker-compose -f "portainer/docker-compose.yml" up -d
docker-compose -f "traefik/docker-compose.yml" up -d
docker-compose -f "jellyfin/docker-compose.yml" up -d
docker-compose -f "scrutiny/docker-compose.yml" up -d