"""gen domain: quest_npcs.

Port of Scripts/Goblin Zone Port/migrate_quest_npcs.py.

creature_template for quest-target NPCs (kill-credit proxies / rescue targets)
referenced by a zone quest's RequiredNpcOrGo but not spawned in the zone (so absent
from the main creature import). Template-only, stock display, no DBC/PATCH-Z — makes
quest objective refs valid. Emits creatures_05_quest_npcs (creature_template +
creature_template_model). Per-zone (uses ctx.sfx to pick the item_scope fixture).
"""
NAME = "quest_npcs"
TABLES = ["creature_template", "creature_template_model"]
TIER = "base"

# Invalid Cata factions with no 3.3.5a FactionTemplate row segfault the server -> remap.
FACTION_REMAP = {2159: 35, 2160: 35, 2227: 35, 2231: 35, 2238: 35, 2200: 14, 2228: 14}
CREDIT_DISPLAY = 11686   # invisible stalker (stock) for credit/trigger NPCs
FALLBACK_DISPLAY = 646
FACTION_DBC = "/workspace/project/data/dbc/FactionTemplate.dbc"


def _n(v, d):
    """sqlite `x or default` semantics under a TYPED source: the old pipeline read a
    string-typed sqlite where a stored 0 was "0" (truthy) and only NULL/'' fell back to
    the default. In typed neltharion a numeric 0 is falsy, so a plain `v or d` would
    wrongly substitute d for a real 0 (e.g. Mana_mod=0). Fall back only on NULL."""
    return d if v is None else v


def _esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def emit(ctx):
    sfx = ctx.sfx
    scope = ctx.fixture("item_scope" + sfx)
    qids = scope["quests"]
    imported = set(scope["creatures"])   # creatures already spawned in-zone (main import)

    # unremapped Cata factions with no 3.3.5a DBC row would crash the server
    try:
        recs, _gs = ctx.read_wdbc(FACTION_DBC)
        valid_factions = {r[0] for r in recs}
    except Exception:
        valid_factions = set()

    tmpl = {int(r["entry"]): r for r in ctx.q("SELECT * FROM creature_template")}

    # gather RequiredNpcOrGo>0 targets from the in-scope quests
    targets = set()
    if qids:
        qin = ",".join(str(int(q)) for q in qids)
        rows = ctx.q(
            "SELECT RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4 "
            "FROM quest_template WHERE Id IN (%s)" % qin)
        for r in rows:
            for v in r.values():
                try:
                    v = int(v)
                except (TypeError, ValueError):
                    continue
                if v and v > 0:
                    targets.add(v)

    missing = sorted(t for t in targets if t not in imported and t in tmpl)
    absent = sorted(t for t in targets if t not in tmpl)   # not even in source

    for e in missing:
        t = tmpl[e]
        exp = min(int(_n(t["exp"], 0)), 2)
        faction = int(_n(t["faction_A"], 0)) or int(_n(t["faction_H"], 0))
        faction = FACTION_REMAP.get(faction, faction)
        if valid_factions and faction not in valid_factions:
            faction = 35   # invalid Cata faction -> friendly (no crash)
        name = (t["name"] or "").strip()
        low = name.lower()
        is_credit = "credit" in low or "bunny" in low or "trigger" in low
        disp = CREDIT_DISPLAY if is_credit else FALLBACK_DISPLAY
        col = {
            "entry": e, "name": name, "subname": (t["subname"] or "").strip() or None,
            "minlevel": int(_n(t["minlevel"], 1)), "maxlevel": int(_n(t["maxlevel"], 1)),
            "exp": exp, "faction": faction or 35, "npcflag": int(_n(t["npcflag"], 0)),
            "unit_class": int(_n(t["unit_class"], 1)), "type": int(_n(t["type"], 0)),
            "type_flags": int(_n(t["type_flags"], 0)), "rank": int(_n(t["rank"], 0)),
            "DamageModifier": float(_n(t["dmg_multiplier"], 1)), "BaseVariance": 1, "RangeVariance": 1,
            "HealthModifier": float(_n(t["Health_mod"], 1)), "ManaModifier": float(_n(t["Mana_mod"], 1)),
            "ArmorModifier": float(_n(t["Armor_mod"], 1)),
            "RegenHealth": int(_n(t["RegenHealth"], 1)), "MovementType": 0, "unit_flags": int(_n(t["unit_flags"], 0)),
            "AIName": "", "flags_extra": 0, "lootid": 0, "VerifiedBuild": 0,
        }
        ctx.col.put("creature_template", e, col, tier="base", zone=sfx, owner="quest_npcs")
        ctx.col.put("creature_template_model", e, {
            "CreatureID": e, "Idx": 0, "CreatureDisplayID": disp, "DisplayScale": 1,
            "Probability": 1, "VerifiedBuild": 0,
        }, tier="base", zone=sfx, owner="quest_npcs")

    return ("quest-npc templates=%d (targets=%d, absent-from-source=%d)"
            % (len(missing), len(targets), len(absent)))
