#!/usr/bin/env python3
"""
ADT M2 Model Reference Parser
Extracts all .m2 model file paths referenced in WoW ADT (terrain) files.

ADT files contain MDDF (M2 placement) chunks that reference models.
The actual model paths are stored in MMDX (model names) chunks.

WMO Placement Detection:
MODF chunks contain WMO placement data including position and UniqueId.
This parser can detect duplicate WMO placements at same/similar coordinates.
"""

import struct
import sys
from pathlib import Path
from typing import Set, List, Tuple, Dict, NamedTuple
from .adt_groundeffect_reader import ADTGroundEffectReader
from .chunk_utils import read_chunk_header


class MODFEntry(NamedTuple):
    """WMO placement entry from MODF chunk (64 bytes)."""
    wmo_id: int          # Index into MWMO list
    unique_id: int       # Unique identifier
    position: Tuple[float, float, float]  # x, y, z coordinates
    rotation: Tuple[float, float, float]  # x, y, z rotation
    bounds_min: Tuple[float, float, float]  # Bounding box minimum
    bounds_max: Tuple[float, float, float]  # Bounding box maximum
    flags: int
    doodad_set: int
    name_set: int
    scale: int


class ADTParser:
    """Parser for WoW ADT files to extract M2 model and WMO references."""

    # Known ADT chunk types (for byte order detection)
    KNOWN_CHUNKS = ['MVER', 'MMDX', 'MDDF', 'MHDR', 'MCIN', 'MWMO', 'MWID', 'MODF', 'MCNK']

    def __init__(self, adt_path: Path):
        self.adt_path = adt_path
        self.data = None
        self.models: Set[str] = set()
        self.wmos: Set[str] = set()
        self.wmo_list: List[str] = []  # Ordered list from MWMO (for MODF indexing)
        self.wmo_placements: List[MODFEntry] = []  # WMO placement data from MODF
        self.ground_effect_ids: Set[int] = set()
        self.area_ids: Set[int] = set()  # AreaTable.dbc IDs from MCNK headers

    def parse_mmdx_chunk(self, offset: int, size: int) -> List[str]:
        """
        Parse MMDX chunk (model filenames).
        MMDX contains null-terminated strings of model paths.
        """
        models = []
        chunk_data = self.data[offset:offset+size]

        # Split by null bytes to get individual model paths
        model_strings = chunk_data.split(b'\x00')

        for model_bytes in model_strings:
            if model_bytes:
                try:
                    model_path = model_bytes.decode('ascii', errors='ignore').strip()
                    # Accept both .m2 (WotLK) and .mdx (pre-WotLK) model formats
                    if model_path and (model_path.lower().endswith('.m2') or
                                      model_path.lower().endswith('.mdx')):
                        # Normalize path separators and remove duplicate slashes
                        model_path = model_path.replace('\\', '/')
                        while '//' in model_path:
                            model_path = model_path.replace('//', '/')
                        model_path = model_path.strip('/')
                        models.append(model_path)
                except:
                    pass

        return models

    def parse_mwmo_chunk(self, offset: int, size: int) -> List[str]:
        """
        Parse MWMO chunk (WMO filenames).
        MWMO contains null-terminated strings of WMO file paths.
        The order is preserved as MODF entries reference by index.
        """
        wmos = []
        chunk_data = self.data[offset:offset+size]

        # Split by null bytes to get individual WMO paths
        wmo_strings = chunk_data.split(b'\x00')

        for wmo_bytes in wmo_strings:
            if wmo_bytes:
                try:
                    wmo_path = wmo_bytes.decode('ascii', errors='ignore').strip()
                    # Accept .wmo files
                    if wmo_path and wmo_path.lower().endswith('.wmo'):
                        # Normalize path separators and remove duplicate slashes
                        wmo_path = wmo_path.replace('\\', '/')
                        while '//' in wmo_path:
                            wmo_path = wmo_path.replace('//', '/')
                        wmo_path = wmo_path.strip('/')
                        wmos.append(wmo_path)
                except:
                    pass

        return wmos

    def parse_modf_chunk(self, offset: int, size: int) -> List[MODFEntry]:
        """
        Parse MODF chunk (WMO placement data).

        Each MODF entry is 64 bytes:
        - uint32 Id (index into MWMO list)
        - uint32 UniqueId
        - Vec3D Position (3 floats)
        - Vec3D Rotation (3 floats)
        - AaBox3D Bounds (6 floats: min x,y,z then max x,y,z)
        - uint16 Flags
        - uint16 DoodadSet
        - uint16 NameSet
        - uint16 Scale
        """
        placements = []
        chunk_data = self.data[offset:offset+size]

        # Each entry is exactly 64 bytes
        entry_size = 64
        num_entries = size // entry_size

        for i in range(num_entries):
            entry_offset = i * entry_size
            entry_data = chunk_data[entry_offset:entry_offset+entry_size]

            if len(entry_data) < entry_size:
                break

            try:
                # Unpack the MODF entry (64 bytes total)
                # Format: 2 uint32, 12 floats (position, rotation, bounds min/max), 4 uint16
                unpacked = struct.unpack('<II12f4H', entry_data)

                wmo_id = unpacked[0]
                unique_id = unpacked[1]
                position = (unpacked[2], unpacked[3], unpacked[4])
                rotation = (unpacked[5], unpacked[6], unpacked[7])
                bounds_min = (unpacked[8], unpacked[9], unpacked[10])
                bounds_max = (unpacked[11], unpacked[12], unpacked[13])
                flags = unpacked[14]
                doodad_set = unpacked[15]
                name_set = unpacked[16]
                scale = unpacked[17]

                entry = MODFEntry(
                    wmo_id=wmo_id,
                    unique_id=unique_id,
                    position=position,
                    rotation=rotation,
                    bounds_min=bounds_min,
                    bounds_max=bounds_max,
                    flags=flags,
                    doodad_set=doodad_set,
                    name_set=name_set,
                    scale=scale
                )

                placements.append(entry)

            except struct.error:
                # Skip malformed entries
                pass

        return placements

    def parse_ground_effect_ids(self) -> Set[int]:
        """
        Parse MCLY (texture layer) chunks to extract ground effect IDs and AreaIDs.

        Delegates to ADTGroundEffectReader to avoid code duplication.
        Also extracts AreaIDs from MCNK headers for zone-based reporting.
        """
        reader = ADTGroundEffectReader(str(self.adt_path))
        ground_effects = reader.parse()

        # Also collect AreaIDs from the reader
        self.area_ids.update(reader.area_ids)

        return ground_effects

    def find_duplicate_wmos(self, distance_threshold: float = 1.0) -> List[Tuple[MODFEntry, MODFEntry, float]]:
        """
        Detect duplicate WMO placements at same or nearby coordinates.

        Args:
            distance_threshold: Maximum distance (in game units) to consider duplicates

        Returns:
            List of tuples: (entry1, entry2, distance) for each duplicate pair found
        """
        duplicates = []

        # Compare each placement with every other placement
        for i in range(len(self.wmo_placements)):
            for j in range(i + 1, len(self.wmo_placements)):
                entry1 = self.wmo_placements[i]
                entry2 = self.wmo_placements[j]

                # Check if they reference the same WMO
                if entry1.wmo_id != entry2.wmo_id:
                    continue

                # Calculate 3D distance between positions
                dx = entry1.position[0] - entry2.position[0]
                dy = entry1.position[1] - entry2.position[1]
                dz = entry1.position[2] - entry2.position[2]
                distance = (dx*dx + dy*dy + dz*dz) ** 0.5

                # If within threshold, consider it a duplicate
                if distance <= distance_threshold:
                    duplicates.append((entry1, entry2, distance))

        return duplicates

    def parse(self) -> Set[str]:
        """Parse the ADT file and extract all M2 model references, WMO placements, and ground effect IDs."""
        if not self.adt_path.exists():
            print(f"Error: File not found: {self.adt_path}")
            return set()

        # Read entire file
        with open(self.adt_path, 'rb') as f:
            self.data = f.read()

        if len(self.data) < 8:
            return set()

        # Scan entire file for MMDX, MWMO, and MODF chunks
        offset = 0
        while offset < len(self.data) - 8:
            magic, size = read_chunk_header(self.data, offset, self.KNOWN_CHUNKS)

            if magic is None:
                # Invalid chunk header, scan forward
                offset += 1
                continue

            if magic == 'MMDX' and size > 0 and size < 1000000:
                # Found model names chunk
                models = self.parse_mmdx_chunk(offset + 8, size)
                if models:
                    self.models.update(models)
                offset += 8 + size
            elif magic == 'MWMO' and size > 0 and size < 1000000:
                # Found WMO names chunk
                wmos = self.parse_mwmo_chunk(offset + 8, size)
                if wmos:
                    self.wmos.update(wmos)
                    self.wmo_list = wmos  # Store ordered list for MODF indexing
                offset += 8 + size
            elif magic == 'MODF' and size > 0 and size < 1000000:
                # Found WMO placement chunk
                placements = self.parse_modf_chunk(offset + 8, size)
                if placements:
                    self.wmo_placements.extend(placements)
                offset += 8 + size
            elif size > 0 and size < 10000000:
                # Skip to next chunk
                offset += 8 + size
            else:
                # Invalid size, scan forward byte by byte
                offset += 1

        # Parse ground effect IDs from MCLY chunks
        self.ground_effect_ids = self.parse_ground_effect_ids()

        # Free raw file data — no longer needed after parsing
        self.data = None

        return self.models


