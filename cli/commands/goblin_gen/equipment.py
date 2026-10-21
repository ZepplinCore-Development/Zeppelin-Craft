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


# InventoryTypes AC accepts in creature_equip_template (ObjectMgr::LoadEquipmentTemplates):
# weapon, shield, ranged, 2H, main/off hand, holdable, thrown, ranged right.
HAND_INVTYPES = {13, 14, 15, 17, 21, 22, 23, 25, 26}


def _item_template_present(item_ids):
    """{entry: (name, InventoryType)} for entries in the live AC world item_template."""
    if not item_ids:
        return {}
    il = ",".join(map(str, sorted(item_ids)))
    r = subprocess.run(
        [sys.executable, "-m", "cli.zep", "world", "sql", "query",
         "SELECT entry, InventoryType, name FROM item_template WHERE entry IN (%s)" % il],
        capture_output=True, text=True, cwd=_REPO_ROOT)
    out = {}
    for line in r.stdout.splitlines():
        f = line.split("\t")
        if len(f) >= 3 and f[0].strip().isdigit():
            out[int(f[0])] = (f[2].strip(), int(f[1]))
    return out


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
    # I-383: never re-equip a stock creature (2110 Black Rat, 4075 Rat carried donor gear).
    gob -= _sibling("creatures").stock_creature_entries()
    gset = ",".join(map(str, sorted(gob)))
    rows = [(_i(r["entry"]), _i(r["itemEntry1"]), _i(r["itemEntry2"]), _i(r["itemEntry3"]))
            for r in ctx.q("SELECT entry,itemEntry1,itemEntry2,itemEntry3 "
                           "FROM creature_equip_template WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)"
                           % gset)]

    items = {v for _e, a, b, d in rows for v in (a, b, d) if v > 0}
    live = _item_template_present(items)
    # I-383: presence by id is not enough. A donor id can be a DIFFERENT 3.3.5 item
    # (61320 is Cata "Monster - Blowdart" but our "Mitts of the Error"; 64433 a Cata
    # goblin sword but here a cloak), which AC zeroes with a load error. Keep an id only
    # when it is hand-equipable here — AC's own test. (Names are no guide: AC calls the
    # same weapons "NPC Equip 27923".)
    have, collided = set(), []
    for v, (name, inv) in live.items():
        if inv in HAND_INVTYPES:
            have.add(v)
        else:
            collided.append(v)

    emit_rows = []
    for e, a, b, d in sorted(rows):
        it = [v if v in have else 0 for v in (a, b, d)]
        if any(it):
            emit_rows.append((e, it))

    ents = [e for e, _ in emit_rows]
    # Delete over every SOURCE entry, not just the emitted ones: an entry whose items all
    # fail the check (34835's lone 64433) must lose the row a previous run shipped.
    ctx.col.delete("creature_equip_template",
                   "CreatureID IN (%s)" % ",".join(map(str, sorted({e for e, *_ in rows}))))
    for e, it in emit_rows:
        ctx.col.add("creature_equip_template", {
            "CreatureID": e, "ID": 1, "ItemID1": it[0], "ItemID2": it[1],
            "ItemID3": it[2], "VerifiedBuild": 0,
        })

    # fold creature.equipment_id onto the collected spawn rows (entry-keyed -> guid rows)
    ctx.col.patch("creature", "id", ents, {"equipment_id": 1})
    return "equipment: armed %d creatures (%d/%d source items present in item_template)%s" % (
        len(emit_rows), len(have), len(items),
        "; id collides with a non-weapon 3.3.5 item, zeroed: %s" % ",".join(
            map(str, sorted(collided))) if collided else "")
