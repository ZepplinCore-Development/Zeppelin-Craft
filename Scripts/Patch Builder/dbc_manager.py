#!/usr/bin/env python3
"""
dbc-mgr: DBC Database Manager for Zeppelin Server

Four-database architecture for safe, traceable DBC editing:
  - original_dbc: Pristine 3.3.5a stock (never modified)
  - scratch_dbc: Temp workspace during imports/rebuilds
  - dbc: Live database (Spell Editor + dbc.py work here)
  - expected_dbc: Safety baseline (catches uncommitted changes)

Usage:
  dbc-mgr status              Check for uncommitted changes (dbc vs expected_dbc)
  dbc-mgr diff                Show detailed diff between dbc and expected_dbc
  dbc-mgr rebuild             Rebuild dbc from sources (always squashes)
  dbc-mgr rebuild --dry-run   Preview rebuild without applying
  dbc-mgr show <source>       Show what a source changes
  dbc-mgr enable <source>     Enable a source
  dbc-mgr disable <source>    Disable a source
  dbc-mgr import-module       Import binary DBC files as a new source
  dbc-mgr export              Export dbc to DBC files (via DBCTool)
"""

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple

import mysql.connector
from dotenv import load_dotenv

# Load environment variables
SCRIPT_DIR = Path(__file__).parent
load_dotenv(SCRIPT_DIR / ".env")

# Database configuration
DB_HOST = os.getenv("DB_HOST", "192.168.0.55")
DB_USER = os.getenv("DB_USER", "spell-editor")
DB_PASSWORD = os.getenv("DB_PASSWORD", "")
DB_ROOT_USER = os.getenv("DB_ROOT_USER", "root")
DB_ROOT_PASSWORD = os.getenv("DB_ROOT_PASSWORD", "")

# Database names
ORIGINAL_DBC = os.getenv("BACKUP_DBC_NAME", "original_dbc")
SCRATCH_DBC = os.getenv("SCRATCH_DBC_NAME", "scratch_dbc")
LIVE_DBC = os.getenv("LIVE_DBC_NAME", "dbc")
EXPECTED_DBC = os.getenv("EXPECTED_DBC_NAME", "expected_dbc")

# Paths
SOURCES_DIR = SCRIPT_DIR / "sources"
REGISTRY_PATH = SOURCES_DIR / "source_registry.json"
DBCTOOL_PATH = Path("/workspace/project/Zeppelin-Tools/DBCTool/dbctool")


class Colors:
    """ANSI color codes for terminal output."""
    RED = "\033[0;31m"
    GREEN = "\033[0;32m"
    YELLOW = "\033[0;33m"
    BLUE = "\033[0;34m"
    CYAN = "\033[0;36m"
    RESET = "\033[0m"
    BOLD = "\033[1m"


def get_connection(database: str = LIVE_DBC, use_root: bool = False):
    """Get a MySQL connection to the specified database."""
    user = DB_ROOT_USER if use_root else DB_USER
    password = DB_ROOT_PASSWORD if use_root else DB_PASSWORD

    return mysql.connector.connect(
        host=DB_HOST,
        user=user,
        password=password,
        database=database
    )


def get_tables(conn) -> List[str]:
    """Get list of tables in the connected database."""
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES")
    tables = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return tables


def get_row_count(conn, table: str) -> int:
    """Get row count for a table."""
    cursor = conn.cursor()
    cursor.execute(f"SELECT COUNT(*) FROM `{table}`")
    count = cursor.fetchone()[0]
    cursor.close()
    return count


def get_table_checksum(conn, table: str) -> int:
    """Get checksum for a table."""
    cursor = conn.cursor()
    cursor.execute(f"CHECKSUM TABLE `{table}`")
    result = cursor.fetchone()
    cursor.close()
    return result[1] if result else 0


def get_primary_key(conn, table: str) -> str:
    """Get the primary key column for a table."""
    cursor = conn.cursor()
    cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name = 'PRIMARY'")
    result = cursor.fetchone()
    cursor.close()

    if result:
        # Column_name is at index 4
        return result[4]

    # Fallback: check for common ID column names
    cursor = conn.cursor()
    cursor.execute(f"SHOW COLUMNS FROM `{table}`")
    columns = [row[0] for row in cursor.fetchall()]
    cursor.close()

    for col in ["ID", "id", "Id", "entry", "Entry"]:
        if col in columns:
            return col

    # Last resort: use first column
    return columns[0] if columns else "ID"


def get_localization_columns(columns: List[str]) -> Set[str]:
    """
    Identify localization columns to exclude from diffs.

    WoW 3.3.5a DBC files have localized strings using locale suffixes:
    - spell_name_enus (English US - KEEP)
    - spell_name_kokr (Korean - skip)
    - spell_name_frfr (French - skip)
    - spell_name_dede (German - skip)
    - spell_name_zhcn (Chinese Simplified - skip)
    - spell_name_zhtw (Chinese Traditional - skip)
    - spell_name_eses (Spanish Spain - skip)
    - spell_name_esmx (Spanish Mexico - skip)
    - spell_name_ruru (Russian - skip)
    - spell_name_jajp (Japanese - skip)
    - spell_name_ptpt (Portuguese - skip)
    - spell_name_itit (Italian - skip)
    - spell_name_unused_* (unused slots - skip)
    - spell_name_flags (flags field - KEEP)

    We keep enus (English) and flags columns, exclude all other locales.
    """
    # Non-English locale suffixes to exclude
    NON_ENGLISH_LOCALES = {
        'kokr',   # Korean
        'frfr',   # French
        'dede',   # German
        'zhcn',   # Chinese Simplified
        'zhtw',   # Chinese Traditional
        'eses',   # Spanish (Spain)
        'esmx',   # Spanish (Mexico)
        'ruru',   # Russian
        'jajp',   # Japanese
        'ptpt',   # Portuguese
        'itit',   # Italian
        'ptbr',   # Portuguese (Brazil)
        'engb',   # English (UK) - if different from enus
    }

    # Also exclude unused locale slots
    UNUSED_PATTERNS = ['unused_1', 'unused_2', 'unused_3', 'unused_4']

    localization_cols = set()

    for col in columns:
        col_lower = col.lower()

        # Check for non-English locale suffixes
        for locale in NON_ENGLISH_LOCALES:
            if col_lower.endswith(f'_{locale}'):
                localization_cols.add(col)
                break

        # Check for unused locale slots
        for unused in UNUSED_PATTERNS:
            if col_lower.endswith(f'_{unused}'):
                localization_cols.add(col)
                break

    return localization_cols


