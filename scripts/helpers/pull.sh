#!/bin/bash
echo "Pulling composes changes"
git pull

echo "Pulling portfolio-astro changes"
git -C ~/portfolio-astro fetch origin
git -C ~/portfolio-astro reset --hard origin/main