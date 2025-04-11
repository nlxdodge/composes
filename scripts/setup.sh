source pull.sh

echo "Creating global network"
docker network inspect global >/dev/null 2>&1

echo "Creating folders"
mkdir -p ~/servers/bedrock

echo "Cloning repositories"
git clone https://github.com/nlxdodge/portfolio-astro.git ~/portfolio-astro
