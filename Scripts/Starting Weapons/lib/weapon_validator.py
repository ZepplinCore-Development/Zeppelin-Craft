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


def find_duplicate_weapons(dbc_cursor, acore_cursor):
    """
    Detect duplicate weapons in charstartoutfit.

    Finds three types of duplicates:
    1. Same weapon type duplicates (e.g., two daggers in different slots)
    2. Multiple different melee weapons (keeps first, removes rest)
    3. Multiple different ranged weapons (keeps first, removes rest)

    Args:
        dbc_cursor: Database cursor for dbc database
        acore_cursor: Database cursor for acore_world database

    Returns:
        list: List of dicts with keys:
            - outfit_id: charstartoutfit ID
            - race: Race name
            - class: Class name
            - gender: Gender name
            - slot: Slot number to clear
            - item_name: Weapon name being removed
            - reason: Why it's being removed
    """
    from .constants import RACE_NAMES, CLASS_NAMES

    print("=" * 80)
    print("SCANNING FOR DUPLICATE WEAPONS/AMMO")
    print("=" * 80)
    print()

    duplicate_cleanups = []

    # Melee and ranged skill categories
    melee_skills = [43, 44, 54, 55, 136, 160, 172, 173]
    ranged_skills = [45, 46, 226, 176, 228]

    # Get all outfits
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
        item_ids = outfit[4:28]      # itemId1-24
        inv_types = outfit[28:52]    # invType1-24

        race_name = RACE_NAMES.get(race_id, f"Race{race_id}")
        class_name = CLASS_NAMES.get(class_id, f"Class{class_id}")
        gender_name = "Male" if gender == 0 else "Female"

        # Track weapons and ammo by type to detect duplicates
        weapon_slots_by_type = {}
        weapon_inv_types = [13, 15, 17, 21, 22, 26]
        ammo_inv_type = 24

        # Track melee/ranged weapons across types for multi-weapon detection
        melee_weapon_slots = []  # [(slot, skill_id, skill_name), ...]
        ranged_weapon_slots = []  # [(slot, skill_id, skill_name), ...]

        for slot_idx, (item_id, inv_type) in enumerate(zip(item_ids, inv_types), 1):
            if not item_id or item_id <= 0 or item_id == 6948:
                continue

            # Check weapons
            if inv_type in weapon_inv_types:
                acore_cursor.execute(
                    "SELECT subclass FROM item_template WHERE entry = %s AND class = 2",
                    (item_id,)
                )
                result = acore_cursor.fetchone()
                if result and result[0] in WEAPON_SKILLS:
                    skill_id, skill_name = WEAPON_SKILLS[result[0]]
                    type_key = f"weapon_{skill_id}"
                    if type_key not in weapon_slots_by_type:
                        weapon_slots_by_type[type_key] = {'name': skill_name, 'slots': []}
                    weapon_slots_by_type[type_key]['slots'].append(slot_idx)

                    # Track melee vs ranged
                    if skill_id in melee_skills:
                        melee_weapon_slots.append((slot_idx, skill_id, skill_name))
                    elif skill_id in ranged_skills:
                        ranged_weapon_slots.append((slot_idx, skill_id, skill_name))

            # Check ammo
            elif inv_type == ammo_inv_type:
                acore_cursor.execute(
                    "SELECT subclass, name FROM item_template WHERE entry = %s AND class = 6",
                    (item_id,)
                )
                result = acore_cursor.fetchone()
                if result:
                    ammo_subclass = result[0]
                    ammo_name = result[1]
                    type_key = f"ammo_{ammo_subclass}"
                    if type_key not in weapon_slots_by_type:
                        weapon_slots_by_type[type_key] = {'name': ammo_name, 'slots': []}
                    weapon_slots_by_type[type_key]['slots'].append(slot_idx)

        # Find duplicates of same weapon type
        for type_key, type_data in weapon_slots_by_type.items():
            slots = type_data['slots']
            if len(slots) > 1:
                item_name = type_data['name']
                for slot_idx in slots[1:]:
                    duplicate_cleanups.append({
                        'outfit_id': outfit_id,
                        'race': race_name,
                        'class': class_name,
                        'gender': gender_name,
                        'slot': slot_idx,
                        'item_name': item_name,
                        'reason': 'Duplicate same weapon type'
                    })

        # Detect multiple different melee weapons (e.g., axe + dagger)
        if len(melee_weapon_slots) > 1:
            # Keep first melee weapon, remove the rest
            for slot_idx, skill_id, skill_name in melee_weapon_slots[1:]:
                duplicate_cleanups.append({
                    'outfit_id': outfit_id,
                    'race': race_name,
                    'class': class_name,
                    'gender': gender_name,
                    'slot': slot_idx,
                    'item_name': skill_name,
                    'reason': f'Multiple melee weapons (keeping first, removing extra {skill_name})'
                })

        # Detect multiple different ranged weapons (e.g., bow + gun)
        if len(ranged_weapon_slots) > 1:
            # Keep first ranged weapon, remove the rest
            for slot_idx, skill_id, skill_name in ranged_weapon_slots[1:]:
                duplicate_cleanups.append({
                    'outfit_id': outfit_id,
                    'race': race_name,
                    'class': class_name,
                    'gender': gender_name,
                    'slot': slot_idx,
                    'item_name': skill_name,
                    'reason': f'Multiple ranged weapons (keeping first, removing extra {skill_name})'
                })

    print(f"Found {len(duplicate_cleanups)} duplicate weapons/ammo to clean up")
    print()

    return duplicate_cleanups


