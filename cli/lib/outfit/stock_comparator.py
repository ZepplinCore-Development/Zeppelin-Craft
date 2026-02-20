"""
Full slot-by-slot comparison between current DBC and stock WOTLK charstartoutfit.

Compares ALL 24 item slots (not just weapons) to catch differences in
shirts, armor, quivers, ammo, bags, and any other items.
Also provides reset_to_stock() to restore item/invtype slots to stock values.
"""

import click

from .constants import RACE_NAMES, CLASS_NAMES, GENDER_NAMES, INVTYPE_NAMES


# Build column lists for queries
_ITEM_COLS = ', '.join(f'item_{i}' for i in range(1, 25))
_INVTYPE_COLS = ', '.join(f'inventory_type_{i}' for i in range(1, 25))
_OUTFIT_QUERY = f"""
    SELECT id, race, class, gender, {_ITEM_COLS}
    FROM charstartoutfit
    WHERE race BETWEEN 1 AND 12 AND class BETWEEN 1 AND 11
    ORDER BY race, class, gender
"""
_RESET_QUERY = f"""
    SELECT id, race, class, gender, {_ITEM_COLS}, {_INVTYPE_COLS}
    FROM charstartoutfit
    WHERE race BETWEEN 1 AND 12 AND class BETWEEN 1 AND 11
    ORDER BY race, class, gender
"""


def compare_to_stock(dbc_cursor, original_dbc_cursor, acore_cursor):
    """
    Compare all 24 item slots between current DBC and stock WOTLK.

    Returns list of diffs, each a dict with:
        outfit_id, race, race_name, class_id, class_name, gender, gender_name,
        slot, diff_type ('changed'|'missing'|'added'),
        stock_item_id, stock_item_name, stock_inv_type,
        current_item_id, current_item_name, current_inv_type
    """
    click.echo("=" * 80)
    click.echo("FULL SLOT COMPARISON: CURRENT vs STOCK WOTLK")
    click.echo("=" * 80)
    click.echo()

    # Query both databases
    dbc_cursor.execute(_OUTFIT_QUERY)
    current_rows = dbc_cursor.fetchall()

    original_dbc_cursor.execute(_OUTFIT_QUERY)
    stock_rows = original_dbc_cursor.fetchall()

    # Build stock lookup by (race, class, gender) since IDs differ between DBs
    stock_lookup = {}
    for row in stock_rows:
        key = (row[1], row[2], row[3])  # race, class, gender
        stock_lookup[key] = row

    # Collect all unique item IDs for batch name lookup
    all_item_ids = set()
    for row in current_rows:
        for item_id in row[4:28]:
            if item_id and item_id > 0 and item_id != 6948:
                all_item_ids.add(item_id)
    for row in stock_rows:
        for item_id in row[4:28]:
            if item_id and item_id > 0 and item_id != 6948:
                all_item_ids.add(item_id)

    # Batch lookup item names and inventory types
    item_cache = {}
    if all_item_ids:
        placeholders = ','.join(['%s'] * len(all_item_ids))
        acore_cursor.execute(f"""
            SELECT entry, name, InventoryType
            FROM item_template
            WHERE entry IN ({placeholders})
        """, tuple(all_item_ids))
        for entry, name, inv_type in acore_cursor.fetchall():
            item_cache[entry] = (name, inv_type)

    # Compare each current outfit against stock
    differences = []
    for row in current_rows:
        outfit_id = row[0]
        race_id, class_id, gender = row[1], row[2], row[3]
        current_items = row[4:28]

        key = (race_id, class_id, gender)
        stock_row = stock_lookup.get(key)
        if stock_row is None:
            # Outfit exists in current but not stock (e.g. custom race/class combo)
            continue

        stock_items = stock_row[4:28]

        for slot_idx in range(24):
            slot_num = slot_idx + 1
            current_item = current_items[slot_idx] or 0
            stock_item = stock_items[slot_idx] or 0

            # Normalize empty values
            current_empty = current_item <= 0
            stock_empty = stock_item <= 0

            # Skip if both empty or identical
            if current_empty and stock_empty:
                continue
            if current_item == stock_item:
                continue

            # Skip hearthstone
            if current_item == 6948 or stock_item == 6948:
                continue

            # Classify
            if stock_empty:
                diff_type = 'added'
            elif current_empty:
                diff_type = 'missing'
            else:
                diff_type = 'changed'

            # Look up item details
            stock_name, stock_inv = ('Empty', -1) if stock_empty else item_cache.get(stock_item, (f'Unknown [{stock_item}]', -1))
            current_name, current_inv = ('Empty', -1) if current_empty else item_cache.get(current_item, (f'Unknown [{current_item}]', -1))

            differences.append({
                'outfit_id': outfit_id,
                'race': race_id,
                'race_name': RACE_NAMES.get(race_id, f'Race {race_id}'),
                'class_id': class_id,
                'class_name': CLASS_NAMES.get(class_id, f'Class {class_id}'),
                'gender': gender,
                'gender_name': GENDER_NAMES.get(gender, f'Gender {gender}'),
                'slot': slot_num,
                'diff_type': diff_type,
                'stock_item_id': stock_item,
                'stock_item_name': stock_name,
                'stock_inv_type': INVTYPE_NAMES.get(stock_inv, '') if stock_inv >= 0 else '',
                'current_item_id': current_item,
                'current_item_name': current_name,
                'current_inv_type': INVTYPE_NAMES.get(current_inv, '') if current_inv >= 0 else '',
            })

    # Print summary
    if differences:
        # Count unique outfits affected
        affected = len({(d['race'], d['class_id'], d['gender']) for d in differences})
        click.echo(f"Found {len(differences)} slot differences across {affected} outfits")
    else:
        click.echo("No slot differences found - current DBC matches stock WOTLK perfectly!")
    click.echo()

    return differences


