#!/usr/bin/env python3
"""
F-011 items: translate wago ItemSparse+Item (Cata 4.4.x) -> AC WotLK item_template,
renumbered into the reserved 84300+ block. Emits item_remap.json + items SQL.
"""
import csv, json, os

SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
RESERVE_BASE = 84300

missing = sorted(json.load(open(os.path.join(SCRATCH, "missing_items.json"))))
remap = {cata: RESERVE_BASE + i for i, cata in enumerate(missing)}
json.dump({str(k): v for k, v in remap.items()}, open(os.path.join(SCRATCH, "item_remap.json"), "w"))
print("remap: %d items -> %d..%d" % (len(remap), min(remap.values()), max(remap.values())))

# Item.db2 -> class/subclass/material/inv/icon/sheath
item_meta = {}
with open(os.path.join(SCRATCH, "item_442.csv"), newline='', encoding='utf-8') as f:
    for r in csv.DictReader(f):
        try: i = int(r['ID'])
        except: continue
        if i in remap:
            item_meta[i] = r

def gi(r, k, d=0):
    try: return int(float(r.get(k, d) or d))
    except: return d
def gf(r, k, d=0.0):
    try: return float(r.get(k, d) or d)
    except: return d

def esc(v):
    if v is None: return "NULL"
    if isinstance(v, str): return "'" + v.replace("\\","\\\\").replace("'","''") + "'"
    if isinstance(v, float): return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)

