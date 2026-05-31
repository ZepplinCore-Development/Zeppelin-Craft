"""Item matrix enumeration for F-013.

Walks class_loadout.json and yields one MatrixCell per
(class, role, gear_token, quality) combination in a deterministic order.
The order is the contract that makes reservation-assigned entry IDs
stable across runs — never re-sort cells without bumping the reservation
range or accepting that all entry IDs will shift.
"""

import json
from dataclasses import dataclass
from pathlib import Path
from typing import Iterator, Tuple

DATA_DIR = Path(__file__).parent / "data"

# Item class constants
ITEM_CLASS_WEAPON = 2
ITEM_CLASS_ARMOR = 4

# Armor subclass IDs
ARMOR_SUBCLASS = {
    "misc":    0,
    "cloth":   1,
    "leather": 2,
    "mail":    3,
    "plate":   4,
    "shield":  6,
    "libram":  7,
    "idol":    8,
    "totem":   9,
    "sigil":  10,
}

# Slot tokens -> (InventoryType, ItemClass override or None, subclass override or None)
# When override is None, the loadout's armor_type is used.
ARMOR_SLOT_INVENTORY_TYPE = {
    "head":      1,
    "shoulders": 3,
    "chest":     5,
    "waist":     6,
    "legs":      7,
    "feet":      8,
    "wrists":    9,
    "hands":    10,
}

# Accessory slots use ARMOR class with misc subclass (cloth for back/cloak)
ACCESSORY_SLOT_CONFIG = {
    "neck":    (2,  "misc"),
    "finger": (11,  "misc"),
    "trinket": (12, "misc"),
    "back":    (16, "cloth"),
}

# Weapon tokens -> (InventoryType, weapon_subclass)
# Holdable off-hand items and class-specific relics also live here for
# convenience (their item_class differs but their inventory_type is fixed).
WEAPON_TOKEN_CONFIG = {
    # 1H weapons (InventoryType=13)
    "1h-axe":   (13, ITEM_CLASS_WEAPON,  0),
    "1h-mace":  (13, ITEM_CLASS_WEAPON,  4),
    "1h-sword": (13, ITEM_CLASS_WEAPON,  7),
    "dagger":   (13, ITEM_CLASS_WEAPON, 15),
    "fist":     (13, ITEM_CLASS_WEAPON, 13),
    # 2H weapons (InventoryType=17)
    "2h-axe":   (17, ITEM_CLASS_WEAPON,  1),
    "2h-mace":  (17, ITEM_CLASS_WEAPON,  5),
    "2h-sword": (17, ITEM_CLASS_WEAPON,  8),
    "polearm":  (17, ITEM_CLASS_WEAPON,  6),
    "staff":    (17, ITEM_CLASS_WEAPON, 10),
    # Ranged (InventoryType=15 for bows, 25 thrown, 26 gun/wand/crossbow)
    "bow":      (15, ITEM_CLASS_WEAPON,  2),
    "thrown":   (25, ITEM_CLASS_WEAPON, 16),
    "gun":      (26, ITEM_CLASS_WEAPON,  3),
    "crossbow": (26, ITEM_CLASS_WEAPON, 18),
    "wand":     (26, ITEM_CLASS_WEAPON, 19),
    # Off-hands / held / shields (item_class=ARMOR)
    "shield":   (14, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["shield"]),
    "held":     (23, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["misc"]),
    # Relics (InventoryType=28, item_class=ARMOR)
    "libram":   (28, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["libram"]),
    "idol":     (28, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["idol"]),
    "totem":    (28, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["totem"]),
    "sigil":    (28, ITEM_CLASS_ARMOR,  ARMOR_SUBCLASS["sigil"]),
}

# Stable ordering for matrix enumeration. Don't reorder without accepting
# that all generated entry IDs will shift.
CLASS_ORDER = ("warrior", "paladin", "hunter", "rogue", "priest",
               "deathknight", "shaman", "mage", "warlock", "druid")
ROLE_ORDER = ("tank", "melee", "caster", "healer")
QUALITY_ORDER = (4,)  # epic only — heroic and mythic both = epic quality

QUALITY_LABEL = {3: "Rare", 4: "Epic"}


@dataclass(frozen=True)
class MatrixCell:
    """One concrete item to generate."""
    matrix_index: int          # position in the enumeration order
    class_name: str
    class_id: int
    role: str
    gear_token: str            # e.g. "head", "1h-sword", "shield"
    inventory_type: int
    item_class: int
    subclass: int
    quality: int               # 3 or 4

    @property
    def label(self) -> str:
        return (f"{self.class_name}/{self.role}/{self.gear_token}/"
                f"{QUALITY_LABEL[self.quality]}")


def _load_loadout():
    with open(DATA_DIR / "class_loadout.json") as f:
        raw = json.load(f)
    class_ids = raw["_class_ids"]
    loadouts = {k: v for k, v in raw.items() if not k.startswith("_")}
    return class_ids, loadouts


def _resolve_armor_slot(slot: str, armor_type: str) -> Tuple[int, int, int]:
    if slot in ARMOR_SLOT_INVENTORY_TYPE:
        return (ARMOR_SLOT_INVENTORY_TYPE[slot],
                ITEM_CLASS_ARMOR,
                ARMOR_SUBCLASS[armor_type])
    if slot in ACCESSORY_SLOT_CONFIG:
        iv, sc_token = ACCESSORY_SLOT_CONFIG[slot]
        return (iv, ITEM_CLASS_ARMOR, ARMOR_SUBCLASS[sc_token])
    raise KeyError(f"Unknown armor/accessory slot token: {slot!r}")


def _resolve_weapon(token: str) -> Tuple[int, int, int]:
    if token not in WEAPON_TOKEN_CONFIG:
        raise KeyError(f"Unknown weapon token: {token!r}")
    return WEAPON_TOKEN_CONFIG[token]


def iter_cells() -> Iterator[MatrixCell]:
    """Yield every MatrixCell in deterministic order."""
    class_ids, loadouts = _load_loadout()
    idx = 0
    for class_name in CLASS_ORDER:
        if class_name not in loadouts:
            continue
        class_id = class_ids[class_name]
        class_loadout = loadouts[class_name]
        for role in ROLE_ORDER:
            if role not in class_loadout:
                continue
            spec = class_loadout[role]
            armor_type = spec["armor_type"]
            tokens = list(spec.get("slots", [])) + list(spec.get("weapons", []))
            for token in tokens:
                if token in ARMOR_SLOT_INVENTORY_TYPE or token in ACCESSORY_SLOT_CONFIG:
                    iv, ic, sc = _resolve_armor_slot(token, armor_type)
                else:
                    iv, ic, sc = _resolve_weapon(token)
                for quality in QUALITY_ORDER:
                    yield MatrixCell(
                        matrix_index=idx,
                        class_name=class_name,
                        class_id=class_id,
                        role=role,
                        gear_token=token,
                        inventory_type=iv,
                        item_class=ic,
                        subclass=sc,
                        quality=quality,
                    )
                    idx += 1


def count_cells() -> int:
    return sum(1 for _ in iter_cells())
