#!/usr/bin/env python3
"""
Scan all ADT files for the MWMO offset bug in MODF entries.

The bug: MODF entries contain a uint32 byte offset into the MWMO string block.
If that offset doesn't point to the START of a null-terminated string (i.e., offset 0
or a position immediately after a null byte), the WMO placement references the wrong
path string.

ADT chunk format (on disk, reversed magic):
  - 4 bytes: reversed magic (e.g., b'OMWM' for MWMO)
  - 4 bytes: uint32 little-endian size of data
  - N bytes: chunk data

MODF entries are 64 bytes each. The first uint32 of each entry is the mwmo_offset.
"""

import struct
import os
import sys
from pathlib import Path
from collections import defaultdict

MAPS_DIR = Path("/workspace/project/Zeppelin-Craft/zpaks/open-azeroth/mpq/parsed-assets/WORLD/MAPS/")

# Chunk magics as they appear in the file (reversed from the logical name)
MWMO_MAGIC = b'OMWM'
MODF_MAGIC = b'FDOM'

MODF_ENTRY_SIZE = 64
DETAILED_LIMIT = 20


def find_all_chunks(data: bytes, magic: bytes) -> list:
    """Find all occurrences of a chunk with the given magic in the file data.
    Returns list of (offset_of_data, chunk_data) tuples.
    """
    results = []
    search_start = 0
    while True:
        pos = data.find(magic, search_start)
        if pos == -1:
            break
        # Ensure we have at least 8 bytes for header (4 magic + 4 size)
        if pos + 8 > len(data):
            search_start = pos + 1
            continue
        chunk_size = struct.unpack_from('<I', data, pos + 4)[0]
        data_start = pos + 8
        # Validate chunk_size is reasonable
        if data_start + chunk_size > len(data):
            # Chunk claims more data than available - skip this occurrence
            search_start = pos + 1
            continue
        chunk_data = data[data_start:data_start + chunk_size]
        results.append((data_start, chunk_data))
        search_start = data_start + chunk_size
    return results


def build_valid_offsets(mwmo_data: bytes) -> dict:
    """Build a mapping from valid string start offsets to the string at that offset.
    Valid starts: offset 0 and every position immediately after a null byte.
    Returns dict: offset -> string
    """
    valid = {}
    if len(mwmo_data) == 0:
        return valid

    # Offset 0 is always a valid start (first string)
    # Find null terminators to locate each string
    i = 0
    while i < len(mwmo_data):
        # i is a valid string start
        null_pos = mwmo_data.find(b'\x00', i)
        if null_pos == -1:
            # No null terminator found - take rest as string
            s = mwmo_data[i:].decode('ascii', errors='replace')
            valid[i] = s
            break
        else:
            s = mwmo_data[i:null_pos].decode('ascii', errors='replace')
            valid[i] = s
            i = null_pos + 1
    return valid


def resolve_string_at_offset(mwmo_data: bytes, offset: int) -> str:
    """Read a null-terminated string starting at byte offset in MWMO data.
    Returns the string even if offset is mid-string.
    """
    if offset >= len(mwmo_data):
        return f"<OUT_OF_BOUNDS: offset {offset}, mwmo_size {len(mwmo_data)}>"
    null_pos = mwmo_data.find(b'\x00', offset)
    if null_pos == -1:
        return mwmo_data[offset:].decode('ascii', errors='replace')
    return mwmo_data[offset:null_pos].decode('ascii', errors='replace')


def find_intended_string(mwmo_data: bytes, bad_offset: int, valid_offsets: dict) -> str:
    """For a bad offset that lands mid-string, find the valid string start it likely
    belongs to (the nearest valid offset that is <= bad_offset).
    """
    candidates = [o for o in valid_offsets if o <= bad_offset]
    if not candidates:
        return "<NO_VALID_STRING_BEFORE>"
    nearest = max(candidates)
    return valid_offsets[nearest]


