"""
Weapon validation and slot reading functions.

Contains logic for:
- Validating starter weapons against item_template
- Reading original WOTLK weapon slots
- Finding weapon replacements with priority
- Checking weapon types (melee/ranged)
"""

from .constants import (
    WEAPON_SKILLS, STARTER_WEAPON_CANDIDATES,
    MELEE_SKILL_PRIORITY, RANGED_SKILL_PRIORITY
)


def validate_starter_weapons(cursor):
    """
    Validate starter weapon candidates against item_template.

    Args:
        cursor: Database cursor for acore_world

    Returns:
        dict: {skill_id: item_id} for valid starter weapons
    """
    print("=" * 80)
    print("VALIDATING STARTER WEAPON ITEMS")
    print("=" * 80)
    print()

    validated_weapons = {}

    for skill_id, candidate_items in STARTER_WEAPON_CANDIDATES.items():
        skill_name = next(
            (name for subclass, (sid, name) in WEAPON_SKILLS.items() if sid == skill_id),
            f"Skill {skill_id}"
        )

        if not candidate_items:
            continue

        # Verify first candidate
        print(f"{skill_name} (skill {skill_id}):")
        item_id = candidate_items[0]
        cursor.execute("""
            SELECT entry, name, class, subclass
            FROM item_template
            WHERE entry = %s
        """, (item_id,))
        item = cursor.fetchone()

        if not item:
            print(f"  ✗ {item_id}: Item not found in database!")
            continue

        entry, name, item_class, subclass = item

        if item_class == 2:  # Weapon
            expected_subclass = next(
                (sc for sc, (sid, sname) in WEAPON_SKILLS.items() if sid == skill_id),
                None
            )
            if subclass == expected_subclass:
                print(f"  ✓ {entry} ({name}): Valid starter weapon")
                validated_weapons[skill_id] = entry
            else:
                print(f"  ✗ {entry} ({name}): Wrong subclass")
        else:
            print(f"  ✗ {entry} ({name}): Not a weapon")

        print()

    return validated_weapons


def get_race_mask_bit(race_id):
    """Get the bit position for a race ID in race masks."""
    return 1 << (race_id - 1)


def get_class_mask_bit(class_id):
    """Get the bit position for a class ID in class masks."""
    return 1 << (class_id - 1)


def is_valid_race_class_combo(cursor, race_id, class_id):
    """Check if a race/class combination exists in playercreateinfo."""
    query = """
        SELECT COUNT(*) FROM playercreateinfo
        WHERE race = %s AND class = %s
    """
    cursor.execute(query, (race_id, class_id))
    result = cursor.fetchone()
    return result[0] > 0


def get_available_weapon_skills(weapon_skills, race_id, class_id):
    """
    Get all weapon skills available to a race/class combination from spreadsheet data.

    Args:
        weapon_skills: Dict from read_weapon_skills_from_spreadsheet()
        race_id: Race ID
        class_id: Class ID

    Returns:
        list: [(skill_id, description), ...] for available skills
    """
    race_bit = get_race_mask_bit(race_id)
    class_bit = get_class_mask_bit(class_id)

    available_skills = []

    # Check each weapon skill
    for skill_id, data in weapon_skills.items():
        # Check each class entry for this skill
        for cls in data['classes']:
            # Check if this class mask matches
            if cls['class_mask'] & class_bit:
                # Check if this race mask matches
                race_mask = cls['race_mask']
                if race_mask == 4095 or (race_mask & race_bit):
                    available_skills.append((skill_id, f"{cls['name']} - {data['name']}"))
                    break  # Found a match for this skill, no need to check other class entries

    return available_skills


