#!/usr/bin/env python3
"""
ADT Ground Effect ID Reader
Extracts ground effect doodad IDs referenced by ADT terrain textures.

Ground effect IDs are stored in ADT MCNK (map chunk) sub-chunks,
specifically in the MCLY (texture layer) data.
"""

import struct
from pathlib import Path
from typing import Set, Dict, List, Tuple
from .chunk_utils import read_chunk_header


class ADTGroundEffectReader:
    """
    Parse ADT files to extract ground effect doodad IDs.

    ADT chunks contain MCNK (map chunks), which contain MCLY (texture layers).
    Each texture layer references a GroundEffectTexture.dbc ID, which then
    references GroundEffectDoodad.dbc IDs.

    We need to extract the effectId field from MCLY entries.
    """

    # Known ADT chunk types (for byte order detection)
    KNOWN_CHUNKS = ['MVER', 'MHDR', 'MCIN', 'MCNK', 'MMDX', 'MWMO']

    def __init__(self, adt_path: str):
        self.adt_path = Path(adt_path)
        self.ground_effect_ids = set()
        self.texture_ids = set()
        self.area_ids = set()  # AreaTable.dbc IDs from MCNK headers

    def parse_mcnk_chunk(self, data: bytes, offset: int, size: int) -> Set[int]:
        """
        Parse MCNK (map chunk) to find MCLY texture layer data and AreaID.

        MCNK header (128 bytes) contains offset pointers to sub-chunks.
        We use the header offsets instead of scanning sequentially.

        MCNK Header structure:
        - Offset 12: nLayers (uint32) - number of texture layers
        - Offset 28: ofsLayer (uint32) - offset to MCLY data (relative to MCNK data start)
        - Offset 52: AreaID (uint32) - AreaTable.dbc ID for this map chunk
        """
        effect_ids = set()

        # MCNK header is 128 bytes
        if offset + 128 > len(data):
            return effect_ids

        header_data = data[offset:offset+128]

        # Read number of texture layers (offset 12 in header)
        nLayers = struct.unpack('<I', header_data[12:16])[0]

        # Read offset to MCLY data (offset 28 in header)
        ofsLayer = struct.unpack('<I', header_data[28:32])[0]

        # Read AreaID (offset 52 in header - CORRECTED from 56)
        areaId = struct.unpack('<I', header_data[52:56])[0]
        if areaId > 0:  # AreaID 0 is typically invalid/unassigned
            self.area_ids.add(areaId)

        # If no layers or no offset, return empty
        if nLayers == 0 or ofsLayer == 0:
            return effect_ids

        # MCLY data is at: MCNK data start + ofsLayer
        # Note: ofsLayer is relative to MCNK data (after the 8-byte chunk header)
        mcly_abs_offset = offset + ofsLayer

        # Each MCLY entry is 16 bytes
        for i in range(nLayers):
            entry_offset = mcly_abs_offset + (i * 16)

            if entry_offset + 16 > len(data):
                break

            # Read effectId at offset 12 in each 16-byte entry
            effect_id = struct.unpack('<i', data[entry_offset+12:entry_offset+16])[0]

            # Filter invalid IDs:
            # - effectId of -1 (or 0xFFFFFFFF/65535 as unsigned) means no ground effect
            # - effectId of 0 is typically invalid/unassigned
            if effect_id > 0 and effect_id != 65535:
                effect_ids.add(effect_id)

        return effect_ids

    def parse(self) -> Set[int]:
        """
        Parse ADT file to extract all ground effect IDs.

        Returns:
            Set of ground effect IDs (GroundEffectTexture.dbc IDs)
        """
        try:
            with open(self.adt_path, 'rb') as f:
                data = f.read()
        except Exception as e:
            print(f"Error reading {self.adt_path}: {e}")
            return set()

        offset = 0
        file_size = len(data)

        while offset + 8 < file_size:
            magic, size = read_chunk_header(data, offset, self.KNOWN_CHUNKS)

            if magic is None:
                break

            # Look for MCNK chunks (map chunks)
            if magic == 'MCNK':
                mcnk_ids = self.parse_mcnk_chunk(data, offset + 8, size)
                self.ground_effect_ids.update(mcnk_ids)

            # Move to next top-level chunk
            offset += 8 + size

        return self.ground_effect_ids


def parse_adt_directory_for_ground_effects(adt_dir: Path, pattern: str = "*.adt") -> Dict[str, Set[int]]:
    """
    Parse all ADT files in directory to extract ground effect IDs.

    Args:
        adt_dir: Directory containing ADT files
        pattern: File pattern to match (default: *.adt)

    Returns:
        Dict mapping ADT filename → set of ground effect IDs
    """
    adt_files = sorted(adt_dir.rglob(pattern))

    results = {}
    all_effect_ids = set()

    print(f"Parsing {len(adt_files)} ADT files for ground effect IDs...")

    for adt_file in adt_files:
        reader = ADTGroundEffectReader(str(adt_file))
        effect_ids = reader.parse()

        if effect_ids:
            results[adt_file.name] = effect_ids
            all_effect_ids.update(effect_ids)
            print(f"  {adt_file.name}: {len(effect_ids)} unique effect IDs")

    print(f"\nTotal unique ground effect IDs: {len(all_effect_ids)}")
    print(f"ADT files with ground effects: {len(results)}")

    return results


def main():
    """Test ADT ground effect ID reader on Lost Isles."""
    import sys

    # Lost Isles coordinates: Kalimdor 54-56, 28-33
    lost_isles_dir = Path("/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/WORLD/maps/kalimdor")

    if not lost_isles_dir.exists():
        print(f"Error: Directory not found: {lost_isles_dir}")
        return

    print("="*80)
    print("LOST ISLES GROUND EFFECT ID ANALYSIS")
    print("="*80)
    print(f"Scanning: {lost_isles_dir}")
    print()

    # Parse only Lost Isles ADTs
    lost_isles_pattern = "kalimdor_5[456]_[23][0-9].adt"

    # Get all matching files first
    import re
    pattern_regex = re.compile(r"kalimdor_5[456]_[23][0-9]\.adt")
    lost_isles_adts = [f for f in lost_isles_dir.glob("kalimdor_*.adt")
                       if pattern_regex.match(f.name)]

    print(f"Found {len(lost_isles_adts)} Lost Isles ADT files\n")

    results = {}
    all_effect_ids = set()

    for adt_file in sorted(lost_isles_adts):
        reader = ADTGroundEffectReader(str(adt_file))
        effect_ids = reader.parse()

        if effect_ids:
            results[adt_file.name] = effect_ids
            all_effect_ids.update(effect_ids)
            print(f"  {adt_file.name}: {sorted(effect_ids)}")

    print()
    print("="*80)
    print("SUMMARY")
    print("="*80)
    print(f"Total Lost Isles ADT files analyzed: {len(lost_isles_adts)}")
    print(f"ADT files with ground effects: {len(results)}")
    print(f"Unique ground effect IDs found: {len(all_effect_ids)}")

    if all_effect_ids:
        print(f"\nAll unique effect IDs: {sorted(all_effect_ids)}")
        print()
        print("These IDs should exist in GroundEffectTexture.dbc, which references")
        print("GroundEffectDoodad.dbc entries for the actual M2 models to scatter.")
    else:
        print("\n⚠️  No ground effect IDs found in Lost Isles ADTs")
        print("This may indicate:")
        print("  1. ADT files don't use ground effects (unlikely given blue cubes)")
        print("  2. Parser needs adjustment for ADT format version")
        print("  3. Ground effects stored in different ADT sub-chunk")


if __name__ == '__main__':
    main()
