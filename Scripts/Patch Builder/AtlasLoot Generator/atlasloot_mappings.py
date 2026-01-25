"""
AtlasLoot Code Mapping Tables
Maps WoW database values to AtlasLoot Lua format codes
"""

# Quality codes (item_template.Quality -> AtlasLoot code)
QUALITY_CODES = {
    0: "=q0=",  # Poor (Gray)
    1: "=q1=",  # Common (White)
    2: "=q2=",  # Uncommon (Green)
    3: "=q3=",  # Rare (Blue)
    4: "=q4=",  # Epic (Purple)
    5: "=q5=",  # Legendary (Orange)
    6: "=q6=",  # Artifact (Gold)
    7: "=q7=",  # Heirloom (Light Blue)
}

# Inventory slot codes (item_template.InventoryType -> AtlasLoot slot code)
SLOT_CODES = {
    0: "",       # Non-equipable
    1: "#s1#",   # Head
    2: "#s2#",   # Neck
    3: "#s3#",   # Shoulder
    4: "#s4#",   # Shirt
    5: "#s5#",   # Chest
    6: "#s6#",   # Waist
    7: "#s7#",   # Legs
    8: "#s8#",   # Feet
    9: "#s9#",   # Wrist
    10: "#s10#", # Hands
    11: "#s11#", # Finger
    12: "#s12#", # Trinket
    13: "#s13#", # One-Hand (weapon)
    14: "#s14#", # Shield / Off-hand
    15: "#s15#", # Ranged (bows/guns)
    16: "#s16#", # Back (cloak)
    17: "#s17#", # Two-Hand (weapon)
    18: "#s18#", # Bag
    19: "#s19#", # Tabard
    20: "#s20#", # Chest (robe)
    21: "#s21#", # Main-hand weapon
    22: "#s22#", # Off-hand (held in off-hand)
    23: "#s23#", # Holdable (off-hand)
    24: "#s24#", # Ammo
    25: "#s25#", # Thrown
    26: "#s26#", # Ranged (wands/relics)
}

# Armor type codes (item_template.subclass for class=4 Armor)
ARMOR_TYPE_CODES = {
    0: "#e15#",  # Miscellaneous
    1: "#a1#",   # Cloth
    2: "#a2#",   # Leather
    3: "#a3#",   # Mail
    4: "#a4#",   # Plate
    6: "#e16#",  # Shield
}

# Weapon type codes (item_template.subclass for class=2 Weapon)
# Maps WoW subclass ID to AtlasLoot code (see TextParsing.lua)
# AtlasLoot codes: #w1#=Axe, #w2#=Bow, #w3#=Crossbow, #w4#=Dagger, #w5#=Gun,
#                  #w6#=Mace, #w7#=Polearm, #w8#=Shield, #w9#=Staff, #w10#=Sword,
#                  #w11#=Thrown, #w12#=Wand, #w13#=Fist Weapon
WEAPON_TYPE_CODES = {
    0: "#w1#",   # Axe (One-Hand) → Axe
    1: "#w1#",   # Axe (Two-Hand) → Axe
    2: "#w2#",   # Bow → Bow
    3: "#w5#",   # Gun → Gun
    4: "#w6#",   # Mace (One-Hand) → Mace
    5: "#w6#",   # Mace (Two-Hand) → Mace
    6: "#w7#",   # Polearm → Polearm
    7: "#w10#",  # Sword (One-Hand) → Sword
    8: "#w10#",  # Sword (Two-Hand) → Sword
    10: "#w9#",  # Staff → Staff
    13: "#w13#", # Fist Weapon → Fist Weapon
    14: "",      # Miscellaneous Weapon (no specific code)
    15: "#w4#",  # Dagger → Dagger
    16: "#w11#", # Thrown → Thrown
    18: "#w3#",  # Crossbow → Crossbow
    19: "#w12#", # Wand → Wand
    20: "",      # Fishing Pole (no specific code)
}