def compare_databases(db1_name: str, db2_name: str, verbose: bool = False) -> Dict:
    """
    Compare two databases and return differences.

    Returns dict with:
      - identical: bool
      - tables_only_in_db1: list
      - tables_only_in_db2: list
      - tables_with_differences: list of (table, db1_count, db2_count, db1_checksum, db2_checksum)
    """
    conn1 = get_connection(db1_name)
    conn2 = get_connection(db2_name)

    tables1 = set(get_tables(conn1))
    tables2 = set(get_tables(conn2))

    only_in_db1 = tables1 - tables2
    only_in_db2 = tables2 - tables1
    common_tables = tables1 & tables2

    differences = []

    for table in sorted(common_tables):
        # Skip internal tables
        if table.startswith("dbc_"):
            continue

        checksum1 = get_table_checksum(conn1, table)
        checksum2 = get_table_checksum(conn2, table)

        if checksum1 != checksum2:
            count1 = get_row_count(conn1, table)
            count2 = get_row_count(conn2, table)
            differences.append((table, count1, count2, checksum1, checksum2))

    conn1.close()
    conn2.close()

    return {
        "identical": len(only_in_db1) == 0 and len(only_in_db2) == 0 and len(differences) == 0,
        "tables_only_in_db1": sorted(only_in_db1),
        "tables_only_in_db2": sorted(only_in_db2),
        "tables_with_differences": differences
    }


def get_table_diff(table: str, db1_name: str, db2_name: str, primary_key: str = None,
                   skip_localization: bool = True) -> Dict:
    """
    Get detailed row-level differences between two tables.

    Args:
        table: Table name to compare
        db1_name: Source database name
        db2_name: Target database name
        primary_key: Optional primary key column (auto-detected if None)
        skip_localization: If True, ignore localization columns (1-15) in comparisons

    Returns dict with:
      - only_in_db1: list of primary key values
      - only_in_db2: list of primary key values
      - modified: list of (pk, changed_columns)
      - primary_key: the detected primary key column name
      - skipped_columns: set of columns that were ignored (for reference)
    """
    conn1 = get_connection(db1_name)
    conn2 = get_connection(db2_name)

    # Auto-detect primary key if not provided
    if primary_key is None:
        primary_key = get_primary_key(conn1, table)

    cursor1 = conn1.cursor(dictionary=True)
    cursor2 = conn2.cursor(dictionary=True)

    # Get all rows from both tables
    cursor1.execute(f"SELECT * FROM `{table}` ORDER BY `{primary_key}`")
    rows1 = {row[primary_key]: row for row in cursor1.fetchall()}

    cursor2.execute(f"SELECT * FROM `{table}` ORDER BY `{primary_key}`")
    rows2 = {row[primary_key]: row for row in cursor2.fetchall()}

    cursor1.close()
    cursor2.close()
    conn1.close()
    conn2.close()

    pks1 = set(rows1.keys())
    pks2 = set(rows2.keys())

    only_in_db1 = sorted(pks1 - pks2)
    only_in_db2 = sorted(pks2 - pks1)

    # Determine which columns to skip
    skipped_columns = set()
    if skip_localization and rows1:
        sample_row = next(iter(rows1.values()))
        skipped_columns = get_localization_columns(list(sample_row.keys()))

    modified = []
    for pk in sorted(pks1 & pks2):
        row1 = rows1[pk]
        row2 = rows2[pk]
        changed_cols = []
        for col in row1.keys():
            # Skip localization columns
            if col in skipped_columns:
                continue
            if row1[col] != row2[col]:
                changed_cols.append((col, row1[col], row2[col]))
        if changed_cols:
            modified.append((pk, changed_cols))

    return {
        "only_in_db1": only_in_db1,
        "only_in_db2": only_in_db2,
        "modified": modified,
        "primary_key": primary_key,
        "skipped_columns": skipped_columns
    }


