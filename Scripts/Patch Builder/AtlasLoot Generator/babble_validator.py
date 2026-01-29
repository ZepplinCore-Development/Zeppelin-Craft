"""
BabbleBoss Validator Module
Validates boss names against the LibBabble-Boss-3.0 library to prevent
nil concatenation errors in generated Lua code.
"""

import os
import re
from typing import Set, List, Tuple


class BabbleValidator:
    """Validates boss names against the BabbleBoss library."""

    def __init__(self, library_path: str = None):
        """
        Initialize validator with path to LibBabble-Boss-3.0.lua.

        Args:
            library_path: Path to the library file. If None, uses default location.
        """
        self.library_path = library_path
        self.valid_names: Set[str] = set()
        self._loaded = False

    def load(self) -> bool:
        """
        Load and parse the BabbleBoss library.

        Returns:
            True if loaded successfully, False otherwise.
        """
        if not self.library_path or not os.path.exists(self.library_path):
            print(f"[WARN] BabbleBoss library not found: {self.library_path}")
            return False

        try:
            with open(self.library_path, 'r', encoding='utf-8') as f:
                content = f.read()

            # Match both formats:
            # Simple: Name = "Name"
            # Bracketed: ["Name with spaces"] = "Name with spaces"
            pattern_simple = r'^\s*(\w[^=\[\]]+?)\s*='
            pattern_bracketed = r'^\s*\["([^"]+)"\]\s*='

            for line in content.split('\n'):
                # Skip comments
                if line.strip().startswith('--'):
                    continue

                # Try bracketed format first (more specific)
                match = re.match(pattern_bracketed, line)
                if match:
                    self.valid_names.add(match.group(1))
                    continue

                # Try simple format
                match = re.match(pattern_simple, line)
                if match:
                    name = match.group(1).strip()
                    if name:
                        self.valid_names.add(name)

            self._loaded = True
            print(f"[OK] BabbleBoss validator loaded: {len(self.valid_names)} valid names")
            return True

        except Exception as e:
            print(f"[ERROR] Failed to load BabbleBoss library: {e}")
            return False

    def is_valid(self, name: str) -> bool:
        """
        Check if a boss name exists in the BabbleBoss library.

        Args:
            name: Boss name to validate.

        Returns:
            True if name exists in library, False otherwise.
        """
        if not self._loaded:
            # If library not loaded, assume all names are valid (fail open)
            return True
        return name in self.valid_names

    def validate_names(self, names: List[str]) -> Tuple[List[str], List[str]]:
        """
        Validate a list of boss names.

        Args:
            names: List of boss names to validate.

        Returns:
            Tuple of (valid_names, invalid_names)
        """
        valid = []
        invalid = []
        for name in names:
            if self.is_valid(name):
                valid.append(name)
            else:
                invalid.append(name)
        return valid, invalid

    def get_missing_names(self, names: List[str]) -> List[str]:
        """
        Get list of names that are not in the BabbleBoss library.

        Args:
            names: List of boss names to check.

        Returns:
            List of names not found in library.
        """
        if not self._loaded:
            return []
        return [name for name in names if name not in self.valid_names]


# Global validator instance (lazy-loaded)
_validator: BabbleValidator = None


def get_validator(library_path: str = None) -> BabbleValidator:
    """
    Get the global BabbleValidator instance.

    Args:
        library_path: Path to library (only used on first call).

    Returns:
        BabbleValidator instance.
    """
    global _validator
    if _validator is None:
        _validator = BabbleValidator(library_path)
        _validator.load()
    return _validator


def validate_boss_name(name: str, library_path: str = None) -> bool:
    """
    Convenience function to validate a single boss name.

    Args:
        name: Boss name to validate.
        library_path: Path to library (only used on first call).

    Returns:
        True if name is valid, False otherwise.
    """
    return get_validator(library_path).is_valid(name)
