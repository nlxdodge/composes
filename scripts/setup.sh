## update repository and create global network for all containers to share if needed
git pull
docker network inspect global >/dev/null 2>&1

## setup and copy over rtorrent confiruration
mkdir -p ~/configurations/rtorrent
mkdir -p ~/servers/bedrock