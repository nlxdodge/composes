## update repositories
source pull.sh

## create global network for all containers to share if needed
docker network inspect global >/dev/null 2>&1

## setup folders
mkdir -p ~/servers/bedrock

# clone repositories
git clone https://github.com/nlxdodge/portfolio-astro.git ~/portfolio-astro
