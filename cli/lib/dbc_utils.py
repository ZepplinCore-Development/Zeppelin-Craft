"""
DBC database utilities for Zeppelin-Craft CLI.

Four-database architecture for safe, traceable DBC editing:
  - original_dbc: Pristine 3.3.5a stock (never modified)
  - scratch_dbc: Temp workspace during imports/rebuilds
  - dbc: Live database (Spell Editor + dbc.py work here)
  - expected_dbc: Safety baseline (catches uncommitted changes)
"""

import hashlib
import json
import os
import re
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple, Any

# Cached localization config (fallback)
_localization_config: Optional[Dict] = None

# Cached meta/ Loc field lookups:
#   {table_name: set of Loc field base names}
_meta_loc_fields: Dict[str, Optional[Set[str]]] = {}

# Non-English locale suffixes for blacklisting in the dbc_localization.json fallback path.
# The primary meta path builds its own blacklist dynamically from field detection.
_LOC_BLACKLIST_SUFFIXES = (
    # Locale code format (Loc type expansion by meta/ schema)
    '_kokr', '_frfr', '_dede', '_zhcn', '_zhtw',
    '_eses', '_esmx', '_ruru', '_jajp', '_ptpt', '_itit',
    '_unused_1', '_unused_2', '_unused_3', '_unused_4',
    # Numeric format (used by fallback and generic paths)
    '_1', '_2', '_3', '_4', '_5', '_6', '_7',
    '_8', '_9', '_10', '_11', '_12', '_13', '_14', '_15', '_16',
)

try:
    import mysql.connector
except ImportError:
    mysql.connector = None


def load_localization_config() -> Dict:
    """Load the DBC localization config file.

    The config defines per-table localization field rules for WoW 3.3.5a DBC files.
    Each table entry specifies:
        - localized_prefixes: Field name prefixes that have locale suffixes
        - keep_suffixes: Suffixes to keep (English locale, flags, etc.)

    Returns:
        Config dict with 'tables' mapping
    """
    global _localization_config

    if _localization_config is not None:
        return _localization_config

    # Config file location relative to this module
    config_path = Path(__file__).parent.parent / 'config' / 'dbc_localization.json'

    if config_path.exists():
        with open(config_path, 'r', encoding='utf-8') as f:
            _localization_config = json.load(f)
    else:
        # Fallback to empty config
        _localization_config = {'tables': {}}

    return _localization_config


@dataclass
class DBCConfig:
    """Database configuration for DBC operations."""
    host: str = "192.168.0.55"
    port: int = 3306
    user: str = "spell-editor"
    password: str = ""

    # Database names
    original: str = "original_dbc"
    scratch: str = "scratch_dbc"
    live: str = "dbc"
    expected: str = "expected_dbc"

    @classmethod
    def from_env(cls, env_path: Optional[Path] = None) -> "DBCConfig":
        """Load configuration from .env file or environment.

        Args:
            env_path: Optional path to .env file

        Returns:
            DBCConfig instance
        """
        # Try loading from .env file
        env_vars = {}

        if env_path and env_path.exists():
            with open(env_path) as f:
                for line in f:
                    line = line.strip()
                    if line and not line.startswith('#') and '=' in line:
                        key, value = line.split('=', 1)
                        env_vars[key.strip()] = value.strip()

        # Fall back to environment variables (DBC_ prefixed keys for DBC database)
        return cls(
            host=env_vars.get('DBC_HOST', os.getenv('DBC_HOST', '192.168.0.55')),
            port=int(env_vars.get('DBC_PORT', os.getenv('DBC_PORT', '3306'))),
            user=env_vars.get('DBC_USER', os.getenv('DBC_USER', 'spell-editor')),
            password=env_vars.get('DBC_PASS', os.getenv('DBC_PASS', '')),
            original=env_vars.get('BACKUP_DBC_NAME', os.getenv('BACKUP_DBC_NAME', 'original_dbc')),
            scratch=env_vars.get('SCRATCH_DBC_NAME', os.getenv('SCRATCH_DBC_NAME', 'scratch_dbc')),
            live=env_vars.get('LIVE_DBC_NAME', os.getenv('LIVE_DBC_NAME', 'dbc')),
            expected=env_vars.get('EXPECTED_DBC_NAME', os.getenv('EXPECTED_DBC_NAME', 'expected_dbc')),
        )

    @classmethod
    def from_registry(cls, registry_data: Dict[str, Any], env_path: Optional[Path] = None) -> "DBCConfig":
        """Load configuration from registry data, with env overrides.

        Args:
            registry_data: Registry JSON data
            env_path: Optional path to .env file for credentials

        Returns:
            DBCConfig instance
        """
        # Get database names from registry
        dbc_config = registry_data.get('dbc', {}).get('databases', {})

        # Start with env-based config for credentials
        config = cls.from_env(env_path)

        # Override database names from registry if present
        if dbc_config.get('original'):
            config.original = dbc_config['original']
        if dbc_config.get('scratch'):
            config.scratch = dbc_config['scratch']
        if dbc_config.get('live'):
            config.live = dbc_config['live']
        if dbc_config.get('expected'):
            config.expected = dbc_config['expected']

        return config


class DBCConnection:
    """Manages connections to DBC databases."""

    def __init__(self, config: DBCConfig):
        """Initialize with configuration.

        Args:
            config: Database configuration
        """
        self.config = config
        self._connections: Dict[str, Any] = {}

    def get_connection(self, database: str):
        """Get a MySQL connection to the specified database.

        Args:
            database: Database name

        Returns:
            MySQL connection object
        """
        if mysql.connector is None:
            raise ImportError("mysql-connector-python is required for DBC operations")

        if database not in self._connections:
            self._connections[database] = mysql.connector.connect(
                host=self.config.host,
                port=self.config.port,
                user=self.config.user,
                password=self.config.password,
                database=database,
                consume_results=True  # Auto-consume unread results to prevent cursor errors
            )

        return self._connections[database]

    def close_all(self):
        """Close all open connections."""
        for conn in self._connections.values():
            try:
                conn.close()
            except Exception:
                pass
        self._connections.clear()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close_all()


