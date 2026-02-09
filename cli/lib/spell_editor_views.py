"""
Generate MySQL updatable views for the WoW Spell Editor.

Creates a 'spell_editor' database with lowercase-named views (matching how
the Spell Editor lowercases binding filenames for table names) that alias
the snake_case columns to PascalCase in the 'dbc' database. This lets the
Spell Editor work with the snake_case DBC pipeline without modification.
"""

import json
import os
from pathlib import Path
from typing import List, Optional, Tuple

from .env import DBCTOOL_PATH

# Directories relative to DBCTool
META_DIR = DBCTOOL_PATH.parent / "meta"
BINDINGS_DIR = DBCTOOL_PATH.parent / "original_bindings_335"

# Locale expansion order matching DBCTool's db_import.go locLangs array
LOC_SUFFIXES = [
    "enus", "kokr", "frfr", "dede", "zhcn", "zhtw",
    "eses", "esmx", "ruru", "jajp", "ptpt", "itit",
    "unused_1", "unused_2", "unused_3", "unused_4",
    "flags",
]

# Default database names
SOURCE_DB = "dbc"
VIEW_DB = "spell_editor"
DB_USER = "spell-editor"


def expand_meta_columns(meta: dict) -> List[str]:
    """Expand meta file fields to actual MySQL column names."""
    columns = []
    for field in meta["fields"]:
        name = field["name"]
        count = field.get("count", 0)
        field_type = field["type"]

        if field_type == "Loc":
            for suffix in LOC_SUFFIXES:
                columns.append(f"{name}_{suffix}")
        elif count > 1:
            for i in range(1, count + 1):
                columns.append(f"{name}_{i}")
        else:
            columns.append(name)

    return columns


def parse_binding_columns(binding_path: Path) -> List[str]:
    """Parse original PascalCase binding file to ordered column names."""
    columns = []
    with open(binding_path) as f:
        for line in f:
            line = line.strip()
            if not line or line.startswith("#"):
                continue
            parts = line.split()
            if len(parts) >= 2:
                columns.append(parts[1])  # field name is second token
    return columns


def find_meta_for_binding(binding_name: str) -> Optional[Path]:
    """Find the meta file corresponding to a binding file name.

    Binding 'Spell.txt' -> meta 'spell.meta.json'
    Binding 'SpellCastTimes.txt' -> meta 'spellcasttimes.meta.json'
    """
    table_name = binding_name.replace(".txt", "").lower()
    meta_path = META_DIR / f"{table_name}.meta.json"
    if meta_path.exists():
        return meta_path
    return None


def _generate_view_sql(view_name: str, source_table: str,
                       db_columns: List[str], binding_columns: List[str],
                       source_db: str, view_db: str) -> str:
    """Generate CREATE OR REPLACE VIEW SQL."""
    aliases = []
    for db_col, bind_col in zip(db_columns, binding_columns):
        if db_col == bind_col:
            aliases.append(f"    `{db_col}`")
        else:
            aliases.append(f"    `{db_col}` AS `{bind_col}`")

    select_list = ",\n".join(aliases)
    return (
        f"CREATE OR REPLACE VIEW `{view_db}`.`{view_name}` AS\n"
        f"SELECT\n"
        f"{select_list}\n"
        f"FROM `{source_db}`.`{source_table}`;\n"
    )


def _process_table(binding_file: Path, source_db: str, view_db: str) -> Tuple[str, Optional[str], Optional[str]]:
    """Process a single binding file and return (view_name, sql, error)."""
    binding_name = binding_file.name
    # Spell Editor lowercases binding filename to derive MySQL table name
    view_name = binding_name.replace(".txt", "").lower()

    meta_path = find_meta_for_binding(binding_name)
    if not meta_path:
        return view_name, None, f"No meta file found for {binding_name}"

    with open(meta_path) as f:
        meta = json.load(f)

    source_table = meta.get("tableName", view_name.lower())
    db_columns = expand_meta_columns(meta)
    binding_columns = parse_binding_columns(binding_file)

    if len(db_columns) != len(binding_columns):
        return view_name, None, (
            f"Column count mismatch for {view_name}: "
            f"meta={len(db_columns)}, binding={len(binding_columns)}"
        )

    sql = _generate_view_sql(view_name, source_table, db_columns, binding_columns,
                             source_db, view_db)
    return view_name, sql, None