def parse_adt_directory(adt_dir: Path, pattern: str = "*.adt") -> Set[str]:
    """
    Parse all ADT files in a directory and extract unique M2 references.

    Args:
        adt_dir: Directory containing ADT files
        pattern: File pattern to match (default: *.adt)

    Returns:
        Set of unique M2 model paths
    """
    all_models = set()
    adt_files = list(adt_dir.rglob(pattern))

    if not adt_files:
        print(f"No ADT files found in {adt_dir} with pattern '{pattern}'")
        return all_models

    print(f"Found {len(adt_files)} ADT files to parse...")

    for adt_file in adt_files:
        print(f"  Parsing: {adt_file.name}")
        parser = ADTParser(adt_file)
        models = parser.parse()
        all_models.update(models)

        if models:
            print(f"    -> Found {len(models)} model references")

    return all_models


def parse_adt_directory_detailed(adt_dir: Path, pattern: str = "*.adt") -> Dict[str, Set[str]]:
    """
    Parse all ADT files in a directory and extract M2 references per ADT.

    This version tracks which models are referenced by which ADT files,
    enabling per-ADT missing model reports.

    Args:
        adt_dir: Directory containing ADT files
        pattern: File pattern to match (default: *.adt)

    Returns:
        Dict mapping ADT file paths to their M2 model sets
    """
    adt_models_map = {}
    adt_files = list(adt_dir.rglob(pattern))

    if not adt_files:
        print(f"No ADT files found in {adt_dir} with pattern '{pattern}'")
        return adt_models_map

    print(f"Found {len(adt_files)} ADT files to parse...")

    for adt_file in adt_files:
        print(f"  Parsing: {adt_file.name}")
        parser = ADTParser(adt_file)
        models = parser.parse()

        # Store models per ADT file
        adt_models_map[str(adt_file)] = models

        if models:
            print(f"    -> Found {len(models)} model references")

    return adt_models_map


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 parse_adt_models.py <adt_directory> [output_file]")
        print("\nExample:")
        print("  python3 parse_adt_models.py /path/to/adt/files models.txt")
        sys.exit(1)

    adt_dir = Path(sys.argv[1])
    output_file = Path(sys.argv[2]) if len(sys.argv) > 2 else None

    if not adt_dir.exists():
        print(f"Error: Directory not found: {adt_dir}")
        sys.exit(1)

    # Parse all ADT files
    all_models = parse_adt_directory(adt_dir)

    # Sort for readability
    sorted_models = sorted(all_models, key=lambda x: x.lower())

    # Print results
    print(f"\n{'='*80}")
    print(f"TOTAL UNIQUE M2 MODELS FOUND: {len(sorted_models)}")
    print(f"{'='*80}\n")

    for model in sorted_models:
        print(model)

    # Save to file if requested
    if output_file:
        with open(output_file, 'w') as f:
            f.write(f"# M2 Models Referenced in ADT Files\n")
            f.write(f"# Source: {adt_dir}\n")
            f.write(f"# Total: {len(sorted_models)} unique models\n\n")
            for model in sorted_models:
                f.write(f"{model}\n")

        print(f"\nModel list saved to: {output_file}")


if __name__ == "__main__":
    main()
