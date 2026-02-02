"""
Zeppelin Package registry management.

The registry (registry.json) tracks all installed packages and their metadata.
"""

import json
from pathlib import Path
from typing import Dict, Any, Optional, List


class Registry:
    """Manages the zpak registry file."""

    def __init__(self, path: Path):
        """Initialize registry from file.

        Args:
            path: Path to registry.json
        """
        self.path = path
        self._data = self._load()

    def _load(self) -> Dict[str, Any]:
        """Load registry from disk."""
        if not self.path.exists():
            return {
                "version": "1.0.0",
                "azerothcore_modules_path": "../Zeppelin-Core/modules",
                "packages": {}
            }

        try:
            with open(self.path, 'r') as f:
                return json.load(f)
        except (json.JSONDecodeError, PermissionError):
            return {
                "version": "1.0.0",
                "azerothcore_modules_path": "../Zeppelin-Core/modules",
                "packages": {}
            }

    def save(self) -> bool:
        """Save registry to disk.

        Returns:
            True if successful, False otherwise
        """
        try:
            with open(self.path, 'w') as f:
                json.dump(self._data, f, indent=2)
                f.write('\n')
            return True
        except (PermissionError, OSError):
            return False

    @property
    def version(self) -> str:
        """Registry schema version."""
        return self._data.get('version', '1.0.0')

    @property
    def acore_modules_path(self) -> str:
        """Path to AzerothCore modules directory."""
        return self._data.get('azerothcore_modules_path', '../Zeppelin-Core/modules')

    @property
    def packages(self) -> Dict[str, Dict[str, Any]]:
        """All registered packages."""
        return self._data.get('packages', {})

    def get_package(self, name: str) -> Optional[Dict[str, Any]]:
        """Get package info by name.

        Args:
            name: Package name

        Returns:
            Package dict or None if not found
        """
        return self.packages.get(name)

    def register_package(self, name: str, location: str, path: str,
                         source: Optional[Dict[str, Any]] = None,
                         enabled: bool = True) -> None:
        """Register a package in the registry.

        Args:
            name: Package name
            location: 'internal' or 'external'
            path: Relative path to package directory
            source: Optional source information (for external packages)
            enabled: Whether package is enabled
        """
        self._data.setdefault('packages', {})[name] = {
            'location': location,
            'path': path,
            'enabled': enabled
        }

        if source:
            self._data['packages'][name]['source'] = source

    def unregister_package(self, name: str) -> bool:
        """Remove a package from the registry.

        Args:
            name: Package name

        Returns:
            True if removed, False if not found
        """
        if name in self._data.get('packages', {}):
            del self._data['packages'][name]
            return True
        return False

    def set_enabled(self, name: str, enabled: bool) -> bool:
        """Enable or disable a package.

        Args:
            name: Package name
            enabled: New enabled state

        Returns:
            True if updated, False if package not found
        """
        if name in self._data.get('packages', {}):
            self._data['packages'][name]['enabled'] = enabled
            return True
        return False

    def get_enabled_packages(self) -> List[str]:
        """Get list of enabled package names.

        Returns:
            List of enabled package names
        """
        return [
            name for name, info in self.packages.items()
            if info.get('enabled', True)
        ]

    def get_packages_by_location(self, location: str) -> Dict[str, Dict[str, Any]]:
        """Get packages filtered by location.

        Args:
            location: 'internal' or 'external'

        Returns:
            Dict of packages at that location
        """
        return {
            name: info for name, info in self.packages.items()
            if info.get('location') == location
        }

    # =========================================================================
    # Feature Index Methods (for DBC task tracking)
    # =========================================================================

    @property
    def feature_index(self) -> Dict[str, str]:
        """Feature ID to zpak name mapping."""
        return self._data.get('feature_index', {})

    def get_zpak_for_feature(self, feature_id: str) -> Optional[str]:
        """Get zpak name for a feature ID (F-XXX or I-XXX).

        Args:
            feature_id: Feature or issue ID

        Returns:
            Zpak name or None if not found
        """
        return self.feature_index.get(feature_id)

    def register_feature(self, feature_id: str, zpak_name: str) -> bool:
        """Register a feature ID to zpak mapping.

        Args:
            feature_id: Feature or issue ID (F-XXX or I-XXX)
            zpak_name: Name of the zpak

        Returns:
            True if registered, False if already exists with different zpak
        """
        existing = self.feature_index.get(feature_id)
        if existing and existing != zpak_name:
            return False

        self._data.setdefault('feature_index', {})[feature_id] = zpak_name
        return True

    def unregister_feature(self, feature_id: str) -> bool:
        """Remove a feature ID mapping.

        Args:
            feature_id: Feature or issue ID

        Returns:
            True if removed, False if not found
        """
        if feature_id in self._data.get('feature_index', {}):
            del self._data['feature_index'][feature_id]
            return True
        return False

    # =========================================================================
    # DBC Configuration Methods
    # =========================================================================

    @property
    def dbc_config(self) -> Dict[str, Any]:
        """DBC configuration section."""
        return self._data.get('dbc', {})

    def get_dbc_databases(self) -> Dict[str, str]:
        """Get DBC database names from registry.

        Returns:
            Dict with keys: original, scratch, live, expected
        """
        return self.dbc_config.get('databases', {
            'original': 'original_dbc',
            'scratch': 'scratch_dbc',
            'live': 'dbc',
            'expected': 'expected_dbc'
        })
