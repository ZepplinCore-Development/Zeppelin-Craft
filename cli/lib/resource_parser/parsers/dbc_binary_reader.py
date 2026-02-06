#!/usr/bin/env python3
"""
Binary DBC File Reader
Reads AreaTable.dbc and Map.dbc from Open Azeroth DBC files.

DBC Format (WoW 3.3.5a):
- Header: 'WDBC' (4 bytes)
- Record count (4 bytes, uint32)
- Field count (4 bytes, uint32)
- Record size (4 bytes, uint32)
- String block size (4 bytes, uint32)
- Records (record_count * record_size bytes)
- String block (string_block_size bytes, null-terminated strings)
"""

import struct
from pathlib import Path
from typing import Dict, Optional, Tuple


class DBCReader:
    """Generic DBC file reader for WoW 3.3.5a DBC files."""

    def __init__(self, dbc_path: str):
        self.dbc_path = Path(dbc_path)
        self.record_count = 0
        self.field_count = 0
        self.record_size = 0
        self.string_block_size = 0
        self.records = []
        self.string_block = b''

    def read(self):
        """Read and parse DBC file."""
        with open(self.dbc_path, 'rb') as f:
            # Read header
            magic = f.read(4)
            if magic != b'WDBC':
                raise ValueError(f'Invalid DBC file: {self.dbc_path} (magic: {magic})')

            self.record_count = struct.unpack('<I', f.read(4))[0]
            self.field_count = struct.unpack('<I', f.read(4))[0]
            self.record_size = struct.unpack('<I', f.read(4))[0]
            self.string_block_size = struct.unpack('<I', f.read(4))[0]

            # Read all records as raw bytes
            records_data = f.read(self.record_count * self.record_size)

            # Read string block
            self.string_block = f.read(self.string_block_size)

            # Parse records
            for i in range(self.record_count):
                offset = i * self.record_size
                record = records_data[offset:offset + self.record_size]
                self.records.append(record)

    def read_string(self, offset: int) -> str:
        """Read null-terminated string from string block at offset."""
        if offset >= len(self.string_block):
            return ''

        end = self.string_block.find(b'\x00', offset)
        if end == -1:
            end = len(self.string_block)

        try:
            return self.string_block[offset:end].decode('utf-8')
        except UnicodeDecodeError:
            return self.string_block[offset:end].decode('latin1')

    def unpack_record(self, record_index: int, format_string: str):
        """Unpack a record using struct format string."""
        if record_index >= len(self.records):
            return None
        return struct.unpack(format_string, self.records[record_index])


class AreaTableReader:
    """
    AreaTable.dbc reader for WoW 3.3.5a

    Structure (based on WoWDev.wiki):
    - ID (uint32)
    - Map (uint32) - Map.dbc ID
    - ParentArea (uint32) - Parent area ID (zone -> subzone relationship)
    - AreaBit (uint32)
    - Flags (uint32)
    - ... more fields ...
    - Name (string_ref at different offset depending on version)
    """

    def __init__(self, dbc_path: str = None):
        if dbc_path is None:
            dbc_path = '/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/DBFilesClient/AreaTable.dbc'

        self.dbc = DBCReader(dbc_path)
        self.dbc.read()
        self.areas = {}  # {area_id: {'name': str, 'map': int, 'parent': int}}
        self._parse_areas()

    def _parse_areas(self):
        """Parse AreaTable records."""
        # AreaTable.dbc structure (verified against OA AreaTable.dbc):
        # Field offsets (in bytes, each field is 4 bytes):
        # 0: ID (uint32)
        # 4: MapID (uint32)
        # 8: ParentAreaID (uint32)
        # 12: AreaBit (uint32)
        # 16: Flags (uint32)
        # 20-40: various uint32 fields
        # 44: Name string ref (offset into string block) - English locale
        # 52: Level (uint32)

        for i in range(self.dbc.record_count):
            record = self.dbc.records[i]

            # Read key fields
            area_id = struct.unpack('<I', record[0:4])[0]
            map_id = struct.unpack('<I', record[4:8])[0]
            parent_area = struct.unpack('<I', record[8:12])[0]
            flags = struct.unpack('<I', record[16:20])[0]

            # Name is at offset 44 (English locale string reference)
            name_offset = struct.unpack('<I', record[44:48])[0]
            name = self.dbc.read_string(name_offset)

            # Level is at offset 52
            area_level = struct.unpack('<I', record[52:56])[0] if len(record) > 52 else 0

            self.areas[area_id] = {
                'name': name,
                'map': map_id,
                'parent': parent_area,
                'level': area_level,
                'flags': flags
            }

    def get_area(self, area_id: int) -> Optional[Dict]:
        """Get area info by ID."""
        return self.areas.get(area_id)

    def get_areas_by_map(self, map_id: int) -> list:
        """Get all areas for a map."""
        return [
            {'id': aid, **info}
            for aid, info in self.areas.items()
            if info['map'] == map_id
        ]


