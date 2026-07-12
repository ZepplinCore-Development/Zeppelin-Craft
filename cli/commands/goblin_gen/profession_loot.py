"""gen domain: profession loot (skinning + pickpocketing).

Port of Scripts/Goblin Zone Port/migrate_profession_loot.py. Ports the Neltharion
skinning_loot_template + pickpocketing_loot_template for the goblin creatures (both
zones, 4720 + 4737), converting the old combined-column schema (ChanceOrQuestChance,
mincountOrRef) to AC's standard (Chance/QuestRequired, Reference/MinCount). Items
absent from the live AC item_template are skipped (port-or-skip); reference rows are
kept. Sets creature_template.skinloot / pickpocketloot. DELETE-by-entry clears stale
stock rows. Idempotent.

Combined (non-SFX) output covering both zones at once: emits
zz_[AUTO,F-011]_skinning_loot.sql and zz_[AUTO,F-011]_pickpocket_loot.sql. Emitted
only on the Lost Isles (sfx == "") pass so the Kezan pass does not re-emit the same
combined files.
"""
import os

NAME = "profession_loot"
TABLES = ["creature_template", "skinning_loot_template", "pickpocketing_loot_template"]
TIER = "overlay"

_ZONES = ('4720', '4737')


def _i(v, d=0):
    try:
        return int(str(v).strip())
    except Exception:
        return d


def _fl(v, d=0.0):
    try:
        return float(str(v).strip())
    except Exception:
        return d


def _world_item_entries(item_ids):
    """Subset of item_ids that exist in the live acore_world.item_template."""
    il = ",".join(str(x) for x in item_ids) or "0"
    import mysql.connector
    con = mysql.connector.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"), port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "acore"), password=os.getenv("DB_PASS", "acore"),
        database="acore_world")
    cur = con.cursor()
    cur.execute("SELECT entry FROM item_template WHERE entry IN (%s)" % il)
    have = set(int(r[0]) for r in cur.fetchall())
    cur.close()
    con.close()
    return have


def emit(ctx):
    # Combined file over both zones; only emit once (Lost Isles pass).
    if ctx.sfx != "":
        return "profession_loot: combined skinning/pickpocket files emitted on the lost-isles pass (skipped)"

    zone_list = ",".join("'%s'" % z for z in _ZONES)
    gob = set(_i(r['e']) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS e FROM creature WHERE TRIM(zone) IN (%s)"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % zone_list))  # no dev/leet NPCs (I-233)

    def valid_items(tbl, idset):
        items = set(_i(r['item']) for r in ctx.q(
            "SELECT item FROM %s WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)" % (tbl, idset))
            if _i(r['item']) > 0)
        return _world_item_entries(items)

    summary = []
    for kind, lootcol, tbl in [
            ("skin", "skinloot", "skinning_loot_template"),
            ("pick", "pickpocketloot", "pickpocketing_loot_template")]:
        lootids = {e: _i(l) for e, l in
                   ((_i(r['e']), r['l']) for r in ctx.q(
                       "SELECT CAST(TRIM(entry) AS SIGNED) AS e, %s AS l FROM creature_template" % lootcol))
                   if e in gob and _i(l) > 0}
        idset = ",".join(str(x) for x in set(lootids.values())) or "0"
        have = valid_items(tbl, idset)
        rows = ctx.q(
            "SELECT entry,item,ChanceOrQuestChance,lootmode,groupid,mincountOrRef,maxcount "
            "FROM %s WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)" % (tbl, idset))
        ents = sorted(set(lootids.values()))
        ctx.col.delete(tbl, "Entry IN (%s)" % ",".join(str(x) for x in ents))
        nrows = 0
        for r in rows:
            item = _i(r['item'])
            coq = _fl(r['ChanceOrQuestChance'])
            mcr = _i(r['mincountOrRef'])
            ref = -mcr if mcr < 0 else 0
            if ref == 0 and item not in have:
                continue          # skip missing items (not references)
            ctx.col.add(tbl, {
                "Entry": _i(r['entry']), "Item": item, "Reference": ref,
                "Chance": ctx.col.Raw("%g" % abs(coq)),
                "QuestRequired": 1 if coq < 0 else 0, "LootMode": _i(r['lootmode']),
                "GroupId": _i(r['groupid']), "MinCount": mcr if mcr > 0 else 1,
                "MaxCount": _i(r['maxcount'], 1),
            })
            nrows += 1
        # fold creature_template.skinloot / pickpocketloot into the collector INSERT
        for e, lid in sorted(lootids.items()):
            ctx.col.put("creature_template", e, {lootcol: lid}, tier="overlay")
        summary.append("%s=%d creatures/%d rows" % (kind, len(lootids), nrows))
    return "profession_loot: " + ", ".join(summary)
