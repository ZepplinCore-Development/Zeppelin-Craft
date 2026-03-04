#!/bin/bash
#
# Reboot ac-worldserver with online player check
#
# Queries the characters database for online players before restarting.
# If players are found, displays them and asks for confirmation.
#
# Credentials are loaded from cli/.env (relative to Zeppelin-Craft root).
#
# Usage: ./reboot-worldserver.sh
#

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

CONTAINER="ac-worldserver"
DB_CONTAINER="ac-database"

# Auto-detect Zeppelin-Craft root and load .env
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZEPPELIN_CRAFT="$(cd "$SCRIPT_DIR/../.." && pwd)"
ENV_FILE="$ZEPPELIN_CRAFT/cli/.env"

if [ ! -f "$ENV_FILE" ]; then
    echo -e "${RED}ERROR: .env not found at $ENV_FILE${NC}"
    exit 1
fi

# Parse .env safely (handles special characters like # % & in values)
while IFS='=' read -r key value; do
    [[ -z "$key" || "$key" =~ ^[[:space:]]*# ]] && continue
    key=$(echo "$key" | xargs)
    value="${value%\"}"
    value="${value#\"}"
    value="${value%\'}"
    value="${value#\'}"
    export "$key=$value"
done < "$ENV_FILE"

# Verify required vars
if [ -z "$CHARS_DB_HOST" ] || [ -z "$CHARS_DB_USER" ] || [ -z "$CHARS_DB_PASS" ] || [ -z "$CHARS_DB_NAME" ]; then
    echo -e "${RED}ERROR: Missing CHARS_DB_* variables in $ENV_FILE${NC}"
    exit 1
fi

# Class ID to name mapping
class_name() {
    case $1 in
        1) echo "Warrior" ;;
        2) echo "Paladin" ;;
        3) echo "Hunter" ;;
        4) echo "Rogue" ;;
        5) echo "Priest" ;;
        6) echo "Death Knight" ;;
        7) echo "Shaman" ;;
        8) echo "Mage" ;;
        9) echo "Warlock" ;;
        11) echo "Druid" ;;
        *) echo "Unknown($1)" ;;
    esac
}

# Race ID to name mapping
race_name() {
    case $1 in
        1) echo "Human" ;;
        2) echo "Orc" ;;
        3) echo "Dwarf" ;;
        4) echo "Night Elf" ;;
        5) echo "Undead" ;;
        6) echo "Tauren" ;;
        7) echo "Gnome" ;;
        8) echo "Troll" ;;
        10) echo "Blood Elf" ;;
        11) echo "Draenei" ;;
        *) echo "Unknown($1)" ;;
    esac
}

echo -e "${CYAN}=== Worldserver Reboot ===${NC}"
echo ""

# Check container exists and is running
if ! docker inspect "$CONTAINER" &>/dev/null; then
    echo -e "${RED}ERROR: Container '$CONTAINER' not found${NC}"
    exit 1
fi

CONTAINER_STATUS=$(docker inspect -f '{{.State.Status}}' "$CONTAINER" 2>/dev/null)
if [ "$CONTAINER_STATUS" != "running" ]; then
    echo -e "${YELLOW}Container is not running (status: $CONTAINER_STATUS)${NC}"
    read -rp "Start it? [y/N] " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        docker start "$CONTAINER"
        echo -e "${GREEN}Container started.${NC}"
    fi
    exit 0
fi

# Check database container is running
if ! docker inspect -f '{{.State.Status}}' "$DB_CONTAINER" 2>/dev/null | grep -q running; then
    echo -e "${RED}ERROR: Database container '$DB_CONTAINER' is not running${NC}"
    exit 1
fi

# Bot characters to ignore (e.g. WowChat discord bridge)
BOT_NAMES="'chat'"

# Query online players via database container (excluding bots)
QUERY="SELECT guid, name, level, class, race, zone FROM characters WHERE online = 1 AND name NOT IN ($BOT_NAMES) ORDER BY name"
RESULT=$(docker exec "$DB_CONTAINER" mysql -u "$CHARS_DB_USER" -p"$CHARS_DB_PASS" "$CHARS_DB_NAME" \
    --batch --skip-column-names -e "$QUERY" 2>/dev/null) || {
    echo -e "${RED}ERROR: Failed to query characters database${NC}"
    exit 1
}

PLAYER_COUNT=$(echo "$RESULT" | grep -c '[^[:space:]]' || true)

if [ "$PLAYER_COUNT" -eq 0 ]; then
    echo -e "${GREEN}No players online.${NC}"
    echo ""
    echo -e "Restarting ${BOLD}$CONTAINER${NC}..."
    docker restart "$CONTAINER"
    echo -e "${GREEN}Done. Container restarted.${NC}"
else
    echo -e "${YELLOW}${BOLD}$PLAYER_COUNT player(s) currently online:${NC}"
    echo ""
    printf "  ${BOLD}%-20s %5s  %-14s  %-10s${NC}\n" "Name" "Level" "Class" "Race"
    printf "  %-20s %5s  %-14s  %-10s\n" "--------------------" "-----" "--------------" "----------"

    while IFS=$'\t' read -r guid name level class race zone; do
        [ -z "$guid" ] && continue
        printf "  %-20s %5s  %-14s  %-10s\n" "$name" "$level" "$(class_name "$class")" "$(race_name "$race")"
    done <<< "$RESULT"

    echo ""
    echo -e "${RED}${BOLD}Restarting will disconnect all players.${NC}"
    read -rp "Are you sure you want to restart? [y/N] " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo ""
        echo -e "Restarting ${BOLD}$CONTAINER${NC}..."
        docker restart "$CONTAINER"
        echo -e "${GREEN}Done. Container restarted.${NC}"
    else
        echo -e "Aborted."
    fi
fi
