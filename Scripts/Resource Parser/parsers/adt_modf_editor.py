#!/usr/bin/env python3
"""
ADT MODF Chunk Editor
Removes duplicate WMO placements from ADT files and exports fixed versions.

This module provides functions to:
- Read ADT files as binary data
- Locate and parse MODF chunks
- Deduplicate WMO placements based on position/flags/scale
- Update MCRF sub-chunks in all 256 MCNKs (remove refs, re-index)
- Update MCNK headers (nDoodadRefs, nMapObjRefs)
- Update MCIN offset table (offsets and sizes)
- Update MHDR offset table
- Write fixed ADT files to export directory

Based on binary diff analysis of Noggit Red output (2026-01-18).

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
from typing import List, Tuple, Dict, Set, Optional
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
        self.mhdr_offset = None
        self.mhdr_size = None
        self.mcin_offset = None
        self.mcin_size = None

        # MCNK tracking
        self.mcnk_entries = []  # List of (offset, size) from MCIN

    def read_adt(self) -> bytes:
        """Read entire ADT file as binary data."""
        if not self.adt_path.exists():
            raise FileNotFoundError(f"ADT file not found: {self.adt_path}")

        with open(self.adt_path, 'rb') as f:
            self.data = f.read()

        return self.data

    def scan_chunks(self):
        """Scan ADT and catalog all chunks."""
        known_chunks = ['MVER', 'MMDX', 'MDDF', 'MHDR', 'MCIN', 'MWMO', 'MWID', 'MODF', 'MCNK', 'MTEX', 'MMID', 'MFBO', 'MH2O']

        self.chunks = []
        offset = 0

        while offset < len(self.data) - 8:
            magic, size = read_chunk_header(self.data, offset, known_chunks)

            if magic is None or size < 0 or size > 10000000:
                break

            self.chunks.append((magic, offset, size))

            # Track key chunk locations
            if magic == 'MHDR':
                self.mhdr_offset = offset
                self.mhdr_size = size
            elif magic == 'MODF':
                self.modf_offset = offset
                self.modf_size = size
            elif magic == 'MCIN':
                self.mcin_offset = offset
                self.mcin_size = size
                # Parse MCIN entries
                self._parse_mcin()

            offset += 8 + size

    def _parse_mcin(self):
        """Parse MCIN chunk to get MCNK offsets and sizes."""
        if self.mcin_offset is None:
            return

        mcin_data = self.data[self.mcin_offset + 8:self.mcin_offset + 8 + self.mcin_size]

        self.mcnk_entries = []
        # MCIN has 256 entries, each 16 bytes: offset(4) + size(4) + flags(4) + asyncId(4)
        for i in range(256):
            entry_offset = i * 16
            if entry_offset + 16 > len(mcin_data):
                break
            offset, size, flags, async_id = struct.unpack('<IIII', mcin_data[entry_offset:entry_offset+16])
            self.mcnk_entries.append({'offset': offset, 'size': size, 'flags': flags, 'async_id': async_id})

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
    ) -> Tuple[List[MODFEntry], Dict[int, str], List[int]]:
        """
        Remove duplicate entries, keeping the "best" instance.

        Priority rules:
        1. Keep instance with Flags != 0
        2. Keep instance with Scale != 0
        3. If equal, keep first occurrence

        Returns:
            Tuple of (deduplicated_entries, removal_log, removed_indices)
        """
        # Build mapping from unique_id to original index
        uid_to_idx = {e.unique_id: i for i, e in enumerate(entries)}

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
                'kept_scale': keep_entry.scale,
                'removed_index': uid_to_idx.get(remove_entry.unique_id, -1)
            }

        # Get indices of removed entries (sorted for consistent processing)
        removed_indices = sorted([uid_to_idx[uid] for uid in to_remove if uid in uid_to_idx])

        # Filter out removed entries
        deduplicated = [e for e in entries if e.unique_id not in to_remove]

        return deduplicated, removal_log, removed_indices

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
        # ADT files use little-endian byte order, so chunk magic must be reversed
        new_size = len(chunk_data)
        chunk_header = b'FDOM' + struct.pack('<I', new_size)  # 'MODF' reversed

        return chunk_header + chunk_data

    def _parse_mcnk_header(self, mcnk_data: bytes) -> Dict:
        """Parse MCNK header (128 bytes after 8-byte chunk header)."""
        if len(mcnk_data) < 136:
            return None

        header = mcnk_data[8:136]  # Skip chunk magic + size
        fields = struct.unpack('<20I', header[:80])

        return {
            'flags': fields[0],
            'indexX': fields[1],
            'indexY': fields[2],
            'nLayers': fields[3],
            'nDoodadRefs': fields[4],
            'ofsHeight': fields[5],  # MCVT
            'ofsNormal': fields[6],  # MCNR
            'ofsLayer': fields[7],   # MCLY
            'ofsRefs': fields[8],    # MCRF
            'ofsAlpha': fields[9],   # MCAL
            'sizeAlpha': fields[10],
            'ofsShadow': fields[11],
            'sizeShadow': fields[12],
            'areaid': fields[13],
            'nMapObjRefs': fields[14],
            'holes': fields[15],
        }

    def _get_mcrf_refs(self, mcnk_data: bytes, header: Dict) -> Tuple[List[int], List[int]]:
        """
        Get MCRF references (doodad refs followed by WMO refs).

        Returns:
            Tuple of (doodad_refs, wmo_refs) - lists of indices into MDDF/MODF
        """
        ofs = header['ofsRefs']
        if ofs == 0:
            return [], []

        n_doodad = header['nDoodadRefs']
        n_wmo = header['nMapObjRefs']

        # MCRF starts at ofsRefs (relative to MCNK data after 8-byte chunk header)
        mcrf_start = 8 + ofs

        doodad_refs = []
        wmo_refs = []

        # Read doodad refs
        for i in range(n_doodad):
            ref_offset = mcrf_start + i * 4
            if ref_offset + 4 <= len(mcnk_data):
                ref = struct.unpack('<I', mcnk_data[ref_offset:ref_offset+4])[0]
                doodad_refs.append(ref)

        # Read WMO refs (after doodad refs)
        for i in range(n_wmo):
            ref_offset = mcrf_start + (n_doodad + i) * 4
            if ref_offset + 4 <= len(mcnk_data):
                ref = struct.unpack('<I', mcnk_data[ref_offset:ref_offset+4])[0]
                wmo_refs.append(ref)

        return doodad_refs, wmo_refs

    def _update_mcnk_for_removed_modf(self, mcnk_data: bytes, removed_indices: List[int]) -> Tuple[bytes, int]:
        """
        Update a single MCNK's MCRF to remove references to deleted MODF entries
        and re-index remaining references.

        Args:
            mcnk_data: Raw MCNK chunk data (including 8-byte header)
            removed_indices: Sorted list of MODF indices that were removed

        Returns:
            Tuple of (updated_mcnk_data, size_delta)
        """
        if len(mcnk_data) < 136:
            return mcnk_data, 0

        header = self._parse_mcnk_header(mcnk_data)
        if header is None or header['ofsRefs'] == 0:
            return mcnk_data, 0

        doodad_refs, wmo_refs = self._get_mcrf_refs(mcnk_data, header)

        if not wmo_refs:
            return mcnk_data, 0

        # Build index remapping: old_idx -> new_idx
        # For each removed index, all indices > it shift down by 1
        def remap_index(old_idx: int) -> int:
            new_idx = old_idx
            for removed_idx in removed_indices:
                if old_idx > removed_idx:
                    new_idx -= 1
            return new_idx

        # Filter and remap WMO refs
        new_wmo_refs = []
        for ref in wmo_refs:
            if ref not in removed_indices:
                new_wmo_refs.append(remap_index(ref))

        # If no refs were removed, return unchanged
        refs_removed = len(wmo_refs) - len(new_wmo_refs)
        if refs_removed == 0:
            return mcnk_data, 0

        # Now we need to rebuild the MCNK with updated MCRF
        # The tricky part: MCRF is embedded in MCNK, and shrinking it affects
        # all subsequent sub-chunk offsets within the MCNK

        mcnk_data = bytearray(mcnk_data)

        # Calculate MCRF location and old/new sizes
        mcrf_start = 8 + header['ofsRefs']
        old_mcrf_size = (header['nDoodadRefs'] + header['nMapObjRefs']) * 4
        new_mcrf_size = (header['nDoodadRefs'] + len(new_wmo_refs)) * 4
        mcrf_delta = new_mcrf_size - old_mcrf_size

        # Build new MCRF data
        new_mcrf_data = b''
        # Keep doodad refs unchanged
        for ref in doodad_refs:
            new_mcrf_data += struct.pack('<I', ref)
        # Add remapped WMO refs
        for ref in new_wmo_refs:
            new_mcrf_data += struct.pack('<I', ref)

        # Replace MCRF in MCNK data
        mcrf_end = mcrf_start + old_mcrf_size
        mcnk_data = mcnk_data[:mcrf_start] + new_mcrf_data + mcnk_data[mcrf_end:]

        # Update MCNK header: nMapObjRefs
        # nMapObjRefs is at offset 8 + 14*4 = 8 + 56 = 64 in MCNK data
        struct.pack_into('<I', mcnk_data, 8 + 56, len(new_wmo_refs))

        # Update offsets in MCNK header for sub-chunks after MCRF
        # ofsAlpha (index 9), ofsShadow (index 11) may need adjustment
        # These are at header offsets 9*4=36 and 11*4=44 (relative to header start at byte 8)
        if header['ofsAlpha'] > header['ofsRefs']:
            new_ofs_alpha = header['ofsAlpha'] + mcrf_delta
            struct.pack_into('<I', mcnk_data, 8 + 36, new_ofs_alpha)

        if header['ofsShadow'] > header['ofsRefs']:
            new_ofs_shadow = header['ofsShadow'] + mcrf_delta
            struct.pack_into('<I', mcnk_data, 8 + 44, new_ofs_shadow)

        # Update MCNK chunk size in header (bytes 4-7)
        old_chunk_size = struct.unpack('<I', mcnk_data[4:8])[0]
        new_chunk_size = old_chunk_size + mcrf_delta
        struct.pack_into('<I', mcnk_data, 4, new_chunk_size)

        return bytes(mcnk_data), mcrf_delta

    def update_mhdr_offsets(self, data: bytearray, size_delta: int, modf_end_offset: int) -> bytearray:
        """
        Update MHDR offset table to account for file size changes.

        Args:
            data: Complete ADT file data (mutable)
            size_delta: Total change in file size
            modf_end_offset: Original end offset of MODF chunk

        Returns:
            Updated ADT data with corrected MHDR offsets
        """
        if self.mhdr_offset is None:
            return data

        mhdr_data_offset = self.mhdr_offset + 8
        mhdr_data = data[mhdr_data_offset:mhdr_data_offset + 64]

        if len(mhdr_data) < 64:
            return data

        offsets = list(struct.unpack('<16I', mhdr_data))

        # Adjust offsets that point to chunks after the modification point
        for i in range(len(offsets)):
            if offsets[i] != 0:
                absolute_offset = self.mhdr_offset + offsets[i]
                if absolute_offset > modf_end_offset:
                    offsets[i] = offsets[i] + size_delta

        new_mhdr_data = struct.pack('<16I', *offsets)
        data[mhdr_data_offset:mhdr_data_offset + 64] = new_mhdr_data

        return data

    def write_fixed_adt(self, export_path: Path, new_modf_chunk: bytes, removed_indices: List[int]) -> Tuple[int, Dict]:
        """
        Write fixed ADT with replaced MODF chunk and updated MCRF references.

        Args:
            export_path: Path to write the fixed ADT
            new_modf_chunk: Rebuilt MODF chunk
            removed_indices: Sorted list of MODF indices that were removed

        Returns:
            Tuple of (new_file_size, stats_dict)
        """
        if self.modf_offset is None:
            raise ValueError("No MODF chunk found in original ADT")

        export_path.parent.mkdir(parents=True, exist_ok=True)

        # Calculate MODF size change
        old_modf_chunk_size = 8 + self.modf_size
        new_modf_chunk_size = len(new_modf_chunk)
        modf_size_delta = new_modf_chunk_size - old_modf_chunk_size
        modf_end = self.modf_offset + old_modf_chunk_size

        # Start with original data, replacing MODF
        new_data = bytearray(
            self.data[:self.modf_offset] +
            new_modf_chunk +
            self.data[modf_end:]
        )

        # Track cumulative offset changes for MCIN updates
        # After MODF change, all MCNKs shift by modf_size_delta

        stats = {
            'mcnk_updated': 0,
            'wmo_refs_removed': 0,
            'total_mcrf_delta': 0
        }

        # Process each MCNK to update MCRF references
        # We need to track cumulative offset changes as we modify MCNKs
        cumulative_delta = modf_size_delta
        mcnk_size_deltas = []  # Track size change for each MCNK

        for i, mcnk_entry in enumerate(self.mcnk_entries):
            # Calculate current offset in new_data (accounting for prior changes)
            original_offset = mcnk_entry['offset']
            current_offset = original_offset + cumulative_delta
            original_size = mcnk_entry['size']

            # Extract MCNK data (size + 8 for header)
            mcnk_data = new_data[current_offset:current_offset + original_size + 8]

            if len(mcnk_data) < 136:
                mcnk_size_deltas.append(0)
                continue

            # Update MCRF references
            updated_mcnk, size_delta = self._update_mcnk_for_removed_modf(mcnk_data, removed_indices)

            if size_delta != 0:
                # Replace MCNK in new_data
                new_data = bytearray(
                    new_data[:current_offset] +
                    updated_mcnk +
                    new_data[current_offset + original_size + 8:]
                )
                stats['mcnk_updated'] += 1
                stats['total_mcrf_delta'] += size_delta

            mcnk_size_deltas.append(size_delta)
            cumulative_delta += size_delta

        # Update MCIN offset table
        if self.mcin_offset is not None:
            mcin_data_offset = self.mcin_offset + 8

            # Recalculate all MCIN entries with cumulative offsets
            running_delta = modf_size_delta
            for i, mcnk_entry in enumerate(self.mcnk_entries):
                entry_offset = mcin_data_offset + i * 16

                # Update offset
                new_offset = mcnk_entry['offset'] + running_delta
                struct.pack_into('<I', new_data, entry_offset, new_offset)

                # Update size if it changed
                new_size = mcnk_entry['size'] + mcnk_size_deltas[i]
                struct.pack_into('<I', new_data, entry_offset + 4, new_size)

                # Add this MCNK's delta for next iteration
                running_delta += mcnk_size_deltas[i]

        # Update MHDR offsets
        total_delta = modf_size_delta + stats['total_mcrf_delta']
        new_data = self.update_mhdr_offsets(new_data, total_delta, modf_end)

        # Write to export path
        with open(export_path, 'wb') as f:
            f.write(new_data)

        stats['wmo_refs_removed'] = len(removed_indices)

        return len(new_data), stats


def fix_adt_duplicates(
    adt_path: Path,
    export_path: Path,
    duplicates: List[Tuple[MODFEntry, MODFEntry, float, str]],
    wmo_list: List[str] = None
) -> Dict:
    """
    Fix duplicate WMO placements in an ADT file and export result.

    This function:
    1. Removes duplicate MODF entries based on priority rules
    2. Updates MCRF sub-chunks in all 256 MCNKs (removes refs, re-indexes)
    3. Updates MCNK headers (nMapObjRefs counts)
    4. Updates MCIN offset table (offsets and sizes)
    5. Updates MHDR offset table

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
    deduplicated_entries, removal_log, removed_indices = editor.deduplicate_entries(original_entries, duplicates)
    removed_count = original_count - len(deduplicated_entries)

    if removed_count == 0:
        return {
            'success': False,
            'message': 'No entries to remove after deduplication',
            'removed_count': 0
        }

    # Rebuild MODF chunk
    new_modf_chunk = editor.rebuild_modf_chunk(deduplicated_entries)

    # Write fixed ADT (includes MCRF updates)
    new_size, mcrf_stats = editor.write_fixed_adt(export_path, new_modf_chunk, removed_indices)

    return {
        'success': True,
        'message': f'Fixed ADT exported successfully',
        'original_count': original_count,
        'deduplicated_count': len(deduplicated_entries),
        'removed_count': removed_count,
        'removed_indices': removed_indices,
        'duplicate_pairs': len(duplicates),
        'removal_log': removal_log,
        'original_size': len(editor.data),
        'new_size': new_size,
        'size_delta': new_size - len(editor.data),
        'mcnk_updated': mcrf_stats['mcnk_updated'],
        'total_mcrf_delta': mcrf_stats['total_mcrf_delta'],
        'export_path': str(export_path)
    }
