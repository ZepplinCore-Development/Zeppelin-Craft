"""
Weapon validation and slot reading functions.

Contains logic for:
- Validating starter weapons against item_template
- Reading original WOTLK weapon slots
- Finding weapon replacements with priority
- Checking weapon types (melee/ranged)
- Validating display_item_ matches item_template.displayid
"""

from .constants import (
    WEAPON_SKILLS, STARTER_WEAPON_CANDIDATES,
    MELEE_SKILL_PRIORITY, RANGED_SKILL_PRIORITY
)


def validate_display_info(dbc_cursor, acore_cursor):
    """
    Validate that charstartoutfit display_item_ matches item_template.displayid.

    The WoW client uses display_item_ from charstartoutfit for character creation
    preview - it does NOT look up item_template.displayid. If these don't match,
    the wrong model (or no model) will be shown.

    Args:
        dbc_cursor: Database cursor for dbc database
        acore_cursor: Database cursor for acore_world database

    Returns:
        list: List of dicts with display_item_ mismatches:
            - outfit_id: charstartoutfit ID
            - race: Race name
            - class: Class name
            - gender: Gender name
            - slot: Slot number (1-24)
            - item_id: Item ID in that slot
            - item_name: Item name
            - current_display: Current display_item_ value
            - correct_display: Correct displayid from item_template
    """
    from .constants import RACE_NAMES, CLASS_NAMES

    print("=" * 80)
    print("VALIDATING DISPLAY INFO")
    print("=" * 80)
    print()

    mismatches = []

    # Get all outfits with their items and display_item_
    dbc_cursor.execute("""
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
               display_item_21, display_item_22, display_item_23, display_item_24
        FROM charstartoutfit
        ORDER BY id
    """)

    outfits = dbc_cursor.fetchall()

    for outfit in outfits:
        outfit_id = outfit[0]
        race_id = outfit[1]
        class_id = outfit[2]
        gender = outfit[3]
        item_ids = outfit[4:28]        # item_1-24
        display_infos = outfit[28:52]  # display_item_1-24

        race_name = RACE_NAMES.get(race_id, f"Race{race_id}")
        class_name = CLASS_NAMES.get(class_id, f"Class{class_id}")
        gender_name = "Male" if gender == 0 else "Female"

        # Check each slot
        for slot_idx, (item_id, display_info) in enumerate(zip(item_ids, display_infos), 1):
            # Skip empty slots
            if not item_id or item_id <= 0:
                continue

            # Look up correct displayid from item_template
            acore_cursor.execute(
                "SELECT name, displayid FROM item_template WHERE entry = %s",
                (item_id,)
            )
            result = acore_cursor.fetchone()

            if not result:
                # Item doesn't exist in item_template - that's a different problem
                continue

            item_name, correct_display = result

            # Check if display_item_ matches
            if display_info != correct_display:
                mismatches.append({
                    'outfit_id': outfit_id,
                    'race': race_name,
                    'class': class_name,
                    'gender': gender_name,
                    'slot': slot_idx,
                    'item_id': item_id,
                    'item_name': item_name,
                    'current_display': display_info,
                    'correct_display': correct_display
                })

    print(f"Found {len(mismatches)} display_item_ mismatches")
    if mismatches:
        print()
        print("Mismatches found:")
        for m in mismatches:
            print(f"  {m['race']} {m['class']} ({m['gender']}) slot {m['slot']}: "
                  f"{m['item_name']} has display_item_={m['current_display']}, "
                  f"should be {m['correct_display']}")
    print()

    return mismatches


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
        SELECT item_1, item_2, item_3, item_4, item_5, item_6, item_7, item_8,
               item_9, item_10, item_11, item_12, item_13, item_14, item_15,
               item_16, item_17, item_18, item_19, item_20, item_21, item_22,
               item_23, item_24
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
        SELECT item_1, item_2, item_3, item_4, item_5, item_6, item_7, item_8,
               item_9, item_10, item_11, item_12, item_13, item_14, item_15,
               item_16, item_17, item_18, item_19, item_20, item_21, item_22,
               item_23, item_24
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
        item_ids = outfit[4:28]      # item_1-24
        inv_types = outfit[28:52]    # inventory_type_1-24

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