def generate_diff_sql(table: str, db_source: str, db_target: str,
                      skip_localization: bool = True) -> str:
    """
    Generate SQL to transform db_target to match db_source for a single table.

    This generates INSERT/UPDATE/DELETE statements that would make db_target
    match db_source when executed against db_target.

    Args:
        table: Table name
        db_source: Source database (what we want)
        db_target: Target database (what we're changing)
        skip_localization: If True, exclude localization columns (1-15) from output
    """
    conn = get_connection(db_source)
    diff = get_table_diff(table, db_source, db_target, skip_localization=skip_localization)
    pk = diff["primary_key"]
    skipped_columns = diff.get("skipped_columns", set())

    sql_lines = []
    sql_lines.append(f"-- {table}: {len(diff['only_in_db1'])} inserts, {len(diff['modified'])} updates, {len(diff['only_in_db2'])} deletes")

    # Get column info for the table
    cursor = conn.cursor()
    cursor.execute(f"SHOW COLUMNS FROM `{table}`")
    all_columns = [row[0] for row in cursor.fetchall()]
    cursor.close()

    # Filter out localization columns
    columns = [c for c in all_columns if c not in skipped_columns]

    # Generate DELETEs for rows only in target (need to remove them)
    if diff["only_in_db2"]:
        for pk_val in diff["only_in_db2"]:
            sql_lines.append(f"DELETE FROM `{table}` WHERE `{pk}` = {pk_val};")

    # Generate INSERTs for rows only in source (need to add them)
    if diff["only_in_db1"]:
        cursor = conn.cursor(dictionary=True)
        pk_list = ",".join(str(pk_val) for pk_val in diff["only_in_db1"])
        cursor.execute(f"SELECT * FROM `{table}` WHERE `{pk}` IN ({pk_list})")

        for row in cursor.fetchall():
            cols = ", ".join(f"`{c}`" for c in columns)
            vals = []
            for c in columns:
                v = row[c]
                if v is None:
                    vals.append("NULL")
                elif isinstance(v, (int, float)):
                    vals.append(str(v))
                else:
                    # Escape single quotes
                    escaped = str(v).replace("\\", "\\\\").replace("'", "\\'")
                    vals.append(f"'{escaped}'")
            vals_str = ", ".join(vals)
            sql_lines.append(f"INSERT INTO `{table}` ({cols}) VALUES ({vals_str});")

        cursor.close()

    # Generate UPDATEs for modified rows
    # (localization columns already filtered by get_table_diff)
    if diff["modified"]:
        for pk_val, changes in diff["modified"]:
            set_clauses = []
            for col, new_val, old_val in changes:
                if new_val is None:
                    set_clauses.append(f"`{col}` = NULL")
                elif isinstance(new_val, (int, float)):
                    set_clauses.append(f"`{col}` = {new_val}")
                else:
                    escaped = str(new_val).replace("\\", "\\\\").replace("'", "\\'")
                    set_clauses.append(f"`{col}` = '{escaped}'")
            set_str = ", ".join(set_clauses)
            sql_lines.append(f"UPDATE `{table}` SET {set_str} WHERE `{pk}` = {pk_val};")

    conn.close()
    return "\n".join(sql_lines)


def generate_full_diff_sql(db_source: str, db_target: str,
                           skip_localization: bool = True) -> str:
    """Generate SQL for all differences between two databases."""
    result = compare_databases(db_source, db_target)

    if result["identical"]:
        return "-- No differences found"

    sql_parts = []
    sql_parts.append(f"-- DBC Diff: {db_source} vs {db_target}")
    sql_parts.append(f"-- Generated by dbc-mgr")
    if skip_localization:
        sql_parts.append(f"-- Localization columns (1-15) excluded")
    sql_parts.append("")

    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        sql_parts.append(f"\n-- ============ {table} ============")
        sql_parts.append(generate_diff_sql(table, db_source, db_target,
                                          skip_localization=skip_localization))

    return "\n".join(sql_parts)


def load_registry() -> Dict:
    """Load the source registry."""
    if not REGISTRY_PATH.exists():
        return {"sources": {}, "conflict_resolution": "priority_wins"}

    with open(REGISTRY_PATH) as f:
        return json.load(f)


def save_registry(registry: Dict):
    """Save the source registry."""
    with open(REGISTRY_PATH, "w") as f:
        json.dump(registry, f, indent=2)


# =============================================================================
# CLI Commands
# =============================================================================

def cmd_status(args):
    """Check for uncommitted changes between dbc and expected_dbc."""
    print(f"{Colors.CYAN}Comparing {LIVE_DBC} vs {EXPECTED_DBC}...{Colors.RESET}\n")

    result = compare_databases(LIVE_DBC, EXPECTED_DBC)

    if result["identical"]:
        print(f"{Colors.GREEN}✓ Databases are identical - no uncommitted changes{Colors.RESET}")
        return 0

    print(f"{Colors.YELLOW}⚠ Uncommitted changes detected:{Colors.RESET}\n")

    if result["tables_only_in_db1"]:
        print(f"  Tables only in {LIVE_DBC}:")
        for t in result["tables_only_in_db1"]:
            print(f"    + {t}")
        print()

    if result["tables_only_in_db2"]:
        print(f"  Tables only in {EXPECTED_DBC}:")
        for t in result["tables_only_in_db2"]:
            print(f"    - {t}")
        print()

    if result["tables_with_differences"]:
        print("  Tables with row differences:")
        for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
            count_diff = count1 - count2
            sign = "+" if count_diff > 0 else ""
            print(f"    {table}: {count1} rows (live) vs {count2} rows (expected) [{sign}{count_diff}]")
        print()

    print(f"{Colors.YELLOW}Run 'dbc-mgr diff' for detailed changes{Colors.RESET}")
    print(f"{Colors.YELLOW}Run 'dbc-mgr rebuild' to reset from sources{Colors.RESET}")

    return 1


