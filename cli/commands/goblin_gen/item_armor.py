"""gen domain: item_armor.

Derive base armor for the custom F-011 armor pieces (the items emitter leaves armor=0 --
the 4.3.4 client computes armor from DBCs by ilvl/quality/slot, which the Item-sparse.db2
does not store). For each custom armor piece take the armor of stock WotLK item_template
analogs with the same (class, subclass, InventoryType) at the nearest ItemLevel -- armor is
ilvl+slot+type driven in 3.3.5a, so this reproduces Blizzlike values for the lvl 1-12
starter range. Port of Scripts/Goblin Zone Port/derive_item_armor.py.

Reads the live world DB (stock analogs + the applied custom rows) directly, so this is a
post-apply finalize step (run after the items SQL is in the world DB). Unlike the source it
does not gate on `armor=0`, so it always emits the full deterministic derivation rather than
depending on whether armor was already applied. Single file, emitted on the Lost Isles pass.
"""
import os

NAME = "item_armor"

CUSTOM_LO, CUSTOM_HI = 84300, 84799
ARMOR_SLOTS = "(1,3,5,6,7,8,9,10,14)"   # head/shoulder/chest/waist/legs/feet/wrist/hands/shield
ARMOR_SUBCLASSES = "(1,2,3,4,6)"        # cloth/leather/mail/plate/shield


def _world_query(sql):
    import mysql.connector
    con = mysql.connector.connect(
        host=os.getenv("DB_HOST", "127.0.0.1"), port=int(os.getenv("DB_PORT", "3306")),
        user=os.getenv("DB_USER", "acore"), password=os.getenv("DB_PASS", "acore"),
        database=os.getenv("WORLD_DB_NAME", "acore_world"))
    cur = con.cursor()
    cur.execute(sql)
    rows = cur.fetchall()
    cur.close()
    con.close()
    return rows


def emit(ctx):
    if ctx.sfx:
        return "skipped (combined file emitted on Lost Isles pass only)"

    items = _world_query(
        "SELECT entry,class,subclass,InventoryType,ItemLevel FROM item_template "
        "WHERE entry BETWEEN %d AND %d AND class=4 AND subclass IN %s "
        "AND InventoryType IN %s" % (CUSTOM_LO, CUSTOM_HI, ARMOR_SUBCLASSES, ARMOR_SLOTS))

    stock = _world_query(
        "SELECT subclass,InventoryType,ItemLevel,ROUND(AVG(armor)) FROM item_template "
        "WHERE class=4 AND armor>0 AND entry NOT BETWEEN %d AND %d "
        "AND subclass IN %s AND InventoryType IN %s "
        "GROUP BY subclass,InventoryType,ItemLevel"
        % (CUSTOM_LO, CUSTOM_HI, ARMOR_SUBCLASSES, ARMOR_SLOTS))
    lookup = {}
    for sc, it, ilvl, arm in stock:
        lookup.setdefault((int(sc), int(it)), {})[int(ilvl)] = int(float(arm))

    updates, missing = [], 0
    for entry, cls, sc, it, ilvl in items:
        entry, sc, it, ilvl = int(entry), int(sc), int(it), int(ilvl)
        table = lookup.get((sc, it))
        if not table:
            missing += 1
            continue
        near = min(table, key=lambda L: abs(L - ilvl))
        updates.append((entry, table[near], sc, it, ilvl, near))
    updates.sort()

    b = [
        "-- [F-011] Derive base armor for custom goblin armor items (items emitter sets armor=0).",
        "-- Armor derived from stock WotLK item_template analogs by (subclass,InventoryType) at nearest",
        "-- ItemLevel (armor is ilvl+slot+type driven in 3.3.5a). Idempotent; stock rows untouched.\n",
    ]
    for entry, arm, sc, it, ilvl, near in updates:
        b.append("UPDATE item_template SET armor=%d WHERE entry=%d;  -- sc%d inv%d ilvl%d~stock%d"
                 % (arm, entry, sc, it, ilvl, near))
    ctx.write("sql/zz_[AUTO,F-011]_item_armor.sql", "\n".join(b) + "\n")
    return "armor=%d no-analog=%d" % (len(updates), missing)
