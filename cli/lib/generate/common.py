"""
Shared helpers for F-001 gathering loot generators.

Provides DB query execution, SQL line building, and the common
3-phase generation pattern used by all profession tool generators.
"""

import os
import subprocess
import tempfile
from pathlib import Path
from typing import Dict, List, Optional

from dotenv import load_dotenv

# Load DB credentials from cli/.env
_cli_dir = Path(__file__).parent.parent.parent
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)

DB_HOST = os.getenv('DB_HOST', '192.168.0.55')
DB_PORT = os.getenv('DB_PORT', '3306')
DB_USER = os.getenv('DB_USER', 'acore')
DB_PASS = os.getenv('DB_PASS', 'acore')
DB_NAME = 'acore_world'


def run_query(query: str) -> str:
    """Execute a MySQL query and return raw TSV output (no headers)."""
    fd, cnf_path = tempfile.mkstemp(suffix='.cnf')
    try:
        with os.fdopen(fd, 'w') as f:
            f.write("[client]\n")
            f.write(f"user={DB_USER}\n")
            f.write(f"password=\"{DB_PASS}\"\n")
            f.write(f"host={DB_HOST}\n")
            f.write(f"port={DB_PORT}\n")

        result = subprocess.run(
            ['mysql', f'--defaults-extra-file={cnf_path}', DB_NAME,
             '-e', query, '--batch', '--skip-column-names'],
            capture_output=True, text=True
        )
        if result.returncode != 0:
            raise RuntimeError(f"MySQL error: {result.stderr.strip()}")
        return result.stdout.strip()
    finally:
        os.unlink(cnf_path)


def parse_rows(output: str) -> List[List[str]]:
    """Parse TSV output into list of string rows."""
    if not output:
        return []
    return [line.split('\t') for line in output.split('\n') if line]


def query_rows(query: str) -> List[List[str]]:
    """Execute query and return parsed rows."""
    return parse_rows(run_query(query))


def sql_escape(text: str) -> str:
    """Escape single quotes for SQL strings."""
    return text.replace("'", "''")


def default_output_path(craft_root: Path, filename: str) -> Path:
    """Return the default zpak SQL output path for a generated file."""
    return craft_root / 'zpaks' / 'zep-professions' / 'sql' / filename