def is_modification(sql: str) -> bool:
    """
    Detect if SQL contains modification statements.

    Args:
        sql: SQL string to check

    Returns:
        True if INSERT, UPDATE, or DELETE found
    """
    sql_upper = sql.upper()
    modification_pattern = r'\b(INSERT|UPDATE|DELETE)\b'
    return bool(re.search(modification_pattern, sql_upper))


def detect_modified_tables(sql: str) -> Set[str]:
    """
    Parse SQL to detect which tables are being modified.

    Args:
        sql: SQL string to analyze

    Returns:
        Set of table names being modified
    """
    tables = set()
    sql_upper = sql.upper()

    # INSERT INTO table
    for match in re.finditer(r'INSERT\s+INTO\s+[`"]?(\w+)[`"]?', sql_upper):
        tables.add(match.group(1).lower())

    # UPDATE table
    for match in re.finditer(r'UPDATE\s+[`"]?(\w+)[`"]?', sql_upper):
        tables.add(match.group(1).lower())

    # DELETE FROM table
    for match in re.finditer(r'DELETE\s+FROM\s+[`"]?(\w+)[`"]?', sql_upper):
        tables.add(match.group(1).lower())

    return tables


def _get_meta_loc_fields(table_name: str) -> Optional[Set[str]]:
    """Get Loc field base names from DBCTool meta/ for a table.

    Reads meta/{table}.meta.json and finds fields with "type": "Loc".
    These are expanded by DBCTool into 16 locale columns + 1 flags column
    using language code suffixes (e.g. spell_name_enus, spell_name_kokr).

    Returns:
        Set of Loc field base names (may be empty if meta exists but has
        no Loc fields), or None if no meta file found for this table.
    """
    table_lower = table_name.lower()
    if table_lower in _meta_loc_fields:
        return _meta_loc_fields[table_lower]

    # Find DBCTool meta/ directory via DBCTOOL_PATH
    try:
        from .env import DBCTOOL_PATH
        meta_path = DBCTOOL_PATH.parent / 'meta' / f'{table_lower}.meta.json'
    except (ImportError, AttributeError):
        meta_path = None

    if not meta_path or not meta_path.exists():
        _meta_loc_fields[table_lower] = None
        return None

    try:
        with open(meta_path, 'r', encoding='utf-8') as f:
            meta = json.load(f)

        loc_fields = {f['name'] for f in meta.get('fields', [])
                      if f.get('type') == 'Loc'}

        _meta_loc_fields[table_lower] = loc_fields
        return _meta_loc_fields[table_lower]
    except Exception:
        _meta_loc_fields[table_lower] = None
        return None


def get_localization_columns(columns: List[str], table_name: Optional[str] = None) -> Set[str]:
    """
    Identify localization columns to exclude from diffs.

    Primary source: DBCTool meta/ files with "type": "Loc" fields.
    Loc fields expand to language-code suffixed columns (e.g. _enus, _kokr).
    We keep _enus (English) and _flags, exclude all other locales.

    Fallback: dbc_localization.json config for tables without meta files.

    Args:
        columns: List of column names
        table_name: Optional table name for per-table rules

    Returns:
        Set of column names to exclude
    """
    localization_cols = set()

    # Non-English locale code suffixes (without leading underscore)
    _NON_ENGLISH_LOCALES = {
        'kokr', 'frfr', 'dede', 'zhcn', 'zhtw',
        'eses', 'esmx', 'ruru', 'jajp', 'ptpt', 'itit',
        'unused_1', 'unused_2', 'unused_3', 'unused_4',
    }

    # Primary: use meta/ Loc fields (set of base names)
    if table_name:
        loc_fields = _get_meta_loc_fields(table_name)
        if loc_fields is not None:
            for col in columns:
                col_lower = col.lower()
                for field_name in loc_fields:
                    prefix = field_name + '_'
                    if col_lower.startswith(prefix):
                        suffix = col_lower[len(prefix):]
                        # Keep English locale and flags
                        if suffix in ('enus', 'flags'):
                            break
                        # Exclude non-English locale codes
                        if suffix in _NON_ENGLISH_LOCALES:
                            localization_cols.add(col)
                            break
                        # Numeric suffixes for backwards compat
                        if re.match(r'^\d+$', suffix):
                            localization_cols.add(col)
                            break
            return localization_cols

    # Fallback: dbc_localization.json config
    config = load_localization_config()
    table_config = config.get('tables', {}).get(table_name.lower()) if table_name else None

    if table_config:
        prefixes = table_config.get('localized_prefixes', [])
        keep_suffixes = set(table_config.get('keep_suffixes', []))

        for col in columns:
            col_lower = col.lower()
            for prefix in prefixes:
                if col_lower.startswith(prefix.lower()):
                    suffix = col_lower[len(prefix):]
                    if suffix in keep_suffixes:
                        continue
                    if re.match(r'^_\d+$', suffix):
                        localization_cols.add(col)
                        break
                    if suffix in _LOC_BLACKLIST_SUFFIXES:
                        localization_cols.add(col)
                        break
    else:
        # Generic fallback for unknown tables
        NON_ENGLISH_SUFFIXES = set(range(2, 17))

        for col in columns:
            col_lower = col.lower()

            match = re.search(r'_(\d+)$', col_lower)
            if match:
                suffix_num = int(match.group(1))
                if suffix_num in NON_ENGLISH_SUFFIXES:
                    localization_cols.add(col)
                    continue

            for suffix in _LOC_BLACKLIST_SUFFIXES:
                if col_lower.endswith(suffix):
                    localization_cols.add(col)
                    break

    return localization_cols


