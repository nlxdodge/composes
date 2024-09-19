docker-compose -f "../portainer/docker-compose.yml" up -d
docker-compose -f "../traefik/docker-compose.yml" up -d
docker-compose -f "../jellyfin/docker-compose.yml" up -d
docker-compose -f "../scrutiny/docker-compose.yml" up -d