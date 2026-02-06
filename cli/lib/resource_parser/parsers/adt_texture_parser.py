#!/usr/bin/env python3
"""
ADT Terrain Texture Parser
Extracts terrain layer textures from WoW ADT files (MTEX chunks).

ADT files use MTEX chunks to define terrain textures used in texture layers.
These are different from M2/WMO doodads - these are the actual ground textures.
"""

import struct
from pathlib import Path
from typing import Set
from .chunk_utils import read_chunk_header


class ADTTextureParser:
    """Parser for WoW ADT files to extract terrain texture references."""

    # Known ADT chunk types
    KNOWN_CHUNKS = ['MVER', 'MTEX', 'MMDX', 'MDDF', 'MHDR', 'MCIN', 'MWMO', 'MWID', 'MODF', 'MCNK']

    def __init__(self, adt_path: Path):
        self.adt_path = adt_path
        self.data = None
        self.textures: Set[str] = set()

    def parse_mtex_chunk(self, offset: int, size: int) -> Set[str]:
        """
        Parse MTEX chunk (terrain texture filenames).

        MTEX contains null-terminated strings of BLP texture paths.
        These are the textures used for terrain layers.

        Args:
            offset: Start offset of MTEX chunk data (after header)
            size: Size of MTEX chunk data

        Returns:
            Set of BLP texture paths
        """
        textures = set()
        chunk_data = self.data[offset:offset+size]

        # Split by null bytes to get individual texture paths
        texture_strings = chunk_data.split(b'\x00')

        for texture_bytes in texture_strings:
            if texture_bytes:
                try:
                    texture_path = texture_bytes.decode('ascii', errors='ignore').strip()
                    # Accept BLP textures
                    if texture_path and texture_path.lower().endswith('.blp'):
                        # Normalize path separators and remove duplicate slashes
                        texture_path = texture_path.replace('\\', '/')
                        # Remove consecutive duplicate slashes (// -> /)
                        while '//' in texture_path:
                            texture_path = texture_path.replace('//', '/')
                        texture_path = texture_path.strip('/')
                        textures.add(texture_path)
                except:
                    pass

        return textures

    def parse(self) -> Set[str]:
        """
        Parse the ADT file and extract all terrain texture references.

        Returns:
            Set of BLP texture paths
        """
        if not self.adt_path.exists():
            print(f"Error: File not found: {self.adt_path}")
            return set()

        # Read entire file
        with open(self.adt_path, 'rb') as f:
            self.data = f.read()

        if len(self.data) < 8:
            return set()

        # Scan entire file for MTEX chunks
        offset = 0
        while offset < len(self.data) - 8:
            magic, size = read_chunk_header(self.data, offset, self.KNOWN_CHUNKS)

            if magic is None:
                # Invalid chunk header, scan forward
                offset += 1
                continue

            if magic == 'MTEX' and size > 0 and size < 1000000:
                # Found terrain texture chunk
                textures = self.parse_mtex_chunk(offset + 8, size)
                if textures:
                    self.textures.update(textures)
                offset += 8 + size
            elif size > 0 and size < 10000000:
                # Skip to next chunk
                offset += 8 + size
            else:
                # Invalid size, scan forward byte by byte
                offset += 1

        return self.textures


def parse_adt_textures(adt_path: Path) -> Set[str]:
    """
    Parse a single ADT file and extract terrain texture references.

    Args:
        adt_path: Path to ADT file

    Returns:
        Set of BLP texture paths
    """
    parser = ADTTextureParser(adt_path)
    return parser.parse()


def parse_adt_directory_textures(adt_dir: Path, pattern: str = "*.adt") -> Set[str]:
    """
    Parse all ADT files in a directory and extract unique terrain textures.

    Args:
        adt_dir: Directory containing ADT files
        pattern: File pattern to match (default: *.adt)

    Returns:
        Set of unique BLP texture paths
    """
    all_textures = set()
    adt_files = list(adt_dir.rglob(pattern))

    if not adt_files:
        print(f"No ADT files found in {adt_dir} with pattern '{pattern}'")
        return all_textures

    print(f"Found {len(adt_files)} ADT files to parse for textures...")

    for adt_file in adt_files:
        print(f"  Parsing: {adt_file.name}")
        parser = ADTTextureParser(adt_file)
        textures = parser.parse()
        all_textures.update(textures)

        if textures:
            print(f"    -> Found {len(textures)} terrain textures")

    return all_textures


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python3 adt_texture_parser.py <adt_directory> [output_file]")
        print("\nExample:")
        print("  python3 adt_texture_parser.py /path/to/adt/files textures.txt")
        sys.exit(1)

    adt_dir = Path(sys.argv[1])
    output_file = Path(sys.argv[2]) if len(sys.argv) > 2 else None

    if not adt_dir.exists():
        print(f"Error: Directory not found: {adt_dir}")
        sys.exit(1)

    # Parse all ADT files
    all_textures = parse_adt_directory_textures(adt_dir)

    # Sort for readability
    sorted_textures = sorted(all_textures, key=lambda x: x.lower())

    # Print results
    print(f"\n{'='*80}")
    print(f"TOTAL UNIQUE TERRAIN TEXTURES FOUND: {len(sorted_textures)}")
    print(f"{'='*80}\n")

    for texture in sorted_textures:
        print(texture)

    # Save to file if requested
    if output_file:
        with open(output_file, 'w') as f:
            f.write(f"# Terrain Textures from ADT Files\n")
            f.write(f"# Source: {adt_dir}\n")
            f.write(f"# Total: {len(sorted_textures)} unique textures\n\n")
            for texture in sorted_textures:
                f.write(f"{texture}\n")

        print(f"\nTexture list saved to: {output_file}")