def normalize_string_value(value) -> str:
    """
    Normalize string values for comparison.

    Handles quote escaping differences and whitespace normalization.

    Args:
        value: Value to normalize

    Returns:
        Normalized string
    """
    if value is None:
        return None
    if not isinstance(value, str):
        return value

    normalized = value.replace('""', '"')
    normalized = normalized.rstrip()
    return normalized


def values_are_equivalent(val1, val2) -> bool:
    """
    Check if two values are equivalent after normalization.

    Args:
        val1: First value
        val2: Second value

    Returns:
        True if values are equivalent
    """
    if val1 is None and val2 is None:
        return True
    if val1 is None or val2 is None:
        return False

    if not isinstance(val1, str) or not isinstance(val2, str):
        return val1 == val2

    return normalize_string_value(val1) == normalize_string_value(val2)


def get_tables(conn) -> List[str]:
    """Get list of tables in the connected database.

    Args:
        conn: MySQL connection

    Returns:
        List of table names
    """
    cursor = conn.cursor()
    cursor.execute("SHOW TABLES")
    tables = [row[0] for row in cursor.fetchall()]
    cursor.close()
    return tables


def get_row_count(conn, table: str) -> int:
    """Get row count for a table.

    Args:
        conn: MySQL connection
        table: Table name

    Returns:
        Row count
    """
    cursor = conn.cursor()
    cursor.execute(f"SELECT COUNT(*) FROM `{table}`")
    count = cursor.fetchone()[0]
    cursor.close()
    return count


def get_table_checksum(conn, table: str) -> int:
    """Get checksum for a table.

    Args:
        conn: MySQL connection
        table: Table name

    Returns:
        Table checksum
    """
    cursor = conn.cursor()
    cursor.execute(f"CHECKSUM TABLE `{table}`")
    result = cursor.fetchone()
    cursor.close()
    return result[1] if result else 0


def get_primary_key(conn, table: str) -> List[str]:
    """Get the primary key column(s) for a table.

    Args:
        conn: MySQL connection
        table: Table name

    Returns:
        List of primary key column names (supports composite keys)
    """
    cursor = conn.cursor()
    cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name = 'PRIMARY'")
    results = cursor.fetchall()
    cursor.close()

    if results:
        # Sort by Seq_in_index (index 3) to get correct column order
        sorted_results = sorted(results, key=lambda r: r[3])
        return [r[4] for r in sorted_results]  # Column_name is at index 4

    # Fallback: check for common ID column names
    cursor = conn.cursor()
    cursor.execute(f"SHOW COLUMNS FROM `{table}`")
    columns = [row[0] for row in cursor.fetchall()]
    cursor.close()

    for col in ["ID", "id", "Id", "entry", "Entry"]:
        if col in columns:
            return [col]

    return [columns[0]] if columns else ["ID"]


# Tables excluded from drift analysis. These are not authored via zpak DBC
# SQL, so a live-vs-expected difference is expected and not real drift:
#   item            — auto-populated by the PATCH-Z build + resource-parser
#                     scripts (regenerated each build), so it always diverges
#                     from expected_dbc until the next PATCH-Z build re-syncs it
#   zep_dbc_updates — zep's own change-tracking table, live-only by design
DRIFT_IGNORE_TABLES = frozenset({"item", "zep_dbc_updates"})


def compare_databases(db_conn: DBCConnection, db1_name: str, db2_name: str) -> Dict:
    """
    Compare two databases and return differences.

    Tables in DRIFT_IGNORE_TABLES are excluded — they're regenerated by the
    build/parse pipeline (or are tracking metadata), so their divergence is
    not meaningful drift.

    Args:
        db_conn: Database connection manager
        db1_name: First database name
        db2_name: Second database name

    Returns:
        Dict with comparison results
    """
    conn1 = db_conn.get_connection(db1_name)
    conn2 = db_conn.get_connection(db2_name)

    tables1 = set(get_tables(conn1)) - DRIFT_IGNORE_TABLES
    tables2 = set(get_tables(conn2)) - DRIFT_IGNORE_TABLES

    only_in_db1 = tables1 - tables2
    only_in_db2 = tables2 - tables1
    common_tables = tables1 & tables2

    differences = []

    for table in sorted(common_tables):
        if table.startswith("dbc_"):
            continue

        checksum1 = get_table_checksum(conn1, table)
        checksum2 = get_table_checksum(conn2, table)

        if checksum1 != checksum2:
            count1 = get_row_count(conn1, table)
            count2 = get_row_count(conn2, table)
            differences.append((table, count1, count2, checksum1, checksum2))

    return {
        "identical": len(only_in_db1) == 0 and len(only_in_db2) == 0 and len(differences) == 0,
        "tables_only_in_db1": sorted(only_in_db1),
        "tables_only_in_db2": sorted(only_in_db2),
        "tables_with_differences": differences
    }


def get_effective_pk(table: str, db_pk: List[str]) -> List[str]:
    """Get the effective primary key for diffing, preferring meta uniqueKeys over auto_id.

    When the MySQL PK is auto_id (synthetic), check the meta file for uniqueKeys
    and use those instead for more meaningful diffs.

    Args:
        table: Table name
        db_pk: Primary key columns from the database

    Returns:
        Effective primary key column list
    """
    # Only override when the DB PK is auto_id
    if db_pk != ["auto_id"]:
        return db_pk

    try:
        from .env import DBCTOOL_PATH
        meta_path = DBCTOOL_PATH.parent / 'meta' / f'{table.lower()}.meta.json'
        if not meta_path.exists():
            return db_pk

        with open(meta_path, 'r', encoding='utf-8') as f:
            meta = json.load(f)

        # Check if meta has uniqueKeys
        unique_keys = meta.get('uniqueKeys', [])
        if unique_keys:
            return list(unique_keys[0])

        # Check if meta primaryKeys is something other than auto_id
        meta_pk = meta.get('primaryKeys', [])
        if meta_pk and meta_pk != ['auto_id']:
            return meta_pk

    except Exception:
        pass

    return db_pk


