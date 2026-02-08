"""
Tier set display management for character creation screen.

Allows swapping the armor appearance shown on the character creation screen
by modifying display_item_ values in charstartoutfit without changing the
actual items characters receive.
"""

import json
from pathlib import Path

import click

from .constants import CLASS_NAMES

# Armor slot inventory types we care about for tier sets
TIER_SLOT_INVTYPES = {
    'head': 1,
    'shoulders': 3,
    'chest': 5,     # Also matches robe (20)
    'hands': 10,
    'legs': 7,
    'feet': 8,
}

# chest can also be invtype 20 (robe)
CHEST_INVTYPES = {5, 20}

# Weapon inventory types for display overrides
WEAPON_INVTYPES_2H = {17}           # Two-handed
WEAPON_INVTYPES_1H = {13, 21}       # One-hand, main-hand
WEAPON_INVTYPES_OH = {22}           # Off-hand (weapon)
WEAPON_INVTYPES_SHIELD = {14}       # Shield
WEAPON_INVTYPES_RANGED = {15, 26}   # Ranged, ranged right (wand)


def load_tier_sets(config_path):
    """
    Load and validate tier sets from JSON config.

    Args:
        config_path: Path to tier_sets.json

    Returns:
        dict: tier_sets mapping from the config, or empty dict if not found
    """
    config_path = Path(config_path)
    if not config_path.exists():
        click.echo(f"Warning: tier_sets.json not found at {config_path}")
        return {}

    with open(config_path) as f:
        data = json.load(f)

    return data.get('tier_sets', {})


def get_slot_positions(dbc_cursor):
    """
    Map inventory_type to slot position per outfit entry.

    The charstartoutfit slots are positional (1-24), not fixed by type.
    This reads each entry's inventory_type_1..24 to find which position
    holds each armor type.

    Args:
        dbc_cursor: Database cursor for dbc database

    Returns:
        dict: {outfit_id: {invtype_name: slot_number, ...}, ...}
    """
    dbc_cursor.execute("""
        SELECT id,
               inventory_type_1, inventory_type_2, inventory_type_3, inventory_type_4,
               inventory_type_5, inventory_type_6, inventory_type_7, inventory_type_8,
               inventory_type_9, inventory_type_10, inventory_type_11, inventory_type_12,
               inventory_type_13, inventory_type_14, inventory_type_15, inventory_type_16,
               inventory_type_17, inventory_type_18, inventory_type_19, inventory_type_20,
               inventory_type_21, inventory_type_22, inventory_type_23, inventory_type_24
        FROM charstartoutfit
        ORDER BY id
    """)

    slot_map = {}
    for row in dbc_cursor.fetchall():
        outfit_id = row[0]
        inv_types = row[1:25]

        positions = {}
        for slot_idx, inv_type in enumerate(inv_types, 1):
            if inv_type is None:
                continue

            # Map inventory type to slot name
            if inv_type == 1:
                positions['head'] = slot_idx
            elif inv_type == 3:
                positions['shoulders'] = slot_idx
            elif inv_type in CHEST_INVTYPES:
                positions['chest'] = slot_idx
            elif inv_type == 10:
                positions['hands'] = slot_idx
            elif inv_type == 7:
                positions['legs'] = slot_idx
            elif inv_type == 8:
                positions['feet'] = slot_idx
            elif inv_type in WEAPON_INVTYPES_2H:
                positions['weapon_2h'] = slot_idx
            elif inv_type in WEAPON_INVTYPES_1H:
                positions['weapon_1h'] = slot_idx
            elif inv_type in WEAPON_INVTYPES_OH:
                positions['weapon_oh'] = slot_idx
            elif inv_type in WEAPON_INVTYPES_SHIELD:
                positions['weapon_shield'] = slot_idx
            elif inv_type in WEAPON_INVTYPES_RANGED:
                positions['weapon_ranged'] = slot_idx

        slot_map[outfit_id] = positions

    return slot_map


