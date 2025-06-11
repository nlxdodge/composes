source pull.sh

echo "Creating global network"
docker network create global >/dev/null 2>&1 || true

echo "Creating folders"
mkdir -p /home/nlxdodge/servers/bedrock

echo "Cloning repositories"
git clone https://github.com/nlxdodge/portfolio-astro.git /home/nlxdodge/portfolio-astro
