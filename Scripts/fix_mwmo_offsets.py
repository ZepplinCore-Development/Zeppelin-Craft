#!/usr/bin/env python3
"""
Fix MWMO offset bug in ADT files.

Bug: In MODF chunks, the `mwmo_offset` field (first uint32 of each 64-byte entry)
contains a string index (0, 1, 2, 3...) instead of the correct byte offset into
the MWMO string data.

This script scans all ADT files under a given directory, detects entries where
the mwmo_offset is a string index rather than a byte offset, and corrects them.

The script is idempotent - running it multiple times produces the same result.
"""

import os
import struct
import sys


def parse_mwmo_strings(mwmo_data):
    """
    Parse the MWMO chunk data into a list of strings and mappings.

    Returns:
        strings: list of non-empty byte strings
        idx_to_offset: mapping from string index to byte offset within MWMO data
        valid_offsets: set of all valid string start byte offsets
    """
    strings = []
    idx_to_offset = {}
    offset = 0
    mwmo_size = len(mwmo_data)

    for part in mwmo_data.split(b'\x00'):
        if offset < mwmo_size:
            if part:  # non-empty string
                idx_to_offset[len(strings)] = offset
                strings.append(part)
            offset += len(part) + 1

    valid_offsets = set(idx_to_offset.values())
    return strings, idx_to_offset, valid_offsets


def fix_adt_file(filepath):
    """
    Fix MWMO offsets in a single ADT file.

    Returns:
        (entries_checked, entries_fixed)
    """
    with open(filepath, 'rb') as f:
        data = bytearray(f.read())

    # Find MWMO chunk (stored as reversed magic 'OMWM')
    mwmo_pos = data.find(b'OMWM')
    if mwmo_pos == -1:
        return 0, 0

    mwmo_size = struct.unpack_from('<I', data, mwmo_pos + 4)[0]
    if mwmo_size == 0:
        return 0, 0

    mwmo_data_start = mwmo_pos + 8
    mwmo_data = bytes(data[mwmo_data_start:mwmo_data_start + mwmo_size])

    # Find MODF chunk (stored as reversed magic 'FDOM')
    modf_pos = data.find(b'FDOM')
    if modf_pos == -1:
        return 0, 0

    modf_size = struct.unpack_from('<I', data, modf_pos + 4)[0]
    if modf_size == 0:
        return 0, 0

    # Parse MWMO strings
    strings, idx_to_offset, valid_offsets = parse_mwmo_strings(mwmo_data)

    if len(strings) == 0:
        return 0, 0

    num_entries = modf_size // 64
    modf_data_start = modf_pos + 8

    entries_fixed = 0

    for e in range(num_entries):
        entry_start = modf_data_start + e * 64
        mwmo_offset_val = struct.unpack_from('<I', data, entry_start)[0]

        # Skip offset 0 - it's always valid (points to the first string)
        if mwmo_offset_val == 0:
            continue

        # If the value is already a valid string start offset, it's correct
        if mwmo_offset_val in valid_offsets:
            continue

        # If the value looks like a string index (less than number of strings),
        # look up the correct byte offset
        if mwmo_offset_val < len(strings):
            correct_offset = idx_to_offset[mwmo_offset_val]
            struct.pack_into('<I', data, entry_start, correct_offset)
            entries_fixed += 1
        # else: value is neither a valid offset nor a valid index - leave it alone

    # Write back if modifications were made
    if entries_fixed > 0:
        with open(filepath, 'wb') as f:
            f.write(data)

    return num_entries, entries_fixed


def main():
    base_dir = '/workspace/project/Zeppelin-Craft/zpaks/open-azeroth/mpq/parsed-assets/WORLD/MAPS/'

    if not os.path.isdir(base_dir):
        print(f"ERROR: Directory not found: {base_dir}")
        sys.exit(1)

    # Collect all ADT files
    adt_files = []
    for root, dirs, files in os.walk(base_dir):
        for fname in sorted(files):
            if fname.lower().endswith('.adt'):
                adt_files.append(os.path.join(root, fname))

    adt_files.sort()

    print(f"Found {len(adt_files)} ADT files to process")
    print()

    total_files_processed = 0
    total_files_modified = 0
    total_entries_fixed = 0
    errors = []

    for i, filepath in enumerate(adt_files):
        rel_path = filepath.replace(base_dir, '')
        try:
            entries_checked, entries_fixed = fix_adt_file(filepath)
            total_files_processed += 1

            if entries_fixed > 0:
                total_files_modified += 1
                total_entries_fixed += entries_fixed
                print(f"  FIXED: {rel_path} - {entries_fixed}/{entries_checked} MODF entries corrected")

        except Exception as exc:
            errors.append((rel_path, str(exc)))
            print(f"  ERROR: {rel_path} - {exc}")

        # Progress update every 500 files
        if (i + 1) % 500 == 0:
            print(f"  ... processed {i + 1}/{len(adt_files)} files ...")

    # Final report
    print()
    print("=" * 60)
    print("MWMO Offset Fix - Summary")
    print("=" * 60)
    print(f"  Total ADT files found:    {len(adt_files)}")
    print(f"  Total files processed:    {total_files_processed}")
    print(f"  Total files modified:     {total_files_modified}")
    print(f"  Total MODF entries fixed: {total_entries_fixed}")
    print(f"  Errors encountered:       {len(errors)}")

    if errors:
        print()
        print("Errors:")
        for rel_path, err_msg in errors:
            print(f"  {rel_path}: {err_msg}")

    print()
    print("Done.")


if __name__ == '__main__':
    main()