def get_table_diff(db_conn: DBCConnection, table: str, db1_name: str, db2_name: str,
                   primary_key: List[str] = None, skip_localization: bool = True) -> Dict:
    """
    Get detailed row-level differences between two tables.

    Args:
        db_conn: Database connection manager
        table: Table name to compare
        db1_name: Source database name
        db2_name: Target database name
        primary_key: Optional list of primary key column(s)
        skip_localization: If True, ignore localization columns

    Returns:
        Dict with row-level differences
    """
    conn1 = db_conn.get_connection(db1_name)
    conn2 = db_conn.get_connection(db2_name)

    if primary_key is None:
        primary_key = get_primary_key(conn1, table)
        primary_key = get_effective_pk(table, primary_key)

    order_clause = ", ".join(f"`{col}`" for col in primary_key)

    cursor1 = conn1.cursor(dictionary=True)
    cursor2 = conn2.cursor(dictionary=True)

    cursor1.execute(f"SELECT * FROM `{table}` ORDER BY {order_clause}")
    rows1 = {tuple(row[col] for col in primary_key): row for row in cursor1.fetchall()}

    cursor2.execute(f"SELECT * FROM `{table}` ORDER BY {order_clause}")
    rows2 = {tuple(row[col] for col in primary_key): row for row in cursor2.fetchall()}

    cursor1.close()
    cursor2.close()

    pks1 = set(rows1.keys())
    pks2 = set(rows2.keys())

    only_in_db1 = sorted(pks1 - pks2)
    only_in_db2 = sorted(pks2 - pks1)

    skipped_columns = set()
    if skip_localization and rows1:
        sample_row = next(iter(rows1.values()))
        skipped_columns = get_localization_columns(list(sample_row.keys()), table)

    modified = []
    for pk in sorted(pks1 & pks2):
        row1 = rows1[pk]
        row2 = rows2[pk]
        changed_cols = []
        for col in row1.keys():
            if col in skipped_columns:
                continue
            if not values_are_equivalent(row1[col], row2[col]):
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


def _build_where_clause(pk_cols: List[str], pk_vals: tuple) -> str:
    """Build a WHERE clause for one or more primary key columns.

    Args:
        pk_cols: List of primary key column names
        pk_vals: Tuple of primary key values (same order as pk_cols)

    Returns:
        WHERE clause string (without the WHERE keyword)
    """
    conditions = []
    for col, val in zip(pk_cols, pk_vals):
        if isinstance(val, (int, float)):
            conditions.append(f"`{col}` = {val}")
        else:
            escaped = str(val).replace("\\", "\\\\").replace("'", "\\'")
            conditions.append(f"`{col}` = '{escaped}'")
    return " AND ".join(conditions)


def _format_pk_display(pk_cols: List[str], pk_vals: tuple) -> str:
    """Format primary key values for display output.

    Args:
        pk_cols: List of primary key column names
        pk_vals: Tuple of primary key values

    Returns:
        Display string like 'id=123' or '(race_id=1, class_id=2)'
    """
    if len(pk_cols) == 1:
        return f"{pk_cols[0]}={pk_vals[0]}"
    parts = ", ".join(f"{col}={val}" for col, val in zip(pk_cols, pk_vals))
    return f"({parts})"


def generate_diff_sql(db_conn: DBCConnection, table: str, db_source: str, db_target: str,
                      skip_localization: bool = True) -> str:
    """
    Generate SQL to transform db_target to match db_source for a single table.

    Args:
        db_conn: Database connection manager
        table: Table name
        db_source: Source database (what we want)
        db_target: Target database (what we're changing)
        skip_localization: If True, exclude localization columns

    Returns:
        SQL statements as string
    """
    conn = db_conn.get_connection(db_source)
    diff = get_table_diff(db_conn, table, db_source, db_target, skip_localization=skip_localization)
    pk_cols = diff["primary_key"]
    skipped_columns = diff.get("skipped_columns", set())

    sql_lines = []
    sql_lines.append(f"-- {table}: {len(diff['only_in_db1'])} inserts, {len(diff['modified'])} updates, {len(diff['only_in_db2'])} deletes")

    cursor = conn.cursor()
    cursor.execute(f"SHOW COLUMNS FROM `{table}`")
    all_columns = [row[0] for row in cursor.fetchall()]
    cursor.close()

    columns = [c for c in all_columns if c not in skipped_columns]

    # DELETEs
    if diff["only_in_db2"]:
        for pk_vals in diff["only_in_db2"]:
            where = _build_where_clause(pk_cols, pk_vals)
            sql_lines.append(f"DELETE FROM `{table}` WHERE {where};")

    # INSERTs (with DELETE first for idempotency)
    if diff["only_in_db1"]:
        cursor = conn.cursor(dictionary=True)
        if len(pk_cols) == 1:
            pk_list = ",".join(str(pk_vals[0]) for pk_vals in diff["only_in_db1"])
            cursor.execute(f"SELECT * FROM `{table}` WHERE `{pk_cols[0]}` IN ({pk_list})")
        else:
            # Composite key: build OR conditions
            or_parts = []
            for pk_vals in diff["only_in_db1"]:
                or_parts.append(f"({_build_where_clause(pk_cols, pk_vals)})")
            cursor.execute(f"SELECT * FROM `{table}` WHERE {' OR '.join(or_parts)}")

        for row in cursor.fetchall():
            pk_vals = tuple(row[col] for col in pk_cols)
            cols = ", ".join(f"`{c}`" for c in columns)
            vals = []
            for c in columns:
                v = row[c]
                if v is None:
                    vals.append("NULL")
                elif isinstance(v, (int, float)):
                    vals.append(str(v))
                else:
                    escaped = str(v).replace("\\", "\\\\").replace("'", "\\'")
                    vals.append(f"'{escaped}'")
            vals_str = ", ".join(vals)
            # DELETE first for idempotency, then INSERT
            where = _build_where_clause(pk_cols, pk_vals)
            sql_lines.append(f"DELETE FROM `{table}` WHERE {where};")
            sql_lines.append(f"INSERT INTO `{table}` ({cols}) VALUES ({vals_str});")

        cursor.close()

    # UPDATEs
    if diff["modified"]:
        for pk_vals, changes in diff["modified"]:
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
            where = _build_where_clause(pk_cols, pk_vals)
            sql_lines.append(f"UPDATE `{table}` SET {set_str} WHERE {where};")

    return "\n".join(sql_lines)