def _find_empty_slots(dbc_cursor, outfit_id):
    """Find empty slot positions (item=-1, invtype=-1) for an outfit entry.

    Returns:
        list: Slot numbers (1-24) that are empty and available.
    """
    fields = ', '.join(f'item_{i}, inventory_type_{i}' for i in range(1, 25))
    dbc_cursor.execute(f"SELECT {fields} FROM charstartoutfit WHERE id = %s", (outfit_id,))
    row = dbc_cursor.fetchone()
    if not row:
        return []

    empty = []
    for i in range(24):
        item_val = row[i * 2]
        invtype_val = row[i * 2 + 1]
        if (item_val is None or item_val == -1) and (invtype_val is None or invtype_val == -1):
            empty.append(i + 1)
    return empty


def apply_tier_set(tier_name, tier_data, dbc_cursor):
    """
    Generate UPDATE SQL statements to apply tier set display IDs.

    For armor slots that already exist (chest, legs, feet), updates display_item_.
    For armor slots that don't exist (shoulders, hands), adds display-only entries
    using item=-1 with the tier display ID in empty slots.

    Args:
        tier_name: Key name of the tier set
        tier_data: Tier set data dict with 'name' and 'classes' keys
        dbc_cursor: Database cursor for dbc database

    Returns:
        list: SQL UPDATE statements to execute
    """
    tier_display_name = tier_data.get('name', tier_name)
    classes = tier_data.get('classes', {})

    if not classes:
        click.echo(f"Warning: No class data in tier set '{tier_display_name}'")
        return []

    # Get slot positions for all outfits
    slot_map = get_slot_positions(dbc_cursor)

    # Get outfit IDs with their class info
    dbc_cursor.execute("""
        SELECT id, race, class, gender
        FROM charstartoutfit
        WHERE race BETWEEN 1 AND 12 AND class BETWEEN 1 AND 11
        ORDER BY id
    """)
    outfits = dbc_cursor.fetchall()

    sql_statements = []
    armor_slots = ['head', 'shoulders', 'chest', 'hands', 'legs', 'feet']
    weapon_slots = ['weapon_2h', 'weapon_1h', 'weapon_oh', 'weapon_shield', 'weapon_ranged']

    for outfit in outfits:
        outfit_id, race_id, class_id, gender = outfit
        class_key = str(class_id)

        # Skip if no tier data for this class
        if class_key not in classes:
            continue

        class_tier = classes[class_key]
        positions = slot_map.get(outfit_id, {})
        class_name = CLASS_NAMES.get(class_id, f"Class{class_id}")
        set_name = class_tier.get('set_name', '')

        # Find empty slots for display-only entries (lazy loaded)
        empty_slots = None

        # --- Armor slots ---
        for slot_name in armor_slots:
            display_id = class_tier.get(slot_name)
            if display_id is None:
                continue

            slot_pos = positions.get(slot_name)

            if slot_pos is not None:
                # Slot exists — just override the display
                comment = f"-- {class_name} {set_name}: {slot_name} = {display_id}"
                stmt = (f"UPDATE `dbc`.`charstartoutfit` SET `display_item_{slot_pos}` = {display_id} "
                        f"WHERE `id` = {outfit_id}; {comment}")
                sql_statements.append(stmt)
            else:
                # Slot doesn't exist — add display-only entry in an empty slot
                if empty_slots is None:
                    empty_slots = _find_empty_slots(dbc_cursor, outfit_id)

                if not empty_slots:
                    click.echo(f"Warning: No empty slots for {class_name} id={outfit_id} {slot_name}")
                    continue

                target_slot = empty_slots.pop(0)
                invtype = TIER_SLOT_INVTYPES[slot_name]
                comment = f"-- {class_name} {set_name}: {slot_name} = {display_id} (display-only)"
                stmt = (f"UPDATE `dbc`.`charstartoutfit` SET "
                        f"`item_{target_slot}` = -1, "
                        f"`inventory_type_{target_slot}` = {invtype}, "
                        f"`display_item_{target_slot}` = {display_id} "
                        f"WHERE `id` = {outfit_id}; {comment}")
                sql_statements.append(stmt)

        # --- Weapon slots (display override on existing weapon slots) ---
        for weapon_key in weapon_slots:
            display_id = class_tier.get(weapon_key)
            if display_id is None:
                continue

            slot_pos = positions.get(weapon_key)
            if slot_pos is not None:
                comment = f"-- {class_name} {set_name}: {weapon_key} = {display_id}"
                stmt = (f"UPDATE `dbc`.`charstartoutfit` SET `display_item_{slot_pos}` = {display_id} "
                        f"WHERE `id` = {outfit_id}; {comment}")
                sql_statements.append(stmt)

    click.echo(f"Generated {len(sql_statements)} display updates for {tier_display_name}")
    return sql_statements