rows_out = []
seen = set()
with open(os.path.join(SCRATCH, "itemsparse_442.csv"), newline='', encoding='utf-8') as f:
    for s in csv.DictReader(f):
        try: cata = int(s['ID'])
        except: continue
        if cata not in remap or cata in seen: continue
        seen.add(cata)
        m = item_meta.get(cata, {})
        newid = remap[cata]
        cls = gi(m, 'ClassID'); sub = gi(m, 'SubclassID')
        cols = {
            "entry": newid, "class": cls, "subclass": sub,
            "SoundOverrideSubclass": gi(m, 'Sound_override_subclassID', -1) if m.get('Sound_override_subclassID') else -1,
            "name": (s.get('Display_lang') or '').strip(), "displayid": 0,   # icon deferred (needs ItemDisplayInfo)
            "Quality": gi(s, 'OverallQualityID'), "Flags": (gi(s,"Flags_0") & 0x7FFFFFFF),  # masked to WotLK bits (drop Cata sign-bit) "FlagsExtra": 0,
            "BuyCount": max(gi(s, 'VendorStackCount', 1), 1), "BuyPrice": gi(s, 'BuyPrice'), "SellPrice": gi(s, 'SellPrice'),
            "InventoryType": gi(s, 'InventoryType') or gi(m, 'InventoryType'),
            "AllowableClass": gi(s, 'AllowableClass', -1) or -1, "AllowableRace": gi(s, 'AllowableRace', -1) or -1,
            "ItemLevel": gi(s, 'ItemLevel'), "RequiredLevel": gi(s, 'RequiredLevel'),
            "RequiredSkill": gi(s, 'RequiredSkill'), "RequiredSkillRank": gi(s, 'RequiredSkillRank'),
            "requiredspell": gi(s, 'RequiredAbility'), "requiredhonorrank": 0,
            "RequiredCityRank": 0, "RequiredReputationFaction": gi(s, 'MinFactionID'),
            "RequiredReputationRank": gi(s, 'MinReputation'),
            "maxcount": gi(s, 'MaxCount'), "stackable": max(gi(s, 'Stackable', 1), 1), "ContainerSlots": gi(s, 'ContainerSlots'),
        }
        # stats 1..10 (Cata uses -1 for empty slots -> 0)
        for n in range(1, 11):
            st = gi(s, 'StatModifier_bonusStat_%d' % (n-1))
            sv = gi(s, 'StatModifier_bonusAmount_%d' % (n-1))
            if st < 0 or st > 255: st, sv = 0, 0
            cols["stat_type%d" % n] = st
            cols["stat_value%d" % n] = sv
        cols["ScalingStatDistribution"] = gi(s, 'ScalingStatDistributionID')
        cols["ScalingStatValue"] = 0
        cols["dmg_min1"] = gf(s, 'MinDamage_0'); cols["dmg_max1"] = gf(s, 'MaxDamage_0'); cols["dmg_type1"] = gi(s, 'DamageType')
        cols["dmg_min2"] = 0; cols["dmg_max2"] = 0; cols["dmg_type2"] = 0
        cols["armor"] = 0  # Cata armor is computed client-side; TODO derive
        for i, res in enumerate(["holy_res","fire_res","nature_res","frost_res","shadow_res","arcane_res"]):
            cols[res] = gi(s, 'Resistances_%d' % (i+1))   # [0] is physical/armor slot
        cols["delay"] = gi(s, 'ItemDelay'); cols["ammo_type"] = 0; cols["RangedModRange"] = 0
        for n in range(1, 6):
            for suf, val in [("spellid",0),("spelltrigger",0),("spellcharges",0),("spellppmRate",0),
                             ("spellcooldown",-1),("spellcategory",0),("spellcategorycooldown",-1)]:
                cols["%s_%d" % (suf, n)] = val
        cols["bonding"] = gi(s, 'Bonding')
        cols["description"] = (s.get('Description_lang') or '').strip()
        cols["PageText"] = gi(s, 'PageID'); cols["LanguageID"] = gi(s, 'LanguageID'); cols["PageMaterial"] = gi(s, 'PageMaterialID')
        cols["startquest"] = gi(s, 'StartQuestID'); cols["lockid"] = gi(s, 'LockID')
        cols["Material"] = gi(s, 'Material') or gi(m, 'Material'); cols["sheath"] = gi(s, 'SheatheType') or gi(m, 'SheatheType')
        cols["RandomProperty"] = 0; cols["RandomSuffix"] = 0; cols["block"] = 0
        cols["itemset"] = gi(s, 'ItemSet'); cols["MaxDurability"] = gi(s, 'MaxDurability')
        cols["area"] = 0; cols["Map"] = 0; cols["BagFamily"] = gi(s, 'BagFamily'); cols["TotemCategory"] = gi(s, 'TotemCategoryID')
        for n in range(1, 4):
            cols["socketColor_%d" % n] = gi(s, 'SocketType_%d' % (n-1)); cols["socketContent_%d" % n] = 0
        cols["socketBonus"] = gi(s, 'Socket_match_enchantment_ID'); cols["GemProperties"] = gi(s, 'Gem_properties')
        cols["RequiredDisenchantSkill"] = -1; cols["ArmorDamageModifier"] = 0
        cols["duration"] = gi(s, 'DurationInInventory'); cols["ItemLimitCategory"] = gi(s, 'LimitCategory')
        cols["HolidayId"] = 0; cols["ScriptName"] = ""; cols["DisenchantID"] = 0; cols["FoodType"] = 0
        cols["minMoneyLoot"] = 0; cols["maxMoneyLoot"] = 0; cols["flagsCustom"] = 0; cols["VerifiedBuild"] = 0
        rows_out.append((newid, cata, cols))

rows_out.sort()
with open(os.path.join(ZPAK, "sql/zz_[F-011]_items.sql"), "w") as f:
    f.write("-- F-011 Lost Isles custom items (from wago ItemSparse 4.4.2, renumbered to 84300+)\n")
    f.write("-- %d items. Owned custom rows: DELETE+INSERT. Icons (displayid) deferred.\n\n" % len(rows_out))
    for newid, cata, cols in rows_out:
        f.write("-- Cata %d -> %d  (%s)\n" % (cata, newid, cols["name"]))
        f.write("DELETE FROM item_template WHERE entry = %d;\n" % newid)
        f.write("INSERT INTO item_template SET\n")
        f.write(",\n".join("  `%s` = %s" % (k, esc(v)) for k, v in cols.items()))
        f.write(";\n\n")
print("wrote %d item_template rows" % len(rows_out))