def generate_full_diff_sql(db_conn: DBCConnection, db_source: str, db_target: str,
                           skip_localization: bool = True) -> str:
    """Generate SQL for all differences between two databases.

    Args:
        db_conn: Database connection manager
        db_source: Source database
        db_target: Target database
        skip_localization: If True, exclude localization columns

    Returns:
        SQL statements as string
    """
    result = compare_databases(db_conn, db_source, db_target)

    if result["identical"]:
        return "-- No differences found"

    sql_parts = []
    sql_parts.append(f"-- DBC Diff: {db_source} vs {db_target}")
    sql_parts.append(f"-- Generated by zep dbc")
    if skip_localization:
        sql_parts.append(f"-- Localization columns excluded")
    sql_parts.append("")

    for table, count1, count2, cs1, cs2 in result["tables_with_differences"]:
        sql_parts.append(f"\n-- ============ {table} ============")
        sql_parts.append(generate_diff_sql(db_conn, table, db_source, db_target,
                                          skip_localization=skip_localization))

    return "\n".join(sql_parts)


def run_sql(sql: str, config: DBCConfig, database: str = None) -> Tuple[bool, str]:
    """
    Execute SQL against a DBC database using mysql CLI.

    Uses --defaults-extra-file to avoid password warning on command line.

    Args:
        sql: SQL to execute
        config: Database configuration
        database: Database name (defaults to live)

    Returns:
        Tuple of (success, output)
    """
    if database is None:
        database = config.live

    # Create temp file with credentials to avoid password warning
    with tempfile.NamedTemporaryFile(mode='w', suffix='.cnf', delete=False) as f:
        f.write(f"[client]\n")
        f.write(f"user={config.user}\n")
        f.write(f"password={config.password}\n")
        f.write(f"host={config.host}\n")
        f.write(f"port={config.port}\n")
        cnf_path = f.name

    try:
        mysql_cmd = [
            'mysql',
            f'--defaults-extra-file={cnf_path}',
            database
        ]

        result = subprocess.run(
            mysql_cmd,
            input=sql,
            capture_output=True,
            text=True
        )
    finally:
        # Clean up temp credentials file
        os.unlink(cnf_path)

    if result.returncode != 0:
        return False, result.stderr

    return True, result.stdout


def append_to_zpak_dbc(zpak_path: Path, table: str, sql: str,
                       feature_id: str) -> Path:
    """
    Append SQL to a zpak's dbc/[feature]_<table>.sql file.

    All DBC files REQUIRE a feature_id prefix:
        zpaks/my-zpak/dbc/[F-004]_spell.sql
        zpaks/my-zpak/dbc/[F-004]_skillline.sql

    This enables easy reorganization - moving [F-004] to another zpak
    is simply: mv '[F-004]_*.sql' ../other-zpak/dbc/

    Args:
        zpak_path: Path to zpak directory
        table: Table name
        sql: SQL to append
        feature_id: Feature ID (F-XXX or I-XXX) - REQUIRED

    Returns:
        Path to the modified SQL file

    Raises:
        ValueError: If feature_id is not provided
    """
    if not feature_id:
        raise ValueError("feature_id is required for DBC files")

    dbc_dir = zpak_path / 'dbc'
    dbc_dir.mkdir(parents=True, exist_ok=True)

    sql_file = dbc_dir / f"[{feature_id}]_{table}.sql"

    # Ensure SQL ends with semicolon
    sql_stripped = sql.rstrip()
    if not sql_stripped.endswith(';'):
        sql = sql_stripped + ';'

    # Append with newline separation
    with open(sql_file, 'a') as f:
        if sql_file.exists() and sql_file.stat().st_size > 0:
            f.write("\n")
        f.write(sql)
        if not sql.endswith('\n'):
            f.write('\n')

    return sql_file


def validate_task_id(task_id: str) -> bool:
    """
    Validate task ID format (F-XXX or I-XXX).

    Args:
        task_id: Task ID to validate

    Returns:
        True if valid format
    """
    return bool(re.match(r'^[FI]-\d+$', task_id))


# =============================================================================
# DBC File Tracking (hash-based change detection)
# =============================================================================

# Tracking table name (stored in live DBC database)
DBC_TRACKING_TABLE = "zep_dbc_updates"


def ensure_dbc_tracking_table(config: DBCConfig) -> bool:
    """Create DBC tracking table if it doesn't exist.

    Args:
        config: Database configuration

    Returns:
        True if successful
    """
    query = f"""
    CREATE TABLE IF NOT EXISTS `{DBC_TRACKING_TABLE}` (
        `name` VARCHAR(200) NOT NULL PRIMARY KEY,
        `hash` CHAR(40) NOT NULL,
        `zpak` VARCHAR(100),
        `applied_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        `execution_ms` INT UNSIGNED DEFAULT 0
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
    """
    success, _ = run_sql(query, config, config.live)
    return success


