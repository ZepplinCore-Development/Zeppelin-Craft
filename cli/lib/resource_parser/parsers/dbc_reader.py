#!/usr/bin/env python3
"""
DBC Area Table Reader
Reads area names from the DBC database to map ADT coordinates to zone names.

The DBC database contains AreaTable with zone names mapped to coordinates.
This allows us to show "Lost Isles" instead of just "kalimdor_43_12.adt".
"""

import mysql.connector
from pathlib import Path
from typing import Dict, Tuple, Optional
import re


class DBCAreaReader:
    """Reads area names from DBC database for ADT coordinate mapping."""

    def __init__(self, host='192.168.0.55', port=3306, user='spell-editor',
                 password='HW8Y%L6&f0ePJO', database='dbc'):
        """
        Initialize DBC connection.

        Args:
            host: MySQL host
            port: MySQL port
            user: Database user
            password: Database password
            database: Database name (default: dbc)
        """
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database

        # Cache of area data
        self.areas = {}  # {area_id: {'name': str, 'map': int, 'zone': int}}
        self.map_areas = {}  # {map_id: [area_ids]}

        # Map ID to name mapping
        self.map_names = {
            0: 'Eastern Kingdoms (Azeroth)',
            1: 'Kalimdor',
            530: 'Outland',
            571: 'Northrend',
            732: 'The Maelstrom',
            860: 'Deepholm'
        }

    def connect(self):
        """Connect to DBC database and load area data."""
        try:
            conn = mysql.connector.connect(
                host=self.host,
                port=self.port,
                user=self.user,
                password=self.password,
                database=self.database
            )

            cursor = conn.cursor(dictionary=True)

            # Load all areas
            cursor.execute("""
                SELECT ID, Map, zone, Name1, area_level, Flags
                FROM areatable
                ORDER BY Map, ID
            """)

            for row in cursor.fetchall():
                area_id = row['ID']
                map_id = row['Map']

                self.areas[area_id] = {
                    'name': row['Name1'] or f'Area {area_id}',
                    'map': map_id,
                    'zone': row['zone'],
                    'level': row['area_level'],
                    'flags': row['Flags']
                }

                # Index by map
                if map_id not in self.map_areas:
                    self.map_areas[map_id] = []
                self.map_areas[map_id].append(area_id)

            cursor.close()
            conn.close()

            print(f'✅ Loaded {len(self.areas)} areas from DBC database')

        except mysql.connector.Error as e:
            print(f'⚠️  Warning: Could not connect to DBC database: {e}')
            print('   Area names will not be available in reports.')

    def parse_adt_filename(self, adt_path: str) -> Optional[Tuple[str, int, int]]:
        """
        Parse ADT filename to extract map name and coordinates.

        Args:
            adt_path: Path to ADT file (e.g., /path/to/kalimdor_43_12.adt)

        Returns:
            Tuple of (map_name, x, y) or None if parsing fails

        Examples:
            "kalimdor_43_12.adt" -> ("kalimdor", 43, 12)
            "azeroth_32_45.adt" -> ("azeroth", 32, 45)
        """
        filename = Path(adt_path).name.lower()

        # Pattern: mapname_X_Y.adt
        match = re.match(r'([a-z]+)_(\d+)_(\d+)\.adt', filename)
        if match:
            map_name = match.group(1)
            x = int(match.group(2))
            y = int(match.group(3))
            return (map_name, x, y)

        return None

    def get_map_id_from_name(self, map_name: str) -> Optional[int]:
        """
        Get map ID from map name.

        Args:
            map_name: Map name (e.g., "kalimdor", "azeroth")

        Returns:
            Map ID or None
        """
        map_name_lower = map_name.lower()

        # Common map names
        name_to_id = {
            'azeroth': 0,
            'kalimdor': 1,
            'outland': 530,
            'expansion01': 530,
            'northrend': 571,
            'maelstrom': 732,
            'maelstromshaman': 732,
            'deepholm': 860,
            'deephome': 860
        }

        return name_to_id.get(map_name_lower)

    def get_areas_for_map(self, map_name: str) -> list:
        """
        Get all areas for a given map.

        Args:
            map_name: Map name (e.g., "kalimdor")

        Returns:
            List of area dicts with name, level, etc.
        """
        map_id = self.get_map_id_from_name(map_name)
        if map_id is None:
            return []

        area_ids = self.map_areas.get(map_id, [])
        return [self.areas[aid] for aid in area_ids if aid in self.areas]

    def guess_area_from_coords(self, map_name: str, x: int, y: int) -> Optional[str]:
        """
        Attempt to guess area name from ADT coordinates.

        This is approximate - DBC doesn't store ADT coordinates directly.
        We use heuristics based on known coordinate ranges.

        Args:
            map_name: Map name
            x: ADT X coordinate
            y: ADT Y coordinate

        Returns:
            Area name (best guess) or None
        """
        map_id = self.get_map_id_from_name(map_name)
        if map_id is None:
            return None

        # Get all areas for this map (may be empty if DBC not loaded)
        areas = self.get_areas_for_map(map_name)

        # Kalimdor coordinate heuristics (approximate)
        if map_name.lower() == 'kalimdor':
            # Lost Isles is around coordinates 40-44, 11-15 (northeast, more specific)
            if 40 <= x <= 44 and 11 <= y <= 15:
                # Try DBC first
                if areas:
                    for area in areas:
                        if 'lost' in area['name'].lower() or 'isle' in area['name'].lower():
                            return area['name']
                # Fallback to hardcoded name
                return 'Lost Isles'

            # Azshara is around 40-50, 5-15 (broader range)
            if 40 <= x <= 50 and 5 <= y <= 15:
                # Try DBC first
                if areas:
                    for area in areas:
                        if 'azshara' in area['name'].lower():
                            return area['name']
                # Fallback to hardcoded name
                return 'Azshara'

        # Eastern Kingdoms heuristics
        elif map_name.lower() == 'azeroth':
            # Gilneas is around 17-18, 38-41
            if 17 <= x <= 18 and 38 <= y <= 41:
                # Try DBC first
                if areas:
                    for area in areas:
                        if 'gilneas' in area['name'].lower():
                            return area['name']
                # Fallback to hardcoded name
                return 'Gilneas'

        return None

    def get_area_name_for_adt(self, adt_path: str) -> str:
        """
        Get a display name for an ADT file.

        Attempts to determine area name from coordinates.
        Falls back to "Map X,Y" if no area found.

        Args:
            adt_path: Full path to ADT file

        Returns:
            Human-readable area name
        """
        parsed = self.parse_adt_filename(adt_path)
        if not parsed:
            return Path(adt_path).name

        map_name, x, y = parsed

        # Try to guess area
        area_name = self.guess_area_from_coords(map_name, x, y)

        if area_name:
            return f'{area_name} ({map_name.title()} {x},{y})'
        else:
            map_display = self.map_names.get(
                self.get_map_id_from_name(map_name),
                map_name.title()
            )
            return f'{map_display} [{x},{y}]'

    def list_areas_by_map(self, map_name: str):
        """Print all areas for a map (for debugging)."""
        areas = self.get_areas_for_map(map_name)

        print(f'\nAreas in {map_name}:')
        print('=' * 80)

        for area in sorted(areas, key=lambda a: a['name']):
            print(f'  {area["name"]:50s} Level: {area["level"]:3d}')


def main():
    """Test DBC area reader."""
    import sys

    reader = DBCAreaReader()
    reader.connect()

    if len(sys.argv) > 1:
        map_name = sys.argv[1]
        reader.list_areas_by_map(map_name)
    else:
        # Test coordinate guessing
        test_adts = [
            '/path/to/kalimdor_43_12.adt',
            '/path/to/azeroth_17_38.adt',
            '/path/to/deephome_32_32.adt'
        ]

        print('\nTest ADT area name resolution:')
        print('=' * 80)
        for adt in test_adts:
            area_name = reader.get_area_name_for_adt(adt)
            print(f'{Path(adt).name:30s} -> {area_name}')


if __name__ == '__main__':
    main()
