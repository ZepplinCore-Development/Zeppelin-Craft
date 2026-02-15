"""
Core engine for WoW.exe binary patching.

Loads patch definitions from patches.json, validates the base exe,
verifies original bytes, and applies patches to produce a patched exe.
"""

import hashlib
import json
import struct
from pathlib import Path


def load_patches(json_path):
    """Load and parse patches.json."""
    with open(json_path, 'r') as f:
        return json.load(f)


def parse_hex(hex_str):
    """Convert space-separated hex string to bytes. e.g. '0F 85 FE' -> b'\\x0f\\x85\\xfe'"""
    return bytes.fromhex(hex_str.replace(' ', ''))


def validate_base(data, expected):
    """Check exe size and MD5 against expected values.

    Returns (ok, message).
    """
    if len(data) != expected['size']:
        return False, f"Size mismatch: expected {expected['size']}, got {len(data)}"

    md5 = hashlib.md5(data).hexdigest()
    if md5 != expected['md5']:
        return False, f"MD5 mismatch: expected {expected['md5']}, got {md5}"

    return True, "Base exe validated"


def check_edit(data, edit):
    """Check a single edit against the exe data.

    Returns one of:
      'clean'    - original bytes present, ready to patch
      'applied'  - patched bytes already present
      'conflict' - neither original nor patched bytes match
    """
    offset = int(edit['offset'], 16)
    original = parse_hex(edit['original'])
    patched = parse_hex(edit['patched'])

    actual = bytes(data[offset:offset + len(original)])

    if actual == original:
        return 'clean'
    elif actual == patched:
        return 'applied'
    else:
        return 'conflict'


def check_patch(data, patch):
    """Check all edits in a patch.

    Returns (status, details) where status is:
      'clean'    - all edits are clean
      'applied'  - all edits are already applied
      'partial'  - mixed clean/applied edits
      'conflict' - at least one edit has unexpected bytes
    And details is a list of (edit, status) tuples.
    """
    details = []
    for edit in patch['edits']:
        status = check_edit(data, edit)
        details.append((edit, status))

    statuses = set(s for _, s in details)

    if 'conflict' in statuses:
        return 'conflict', details
    elif statuses == {'applied'}:
        return 'applied', details
    elif statuses == {'clean'}:
        return 'clean', details
    else:
        return 'partial', details


def apply_patch(data, patch):
    """Apply a single patch to the exe data (bytearray).

    Skips edits that are already applied. Raises ValueError on conflict.
    Returns (applied_count, skipped_count).
    """
    applied = 0
    skipped = 0

    for edit in patch['edits']:
        status = check_edit(data, edit)
        if status == 'applied':
            skipped += 1
            continue
        elif status == 'conflict':
            offset = edit['offset']
            actual = bytes(data[int(offset, 16):int(offset, 16) + len(parse_hex(edit['original']))])
            raise ValueError(
                f"Conflict at {offset}: expected {edit['original']}, "
                f"got {' '.join(f'{b:02X}' for b in actual)}"
            )

        offset = int(edit['offset'], 16)
        patched = parse_hex(edit['patched'])
        data[offset:offset + len(patched)] = patched
        applied += 1

    return applied, skipped


def zero_pe_checksum(data):
    """Zero out the PE checksum field at offset 0x168."""
    data[0x168:0x16C] = b'\x00\x00\x00\x00'


def recalculate_pe_checksum(data):
    """Recalculate and write the PE Optional Header CheckSum.

    Algorithm: zero the checksum field, sum all 16-bit words with
    carry wrapping, add the file size.
    """
    # Zero the checksum field first
    data[0x168:0x16C] = b'\x00\x00\x00\x00'

    # Sum all 16-bit words
    checksum = 0
    for i in range(0, len(data), 2):
        if i + 1 < len(data):
            word = struct.unpack_from('<H', data, i)[0]
        else:
            word = data[i]
        checksum += word
        # Fold carries
        checksum = (checksum & 0xFFFF) + (checksum >> 16)

    # Final fold
    checksum = (checksum & 0xFFFF) + (checksum >> 16)

    # Add file size
    checksum += len(data)

    # Write back
    struct.pack_into('<I', data, 0x168, checksum)


