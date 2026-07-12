"""gen domain: equipment.

creature_equip_template (Cata, neltharion) -> AC creature_equip_template
(NPC weapons/held items) for the goblin zone NPCs. Source is entry-keyed
(entry,itemEntry1..3 -> one set); AC is (CreatureID,ID,ItemID1..3). We emit ID=1
and set creature.equipment_id=1 on the imported spawns. Per the port-or-skip
rule, any itemEntry absent from the live AC item_template is zeroed rather than
emitted as a dangling ref (invisible-weapon / possible display fault). Creatures
left with no valid item are skipped. Single combined file for both zones ->
emitted only on the "" pass.

Note: the `npc_equip_missing` fixture does not correspond to this weapon-item
set (zero overlap; it is item-recovery bookkeeping), so -- like the standalone
migrate_equipment.py -- presence is resolved against the live world item_template.
"""
import os
import sys
import subprocess

NAME = "equipment"
TABLES = ["creature"]   # equipment_id patch onto spawns (creature_equip_template still legacy)
TIER = "overlay"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)
_REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))


def _i(v, d=0):
    try:
        return int(str(v).strip())
    except Exception:
        try:
            return int(float(str(v).strip()))
        except Exception:
            return d


def _item_template_present(item_ids):
    """Item entries that exist in the live AC world item_template (port-or-skip)."""
    if not item_ids:
        return set()
    il = ",".join(map(str, sorted(item_ids)))
    r = subprocess.run(
        [sys.executable, "-m", "cli.zep", "world", "sql", "query",
         "SELECT entry FROM item_template WHERE entry IN (%s)" % il],
        capture_output=True, text=True, cwd=_REPO_ROOT)
    return set(int(x) for x in r.stdout.split() if x.strip().isdigit())


def emit(ctx):
    if ctx.sfx == "_K":
        return "equipment: skipped (single combined file, emitted on the Lost Isles pass)"

    gob = {_i(r["id"]) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS id FROM creature "
        "WHERE TRIM(zone) IN ('%s','%s')"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % ZONES)}  # no dev/leet NPCs (I-233)
    gset = ",".join(map(str, gob))
    rows = [(_i(r["entry"]), _i(r["itemEntry1"]), _i(r["itemEntry2"]), _i(r["itemEntry3"]))
            for r in ctx.q("SELECT entry,itemEntry1,itemEntry2,itemEntry3 "
                           "FROM creature_equip_template WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)"
                           % gset)]

    items = {v for _e, a, b, d in rows for v in (a, b, d) if v > 0}
    have = _item_template_present(items)

    emit_rows = []
    for e, a, b, d in sorted(rows):
        it = [v if v in have else 0 for v in (a, b, d)]
        if any(it):
            emit_rows.append((e, it))

    ents = [e for e, _ in emit_rows]
    out = [
        "-- [F-011] creature_equip_template (NPC weapons) from Neltharion. equipment_id=1 per creature.",
        "-- Cata items absent from AC item_template zeroed (port-or-skip). "
        "Regenerate: `zep goblin gen equipment`.\n",
        "DELETE FROM creature_equip_template WHERE CreatureID IN (%s);" % ",".join(map(str, ents)),
        "INSERT INTO creature_equip_template (CreatureID,ID,ItemID1,ItemID2,ItemID3,VerifiedBuild) VALUES",
    ]
    out.append(",\n".join("  (%d,1,%d,%d,%d,0)" % (e, it[0], it[1], it[2])
                          for e, it in emit_rows) + ";")
    ctx.write("sql/zz_[AUTO,F-011]%s_creature_equip.sql" % ctx.sfx, "\n".join(out) + "\n")

    # fold creature.equipment_id onto the collected spawn rows (entry-keyed -> guid rows)
    ctx.col.patch("creature", "id", ents, {"equipment_id": 1})
    return "equipment: armed %d creatures (%d/%d source items present in item_template)" % (
        len(emit_rows), len(have), len(items))