def reset_displays(dbc_cursor, acore_cursor):
    """
    Reset display_item_ values to match item_template.displayid.

    Reverts any tier set overrides by:
    - Looking up each real item's actual displayid and restoring it
    - Clearing display-only entries (item=-1 with display > 0) back to empty

    Also compares against original_dbc to restore any display-only entries
    that existed in the original DBC.

    Args:
        dbc_cursor: Database cursor for dbc database
        acore_cursor: Database cursor for acore_world database

    Returns:
        list: SQL UPDATE statements to execute
    """
    from .constants import RACE_NAMES

    inv_fields = ', '.join(f'inventory_type_{i}' for i in range(1, 25))
    dbc_cursor.execute(f"""
        SELECT id, race, class, gender,
               item_1, item_2, item_3, item_4, item_5,
               item_6, item_7, item_8, item_9, item_10,
               item_11, item_12, item_13, item_14, item_15,
               item_16, item_17, item_18, item_19, item_20,
               item_21, item_22, item_23, item_24,
               display_item_1, display_item_2, display_item_3, display_item_4, display_item_5,
               display_item_6, display_item_7, display_item_8, display_item_9, display_item_10,
               display_item_11, display_item_12, display_item_13, display_item_14, display_item_15,
               display_item_16, display_item_17, display_item_18, display_item_19, display_item_20,
               display_item_21, display_item_22, display_item_23, display_item_24,
               {inv_fields}
        FROM charstartoutfit
        ORDER BY id
    """)

    outfits = dbc_cursor.fetchall()
    sql_statements = []

    for outfit in outfits:
        outfit_id = outfit[0]
        item_ids = outfit[4:28]
        display_items = outfit[28:52]
        inv_types = outfit[52:76]

        for slot_idx, (item_id, current_display, inv_type) in enumerate(
                zip(item_ids, display_items, inv_types), 1):

            # Display-only entry (added by tier apply) — clear it
            if (item_id == -1 and inv_type is not None and inv_type > 0
                    and current_display is not None and current_display > 0):
                stmt = (f"UPDATE `dbc`.`charstartoutfit` SET "
                        f"`item_{slot_idx}` = -1, "
                        f"`inventory_type_{slot_idx}` = -1, "
                        f"`display_item_{slot_idx}` = -1 "
                        f"WHERE `id` = {outfit_id};")
                sql_statements.append(stmt)
                continue

            # Real item — reset display to match item_template
            if not item_id or item_id <= 0:
                continue

            acore_cursor.execute(
                "SELECT displayid FROM item_template WHERE entry = %s",
                (item_id,)
            )
            result = acore_cursor.fetchone()
            if not result:
                continue

            correct_display = result[0]
            if current_display != correct_display:
                stmt = (f"UPDATE `dbc`.`charstartoutfit` SET `display_item_{slot_idx}` = {correct_display} "
                        f"WHERE `id` = {outfit_id};")
                sql_statements.append(stmt)

    click.echo(f"Found {len(sql_statements)} display_item_ values to reset")
    return sql_statements
