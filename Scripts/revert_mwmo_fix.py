#!/usr/bin/env python3
"""
Revert broken MODF nameId fix in ADT files.

The fix_mwmo_offsets.py script incorrectly changed MODF nameId values from
MWID indices to byte offsets into MWMO. The WoW 3.3.5a client expects MWID
indices. This script reverts the change by converting byte offsets back to
the corresponding MWID index.

MODF entry layout (64 bytes):
  - uint32 nameId  (offset 0) - index into MWID
  - uint32 uniqueId (offset 4)
  - ... remaining fields

MWID is an array of uint32 byte offsets into MWMO string data.
MWMO contains null-terminated strings packed sequentially.
"""

import struct
import sys
from pathlib import Path


MAPS_DIR = Path("/workspace/project/Zeppelin-Craft/zpaks/patch-open-azeroth/mpq/parsed-assets/WORLD/MAPS")

MAGIC_MWMO = b'OMWM'
MAGIC_MWID = b'DIWM'
MAGIC_MODF = b'FDOM'


def find_chunk(data, magic, start=0):
    """Find the position of a chunk by its reversed magic bytes."""
    return data.find(magic, start)


def parse_mwmo_string_offsets(data, mwmo_offset, mwmo_size):
    """
    Parse MWMO chunk data and return the set of byte offsets where
    null-terminated strings start.
    """
    mwmo_data = data[mwmo_offset + 8 : mwmo_offset + 8 + mwmo_size]
    offsets = set()
    i = 0
    while i < len(mwmo_data):
        end = mwmo_data.find(b'\x00', i)
        if end == -1:
            break
        if end > i:  # non-empty string
            offsets.add(i)
        i = end + 1
    return offsets


def parse_mwid(data, mwid_offset, mwid_size):
    """Parse MWID chunk and return list of uint32 byte offsets."""
    num_entries = mwid_size // 4
    entries = []
    for i in range(num_entries):
        val = struct.unpack_from('<I', data, mwid_offset + 8 + i * 4)[0]
        entries.append(val)
    return entries


def build_offset_to_index(mwid_entries):
    """Build reverse mapping: byte offset -> MWID index."""
    return {offset: idx for idx, offset in enumerate(mwid_entries)}


