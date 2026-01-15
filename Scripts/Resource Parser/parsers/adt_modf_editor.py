#!/usr/bin/env python3
"""
ADT MODF Chunk Editor
Removes duplicate WMO placements from ADT files and exports fixed versions.

This module provides functions to:
- Read ADT files as binary data
- Locate and parse MODF chunks
- Deduplicate WMO placements based on position/flags/scale
- Rebuild MODF chunks with deduplicated entries
- Write fixed ADT files to export directory

Usage:
    from parsers.adt_modf_editor import fix_adt_duplicates

    fix_adt_duplicates(
        adt_path="/path/to/source.adt",
        export_path="/path/to/export/source.adt",
        duplicates=[(entry1, entry2, distance, wmo_name), ...],
        wmo_list=["path/to/wmo1.wmo", ...]
    )
"""

import struct
from pathlib import Path
from typing import List, Tuple, Dict, Set
from .adt_parser import MODFEntry
from .chunk_utils import read_chunk_header


class ADTMODFEditor:
    """Editor for fixing duplicate WMO placements in ADT MODF chunks."""

    def __init__(self, adt_path: Path):
        self.adt_path = adt_path
        self.data = None
        self.chunks = []  # List of (magic, offset, size) tuples
        self.modf_offset = None
        self.modf_size = None

    def read_adt(self) -> bytes:
        """Read entire ADT file as binary data."""
        if not self.adt_path.exists():
            raise FileNotFoundError(f"ADT file not found: {self.adt_path}")

        with open(self.adt_path, 'rb') as f:
            self.data = f.read()

        return self.data

    def scan_chunks(self):
        """Scan ADT and catalog all chunks."""
        known_chunks = ['MVER', 'MMDX', 'MDDF', 'MHDR', 'MCIN', 'MWMO', 'MWID', 'MODF', 'MCNK']

        self.chunks = []
        offset = 0

        while offset < len(self.data) - 8:
            magic, size = read_chunk_header(self.data, offset, known_chunks)

            if magic is None or size < 0 or size > 10000000:
                break

            self.chunks.append((magic, offset, size))

            # Track MODF chunk location
            if magic == 'MODF':
                self.modf_offset = offset
                self.modf_size = size

            offset += 8 + size

    def parse_modf_entries(self) -> List[MODFEntry]:
        """Parse all MODF entries from the chunk."""
        if self.modf_offset is None:
            return []

        entries = []
        chunk_data = self.data[self.modf_offset + 8 : self.modf_offset + 8 + self.modf_size]

        entry_size = 64
        num_entries = self.modf_size // entry_size

        for i in range(num_entries):
            entry_offset = i * entry_size
            entry_data = chunk_data[entry_offset:entry_offset+entry_size]

            if len(entry_data) < entry_size:
                break

            try:
                unpacked = struct.unpack('<II12f4H', entry_data)

                entry = MODFEntry(
                    wmo_id=unpacked[0],
                    unique_id=unpacked[1],
                    position=(unpacked[2], unpacked[3], unpacked[4]),
                    rotation=(unpacked[5], unpacked[6], unpacked[7]),
                    bounds_min=(unpacked[8], unpacked[9], unpacked[10]),
                    bounds_max=(unpacked[11], unpacked[12], unpacked[13]),
                    flags=unpacked[14],
                    doodad_set=unpacked[15],
                    name_set=unpacked[16],
                    scale=unpacked[17]
                )

                entries.append(entry)
            except struct.error:
                continue

        return entries

    def deduplicate_entries(
        self,
        entries: List[MODFEntry],
        duplicates: List[Tuple[MODFEntry, MODFEntry, float, str]]
    ) -> Tuple[List[MODFEntry], Dict[int, str]]:
        """
        Remove duplicate entries, keeping the "best" instance.

        Priority rules:
        1. Keep instance with Flags != 0
        2. Keep instance with Scale != 0
        3. If equal, keep first occurrence

        Returns:
            Tuple of (deduplicated_entries, removal_log)
        """
        # Build set of duplicate unique_ids to remove
        to_remove = set()
        removal_log = {}

        for entry1, entry2, distance, wmo_name in duplicates:
            # Determine which to keep
            keep_entry = None
            remove_entry = None
            reason = ""

            # Priority 1: Flags != 0
            if entry1.flags != 0 and entry2.flags == 0:
                keep_entry = entry1
                remove_entry = entry2
                reason = f"Kept entry with Flags={entry1.flags} (other had Flags=0)"
            elif entry2.flags != 0 and entry1.flags == 0:
                keep_entry = entry2
                remove_entry = entry1
                reason = f"Kept entry with Flags={entry2.flags} (other had Flags=0)"
            # Priority 2: Scale != 0
            elif entry1.scale != 0 and entry2.scale == 0:
                keep_entry = entry1
                remove_entry = entry2
                reason = f"Kept entry with Scale={entry1.scale} (other had Scale=0)"
            elif entry2.scale != 0 and entry1.scale == 0:
                keep_entry = entry2
                remove_entry = entry1
                reason = f"Kept entry with Scale={entry2.scale} (other had Scale=0)"
            # Priority 3: Keep first occurrence (entry1)
            else:
                keep_entry = entry1
                remove_entry = entry2
                reason = "Kept first occurrence (both had equal priority)"

            to_remove.add(remove_entry.unique_id)
            removal_log[remove_entry.unique_id] = {
                'wmo': wmo_name,
                'distance': distance,
                'kept_id': keep_entry.unique_id,
                'reason': reason,
                'removed_flags': remove_entry.flags,
                'removed_scale': remove_entry.scale,
                'kept_flags': keep_entry.flags,
                'kept_scale': keep_entry.scale
            }

        # Filter out removed entries
        deduplicated = [e for e in entries if e.unique_id not in to_remove]

        return deduplicated, removal_log

    def rebuild_modf_chunk(self, entries: List[MODFEntry]) -> bytes:
        """Rebuild MODF chunk with deduplicated entries."""
        chunk_data = b''

        for entry in entries:
            # Pack entry back to binary (64 bytes)
            packed = struct.pack(
                '<II12f4H',
                entry.wmo_id,
                entry.unique_id,
                entry.position[0], entry.position[1], entry.position[2],
                entry.rotation[0], entry.rotation[1], entry.rotation[2],
                entry.bounds_min[0], entry.bounds_min[1], entry.bounds_min[2],
                entry.bounds_max[0], entry.bounds_max[1], entry.bounds_max[2],
                entry.flags,
                entry.doodad_set,
                entry.name_set,
                entry.scale
            )
            chunk_data += packed

        # Build chunk with header (magic + size)
        new_size = len(chunk_data)
        chunk_header = b'MODF' + struct.pack('<I', new_size)

        return chunk_header + chunk_data

    def write_fixed_adt(self, export_path: Path, new_modf_chunk: bytes):
        """Write fixed ADT with replaced MODF chunk to export path."""
        if self.modf_offset is None:
            raise ValueError("No MODF chunk found in original ADT")

        # Ensure export directory exists
        export_path.parent.mkdir(parents=True, exist_ok=True)

        # Build new ADT data:
        # [before MODF] + [new MODF chunk] + [after MODF]
        modf_end = self.modf_offset + 8 + self.modf_size

        new_data = (
            self.data[:self.modf_offset] +  # Everything before MODF
            new_modf_chunk +                 # New MODF chunk
            self.data[modf_end:]             # Everything after MODF
        )

        # Write to export path
        with open(export_path, 'wb') as f:
            f.write(new_data)

        return len(new_data)