def cmd_diff(args):
    """Show detailed diff between dbc and expected_dbc."""
    # If --sql flag, just output the SQL
    if getattr(args, 'sql', False):
        sql = generate_full_diff_sql(LIVE_DBC, EXPECTED_DBC)
        print(sql)
        return 0 if "No differences" in sql else 1

    print(f"{Colors.CYAN}Detailed diff: {LIVE_DBC} vs {EXPECTED_DBC}...{Colors.RESET}\n")

    result = compare_databases(LIVE_DBC, EXPECTED_DBC)

    if result["identical"]:
        print(f"{Colors.GREEN}✓ Databases are identical{Colors.RESET}")
        return 0

    # Show row-level diffs for each changed table
    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        print(f"{Colors.BOLD}Table: {table}{Colors.RESET}")
        print(f"  Rows: {count1} (live) vs {count2} (expected)")

        try:
            # Auto-detect primary key
            diff = get_table_diff(table, LIVE_DBC, EXPECTED_DBC)
            pk = diff["primary_key"]

            if diff["only_in_db1"]:
                print(f"  {Colors.GREEN}Added in live ({len(diff['only_in_db1'])}):{Colors.RESET}")
                # Show first few
                for pk_val in diff["only_in_db1"][:5]:
                    print(f"    + {pk}={pk_val}")
                if len(diff["only_in_db1"]) > 5:
                    print(f"    ... and {len(diff['only_in_db1']) - 5} more")

            if diff["only_in_db2"]:
                print(f"  {Colors.RED}Removed from live ({len(diff['only_in_db2'])}):{Colors.RESET}")
                for pk_val in diff["only_in_db2"][:5]:
                    print(f"    - {pk}={pk_val}")
                if len(diff["only_in_db2"]) > 5:
                    print(f"    ... and {len(diff['only_in_db2']) - 5} more")

            if diff["modified"]:
                print(f"  {Colors.YELLOW}Modified ({len(diff['modified'])}):{Colors.RESET}")
                for pk_val, changes in diff["modified"][:3]:
                    print(f"    ~ {pk}={pk_val}:")
                    for col, old_val, new_val in changes[:3]:
                        # Truncate long values
                        old_str = str(old_val)[:50] + "..." if len(str(old_val)) > 50 else str(old_val)
                        new_str = str(new_val)[:50] + "..." if len(str(new_val)) > 50 else str(new_val)
                        print(f"        {col}: {old_str} → {new_str}")
                    if len(changes) > 3:
                        print(f"        ... and {len(changes) - 3} more columns")
                if len(diff["modified"]) > 3:
                    print(f"    ... and {len(diff['modified']) - 3} more rows")

        except Exception as e:
            print(f"  {Colors.RED}Error getting row diff: {e}{Colors.RESET}")

        print()

    return 1


def cmd_show(args):
    """Show what a source changes."""
    source_name = args.source
    registry = load_registry()

    if source_name not in registry.get("sources", {}):
        print(f"{Colors.RED}Error: Source '{source_name}' not found in registry{Colors.RESET}")
        print(f"Available sources: {', '.join(registry.get('sources', {}).keys()) or '(none)'}")
        return 1

    source = registry["sources"][source_name]
    # Support both "file" (single file) and "path" (directory)
    source_path = SOURCES_DIR / source.get("path", source.get("file", ""))

    print(f"{Colors.BOLD}Source: {source_name}{Colors.RESET}")
    print(f"  Type: {source.get('type', 'unknown')}")
    print(f"  Path: {source_path}")
    print(f"  Priority: {source.get('priority', 'N/A')}")
    print(f"  Enabled: {source.get('enabled', True)}")
    print(f"  Tables: {', '.join(source.get('tables', [])) or '(not specified)'}")
    print()

    if source_path.exists():
        if source_path.is_dir():
            # Directory with multiple files
            sql_files = sorted(source_path.glob("*.sql"))
            print(f"{Colors.CYAN}SQL Files ({len(sql_files)}):{Colors.RESET}")
            print("-" * 60)
            total_lines = 0
            for sql_file in sql_files:
                with open(sql_file) as f:
                    line_count = len(f.readlines())
                total_lines += line_count
                print(f"  {sql_file.name}: {line_count} lines")
            print("-" * 60)
            print(f"  Total: {total_lines} lines")
        else:
            # Single file
            print(f"{Colors.CYAN}SQL Content:{Colors.RESET}")
            print("-" * 60)
            with open(source_path) as f:
                content = f.read()
                # Show first 50 lines
                lines = content.split("\n")
                for line in lines[:50]:
                    print(line)
                if len(lines) > 50:
                    print(f"\n... ({len(lines) - 50} more lines)")
    else:
        print(f"{Colors.RED}Source path not found: {source_path}{Colors.RESET}")

    return 0


def cmd_extract(args):
    """Extract current dbc customizations vs original_dbc as a new source."""
    name = args.name
    source_type = args.type
    priority = args.priority

    print(f"{Colors.BOLD}Extracting DBC customizations: {name}{Colors.RESET}")
    print(f"  Comparing: {LIVE_DBC} vs {ORIGINAL_DBC}")
    print()

    # Generate diff SQL
    print(f"{Colors.CYAN}Analyzing differences...{Colors.RESET}")
    result = compare_databases(LIVE_DBC, ORIGINAL_DBC)

    if result["identical"]:
        print(f"{Colors.GREEN}No differences found - nothing to extract{Colors.RESET}")
        return 0

    # Show summary
    total_tables = len(result["tables_with_differences"])
    print(f"  Found changes in {total_tables} table(s):")
    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        diff = get_table_diff(table, LIVE_DBC, ORIGINAL_DBC)
        adds = len(diff["only_in_db1"])
        mods = len(diff["modified"])
        dels = len(diff["only_in_db2"])
        print(f"    {table}: +{adds} ~{mods} -{dels}")
    print()

    # Generate SQL
    print(f"{Colors.CYAN}Generating SQL...{Colors.RESET}")
    sql = generate_full_diff_sql(LIVE_DBC, ORIGINAL_DBC)

    # Determine output path
    if source_type == "module":
        output_dir = SOURCES_DIR / "modules"
    else:
        output_dir = SOURCES_DIR / "features"

    output_dir.mkdir(parents=True, exist_ok=True)
    output_path = output_dir / f"{name}.sql"

    # Write SQL file
    with open(output_path, "w") as f:
        f.write(sql)
    print(f"  Wrote: {output_path}")

    # Update registry
    registry = load_registry()
    relative_path = f"{source_type}s/{name}.sql"

    # Detect which tables are modified
    tables = [t[0] for t in result["tables_with_differences"]]

    registry["sources"][name] = {
        "type": source_type,
        "file": relative_path,
        "priority": priority,
        "enabled": True,
        "tables": tables,
        "description": f"Extracted from {LIVE_DBC} on {__import__('datetime').datetime.now().strftime('%Y-%m-%d')}"
    }
    save_registry(registry)
    print(f"  Registered in source_registry.json")

    print(f"\n{Colors.GREEN}✓ Extraction complete: {name}{Colors.RESET}")
    print(f"  File: {output_path}")
    print(f"  Priority: {priority}")
    print(f"  Tables: {', '.join(tables)}")

    return 0


