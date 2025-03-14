## update repositories
source pull.sh

## create global network for all containers to share if needed
docker network inspect global >/dev/null 2>&1

## setup and copy over rtorrent confiruration
mkdir -p ~/configurations/rtorrent
mkdir -p ~/servers/bedrock

# clone portfolio repository
git clone https://github.com/nlxdodge/portfolio-astro.git ~/portfolio-astro