def format_stock_comparison(differences):
    """Format differences into a human-readable log string."""
    lines = []
    lines.append("=" * 80)
    lines.append("FULL SLOT COMPARISON: CURRENT DBC vs STOCK WOTLK")
    lines.append("=" * 80)
    lines.append("")
    lines.append("This report shows ALL item slot differences between the current")
    lines.append("dbc.charstartoutfit and original_dbc.charstartoutfit (stock WOTLK).")
    lines.append("")
    lines.append("Weapon skill differences are reported separately in csv_vs_stock_wotlk.log.")
    lines.append("This report covers all items: shirts, armor, quivers, ammo, bags, etc.")
    lines.append("")

    if not differences:
        lines.append("No differences found - current DBC matches stock WOTLK!")
        return '\n'.join(lines)

    affected = len({(d['race'], d['class_id'], d['gender']) for d in differences})
    lines.append(f"Found {len(differences)} slot differences across {affected} outfits")
    lines.append("")

    # Group by outfit
    grouped = {}
    for d in differences:
        outfit_key = (d['race'], d['class_id'], d['gender'])
        grouped.setdefault(outfit_key, []).append(d)

    for (race, class_id, gender), diffs in sorted(grouped.items()):
        first = diffs[0]
        header = f"{first['race_name']} {first['class_name']} ({first['gender_name']}) [id={first['outfit_id']}]"
        lines.append("-" * 80)
        lines.append(header)
        lines.append("-" * 80)

        for d in sorted(diffs, key=lambda x: x['slot']):
            tag = d['diff_type'].upper()

            if d['diff_type'] == 'missing':
                stock_desc = f"{d['stock_item_name']} [{d['stock_item_id']}]"
                if d['stock_inv_type']:
                    stock_desc += f" ({d['stock_inv_type']})"
                lines.append(f"  Slot {d['slot']:>2}: {tag:<7} - Stock: {stock_desc}")
                lines.append(f"           {' ' * len(tag)}   Current: Empty")

            elif d['diff_type'] == 'added':
                current_desc = f"{d['current_item_name']} [{d['current_item_id']}]"
                if d['current_inv_type']:
                    current_desc += f" ({d['current_inv_type']})"
                lines.append(f"  Slot {d['slot']:>2}: {tag:<7} - Stock: Empty")
                lines.append(f"           {' ' * len(tag)}   Current: {current_desc}")

            else:  # changed
                stock_desc = f"{d['stock_item_name']} [{d['stock_item_id']}]"
                if d['stock_inv_type']:
                    stock_desc += f" ({d['stock_inv_type']})"
                current_desc = f"{d['current_item_name']} [{d['current_item_id']}]"
                if d['current_inv_type']:
                    current_desc += f" ({d['current_inv_type']})"
                lines.append(f"  Slot {d['slot']:>2}: {tag:<7} - Stock: {stock_desc}")
                lines.append(f"           {' ' * len(tag)}   Current: {current_desc}")

        lines.append("")

    return '\n'.join(lines)


