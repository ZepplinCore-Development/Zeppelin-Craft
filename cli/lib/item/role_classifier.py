"""F-179 role classifier — maps stock items to (armor_type, role, mana) buckets
for the heroic/mythic scaler.

Bucket philosophy: instead of matching items to specific classes (as F-074
does with 9 class refs), F-179 routes items by armor type + role + optional
mana qualifier — the same axis players actually pick gear by. A Hunter and
an Enhancement Shaman both want MAIL-DPS; the item doesn't care which class
opens it. F-074 caches stay class-conditional; F-179 organic drops use
these role buckets.

Verified Phase 1 (2026-05-30): 423 in-scope BOP items from 19 azeroth
dungeons classify into 28 buckets with only 3 vanity-shirt fallbacks
(filtered by InventoryType in scaler_existing).
"""
import random
from typing import Dict, List, Tuple

# Stat IDs (mirror cli/lib/item/data/class_stats.json _stat_ids)
STR, AGI, INT, SPI, STA = 4, 3, 5, 6, 7
DEF, DODGE, PARRY, BLOCK_R = 12, 13, 14, 15
HIT, CRIT, RESIL, HASTE, EXP = 31, 32, 35, 36, 37
AP, RAP, MP5 = 38, 39, 43
ARMORPEN, SP, HP5, SPELLPEN, BLOCK_V = 44, 45, 46, 47, 48

# Armor subclass → armor-type token
ARMOR_SUBCLASS = {1: "cloth", 2: "leather", 3: "mail", 4: "plate"}

# InventoryType categories
INV_REAL_ARMOR = {1, 3, 5, 6, 7, 8, 9, 10, 20}   # head, shoulders, chest, waist, legs, feet, wrists, hands, robe
INV_ACCESSORY  = {2, 11, 12, 16}                  # neck, finger, trinket, back
INV_WEAPON     = {13, 17, 21, 22}                 # mh 1h, 2h, mh-only, oh-only
INV_RANGED     = {15, 25, 26}                     # bow/gun/xbow, thrown, gun/wand/xbow
INV_OFFHAND    = {23}                             # off-hand holdable (orb/tome)
INV_SHIELD     = {14}                             # shield
INV_RELIC      = {28}                             # relic
INV_VANITY     = {4, 18}                          # shirt slot, tabard — no stats, skipped

# Armor-type default role (for sta-only / no-role-signal items)
ARMOR_DEFAULT_ROLE = {
    "cloth":   "CASTER",
    "leather": "DPS",
    "mail":    "DPS",
    "plate":   "DPS-NO_MANA",
}