def calculate_file_hash(filepath: Path) -> str:
    """Calculate SHA1 hash of file contents.

    Args:
        filepath: Path to file

    Returns:
        SHA1 hex digest
    """
    sha1 = hashlib.sha1()
    with open(filepath, 'rb') as f:
        sha1.update(f.read())
    return sha1.hexdigest()


def get_stored_dbc_hash(config: DBCConfig, filename: str) -> Optional[str]:
    """Get stored hash for a DBC file from tracking table.

    Args:
        config: Database configuration
        filename: SQL filename (without path)

    Returns:
        Stored hash or None if not found
    """
    query = f"SELECT hash FROM `{DBC_TRACKING_TABLE}` WHERE name = '{filename}'"
    success, result = run_sql(query, config, config.live)
    if success and result:
        lines = result.strip().split('\n')
        if len(lines) > 1:  # Has header + data
            return lines[1].strip()
    return None


def get_all_stored_dbc_hashes(config: DBCConfig) -> Dict[str, Tuple[str, str]]:
    """Get all stored hashes from tracking table.

    Args:
        config: Database configuration

    Returns:
        Dict mapping filename -> (hash, zpak)
    """
    query = f"SELECT name, hash, zpak FROM `{DBC_TRACKING_TABLE}`"
    success, result = run_sql(query, config, config.live)

    hashes = {}
    if success and result:
        lines = result.strip().split('\n')
        for line in lines[1:]:  # Skip header
            parts = line.split('\t')
            if len(parts) >= 3:
                name, file_hash, zpak = parts[0], parts[1], parts[2]
                hashes[name] = (file_hash, zpak)
    return hashes


def update_dbc_tracking(config: DBCConfig, filename: str, file_hash: str,
                        zpak: str, execution_ms: int = 0) -> bool:
    """Update tracking table after successful execution.

    Args:
        config: Database configuration
        filename: SQL filename
        file_hash: SHA1 hash
        zpak: Zpak name
        execution_ms: Execution time in milliseconds

    Returns:
        True if successful
    """
    query = f"""
    REPLACE INTO `{DBC_TRACKING_TABLE}` (name, hash, zpak, applied_at, execution_ms)
    VALUES ('{filename}', '{file_hash}', '{zpak}', NOW(), {execution_ms})
    """
    success, _ = run_sql(query, config, config.live)
    return success


def clear_dbc_tracking(config: DBCConfig) -> bool:
    """Clear all entries from tracking table.

    Used during rebuild to reset tracking state.

    Args:
        config: Database configuration

    Returns:
        True if successful
    """
    query = f"TRUNCATE TABLE `{DBC_TRACKING_TABLE}`"
    success, _ = run_sql(query, config, config.live)
    return success


def parse_sql_affected_ids(sql_content: str, table_name: str) -> Set[Any]:
    """Parse SQL content to extract affected primary key IDs.

    Handles both single-column and composite key patterns:
        DELETE FROM table WHERE id = X
        DELETE FROM table WHERE `col1` = X AND `col2` = Y
        INSERT INTO table (...) VALUES (X, ...)
        UPDATE table SET ... WHERE id = X
        UPDATE table SET ... WHERE `col1` = X AND `col2` = Y

    Args:
        sql_content: SQL file content
        table_name: Table name (for matching)

    Returns:
        Set of primary key values. Single-key tables return ints,
        composite-key tables return tuples of ints.
    """
    affected_ids = set()
    table_pattern = rf'[`"]?{re.escape(table_name)}[`"]?'

    def _extract_key_from_where(where_str: str):
        """Extract key value(s) from WHERE clause. Returns int or tuple."""
        vals = re.findall(r'=\s*(\d+)', where_str)
        if len(vals) == 1:
            return int(vals[0])
        return tuple(int(v) for v in vals)

    # DELETE FROM table WHERE ...
    delete_pattern = rf'DELETE\s+FROM\s+{table_pattern}\s+WHERE\s+(.+?)\s*;'
    for match in re.finditer(delete_pattern, sql_content, re.IGNORECASE):
        key = _extract_key_from_where(match.group(1))
        if key:
            affected_ids.add(key)

    # INSERT INTO table (...) VALUES (X, ...) - ID is first value
    insert_pattern = rf'INSERT\s+INTO\s+{table_pattern}\s*\([^)]+\)\s*VALUES\s*\((\d+)'
    for match in re.finditer(insert_pattern, sql_content, re.IGNORECASE):
        affected_ids.add(int(match.group(1)))

    # UPDATE table SET ... WHERE ...
    update_pattern = rf'UPDATE\s+{table_pattern}\s+SET\s+.+?\s+WHERE\s+(.+?)\s*;'
    for match in re.finditer(update_pattern, sql_content, re.IGNORECASE | re.DOTALL):
        key = _extract_key_from_where(match.group(1))
        if key:
            affected_ids.add(key)

    return affected_ids


@dataclass
class SqlModification:
    """Represents a single SQL modification to a row."""
    row_id: str  # Row key: "123" for single pk, "1|2|3" for composite
    mod_type: str  # 'INSERT', 'UPDATE', 'DELETE'
    statement: str  # Normalized statement for comparison


