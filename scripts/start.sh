docker-compose -f "portainer/docker-compose.yml" stop
docker-compose -f "traefik/docker-compose.yml" stop
docker-compose -f "jellyfin/docker-compose.yml" stop
docker-compose -f "scrutiny/docker-compose.yml" stop