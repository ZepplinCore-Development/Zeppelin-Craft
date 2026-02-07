#!/bin/bash
#
# Run all DBC update SQL files against the spell editor database
#
# Usage: ./run_updates.sh [--dry-run]
#

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
UPDATES_DIR="$SCRIPT_DIR/Updates"

# Database connection details
DB_HOST="192.168.0.55"
DB_PORT="3306"
DB_NAME="dbc"
DB_USER="spell-editor"
DB_PASS='HW8Y%L6&f0ePJO'

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

DRY_RUN=false
if [[ "$1" == "--dry-run" ]]; then
    DRY_RUN=true
    echo -e "${YELLOW}DRY RUN MODE - No changes will be made${NC}"
    echo ""
fi

# Check if Updates directory exists
if [[ ! -d "$UPDATES_DIR" ]]; then
    echo -e "${RED}Error: Updates directory not found at $UPDATES_DIR${NC}"
    exit 1
fi

# Count SQL files
SQL_FILES=("$UPDATES_DIR"/*.sql)
TOTAL=${#SQL_FILES[@]}

if [[ $TOTAL -eq 0 ]] || [[ ! -f "${SQL_FILES[0]}" ]]; then
    echo -e "${YELLOW}No SQL files found in $UPDATES_DIR${NC}"
    exit 0
fi

echo "Found $TOTAL SQL files to process"
echo "Database: $DB_NAME @ $DB_HOST:$DB_PORT"
echo "-------------------------------------------"

SUCCESS=0
FAILED=0
SKIPPED=0

for sql_file in "${SQL_FILES[@]}"; do
    filename=$(basename "$sql_file")

    # Check if file is empty or only whitespace
    if [[ ! -s "$sql_file" ]] || [[ -z "$(grep -v '^[[:space:]]*$' "$sql_file")" ]]; then
        echo -e "${YELLOW}[SKIP]${NC} $filename (empty)"
        ((SKIPPED++))
        continue
    fi

    if [[ "$DRY_RUN" == true ]]; then
        echo -e "${GREEN}[WOULD RUN]${NC} $filename"
        ((SUCCESS++))
    else
        # Execute the SQL file
        if mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" < "$sql_file" 2>/dev/null; then
            echo -e "${GREEN}[OK]${NC} $filename"
            ((SUCCESS++))
        else
            echo -e "${RED}[FAIL]${NC} $filename"
            ((FAILED++))
        fi
    fi
done

echo "-------------------------------------------"
echo "Results: $SUCCESS success, $FAILED failed, $SKIPPED skipped"

if [[ $FAILED -gt 0 ]]; then
    exit 1
fi