def _get_equipped_types(items, item_invtypes):
    """Get the set of InventoryType values for real items in an outfit."""
    equipped = set()
    for item_id in items:
        if item_id and item_id > 0 and item_id != 6948:
            inv_type = item_invtypes.get(item_id)
            if inv_type is not None:
                equipped.add(inv_type)
    return equipped


def check_essential_items(dbc_cursor, original_dbc_cursor, acore_cursor):
    """
    Verify every outfit has essential clothing: shirt/chest/robe, pants, and boots.

    Scans ALL outfits (including custom races like Goblin/Worgen) and checks
    that each has at least one real item (item > 0) providing body, legs, and
    feet coverage. Uses stock WOTLK data as reference — if a stock outfit also
    lacks an item type (e.g. Tauren have no boots), it's flagged as expected
    rather than a problem.

    Args:
        dbc_cursor: Cursor for current dbc database
        original_dbc_cursor: Cursor for original_dbc (stock WOTLK reference)
        acore_cursor: Cursor for acore_world (item_template lookups)

    Returns:
        list of dicts with: outfit_id, race, class_id, gender, missing (list of str)
    """
    # Essential inventory types
    ESSENTIAL_CHECKS = {
        'Shirt/Chest/Robe': {4, 5, 20},
        'Legs': {7},
        'Feet': {8},
    }

    # Query ALL outfits (no race filter) and stock outfits
    item_cols = ', '.join(f'item_{i}' for i in range(1, 25))
    dbc_cursor.execute(f"""
        SELECT id, race, class, gender, {item_cols}
        FROM charstartoutfit
        ORDER BY race, class, gender
    """)
    current_rows = dbc_cursor.fetchall()

    original_dbc_cursor.execute(f"""
        SELECT id, race, class, gender, {item_cols}
        FROM charstartoutfit
        ORDER BY race, class, gender
    """)
    stock_rows = original_dbc_cursor.fetchall()

    # Collect all real item IDs for batch lookup (from both current and stock)
    all_item_ids = set()
    for row in list(current_rows) + list(stock_rows):
        for item_id in row[4:28]:
            if item_id and item_id > 0 and item_id != 6948:
                all_item_ids.add(item_id)

    # Batch lookup InventoryType from item_template
    item_invtypes = {}
    if all_item_ids:
        placeholders = ','.join(['%s'] * len(all_item_ids))
        acore_cursor.execute(f"""
            SELECT entry, InventoryType FROM item_template
            WHERE entry IN ({placeholders})
        """, tuple(all_item_ids))
        for entry, inv_type in acore_cursor.fetchall():
            item_invtypes[entry] = inv_type

    # Build stock reference: what types does stock WOTLK have per (race, class)?
    # Use gender=0 as reference since male/female have same item types
    stock_types = {}
    for row in stock_rows:
        key = (row[1], row[2])  # race, class
        if key not in stock_types:
            stock_types[key] = _get_equipped_types(row[4:28], item_invtypes)

    # Check each outfit
    problems = []
    for row in current_rows:
        outfit_id, race_id, class_id, gender = row[0], row[1], row[2], row[3]

        # Skip Death Knights — they have full gear from DK starting zone
        if class_id == 6:
            continue

        equipped = _get_equipped_types(row[4:28], item_invtypes)
        stock_key = (race_id, class_id)
        stock_equipped = stock_types.get(stock_key)

        missing = []
        for label, required_types in ESSENTIAL_CHECKS.items():
            if not equipped & required_types:
                # Missing in current — check if stock also lacks it
                if stock_equipped is not None and not stock_equipped & required_types:
                    continue  # Expected: stock WOTLK also missing this type
                missing.append(label)

        if missing:
            has_stock = stock_equipped is not None
            problems.append({
                'outfit_id': outfit_id,
                'race': race_id,
                'race_name': RACE_NAMES.get(race_id, f'Race {race_id}'),
                'class_id': class_id,
                'class_name': CLASS_NAMES.get(class_id, f'Class {class_id}'),
                'gender': gender,
                'gender_name': GENDER_NAMES.get(gender, f'Gender {gender}'),
                'missing': missing,
                'has_stock_ref': has_stock,
            })

    return problems