def cmd_enable(args):
    """Enable a source."""
    source_name = args.source
    registry = load_registry()

    if source_name not in registry.get("sources", {}):
        print(f"{Colors.RED}Error: Source '{source_name}' not found{Colors.RESET}")
        return 1

    registry["sources"][source_name]["enabled"] = True
    save_registry(registry)
    print(f"{Colors.GREEN}✓ Enabled source: {source_name}{Colors.RESET}")
    return 0


def cmd_disable(args):
    """Disable a source."""
    source_name = args.source
    registry = load_registry()

    if source_name not in registry.get("sources", {}):
        print(f"{Colors.RED}Error: Source '{source_name}' not found{Colors.RESET}")
        return 1

    registry["sources"][source_name]["enabled"] = False
    save_registry(registry)
    print(f"{Colors.YELLOW}✓ Disabled source: {source_name}{Colors.RESET}")
    return 0


def cmd_list(args):
    """List all sources."""
    registry = load_registry()
    sources = registry.get("sources", {})

    if not sources:
        print(f"{Colors.YELLOW}No sources registered{Colors.RESET}")
        print(f"Use 'dbc-mgr import-module' to import DBC sources")
        return 0

    print(f"{Colors.BOLD}Registered Sources:{Colors.RESET}\n")

    # Group by type
    modules = [(k, v) for k, v in sources.items() if v.get("type") == "module"]
    features = [(k, v) for k, v in sources.items() if v.get("type") == "feature"]

    if modules:
        print(f"{Colors.CYAN}Modules:{Colors.RESET}")
        for name, src in sorted(modules, key=lambda x: x[1].get("priority", 0)):
            status = "✓" if src.get("enabled", True) else "✗"
            color = Colors.GREEN if src.get("enabled", True) else Colors.RED
            print(f"  {color}{status}{Colors.RESET} {name} (priority: {src.get('priority', 'N/A')})")
        print()

    if features:
        print(f"{Colors.CYAN}Features:{Colors.RESET}")
        for name, src in sorted(features, key=lambda x: x[1].get("priority", 0)):
            status = "✓" if src.get("enabled", True) else "✗"
            color = Colors.GREEN if src.get("enabled", True) else Colors.RED
            print(f"  {color}{status}{Colors.RESET} {name} (priority: {src.get('priority', 'N/A')})")

    return 0


