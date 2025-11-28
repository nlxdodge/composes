source pull.sh

echo "Creating global network for IPv4 and IPv6"
DAEMON_CONFIG = '{
  "ipv6": true,
  "fixed-cidr-v6": "2001:db8:1::/64"
}'
echo "$DAEMON_CONFIG" | sudo tee /etc/docker/daemon.json > /dev/null

docker network create --ipv6 global> /dev/null 2>&1 || true

echo "Creating folders"
mkdir -p /home/nlxdodge/servers/bedrock

echo "Cloning repositories"
git clone https://github.com/nlxdodge/portfolio-astro.git /home/nlxdodge/portfolio-astro
