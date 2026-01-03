#!/usr/bin/env python3
"""
DBC File Reordering Module

Reads a DBC file, reorders records by specified columns, and writes back
while preserving the binary format and string table integrity.

Used to fix CharSections.dbc which requires race/gender grouping instead
of ID sorting.
"""

import struct
import os
from typing import List, Dict, Tuple, Any


class DBCRecord:
    """Represents a single DBC record with its raw binary data."""

    def __init__(self, record_bytes: bytes, record_size: int):
        self.raw_bytes = record_bytes
        self.record_size = record_size
        self.fields = {}

    def parse_field(self, field_name: str, offset: int, field_type: str):
        """Parse a specific field from the raw bytes."""
        if field_type == 'uint':
            self.fields[field_name] = struct.unpack('I', self.raw_bytes[offset:offset+4])[0]
        elif field_type == 'int':
            self.fields[field_name] = struct.unpack('i', self.raw_bytes[offset:offset+4])[0]
        elif field_type == 'float':
            self.fields[field_name] = struct.unpack('f', self.raw_bytes[offset:offset+4])[0]
        elif field_type == 'string_offset':
            # String offsets are uints pointing into string table
            self.fields[field_name] = struct.unpack('I', self.raw_bytes[offset:offset+4])[0]

        return self.fields[field_name]


class DBCFile:
    """Handles reading, reordering, and writing DBC files."""

    def __init__(self, filepath: str):
        self.filepath = filepath
        self.magic = None
        self.record_count = 0
        self.field_count = 0
        self.record_size = 0
        self.string_block_size = 0
        self.records = []
        self.string_table = b''

    def read(self):
        """Read the entire DBC file into memory."""
        with open(self.filepath, 'rb') as f:
            # Read header (20 bytes)
            self.magic = f.read(4).decode('ascii')
            if self.magic != 'WDBC':
                raise ValueError(f"Invalid DBC file. Magic: {self.magic}")

            self.record_count = struct.unpack('I', f.read(4))[0]
            self.field_count = struct.unpack('I', f.read(4))[0]
            self.record_size = struct.unpack('I', f.read(4))[0]
            self.string_block_size = struct.unpack('I', f.read(4))[0]

            # Read all records
            self.records = []
            for i in range(self.record_count):
                record_bytes = f.read(self.record_size)
                record = DBCRecord(record_bytes, self.record_size)
                self.records.append(record)

            # Read string table
            self.string_table = f.read(self.string_block_size)

    def parse_charsections_fields(self):
        """Parse CharSections.dbc specific fields for all records."""
        # CharSections structure:
        # Offset 0:  ID (uint)
        # Offset 4:  RaceID (uint)
        # Offset 8:  SexID (uint)
        # Offset 12: BaseSection (uint)
        # Offset 16: TextureName1 (string offset)
        # Offset 20: TextureName2 (string offset)
        # Offset 24: TextureName3 (string offset)
        # Offset 28: Flags (uint)
        # Offset 32: VariationIndex (uint)
        # Offset 36: ColorIndex (uint)

        for record in self.records:
            record.parse_field('ID', 0, 'uint')
            record.parse_field('RaceID', 4, 'uint')
            record.parse_field('SexID', 8, 'uint')
            record.parse_field('BaseSection', 12, 'uint')
            record.parse_field('TextureName1', 16, 'string_offset')
            record.parse_field('TextureName2', 20, 'string_offset')
            record.parse_field('TextureName3', 24, 'string_offset')
            record.parse_field('Flags', 28, 'uint')
            record.parse_field('VariationIndex', 32, 'uint')
            record.parse_field('ColorIndex', 36, 'uint')

    def sort_by_race_gender_grouping(self):
        """
        Sort records by race/gender grouping instead of ID.

        Sort order: RaceID, SexID, BaseSection, ColorIndex, VariationIndex, Flags, ID
        This ensures all records for a race/gender combination are contiguous.
        """
        self.records.sort(key=lambda r: (
            r.fields.get('RaceID', 0),
            r.fields.get('SexID', 0),
            r.fields.get('BaseSection', 0),
            r.fields.get('ColorIndex', 0),
            r.fields.get('VariationIndex', 0),
            r.fields.get('Flags', 0),
            r.fields.get('ID', 0)
        ))

    def write(self, output_path: str = None):
        """Write the DBC file back to disk with reordered records."""
        if output_path is None:
            output_path = self.filepath

        with open(output_path, 'wb') as f:
            # Write header
            f.write(self.magic.encode('ascii'))
            f.write(struct.pack('I', self.record_count))
            f.write(struct.pack('I', self.field_count))
            f.write(struct.pack('I', self.record_size))
            f.write(struct.pack('I', self.string_block_size))

            # Write all records (now in new order)
            for record in self.records:
                f.write(record.raw_bytes)

            # Write string table (unchanged)
            f.write(self.string_table)

    def get_grouping_stats(self) -> Dict[str, Any]:
        """Calculate statistics about race/gender grouping."""
        transitions = []
        prev_race = None
        prev_sex = None

        for i, record in enumerate(self.records):
            race = record.fields.get('RaceID')
            sex = record.fields.get('SexID')

            if prev_race is not None and (race != prev_race or sex != prev_sex):
                transitions.append({
                    'position': i,
                    'from': (prev_race, prev_sex),
                    'to': (race, sex)
                })

            prev_race = race
            prev_sex = sex

        return {
            'total_records': len(self.records),
            'race_sex_transitions': len(transitions),
            'transitions': transitions[:10]  # First 10 for debugging
        }


def reorder_charsections(input_path: str, output_path: str = None, backup: bool = True) -> bool:
    """
    Reorder a CharSections.dbc file by race/gender grouping.

    Args:
        input_path: Path to the CharSections.dbc file to reorder
        output_path: Optional output path (defaults to overwriting input)
        backup: Whether to create a .bak backup before overwriting

    Returns:
        True if successful, False otherwise
    """
    try:
        # Create backup if requested
        if backup and (output_path is None or output_path == input_path):
            backup_path = input_path + '.bak'
            import shutil
            shutil.copy2(input_path, backup_path)
            print(f"Created backup: {backup_path}")

        # Read the DBC file
        print(f"Reading {input_path}...")
        dbc = DBCFile(input_path)
        dbc.read()

        # Get stats before reordering
        print(f"File info: {dbc.record_count} records, {dbc.field_count} fields, {dbc.record_size} bytes/record")
        dbc.parse_charsections_fields()

        before_stats = dbc.get_grouping_stats()
        print(f"Before reorder: {before_stats['race_sex_transitions']} race/sex transitions")

        # Reorder records
        print("Reordering records by race/gender grouping...")
        dbc.sort_by_race_gender_grouping()

        # Get stats after reordering
        after_stats = dbc.get_grouping_stats()
        print(f"After reorder: {after_stats['race_sex_transitions']} race/sex transitions")

        # Write the reordered file
        output = output_path if output_path else input_path
        print(f"Writing reordered DBC to {output}...")
        dbc.write(output)

        print(f"✓ Successfully reordered CharSections.dbc")
        print(f"  Reduced transitions from {before_stats['race_sex_transitions']} to {after_stats['race_sex_transitions']}")

        return True

    except Exception as e:
        print(f"✗ Error reordering DBC: {e}")
        import traceback
        traceback.print_exc()
        return False


if __name__ == "__main__":
    import sys

    if len(sys.argv) < 2:
        print("Usage: python dbc_reorder.py <input.dbc> [output.dbc]")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None

    success = reorder_charsections(input_file, output_file)
    sys.exit(0 if success else 1)