def cmd_rebuild(args):
    """Rebuild dbc from sources."""
    dry_run = args.dry_run

    print(f"{Colors.BOLD}DBC Rebuild{' (DRY RUN)' if dry_run else ''}{Colors.RESET}\n")

    # Step 0: Safety check
    print(f"{Colors.CYAN}Step 0: Safety check...{Colors.RESET}")
    result = compare_databases(LIVE_DBC, EXPECTED_DBC)

    if not result["identical"]:
        print(f"{Colors.YELLOW}⚠ Uncommitted changes detected in {LIVE_DBC}{Colors.RESET}")
        print("These changes will be LOST during rebuild.\n")

        for table, count1, count2, _, _ in result["tables_with_differences"]:
            diff = count1 - count2
            sign = "+" if diff > 0 else ""
            print(f"  {table}: {sign}{diff} rows")

        if not dry_run:
            response = input(f"\n{Colors.YELLOW}Continue with rebuild? (y/N): {Colors.RESET}")
            if response.lower() != 'y':
                print("Rebuild cancelled.")
                return 1
    else:
        print(f"  {Colors.GREEN}✓ No uncommitted changes{Colors.RESET}")

    # Load registry
    registry = load_registry()
    sources = registry.get("sources", {})
    enabled_sources = [(k, v) for k, v in sources.items() if v.get("enabled", True)]

    if not enabled_sources:
        print(f"\n{Colors.YELLOW}No enabled sources found. Nothing to rebuild.{Colors.RESET}")
        return 0

    # Sort by priority
    enabled_sources.sort(key=lambda x: x[1].get("priority", 100))

    print(f"\n{Colors.CYAN}Step 1: Sources to apply ({len(enabled_sources)}):{Colors.RESET}")
    for name, src in enabled_sources:
        print(f"  [{src.get('priority', 'N/A'):3}] {name}")

    if dry_run:
        print(f"\n{Colors.YELLOW}DRY RUN - no changes made{Colors.RESET}")
        return 0

    # Step 2: Copy original_dbc to dbc
    print(f"\n{Colors.CYAN}Step 2: Resetting {LIVE_DBC} from {ORIGINAL_DBC}...{Colors.RESET}")

    try:
        conn = get_connection(ORIGINAL_DBC, use_root=True)
        cursor = conn.cursor()

        # Get all tables
        tables = get_tables(conn)

        # For each table, copy from original to live
        live_conn = get_connection(LIVE_DBC, use_root=True)
        live_cursor = live_conn.cursor()

        for table in tables:
            if table.startswith("dbc_"):
                continue
            print(f"  Copying {table}...")
            live_cursor.execute(f"TRUNCATE TABLE `{table}`")
            live_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{ORIGINAL_DBC}`.`{table}`")

        live_conn.commit()
        live_cursor.close()
        live_conn.close()
        cursor.close()
        conn.close()

        print(f"  {Colors.GREEN}✓ Reset complete{Colors.RESET}")

    except Exception as e:
        print(f"  {Colors.RED}Error: {e}{Colors.RESET}")
        return 1

    # Step 3: Apply sources in priority order
    print(f"\n{Colors.CYAN}Step 3: Applying sources...{Colors.RESET}")

    conflicts = []

    for name, src in enabled_sources:
        # Support both "file" (single file) and "path" (directory with multiple files)
        source_path = SOURCES_DIR / src.get("path", src.get("file", ""))

        if not source_path.exists():
            print(f"  {Colors.YELLOW}⚠ Skipping {name}: path not found{Colors.RESET}")
            continue

        print(f"  Applying {name}...")

        # Collect SQL files to apply
        sql_files = []
        if source_path.is_dir():
            # Directory: apply all .sql files in sorted order
            sql_files = sorted(source_path.glob("*.sql"))
        else:
            # Single file
            sql_files = [source_path]

        try:
            conn = get_connection(LIVE_DBC)
            cursor = conn.cursor()

            for sql_file in sql_files:
                with open(sql_file) as f:
                    sql = f.read()

                if sql.strip():
                    # Execute each statement
                    for statement in sql.split(";"):
                        statement = statement.strip()
                        if statement:
                            cursor.execute(statement)

            conn.commit()
            cursor.close()
            conn.close()

            file_count = len(sql_files)
            print(f"    {Colors.GREEN}✓ Applied ({file_count} file{'s' if file_count != 1 else ''}){Colors.RESET}")

        except Exception as e:
            print(f"    {Colors.RED}Error: {e}{Colors.RESET}")
            conflicts.append((name, str(e)))

    # Step 4: Copy dbc to expected_dbc
    print(f"\n{Colors.CYAN}Step 4: Updating {EXPECTED_DBC}...{Colors.RESET}")

    try:
        conn = get_connection(LIVE_DBC, use_root=True)
        tables = get_tables(conn)
        conn.close()

        expected_conn = get_connection(EXPECTED_DBC, use_root=True)
        expected_cursor = expected_conn.cursor()

        for table in tables:
            if table.startswith("dbc_"):
                continue
            expected_cursor.execute(f"TRUNCATE TABLE `{table}`")
            expected_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{LIVE_DBC}`.`{table}`")

        expected_conn.commit()
        expected_cursor.close()
        expected_conn.close()

        print(f"  {Colors.GREEN}✓ Expected state updated{Colors.RESET}")

    except Exception as e:
        print(f"  {Colors.RED}Error: {e}{Colors.RESET}")
        return 1

    # Summary
    print(f"\n{Colors.GREEN}{Colors.BOLD}Rebuild complete!{Colors.RESET}")

    if conflicts:
        print(f"\n{Colors.YELLOW}Warnings during rebuild:{Colors.RESET}")
        for name, err in conflicts:
            print(f"  {name}: {err}")

    return 0


def cmd_export(args):
    """Export dbc to DBC files via DBCTool."""
    table = args.name

    if not DBCTOOL_PATH.exists():
        print(f"{Colors.RED}Error: DBCTool not found at {DBCTOOL_PATH}{Colors.RESET}")
        return 1

    print(f"{Colors.CYAN}Exporting to DBC files...{Colors.RESET}")

    cmd = [str(DBCTOOL_PATH), "export"]
    if table:
        cmd.extend(["--name", table])

    result = subprocess.run(cmd, cwd=DBCTOOL_PATH.parent)
    return result.returncode