def validate_weapon_coverage(weapon_skills, source_cursor, acore_cursor, validated_weapons):
    """
    Two-pass validation of starting weapons against CSV weapon skill requirements.

    Pass 1: Check existing weapons in charstartoutfit for mismatches
    - Weapon requires skill character doesn't have → mark for replacement/removal

    Pass 2: Ensure characters have adequate weapon coverage
    - Has melee skill but no melee weapon → add one
    - Has ranged skill but no ranged weapon → add one (+ ammo if needed)

    Args:
        weapon_skills: Dict from read_weapon_skills_from_spreadsheet()
        source_cursor: Database cursor to read from (dbc or original_dbc)
        acore_cursor: Database cursor for acore_world (item lookups)
        validated_weapons: Dict of {skill_id: item_id} for starter weapons

    Returns:
        tuple: (mismatches, weapon_additions)
        - mismatches: List of weapons to replace/remove
        - weapon_additions: List of weapons/ammo to add
    """
    from .constants import RACE_NAMES, CLASS_NAMES, STARTER_AMMO, SKILL_TO_INVTYPE

    print("=" * 80)
    print("VALIDATING WEAPON COVERAGE")
    print("=" * 80)
    print()

    mismatches = []
    weapon_additions = []
    skipped_invalid = 0

    # Melee and ranged skill categories
    melee_skills = [43, 44, 54, 55, 136, 160, 172, 173]
    ranged_skills = [45, 46, 226, 176, 228]
    weapon_inv_types = [13, 15, 17, 21, 22, 26]

    # Get all outfits with weapons
    query = """
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
    """

    source_cursor.execute(query)
    outfits = source_cursor.fetchall()

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

        # Skip invalid race/class combinations
        if not is_valid_race_class_combo(acore_cursor, race_id, class_id):
            skipped_invalid += 1
            continue

        # Get available weapon skills from CSV for this race/class
        available_skills = get_available_weapon_skills(weapon_skills, race_id, class_id)
        available_skill_ids = [skill_id for skill_id, _ in available_skills]

        # Track what weapons this outfit will have after fixes
        outfit_weapons = {}  # slot_idx -> (skill_id, item_id)

        # PASS 1: Check each weapon slot for mismatches
        for slot_idx, (item_id, inv_type) in enumerate(zip(item_ids, inv_types), 1):
            if not item_id or item_id <= 0 or item_id == 6948:
                continue

            if inv_type not in weapon_inv_types:
                continue

            # Get item details
            acore_cursor.execute(
                "SELECT entry, name, class, subclass FROM item_template WHERE entry = %s",
                (item_id,)
            )
            item = acore_cursor.fetchone()

            if not item or item[2] != 2:  # Not a weapon
                continue

            item_name = item[1]
            subclass = item[3]

            # Check if they have the required skill
            if subclass not in WEAPON_SKILLS:
                continue

            required_skill_id, weapon_type = WEAPON_SKILLS[subclass]

            if required_skill_id not in available_skill_ids:
                # Found a mismatch - find replacement
                replacement_item = None
                replacement_skill = None

                # Prioritize similar weapon types with fallbacks
                if required_skill_id in [43, 44, 54]:  # 1H melee
                    for skill in [54, 44, 43, 173]:
                        if skill in available_skill_ids and skill in validated_weapons:
                            replacement_skill = skill
                            replacement_item = validated_weapons[skill]
                            break
                elif required_skill_id in [55, 160, 172]:  # 2H melee
                    for skill in [160, 172, 55, 54, 44, 43, 173]:
                        if skill in available_skill_ids and skill in validated_weapons:
                            replacement_skill = skill
                            replacement_item = validated_weapons[skill]
                            break
                elif required_skill_id == 136:  # Staves - casters get wand instead
                    if 228 in available_skill_ids and 228 in validated_weapons:
                        replacement_skill = 228
                        replacement_item = validated_weapons[228]
                elif required_skill_id in [45, 46, 47]:  # Ranged
                    for skill in [46, 45, 47, 176]:
                        if skill in available_skill_ids and skill in validated_weapons:
                            replacement_skill = skill
                            replacement_item = validated_weapons[skill]
                            break
                elif required_skill_id == 173:  # Daggers
                    for skill in [173, 54, 44, 43]:
                        if skill in available_skill_ids and skill in validated_weapons:
                            replacement_skill = skill
                            replacement_item = validated_weapons[skill]
                            break
                elif required_skill_id == 228:  # Wands
                    if 228 in available_skill_ids and 228 in validated_weapons:
                        replacement_skill = 228
                        replacement_item = validated_weapons[228]

                mismatches.append({
                    'outfit_id': outfit_id,
                    'race': race_name,
                    'class': class_name,
                    'gender': gender_name,
                    'slot': slot_idx,
                    'current_item': item_id,
                    'current_name': item_name,
                    'current_type': weapon_type,
                    'required_skill': required_skill_id,
                    'replacement_item': replacement_item if replacement_item else 0,
                    'replacement_skill': replacement_skill,
                    'available_skills': available_skill_ids
                })

                # Track the replacement
                if replacement_skill:
                    outfit_weapons[slot_idx] = (replacement_skill, replacement_item)
            else:
                # Valid weapon - track it
                outfit_weapons[slot_idx] = (required_skill_id, item_id)

        # PASS 2: Ensure they have weapons for their available skills
        has_melee_skill = any(skill in available_skill_ids for skill in melee_skills)
        has_ranged_skill = any(skill in available_skill_ids for skill in ranged_skills)

        # Check what types of weapons they currently have (after replacements)
        has_melee_weapon = any(skill_id in melee_skills for skill_id, _ in outfit_weapons.values())
        has_ranged_weapon = any(skill_id in ranged_skills for skill_id, _ in outfit_weapons.values())

        # Find first empty slot for additions
        empty_slots = [i for i in range(1, 25) if item_ids[i-1] <= 0 or item_ids[i-1] == 0]

        # If they have melee skill but no melee weapon, add one
        if has_melee_skill and not has_melee_weapon:
            for skill in melee_skills:
                if skill in available_skill_ids and skill in validated_weapons:
                    if empty_slots:
                        slot = empty_slots.pop(0)
                        skill_name = next((name for sid, name in WEAPON_SKILLS.values() if sid == skill), f"Skill {skill}")
                        weapon_additions.append({
                            'outfit_id': outfit_id,
                            'race': race_name,
                            'class': class_name,
                            'gender': gender_name,
                            'slot': slot,
                            'add_item': validated_weapons[skill],
                            'add_skill': skill,
                            'reason': f'Has melee skill, needs melee weapon'
                        })
                        break

        # If they have ranged skill but no ranged weapon, add one
        if has_ranged_skill and not has_ranged_weapon:
            for skill in ranged_skills:
                if skill in available_skill_ids and skill in validated_weapons:
                    if empty_slots:
                        slot = empty_slots.pop(0)
                        skill_name = next((name for sid, name in WEAPON_SKILLS.values() if sid == skill), f"Skill {skill}")
                        weapon_additions.append({
                            'outfit_id': outfit_id,
                            'race': race_name,
                            'class': class_name,
                            'gender': gender_name,
                            'slot': slot,
                            'add_item': validated_weapons[skill],
                            'add_skill': skill,
                            'reason': f'Has ranged skill, needs ranged weapon'
                        })

                        # If this weapon needs ammo (bows, guns, crossbows), add ammo too
                        if skill in STARTER_AMMO and empty_slots:
                            ammo_slot = empty_slots.pop(0)
                            ammo_item = STARTER_AMMO[skill]
                            weapon_additions.append({
                                'outfit_id': outfit_id,
                                'race': race_name,
                                'class': class_name,
                                'gender': gender_name,
                                'slot': ammo_slot,
                                'add_item': ammo_item,
                                'add_skill': None,  # Ammo doesn't have a skill
                                'reason': f'Ammo for {skill_name}',
                                'is_ammo': True
                            })
                        break

    # Report results
    weapons_only = [a for a in weapon_additions if not a.get('is_ammo')]
    ammo_only = [a for a in weapon_additions if a.get('is_ammo')]
    print(f"Skipped {skipped_invalid} invalid race/class combinations")
    print(f"Found {len(mismatches)} weapon mismatches")
    print(f"Found {len(weapons_only)} weapon additions needed")
    print(f"Found {len(ammo_only)} ammo additions needed")
    print()

    return mismatches, weapon_additions