def process_file(filepath, verify_file=None):
    """
    Process a single ADT file and revert MODF nameId values from byte offsets
    to MWID indices.

    Returns (was_modified, entries_changed).
    """
    with open(filepath, 'rb') as f:
        data = bytearray(f.read())

    filename = filepath.name.lower()
    is_verify = verify_file and verify_file in filename

    # Find required chunks
    mwmo_pos = find_chunk(data, MAGIC_MWMO)
    mwid_pos = find_chunk(data, MAGIC_MWID)
    modf_pos = find_chunk(data, MAGIC_MODF)

    # Skip files without all three chunks
    if mwmo_pos < 0 or mwid_pos < 0 or modf_pos < 0:
        return False, 0

    # Parse chunk sizes
    mwmo_size = struct.unpack_from('<I', data, mwmo_pos + 4)[0]
    mwid_size = struct.unpack_from('<I', data, mwid_pos + 4)[0]
    modf_size = struct.unpack_from('<I', data, modf_pos + 4)[0]

    # Parse data
    mwid_entries = parse_mwid(data, mwid_pos, mwid_size)
    num_mwid = len(mwid_entries)
    mwmo_string_starts = parse_mwmo_string_offsets(data, mwmo_pos, mwmo_size)
    offset_to_index = build_offset_to_index(mwid_entries)

    if num_mwid == 0:
        return False, 0

    # Verification output for specified file
    if is_verify:
        print(f"\n{'='*60}")
        print(f"VERIFICATION: {filepath.name}")
        print(f"{'='*60}")
        print(f"MWMO string start offsets: {sorted(mwmo_string_starts)}")
        print(f"MWID entries ({num_mwid}):")
        mwmo_data = data[mwmo_pos + 8 : mwmo_pos + 8 + mwmo_size]
        for i, off in enumerate(mwid_entries):
            end = mwmo_data.find(b'\x00', off)
            s = mwmo_data[off:end].decode('ascii', errors='replace') if end > off else '<empty>'
            in_starts = off in mwmo_string_starts
            print(f"  MWID[{i}] = {off} -> \"{s}\" (valid string start: {in_starts})")

    # Process MODF entries
    num_modf = modf_size // 64
    entries_changed = 0

    for i in range(num_modf):
        entry_off = modf_pos + 8 + i * 64
        name_id = struct.unpack_from('<I', data, entry_off)[0]

        # Determine if this nameId needs reverting.
        #
        # Decision logic:
        # 1) If nameId < num_mwid AND mwid_entries[nameId] is a valid MWMO
        #    string start offset => it's already a valid index. SKIP.
        # 2) If nameId is found as a byte offset in MWID (i.e., nameId is in
        #    offset_to_index), it was changed to a byte offset by the broken
        #    fix => REVERT to the MWID index.
        # 3) Otherwise, it's ambiguous. We handle edge cases below.

        already_valid_index = (
            name_id < num_mwid
            and mwid_entries[name_id] in mwmo_string_starts
        )

        is_byte_offset = name_id in offset_to_index

        if already_valid_index and not is_byte_offset:
            # Clearly a valid index, not a byte offset
            if is_verify:
                print(f"  MODF[{i}].nameId = {name_id} -> ALREADY VALID INDEX (MWID[{name_id}]={mwid_entries[name_id]})")
            continue

        if already_valid_index and is_byte_offset:
            # Ambiguous: nameId is both a valid index AND a byte offset.
            # The only truly unambiguous case is nameId == 0 (index 0 always
            # maps to byte offset 0). For nameId==0 this is a no-op either
            # way since offset_to_index[0] == 0.
            #
            # For other ambiguous values: since the broken script converted
            # indices -> byte offsets, and the byte offset is typically larger
            # than the index, a value that happens to be a valid index AND
            # a valid byte offset is more likely to still be in its original
            # (already correct index) form if it's small. But if the value
            # equals a MWID entry AND is a valid index, we can't easily
            # distinguish.
            #
            # Heuristic: if nameId == 0, skip (no-op). Otherwise, if the
            # value is literally the byte offset that MWID[nameId] points to,
            # and that byte offset also happens to equal nameId, it's a
            # coincidence -- leave it as an index.
            if name_id == 0:
                if is_verify:
                    print(f"  MODF[{i}].nameId = 0 -> SKIP (index 0 == offset 0, no-op)")
                continue
            # If MWID[nameId] == nameId, this is a self-referential edge case.
            # The value is correct as an index already.
            if mwid_entries[name_id] == name_id:
                if is_verify:
                    print(f"  MODF[{i}].nameId = {name_id} -> SKIP (self-referential)")
                continue
            # Otherwise it's likely a byte offset that needs reverting
            new_id = offset_to_index[name_id]
            if is_verify:
                print(f"  MODF[{i}].nameId = {name_id} -> REVERT to {new_id} (ambiguous, treating as byte offset)")
            struct.pack_into('<I', data, entry_off, new_id)
            entries_changed += 1
            continue

        if is_byte_offset:
            # nameId is a byte offset into MWMO but NOT a valid index
            new_id = offset_to_index[name_id]
            if is_verify:
                print(f"  MODF[{i}].nameId = {name_id} -> REVERT to {new_id}")
            struct.pack_into('<I', data, entry_off, new_id)
            entries_changed += 1
            continue

        # nameId is neither a valid index nor a known byte offset.
        # This shouldn't happen in normal circumstances. Log a warning.
        if is_verify:
            print(f"  MODF[{i}].nameId = {name_id} -> WARNING: unknown value, leaving unchanged")

    if entries_changed > 0:
        with open(filepath, 'wb') as f:
            f.write(data)
        return True, entries_changed

    return False, 0