def cmd_import_module(args):
    """Import binary DBC files as a new module source."""
    name = args.name
    source_path = Path(args.source)
    priority = args.priority

    if not source_path.exists():
        print(f"{Colors.RED}Error: Source path not found: {source_path}{Colors.RESET}")
        return 1

    # Find all .dbc files in source path
    dbc_files = list(source_path.glob("*.dbc")) + list(source_path.glob("*.DBC"))
    if not dbc_files:
        print(f"{Colors.RED}Error: No .dbc files found in {source_path}{Colors.RESET}")
        return 1

    print(f"{Colors.BOLD}Importing module: {name}{Colors.RESET}")
    print(f"  Source: {source_path}")
    print(f"  Priority: {priority}")
    print(f"  DBC files: {len(dbc_files)}")
    print()

    # Step 1: Reset scratch_dbc and copy from original_dbc
    print(f"{Colors.CYAN}Step 1: Resetting {SCRATCH_DBC} from {ORIGINAL_DBC}...{Colors.RESET}")
    try:
        # Get tables from original_dbc
        orig_conn = get_connection(ORIGINAL_DBC)
        orig_tables = get_tables(orig_conn)
        orig_conn.close()

        # Connect to scratch_dbc and drop all existing tables
        scratch_conn = get_connection(SCRATCH_DBC, use_root=True)
        scratch_cursor = scratch_conn.cursor()

        # Get existing tables in scratch_dbc
        scratch_cursor.execute("SHOW TABLES")
        existing_tables = [row[0] for row in scratch_cursor.fetchall()]

        # Disable foreign key checks for clean drops
        scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 0")

        # Drop all existing tables
        for table in existing_tables:
            scratch_cursor.execute(f"DROP TABLE IF EXISTS `{table}`")

        # Re-enable foreign key checks
        scratch_cursor.execute("SET FOREIGN_KEY_CHECKS = 1")

        # Copy tables from original_dbc
        for table in orig_tables:
            if table.startswith("dbc_"):
                continue
            scratch_cursor.execute(f"CREATE TABLE `{table}` LIKE `{ORIGINAL_DBC}`.`{table}`")
            scratch_cursor.execute(f"INSERT INTO `{table}` SELECT * FROM `{ORIGINAL_DBC}`.`{table}`")

        scratch_conn.commit()
        scratch_cursor.close()
        scratch_conn.close()

        print(f"  {Colors.GREEN}✓ Reset {SCRATCH_DBC} with {len(orig_tables)} tables{Colors.RESET}")

    except Exception as e:
        print(f"  {Colors.RED}Error creating scratch database: {e}{Colors.RESET}")
        return 1

    # Step 2: Create temporary config and symlinks for DBCTool
    print(f"\n{Colors.CYAN}Step 2: Importing DBC files via DBCTool...{Colors.RESET}")

    # Create temp directory with symlinks matching meta.File case
    temp_dbc_dir = Path(tempfile.mkdtemp(prefix="dbc_import_"))

    try:
        # Build a map of lowercase name -> meta.File (original case)
        meta_dir = DBCTOOL_PATH.parent / "meta"
        meta_file_map = {}  # lowercase_name -> original_case_filename
        for meta_file in meta_dir.glob("*.meta.json"):
            try:
                with open(meta_file) as f:
                    meta_data = json.load(f)
                    if "file" in meta_data:
                        # Map lowercase stem to original filename
                        original_file = meta_data["file"]
                        lowercase_stem = Path(original_file).stem.lower()
                        meta_file_map[lowercase_stem] = original_file
            except:
                pass

        # Create symlinks with the case expected by meta files
        for dbc_file in dbc_files:
            lowercase_stem = dbc_file.stem.lower()
            # Use the original case from meta file if available
            if lowercase_stem in meta_file_map:
                target_name = meta_file_map[lowercase_stem]
            else:
                target_name = dbc_file.name  # Keep original case
            symlink_path = temp_dbc_dir / target_name
            if not symlink_path.exists():
                symlink_path.symlink_to(dbc_file)

        scratch_config = {
            "dbc": {
                "user": DB_USER,
                "password": DB_PASSWORD,
                "host": DB_HOST,
                "port": "3306",
                "name": SCRATCH_DBC
            },
            "paths": {
                "base": str(temp_dbc_dir),
                "export": str(temp_dbc_dir),
                "meta": str(DBCTOOL_PATH.parent / "meta")
            },
            "options": {
                "use_versioning": False
            }
        }

        scratch_config_path = SCRIPT_DIR / "scratch_config.json"
        with open(scratch_config_path, "w") as f:
            json.dump(scratch_config, f, indent=2)

        # Import each DBC file
        imported_tables = []
        for dbc_file in sorted(dbc_files):
            dbc_name = dbc_file.stem  # e.g., "Spell" from "Spell.dbc"
            # DBCTool meta files are lowercase, so use lowercase name
            dbc_name_lower = dbc_name.lower()
            print(f"  Importing {dbc_name}...")

            result = subprocess.run(
                [str(DBCTOOL_PATH), "import", "-f", "-n", dbc_name_lower, "--config", str(scratch_config_path)],
                cwd=DBCTOOL_PATH.parent,
                capture_output=True,
                text=True
            )

            if result.returncode == 0:
                imported_tables.append(dbc_name_lower)
                print(f"    {Colors.GREEN}✓{Colors.RESET}")
            else:
                print(f"    {Colors.YELLOW}⚠ {result.stderr.strip() or 'Unknown error'}{Colors.RESET}")

        # Clean up temp config
        scratch_config_path.unlink(missing_ok=True)

    finally:
        # Clean up temp directory
        shutil.rmtree(temp_dbc_dir, ignore_errors=True)

    if not imported_tables:
        print(f"\n{Colors.RED}Error: No tables were imported successfully{Colors.RESET}")
        return 1

    print(f"  {Colors.GREEN}✓ Imported {len(imported_tables)} table(s){Colors.RESET}")

    # Step 3: Diff scratch_dbc vs original_dbc
    print(f"\n{Colors.CYAN}Step 3: Analyzing differences...{Colors.RESET}")

    result = compare_databases(SCRATCH_DBC, ORIGINAL_DBC)

    if result["identical"]:
        print(f"  {Colors.YELLOW}No differences found - nothing to extract{Colors.RESET}")
        # Clean up scratch_dbc (drop all tables)
        conn = get_connection(SCRATCH_DBC, use_root=True)
        cursor = conn.cursor()
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
        cursor.execute("SHOW TABLES")
        for (table,) in cursor.fetchall():
            cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
        conn.commit()
        cursor.close()
        conn.close()
        return 0

    # Show summary
    tables_with_changes = []
    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        diff = get_table_diff(table, SCRATCH_DBC, ORIGINAL_DBC)
        adds = len(diff["only_in_db1"])
        mods = len(diff["modified"])
        dels = len(diff["only_in_db2"])
        if adds > 0 or mods > 0 or dels > 0:
            tables_with_changes.append(table)
            print(f"    {table}: +{adds} ~{mods} -{dels}")

    # Step 4: Generate per-table SQL files
    print(f"\n{Colors.CYAN}Step 4: Generating per-table SQL files...{Colors.RESET}")

    # Create module directory
    module_dir = SOURCES_DIR / "modules" / name
    module_dir.mkdir(parents=True, exist_ok=True)

    # Generate SQL for each changed table
    total_lines = 0
    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        diff = get_table_diff(table, SCRATCH_DBC, ORIGINAL_DBC, skip_localization=True)
        adds = len(diff["only_in_db1"])
        mods = len(diff["modified"])
        dels = len(diff["only_in_db2"])

        # Skip tables with no actual changes (after localization filtering)
        if adds == 0 and mods == 0 and dels == 0:
            continue

        # Generate SQL for this table
        sql = generate_diff_sql(table, SCRATCH_DBC, ORIGINAL_DBC, skip_localization=True)

        # Write to per-table file
        table_file = module_dir / f"{table}.sql"
        with open(table_file, "w") as f:
            f.write(f"-- {name}: {table}\n")
            f.write(f"-- Generated by dbc-mgr import-module\n\n")
            f.write(sql)

        line_count = sql.count('\n') + 1
        total_lines += line_count
        print(f"    {table}.sql (+{adds} ~{mods} -{dels}) - {line_count} lines")

    print(f"  Wrote {len(tables_with_changes)} files to {module_dir}")
    print(f"  Total: {total_lines} lines")

    # Step 5: Update registry (directory path, not single file)
    registry = load_registry()
    relative_path = f"modules/{name}"  # Directory, not file

    registry["sources"][name] = {
        "type": "module",
        "path": relative_path,  # Changed from "file" to "path" for directories
        "priority": priority,
        "enabled": True,
        "tables": tables_with_changes,
        "description": f"Imported from {source_path} on {__import__('datetime').datetime.now().strftime('%Y-%m-%d')}"
    }
    save_registry(registry)
    print(f"  Registered in source_registry.json")

    # Step 6: Clean up scratch_dbc (drop all tables)
    print(f"\n{Colors.CYAN}Step 5: Cleaning up...{Colors.RESET}")
    try:
        conn = get_connection(SCRATCH_DBC, use_root=True)
        cursor = conn.cursor()
        cursor.execute("SET FOREIGN_KEY_CHECKS = 0")
        cursor.execute("SHOW TABLES")
        for (table,) in cursor.fetchall():
            cursor.execute(f"DROP TABLE IF EXISTS `{table}`")
        cursor.execute("SET FOREIGN_KEY_CHECKS = 1")
        conn.commit()
        cursor.close()
        conn.close()
        print(f"  {Colors.GREEN}✓ Cleared {SCRATCH_DBC}{Colors.RESET}")
    except Exception as e:
        print(f"  {Colors.YELLOW}Warning: Could not clean scratch database: {e}{Colors.RESET}")

    print(f"\n{Colors.GREEN}✓ Import complete: {name}{Colors.RESET}")
    print(f"  Path: {module_dir}")
    print(f"  Priority: {priority}")
    print(f"  Tables: {', '.join(tables_with_changes)}")

    return 0


