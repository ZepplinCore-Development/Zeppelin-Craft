#!/usr/bin/env python3
"""
F-011 supplementary: import creature_template for quest-target NPCs (kill-credit
proxies / rescue targets) referenced by LI quest RequiredNpcOrGo but not spawned in
the zone (so absent from the main creature import). Template-only, stock display,
no DBC/PATCH-Z. Makes quest objective refs valid.
"""
import sqlite3, json, os
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
c = sqlite3.connect(os.path.join(SCRATCH, "neltharion.sqlite")); c.row_factory = sqlite3.Row
SFX = os.environ.get("F011_SFX","")
scope = json.load(open(os.path.join(SCRATCH, "item_scope%s.json" % SFX)))
QIDS = scope["quests"]
FACTION_REMAP = {2159:35,2160:35,2227:35,2231:35,2238:35,2200:14,2228:14}
import struct as _struct
def _valid_factions():
    try:
        d = open("/workspace/project/data/dbc/FactionTemplate.dbc", "rb").read()
        rc = _struct.unpack("<I", d[4:8])[0]; rs = _struct.unpack("<I", d[12:16])[0]
        return {_struct.unpack_from("<I", d, 20 + i * rs)[0] for i in range(rc)}
    except Exception:
        return set()
VALID_FACTIONS = _valid_factions()   # unremapped Cata factions (no DBC row) segfault the server
CREDIT_DISPLAY = 11686   # invisible stalker (stock) for credit/trigger NPCs
FALLBACK_DISPLAY = 646

tmpl = {int(r["entry"]): r for r in c.execute("SELECT * FROM creature_template")}
# already-imported set = creatures spawned in zone 4720 (the main import)
imported = set(scope["creatures"])

# gather RequiredNpcOrGo>0 targets from LI quests
targets = set()
qmarks = ",".join("'%d'" % q for q in QIDS)
for r in c.execute("SELECT RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4 FROM quest_template WHERE TRIM(Id) IN (%s)" % qmarks):
    for k in r.keys():
        v = r[k]
        try: v = int(v)
        except: continue
        if v and v > 0: targets.add(v)

missing = sorted(t for t in targets if t not in imported and t in tmpl)
absent = sorted(t for t in targets if t not in tmpl)   # not even in source
print("quest NPC targets:", len(targets), " to import:", len(missing), " absent-from-source:", len(absent))
if absent: print("  absent (no source template, can't import):", absent[:20])

def esc(v):
    if v is None: return "NULL"
    if isinstance(v, str): return "'" + v.replace("\\","\\\\").replace("'","''") + "'"
    if isinstance(v, float): return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)

with open(os.path.join(ZPAK, "sql/zz_[F-011]" + SFX + "_creatures_05_quest_npcs.sql"), "w") as f:
    f.write("-- F-011 quest-target NPC templates (credit proxies / rescue targets, template-only, stock display)\n\n")
    for e in missing:
        t = tmpl[e]
        exp = min(int(t["exp"] or 0), 2)
        faction = int(t["faction_A"] or 0) or int(t["faction_H"] or 0)
        faction = FACTION_REMAP.get(faction, faction)
        if VALID_FACTIONS and faction not in VALID_FACTIONS: faction = 35   # invalid Cata faction -> friendly (no crash)
        name = (t["name"] or "").strip()
        is_credit = "credit" in name.lower() or "bunny" in name.lower() or "trigger" in name.lower()
        disp = CREDIT_DISPLAY if is_credit else FALLBACK_DISPLAY
        col = {
            "entry": e, "name": name, "subname": (t["subname"] or "").strip() or None,
            "minlevel": int(t["minlevel"] or 1), "maxlevel": int(t["maxlevel"] or 1),
            "exp": exp, "faction": faction or 35, "npcflag": int(t["npcflag"] or 0),
            "unit_class": int(t["unit_class"] or 1), "type": int(t["type"] or 0),
            "type_flags": int(t["type_flags"] or 0), "rank": int(t["rank"] or 0),
            "DamageModifier": float(t["dmg_multiplier"] or 1), "BaseVariance": 1, "RangeVariance": 1,
            "HealthModifier": float(t["Health_mod"] or 1), "ManaModifier": float(t["Mana_mod"] or 1),
            "ArmorModifier": float(t["Armor_mod"] or 1),
            "RegenHealth": int(t["RegenHealth"] or 1), "MovementType": 0, "unit_flags": int(t["unit_flags"] or 0),
            "AIName": "", "flags_extra": 0, "lootid": 0, "VerifiedBuild": 0,
        }
        f.write("DELETE FROM creature_template WHERE entry = %d;\n" % e)
        f.write("INSERT INTO creature_template SET " + ", ".join("`%s`=%s" % (k, esc(v)) for k, v in col.items()) + ";\n")
        f.write("DELETE FROM creature_template_model WHERE CreatureID = %d;\n" % e)
        f.write("INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (%d,0,%d,1,1,0);\n\n" % (e, disp))
print("wrote %d quest-npc templates" % len(missing))
