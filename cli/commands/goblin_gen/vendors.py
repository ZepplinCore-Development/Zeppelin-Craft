"""gen domain: vendors.

npc_vendor (Cata, neltharion) -> AC npc_vendor, plus item_template rows for the
"new" vendor items that don't exist in stock WotLK (the Cata-only goods the scoped
vendors sell). Two outputs per zone:

  * <sfx>_vendors.sql       -- npc_vendor inventories (custom items remapped)
  * <sfx>_items_vendor.sql  -- item_template for the new vendor items

Item ids for the new goods are remapped Cata -> the F-011 84300+ block. The remap
base is the committed item_remap fixture (a read-only snapshot produced by the item
emitters); this module appends its own new items in-memory (sorted, next free id)
without persisting anything back to the fixture -- matching the old
append_items/migrate_vendors behaviour.

The new items' metadata is recovered from the extracted Whitemane 4.3.4 (build
15595) client DBs: Item.db2 (class/subclass/material/inv/sheath) + Item-sparse.db2
(name/quality/prices/stats/...). Build 15595 does NOT store the fields the 4.3.4
client derives at runtime from ItemDamage*.dbc -- weapon damage, attack speed,
ranged range, durability -- so those come from the wago ItemSparse 4.4.2 CSV
(ctx.wago), the same source items.py reads, keyed on the Cata id (I-324).
"""
import os
import struct

NAME = "vendors"
TABLES = ["item_template", "npc_vendor"]
TIER = "base"

# ---- Item-sparse.db2 (build 15595) field indices (all 4-byte fields) ----
_SP_QUALITY = 1
_SP_BUYCOUNT = 6          # wago VendorStackCount
_SP_BUYPRICE = 7
_SP_SELLPRICE = 8
_SP_INVTYPE = 9
_SP_ALLOWCLASS = 10
_SP_ALLOWRACE = 11
_SP_ILVL = 12
_SP_REQLVL = 13
_SP_MAXCOUNT = 21
_SP_STACK = 22
_SP_CONTSLOTS = 23
_SP_STATTYPE0 = 24        # ItemStatType[10]  -> 24..33
_SP_STATVAL0 = 34         # ItemStatValue[10] -> 34..43
_SP_DAMAGETYPE = 65
_SP_BONDING = 98
_SP_NAME = 99             # string offset
_SP_DESC = 103            # string offset
_SP_STARTQUEST = 107
_SP_MATERIAL = 109
_SP_SHEATHE = 110
_SP_BAGFAMILY = 116
_SP_DURATION = 127


def _wi(r, k, d=0):
    """int from a wago CSV row (blank/absent -> d)."""
    try:
        return int(float(r.get(k, d) or d))
    except Exception:
        return d


def _wf(r, k, d=0.0):
    """float from a wago CSV row (blank/absent -> d)."""
    try:
        return float(r.get(k, d) or d)
    except Exception:
        return d


# ---- Item.db2 (build 15595) field indices ----
_IT_CLASS = 1
_IT_SUBCLASS = 2
_IT_MATERIAL = 4
_IT_INVTYPE = 6
_IT_SHEATHE = 7


def _read_wdb2(path):
    """Read a WDB2 (.db2) file -> (records: dict[id -> tuple[int32]], get_string(off))."""
    d = open(path, "rb").read()
    _magic, rc, fc, rs, _sts = struct.unpack_from("<4sIIII", d, 0)
    min_id, max_id = struct.unpack_from("<ii", d, 32)
    base = 48
    if max_id != 0:                     # WDB2 index block: diff*(uint32 id + uint16 len)
        base += (max_id - min_id + 1) * 6
    sb = base + rc * rs                 # string block start
    recs = {}
    for i in range(rc):
        f = struct.unpack_from("<%di" % fc, d, base + i * rs)  # signed: -1 sentinels
        recs[f[0]] = f

    def get_string(off):
        e = d.index(b"\0", sb + off)
        return d[sb + off:e].decode("latin1")
    return recs, get_string


def _fixture_opt(ctx, name):
    """ctx.fixture(name) or None if the fixture file is absent."""
    try:
        return ctx.fixture(name)
    except (FileNotFoundError, IOError):
        return None