# =============================================================================
# Main Entry Point
# =============================================================================

def main():
    parser = argparse.ArgumentParser(
        description="DBC Database Manager",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__
    )

    subparsers = parser.add_subparsers(dest="command", help="Command to run")

    # status
    status_parser = subparsers.add_parser("status", help="Check for uncommitted changes")
    status_parser.set_defaults(func=cmd_status)

    # diff
    diff_parser = subparsers.add_parser("diff", help="Show detailed diff")
    diff_parser.add_argument("--sql", action="store_true", help="Output SQL statements")
    diff_parser.set_defaults(func=cmd_diff)

    # list
    list_parser = subparsers.add_parser("list", help="List all sources")
    list_parser.set_defaults(func=cmd_list)

    # show
    show_parser = subparsers.add_parser("show", help="Show source details")
    show_parser.add_argument("source", help="Source name")
    show_parser.set_defaults(func=cmd_show)

    # enable
    enable_parser = subparsers.add_parser("enable", help="Enable a source")
    enable_parser.add_argument("source", help="Source name")
    enable_parser.set_defaults(func=cmd_enable)

    # disable
    disable_parser = subparsers.add_parser("disable", help="Disable a source")
    disable_parser.add_argument("source", help="Source name")
    disable_parser.set_defaults(func=cmd_disable)

    # rebuild
    rebuild_parser = subparsers.add_parser("rebuild", help="Rebuild dbc from sources")
    rebuild_parser.add_argument("--dry-run", action="store_true", help="Preview without applying")
    rebuild_parser.set_defaults(func=cmd_rebuild)

    # export
    export_parser = subparsers.add_parser("export", help="Export to DBC files")
    export_parser.add_argument("--name", help="Export specific table")
    export_parser.set_defaults(func=cmd_export)

    # import-module
    import_parser = subparsers.add_parser("import-module", help="Import binary DBC files")
    import_parser.add_argument("--name", required=True, help="Module name")
    import_parser.add_argument("--source", required=True, help="Path to DBC files")
    import_parser.add_argument("--priority", type=int, default=50, help="Priority (default: 50)")
    import_parser.set_defaults(func=cmd_import_module)

    # extract
    extract_parser = subparsers.add_parser("extract", help="Extract current dbc customizations as a source")
    extract_parser.add_argument("--name", required=True, help="Source name (e.g., 'current-custom' or 'F-004')")
    extract_parser.add_argument("--type", choices=["module", "feature"], default="feature", help="Source type")
    extract_parser.add_argument("--priority", type=int, default=100, help="Priority (default: 100)")
    extract_parser.set_defaults(func=cmd_extract)

    args = parser.parse_args()

    if not args.command:
        parser.print_help()
        return 1

    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
