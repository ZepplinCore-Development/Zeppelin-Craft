#!/usr/bin/env python3
"""
WMO Parser for WoW Resource Parser
Parses WMO (World Map Object) files to extract M2 doodad references and texture references.

WMO files can contain M2 models inside them (doodads), which creates a dependency chain:
ADT -> WMO -> M2 models

WMO files also reference BLP textures directly via MOMT/MOTX chunks.

This parser extracts both M2 doodads and BLP textures.
"""

import struct
import sys
from pathlib import Path
from typing import Set, List, Dict
from .chunk_utils import read_chunk_header


class WMOParser:
    """Parser for WoW WMO files to extract M2 doodad references and texture references."""

    # Known WMO chunk types (for byte order detection)
    KNOWN_CHUNKS = ['MVER', 'MODN', 'MODI', 'MOHD', 'MOTX', 'MOMT']

    def __init__(self, wmo_path: Path):
        self.wmo_path = wmo_path
        self.data = None
        self.doodads: Set[str] = set()  # M2 models referenced by this WMO
        self.textures: Set[str] = set()  # BLP textures referenced by this WMO
        self.wmo_refs: Set[str] = set()  # WMO files referenced by this WMO (nested WMOs)
        self.chunk_offsets: Dict[str, tuple] = {}  # Cache chunk locations

    def parse_modn_chunk(self, offset: int, size: int) -> tuple[List[str], List[str]]:
        """
        Parse MODN chunk (doodad names).

        MODN contains null-terminated strings of model paths (M2/MDX) and WMO paths
        that are used as doodads (decorations) in the WMO.

        Similar to MMDX in ADT files.

        Returns:
            Tuple of (m2_doodads, wmo_refs)
        """
        doodads = []
        wmo_refs = []
        chunk_data = self.data[offset:offset+size]

        # Split by null bytes
        doodad_strings = chunk_data.split(b'\x00')

        for doodad_bytes in doodad_strings:
            if doodad_bytes:
                try:
                    doodad_path = doodad_bytes.decode('ascii', errors='ignore').strip()
                    if not doodad_path:
                        continue

                    # Normalize path separators and remove duplicate slashes
                    doodad_path = doodad_path.replace('\\', '/')
                    while '//' in doodad_path:
                        doodad_path = doodad_path.replace('//', '/')
                    doodad_path = doodad_path.strip('/')

                    # Check file type
                    if doodad_path.lower().endswith('.wmo'):
                        # Nested WMO reference
                        wmo_refs.append(doodad_path)
                    elif doodad_path.lower().endswith(('.m2', '.mdx')):
                        # M2 doodad
                        doodads.append(doodad_path)
                except:
                    pass

        return doodads, wmo_refs

    def parse_momt_chunk(self, offset: int, size: int) -> List[int]:
        """
        Parse MOMT chunk (material definitions) to extract texture offsets.

        MOMT contains material definitions, where each material entry is 64 bytes.
        Each material has THREE texture offset fields at specific positions.

        Structure (WotLK 3.3.5a):
        - Each material: 64 bytes
        - Offset +0x00: uint32 - Flags
        - Offset +0x04: uint32 - Shader
        - Offset +0x08: uint32 - Blend Mode
        - Offset +0x0C: uint32 - texture_1 offset into MOTX
        - Offset +0x18: uint32 - texture_2 offset into MOTX
        - Offset +0x24: uint32 - texture_3 offset into MOTX

        Returns:
            List of offsets into MOTX chunk
        """
        texture_offsets = []

        # Each material entry is 64 bytes
        material_size = 64
        num_materials = size // material_size

        for i in range(num_materials):
            material_offset = offset + (i * material_size)

            # Check bounds
            if material_offset + material_size > len(self.data):
                break

            # Read all three texture offsets from the material
            # texture_1 at offset +0x0C (12)
            # texture_2 at offset +0x18 (24)
            # texture_3 at offset +0x24 (36)
            texture_offset_positions = [0x0C, 0x18, 0x24]

            for tex_ofs_pos in texture_offset_positions:
                if material_offset + tex_ofs_pos + 4 <= len(self.data):
                    texture_offset = struct.unpack_from('<I', self.data, material_offset + tex_ofs_pos)[0]

                    # Valid texture offsets should be reasonable
                    # Offset 0 is valid (points to start of MOTX chunk)
                    # Very large values indicate unused texture slots
                    if texture_offset >= 0 and texture_offset < 100000:  # Sanity check
                        texture_offsets.append(texture_offset)

        return texture_offsets

    def parse_motx_chunk(self, offset: int, size: int, texture_offsets: List[int]) -> List[str]:
        """
        Parse MOTX chunk (texture names) using offsets from MOMT.

        MOTX contains null-terminated texture path strings.
        The offsets from MOMT point to positions within this chunk.

        Args:
            offset: Start of MOTX chunk data
            size: Size of MOTX chunk
            texture_offsets: List of offsets (relative to MOTX start) from MOMT

        Returns:
            List of BLP texture paths
        """
        textures = []
        motx_start = offset

        for tex_offset in texture_offsets:
            # Calculate absolute position in file
            absolute_offset = motx_start + tex_offset

            # Bounds check
            if absolute_offset >= len(self.data) or absolute_offset < motx_start:
                continue

            # Find null terminator
            end_pos = self.data.find(b'\x00', absolute_offset, motx_start + size)
            if end_pos == -1:
                end_pos = motx_start + size

            try:
                # Read null-terminated string
                texture_path = self.data[absolute_offset:end_pos].decode('utf-8', errors='ignore')

                # Validate it's a texture path
                if texture_path and '.blp' in texture_path.lower():
                    # Normalize path separators and remove duplicate slashes
                    normalized = texture_path.replace('\\', '/')
                    while '//' in normalized:
                        normalized = normalized.replace('//', '/')
                    normalized = normalized.strip('/')
                    textures.append(normalized)
            except:
                pass

        return textures

    def parse_wmo_textures(self) -> Set[str]:
        """
        Parse WMO textures by reading MOMT and MOTX chunks.

        Returns:
            Set of BLP texture paths
        """
        textures = set()

        # Need both MOMT and MOTX chunks
        if 'MOMT' not in self.chunk_offsets or 'MOTX' not in self.chunk_offsets:
            return textures

        momt_offset, momt_size = self.chunk_offsets['MOMT']
        motx_offset, motx_size = self.chunk_offsets['MOTX']

        # Parse MOMT to get texture offsets
        texture_offsets = self.parse_momt_chunk(momt_offset, momt_size)

        # Parse MOTX using those offsets
        if texture_offsets:
            texture_list = self.parse_motx_chunk(motx_offset, motx_size, texture_offsets)
            textures.update(texture_list)

        return textures

    def parse(self) -> Set[str]:
        """
        Parse the WMO file and extract all M2 doodad references.

        Note: This method maintains backward compatibility by only returning doodads.
        Use parse_all() to get both doodads and textures.
        """
        self.parse_all()
        return self.doodads

    def parse_all(self) -> tuple[Set[str], Set[str]]:
        """
        Parse the WMO file and extract all M2 doodad references and BLP textures.

        Returns:
            Tuple of (doodads, textures)
        """
        if not self.wmo_path.exists():
            print(f"Error: File not found: {self.wmo_path}")
            return set(), set()

        # Read entire file
        with open(self.wmo_path, 'rb') as f:
            self.data = f.read()

        if len(self.data) < 8:
            return set(), set()

        # First pass: scan for all chunks and cache their locations
        offset = 0
        while offset < len(self.data) - 8:
            magic, size = read_chunk_header(self.data, offset, self.KNOWN_CHUNKS)

            if magic in self.KNOWN_CHUNKS and size >= 0 and size < 10000000:
                # Cache chunk location
                self.chunk_offsets[magic] = (offset + 8, size)
                offset += 8 + size
            elif size >= 0 and size < 10000000:
                # Unknown chunk, skip it
                offset += 8 + size
            else:
                # Invalid size, scan forward byte by byte
                offset += 1

        # Second pass: parse cached chunks
        # Parse MODN for doodads and nested WMO references
        if 'MODN' in self.chunk_offsets:
            modn_offset, modn_size = self.chunk_offsets['MODN']
            doodads, wmo_refs = self.parse_modn_chunk(modn_offset, modn_size)
            self.doodads.update(doodads)
            self.wmo_refs.update(wmo_refs)

        # Parse MOMT + MOTX for textures
        self.textures = self.parse_wmo_textures()

        return self.doodads, self.textures