# Per-bucket stat allowlists used to extend the original stat profile up to
# the new ilvl's epic stat count. Same shape as F-013's class_stats.json:
# primary stats are always present, secondary fills extra slots.
#
# Derived from F-013's class_stats.json + WoTLK gem weights:
#   STAT_WEIGHT (scaler.py): str/agi/int/spi/def/dodge/parry/block_r/hit/
#     crit/resil/haste/exp/armorpen all = 1.0; stam=0.667; AP/RAP=0.5;
#     mp5/hp5/spellpen=2.0; SP=0.857; block_v=0.65
#
# Plate-tank-mana keeps Int+SP (Pally tank needs Consecration scaling);
# plate-tank-no-mana drops them entirely.
BUCKET_STAT_POOLS: Dict[str, Dict[str, List[int]]] = {
    # CLOTH
    "CLOTH-CASTER":  {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE, SPELLPEN]},
    "CLOTH-HEALER":  {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, HASTE, MP5]},
    "CLOTH-TANK":    {"primary": [STA, STR],     "secondary": [DEF, DODGE, PARRY, HIT, RESIL, AP]},
    "CLOTH-DPS":     {"primary": [STR, STA],     "secondary": [HIT, CRIT, AP, ARMORPEN, EXP]},
    # LEATHER
    "LEATHER-DPS":     {"primary": [AGI, STA],     "secondary": [STR, HIT, CRIT, AP, HASTE, ARMORPEN]},
    "LEATHER-CASTER":  {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE, SPELLPEN]},
    "LEATHER-HEALER":  {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, HASTE, MP5]},
    "LEATHER-TANK":    {"primary": [AGI, STA],     "secondary": [STR, DODGE, DEF, HIT, CRIT, RESIL, AP, ARMORPEN]},
    # MAIL
    "MAIL-DPS":     {"primary": [AGI, STA],     "secondary": [INT, AP, HIT, CRIT, HASTE, ARMORPEN]},
    "MAIL-CASTER":  {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE, MP5]},
    "MAIL-HEALER":  {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, HASTE, MP5]},
    # PLATE
    "PLATE-TANK-NO_MANA": {"primary": [STR, STA], "secondary": [DEF, DODGE, PARRY, BLOCK_R, HIT, CRIT, EXP, RESIL, AP, BLOCK_V]},
    "PLATE-TANK-MANA":    {"primary": [STR, STA, INT], "secondary": [DEF, DODGE, PARRY, BLOCK_R, HIT, CRIT, EXP, MP5, SP]},
    "PLATE-DPS-NO_MANA":  {"primary": [STR, STA], "secondary": [HIT, CRIT, HASTE, EXP, AP, ARMORPEN]},
    "PLATE-DPS-MANA":     {"primary": [STR, STA, INT], "secondary": [HIT, CRIT, MP5, AP]},
    "PLATE-HEALER":       {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, HASTE, MP5]},
    "PLATE-CASTER":       {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE, SPELLPEN]},
    # WEAPONS
    "WEAPON-MELEE-STR": {"primary": [STR, STA],     "secondary": [HIT, CRIT, EXP, AP, ARMORPEN]},
    "WEAPON-MELEE-AGI": {"primary": [AGI, STA],     "secondary": [HIT, CRIT, AP, ARMORPEN]},
    "WEAPON-CASTER":    {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE, SPELLPEN]},
    "WEAPON-HEALER":    {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, HASTE, MP5]},
    "WEAPON-TANK":      {"primary": [STR, STA],     "secondary": [DEF, DODGE, PARRY, HIT, CRIT, BLOCK_V]},
    "WEAPON-RANGED":    {"primary": [AGI, STA],     "secondary": [HIT, CRIT, AP, ARMORPEN, RAP]},
    # SHIELDS + OFFHANDS
    "SHIELD-TANK":   {"primary": [STA],          "secondary": [STR, DEF, DODGE, PARRY, BLOCK_R, BLOCK_V]},
    "SHIELD-CASTER": {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE]},
    "SHIELD-HEALER": {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, MP5]},
    "OFFHAND-CASTER": {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE]},
    "OFFHAND-HEALER": {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, MP5]},
    # ACCESSORIES
    "ACCESSORY-CASTER":   {"primary": [INT, SP, STA], "secondary": [SPI, HIT, CRIT, HASTE]},
    "ACCESSORY-HEALER":   {"primary": [INT, SP, STA], "secondary": [SPI, CRIT, MP5]},
    "ACCESSORY-TANK":     {"primary": [STA],          "secondary": [STR, DEF, DODGE, PARRY, HIT, RESIL, AP]},
    "ACCESSORY-DPS-STR":  {"primary": [STR, STA],     "secondary": [HIT, CRIT, EXP, AP, ARMORPEN]},
    "ACCESSORY-DPS-AGI":  {"primary": [AGI, STA],     "secondary": [HIT, CRIT, AP, ARMORPEN]},
    "ACCESSORY-ANY":      {"primary": [STA],          "secondary": [AGI, STR, INT, SPI, HIT, CRIT]},
}


def _role_signals(has: Dict[int, int]) -> Tuple[bool, bool, bool, bool]:
    """Return (is_tank, is_healer, is_caster, is_dps) from a stat-id→value map."""
    is_tank   = any(has.get(s, 0) > 0 for s in (DEF, DODGE, PARRY, BLOCK_R, BLOCK_V))
    is_healer = has.get(INT, 0) > 0 and (has.get(MP5, 0) > 0 or has.get(SPI, 0) > 0 or has.get(HP5, 0) > 0)
    is_caster = has.get(INT, 0) > 0 and has.get(SP, 0) > 0 and not is_healer
    is_dps    = (has.get(STR, 0) > 0 or has.get(AGI, 0) > 0) and has.get(INT, 0) == 0 and has.get(SP, 0) == 0
    return is_tank, is_healer, is_caster, is_dps


def _seeded_choice(entry: int, candidates: List[str]) -> str:
    """Stable per-item random tie-break for multi-role / multi-bucket overlap."""
    r = random.Random(f"f179_bucket:{entry}")
    return r.choice(candidates)