def scan_adt(filepath: Path) -> dict:
    """Scan a single ADT file. Returns a result dict."""
    result = {
        'has_modf': False,
        'modf_entry_count': 0,
        'has_bug': False,
        'bad_entries': [],  # list of (entry_index, bad_offset, resolved_str, intended_str)
        'mwmo_size': 0,
        'valid_offset_count': 0,
    }

    data = filepath.read_bytes()

    # Find MWMO chunks
    mwmo_chunks = find_all_chunks(data, MWMO_MAGIC)
    if not mwmo_chunks:
        return result

    # Find MODF chunks
    modf_chunks = find_all_chunks(data, MODF_MAGIC)
    if not modf_chunks:
        return result

    # Use the first MWMO and first MODF chunk found
    # (ADT files typically have one of each for WMO objects)
    _, mwmo_data = mwmo_chunks[0]
    _, modf_data = modf_chunks[0]

    result['mwmo_size'] = len(mwmo_data)

    if len(mwmo_data) == 0:
        return result

    # Build valid string start offsets
    valid_offsets = build_valid_offsets(mwmo_data)
    result['valid_offset_count'] = len(valid_offsets)
    valid_offset_set = set(valid_offsets.keys())

    # Parse MODF entries
    num_entries = len(modf_data) // MODF_ENTRY_SIZE
    if num_entries == 0:
        return result

    result['has_modf'] = True
    result['modf_entry_count'] = num_entries

    for i in range(num_entries):
        entry_start = i * MODF_ENTRY_SIZE
        if entry_start + 4 > len(modf_data):
            break

        mwmo_offset = struct.unpack_from('<I', modf_data, entry_start)[0]

        if mwmo_offset not in valid_offset_set:
            resolved = resolve_string_at_offset(mwmo_data, mwmo_offset)
            intended = find_intended_string(mwmo_data, mwmo_offset, valid_offsets)
            result['bad_entries'].append((i, mwmo_offset, resolved, intended))

    if result['bad_entries']:
        result['has_bug'] = True

    return result


def main():
    print(f"MWMO Offset Bug Scanner")
    print(f"{'=' * 70}")
    print(f"Scanning: {MAPS_DIR}")
    print()

    # Collect all ADT files
    adt_files = sorted(MAPS_DIR.rglob('*.adt'))
    total_files = len(adt_files)
    print(f"Found {total_files} ADT files to scan")
    print()

    # Stats
    files_with_modf = 0
    files_with_bug = 0
    total_modf_entries = 0
    total_bad_entries = 0
    buggy_files = []

    for idx, filepath in enumerate(adt_files):
        if (idx + 1) % 500 == 0:
            print(f"  Progress: {idx + 1}/{total_files} files scanned...")

        try:
            result = scan_adt(filepath)
        except Exception as e:
            print(f"  ERROR scanning {filepath.name}: {e}")
            continue

        if result['has_modf']:
            files_with_modf += 1
            total_modf_entries += result['modf_entry_count']

        if result['has_bug']:
            files_with_bug += 1
            total_bad_entries += len(result['bad_entries'])
            rel_path = filepath.relative_to(MAPS_DIR)
            buggy_files.append((rel_path, result))

    # Summary
    print()
    print(f"{'=' * 70}")
    print(f"SCAN RESULTS")
    print(f"{'=' * 70}")
    print(f"Total ADT files scanned:        {total_files}")
    print(f"Files with MODF entries:         {files_with_modf}")
    print(f"Total MODF entries checked:      {total_modf_entries}")
    print(f"Files with offset bug:           {files_with_bug}")
    print(f"Total bad MODF entries:          {total_bad_entries}")
    print()

    if not buggy_files:
        print("No MWMO offset bugs found! All MODF entries point to valid string starts.")
        return

    # Detailed output
    print(f"{'=' * 70}")
    print(f"DETAILED BUG REPORT (showing first {DETAILED_LIMIT} of {files_with_bug} buggy files)")
    print(f"{'=' * 70}")

    for i, (rel_path, result) in enumerate(buggy_files[:DETAILED_LIMIT]):
        print(f"\n--- [{i+1}] {rel_path} ---")
        print(f"  MWMO size: {result['mwmo_size']} bytes, "
              f"Valid string starts: {result['valid_offset_count']}, "
              f"MODF entries: {result['modf_entry_count']}, "
              f"Bad entries: {len(result['bad_entries'])}")

        for entry_idx, bad_offset, resolved, intended in result['bad_entries']:
            print(f"  Entry #{entry_idx}: offset={bad_offset}")
            print(f"    Resolves to (mid-string): \"{resolved}\"")
            print(f"    Should be (full path):    \"{intended}\"")

    if files_with_bug > DETAILED_LIMIT:
        print(f"\n... and {files_with_bug - DETAILED_LIMIT} more buggy files not shown.")

    # Also print a compact summary of ALL buggy files
    print(f"\n{'=' * 70}")
    print(f"ALL BUGGY FILES (compact list)")
    print(f"{'=' * 70}")
    for rel_path, result in buggy_files:
        bad_count = len(result['bad_entries'])
        offsets = [str(e[1]) for e in result['bad_entries']]
        print(f"  {rel_path}  ({bad_count} bad) offsets: {', '.join(offsets)}")


if __name__ == '__main__':
    main()
