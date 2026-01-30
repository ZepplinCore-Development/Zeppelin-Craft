#!/bin/bash
#
# Zeppelin Docker Build Script
# Builds AzerothCore Docker images and tags them as :latest_local
#
# Usage: ./build.sh
#

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Auto-detect paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZEPPELIN_CRAFT="$(cd "$SCRIPT_DIR/../.." && pwd)"
ZEPPELIN_CORE="$(cd "$ZEPPELIN_CRAFT/../Zeppelin-Core" && pwd)"

echo -e "${CYAN}=== Zeppelin Docker Build ===${NC}"
echo -e "Zeppelin-Core: ${ZEPPELIN_CORE}"
echo -e "Zeppelin-Craft: ${ZEPPELIN_CRAFT}"
echo ""

# Step 0: Clean up dangling images and build cache
echo -e "${YELLOW}Cleaning up dangling images...${NC}"
DANGLING_COUNT=$(docker images -f "dangling=true" -q | wc -l)
if [ "$DANGLING_COUNT" -gt 0 ]; then
    echo -e "  Found $DANGLING_COUNT dangling image(s)"
    docker image prune -f
else
    echo -e "  No dangling images found"
fi

# Clean old acore build layers (images with no tag from previous builds)
echo -e "${YELLOW}Cleaning up orphaned acore images...${NC}"
ORPHANED=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}" | grep "acore/ac-wotlk" | grep "<none>" | awk '{print $2}')
if [ -n "$ORPHANED" ]; then
    echo "$ORPHANED" | xargs -r docker rmi -f 2>/dev/null || true
    echo -e "  Cleaned orphaned acore images"
else
    echo -e "  No orphaned acore images found"
fi

# Clean Docker build cache (all of it - will rebuild)
echo -e "${YELLOW}Cleaning build cache...${NC}"
docker builder prune -f --all 2>&1 | tail -1 || true

# Clean orphaned volumes (not attached to any container)
echo -e "${YELLOW}Cleaning orphaned volumes...${NC}"
docker volume prune -f 2>&1 | tail -1 || true

echo ""

# Verify Zeppelin-Core exists
if [ ! -f "$ZEPPELIN_CORE/acore.sh" ]; then
    echo -e "${RED}ERROR: acore.sh not found in $ZEPPELIN_CORE${NC}"
    exit 1
fi

# Images to manage
IMAGES=(authserver worldserver db-import client-data)

# Step 1: Clean up existing master images (pre-build)
echo -e "${YELLOW}Removing old :master images...${NC}"
for image in "${IMAGES[@]}"; do
    docker rmi -f "acore/ac-wotlk-$image:master" 2>/dev/null || true
done

# Step 2: Build Docker images
echo -e "${YELLOW}Building Docker images (this takes a while)...${NC}"
cd "$ZEPPELIN_CORE"
./acore.sh docker build . 2>&1 | tee "$ZEPPELIN_CORE/build.log"

# Step 3: Tag images as :latest_local
echo -e "${YELLOW}Tagging images as :latest_local...${NC}"
for image in "${IMAGES[@]}"; do
    IMAGE_ID=$(docker images --format "{{.ID}}" --filter "reference=acore/ac-wotlk-$image:master" | head -n 1)

    if [ -z "$IMAGE_ID" ]; then
        echo -e "${RED}WARNING: Could not find acore/ac-wotlk-$image:master${NC}"
        continue
    fi

    echo -e "  ${GREEN}✓${NC} acore/ac-wotlk-$image:latest_local"
    docker tag "$IMAGE_ID" "acore/ac-wotlk-$image:latest_local"
done

# Step 4: Clean up master images
echo -e "${YELLOW}Removing :master images...${NC}"
for image in "${IMAGES[@]}"; do
    docker rmi -f "acore/ac-wotlk-$image:master" 2>/dev/null || true
done

# Step 5: Final cleanup of any dangling images from build
echo -e "${YELLOW}Final cleanup of build artifacts...${NC}"
docker image prune -f >/dev/null 2>&1 || true

echo ""
echo -e "${GREEN}=== Build Complete ===${NC}"
echo -e "Build log: ${ZEPPELIN_CORE}/build.log"
echo ""
echo -e "Tagged images:"
for image in "${IMAGES[@]}"; do
    echo -e "  - acore/ac-wotlk-$image:latest_local"
done

echo ""
echo -e "${CYAN}Docker disk usage:${NC}"
docker system df