def classify(entry: int, stats: List[Tuple[int, int]], item_class: int,
             subclass: int, inv_type: int) -> str:
    """Return the bucket name for this item. Vanity items (shirt/tabard) raise
    ValueError — caller should filter those before reaching here. Relic items
    return "SKIP-RELIC" (F-013 Phase 6 territory).

    Bucket-overlap items get a seeded random tie-break per (entry, bucket-set),
    so the classification is deterministic across runs.
    """
    if inv_type in INV_VANITY:
        raise ValueError(f"entry {entry}: vanity item (InventoryType {inv_type}) — filter at discovery")

    has = {s: v for s, v in stats if v > 0}
    is_tank, is_healer, is_caster, is_dps = _role_signals(has)
    has_str_or_agi = has.get(STR, 0) > 0 or has.get(AGI, 0) > 0

    # ----- RELIC (out of scope — F-013 Phase 6) -----
    if inv_type in INV_RELIC or subclass in (7, 8, 9, 10):
        return "SKIP-RELIC"

    # ----- SHIELD -----
    if inv_type in INV_SHIELD or subclass == 6:
        if is_caster: return "SHIELD-CASTER"
        if is_healer: return "SHIELD-HEALER"
        return "SHIELD-TANK"

    # ----- WEAPON (item_class == 2) -----
    if item_class == 2:
        if inv_type in INV_RANGED or subclass in (2, 3, 16, 18):
            return "WEAPON-RANGED"
        if subclass == 19:  # wand
            return "WEAPON-CASTER"
        if is_tank:   return "WEAPON-TANK"
        if is_healer: return "WEAPON-HEALER"
        if is_caster or (has.get(INT, 0) > 0 and has.get(SP, 0) > 0):
            return "WEAPON-CASTER"
        if has.get(STR, 0) > 0 and not has.get(AGI, 0):
            return "WEAPON-MELEE-STR"
        if has.get(AGI, 0) > 0 and not has.get(STR, 0):
            return "WEAPON-MELEE-AGI"
        if has.get(STR, 0) > 0 and has.get(AGI, 0) > 0:
            return _seeded_choice(entry, ["WEAPON-MELEE-STR", "WEAPON-MELEE-AGI"])
        # No primary stat → fall back by weapon subclass
        if subclass in (15, 13):  # dagger, fist
            return "WEAPON-MELEE-AGI"
        return "WEAPON-MELEE-STR"

    # ----- OFF-HAND HOLDABLE -----
    if inv_type in INV_OFFHAND:
        if is_healer: return "OFFHAND-HEALER"
        return "OFFHAND-CASTER"

    # ----- ACCESSORY -----
    if inv_type in INV_ACCESSORY:
        candidates = []
        if is_tank:   candidates.append("ACCESSORY-TANK")
        if is_healer: candidates.append("ACCESSORY-HEALER")
        if is_caster: candidates.append("ACCESSORY-CASTER")
        if is_dps:
            if has.get(STR, 0) > 0 and not has.get(AGI, 0):
                candidates.append("ACCESSORY-DPS-STR")
            elif has.get(AGI, 0) > 0 and not has.get(STR, 0):
                candidates.append("ACCESSORY-DPS-AGI")
            elif has.get(STR, 0) > 0 and has.get(AGI, 0) > 0:
                candidates.append(_seeded_choice(entry, ["ACCESSORY-DPS-STR", "ACCESSORY-DPS-AGI"]))
            else:
                candidates.append("ACCESSORY-DPS-STR")
        if not candidates:
            return "ACCESSORY-ANY"
        return candidates[0] if len(candidates) == 1 else _seeded_choice(entry, candidates)

    # ----- REAL ARMOR (cloth/leather/mail/plate body slots) -----
    if item_class == 4 and inv_type in INV_REAL_ARMOR and subclass in ARMOR_SUBCLASS:
        atype = ARMOR_SUBCLASS[subclass]
        candidates = []
        if is_tank:   candidates.append("TANK")
        if is_healer: candidates.append("HEALER")
        if is_caster: candidates.append("CASTER")
        if is_dps:    candidates.append("DPS")
        if not candidates:
            candidates.append(ARMOR_DEFAULT_ROLE[atype])
        role = candidates[0] if len(candidates) == 1 else _seeded_choice(entry, candidates)

        # Plate mana qualifier on tank/dps
        if atype == "plate" and role in ("TANK", "DPS"):
            if "-" in role:  # default already mana-qualified
                return f"PLATE-{role}"
            mana_q = "MANA" if has.get(INT, 0) > 0 else "NO_MANA"
            return f"PLATE-{role}-{mana_q}"

        return f"{atype.upper()}-{role}"

    # ----- Fallback for misclassified edge cases -----
    return f"FALLBACK:cls{item_class}/sub{subclass}/inv{inv_type}"


def stat_pool_for(bucket: str) -> Dict[str, List[int]]:
    """Return the primary + secondary stat allowlist for a bucket. Missing
    buckets (e.g. PLATE-CASTER had no Phase 1 hits but is wired for forward
    compat) raise KeyError — caller should ensure bucket is valid first."""
    return BUCKET_STAT_POOLS[bucket]