def parse_sql_modifications(sql_content: str, table_name: str) -> Dict[str, List[SqlModification]]:
    """Parse SQL content to extract full modifications per row key.

    Used for redundancy detection - comparing if two files make the same change.
    Supports both single-column (WHERE `id` = X) and composite key
    (WHERE `col1` = X AND `col2` = Y) WHERE clauses.

    Args:
        sql_content: SQL file content
        table_name: Table name (for matching)

    Returns:
        Dict mapping row_key (str) -> list of SqlModification objects.
        For single keys: "123". For composite: "1|2|3".
    """
    modifications: Dict[str, List[SqlModification]] = {}
    table_pattern = rf'[`"]?{re.escape(table_name)}[`"]?'

    def add_mod(row_key: str, mod_type: str, statement: str):
        if row_key not in modifications:
            modifications[row_key] = []
        # Normalize: lowercase, collapse whitespace, strip
        normalized = ' '.join(statement.lower().split())
        modifications[row_key].append(SqlModification(row_key, mod_type, normalized))

    def _extract_where_key(where_clause: str) -> str:
        """Extract a canonical key string from a WHERE clause.

        Handles both 'WHERE `id` = 123' and 'WHERE `col1` = 1 AND `col2` = 2'.
        Returns values joined by '|' for composite keys.
        """
        # Match all `col` = val pairs in the WHERE clause
        pairs = re.findall(r'[`"]?\w+[`"]?\s*=\s*(\d+)', where_clause)
        return "|".join(pairs) if pairs else ""

    # DELETE FROM table WHERE ... (single or composite key)
    delete_pattern = rf'(DELETE\s+FROM\s+{table_pattern}\s+WHERE\s+(.+?)\s*;)'
    for match in re.finditer(delete_pattern, sql_content, re.IGNORECASE):
        row_key = _extract_where_key(match.group(2))
        if row_key:
            add_mod(row_key, 'DELETE', match.group(1))

    # INSERT INTO table (...) VALUES (...) - use first N values matching pk column count
    insert_pattern = rf'(INSERT\s+INTO\s+{table_pattern}\s*\([^)]+\)\s*VALUES\s*\((\d+)[^;]*;?)'
    for match in re.finditer(insert_pattern, sql_content, re.IGNORECASE):
        row_key = match.group(2)
        add_mod(row_key, 'INSERT', match.group(1))

    # UPDATE table SET ... WHERE ... (single or composite key)
    update_pattern = rf'(UPDATE\s+{table_pattern}\s+SET\s+.+?\s+WHERE\s+(.+?)\s*;)'
    for match in re.finditer(update_pattern, sql_content, re.IGNORECASE | re.DOTALL):
        row_key = _extract_where_key(match.group(2))
        if row_key:
            add_mod(row_key, 'UPDATE', match.group(1))

    return modifications


def compare_modifications(mods1: List[SqlModification], mods2: List[SqlModification]) -> bool:
    """Check if two lists of modifications are equivalent (redundant).

    Args:
        mods1: Modifications from first file
        mods2: Modifications from second file

    Returns:
        True if modifications are redundant (same changes)
    """
    if len(mods1) != len(mods2):
        return False

    # Sort by mod_type then statement for consistent comparison
    sorted1 = sorted(mods1, key=lambda m: (m.mod_type, m.statement))
    sorted2 = sorted(mods2, key=lambda m: (m.mod_type, m.statement))

    for m1, m2 in zip(sorted1, sorted2):
        if m1.mod_type != m2.mod_type or m1.statement != m2.statement:
            return False

    return True


def extract_tables_from_sql(sql_content: str) -> List[str]:
    """Extract actual table names from SQL content by parsing statements.

    Scans for DELETE FROM, INSERT INTO, UPDATE, and INSERT SET patterns
    to find all tables a SQL file modifies. This is more reliable than
    filename-based extraction for files with descriptive names or
    multi-table content.

    Args:
        sql_content: Raw SQL file content.

    Returns:
        Deduplicated list of lowercase table names, in order of first
        appearance.
    """
    tables = []
    seen = set()

    # Match: DELETE FROM `table`, INSERT INTO `table`, UPDATE `table`,
    #        INSERT INTO table SET (no backticks)
    pattern = re.compile(
        r'(?:DELETE\s+FROM|INSERT\s+INTO|UPDATE)\s+`?(\w+)`?',
        re.IGNORECASE,
    )

    for m in pattern.finditer(sql_content):
        tbl = m.group(1).lower()
        if tbl not in seen:
            seen.add(tbl)
            tables.append(tbl)

    return tables


def extract_table_from_filename(filename: str) -> Optional[str]:
    """Extract table name from DBC SQL filename.

    Handles patterns:
        spell.sql -> spell
        [F-004]_spell.sql -> spell
        [F-004,BASE]_spell.sql -> spell
        [I-099]_skillline.sql -> skillline

    NOTE: This is a best-guess based on naming convention. For accurate
    results (especially with descriptive filenames like
    [F-157]_lure_spells.sql), prefer extract_tables_from_sql() which
    parses the actual SQL content.

    Args:
        filename: SQL filename (without path)

    Returns:
        Table name or None
    """
    name = filename.replace('.sql', '')

    # Check for [F-XXX,BASE]_ or [F-XXX]_ or [I-XXX]_ prefix
    # Pattern: [F-004,BASE]_table or [F-004]_table
    bracket_match = re.match(r'\[[^\]]+\]_(.+)', name)
    if bracket_match:
        return bracket_match.group(1).lower()

    # Check for legacy F-XXX_ prefix (no brackets)
    if '_' in name:
        parts = name.split('_', 1)
        if parts[0].startswith(('F-', 'I-')) or parts[0].isdigit():
            return parts[1].lower()

    return name.lower()


# =============================================================================
# DBC Conflict Detection
# =============================================================================