def get_original_weapon_slots(original_cursor, acore_cursor, race_id, class_id, gender):
    """
    Read original WOTLK weapon slots for a race/class/gender combination.

    Args:
        original_cursor: Cursor for original_dbc database
        acore_cursor: Cursor for acore_world database
        race_id: Race ID
        class_id: Class ID
        gender: Gender (0=Male, 1=Female)

    Returns:
        list: [{slot, item_id, item_name, skill_id, weapon_type, inv_type}, ...]
    """
    original_cursor.execute("""
        SELECT itemId1, itemId2, itemId3, itemId4, itemId5, itemId6, itemId7, itemId8,
               itemId9, itemId10, itemId11, itemId12, itemId13, itemId14, itemId15,
               itemId16, itemId17, itemId18, itemId19, itemId20, itemId21, itemId22,
               itemId23, itemId24
        FROM charstartoutfit
        WHERE race = %s AND class = %s AND gender = %s
    """, (race_id, class_id, gender))

    row = original_cursor.fetchone()
    if not row:
        return []

    weapon_slots = []
    for slot_idx, item_id in enumerate(row, start=1):
        if not item_id or item_id <= 0:
            continue

        # Look up item in item_template
        acore_cursor.execute("""
            SELECT class, subclass, InventoryType, name
            FROM item_template
            WHERE entry = %s
        """, (item_id,))

        item = acore_cursor.fetchone()
        if not item:
            continue

        item_class, subclass, inv_type, item_name = item

        # Only track weapons (class 2)
        if item_class != 2:
            continue

        # Get skill ID for this weapon
        if subclass not in WEAPON_SKILLS:
            continue

        skill_id, weapon_type = WEAPON_SKILLS[subclass]

        weapon_slots.append({
            'slot': slot_idx,
            'item_id': item_id,
            'item_name': item_name,
            'skill_id': skill_id,
            'weapon_type': weapon_type,
            'inv_type': inv_type
        })

    return weapon_slots


def get_current_weapon_slots(dbc_cursor, acore_cursor, race_id, class_id, gender):
    """
    Read CURRENT weapon slots from dbc database (NOT original_dbc).

    Use this to validate what's actually in the database against skill requirements.

    Args:
        dbc_cursor: Cursor for dbc database (current state)
        acore_cursor: Cursor for acore_world database
        race_id: Race ID
        class_id: Class ID
        gender: Gender (0=Male, 1=Female)

    Returns:
        list: [{slot, item_id, item_name, skill_id, weapon_type, inv_type}, ...]
    """
    dbc_cursor.execute("""
        SELECT itemId1, itemId2, itemId3, itemId4, itemId5, itemId6, itemId7, itemId8,
               itemId9, itemId10, itemId11, itemId12, itemId13, itemId14, itemId15,
               itemId16, itemId17, itemId18, itemId19, itemId20, itemId21, itemId22,
               itemId23, itemId24
        FROM charstartoutfit
        WHERE race = %s AND class = %s AND gender = %s
    """, (race_id, class_id, gender))

    row = dbc_cursor.fetchone()
    if not row:
        return []

    weapon_slots = []
    for slot_idx, item_id in enumerate(row, start=1):
        if not item_id or item_id <= 0:
            continue

        # Look up item in item_template
        acore_cursor.execute("""
            SELECT class, subclass, InventoryType, name
            FROM item_template
            WHERE entry = %s
        """, (item_id,))

        item = acore_cursor.fetchone()
        if not item:
            continue

        item_class, subclass, inv_type, item_name = item

        # Only track weapons (class 2)
        if item_class != 2:
            continue

        # Get skill ID for this weapon
        if subclass not in WEAPON_SKILLS:
            continue

        skill_id, weapon_type = WEAPON_SKILLS[subclass]

        weapon_slots.append({
            'slot': slot_idx,
            'item_id': item_id,
            'item_name': item_name,
            'skill_id': skill_id,
            'weapon_type': weapon_type,
            'inv_type': inv_type
        })

    return weapon_slots


def is_melee_weapon(skill_id):
    """Check if a weapon skill is melee."""
    return skill_id in MELEE_SKILL_PRIORITY


def is_ranged_weapon(skill_id):
    """Check if a weapon skill is ranged."""
    return skill_id in RANGED_SKILL_PRIORITY


def find_replacement_weapon(available_skills, is_melee, starter_weapons):
    """
    Find a replacement weapon from available skills.

    Uses priority-based fallback:
    - For melee: MELEE_SKILL_PRIORITY (daggers LAST)
    - For ranged: RANGED_SKILL_PRIORITY

    Args:
        available_skills: List of skill IDs available
        is_melee: True if finding melee weapon, False for ranged
        starter_weapons: Dict of {skill_id: item_id} starter weapons

    Returns:
        tuple: (skill_id, item_id) or (None, None) if no match
    """
    priority_list = MELEE_SKILL_PRIORITY if is_melee else RANGED_SKILL_PRIORITY

    for skill_id in priority_list:
        if skill_id in available_skills and skill_id in starter_weapons:
            return skill_id, starter_weapons[skill_id]

    return None, None
