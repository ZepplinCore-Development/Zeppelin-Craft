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
import importlib.util
import os
import sys
import subprocess

NAME = "equipment"
TABLES = ["creature", "creature_equip_template"]
TIER = "overlay"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)
_REPO_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


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
    # Summon-only creatures have no spawn row -> invisible to the sweep (I-290).
    # 35813 Frightened Miner's source equip set is item 1910 "Monster - Item, Pick";
    # without it he mines bare-handed. Spawn-driven scoping dropped the whole set,
    # the same hole I-277 hit for creature_addon and I-288 for creature_text.
    gob |= set(_sibling("_summons").summoned_entries(ctx))
    gset = ",".join(map(str, sorted(gob)))
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
    ctx.col.delete("creature_equip_template",
                   "CreatureID IN (%s)" % ",".join(map(str, ents)))
    for e, it in emit_rows:
        ctx.col.add("creature_equip_template", {
            "CreatureID": e, "ID": 1, "ItemID1": it[0], "ItemID2": it[1],
            "ItemID3": it[2], "VerifiedBuild": 0,
        })

    # fold creature.equipment_id onto the collected spawn rows (entry-keyed -> guid rows)
    ctx.col.patch("creature", "id", ents, {"equipment_id": 1})
    return "equipment: armed %d creatures (%d/%d source items present in item_template)" % (
        len(emit_rows), len(have), len(items))
