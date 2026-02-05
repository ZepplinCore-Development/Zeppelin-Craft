#!/usr/bin/env python3
"""
Clean DBC Duplicates from zepcraft-legacy

Parses dbc_conflicts.log to identify REDUNDANT rows and removes them
from zepcraft-legacy DBC SQL files.

Usage:
    python3 clean_dbc_duplicates.py [--dry-run]

Options:
    --dry-run    Show what would be removed without modifying files
"""

import re
import sys
from pathlib import Path
from collections import defaultdict

# Paths
SCRIPT_DIR = Path(__file__).parent.parent.parent
CONFLICTS_LOG = SCRIPT_DIR / "cli" / "logs" / "dbc_conflicts.log"
LEGACY_DBC_DIR = SCRIPT_DIR / "zpaks" / "zepcraft-legacy" / "dbc"

# Tables to skip - these use composite keys that the diff builder can't handle
# See I-113 for details on fixing the diff builder for these tables
SKIP_TABLES = {
    'characterfacialhairstyles',  # composite key: (race_id, sex_id, variation_id)
    'charbaseinfo',               # composite key: (race_id, class_id)
}


def parse_conflicts_log(log_path: Path) -> dict[str, list[int]]:
    """
    Parse dbc_conflicts.log and extract redundant IDs grouped by table.

    Returns:
        dict mapping table_name -> list of redundant IDs
    """
    redundant_ids = defaultdict(list)
    current_table = None

    with open(log_path, 'r', encoding='utf-8') as f:
        for line in f:
            # Match table header: "tablename (X conflicts, Y redundant)"
            table_match = re.match(r'^(\w+) \(\d+ conflicts?,? ?\d* ?redundant?\)', line)
            if not table_match:
                # Also match tables with only redundant: "tablename (X redundant)"
                table_match = re.match(r'^(\w+) \((\d+) redundant\)', line)

            if table_match:
                current_table = table_match.group(1)
                continue

            # Match redundant ID: "  ID 12345: (REDUNDANT)"
            id_match = re.match(r'^\s+ID (\d+): \(REDUNDANT\)', line)
            if id_match and current_table:
                redundant_ids[current_table].append(int(id_match.group(1)))

    return dict(redundant_ids)


def find_legacy_file(table_name: str) -> Path | None:
    """Find the zepcraft-legacy DBC file for a table."""
    # Standard naming: [BASE,F-044]_tablename.sql
    pattern = f"*_{table_name}.sql"
    matches = list(LEGACY_DBC_DIR.glob(pattern))

    if matches:
        return matches[0]
    return None


def remove_ids_from_file(file_path: Path, ids_to_remove: set[int], dry_run: bool = False) -> tuple[int, int]:
    """
    Remove DELETE+INSERT pairs for specified IDs from a DBC SQL file.

    Returns:
        tuple of (lines_before, lines_after, removed_count)
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    original_count = len(lines)
    new_lines = []
    removed_count = 0

    # Common DBC primary key column patterns
    id_pattern = r"`(?:id|ID|Id|entry|item_id)`"

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for DELETE statement with an ID we want to remove
        # Pattern: DELETE FROM `table` WHERE `id` = 12345;
        delete_match = re.match(rf"^DELETE FROM `\w+` WHERE {id_pattern} = (\d+);", line, re.IGNORECASE)

        if delete_match:
            row_id = int(delete_match.group(1))
            if row_id in ids_to_remove:
                # Skip this DELETE line
                removed_count += 1
                i += 1
                # Check if next line is the corresponding INSERT
                if i < len(lines) and lines[i].upper().startswith('INSERT'):
                    # Skip the INSERT too
                    i += 1
                continue

        # Check for UPDATE statement with an ID we want to remove
        # Pattern: UPDATE `table` SET ... WHERE `id` = 12345;
        update_match = re.search(rf"WHERE {id_pattern} = (\d+);$", line, re.IGNORECASE)
        if update_match and line.upper().strip().startswith('UPDATE'):
            row_id = int(update_match.group(1))
            if row_id in ids_to_remove:
                removed_count += 1
                i += 1
                continue

        new_lines.append(line)
        i += 1

    if not dry_run and removed_count > 0:
        with open(file_path, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)

    return original_count, len(new_lines), removed_count


def update_file_header(file_path: Path, original_stats: str, new_stats: str):
    """Update the stats comment in the file header."""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Replace the stats line if present
    # Pattern: "-- tablename: X inserts, Y updates, Z deletes"
    content = re.sub(
        r'^(-- \w+: )\d+ inserts, \d+ updates, \d+ deletes',
        f'\\1{new_stats}',
        content,
        flags=re.MULTILINE
    )

    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)


def main():
    dry_run = '--dry-run' in sys.argv

    if dry_run:
        print("=== DRY RUN MODE - No files will be modified ===\n")

    if not CONFLICTS_LOG.exists():
        print(f"Error: Conflicts log not found at {CONFLICTS_LOG}")
        print("Run 'zep dbc scan' first to generate the conflicts log.")
        sys.exit(1)

    print(f"Parsing conflicts log: {CONFLICTS_LOG}")
    redundant_ids = parse_conflicts_log(CONFLICTS_LOG)

    total_redundant = sum(len(ids) for ids in redundant_ids.values())
    print(f"Found {total_redundant} redundant rows across {len(redundant_ids)} tables\n")

    if not redundant_ids:
        print("No redundant rows found. Nothing to clean.")
        return

    total_removed = 0
    files_modified = 0
    skipped_tables = []

    for table_name, ids in sorted(redundant_ids.items()):
        # Skip composite key tables (see I-113)
        if table_name in SKIP_TABLES:
            skipped_tables.append((table_name, len(ids)))
            continue

        file_path = find_legacy_file(table_name)

        if not file_path:
            print(f"  {table_name}: No file found in zepcraft-legacy, skipping")
            continue

        ids_set = set(ids)
        lines_before, lines_after, removed = remove_ids_from_file(file_path, ids_set, dry_run)

        if removed > 0:
            files_modified += 1
            total_removed += removed
            action = "Would remove" if dry_run else "Removed"
            print(f"  {table_name}: {action} {removed} rows ({lines_before} -> {lines_after} lines)")
        else:
            print(f"  {table_name}: No matching rows found in file")

    print(f"\n{'Would modify' if dry_run else 'Modified'} {files_modified} files")
    print(f"{'Would remove' if dry_run else 'Removed'} {total_removed} redundant rows total")

    if skipped_tables:
        skipped_count = sum(count for _, count in skipped_tables)
        print(f"\nSkipped {len(skipped_tables)} composite-key tables ({skipped_count} rows) - see I-113:")
        for table_name, count in skipped_tables:
            print(f"  {table_name}: {count} rows")

    if dry_run:
        print("\nRun without --dry-run to apply changes.")


if __name__ == '__main__':
    main()