def detect_dbc_conflicts(
    sources: List[Tuple],
    filter_table: str = None,
    progress_callback=None,
) -> Tuple[List[Tuple], List[Tuple]]:
    """Scan DBC sources for conflicting and redundant row edits.

    Phases:
      1. Scan all zpak SQL files, find rows modified by multiple zpaks.
      2. For each shared row, compare the actual SQL modifications to classify
         as REDUNDANT (identical changes) or CONFLICT (different changes).

    Args:
        sources: Output of collect_dbc_sources() —
                 list of (priority, zpak_name, dbc_path, sql_files).
        filter_table: Optional table name to restrict scanning to.
        progress_callback: Optional callable(checked, total) for progress display.

    Returns:
        (conflicts, redundants) where each is a list of:
        (table_name, row_key, [(zpak_name, priority, filename, [SqlModification, ...]), ...])
    """
    # Phase 1: Scan files and find rows modified by multiple zpaks
    table_modifications: Dict[str, Dict[str, List[Tuple]]] = {}
    parsed_mods_cache: Dict[Path, Dict[str, Dict]] = {}

    for priority, zpak_name, dbc_path, sql_files in sources:
        for sql_file in sql_files:
            try:
                sql_content = sql_file.read_text()
            except Exception:
                continue

            # Parse actual tables from SQL content rather than filename
            tables = extract_tables_from_sql(sql_content)
            if not tables:
                # Fallback to filename-based extraction
                fn_table = extract_table_from_filename(sql_file.name)
                tables = [fn_table] if fn_table else []

            file_cache = {}
            for table_name in tables:
                if filter_table and table_name != filter_table.lower():
                    continue

                try:
                    file_mods = parse_sql_modifications(sql_content, table_name)
                    file_cache[table_name] = file_mods
                    affected_ids = set(file_mods.keys())

                    if affected_ids:
                        if table_name not in table_modifications:
                            table_modifications[table_name] = {}

                        for row_id in affected_ids:
                            if row_id not in table_modifications[table_name]:
                                table_modifications[table_name][row_id] = []
                            table_modifications[table_name][row_id].append(
                                (zpak_name, priority, sql_file.name, sql_file)
                            )
                except Exception:
                    continue

            if file_cache:
                parsed_mods_cache[sql_file] = file_cache

    # Find rows with multiple modifiers
    potential_conflicts = {}
    for table_name, rows in table_modifications.items():
        conflicts = [(rid, mods) for rid, mods in rows.items() if len(mods) > 1]
        if conflicts:
            potential_conflicts[table_name] = conflicts

    total_potential = sum(len(c) for c in potential_conflicts.values())

    # Phase 2: Classify as redundant or conflicting
    all_conflicts = []
    all_redundants = []
    checked = 0

    for table_name in sorted(potential_conflicts.keys()):
        for row_id, modifiers in potential_conflicts[table_name]:
            checked += 1
            if progress_callback and checked % 100 == 0:
                progress_callback(checked, total_potential)

            is_redundant = True
            try:
                all_mods = []
                for zpak_name, priority, filename, filepath in modifiers:
                    cached = parsed_mods_cache.get(filepath, {}).get(table_name, {})
                    if row_id in cached:
                        all_mods.append((zpak_name, priority, filename, cached[row_id]))

                if len(all_mods) >= 2:
                    base_mods = all_mods[0][3]
                    for _, _, _, other_mods in all_mods[1:]:
                        if not compare_modifications(base_mods, other_mods):
                            is_redundant = False
                            break
            except Exception:
                is_redundant = False

            if is_redundant:
                all_redundants.append((table_name, row_id, all_mods))
            else:
                all_conflicts.append((table_name, row_id, all_mods))

    if progress_callback:
        progress_callback(total_potential, total_potential)

    return all_conflicts, all_redundants


# =============================================================================
# DBC Duplicate Cleaning
# =============================================================================


def remove_ids_from_dbc_file(file_path: Path, ids_to_remove: Set,
                              dry_run: bool = False) -> Tuple[int, int, int, bool]:
    """
    Remove DELETE+INSERT pairs for specified IDs from a DBC SQL file.

    Supports both single-column keys (WHERE `id` = X) and composite keys
    (WHERE `col1` = X AND `col2` = Y).

    If all SQL content is removed (only comments/blanks remain), the file
    is deleted to avoid ghost diffs.

    Args:
        file_path: Path to SQL file
        ids_to_remove: Set of IDs (int) or key tuples to remove
        dry_run: If True, don't modify the file

    Returns:
        Tuple of (lines_before, lines_after, removed_count, content_empty)
        content_empty is True if no SQL statements remain after removal.
    """
    with open(file_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    original_count = len(lines)
    new_lines = []
    removed_count = 0

    def _extract_where_values(where_str: str) -> tuple:
        """Extract values from a WHERE clause as a tuple of ints."""
        vals = re.findall(r'=\s*(\d+)', where_str)
        return tuple(int(v) for v in vals)

    # Normalize ids_to_remove to a set of tuples for uniform matching
    normalized_ids = set()
    for item in ids_to_remove:
        if isinstance(item, tuple):
            normalized_ids.add(item)
        else:
            normalized_ids.add((int(item),))

    i = 0
    while i < len(lines):
        line = lines[i]

        # Check for DELETE statement - match any WHERE clause pattern
        delete_match = re.match(r"^DELETE FROM `\w+` WHERE (.+);", line, re.IGNORECASE)

        if delete_match:
            row_key = _extract_where_values(delete_match.group(1))
            if row_key in normalized_ids:
                removed_count += 1
                i += 1
                # Check if next line is the corresponding INSERT
                if i < len(lines) and lines[i].upper().startswith('INSERT'):
                    i += 1
                continue

        # Check for UPDATE statement
        update_match = re.search(r"WHERE (.+);$", line, re.IGNORECASE)
        if update_match and line.upper().strip().startswith('UPDATE'):
            row_key = _extract_where_values(update_match.group(1))
            if row_key in normalized_ids:
                removed_count += 1
                i += 1
                continue

        new_lines.append(line)
        i += 1

    # Check if remaining lines have any actual SQL content
    # (not just comment headers and blank lines)
    has_sql_content = any(
        line.strip() and not line.strip().startswith('--')
        for line in new_lines
    )

    if not dry_run and removed_count > 0:
        if has_sql_content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.writelines(new_lines)
        else:
            file_path.unlink()

    return original_count, len(new_lines), removed_count, not has_sql_content
