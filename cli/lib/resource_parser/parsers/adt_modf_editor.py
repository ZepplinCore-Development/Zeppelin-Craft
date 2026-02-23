#!/usr/bin/env python3
"""
ADT Chunk Editor
Fixes WMO duplicate placements and corrupt doodad cell assignments in ADT files.

This module provides functions to:
- Read ADT files as binary data
- Locate and parse MODF/MDDF chunks
- Deduplicate WMO placements based on position/flags/scale
- Recalculate doodad cell assignments (MCRF doodad refs + nDoodadRefs)
- Update MCRF sub-chunks in all 256 MCNKs
- Update MCIN offset table (offsets and sizes)
- Update MHDR offset table
- Write fixed ADT files to export directory

Based on binary diff analysis of Noggit Red output (2026-01-18, 2026-02-22).

Usage:
    from parsers.adt_modf_editor import fix_adt_duplicates, fix_adt_doodad_cells

    fix_adt_duplicates(
        adt_path="/path/to/source.adt",
        export_path="/path/to/export/source.adt",
        duplicates=[(entry1, entry2, distance, wmo_name), ...],
        wmo_list=["path/to/wmo1.wmo", ...]
    )

    fix_adt_doodad_cells(
        adt_path="/path/to/source.adt",
        export_path="/path/to/export/source.adt"
    )
"""

import math
import struct
from pathlib import Path
from typing import List, Tuple, Dict, Set, Optional
from .adt_parser import MODFEntry
from .chunk_utils import read_chunk_header