class MapDBCReader:
    """Map.dbc reader for map ID to name mapping."""

    def __init__(self, dbc_path: str = None):
        if dbc_path is None:
            dbc_path = '/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/DBFilesClient/Map.dbc'

        self.dbc = DBCReader(dbc_path)
        self.dbc.read()
        self.maps = {}  # {map_id: name}
        self._parse_maps()

    def _parse_maps(self):
        """Parse Map.dbc records."""
        # Map.dbc structure (simplified):
        # 0: ID (uint32)
        # 4: Internal name (string ref)
        # ... more fields ...

        for i in range(self.dbc.record_count):
            record = self.dbc.records[i]

            map_id = struct.unpack('<I', record[0:4])[0]
            internal_name_offset = struct.unpack('<I', record[4:8])[0]
            internal_name = self.dbc.read_string(internal_name_offset)

            # Display names are at later offsets (localized)
            # Offset 12 is usually the English name
            display_name_offset = struct.unpack('<I', record[12:16])[0] if len(record) > 12 else 0
            display_name = self.dbc.read_string(display_name_offset) if display_name_offset else internal_name

            self.maps[map_id] = {
                'internal': internal_name,
                'display': display_name if display_name else internal_name
            }

    def get_map_name(self, map_id: int) -> str:
        """Get display name for map ID."""
        map_info = self.maps.get(map_id, {})
        return map_info.get('display', f'Map {map_id}')


class AreaPOIReader:
    """
    AreaPOI.dbc reader for coordinate-based zone lookup.

    AreaPOI contains Points of Interest with world coordinates.
    Used to determine which zone an ADT belongs to.
    """

    def __init__(self, dbc_path: str = None):
        if dbc_path is None:
            dbc_path = '/workspace/project/Zeppelin-Tools/Open Azeroth/Patch-O/DBFilesClient/AreaPOI.dbc'

        self.dbc = DBCReader(dbc_path)
        self.dbc.read()
        self.pois = []  # List of POIs with coordinates
        self._parse_pois()

    def _parse_pois(self):
        """Parse AreaPOI.dbc records."""
        # AreaPOI.dbc structure (WoW 3.3.5a):
        # 0: ID (uint32)
        # 4: MapID (uint32)
        # 8: AreaID (uint32) - AreaTable.dbc reference
        # 12: Name (string ref)
        # ... more fields ...
        # 48: X (float) - World X coordinate
        # 52: Y (float) - World Y coordinate
        # 56: Z (float) - World Z coordinate

        for i in range(self.dbc.record_count):
            record = self.dbc.records[i]

            poi_id = struct.unpack('<I', record[0:4])[0]
            map_id = struct.unpack('<I', record[4:8])[0]
            area_id = struct.unpack('<I', record[8:12])[0]

            # String reference at offset 12
            name_offset = struct.unpack('<I', record[12:16])[0]
            name = self.dbc.read_string(name_offset)

            # Coordinates at offsets 48, 52, 56
            x = struct.unpack('<f', record[48:52])[0]
            y = struct.unpack('<f', record[52:56])[0]
            z = struct.unpack('<f', record[56:60])[0]

            self.pois.append({
                'id': poi_id,
                'map_id': map_id,
                'area_id': area_id,
                'name': name,
                'x': x,
                'y': y,
                'z': z
            })

    def find_poi_in_bounds(self, map_id: int, x_min: float, x_max: float,
                           y_min: float, y_max: float) -> Optional[Dict]:
        """
        Find a POI within the given bounding box.

        Args:
            map_id: Map ID to search
            x_min, x_max: X coordinate range
            y_min, y_max: Y coordinate range

        Returns:
            First POI found within bounds, or None
        """
        for poi in self.pois:
            if poi['map_id'] != map_id:
                continue

            if (x_min <= poi['x'] <= x_max and y_min <= poi['y'] <= y_max):
                return poi

        return None

    def get_area_id_from_coordinates(self, map_id: int, x: float, y: float) -> Optional[int]:
        """
        Find which zone contains the given world coordinates.

        Args:
            map_id: Map ID (0=EK, 1=Kalimdor, 530=Outland, 571=Northrend)
            x: World X coordinate
            y: World Y coordinate

        Returns:
            AreaTable.dbc area ID, or None if not found
        """
        # Find closest POI on same map
        closest_poi = None
        closest_dist = float('inf')

        for poi in self.pois:
            if poi['map_id'] != map_id:
                continue

            # Calculate distance
            dx = poi['x'] - x
            dy = poi['y'] - y
            dist = (dx * dx) + (dy * dy)

            if dist < closest_dist:
                closest_dist = dist
                closest_poi = poi

        if closest_poi:
            return closest_poi['area_id']

        return None


def main():
    """Test DBC readers."""
    print('Testing AreaTable.dbc reader...\n')

    area_table = AreaTableReader()
    print(f'Loaded {len(area_table.areas)} areas from AreaTable.dbc')

    # Test: Find Lost Isles
    lost_isles = [
        (aid, info) for aid, info in area_table.areas.items()
        if 'lost' in info['name'].lower() or 'isle' in info['name'].lower()
    ]

    print(f'\nAreas matching "Lost" or "Isle": {len(lost_isles)}')
    for aid, info in lost_isles[:10]:
        print(f'  [{aid}] {info["name"]:40s} Map: {info["map"]:3d} Parent: {info["parent"]:5d}')

    # Test: Find Gilneas
    gilneas = [
        (aid, info) for aid, info in area_table.areas.items()
        if 'gilneas' in info['name'].lower()
    ]

    print(f'\nAreas matching "Gilneas": {len(gilneas)}')
    for aid, info in gilneas[:10]:
        print(f'  [{aid}] {info["name"]:40s} Map: {info["map"]:3d} Parent: {info["parent"]:5d}')

    # Test Map.dbc
    print('\n' + '='*80)
    print('Testing Map.dbc reader...\n')

    map_dbc = MapDBCReader()
    print(f'Loaded {len(map_dbc.maps)} maps from Map.dbc')

    print('\nKnown maps:')
    for map_id in [0, 1, 530, 571, 732, 860]:
        name = map_dbc.get_map_name(map_id)
        print(f'  Map {map_id:3d}: {name}')


if __name__ == '__main__':
    main()
