#!/usr/bin/env python3
"""
M2 Model Texture Reference Parser
Extracts BLP texture file paths referenced by M2 model files.
"""

import struct
from pathlib import Path
from typing import Set


class M2TextureParser:
    """Parser for M2 model files to extract texture references."""

    def __init__(self, m2_path: Path):
        self.m2_path = m2_path
        self.textures: Set[str] = set()

    def _validate_path(self, path: str) -> bool:
        """
        Validate that a texture path looks legitimate.

        Returns True if path is valid, False if corrupted/suspicious.
        """
        if not path or len(path) < 5:
            return False

        # Must contain .blp extension
        if '.blp' not in path.lower():
            return False

        # Should not start with path separator
        if path.startswith(('/', '\\')):
            return False

        # Path should be reasonable length (not truncated, not absurdly long)
        if len(path) > 512:
            return False

        # Valid WoW texture paths typically start with known prefixes
        path_lower = path.lower()
        valid_prefixes = ('world/', 'character/', 'creature/', 'item/', 'spells/',
                         'interface/', 'environments/', 'dungeons/', 'tileset/')

        # Check for clearly truncated paths that look like they should start with valid prefixes
        # Common truncation patterns:
        # "D/" or "LD/" instead of "WORLD/"
        # "S/" instead of "DUNGEONS/"
        # "ORLD/" instead of "WORLD/"
        # "EONS/" instead of "DUNGEONS/"
        parts = path.split('/')
        if len(parts) >= 2:
            first_part = parts[0].lower()

            # Reject if first part is suspiciously short (1-4 chars) and looks like truncation
            if len(first_part) <= 4:
                # These are common truncation fragments
                suspicious_prefixes = ('d', 'ld', 'orld', 's', 'eons', 'on', 'ons',
                                      'e', 'w', 'c', 'i', 'es', 'ter')
                if first_part in suspicious_prefixes:
                    return False

            # Reject if it doesn't start with a valid prefix and looks like it might be truncated
            # (has slashes, suggesting it's a path, but wrong prefix)
            if not any(path_lower.startswith(prefix) for prefix in valid_prefixes):
                # Allow some exceptions (like textures starting with specific folders)
                # but reject paths that are clearly truncated versions of standard paths
                if '/' in path and len(first_part) < 8:
                    # If it has environment/doodad/expansion keywords, it's probably truncated
                    path_parts_lower = [p.lower() for p in parts]
                    truncation_indicators = ('environment', 'doodad', 'expansion', 'generic',
                                            'passivedoodad', 'kalimdor', 'lordaeron')
                    if any(indicator in path_parts_lower for indicator in truncation_indicators):
                        return False

        return True

    def _fallback_string_search(self, data: bytes) -> Set[str]:
        """
        Fallback method: search for .blp strings in file data.
        Used when structural parsing fails or yields suspicious results.
        """
        textures = set()

        # Search for .blp string patterns (case insensitive)
        search_pos = 0
        while True:
            # Find next .blp (case insensitive)
            blp_pos = data.find(b'.blp', search_pos)
            if blp_pos == -1:
                blp_pos = data.find(b'.BLP', search_pos)
            if blp_pos == -1:
                break

            # Work backwards to find start of path
            # WoW paths are typically null-terminated or start after null byte
            start_pos = blp_pos
            while start_pos > 0:
                char = data[start_pos - 1]
                # Stop at null byte, non-printable, or obvious delimiter
                if char == 0 or char < 32 or char > 126:
                    break
                # Stop if we've gone back too far (512 chars max path)
                if blp_pos - start_pos > 512:
                    break
                start_pos -= 1

            # Extract potential path
            try:
                # Include the .blp extension (4 chars)
                end_pos = blp_pos + 4
                path_bytes = data[start_pos:end_pos]
                path = path_bytes.decode('utf-8', errors='ignore').strip()

                # Normalize and validate
                if path:
                    path = path.replace('\\', '/')
                    # Remove consecutive duplicate slashes
                    while '//' in path:
                        path = path.replace('//', '/')
                    path = path.strip('/')
                    if self._validate_path(path):
                        textures.add(path)
            except:
                pass

            # Continue search after this .blp
            search_pos = blp_pos + 4

        return textures

    def parse(self) -> Set[str]:
        """
        Parse M2 file and extract BLP texture paths.

        Uses structural parsing first, falls back to string search if needed.
        Validates all paths to filter out corrupted/truncated entries.

        M2 file structure (WotLK 3.3.5a):
        - Offset 80: Texture definition block
          - uint32: numTextures - number of textures
          - uint32: ofsTextures - offset to texture lookup table
        - Texture block (for each texture):
          - uint32: type (texture type - unused)
          - uint32: flags (texture flags - unused)
          - uint32: nameLen - filename length
          - uint32: nameOfs - offset to filename string

        Returns:
            Set of texture file paths
        """
        try:
            with open(self.m2_path, 'rb') as f:
                # Read entire file for offset-based access
                data = f.read()

            # Check minimum file size
            if len(data) < 88:
                return set()

            # Try structural parsing first
            structural_textures = set()

            # Read texture count and lookup table offset at position 80
            num_textures, ofs_textures = struct.unpack_from('<II', data, 80)

            # Validate header values
            if num_textures > 0 and num_textures < 1000 and ofs_textures < len(data) and ofs_textures >= 88:
                # Parse each texture block
                current_offset = ofs_textures

                for i in range(num_textures):
                    # Check bounds before reading
                    if current_offset + 16 > len(data):
                        break

                    # Read texture block
                    texture_type, flags, name_len, name_ofs = struct.unpack_from(
                        '<IIII', data, current_offset
                    )

                    # Validate name offset and length
                    if name_ofs > 0 and name_ofs < len(data) and name_len > 0 and name_len < 512:
                        # Ensure we don't read beyond file bounds
                        if name_ofs + name_len <= len(data):
                            try:
                                # Find null terminator
                                end_pos = data.find(b'\x00', name_ofs, name_ofs + name_len)
                                if end_pos == -1:
                                    end_pos = name_ofs + name_len

                                texture_path = data[name_ofs:end_pos].decode('utf-8', errors='ignore')

                                # Normalize and validate
                                if texture_path:
                                    normalized = texture_path.replace('\\', '/')
                                    # Remove consecutive duplicate slashes
                                    while '//' in normalized:
                                        normalized = normalized.replace('//', '/')
                                    normalized = normalized.strip('/')
                                    if self._validate_path(normalized):
                                        structural_textures.add(normalized)

                            except (UnicodeDecodeError, ValueError):
                                pass

                    # Move to next texture block (16 bytes per entry)
                    current_offset += 16

            # If structural parsing yielded valid results, use them
            if structural_textures:
                return structural_textures

            # Otherwise, fall back to string search
            # (handles unknown M2 versions or corrupted headers)
            # NOTE: Fallback search might find truncated paths from M2 files
            # that were improperly converted or have corrupted texture name chunks
            fallback_textures = self._fallback_string_search(data)

            # If fallback also found nothing, return empty set
            return fallback_textures

        except Exception as e:
            # Complete failure - return empty set
            return set()


def parse_m2_textures(m2_path: Path) -> Set[str]:
    """
    Parse a single M2 file and extract texture references.

    Args:
        m2_path: Path to M2 model file

    Returns:
        Set of BLP texture paths
    """
    parser = M2TextureParser(m2_path)
    return parser.parse()


def parse_m2_batch_textures(m2_files: Set[str], base_dir: Path) -> Set[str]:
    """
    Parse multiple M2 files and extract all texture references.

    Args:
        m2_files: Set of M2 file paths (relative)
        base_dir: Base directory to resolve paths

    Returns:
        Set of all BLP texture paths
    """
    all_textures = set()

    for m2_file in m2_files:
        # Try to find the M2 file
        m2_path = base_dir / m2_file.replace('/', '\\')

        if not m2_path.exists():
            # Try with forward slashes
            m2_path = base_dir / m2_file

        if m2_path.exists():
            textures = parse_m2_textures(m2_path)
            all_textures.update(textures)

    return all_textures
