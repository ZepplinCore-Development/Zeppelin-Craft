"""
Centralized environment configuration for Zeppelin-Craft CLI.

Loads path variables from cli/.env at import time.
All paths are required — missing or invalid paths crash immediately.
"""

import os
import sys
from pathlib import Path

from dotenv import load_dotenv

# Load .env from cli directory
_cli_dir = Path(__file__).parent.parent
_env_file = _cli_dir / '.env'
if not _env_file.exists():
    print(f"FATAL: .env file not found at {_env_file}", file=sys.stderr)
    print("Copy .env.example to .env and configure your paths.", file=sys.stderr)
    sys.exit(1)

load_dotenv(_env_file)


def _require_path(var_name: str, must_exist: bool = True) -> Path:
    """Read a required path variable from environment.

    Crashes immediately if the variable is missing or the path doesn't exist.
    """
    value = os.environ.get(var_name)
    if not value:
        print(f"FATAL: {var_name} not set in {_env_file}", file=sys.stderr)
        sys.exit(1)
    path = Path(value)
    if must_exist and not path.exists():
        print(f"FATAL: {var_name}={value} — path does not exist", file=sys.stderr)
        sys.exit(1)
    return path


# Tool binaries
MPQCLI_PATH = _require_path('MPQCLI_PATH')
DBCTOOL_PATH = _require_path('DBCTOOL_PATH')

# Server paths
NGINX_PATH = _require_path('NGINX_PATH')
SERVER_DBC_PATH = _require_path('SERVER_DBC_PATH')

# Build paths
DBC_EXPORT_PATH = _require_path('DBC_EXPORT_PATH')

# Resource Parser
ASSET_LIBRARY_PATH = _require_path('ASSET_LIBRARY_PATH')