# Item class codes (for consumables, quest items, etc.)
ITEM_CLASS_CODES = {
    0: "#e0#",   # Consumable
    1: "#e1#",   # Container (Bag)
    2: "",       # Weapon (handled by WEAPON_TYPE_CODES)
    4: "",       # Armor (handled by ARMOR_TYPE_CODES)
    5: "#e3#",   # Reagent
    6: "#e6#",   # Projectile
    7: "#e7#",   # Trade Goods
    9: "#e2#",   # Recipe
    11: "#e11#", # Quiver
    12: "#m3#",  # Quest Item
    13: "#e5#",  # Key
    15: "#e10#", # Miscellaneous
    16: "#e12#", # Glyph
}


def get_item_codes(item_class, item_subclass, inventory_type, quality):
    """
    Generate AtlasLoot codes for an item based on its database properties.

    Args:
        item_class: item_template.class
        item_subclass: item_template.subclass
        inventory_type: item_template.InventoryType
        quality: item_template.Quality

    Returns:
        tuple: (quality_code, type_code) for AtlasLoot Lua format
    """
    quality_code = QUALITY_CODES.get(quality, "=q0=")

    # Determine type code based on item class
    type_code = ""

    if item_class == 2:  # Weapon
        type_code = WEAPON_TYPE_CODES.get(item_subclass, "")
    elif item_class == 4:  # Armor
        type_code = ARMOR_TYPE_CODES.get(item_subclass, "")
    else:
        # For other item classes (consumables, quest items, etc.)
        type_code = ITEM_CLASS_CODES.get(item_class, "")

    return quality_code, type_code


def format_drop_chance(chance):
    """
    Format drop chance percentage for AtlasLoot display.

    Args:
        chance: float or int from creature_loot_template.Chance

    Returns:
        str: Formatted percentage string (e.g., "100%", "10.5%", "0.62%")
    """
    if chance == 0:
        return ""  # Group loot (pick one from group)
    elif chance == 100:
        return "100%"
    elif chance >= 10:
        return f"{chance:.1f}%"
    elif chance >= 1:
        return f"{chance:.2f}%"
    else:
        return f"{chance:.2f}%"


def get_lua_item_line(line_num, item_id, item_name, quality, item_class,
                      item_subclass, inventory_type, drop_chance, icon=""):
    """
    Generate a complete AtlasLoot Lua table entry for an item.

    Args:
        line_num: Line number in the AtlasLoot table
        item_id: Item ID from database
        item_name: Item name from database
        quality: Item quality (0-7)
        item_class: Item class
        item_subclass: Item subclass
        inventory_type: Inventory slot type
        drop_chance: Drop percentage
        icon: Optional icon override (usually empty)

    Returns:
        str: Formatted Lua table entry
    """
    quality_code, type_code = get_item_codes(item_class, item_subclass,
                                              inventory_type, quality)
    chance_str = format_drop_chance(drop_chance)

    # Build the Lua line
    # Format: { LineNum, ItemID, Icon, Name, Codes, "", DropChance }
    lua_line = f'\t\t{{ {line_num}, {item_id}, "{icon}", "{quality_code}{item_name}"'

    if type_code:
        lua_line += f', "=ds={type_code}"'
    else:
        lua_line += ', ""'

    lua_line += ', ""'

    # Always include 7th parameter (drop chance), even if empty
    if chance_str:
        lua_line += f', "{chance_str}"'
    else:
        lua_line += ', ""'  # Empty drop chance for group loot items

    lua_line += ' };'

    return lua_line


def get_boss_header_line(line_num, boss_name):
    """
    Generate a boss header line for AtlasLoot table.

    Args:
        line_num: Line number in the AtlasLoot table
        boss_name: Boss name from database

    Returns:
        str: Formatted Lua boss header entry
    """
    return f'\t\t{{ {line_num}, 0, "INV_Box_01", "=q6="..BabbleBoss["{boss_name}"], "" }};'
