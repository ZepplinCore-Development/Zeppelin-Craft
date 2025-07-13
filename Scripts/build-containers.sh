#!/bin/bash

# Zeppelin WOTLK Server - Docker Container Build Script
# This script builds all necessary Docker images for the AzerothCore server
# and tags them appropriately for use in UNRAID Docker containers

# Clean up existing images
echo "Cleaning up master images..."
docker rmi -f \
    acore/ac-wotlk-client-data:master \
    acore/ac-wotlk-db-import:master \
    acore/ac-wotlk-worldserver:master \
    acore/ac-wotlk-authserver:master 2>/dev/null

# Build Docker images with acore.sh script and log output
echo "Building Docker Images, this takes a while:"
cd /mnt/user/appdata/wow-server/Zeppelin-Core/
./acore.sh docker build . &> build.log

# Tag each image directly by name
for image in authserver worldserver db-import client-data; do
  # Find the newest image for this component
  IMAGE_ID=$(docker images --format "{{.ID}}" --filter "reference=acore/ac-wotlk-$image:master" | head -n 1)
  
  if [ -z "$IMAGE_ID" ]; then
    echo "WARNING: Could not find acore/ac-wotlk-$image:master"
    continue
  fi
  
  echo "Tagging $IMAGE_ID as acore/ac-wotlk-$image:latest_local"
  docker tag "$IMAGE_ID" "acore/ac-wotlk-$image:latest_local"
done

# Clean up existing images
echo "Cleaning up master images..."
docker rmi -f \
    acore/ac-wotlk-client-data:master \
    acore/ac-wotlk-db-import:master \
    acore/ac-wotlk-worldserver:master \
    acore/ac-wotlk-authserver:master 2>/dev/null

echo "Script completed successfully."