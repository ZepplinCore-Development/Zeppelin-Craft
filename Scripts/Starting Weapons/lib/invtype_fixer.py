"""
invType fixing for charstartoutfit items.

Scans all items in charstartoutfit and fixes missing or incorrect invType values
by comparing against item_template database.
"""

from .constants import RACE_NAMES, CLASS_NAMES, WEAPON_SKILLS, SKILL_TO_INVTYPE


def find_invtype_fixes(dbc_cursor, acore_cursor):
    """
    Find items with missing or incorrect invType values.

    Scans all charstartoutfit entries and identifies items that have an itemId
    but missing or incorrect invType value. Determines correct invType from
    item_template database.

    For weapons: Uses skill-based invType mapping (SKILL_TO_INVTYPE)
    For ammo: Forces invType 24
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
            - inv_type: Correct invType value
    """
    print("=" * 80)
    print("SCANNING FOR MISSING INVTYPE VALUES")
    print("=" * 80)
    print()

    invtype_fixes = []

    # Get all outfits with all item slots
    dbc_cursor.execute("""
        SELECT o.ID, o.race, o.class, o.gender,
               o.itemId1, o.itemId2, o.itemId3, o.itemId4, o.itemId5,
               o.itemId6, o.itemId7, o.itemId8, o.itemId9, o.itemId10,
               o.itemId11, o.itemId12, o.itemId13, o.itemId14, o.itemId15,
               o.itemId16, o.itemId17, o.itemId18, o.itemId19, o.itemId20,
               o.itemId21, o.itemId22, o.itemId23, o.itemId24,
               o.invType1, o.invType2, o.invType3, o.invType4, o.invType5,
               o.invType6, o.invType7, o.invType8, o.invType9, o.invType10,
               o.invType11, o.invType12, o.invType13, o.invType14, o.invType15,
               o.invType16, o.invType17, o.invType18, o.invType19, o.invType20,
               o.invType21, o.invType22, o.invType23, o.invType24
        FROM charstartoutfit o
        WHERE o.race BETWEEN 1 AND 12 AND o.class BETWEEN 1 AND 11
    """)

    outfits = dbc_cursor.fetchall()

    for outfit in outfits:
        outfit_id = outfit[0]
        race_id = outfit[1]
        class_id = outfit[2]
        gender = outfit[3]
        item_ids = outfit[4:28]      # itemId1-24 (24 slots)
        inv_types = outfit[28:52]    # invType1-24 (24 slots)

        race_name = RACE_NAMES.get(race_id, f"Race{race_id}")
        class_name = CLASS_NAMES.get(class_id, f"Class{class_id}")
        gender_name = "Male" if gender == 0 else "Female"

        for slot_idx, (item_id, inv_type) in enumerate(zip(item_ids, inv_types), 1):
            # Skip empty slots and hearthstone
            if not item_id or item_id <= 0 or item_id == 6948:
                continue

            # Look up item in item_template to determine correct invType
            acore_cursor.execute(
                "SELECT class, subclass, name, InventoryType FROM item_template WHERE entry = %s",
                (item_id,)
            )
            result = acore_cursor.fetchone()

            if not result:
                continue

            item_class, subclass, item_name, correct_inv_type = result

            # Weapons (class 2) - use skill-based invType mapping
            if item_class == 2 and subclass in WEAPON_SKILLS:
                skill_id, skill_name = WEAPON_SKILLS[subclass]
                correct_inv_type = SKILL_TO_INVTYPE.get(skill_id, correct_inv_type)

            # Ammo (class 6) - always invType 24
            elif item_class == 6:
                correct_inv_type = 24

            # Only fix if invType is missing/wrong (NULL, -1, or different from correct value)
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

    print(f"Found {len(invtype_fixes)} items with missing/incorrect invType")
    print()

    return invtype_fixes