def resolve_patch_order(patches_list):
    """Sort patches respecting dependency order.

    Patches with 'requires' are placed after their dependencies.
    """
    by_name = {p['name']: p for p in patches_list}
    ordered = []
    visited = set()

    def visit(patch):
        name = patch['name']
        if name in visited:
            return
        for dep in patch.get('requires', []):
            if dep in by_name:
                visit(by_name[dep])
        visited.add(name)
        ordered.append(patch)

    for p in patches_list:
        visit(p)

    return ordered


def apply_all(base_path, patches_json_path, output_path,
              only=None, exclude=None, dry_run=False):
    """Full patching workflow.

    Args:
        base_path: Path to clean stock exe
        patches_json_path: Path to patches.json
        output_path: Where to write patched exe
        only: If set, only apply these patch names
        exclude: If set, skip these patch names
        dry_run: If True, don't write output

    Returns dict with:
        base_valid, patches_applied, patches_skipped,
        patches_failed, total_edits, output_md5, dry_run
    """
    config = load_patches(patches_json_path)

    # Read base exe
    with open(base_path, 'rb') as f:
        data = bytearray(f.read())

    # Validate base
    ok, msg = validate_base(data, config['base_exe'])
    if not ok:
        return {'base_valid': False, 'error': msg}

    # Filter patches
    patches = config['patches']
    if only:
        patches = [p for p in patches if p['name'] in only]
    elif exclude:
        patches = [p for p in patches if p['name'] not in exclude]
    else:
        patches = [p for p in patches if p['enabled']]

    # Check dependency satisfaction
    selected_names = {p['name'] for p in patches}
    for p in patches:
        for dep in p.get('requires', []):
            if dep not in selected_names:
                return {
                    'base_valid': True,
                    'error': f"Patch '{p['name']}' requires '{dep}' which is not selected"
                }

    # Sort by dependencies
    patches = resolve_patch_order(patches)

    applied_patches = []
    skipped_patches = []
    failed_patches = []
    total_edits = 0

    for patch in patches:
        name = patch['name']
        try:
            status, details = check_patch(data, patch)

            if status == 'applied':
                skipped_patches.append({'name': name, 'reason': 'already applied'})
                continue

            if status == 'conflict':
                conflicts = [(e['offset'], s) for e, s in details if s == 'conflict']
                failed_patches.append({
                    'name': name,
                    'reason': f"conflict at {', '.join(off for off, _ in conflicts)}"
                })
                continue

            if dry_run:
                edit_count = sum(1 for _, s in details if s == 'clean')
                applied_patches.append({
                    'name': name,
                    'edits_applied': edit_count,
                    'edits_skipped': sum(1 for _, s in details if s == 'applied'),
                })
                total_edits += edit_count
            else:
                n_applied, n_skipped = apply_patch(data, patch)
                applied_patches.append({
                    'name': name,
                    'edits_applied': n_applied,
                    'edits_skipped': n_skipped,
                })
                total_edits += n_applied

        except ValueError as e:
            failed_patches.append({'name': name, 'reason': str(e)})

    # Recalculate PE checksum
    if not dry_run and applied_patches:
        recalculate_pe_checksum(data)

    # Write output
    output_md5 = None
    if not dry_run and applied_patches:
        output_path = Path(output_path)
        output_path.parent.mkdir(parents=True, exist_ok=True)
        with open(output_path, 'wb') as f:
            f.write(data)
        output_md5 = hashlib.md5(data).hexdigest()

    return {
        'base_valid': True,
        'patches_applied': applied_patches,
        'patches_skipped': skipped_patches,
        'patches_failed': failed_patches,
        'total_edits': total_edits,
        'output_md5': output_md5,
        'dry_run': dry_run,
    }
