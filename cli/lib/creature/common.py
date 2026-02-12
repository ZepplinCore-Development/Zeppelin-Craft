"""
Shared creature scaling utilities.

Database connection, SQL generation, and data path helpers.
"""

import os
import random
from pathlib import Path
from typing import List, Optional

import pymysql
from dotenv import load_dotenv

# Load CLI .env
_cli_dir = Path(__file__).parent.parent.parent  # cli/lib/creature -> cli/
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)

# Data directory (alongside this module)
DATA_DIR = Path(__file__).parent / 'data'

# Database config from CLI .env
DB_HOST = os.getenv('DB_HOST', '192.168.0.55')
DB_PORT = int(os.getenv('DB_PORT', '3306'))
DB_USER = os.getenv('DB_USER', 'acore')
DB_PASS = os.getenv('DB_PASS', 'acore')


def get_db_connection():
    """Get a pymysql connection to acore_world."""
    return pymysql.connect(
        host=DB_HOST,
        port=DB_PORT,
        user=DB_USER,
        passwd=DB_PASS,
        db='acore_world'
    )


def write_sql_file(output_path: Path, header: str, queries: List[str]):
    """Write generated SQL queries to a file with a header comment."""
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write("-- SQL queries generated automatically\n")
        f.write(f"-- Created by {header}\n\n")
        for query in queries:
            f.write(query + "\n")


def seed_random(seed: Optional[int]):
    """Seed the random number generator if a seed is provided."""
    if seed is not None:
        random.seed(seed)
