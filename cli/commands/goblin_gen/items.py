"""gen domain: items — wago Cata Classic (4.4.x) ItemSparse+Item -> AC item_template.

Ports Scripts/Goblin Zone Port/migrate_items.py. The item data comes from the wago
Cata Classic CSV extracts (ctx.wago), NOT the Whitemane 4.3.4 DB2 — the wago
ItemSparse carries the runtime-computed fields the 4.3.4 client doesn't store
(MinDamage_0/MaxDamage_0, MaxDurability). Icons resolved via cli/lib/icon_resolver.
Single non-SFX file (Lost Isles missing-items set); emits on the "" pass only.
"""
import os
import sys

NAME = "items"
RESERVE_BASE = 84300

_CLI_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _CLI_DIR not in sys.path:
    sys.path.insert(0, _CLI_DIR)


def _gi(r, k, d=0):
    try:
        return int(float(r.get(k, d) or d))
    except Exception:
        return d


def _gf(r, k, d=0.0):
    try:
        return float(r.get(k, d) or d)
    except Exception:
        return d


def _esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def emit(ctx):
    if ctx.sfx:                      # single combined file built from the Lost Isles missing-items set
        return "skipped (%s: items emit on the '' pass)" % ctx.sfx

    from lib.icon_resolver import IconResolver
    resolver = IconResolver()
    resolver._fdid_to_icon = resolver._load_listfile()
    resolver._icon_to_display = resolver._load_displays()

    missing = sorted(ctx.fixture("missing_items"))
    remap = {cata: RESERVE_BASE + i for i, cata in enumerate(missing)}

    item_meta = {}
    for r in ctx.wago("item_442"):
        try:
            i = int(r["ID"])
        except Exception:
            continue
        if i in remap:
            item_meta[i] = r

    rows_out, seen = [], set()
    for s in ctx.wago("itemsparse_442"):
        try:
            cata = int(s["ID"])
        except Exception:
            continue
        if cata not in remap or cata in seen:
            continue
        seen.add(cata)
        m = item_meta.get(cata, {})
        newid = remap[cata]
        cols = {
            "entry": newid, "class": _gi(m, "ClassID"), "subclass": _gi(m, "SubclassID"),
            "SoundOverrideSubclass": _gi(m, "Sound_override_subclassID", -1) if m.get("Sound_override_subclassID") else -1,
            "name": (s.get("Display_lang") or "").strip(),
            "displayid": resolver.resolve(m.get("IconFileDataID")) if m else 0,
            "Quality": _gi(s, "OverallQualityID"), "Flags": (_gi(s, "Flags_0") & 0x7FFFFFFF),  # FlagsExtra omitted (commented out in the original)
            "BuyCount": max(_gi(s, "VendorStackCount", 1), 1), "BuyPrice": _gi(s, "BuyPrice"), "SellPrice": _gi(s, "SellPrice"),
            "InventoryType": _gi(s, "InventoryType") or _gi(m, "InventoryType"),
            "AllowableClass": _gi(s, "AllowableClass", -1) or -1, "AllowableRace": _gi(s, "AllowableRace", -1) or -1,
            "ItemLevel": _gi(s, "ItemLevel"), "RequiredLevel": _gi(s, "RequiredLevel"),
            "RequiredSkill": _gi(s, "RequiredSkill"), "RequiredSkillRank": _gi(s, "RequiredSkillRank"),
            "requiredspell": _gi(s, "RequiredAbility"), "requiredhonorrank": 0,
            "RequiredCityRank": 0, "RequiredReputationFaction": _gi(s, "MinFactionID"),
            "RequiredReputationRank": _gi(s, "MinReputation"),
            "maxcount": _gi(s, "MaxCount"), "stackable": max(_gi(s, "Stackable", 1), 1), "ContainerSlots": _gi(s, "ContainerSlots"),
        }
        for n in range(1, 11):
            st = _gi(s, "StatModifier_bonusStat_%d" % (n - 1))
            sv = _gi(s, "StatModifier_bonusAmount_%d" % (n - 1))
            if st < 0 or st > 255:
                st, sv = 0, 0
            cols["stat_type%d" % n] = st
            cols["stat_value%d" % n] = sv
        cols["ScalingStatDistribution"] = _gi(s, "ScalingStatDistributionID")
        cols["ScalingStatValue"] = 0
        cols["dmg_min1"] = _gf(s, "MinDamage_0"); cols["dmg_max1"] = _gf(s, "MaxDamage_0"); cols["dmg_type1"] = _gi(s, "DamageType")
        cols["dmg_min2"] = 0; cols["dmg_max2"] = 0; cols["dmg_type2"] = 0
        cols["armor"] = 0
        for i, res in enumerate(["holy_res", "fire_res", "nature_res", "frost_res", "shadow_res", "arcane_res"]):
            cols[res] = _gi(s, "Resistances_%d" % (i + 1))
        cols["delay"] = _gi(s, "ItemDelay"); cols["ammo_type"] = 0; cols["RangedModRange"] = 0
        for n in range(1, 6):
            for suf, val in [("spellid", 0), ("spelltrigger", 0), ("spellcharges", 0), ("spellppmRate", 0),
                             ("spellcooldown", -1), ("spellcategory", 0), ("spellcategorycooldown", -1)]:
                cols["%s_%d" % (suf, n)] = val
        cols["bonding"] = _gi(s, "Bonding")
        cols["description"] = (s.get("Description_lang") or "").strip()
        cols["PageText"] = _gi(s, "PageID"); cols["LanguageID"] = _gi(s, "LanguageID"); cols["PageMaterial"] = _gi(s, "PageMaterialID")
        cols["startquest"] = _gi(s, "StartQuestID"); cols["lockid"] = _gi(s, "LockID")
        cols["Material"] = _gi(s, "Material") or _gi(m, "Material"); cols["sheath"] = _gi(s, "SheatheType") or _gi(m, "SheatheType")
        cols["RandomProperty"] = 0; cols["RandomSuffix"] = 0; cols["block"] = 0
        cols["itemset"] = _gi(s, "ItemSet"); cols["MaxDurability"] = _gi(s, "MaxDurability")
        cols["area"] = 0; cols["Map"] = 0; cols["BagFamily"] = _gi(s, "BagFamily"); cols["TotemCategory"] = _gi(s, "TotemCategoryID")
        for n in range(1, 4):
            cols["socketColor_%d" % n] = _gi(s, "SocketType_%d" % (n - 1)); cols["socketContent_%d" % n] = 0
        cols["socketBonus"] = _gi(s, "Socket_match_enchantment_ID"); cols["GemProperties"] = _gi(s, "Gem_properties")
        cols["RequiredDisenchantSkill"] = -1; cols["ArmorDamageModifier"] = 0
        cols["duration"] = _gi(s, "DurationInInventory"); cols["ItemLimitCategory"] = _gi(s, "LimitCategory")
        cols["HolidayId"] = 0; cols["ScriptName"] = ""; cols["DisenchantID"] = 0; cols["FoodType"] = 0
        cols["minMoneyLoot"] = 0; cols["maxMoneyLoot"] = 0; cols["flagsCustom"] = 0; cols["VerifiedBuild"] = 0
        rows_out.append((newid, cata, cols))

    rows_out.sort()
    b = ["-- F-011 Lost Isles custom items (from wago ItemSparse 4.4.2, renumbered to 84300+)",
         "-- %d items. Owned custom rows: DELETE+INSERT. Icons (displayid) resolved from" % len(rows_out),
         "-- each item's Cata IconFileDataID via the client listfile + ItemDisplayInfo.\n"]
    for newid, cata, cols in rows_out:
        b.append("-- Cata %d -> %d  (%s)" % (cata, newid, cols["name"]))
        b.append("DELETE FROM item_template WHERE entry = %d;" % newid)
        b.append("INSERT INTO item_template SET")
        b.append(",\n".join("  `%s` = %s" % (k, _esc(v)) for k, v in cols.items()) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]_items.sql", "\n".join(b) + "\n")
    return "items=%d (wago ItemSparse 4.4.2)" % len(rows_out)
