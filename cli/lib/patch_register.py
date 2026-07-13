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
from typing import Any, Dict, List, Optional, Tuple

from lib.env import NGINX_PATH as DEFAULT_NGINX_PATH
from lib.logging_config import get_logger

logger = get_logger('lib.patch_register')

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
                       mpq_path: Path,
                       zpak_name: Optional[str] = None,
                       description: Optional[str] = None) -> Dict[str, Any]:
    """Update metadata for a single patch after building.

    Increments version, recalculates checksum and size, updates timestamp.

    Args:
        register: The full register dict (modified in place).
        patch_name: Patch key (e.g. "PATCH-Z.MPQ").
        mpq_path: Path to the built MPQ file.
        zpak_name: Display name for the patch (keeps existing if not provided).
        description: Patch description (keeps existing if not provided).

    Returns:
        The updated patch entry dict.
    """
    patches = register.setdefault('patches', {})
    entry = patches.get(patch_name, {})

    if zpak_name:
        entry['name'] = zpak_name
    if description:
        entry['description'] = description

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

    All MPQ patches live under the MPQ/ subdirectory.
    Wow.exe lives under the EXE/ subdirectory.

    Args:
        nginx_path: Path to NGINX root directory.
        patch_name: Patch key (e.g. "PATCH-Z.MPQ", "Wow.exe").
        register: The full register dict.

    Returns:
        Absolute path where the file should be placed.
    """
    if patch_name.lower().endswith('.exe'):
        return nginx_path / 'EXE' / patch_name
    return nginx_path / 'MPQ' / patch_name


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
    lines.append(f"  Build #{metadata.get('build_number', '?')}  "
                 f"DBC v{metadata.get('dbc_version', '?')}  "
                 f"Updated: {register.get('last_updated', 'never')[:19]}")
    lines.append("")

    # Header
    lines.append(f"  {'Patch':<10} {'Name':<24} {'Mandatory':<11} {'Size':<10} {'Source':<16} {'Status'}")
    lines.append(f"  {'─' * 10} {'─' * 24} {'─' * 11} {'─' * 10} {'─' * 16} {'─' * 12}")

    # Sort: numeric first, then alpha
    sorted_names = sorted(patches.keys(),
                          key=lambda n: (not n.replace('PATCH-', '').replace('.MPQ', '').isdigit(),
                                         n.replace('PATCH-', '').replace('.MPQ', '')))

    for patch_key in sorted_names:
        entry = patches[patch_key]
        letter = patch_key.replace('PATCH-', '').replace('.MPQ', '')
        mpq_path = get_patch_output_path(nginx_path, patch_key, register)
        exists = mpq_path.exists()

        name = entry.get('name', '—')
        mandatory = "yes" if entry.get('is_mandatory') else "no"
        source = entry.get('build_source', '—')

        size = entry.get('size_mb', 0)
        size_str = f"{size:.0f} MB" if size else "—"

        if exists:
            status = "ready"
        else:
            status = "missing"

        lines.append(f"  {'PATCH-' + letter:<10} {name:<24} {mandatory:<11} {size_str:<10} {source:<16} {status}")

    # Summary
    mandatory_count = sum(1 for e in patches.values() if e.get('is_mandatory'))
    optional_count = len(patches) - mandatory_count
    lines.append("")
    lines.append(f"  {len(patches)} patches ({mandatory_count} mandatory, {optional_count} optional)")

    return '\n'.join(lines)


def regenerate_register(craft_root: Path, nginx_path: Path = None,
                        dry_run: bool = False) -> Dict[str, Any]:
    """Regenerate the patch register from zpak manifests.

    Scans all zpaks with client_patch assignments and rebuilds the register
    entries from their manifests + launcher metadata. Preserves version counters
    and file metadata from existing entries. Removes orphan entries and deletes
    orphan MPQ files.

    Args:
        craft_root: Path to Zeppelin-Craft root.
        nginx_path: Path to NGINX root directory.
        dry_run: If True, report changes without modifying files.

    Returns:
        Dict with keys: register, synced, orphans, deleted_files.
    """
    from lib.patch_builder import discover_patches

    nginx_path = nginx_path or DEFAULT_NGINX_PATH
    register = load_register(nginx_path)
    old_patches = register.get('patches', {})

    # Discover all zpaks with client_patch assignments
    patch_groups = discover_patches(craft_root)

    # Build new patches dict from zpak manifests
    new_patches = {}
    synced = []

    for letter, zpaks in sorted(patch_groups.items()):
        patch_key = f"PATCH-{letter}.MPQ"

        # Combine names/descriptions from all zpaks sharing this patch letter
        if len(zpaks) == 1:
            combined_name = (zpaks[0]['manifest'].get('patch_display_name')
                             or zpaks[0]['manifest'].get('name', zpaks[0]['name']))
            combined_desc = zpaks[0]['manifest'].get('description', '')
        else:
            # Multiple zpaks: use patch_display_name (highest priority first),
            # then launcher.patch_name, then fall back to patch key.
            combined_name = None
            for z in zpaks:
                combined_name = z['manifest'].get('patch_display_name')
                if combined_name:
                    break
            if not combined_name:
                for z in zpaks:
                    pn = z['manifest'].get('launcher', {}).get('patch_name')
                    if pn:
                        combined_name = pn
                        break
            if not combined_name:
                combined_name = patch_key.replace('.MPQ', '')
            # Description: one line per zpak — "name - description"
            desc_lines = []
            for z in zpaks:
                zname = z['manifest'].get('name', z['name'])
                zdesc = z['manifest'].get('description', '')
                desc_lines.append(f"{zname} - {zdesc}")
            combined_desc = '\n'.join(desc_lines)

        # Use first zpak with a launcher block for launcher metadata
        launcher = {}
        for z in zpaks:
            launcher = z['manifest'].get('launcher', {})
            if launcher:
                break

        # Determine build_source from first zpak's build config
        build = zpaks[0]['manifest'].get('build', {})
        if build.get('preprocessor'):
            build_source = 'resource_parser'
        elif letter == 'Z':
            build_source = 'generated'
        else:
            build_source = 'static'

        # Preserve existing version and file metadata
        old_entry = old_patches.get(patch_key, {})

        entry = {
            'name': combined_name,
            'description': combined_desc,
            'is_mandatory': launcher.get('mandatory', False),
            'is_enabled_by_default': launcher.get('enabled_by_default', False),
            'auto_update': launcher.get('auto_update', False),
            'requires': launcher.get('requires', []),
            'required_for': [],  # computed below
            'build_source': build_source,
            'version': old_entry.get('version', 0),
            'size_mb': old_entry.get('size_mb', 0),
            'checksum': old_entry.get('checksum', ''),
            'last_modified': old_entry.get('last_modified', ''),
        }

        # Update file metadata from MPQ on disk if it exists
        mpq_path = _resolve_mpq_path(nginx_path, patch_key, entry.get('is_mandatory', False))
        if mpq_path.exists():
            current_size = round(mpq_path.stat().st_size / (1024 * 1024), 1)
            entry['size_mb'] = current_size
            entry['last_modified'] = datetime.fromtimestamp(
                mpq_path.stat().st_mtime, tz=timezone.utc
            ).strftime('%Y-%m-%dT%H:%M:%S.%fZ')

            # Only recompute checksum if size changed or missing
            old_size = old_entry.get('size_mb', 0)
            if not old_entry.get('checksum') or current_size != old_size:
                entry['checksum'] = _calculate_checksum(mpq_path)

        new_patches[patch_key] = entry
        synced.append(patch_key)

    # Compute required_for (inverse of requires)
    for patch_key, entry in new_patches.items():
        for req in entry.get('requires', []):
            if req in new_patches:
                new_patches[req].setdefault('required_for', [])
                if patch_key not in new_patches[req]['required_for']:
                    new_patches[req]['required_for'].append(patch_key)

    # Preserve non-zpak entries. Only PATCH-*.MPQ keys are rebuilt from zpak manifests; every other key
    # is a special/manual entry not owned by a zpak (Wow.exe from the exe patcher, the WarcraftXL
    # framework bundle + its wxl-assets marker, etc.). Keep them all so a regenerate never drops them.
    for key, entry in old_patches.items():
        if not key.upper().startswith('PATCH-') and key not in new_patches:
            new_patches[key] = entry
            synced.append(key)

    # Identify orphans: old entries with no matching zpak (only PATCH-*.MPQ keys)
    orphan_keys = [k for k in old_patches if k not in new_patches
                   and k.upper().startswith('PATCH-')]
    deleted_files = []

    for orphan_key in orphan_keys:
        orphan_entry = old_patches[orphan_key]
        is_mandatory = orphan_entry.get('is_mandatory', False)
        mpq_path = _resolve_mpq_path(nginx_path, orphan_key, is_mandatory)

        if mpq_path.exists():
            if dry_run:
                deleted_files.append(str(mpq_path))
            else:
                try:
                    mpq_path.unlink()
                    deleted_files.append(str(mpq_path))
                    logger.info(f"Deleted orphan MPQ: {mpq_path}")
                except OSError as e:
                    logger.error(f"Failed to delete orphan MPQ {mpq_path}: {e}")

    # Update register
    if not dry_run:
        register['patches'] = new_patches
        save_register(register, nginx_path)

    return {
        'register': {**register, 'patches': new_patches},
        'synced': synced,
        'orphans': orphan_keys,
        'deleted_files': deleted_files,
    }


def update_exe_entry(register: Dict[str, Any], exe_path: Path) -> Dict[str, Any]:
    """Update the Wow.exe entry in the patch register.

    Exe entries use the key 'Wow.exe' and are always mandatory.
    They are managed by the exe patcher, not zpak manifests, so
    regenerate_register() preserves them automatically.

    Args:
        register: The full register dict (modified in place).
        exe_path: Path to the deployed Wow.exe file.

    Returns:
        The updated entry dict.
    """
    patches = register.setdefault('patches', {})
    entry = patches.get('Wow.exe', {})

    entry['name'] = 'Patched WoW Client'
    entry['description'] = 'Zeppelin-patched WoW.exe with custom binary modifications'
    entry['is_mandatory'] = True
    entry['is_enabled_by_default'] = True
    entry['auto_update'] = True
    entry['requires'] = []
    entry['required_for'] = []
    entry['build_source'] = 'exe_patcher'
    entry['version'] = entry.get('version', 0) + 1

    if exe_path.exists():
        entry['size_mb'] = round(exe_path.stat().st_size / (1024 * 1024), 1)
        entry['checksum'] = _calculate_checksum(exe_path)

    entry['last_modified'] = _utc_timestamp()

    patches['Wow.exe'] = entry
    logger.info(f"Updated Wow.exe register entry: v{entry['version']}, "
                f"{entry['size_mb']} MB, checksum={entry['checksum'][:12]}...")
    return entry


def _resolve_mpq_path(nginx_path: Path, patch_key: str, is_mandatory: bool) -> Path:
    """Resolve the expected path for a patch MPQ file."""
    return nginx_path / 'MPQ' / patch_key


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