def _esc(v):
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def emit(ctx):
    sfx = ctx.sfx
    scope = ctx.fixture("vendor_scope" + sfx)
    vendors = scope["vendors"]

    # ---- remap: read-only fixture base + this zone's new items appended in-memory ----
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    new_items = _fixture_opt(ctx, "vendor_new_items" + sfx)
    if new_items is None:                       # no zone-specific list -> shared fixture
        new_items = _fixture_opt(ctx, "vendor_new_items") or []
    nextid = (max(remap.values()) + 1) if remap else 84300
    for cata in sorted(new_items):
        if cata not in remap:
            remap[cata] = nextid
            nextid += 1

    # ---- item_template for the new vendor goods (recovered from Whitemane DB2) ----
    sparse, gs = _read_wdb2(ctx.whitemane_dbc("Item-sparse.db2"))
    itemdb, _ = _read_wdb2(ctx.whitemane_dbc("Item.db2"))
    # Fields build 15595 doesn't store (weapon damage/speed/range/durability) come from
    # the wago 4.4.2 ItemSparse export instead -- same source items.py uses.
    wanted = set(new_items)
    wago = {}
    for r in ctx.wago("itemsparse_442"):
        try:
            i = int(r["ID"])
        except Exception:
            continue
        if i in wanted:
            wago[i] = r
    irows = []
    for cata in new_items:
        s = sparse.get(cata)
        if s is None:                           # absent from Whitemane too -> skip
            continue
        m = itemdb.get(cata)
        newid = remap[cata]
        col = {
            "entry": newid,
            "class": (m[_IT_CLASS] if m else 0),
            "subclass": (m[_IT_SUBCLASS] if m else 0),
            "SoundOverrideSubclass": -1,
            "name": gs(s[_SP_NAME]).strip(),
            "displayid": 0,   # owned by item_icons overlay (stock-first, deterministic)
            "Quality": s[_SP_QUALITY],
            "Flags": 0,
            "FlagsExtra": 0,
            "BuyCount": max(s[_SP_BUYCOUNT], 1),
            "BuyPrice": s[_SP_BUYPRICE],
            "SellPrice": s[_SP_SELLPRICE],
            "InventoryType": s[_SP_INVTYPE] or (m[_IT_INVTYPE] if m else 0),
            "AllowableClass": s[_SP_ALLOWCLASS] or -1,
            "AllowableRace": s[_SP_ALLOWRACE] or -1,
            "ItemLevel": s[_SP_ILVL],
            "RequiredLevel": s[_SP_REQLVL],
            "maxcount": s[_SP_MAXCOUNT],
            "stackable": max(s[_SP_STACK], 1),
            "ContainerSlots": s[_SP_CONTSLOTS],
        }
        for n in range(1, 11):
            st = s[_SP_STATTYPE0 + (n - 1)]
            sv = s[_SP_STATVAL0 + (n - 1)]
            if st < 0 or st > 255:
                st, sv = 0, 0
            col["stat_type%d" % n] = st
            col["stat_value%d" % n] = sv
        # Weapon damage / speed / ranged range are NOT stored in build-15595 Item-sparse
        # (the 4.3.4 client derives them from ItemDamage*.dbc). They ARE carried by the
        # wago 4.4.2 ItemSparse export, which items.py already reads -- so take them from
        # there, keyed on the same Cata id. Leaving them 0 ships 0-DPS weapons (I-324).
        w = wago.get(cata, {})
        col["dmg_min1"] = _wf(w, "MinDamage_0")
        col["dmg_max1"] = _wf(w, "MaxDamage_0")
        col["dmg_type1"] = s[_SP_DAMAGETYPE]
        col["delay"] = _wi(w, "ItemDelay")
        col["RangedModRange"] = _wf(w, "ItemRange")
        # NB MaxDurability: the 30 vendor armour rows originally shipped at 0, so copies
        # already in players' bags had item_instance.durability = 0 -- raising the max
        # alone reads as 0/60 (broken, no stats). That repair was landed with the
        # zz_[I-324] world SQL on 2026-08-08, so emitting the real value is safe now.
        # If this ever re-runs against an older characters DB, re-run the repair
        # documented in zz_[I-324]_vendor_armour_durability.sql.
        col["MaxDurability"] = _wi(w, "MaxDurability")
        col["bonding"] = s[_SP_BONDING]
        col["description"] = gs(s[_SP_DESC]).strip()
        col["Material"] = s[_SP_MATERIAL] or (m[_IT_MATERIAL] if m else 0)
        col["sheath"] = s[_SP_SHEATHE] or (m[_IT_SHEATHE] if m else 0)
        col["BagFamily"] = s[_SP_BAGFAMILY]
        col["startquest"] = s[_SP_STARTQUEST]
        col["RequiredDisenchantSkill"] = -1
        col["duration"] = s[_SP_DURATION]
        irows.append((newid, cata, col))
    irows.sort()

    for newid, cata, col in irows:
        ctx.col.put("item_template", newid, col, tier="base", zone=sfx,
                    owner="vendors", note="Cata %d -> %d (%s)  [vendor]" % (cata, newid, col["name"]))

    # ---- npc_vendor inventories ----
    vrows = []
    for e in vendors:
        rows = ctx.q("SELECT * FROM npc_vendor WHERE TRIM(entry)=%s", (str(e),))
        rows.sort(key=lambda r: int(r["slot"] or 0))   # stable over source (insertion) order
        for r in rows:
            it = int(r["item"] or 0)
            if it <= 0:
                continue
            vrows.append((e, int(r["slot"] or 0), remap.get(it, it),
                          int(r["maxcount"] or 0), int(r["incrtime"] or 0),
                          int(r["ExtendedCost"] or 0)))
    dels = ",".join(str(x) for x in sorted(set(vendors)))
    ctx.col.delete("npc_vendor", "entry IN (%s)" % dels)
    for e, slot, item, maxcount, incrtime, extcost in vrows:
        ctx.col.add("npc_vendor", {
            "entry": e, "slot": slot, "item": item, "maxcount": maxcount,
            "incrtime": incrtime, "ExtendedCost": extcost, "VerifiedBuild": 0,
        })

    return "npc_vendor rows=%d (%d vendors) items_vendor=%d" % (
        len(vrows), len(set(v[0] for v in vrows)), len(irows))
