git pull
docker network create global
docker-compose -f "traefik/docker-compose.yml" down
docker-compose -f "traefik/docker-compose.yml" up -d
docker-compose -f "portainer/docker-compose.yml" down
docker-compose -f "portainer/docker-compose.yml" up -d
docker-compose -f "jellyfin/docker-compose.yml" down
docker-compose -f "jellyfin/docker-compose.yml" up -d
docker-compose -f "logseq/docker-compose.yml" down
docker-compose -f "logseq/docker-compose.yml" up -d