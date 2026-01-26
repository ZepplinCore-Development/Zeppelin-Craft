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
# IMPORTANT: AtlasLoot codes are NOT the same as WoW InventoryType values!
# These mappings are based on AtlasLoot/Core/TextParsing.lua
SLOT_CODES = {
    0: "",       # Non-equipable
    1: "#s1#",   # Head (WoW=1, AL=1)
    2: "#s2#",   # Neck (WoW=2, AL=2)
    3: "#s3#",   # Shoulder (WoW=3, AL=3)
    4: "#s6#",   # Shirt (WoW=4, AL=6)
    5: "#s5#",   # Chest (WoW=5, AL=5)
    6: "#s10#",  # Waist (WoW=6, AL=10)
    7: "#s11#",  # Legs (WoW=7, AL=11)
    8: "#s12#",  # Feet (WoW=8, AL=12)
    9: "#s8#",   # Wrist (WoW=9, AL=8)
    10: "#s9#",  # Hands (WoW=10, AL=9)
    11: "#s13#", # Finger/Ring (WoW=11, AL=13)
    12: "#s14#", # Trinket (WoW=12, AL=14)
    13: "",      # One-Hand weapon (use weapon codes)
    14: "#w8#",  # Shield (WoW=14, AL=w8)
    15: "",      # Ranged bow/gun (use weapon codes)
    16: "#s4#",  # Back/Cloak (WoW=16, AL=4)
    17: "",      # Two-Hand weapon (use weapon codes)
    18: "#e1#",  # Bag (WoW=18, AL=e1)
    19: "#s7#",  # Tabard (WoW=19, AL=7)
    20: "#s5#",  # Robe/Chest (WoW=20, AL=5)
    21: "",      # Main-hand weapon (use weapon codes)
    22: "#s15#", # Off-hand held (WoW=22, AL=15)
    23: "#s15#", # Holdable off-hand (WoW=23, AL=15)
    24: "",      # Ammo
    25: "",      # Thrown (use weapon codes)
    26: "#s16#", # Ranged relic (WoW=26, AL=16)
    28: "#s16#", # Relic (WoW=28, AL=16)
}

# Armor type codes (item_template.subclass for class=4 Armor)
ARMOR_TYPE_CODES = {
    0: "",       # Miscellaneous (use slot codes based on inventory_type)
    1: "#a1#",   # Cloth
    2: "#a2#",   # Leather
    3: "#a3#",   # Mail
    4: "#a4#",   # Plate
    6: "#w8#",   # Shield (AL uses #w8# for shields, NOT #e16#)
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
        if item_subclass == 0:  # Miscellaneous armor (rings, trinkets, necks, etc.)
            # Use slot code based on inventory_type instead of generic "Miscellaneous"
            type_code = SLOT_CODES.get(inventory_type, "")
        else:
            # Cloth/Leather/Mail/Plate/Shield - use armor type code
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
    lua_line = f'    {{ {line_num}, {item_id}, "{icon}", "{quality_code}{item_name}"'

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
    return f'    {{ {line_num}, 0, "INV_Box_01", "=q6="..BabbleBoss["{boss_name}"], "" }};'
