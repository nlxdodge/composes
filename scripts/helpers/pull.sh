#!/bin/bash
echo "Pulling composes changes"
git pull

echo "Pulling portfolio-astro changes"
git -C /home/nlxdodge/portfolio-astro fetch origin
git -C /home/nlxdodge/portfolio-astro reset --hard origin/main