def parse_wmo_directory(wmo_dir: Path, pattern: str = "*.wmo") -> Set[str]:
    """
    Parse all WMO files in a directory and extract unique M2 doodad references.

    Args:
        wmo_dir: Directory containing WMO files
        pattern: File pattern to match (default: *.wmo)

    Returns:
        Set of unique M2 model paths referenced by WMOs
    """
    all_doodads = set()
    wmo_files = list(wmo_dir.rglob(pattern))

    if not wmo_files:
        print(f"No WMO files found in {wmo_dir} with pattern '{pattern}'")
        return all_doodads

    print(f"Found {len(wmo_files)} WMO files to parse...")

    for wmo_file in wmo_files:
        print(f"  Parsing: {wmo_file.name}")
        parser = WMOParser(wmo_file)
        doodads = parser.parse()
        all_doodads.update(doodads)

        if doodads:
            print(f"    -> Found {len(doodads)} doodad references")

    return all_doodads


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 wmo_parser.py <wmo_directory> [output_file]")
        print("\nExample:")
        print("  python3 wmo_parser.py /path/to/wmo/files wmo_doodads.txt")
        print("\nNote: This extracts M2 models referenced INSIDE WMO files")
        sys.exit(1)

    wmo_dir = Path(sys.argv[1])
    output_file = Path(sys.argv[2]) if len(sys.argv) > 2 else None

    if not wmo_dir.exists():
        print(f"Error: Directory not found: {wmo_dir}")
        sys.exit(1)

    # Parse all WMO files
    all_doodads = parse_wmo_directory(wmo_dir)

    # Sort for readability
    sorted_doodads = sorted(all_doodads, key=lambda x: x.lower())

    # Print results
    print(f"\n{'='*80}")
    print(f"TOTAL UNIQUE M2 DOODADS IN WMOs: {len(sorted_doodads)}")
    print(f"{'='*80}\n")

    for doodad in sorted_doodads:
        print(doodad)

    # Save to file if requested
    if output_file:
        with open(output_file, 'w') as f:
            f.write(f"# M2 Doodads Referenced in WMO Files\n")
            f.write(f"# Source: {wmo_dir}\n")
            f.write(f"# Total: {len(sorted_doodads)} unique models\n\n")
            for doodad in sorted_doodads:
                f.write(f"{doodad}\n")

        print(f"\nDoodad list saved to: {output_file}")


if __name__ == "__main__":
    main()