def format_essential_items_report(problems):
    """Format essential items check results into a human-readable string."""
    lines = []
    lines.append("=" * 80)
    lines.append("ESSENTIAL ITEMS CHECK")
    lines.append("=" * 80)
    lines.append("Verifies every outfit has: Shirt/Chest/Robe, Legs, Feet")
    lines.append("(Skips items missing in stock WOTLK too, e.g. barefoot Tauren)")
    lines.append("")

    if not problems:
        lines.append("All outfits have essential clothing!")
        return '\n'.join(lines)

    # Split into stock-referenced (real problems) and no-reference (informational)
    real_problems = [p for p in problems if p['has_stock_ref']]
    no_ref_problems = [p for p in problems if not p['has_stock_ref']]

    if real_problems:
        lines.append(f"PROBLEMS: {len(real_problems)} outfit(s) missing items that stock WOTLK has:")
        lines.append("")
        for p in real_problems:
            label = f"{p['race_name']} {p['class_name']} ({p['gender_name']}) [id={p['outfit_id']}]"
            missing_str = ', '.join(p['missing'])
            lines.append(f"  {label}")
            lines.append(f"    Missing: {missing_str}")
        lines.append("")

    if no_ref_problems:
        # Group by (race, class, missing) to collapse male/female
        grouped = {}
        for p in no_ref_problems:
            key = (p['race'], p['class_id'], tuple(p['missing']))
            if key not in grouped:
                grouped[key] = p
                grouped[key]['ids'] = [p['outfit_id']]
            else:
                grouped[key]['ids'].append(p['outfit_id'])

        lines.append(f"INFO: {len(grouped)} custom race/class combo(s) missing items (no stock baseline):")
        lines.append("")
        for key, p in sorted(grouped.items()):
            ids_str = ', '.join(str(i) for i in p['ids'])
            missing_str = ', '.join(p['missing'])
            lines.append(f"  {p['race_name']} {p['class_name']} [ids={ids_str}] — Missing: {missing_str}")
        lines.append("")

    if not real_problems:
        lines.append("No unexpected problems found (all gaps match stock WOTLK or are custom combos).")
        lines.append("")

    return '\n'.join(lines)


def reset_to_stock(dbc_cursor, dbc_conn, original_dbc_cursor):
    """
    Reset item and inventory_type slots to stock WOTLK values.

    Updates item_1..24 and inventory_type_1..24 for every outfit that exists
    in both current and stock. Skips Goblin (race=9) and Worgen (race=12)
    since they have no stock data. Does NOT touch display_item columns.

    Args:
        dbc_cursor: Cursor for current dbc database
        dbc_conn: Connection for current dbc (for commit)
        original_dbc_cursor: Cursor for original_dbc (stock WOTLK)

    Returns:
        int: Number of rows reset
    """
    click.echo("=" * 80)
    click.echo("RESETTING ITEM SLOTS TO STOCK WOTLK")
    click.echo("=" * 80)
    click.echo()

    # Read stock data
    original_dbc_cursor.execute(_RESET_QUERY)
    stock_rows = original_dbc_cursor.fetchall()

    # Build stock lookup by (race, class, gender)
    stock_lookup = {}
    for row in stock_rows:
        key = (row[1], row[2], row[3])
        stock_lookup[key] = row

    # Read current data to get outfit IDs
    dbc_cursor.execute(_RESET_QUERY)
    current_rows = dbc_cursor.fetchall()

    # Build SET clause for all item + invtype columns
    set_cols = []
    for i in range(1, 25):
        set_cols.append(f'item_{i} = %s')
    for i in range(1, 25):
        set_cols.append(f'inventory_type_{i} = %s')
    set_clause = ', '.join(set_cols)

    reset_count = 0
    skipped_custom = 0

    for row in current_rows:
        outfit_id = row[0]
        race_id, class_id, gender = row[1], row[2], row[3]

        key = (race_id, class_id, gender)
        stock_row = stock_lookup.get(key)

        if stock_row is None:
            skipped_custom += 1
            continue

        # Extract stock items (indices 4-27) and invtypes (indices 28-51)
        stock_items = stock_row[4:28]
        stock_invtypes = stock_row[28:52]

        # Update current row to match stock
        values = list(stock_items) + list(stock_invtypes) + [outfit_id]
        dbc_cursor.execute(
            f"UPDATE charstartoutfit SET {set_clause} WHERE id = %s",
            values
        )
        reset_count += 1

    dbc_conn.commit()

    click.echo(f"Reset {reset_count} outfits to stock WOTLK values")
    if skipped_custom:
        click.echo(f"Skipped {skipped_custom} custom outfits (no stock data)")
    click.echo()

    return reset_count