def main():
    print("=" * 60)
    print("MODF nameId Revert Script")
    print("Reverting byte offsets back to MWID indices")
    print("=" * 60)

    # Collect all ADT files
    adt_files = sorted(MAPS_DIR.rglob("*.adt"))
    print(f"\nFound {len(adt_files)} ADT files to scan.\n")

    if not adt_files:
        print("ERROR: No ADT files found!")
        sys.exit(1)

    total_files_modified = 0
    total_entries_changed = 0
    verify_target = "azeroth_34_41"

    for filepath in adt_files:
        modified, changed = process_file(filepath, verify_file=verify_target)
        if modified:
            total_files_modified += 1
            total_entries_changed += changed
            print(f"  FIXED: {filepath.name} ({changed} entries)")

    print(f"\n{'='*60}")
    print(f"SUMMARY")
    print(f"{'='*60}")
    print(f"Total ADT files scanned:    {len(adt_files)}")
    print(f"Files modified (reverted):  {total_files_modified}")
    print(f"Total MODF entries changed: {total_entries_changed}")
    print(f"{'='*60}")

    # Post-revert verification of the Ironforge tile
    print(f"\n{'='*60}")
    print(f"POST-REVERT VERIFICATION: {verify_target}")
    print(f"{'='*60}")
    verify_path = MAPS_DIR / "AZEROTH" / f"{verify_target}.adt"
    if verify_path.exists():
        with open(verify_path, 'rb') as f:
            data = f.read()

        mwmo_pos = find_chunk(data, MAGIC_MWMO)
        mwid_pos = find_chunk(data, MAGIC_MWID)
        modf_pos = find_chunk(data, MAGIC_MODF)

        mwmo_size = struct.unpack_from('<I', data, mwmo_pos + 4)[0]
        mwid_size = struct.unpack_from('<I', data, mwid_pos + 4)[0]
        modf_size = struct.unpack_from('<I', data, modf_pos + 4)[0]

        mwmo_data = data[mwmo_pos + 8 : mwmo_pos + 8 + mwmo_size]
        mwid_entries = parse_mwid(data, mwid_pos, mwid_size)
        mwmo_starts = parse_mwmo_string_offsets(data, mwmo_pos, mwmo_size)
        num_modf = modf_size // 64

        # Verify MWID -> MWMO mapping
        print("\nMWID -> MWMO string mapping verification:")
        all_valid = True
        for i, off in enumerate(mwid_entries):
            end = mwmo_data.find(b'\x00', off)
            s = mwmo_data[off:end].decode('ascii', errors='replace') if end > off else '<empty>'
            valid = off in mwmo_starts
            status = "OK" if valid else "INVALID"
            if not valid:
                all_valid = False
            print(f"  MWID[{i}] = {off} -> \"{s}\" [{status}]")

        print(f"\nAll MWID entries map to valid MWMO string starts: {all_valid}")

        # Verify MODF nameIds are now valid indices
        print("\nMODF nameId verification (should be MWID indices):")
        all_correct = True
        for i in range(num_modf):
            entry_off = modf_pos + 8 + i * 64
            name_id = struct.unpack_from('<I', data, entry_off)[0]
            if name_id < len(mwid_entries):
                wmo_off = mwid_entries[name_id]
                end = mwmo_data.find(b'\x00', wmo_off)
                s = mwmo_data[wmo_off:end].decode('ascii', errors='replace')
                print(f"  MODF[{i}].nameId = {name_id} -> MWID[{name_id}]={wmo_off} -> \"{s}\" [OK]")
            else:
                print(f"  MODF[{i}].nameId = {name_id} -> OUT OF RANGE (max index: {len(mwid_entries)-1}) [ERROR]")
                all_correct = False

        print(f"\nAll MODF nameIds are valid MWID indices: {all_correct}")
    else:
        print(f"  File not found: {verify_path}")


if __name__ == '__main__':
    main()