def generate_all_views(source_db: str = SOURCE_DB, view_db: str = VIEW_DB) -> Tuple[str, List[str]]:
    """Generate SQL for all binding files.

    Returns:
        Tuple of (sql_output, errors) where errors is a list of warning strings.

    Raises:
        FileNotFoundError: If bindings or meta directory is missing.
    """
    if not BINDINGS_DIR.exists():
        raise FileNotFoundError(f"Bindings directory not found: {BINDINGS_DIR}")

    if not META_DIR.exists():
        raise FileNotFoundError(f"Meta directory not found: {META_DIR}")

    binding_files = sorted(BINDINGS_DIR.glob("*.txt"))
    if not binding_files:
        raise FileNotFoundError(f"No binding files found in {BINDINGS_DIR}")

    lines = []
    lines.append("-- Generated by spell_editor_views.py")
    lines.append("-- Creates PascalCase updatable views in spell_editor database")
    lines.append(f"-- pointing to snake_case tables in {source_db} database")
    lines.append("")
    lines.append(f"DROP DATABASE IF EXISTS `{view_db}`;")
    lines.append(f"CREATE DATABASE `{view_db}`;")
    lines.append("")
    lines.append(f"GRANT ALL PRIVILEGES ON `{view_db}`.* TO '{DB_USER}'@'%';")
    lines.append("FLUSH PRIVILEGES;")
    lines.append("")

    errors = []
    success_count = 0

    for binding_file in binding_files:
        view_name, sql, error = _process_table(binding_file, source_db, view_db)
        if error:
            errors.append(error)
            lines.append(f"-- SKIPPED: {error}")
            lines.append("")
        else:
            lines.append(f"-- {view_name} ({len(sql.splitlines()) - 3} columns)")
            lines.append(sql)
            success_count += 1

    lines.append(f"-- Generated {success_count} views, {len(errors)} errors")

    return "\n".join(lines), errors


def execute_views(source_db: str = SOURCE_DB, view_db: str = VIEW_DB) -> Tuple[int, List[str]]:
    """Generate and execute spell_editor views against MySQL.

    Uses DB_ROOT_USER/DB_ROOT_PASS from environment for CREATE DATABASE/GRANT,
    and DBC_HOST/DBC_PORT for connection.

    Returns:
        Tuple of (success_count, errors).

    Raises:
        ImportError: If mysql-connector-python is not installed.
        FileNotFoundError: If bindings or meta directories are missing.
    """
    import mysql.connector

    sql, errors = generate_all_views(source_db, view_db)

    host = os.environ.get("DBC_HOST", "192.168.0.55")
    port = int(os.environ.get("DBC_PORT", "3306"))
    root_user = os.environ.get("DB_ROOT_USER", "root")
    root_pass = os.environ.get("DB_ROOT_PASS", "")

    conn = mysql.connector.connect(
        host=host, port=port, user=root_user, password=root_pass,
    )

    exec_errors = []
    success_count = 0
    cursor = conn.cursor()
    for statement in sql.split(";"):
        # Strip comment-only lines, keep the actual SQL
        lines = [l for l in statement.strip().splitlines()
                 if l.strip() and not l.strip().startswith("--")]
        cleaned = "\n".join(lines).strip()
        if not cleaned:
            continue
        try:
            cursor.execute(cleaned)
            success_count += 1
        except Exception as e:
            exec_errors.append(f"{cleaned[:80]}... -> {e}")
    conn.commit()
    cursor.close()
    conn.close()

    return success_count, errors + exec_errors