def validate_weapon_coverage(weapon_skills, source_cursor, original_cursor, acore_cursor, validated_weapons):
    """
    Two-pass validation of starting weapons against CSV weapon skill requirements.

    Pass 1: Check existing weapons in charstartoutfit for mismatches
    - Weapon requires skill character doesn't have → mark for replacement/removal
    - Prefers stock WOTLK weapons when skill is available

    Pass 2: Ensure characters have adequate weapon coverage
    - Has melee skill but no melee weapon → add one
    - Has ranged skill but no ranged weapon → add one (+ ammo if needed)
    - Only adds ranged for configured classes (Hunter, Rogue, Troll Warrior)

    Args:
        weapon_skills: Dict from read_weapon_skills_from_spreadsheet()
        source_cursor: Database cursor to validate (dbc or original_dbc)
        original_cursor: Database cursor for stock WOTLK (for weapon preference)
        acore_cursor: Database cursor for acore_world (item lookups)
        validated_weapons: Dict of {skill_id: item_id} for starter weapons

    Returns:
        tuple: (mismatches, weapon_additions)
        - mismatches: List of weapons to replace/remove
        - weapon_additions: List of weapons/ammo to add
    """
    from .constants import RACE_NAMES, CLASS_NAMES, STARTER_AMMO, SKILL_TO_INVTYPE
    from .db_config import ADD_DK_MELEE_WEAPONS, RANGED_ALLOWED_CLASSES, RANGED_ALLOWED_COMBOS

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
    weapon_inv_types = [13, 15, 17, 21, 22, 25, 26]  # Added 25 for Thrown weapons

    # Get all outfits with weapons
    query = """
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
    """

    source_cursor.execute(query)
    outfits = source_cursor.fetchall()

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

        # Skip invalid race/class combinations
        if not is_valid_race_class_combo(acore_cursor, race_id, class_id):
            skipped_invalid += 1
            continue

        # Get available weapon skills from CSV for this race/class
        available_skills = get_available_weapon_skills(weapon_skills, race_id, class_id)
        available_skill_ids = [skill_id for skill_id, _ in available_skills]

        # Load stock WOTLK weapons for this race/class/gender (for preference)
        stock_weapons = get_original_weapon_slots(original_cursor, acore_cursor, race_id, class_id, gender)
        stock_weapon_map = {}  # skill_id -> (slot, item_id) for stock weapons that match CSV
        canonical_slots = {}  # skill_id -> canonical_slot for this race/class

        for stock_weapon in stock_weapons:
            skill_id = stock_weapon['skill_id']
            if skill_id in available_skill_ids:
                # This stock weapon's skill IS in CSV - prefer using it!
                stock_weapon_map[skill_id] = (stock_weapon['slot'], stock_weapon['item_id'])
                canonical_slots[skill_id] = stock_weapon['slot']

        # Fallback canonical slots for races without stock WOTLK data (Goblins, Worgen)
        # These are based on the most common slot position for each weapon type across all races
        if not canonical_slots:
            # Caster canonical slots (based on analysis: Priests/Mages/Warlocks all use slot 4)
            if 136 in available_skill_ids:  # Staves
                canonical_slots[136] = 4
            if 228 in available_skill_ids:  # Wands
                canonical_slots[228] = 4

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
                # For each skill option, check stock_weapon_map first, then fallback to validated_weapons
                def find_replacement(skill_list):
                    """Helper to find replacement, preferring stock weapons."""
                    for skill in skill_list:
                        if skill in available_skill_ids:
                            # Prefer stock weapon if available
                            if skill in stock_weapon_map:
                                return skill, stock_weapon_map[skill][1]
                            elif skill in validated_weapons:
                                return skill, validated_weapons[skill]
                    return None, None

                if required_skill_id in [43, 44, 54]:  # 1H melee
                    replacement_skill, replacement_item = find_replacement([54, 44, 43, 173])
                elif required_skill_id in [55, 160, 172]:  # 2H melee
                    replacement_skill, replacement_item = find_replacement([160, 172, 55, 54, 44, 43, 173])
                elif required_skill_id == 136:  # Staves - casters get wand instead
                    replacement_skill, replacement_item = find_replacement([228])
                elif required_skill_id in [45, 46, 47]:  # Ranged
                    replacement_skill, replacement_item = find_replacement([46, 45, 47, 176])
                elif required_skill_id == 173:  # Daggers
                    replacement_skill, replacement_item = find_replacement([173, 54, 44, 43])
                elif required_skill_id == 228:  # Wands
                    replacement_skill, replacement_item = find_replacement([228])

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

                # SLOT POSITION CHECK: Is weapon in correct slot?
                # Check if this weapon should be in a different slot (stock WOTLK alignment)
                if required_skill_id in canonical_slots:
                    correct_slot = canonical_slots[required_skill_id]
                    if slot_idx != correct_slot:
                        # Weapon is correct type but WRONG SLOT - needs to be moved
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
                            'replacement_item': item_id,  # Same item
                            'replacement_skill': required_skill_id,  # Same skill
                            'target_slot': correct_slot,  # NEW: Target slot for move
                            'slot_mismatch': True,  # NEW: Flag this as slot position issue
                            'available_skills': available_skill_ids
                        })

        # PASS 2: Ensure they have weapons for their available skills
        has_melee_skill = any(skill in available_skill_ids for skill in melee_skills)
        has_ranged_skill = any(skill in available_skill_ids for skill in ranged_skills)

        # Check what types of weapons they currently have (after replacements)
        has_melee_weapon = any(skill_id in melee_skills for skill_id, _ in outfit_weapons.values())
        has_ranged_weapon = any(skill_id in ranged_skills for skill_id, _ in outfit_weapons.values())

        # Find first empty slot for additions
        empty_slots = [i for i in range(1, 25) if item_ids[i-1] <= 0 or item_ids[i-1] == 0]

        # If they have melee skill but no melee weapon, add one
        # Skip Death Knights if ADD_DK_MELEE_WEAPONS is disabled
        skip_melee_addition = (class_id == 6 and not ADD_DK_MELEE_WEAPONS)

        if has_melee_skill and not has_melee_weapon and not skip_melee_addition:
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
        # BUT only for configured classes (Hunter, Rogue, Troll Warrior)
        allowed_ranged = (class_id in RANGED_ALLOWED_CLASSES or
                         (race_id, class_id) in RANGED_ALLOWED_COMBOS)

        if has_ranged_skill and not has_ranged_weapon and allowed_ranged:
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
