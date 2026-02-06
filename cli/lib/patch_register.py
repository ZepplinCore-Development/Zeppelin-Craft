"""
Patch register management for Zeppelin-Craft CLI.

Handles reading, writing, and updating the patch_register.json file
that tracks MPQ patch metadata for the launcher.

The register lives at the NGINX distribution path and is the source
of truth for the launcher's update detection.
"""

import hashlib
import json
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Optional

from lib.logging_config import get_logger

logger = get_logger('lib.patch_register')

# Default register path
DEFAULT_NGINX_PATH = Path('/workspace/project/nginx')
REGISTER_FILENAME = 'patch_register.json'


def load_register(nginx_path: Path = None) -> Dict[str, Any]:
    """Load the patch register from NGINX path.

    Args:
        nginx_path: Path to NGINX root directory. Defaults to DEFAULT_NGINX_PATH.

    Returns:
        Parsed register dict, or empty skeleton if file not found.
    """
    nginx_path = nginx_path or DEFAULT_NGINX_PATH
    register_path = nginx_path / REGISTER_FILENAME

    if not register_path.exists():
        logger.warning(f"Patch register not found at {register_path}, using skeleton")
        return _create_skeleton()

    try:
        with open(register_path, 'r') as f:
            data = json.load(f)
        logger.info(f"Loaded patch register: build #{data.get('server_metadata', {}).get('build_number', '?')}")
        return data
    except (json.JSONDecodeError, PermissionError) as e:
        logger.error(f"Failed to load patch register: {e}")
        return _create_skeleton()


def save_register(register: Dict[str, Any], nginx_path: Path = None) -> bool:
    """Save the patch register to NGINX path.

    Updates the last_updated timestamp before saving.

    Args:
        register: Register data to save.
        nginx_path: Path to NGINX root directory.

    Returns:
        True if saved successfully.
    """
    nginx_path = nginx_path or DEFAULT_NGINX_PATH
    register_path = nginx_path / REGISTER_FILENAME

    register['last_updated'] = _utc_timestamp()

    try:
        with open(register_path, 'w') as f:
            json.dump(register, f, indent=2)
            f.write('\n')
        logger.info(f"Saved patch register to {register_path}")
        return True
    except (PermissionError, OSError) as e:
        logger.error(f"Failed to save patch register: {e}")
        return False


def update_patch_entry(register: Dict[str, Any], patch_name: str,
                       mpq_path: Path) -> Dict[str, Any]:
    """Update metadata for a single patch after building.

    Increments version, recalculates checksum and size, updates timestamp.

    Args:
        register: The full register dict (modified in place).
        patch_name: Patch key (e.g. "PATCH-Z.MPQ").
        mpq_path: Path to the built MPQ file.

    Returns:
        The updated patch entry dict.
    """
    patches = register.setdefault('patches', {})
    entry = patches.get(patch_name, {})

    # Increment version
    entry['version'] = entry.get('version', 0) + 1

    # Update file metadata
    if mpq_path.exists():
        entry['size_mb'] = round(mpq_path.stat().st_size / (1024 * 1024), 1)
        entry['checksum'] = _calculate_checksum(mpq_path)
    else:
        logger.warning(f"MPQ file not found for metadata update: {mpq_path}")

    entry['last_modified'] = _utc_timestamp()

    patches[patch_name] = entry
    return entry


def bump_build_number(register: Dict[str, Any]) -> int:
    """Increment the server build number.

    Args:
        register: The full register dict (modified in place).

    Returns:
        The new build number.
    """
    metadata = register.setdefault('server_metadata', {})
    metadata['build_number'] = metadata.get('build_number', 0) + 1
    metadata['last_build_timestamp'] = _utc_timestamp()
    return metadata['build_number']


def bump_dbc_version(register: Dict[str, Any]) -> int:
    """Increment the DBC version (only for PATCH-Z builds).

    Args:
        register: The full register dict (modified in place).

    Returns:
        The new DBC version.
    """
    metadata = register.setdefault('server_metadata', {})
    metadata['dbc_version'] = metadata.get('dbc_version', 0) + 1
    return metadata['dbc_version']


def get_patch_output_path(nginx_path: Path, patch_name: str,
                          register: Dict[str, Any]) -> Path:
    """Resolve the output path for a patch MPQ file.

    Uses the is_mandatory flag to determine mandatory/ vs optional/
    subdirectory under the NGINX path.

    Args:
        nginx_path: Path to NGINX root directory.
        patch_name: Patch key (e.g. "PATCH-Z.MPQ").
        register: The full register dict.

    Returns:
        Absolute path where the MPQ file should be placed.
    """
    entry = register.get('patches', {}).get(patch_name, {})

    if entry.get('is_mandatory', False):
        return nginx_path / 'mandatory' / patch_name
    else:
        return nginx_path / 'optional' / patch_name


def format_register_summary(register: Dict[str, Any], nginx_path: Path = None) -> str:
    """Format the register for display.

    Args:
        register: The full register dict.
        nginx_path: NGINX path for resolving file existence.

    Returns:
        Formatted string for terminal display.
    """
    nginx_path = nginx_path or DEFAULT_NGINX_PATH
    metadata = register.get('server_metadata', {})
    patches = register.get('patches', {})

    lines = []
    lines.append(f"Build #{metadata.get('build_number', '?')}  "
                 f"DBC v{metadata.get('dbc_version', '?')}  "
                 f"Updated: {register.get('last_updated', 'never')[:19]}")
    lines.append("")

    # Sort patches by name
    for name in sorted(patches.keys()):
        entry = patches[name]
        mpq_path = get_patch_output_path(nginx_path, name, register)
        exists = mpq_path.exists()

        # Format size
        size = entry.get('size_mb', 0)
        if size >= 1024:
            size_str = f"{size/1024:.1f} GB"
        elif size > 0:
            size_str = f"{size:.0f} MB"
        else:
            size_str = "-- MB"

        # Status indicator
        mandatory = "M" if entry.get('is_mandatory') else "O"
        source = entry.get('build_source', 'unknown')[:8]
        exists_mark = "+" if exists else "-"

        lines.append(f"  [{exists_mark}] {name:<16} v{entry.get('version', '?'):<4} "
                     f"{size_str:>8}  [{mandatory}] {source:<10} "
                     f"{entry.get('name', '')[:35]}")

    return '\n'.join(lines)


# --- Private helpers ---

def _utc_timestamp() -> str:
    """Return current UTC time as ISO 8601 string with Z suffix."""
    return datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%S.%fZ')


def _calculate_checksum(file_path: Path) -> str:
    """Calculate MD5 checksum of a file.

    Args:
        file_path: Path to the file.

    Returns:
        MD5 hex digest string.
    """
    md5 = hashlib.md5()
    with open(file_path, 'rb') as f:
        for chunk in iter(lambda: f.read(8192), b''):
            md5.update(chunk)
    return md5.hexdigest()


def _create_skeleton() -> Dict[str, Any]:
    """Create an empty patch register skeleton."""
    return {
        'format_version': '2.0',
        'last_updated': _utc_timestamp(),
        'server_metadata': {
            'build_number': 0,
            'last_build_timestamp': _utc_timestamp(),
            'dbc_version': 0,
            'patch_builder_version': '2.0.0'
        },
        'patches': {}
    }
