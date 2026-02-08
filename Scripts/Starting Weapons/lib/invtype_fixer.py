"""
inventory_type_ fixing for charstartoutfit items.

Scans all items in charstartoutfit and fixes missing or incorrect inventory_type_ values
by comparing against item_template database.
"""

from .constants import RACE_NAMES, CLASS_NAMES, WEAPON_SKILLS, SKILL_TO_INVTYPE


def find_invtype_fixes(dbc_cursor, acore_cursor):
    """
    Find items with missing or incorrect inventory_type_ values.

    Scans all charstartoutfit entries and identifies items that have an item_
    but missing or incorrect inventory_type_ value. Determines correct inventory_type_ from
    item_template database.

    For weapons: Uses skill-based inventory_type_ mapping (SKILL_TO_INVTYPE)
    For ammo: Forces inventory_type_ 24
    For other items: Uses item_template.InventoryType directly

    Args:
        dbc_cursor: Database cursor for dbc database
        acore_cursor: Database cursor for acore_world database

    Returns:
        list: List of dicts with keys:
            - outfit_id: charstartoutfit ID
            - race: Race name
            - class: Class name
            - gender: Gender name
            - slot: Slot number (1-24)
            - item_id: Item entry ID
            - item_name: Item name
            - inv_type: Correct inventory_type_ value
    """
    print("=" * 80)
    print("SCANNING FOR MISSING INVTYPE VALUES")
    print("=" * 80)
    print()

    invtype_fixes = []

    # Get all outfits with all item slots
    dbc_cursor.execute("""
        SELECT o.id, o.race, o.class, o.gender,
               o.item_1, o.item_2, o.item_3, o.item_4, o.item_5,
               o.item_6, o.item_7, o.item_8, o.item_9, o.item_10,
               o.item_11, o.item_12, o.item_13, o.item_14, o.item_15,
               o.item_16, o.item_17, o.item_18, o.item_19, o.item_20,
               o.item_21, o.item_22, o.item_23, o.item_24,
               o.inventory_type_1, o.inventory_type_2, o.inventory_type_3, o.inventory_type_4, o.inventory_type_5,
               o.inventory_type_6, o.inventory_type_7, o.inventory_type_8, o.inventory_type_9, o.inventory_type_10,
               o.inventory_type_11, o.inventory_type_12, o.inventory_type_13, o.inventory_type_14, o.inventory_type_15,
               o.inventory_type_16, o.inventory_type_17, o.inventory_type_18, o.inventory_type_19, o.inventory_type_20,
               o.inventory_type_21, o.inventory_type_22, o.inventory_type_23, o.inventory_type_24
        FROM charstartoutfit o
        WHERE o.race BETWEEN 1 AND 12 AND o.class BETWEEN 1 AND 11
    """)

    outfits = dbc_cursor.fetchall()

    for outfit in outfits:
        outfit_id = outfit[0]
        race_id = outfit[1]
        class_id = outfit[2]
        gender = outfit[3]
        item_ids = outfit[4:28]      # item_1-24 (24 slots)
        inv_types = outfit[28:52]    # inventory_type_1-24 (24 slots)

        race_name = RACE_NAMES.get(race_id, f"Race{race_id}")
        class_name = CLASS_NAMES.get(class_id, f"Class{class_id}")
        gender_name = "Male" if gender == 0 else "Female"

        for slot_idx, (item_id, inv_type) in enumerate(zip(item_ids, inv_types), 1):
            # Skip empty slots and hearthstone
            if not item_id or item_id <= 0 or item_id == 6948:
                continue

            # Look up item in item_template to determine correct inventory_type_
            acore_cursor.execute(
                "SELECT class, subclass, name, InventoryType FROM item_template WHERE entry = %s",
                (item_id,)
            )
            result = acore_cursor.fetchone()

            if not result:
                continue

            item_class, subclass, item_name, correct_inv_type = result

            # Weapons (class 2) - use skill-based inventory_type_ mapping
            if item_class == 2 and subclass in WEAPON_SKILLS:
                skill_id, skill_name = WEAPON_SKILLS[subclass]
                correct_inv_type = SKILL_TO_INVTYPE.get(skill_id, correct_inv_type)

            # Ammo (class 6) - always inventory_type_ 24
            elif item_class == 6:
                correct_inv_type = 24

            # Only fix if inventory_type_ is missing/wrong (NULL, -1, or different from correct value)
            # Normalize None to -1 for comparison
            current_inv_type = inv_type if inv_type is not None else -1

            # Only add to fixes if the database value differs from the correct value
            if current_inv_type != correct_inv_type:
                invtype_fixes.append({
                    'outfit_id': outfit_id,
                    'race': race_name,
                    'class': class_name,
                    'gender': gender_name,
                    'slot': slot_idx,
                    'item_id': item_id,
                    'item_name': item_name,
                    'inv_type': correct_inv_type
                })

    print(f"Found {len(invtype_fixes)} items with missing/incorrect inventory_type_")
    print()

    return invtype_fixes
