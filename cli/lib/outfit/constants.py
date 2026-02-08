"""
Constants and lookup tables for starting weapons system.
"""

RACE_NAMES = {
    1: "Human",
    2: "Orc",
    3: "Dwarf",
    4: "Night Elf",
    5: "Undead",
    6: "Tauren",
    7: "Gnome",
    8: "Troll",
    9: "Goblin",
    10: "Blood Elf",
    11: "Draenei",
    12: "Worgen"
}

CLASS_NAMES = {
    1: "Warrior",
    2: "Paladin",
    3: "Hunter",
    4: "Rogue",
    5: "Priest",
    6: "Death Knight",
    7: "Shaman",
    8: "Mage",
    9: "Warlock",
    11: "Druid"
}

# Weapon subclass -> (skill_id, skill_name)
WEAPON_SKILLS = {
    0: (44, "One-Handed Axes"),
    1: (172, "Two-Handed Axes"),
    2: (45, "Bows"),
    3: (46, "Guns"),
    4: (54, "One-Handed Maces"),
    5: (160, "Two-Handed Maces"),
    7: (43, "One-Handed Swords"),
    8: (55, "Two-Handed Swords"),
    10: (136, "Staves"),
    15: (173, "Daggers"),
    16: (176, "Thrown"),
    18: (226, "Crossbows"),
    19: (228, "Wands"),
}

# Starter weapon candidates by skill ID
STARTER_WEAPON_CANDIDATES = {
    44: [37],                 # 1H Axes - Worn Axe
    172: [12282],             # 2H Axes - Worn Battleaxe
    54: [36],                 # 1H Maces - Worn Mace
    160: [2361],              # 2H Maces - Battleworn Hammer
    43: [25],                 # 1H Swords - Worn Shortsword
    55: [49778, 23346],       # 2H Swords - Worn Greatsword, Battleworn Claymore
    136: [35, 3661, 20978],   # Staves - Bent Staff, Handcrafted Staff, Apprentice's Staff
    173: [2092],              # Daggers - Worn Dagger
    228: [4902],              # Wands - Apprentice Wand
    45: [2504],               # Bows - Worn Shortbow
    46: [2508],               # Guns - Old Blunderbuss
    226: [23347],             # Crossbows - Weathered Crossbow
    176: [25861],             # Crude Throwing Axe
}

# Starter ammo for ranged weapons (invType 24)
STARTER_AMMO = {
    45: 2512,    # Bows -> Rough Arrow
    46: 2516,    # Guns -> Light Shot
    226: 2512,   # Crossbows -> Rough Arrow
}

# Weapon skill to invType mapping
SKILL_TO_INVTYPE = {
    43: 13,   # Swords -> One-Hand
    44: 13,   # Axes -> One-Hand
    54: 13,   # Maces -> One-Hand
    173: 13,  # Daggers -> One-Hand
    55: 17,   # Two-Handed Swords -> Two-Hand
    160: 17,  # Two-Handed Maces -> Two-Hand
    172: 17,  # Two-Handed Axes -> Two-Hand
    136: 17,  # Staves -> Two-Hand
    229: 17,  # Polearms -> Two-Hand
    45: 15,   # Bows -> Ranged
    46: 15,   # Guns -> Ranged
    226: 15,  # Crossbows -> Ranged
    176: 26,  # Thrown -> Ranged Right
    228: 26,  # Wands -> Ranged Right
    162: 13,  # Unarmed -> One-Hand (fist)
    433: 14,  # Shield -> Shield
    473: 13,  # Fist Weapons -> One-Hand
}

# Weapon skill priority for melee fallback (daggers LAST)
MELEE_SKILL_PRIORITY = [
    54,   # 1H Maces
    44,   # 1H Axes
    43,   # 1H Swords
    55,   # 2H Swords
    160,  # 2H Maces
    172,  # 2H Axes
    136,  # Staves
    173,  # Daggers (LOWEST PRIORITY)
]

RANGED_SKILL_PRIORITY = [
    45,   # Bows
    46,   # Guns
    226,  # Crossbows
    176,  # Thrown
    228,  # Wands
]
