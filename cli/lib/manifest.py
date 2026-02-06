"""
Zeppelin Package manifest handling.

Provides loading, validation, and manipulation of zpak.json files.
"""

import json
import re
from pathlib import Path
from typing import Optional, Tuple, Dict, Any, List, Set


def load_manifest(path: Path) -> Optional[Dict[str, Any]]:
    """Load and parse a zpak.json manifest file.

    Args:
        path: Path to zpak.json file

    Returns:
        Parsed manifest dict, or None if loading fails
    """
    try:
        with open(path, 'r') as f:
            return json.load(f)
    except (json.JSONDecodeError, FileNotFoundError, PermissionError) as e:
        return None


def save_manifest(path: Path, manifest: Dict[str, Any]) -> bool:
    """Save a manifest dict to zpak.json.

    Args:
        path: Path to zpak.json file
        manifest: Manifest dict to save

    Returns:
        True if successful, False otherwise
    """
    try:
        with open(path, 'w') as f:
            json.dump(manifest, f, indent=2)
            f.write('\n')
        return True
    except (PermissionError, OSError):
        return False


def validate_manifest(path: Path) -> Tuple[bool, str]:
    """Validate a zpak.json manifest file.

    Performs basic validation without requiring jsonschema library.

    Args:
        path: Path to zpak.json file

    Returns:
        Tuple of (is_valid, error_message)
    """
    manifest = load_manifest(path)
    if manifest is None:
        return False, "Could not load manifest file"

    # Required fields
    required = ['name', 'version', 'description', 'author', 'type', 'contents']
    for field in required:
        if field not in manifest:
            return False, f"Missing required field: {field}"

    # Validate name format
    name = manifest.get('name', '')
    import re
    if not re.match(r'^[a-z0-9-]+$', name):
        return False, f"Invalid name format: {name} (must be lowercase alphanumeric with hyphens)"

    # Validate version format
    version = manifest.get('version', '')
    if not re.match(r'^\d+\.\d+\.\d+$', version):
        return False, f"Invalid version format: {version} (must be semver X.Y.Z)"

    # Validate type
    valid_types = ['native', 'mpq', 'acore-extension', 'hybrid']
    pkg_type = manifest.get('type', '')
    if pkg_type not in valid_types:
        return False, f"Invalid type: {pkg_type} (must be one of {valid_types})"

    # Validate acore field for acore-extension type
    if pkg_type == 'acore-extension':
        acore = manifest.get('acore')
        if not acore:
            return False, "acore-extension type requires 'acore' field"
        if 'module' not in acore:
            return False, "acore field missing required 'module'"
        if 'source' not in acore:
            return False, "acore field missing required 'source'"

    # Validate feature_id format if present
    feature_id = manifest.get('feature_id')
    if feature_id and not re.match(r'^F-\d{3}$', feature_id):
        return False, f"Invalid feature_id format: {feature_id} (must be F-XXX)"

    # Validate priority is integer if present
    priority = manifest.get('priority')
    if priority is not None and not isinstance(priority, int):
        return False, f"Invalid priority: {priority} (must be integer)"

    return True, ""


def get_manifest_path(craft_root: Path, name: str) -> Optional[Path]:
    """Find the manifest path for a package by name.

    Searches both internal (zpaks/) and external (external/) directories.

    Args:
        craft_root: Path to Zeppelin-Craft root
        name: Package name

    Returns:
        Path to zpak.json, or None if not found
    """
    for base in [craft_root / 'zpaks', craft_root / 'external']:
        candidate = base / name / 'zpak.json'
        if candidate.exists():
            return candidate
    return None


# Feature ID pattern: F-001, I-002, etc. inside brackets
_FEATURE_ID_RE = re.compile(r'[FI]-\d{3}')


def extract_feature_ids(filename: str) -> Set[str]:
    """Extract feature/issue IDs from a filename.

    Handles patterns like:
      zz_[F-034]_cthun.sql           -> {'F-034'}
      zz_[F-061,F-064]_lfg.sql       -> {'F-061', 'F-064'}
      [BASE,F-044]_spell.sql         -> {'F-044'}
      [F-001]_spell.sql              -> {'F-001'}
      zz_riding_crops_[F-005].sql    -> {'F-005'}

    Args:
        filename: The filename (not full path) to extract from

    Returns:
        Set of feature IDs found, e.g. {'F-034', 'F-064'}
    """
    return set(_FEATURE_ID_RE.findall(filename))


def is_feature_disabled(filename: str, disabled_features: Set[str]) -> bool:
    """Check if a file should be skipped based on disabled features.

    A file is disabled only if ALL of its feature IDs are in the disabled set.
    Files with no feature IDs are never disabled.

    Args:
        filename: The filename to check
        disabled_features: Set of disabled feature IDs

    Returns:
        True if the file should be skipped
    """
    if not disabled_features:
        return False
    ids = extract_feature_ids(filename)
    if not ids:
        return False
    return ids.issubset(disabled_features)
