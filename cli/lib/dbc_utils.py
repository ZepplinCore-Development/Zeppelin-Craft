"""
DBC database utilities for Zeppelin-Craft CLI.

Four-database architecture for safe, traceable DBC editing:
  - original_dbc: Pristine 3.3.5a stock (never modified)
  - scratch_dbc: Temp workspace during imports/rebuilds
  - dbc: Live database (Spell Editor + dbc.py work here)
  - expected_dbc: Safety baseline (catches uncommitted changes)
"""

import os
import re
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple, Any

try:
    import mysql.connector
except ImportError:
    mysql.connector = None


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

        # Fall back to environment variables
        return cls(
            host=env_vars.get('DB_HOST', os.getenv('DB_HOST', '192.168.0.55')),
            port=int(env_vars.get('DB_PORT', os.getenv('DB_PORT', '3306'))),
            user=env_vars.get('DB_USER', os.getenv('DB_USER', 'spell-editor')),
            password=env_vars.get('DB_PASSWORD', os.getenv('DB_PASSWORD', '')),
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


def get_localization_columns(columns: List[str]) -> Set[str]:
    """
    Identify localization columns to exclude from diffs.

    WoW 3.3.5a DBC files have localized strings using locale suffixes.
    We keep enus (English) and flags columns, exclude all other locales.

    Args:
        columns: List of column names

    Returns:
        Set of column names to exclude
    """
    NON_ENGLISH_LOCALES = {
        'kokr', 'frfr', 'dede', 'zhcn', 'zhtw',
        'eses', 'esmx', 'ruru', 'jajp', 'ptpt',
        'itit', 'ptbr', 'engb',
    }

    UNUSED_PATTERNS = ['unused_1', 'unused_2', 'unused_3', 'unused_4']

    localization_cols = set()

    for col in columns:
        col_lower = col.lower()

        for locale in NON_ENGLISH_LOCALES:
            if col_lower.endswith(f'_{locale}'):
                localization_cols.add(col)
                break

        for unused in UNUSED_PATTERNS:
            if col_lower.endswith(f'_{unused}'):
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


def get_primary_key(conn, table: str) -> str:
    """Get the primary key column for a table.

    Args:
        conn: MySQL connection
        table: Table name

    Returns:
        Primary key column name
    """
    cursor = conn.cursor()
    cursor.execute(f"SHOW KEYS FROM `{table}` WHERE Key_name = 'PRIMARY'")
    result = cursor.fetchone()
    cursor.close()

    if result:
        return result[4]  # Column_name is at index 4

    # Fallback: check for common ID column names
    cursor = conn.cursor()
    cursor.execute(f"SHOW COLUMNS FROM `{table}`")
    columns = [row[0] for row in cursor.fetchall()]
    cursor.close()

    for col in ["ID", "id", "Id", "entry", "Entry"]:
        if col in columns:
            return col

    return columns[0] if columns else "ID"


def compare_databases(db_conn: DBCConnection, db1_name: str, db2_name: str) -> Dict:
    """
    Compare two databases and return differences.

    Args:
        db_conn: Database connection manager
        db1_name: First database name
        db2_name: Second database name

    Returns:
        Dict with comparison results
    """
    conn1 = db_conn.get_connection(db1_name)
    conn2 = db_conn.get_connection(db2_name)

    tables1 = set(get_tables(conn1))
    tables2 = set(get_tables(conn2))

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


def get_table_diff(db_conn: DBCConnection, table: str, db1_name: str, db2_name: str,
                   primary_key: str = None, skip_localization: bool = True) -> Dict:
    """
    Get detailed row-level differences between two tables.

    Args:
        db_conn: Database connection manager
        table: Table name to compare
        db1_name: Source database name
        db2_name: Target database name
        primary_key: Optional primary key column
        skip_localization: If True, ignore localization columns

    Returns:
        Dict with row-level differences
    """
    conn1 = db_conn.get_connection(db1_name)
    conn2 = db_conn.get_connection(db2_name)

    if primary_key is None:
        primary_key = get_primary_key(conn1, table)

    cursor1 = conn1.cursor(dictionary=True)
    cursor2 = conn2.cursor(dictionary=True)

    cursor1.execute(f"SELECT * FROM `{table}` ORDER BY `{primary_key}`")
    rows1 = {row[primary_key]: row for row in cursor1.fetchall()}

    cursor2.execute(f"SELECT * FROM `{table}` ORDER BY `{primary_key}`")
    rows2 = {row[primary_key]: row for row in cursor2.fetchall()}

    cursor1.close()
    cursor2.close()

    pks1 = set(rows1.keys())
    pks2 = set(rows2.keys())

    only_in_db1 = sorted(pks1 - pks2)
    only_in_db2 = sorted(pks2 - pks1)

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
    pk = diff["primary_key"]
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
        for pk_val in diff["only_in_db2"]:
            sql_lines.append(f"DELETE FROM `{table}` WHERE `{pk}` = {pk_val};")

    # INSERTs (with DELETE first for idempotency)
    if diff["only_in_db1"]:
        cursor = conn.cursor(dictionary=True)
        pk_list = ",".join(str(pk_val) for pk_val in diff["only_in_db1"])
        cursor.execute(f"SELECT * FROM `{table}` WHERE `{pk}` IN ({pk_list})")

        for row in cursor.fetchall():
            pk_val = row[pk]
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
            sql_lines.append(f"DELETE FROM `{table}` WHERE `{pk}` = {pk_val};")
            sql_lines.append(f"INSERT INTO `{table}` ({cols}) VALUES ({vals_str});")

        cursor.close()

    # UPDATEs
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
                       feature_id: Optional[str] = None) -> Path:
    """
    Append SQL to a zpak's dbc/[feature]_<table>.sql file.

    If feature_id is provided, prefixes the filename with brackets:
        zpaks/my-zpak/dbc/[F-004]_spell.sql
        zpaks/my-zpak/dbc/[F-004]_skillline.sql

    If feature_id is None, uses table name only:
        zpaks/my-zpak/dbc/spell.sql

    This enables easy reorganization - moving [F-004] to another zpak
    is simply: mv '[F-004]_*.sql' ../other-zpak/dbc/

    Args:
        zpak_path: Path to zpak directory
        table: Table name
        sql: SQL to append
        feature_id: Optional feature ID (F-XXX or I-XXX)

    Returns:
        Path to the modified SQL file
    """
    dbc_dir = zpak_path / 'dbc'
    dbc_dir.mkdir(parents=True, exist_ok=True)

    if feature_id:
        sql_file = dbc_dir / f"[{feature_id}]_{table}.sql"
    else:
        sql_file = dbc_dir / f"{table}.sql"

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