def fix_adt_duplicates(
    adt_path: Path,
    export_path: Path,
    duplicates: List[Tuple[MODFEntry, MODFEntry, float, str]],
    wmo_list: List[str] = None
) -> Dict:
    """
    Fix duplicate WMO placements in an ADT file and export result.

    Args:
        adt_path: Source ADT file path
        export_path: Export destination path
        duplicates: List of duplicate tuples from parser
        wmo_list: Optional WMO names list for logging

    Returns:
        Dict with fix statistics and log
    """
    if not duplicates:
        return {
            'success': False,
            'message': 'No duplicates to fix',
            'removed_count': 0
        }

    editor = ADTMODFEditor(adt_path)

    # Read and scan ADT
    editor.read_adt()
    editor.scan_chunks()

    # Parse original MODF entries
    original_entries = editor.parse_modf_entries()
    original_count = len(original_entries)

    if not original_entries:
        return {
            'success': False,
            'message': 'No MODF entries found in ADT',
            'removed_count': 0
        }

    # Deduplicate
    deduplicated_entries, removal_log = editor.deduplicate_entries(original_entries, duplicates)
    removed_count = original_count - len(deduplicated_entries)

    # Rebuild MODF chunk
    new_modf_chunk = editor.rebuild_modf_chunk(deduplicated_entries)

    # Write fixed ADT
    new_size = editor.write_fixed_adt(export_path, new_modf_chunk)

    return {
        'success': True,
        'message': f'Fixed ADT exported successfully',
        'original_count': original_count,
        'deduplicated_count': len(deduplicated_entries),
        'removed_count': removed_count,
        'duplicate_pairs': len(duplicates),
        'removal_log': removal_log,
        'original_size': len(editor.data),
        'new_size': new_size,
        'export_path': str(export_path)
    }