class ADTMODFEditor:
    """Editor for fixing WMO duplicates and doodad cell assignments in ADT files."""

    # ADT cell grid constants
    TILE_SIZE = 533.33333  # One ADT tile in game yards
    CELL_SIZE = TILE_SIZE / 16  # One cell = 33.33333 yards (16x16 grid per tile)

    def __init__(self, adt_path: Path):
        self.adt_path = adt_path
        self.data = None
        self.chunks = []  # List of (magic, offset, size) tuples
        self.modf_offset = None
        self.modf_size = None
        self.mddf_offset = None
        self.mddf_size = None
        self.mmdx_offset = None
        self.mmdx_size = None
        self.mmid_offset = None
        self.mmid_size = None
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
            elif magic == 'MDDF':
                self.mddf_offset = offset
                self.mddf_size = size
            elif magic == 'MMDX':
                self.mmdx_offset = offset
                self.mmdx_size = size
            elif magic == 'MMID':
                self.mmid_offset = offset
                self.mmid_size = size
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

    def _parse_mddf_entries(self) -> List[Dict]:
        """Parse all MDDF entries (M2 doodad placements, 36 bytes each)."""
        if self.mddf_offset is None or self.mddf_size is None:
            return []

        entries = []
        chunk_data = self.data[self.mddf_offset + 8 : self.mddf_offset + 8 + self.mddf_size]

        entry_size = 36
        num_entries = self.mddf_size // entry_size

        for i in range(num_entries):
            offset = i * entry_size
            entry_data = chunk_data[offset:offset + entry_size]
            if len(entry_data) < entry_size:
                break

            try:
                unpacked = struct.unpack('<II3f3fHH', entry_data)
                entries.append({
                    'index': i,
                    'name_id': unpacked[0],
                    'unique_id': unpacked[1],
                    'position': (unpacked[2], unpacked[3], unpacked[4]),
                    'rotation': (unpacked[5], unpacked[6], unpacked[7]),
                    'scale': unpacked[8],
                    'flags': unpacked[9],
                })
            except struct.error:
                continue

        return entries

    def _parse_model_paths(self) -> List[str]:
        """Parse MMDX/MMID chunks to get ordered model paths indexed by MDDF name_id."""
        if self.mmdx_offset is None or self.mmid_offset is None:
            return []

        mmdx_data = self.data[self.mmdx_offset + 8 : self.mmdx_offset + 8 + self.mmdx_size]
        mmid_data = self.data[self.mmid_offset + 8 : self.mmid_offset + 8 + self.mmid_size]
        num_models = self.mmid_size // 4

        paths = []
        for i in range(num_models):
            ofs = struct.unpack('<I', mmid_data[i*4:i*4+4])[0]
            try:
                end = mmdx_data.index(b'\x00', ofs)
                path = mmdx_data[ofs:end].decode('ascii', errors='ignore')
                paths.append(path)
            except (ValueError, IndexError):
                paths.append('')

        return paths

    @staticmethod
    def read_m2_horizontal_extents(m2_path: Path) -> Tuple[float, float]:
        """
        Read horizontal bounding extents from an M2 model file.

        Uses the vertex bounding box at offset 0xA0 in the MD20 header.
        Returns (dx, dy) half-extents in the model's horizontal plane,
        suitable for rotation-aware AABB cell assignment.

        Args:
            m2_path: Path to M2 model file

        Returns:
            Tuple of (dx, dy) half-extents in model-space yards, or (0.0, 0.0).
        """
        try:
            with open(m2_path, 'rb') as f:
                data = f.read(0xB8)
            if len(data) < 0xB8:
                return (0.0, 0.0)

            # Vertex bounding box at 0xA0: min(x,y,z) then max(x,y,z)
            # M2 model space: X/Y = horizontal, Z = up (height)
            vbox_min = struct.unpack('<3f', data[0xA0:0xAC])
            vbox_max = struct.unpack('<3f', data[0xAC:0xB8])

            dx = max(abs(vbox_min[0]), abs(vbox_max[0]))
            dy = max(abs(vbox_min[1]), abs(vbox_max[1]))
            return (dx, dy)
        except (OSError, struct.error):
            return (0.0, 0.0)

    @staticmethod
    def read_m2_horizontal_radius(m2_path: Path) -> float:
        """Read horizontal bounding radius (enclosing circle of XY extent)."""
        dx, dy = ADTMODFEditor.read_m2_horizontal_extents(m2_path)
        return math.sqrt(dx * dx + dy * dy)

    # Map center constant for MDDF-to-MCNK coordinate conversion
    MAP_CENTER = 17066.666

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

        result = {
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

        # Extended fields from bytes 80-127 of the header
        # 0x58 (88): ofsMCSE, 0x60 (96): ofsMCLQ, 0x68 (104): position (3 floats)
        # 0x74 (116): ofsMCCV, 0x78 (120): ofsMCLV
        if len(header) >= 128:
            result['ofsMCSE'] = struct.unpack('<I', header[0x58:0x5C])[0]
            result['ofsMCLQ'] = struct.unpack('<I', header[0x60:0x64])[0]
            pos_x, pos_y, pos_z = struct.unpack('<3f', header[0x68:0x74])
            result['position'] = (pos_x, pos_y, pos_z)
            result['ofsMCCV'] = struct.unpack('<I', header[0x74:0x78])[0]
            result['ofsMCLV'] = struct.unpack('<I', header[0x78:0x7C])[0]

        return result

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

    def _cascade_mcnk_offsets(self, mcnk_data: bytearray, header: Dict, delta: int):
        """
        Update all MCNK sub-chunk offset fields that come after MCRF when MCRF size changes.

        Args:
            mcnk_data: Mutable MCNK data (including 8-byte chunk header)
            header: Parsed MCNK header dict
            delta: Size change of MCRF data (positive = grew, negative = shrank)
        """
        if delta == 0:
            return

        ofs_refs = header['ofsRefs']

        # (header_field_name, byte_offset_in_header)
        offset_fields = [
            ('ofsAlpha',  0x24),
            ('ofsShadow', 0x2C),
            ('ofsMCSE',   0x58),
            ('ofsMCLQ',   0x60),
            ('ofsMCCV',   0x74),
            ('ofsMCLV',   0x78),
        ]

        for field_name, hdr_offset in offset_fields:
            val = header.get(field_name, 0)
            if val > 0 and val > ofs_refs:
                struct.pack_into('<I', mcnk_data, 8 + hdr_offset, val + delta)

    def _parse_cell_positions(self) -> List[Optional[Tuple[float, float]]]:
        """
        Read position (x, y) from all 256 MCNK headers.

        Returns:
            List of 256 (mcnk_x, mcnk_y) tuples (northwest corner of each cell),
            or None for unreadable cells.
        """
        positions = []
        for mcnk_entry in self.mcnk_entries:
            offset = mcnk_entry['offset']
            mcnk_data = self.data[offset:offset + mcnk_entry['size'] + 8]
            if len(mcnk_data) < 136:
                positions.append(None)
                continue
            header = self._parse_mcnk_header(mcnk_data)
            if header is None or 'position' not in header:
                positions.append(None)
            else:
                positions.append((header['position'][0], header['position'][1]))
        return positions

    @staticmethod
    def _mddf_to_mcnk_coords(mddf_pos: Tuple[float, float, float]) -> Tuple[float, float]:
        """
        Convert MDDF world position to MCNK coordinate space.

        MDDF stores (x, y, z) where y is height and x/z are horizontal.
        MCNK stores (x, y, z) where x/y are horizontal and z is height.
        Both use MAP_CENTER-based offsets but with swapped axes.
        """
        return (
            ADTMODFEditor.MAP_CENTER - mddf_pos[2],   # MDDF Z → MCNK X (north-south)
            ADTMODFEditor.MAP_CENTER - mddf_pos[0],   # MDDF X → MCNK Y (west-east)
        )

    @staticmethod
    def _sphere_intersects_cell(cx: float, cy: float, radius: float,
                                 cell_x: float, cell_y: float,
                                 cell_size: float) -> bool:
        """
        Test if circle at (cx, cy) with radius intersects a cell's AABB.

        Cell AABB: northwest corner at (cell_x, cell_y), extends south and east
        by cell_size. So bounds are [cell_x - cell_size, cell_x] x [cell_y - cell_size, cell_y].
        """
        min_x = cell_x - cell_size
        max_x = cell_x
        min_y = cell_y - cell_size
        max_y = cell_y

        # Nearest point on AABB to circle center
        nearest_x = max(min_x, min(cx, max_x))
        nearest_y = max(min_y, min(cy, max_y))
        dx = cx - nearest_x
        dy = cy - nearest_y
        return dx * dx + dy * dy <= radius * radius

    def recalculate_doodad_cells(self,
                                model_extents: Optional[Dict[int, Tuple[float, float]]] = None,
                                model_radii: Optional[Dict[int, float]] = None) -> Dict[int, List[int]]:
        """
        Recalculate which MDDF doodads belong to which MCNK cells.

        Uses rotation-aware AABB intersection: each doodad's model-space bounding
        box is rotated by the MDDF ground rotation, then tested for AABB overlap
        with each cell.

        Args:
            model_extents: Dict mapping MDDF name_id → (dx, dy) horizontal
                          half-extents in model-space yards. Preferred over model_radii.
            model_radii: Legacy fallback — Dict mapping name_id → radius.
                        Converted to extents as (r/sqrt(2), r/sqrt(2)).

        Returns:
            Dict mapping cell_index (0-255) to list of MDDF indices.
            Empty dict if no MDDF entries found.
        """
        mddf_entries = self._parse_mddf_entries()
        if not mddf_entries:
            return {}

        cell_positions = self._parse_cell_positions()
        if not cell_positions or cell_positions[0] is None:
            return {}

        # Normalize to extents dict
        extents = {}
        if model_extents:
            extents = model_extents
        elif model_radii:
            # Convert radius to approximate square extents
            inv_sqrt2 = 1.0 / math.sqrt(2.0)
            extents = {k: (v * inv_sqrt2, v * inv_sqrt2) for k, v in model_radii.items()}

        # Build new cell assignments
        cell_doodads = {i: [] for i in range(256)}

        for entry in mddf_entries:
            idx = entry['index']
            scale = entry['scale'] / 1024.0
            ext = extents.get(entry['name_id'], (0.0, 0.0))
            model_dx = ext[0] * scale
            model_dy = ext[1] * scale

            # Convert MDDF position to MCNK coordinate space
            doodad_x, doodad_y = self._mddf_to_mcnk_coords(entry['position'])

            if model_dx <= 0 and model_dy <= 0:
                # No extent data — assign to center cell only
                origin = cell_positions[0]
                if origin is None:
                    continue
                rel_x = origin[0] - doodad_x
                rel_y = origin[1] - doodad_y
                row = max(0, min(15, int(rel_x / self.CELL_SIZE)))
                col = max(0, min(15, int(rel_y / self.CELL_SIZE)))
                cell_doodads[row * 16 + col].append(idx)
            else:
                # Rotation-aware AABB: rotate model bbox by MDDF ground rotation
                ry_rad = math.radians(entry['rotation'][1])
                cos_r = abs(math.cos(ry_rad))
                sin_r = abs(math.sin(ry_rad))

                # Rotated AABB half-extents in world horizontal plane
                world_dx = model_dx * cos_r + model_dy * sin_r
                world_dy = model_dx * sin_r + model_dy * cos_r

                # Map to MCNK coordinate axes
                # _mddf_to_mcnk_coords: MDDF Z → MCNK X, MDDF X → MCNK Y
                # Model X → world MDDF X → MCNK Y, Model Y → world MDDF Z → MCNK X
                extent_mcnk_x = world_dy
                extent_mcnk_y = world_dx

                # Doodad AABB in MCNK space
                d_min_x = doodad_x - extent_mcnk_x
                d_max_x = doodad_x + extent_mcnk_x
                d_min_y = doodad_y - extent_mcnk_y
                d_max_y = doodad_y + extent_mcnk_y

                # Test AABB overlap against all 256 cells
                for ci in range(256):
                    cp = cell_positions[ci]
                    if cp is None:
                        continue
                    # Cell AABB: NW corner at (cp_x, cp_y), extends south/east
                    c_min_x = cp[0] - self.CELL_SIZE
                    c_max_x = cp[0]
                    c_min_y = cp[1] - self.CELL_SIZE
                    c_max_y = cp[1]

                    if (d_min_x <= c_max_x and d_max_x >= c_min_x and
                            d_min_y <= c_max_y and d_max_y >= c_min_y):
                        cell_doodads[ci].append(idx)

        return cell_doodads

    def _update_mcnk_doodad_refs(self, mcnk_data: bytes,
                                  new_doodad_refs: List[int]) -> Tuple[bytes, int, bool]:
        """
        Update a single MCNK's MCRF doodad references while preserving WMO refs.

        Args:
            mcnk_data: Raw MCNK chunk data (including 8-byte header)
            new_doodad_refs: Correct MDDF indices for this cell

        Returns:
            Tuple of (updated_mcnk_data, size_delta, was_modified)
        """
        if len(mcnk_data) < 136:
            return mcnk_data, 0, False

        header = self._parse_mcnk_header(mcnk_data)
        if header is None or header['ofsRefs'] == 0:
            # No MCRF sub-chunk exists
            if new_doodad_refs:
                # Would need to create MCRF — skip with warning
                pass
            return mcnk_data, 0, False

        old_doodad_refs, wmo_refs = self._get_mcrf_refs(mcnk_data, header)

        # Check if anything changed
        if old_doodad_refs == new_doodad_refs:
            return mcnk_data, 0, False

        mcnk_data = bytearray(mcnk_data)

        # Calculate MCRF location and sizes
        mcrf_start = 8 + header['ofsRefs']
        old_mcrf_size = (header['nDoodadRefs'] + header['nMapObjRefs']) * 4
        new_mcrf_size = (len(new_doodad_refs) + header['nMapObjRefs']) * 4
        mcrf_delta = new_mcrf_size - old_mcrf_size

        # Build new MCRF data: new doodad refs + existing WMO refs
        new_mcrf_data = b''
        for ref in new_doodad_refs:
            new_mcrf_data += struct.pack('<I', ref)
        for ref in wmo_refs:
            new_mcrf_data += struct.pack('<I', ref)

        # Replace MCRF data in MCNK
        mcrf_end = mcrf_start + old_mcrf_size
        mcnk_data = mcnk_data[:mcrf_start] + new_mcrf_data + mcnk_data[mcrf_end:]

        # Update MCRF chunk size header
        mcrf_size_offset = 8 + header['ofsRefs'] - 4
        struct.pack_into('<I', mcnk_data, mcrf_size_offset, new_mcrf_size)

        # Update nDoodadRefs in MCNK header (offset 0x10 = 16 from header start = 24 from data start)
        struct.pack_into('<I', mcnk_data, 8 + 0x10, len(new_doodad_refs))

        # Update all sub-chunk offsets after MCRF
        self._cascade_mcnk_offsets(mcnk_data, header, mcrf_delta)

        # Update MCNK chunk size
        old_chunk_size = struct.unpack('<I', mcnk_data[4:8])[0]
        struct.pack_into('<I', mcnk_data, 4, old_chunk_size + mcrf_delta)

        return bytes(mcnk_data), mcrf_delta, True

    def write_fixed_adt_doodads(self, export_path: Path,
                                 cell_doodads: Dict[int, List[int]]) -> Tuple[int, Dict]:
        """
        Write fixed ADT with recalculated doodad cell assignments.

        Args:
            export_path: Path to write the fixed ADT
            cell_doodads: Dict mapping cell_index (0-255) to MDDF indices

        Returns:
            Tuple of (new_file_size, stats_dict)
        """
        export_path.parent.mkdir(parents=True, exist_ok=True)

        new_data = bytearray(self.data)

        stats = {
            'cells_modified': 0,
            'total_mcrf_delta': 0,
        }

        # Process each MCNK to update doodad refs
        cumulative_delta = 0
        mcnk_size_deltas = []

        for i, mcnk_entry in enumerate(self.mcnk_entries):
            original_offset = mcnk_entry['offset']
            current_offset = original_offset + cumulative_delta
            original_size = mcnk_entry['size']

            # Extract MCNK data
            mcnk_data = new_data[current_offset:current_offset + original_size + 8]

            if len(mcnk_data) < 136:
                mcnk_size_deltas.append(0)
                continue

            # Get new doodad refs for this cell
            new_doodad_refs = cell_doodads.get(i, [])

            # Update doodad refs
            updated_mcnk, size_delta, was_modified = self._update_mcnk_doodad_refs(
                mcnk_data, new_doodad_refs
            )

            if was_modified:
                new_data = bytearray(
                    new_data[:current_offset] +
                    updated_mcnk +
                    new_data[current_offset + original_size + 8:]
                )
                stats['cells_modified'] += 1
                stats['total_mcrf_delta'] += size_delta

            mcnk_size_deltas.append(size_delta)
            cumulative_delta += size_delta

        # Update MCIN offset table
        if self.mcin_offset is not None:
            mcin_data_offset = self.mcin_offset + 8

            running_delta = 0
            for i, mcnk_entry in enumerate(self.mcnk_entries):
                entry_offset = mcin_data_offset + i * 16

                new_offset = mcnk_entry['offset'] + running_delta
                struct.pack_into('<I', new_data, entry_offset, new_offset)

                new_size = mcnk_entry['size'] + mcnk_size_deltas[i]
                struct.pack_into('<I', new_data, entry_offset + 4, new_size)

                running_delta += mcnk_size_deltas[i]

        # Update MHDR offsets for chunks after MCNKs
        if stats['total_mcrf_delta'] != 0:
            first_mcnk_offset = self.mcnk_entries[0]['offset'] if self.mcnk_entries else 0
            new_data = self.update_mhdr_offsets(
                new_data,
                modf_size_delta=0,
                total_delta=stats['total_mcrf_delta'],
                modf_end_offset=0,
                first_mcnk_offset=first_mcnk_offset
            )

        # Write to export path
        with open(export_path, 'wb') as f:
            f.write(new_data)

        return len(new_data), stats

    def _update_mcnk_for_removed_modf(self, mcnk_data: bytes, removed_indices: List[int]) -> Tuple[bytes, int, bool]:
        """
        Update a single MCNK's MCRF to remove references to deleted MODF entries
        and re-index remaining references.

        Args:
            mcnk_data: Raw MCNK chunk data (including 8-byte header)
            removed_indices: Sorted list of MODF indices that were removed

        Returns:
            Tuple of (updated_mcnk_data, size_delta, was_modified)
        """
        if len(mcnk_data) < 136:
            return mcnk_data, 0, False

        header = self._parse_mcnk_header(mcnk_data)
        if header is None or header['ofsRefs'] == 0:
            return mcnk_data, 0, False

        doodad_refs, wmo_refs = self._get_mcrf_refs(mcnk_data, header)

        if not wmo_refs:
            return mcnk_data, 0, False

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
        needs_reindex = False
        for ref in wmo_refs:
            if ref not in removed_indices:
                remapped = remap_index(ref)
                new_wmo_refs.append(remapped)
                if remapped != ref:
                    needs_reindex = True

        # If no refs were removed AND no refs need re-indexing, return unchanged
        refs_removed = len(wmo_refs) - len(new_wmo_refs)
        if refs_removed == 0 and not needs_reindex:
            return mcnk_data, 0, False  # (data, size_delta, was_modified)

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

        # Update MCRF chunk size in its header (4 bytes before ofsRefs)
        # MCRF chunk: [magic 4 bytes][size 4 bytes][refs data]
        # ofsRefs points to refs data, so size field is at ofsRefs - 4 (relative to MCNK data start after 8-byte header)
        mcrf_size_offset = 8 + header['ofsRefs'] - 4
        struct.pack_into('<I', mcnk_data, mcrf_size_offset, new_mcrf_size)

        # Update MCNK header: nMapObjRefs
        # nMapObjRefs is at offset 8 + 14*4 = 8 + 56 = 64 in MCNK data
        struct.pack_into('<I', mcnk_data, 8 + 56, len(new_wmo_refs))

        # Update all sub-chunk offsets after MCRF
        self._cascade_mcnk_offsets(mcnk_data, header, mcrf_delta)

        # Update MCNK chunk size in header (bytes 4-7)
        old_chunk_size = struct.unpack('<I', mcnk_data[4:8])[0]
        new_chunk_size = old_chunk_size + mcrf_delta
        struct.pack_into('<I', mcnk_data, 4, new_chunk_size)

        return bytes(mcnk_data), mcrf_delta, True  # (data, size_delta, was_modified)

    def update_mhdr_offsets(self, data: bytearray, modf_size_delta: int, total_delta: int,
                            modf_end_offset: int, first_mcnk_offset: int) -> bytearray:
        """
        Update MHDR offset table to account for file size changes.

        Chunks between MODF and MCNKs (like MH2O) need only modf_size_delta.
        Chunks after all MCNKs (like MFBO) need total_delta (modf + mcrf changes).

        Args:
            data: Complete ADT file data (mutable)
            modf_size_delta: Change in MODF chunk size
            total_delta: Total file size change (modf + mcrf deltas)
            modf_end_offset: Original end offset of MODF chunk
            first_mcnk_offset: Original offset of first MCNK chunk

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

        # MHDR offsets are relative to MHDR data start (mhdr_offset + 8)
        mhdr_base = self.mhdr_offset + 8

        # Adjust offsets based on where the chunk is located
        for i in range(len(offsets)):
            if offsets[i] != 0:
                absolute_offset = mhdr_base + offsets[i]

                # Chunks at or after MODF end need adjustment
                if absolute_offset >= modf_end_offset:
                    if absolute_offset >= first_mcnk_offset:
                        # Chunk is after MCNKs - apply total delta (modf + mcrf changes)
                        offsets[i] = offsets[i] + total_delta
                    else:
                        # Chunk is between MODF and MCNKs - apply only modf delta
                        offsets[i] = offsets[i] + modf_size_delta

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
            updated_mcnk, size_delta, was_modified = self._update_mcnk_for_removed_modf(mcnk_data, removed_indices)

            if was_modified:
                # Replace MCNK in new_data (even if size_delta == 0, refs may have been remapped)
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
        # Need first MCNK offset to distinguish between chunks before/after MCNKs
        first_mcnk_offset = self.mcnk_entries[0]['offset'] if self.mcnk_entries else modf_end
        total_delta = modf_size_delta + stats['total_mcrf_delta']
        new_data = self.update_mhdr_offsets(new_data, modf_size_delta, total_delta,
                                            modf_end, first_mcnk_offset)

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


def fix_adt_doodad_cells(adt_path: Path, export_path: Path,
                         model_extents: Dict[int, Tuple[float, float]] = None,
                         model_radii: Dict[int, float] = None) -> Dict:
    """
    Fix doodad cell assignments in an ADT file and export result.

    Recalculates which MDDF doodads belong to which MCNK cells based on
    position data and M2 horizontal bounding extents, fixing corrupt MCRF
    doodad references and nDoodadRefs.

    Args:
        adt_path: Source ADT file path
        export_path: Export destination path
        model_extents: Dict mapping MDDF name_id → (dx, dy) half-extents.
                      Preferred over model_radii.
        model_radii: Legacy fallback — Dict mapping name_id → radius.

    Returns:
        Dict with fix statistics
    """
    editor = ADTMODFEditor(adt_path)

    # Read and scan ADT
    editor.read_adt()
    editor.scan_chunks()

    # Check for MDDF chunk
    if editor.mddf_offset is None:
        return {
            'success': False,
            'message': 'No MDDF chunk found',
            'cells_modified': 0,
        }

    # Recalculate cell assignments
    cell_doodads = editor.recalculate_doodad_cells(
        model_extents=model_extents,
        model_radii=model_radii,
    )
    if not cell_doodads:
        return {
            'success': False,
            'message': 'No MDDF entries or cell positions found',
            'cells_modified': 0,
        }

    # Write fixed ADT
    new_size, stats = editor.write_fixed_adt_doodads(export_path, cell_doodads)

    return {
        'success': True,
        'message': 'Doodad cell assignments recalculated',
        'cells_modified': stats['cells_modified'],
        'total_mcrf_delta': stats['total_mcrf_delta'],
        'original_size': len(editor.data),
        'new_size': new_size,
        'export_path': str(export_path),
    }
