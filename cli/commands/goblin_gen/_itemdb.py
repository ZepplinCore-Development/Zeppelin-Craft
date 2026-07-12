"""Shared item helpers for the F-011 gen item emitters (items / item_icons / item_flags).

Not a gen domain (leading underscore -> skipped by the domain discovery loop). The
item emitters were previously the standalone Scripts/Goblin Zone Port/migrate_items.py
+ build_icons.py; this module centralises the two things they all need:

  * reading the Whitemane 4.3.4 client `Item-sparse.db2` / `Item.db2` (WDB2 -- the
    stock ctx.read_wdbc only does WDBC), and
  * resolving each item's inventory icon straight from client data
    (Item.db2 DisplayInfoID -> Whitemane ItemDisplayInfo.dbc InventoryIcon ->
     live 3.3.5a itemdisplayinfo lowest id sharing that icon).

Field layout is the retail 4.3.4 (build 15595) ItemSparse / Item struct; every
field consumed here was verified byte-for-byte against the committed
zz_[F-011]_items.sql. The 4.3.4 DB2 does NOT carry client-computed weapon damage
or MaxDurability (those are derived in-client from ItemDamage*.dbc / durability
tables), so `item_cols` leaves dmg_min1/dmg_max1/MaxDurability at 0 exactly as the
raw source provides -- see the emitter notes.
"""
import struct

RESERVE_BASE = 84300


class DB2:
    """Minimal WDB2 reader (extended header w/ offset+string-length maps, inline strings)."""

    def __init__(self, path):
        d = open(path, "rb").read()
        self.d = d
        magic, rc, fc, rs, sts, thash, build, ts, minid, maxid, locale, copy = \
            struct.unpack_from("<4s11I", d, 0)
        if magic != b"WDB2":
            raise ValueError("not a WDB2 file: %s (%r)" % (path, magic))
        self.fc, self.rs = fc, rs
        rec_off = 48 + (maxid - minid + 1) * 6 if maxid else 48   # int offsets + short lengths
        self.strtab = rec_off + rc * rs
        self.recs = {}
        for i in range(rc):
            b = rec_off + i * rs
            self.recs[struct.unpack_from("<I", d, b)[0]] = b

    def has(self, rid):
        return rid in self.recs

    def i(self, rid, idx):
        return struct.unpack_from("<i", self.d, self.recs[rid] + idx * 4)[0]

    def f(self, rid, idx):
        return struct.unpack_from("<f", self.d, self.recs[rid] + idx * 4)[0]

    def s(self, rid, idx):
        off = struct.unpack_from("<I", self.d, self.recs[rid] + idx * 4)[0]
        if not off:
            return ""
        e = self.d.index(b"\0", self.strtab + off)
        return self.d[self.strtab + off:e].decode("utf-8", "replace")


# ---- Item.db2 (4.3.4): [ID, ClassID, SubclassID, SoundOverrideSubclass, Material,
#                         DisplayInfoID, InventoryType, SheatheType] ----
_M = dict(ClassID=1, SubclassID=2, SoundOverrideSubclass=3, Material=4,
          DisplayInfoID=5, InventoryType=6, SheatheType=7)


class WhitemaneItems:
    """Whitemane Item-sparse.db2 + Item.db2 + client-sourced icon resolution."""

    def __init__(self, ctx):
        self.sp = DB2(ctx.whitemane_dbc("Item-sparse.db2"))
        self.it = DB2(ctx.whitemane_dbc("Item.db2"))
        # icon chain: DisplayInfoID -> Whitemane ItemDisplayInfo InventoryIcon (field 5)
        recs, gs = ctx.read_wdbc(ctx.whitemane_dbc("ItemDisplayInfo.dbc"))
        self._disp_icon = {r[0]: (gs(r[5]) if r[5] else "") for r in recs}
        # STOCK 3.3.5a itemdisplayinfo: icon basename (lower) -> lowest sharing displayid.
        # Read from the pristine stock DBC (original_dbc), NOT the live/edited db, so
        # resolution is deterministic and never sees our own custom rows or any other
        # feature's edits.
        self._icon_disp = {}
        for row in ctx.stock_dbc_query(
                "SELECT id, icon_1 FROM itemdisplayinfo WHERE icon_1 <> '' ORDER BY id"):
            k = (row["icon_1"] or "").strip().lower()
            if k and k not in self._icon_disp:
                self._icon_disp[k] = row["id"]

    def meta(self, cata):
        if not self.it.has(cata):
            return {}
        return {k: self.it.i(cata, idx) for k, idx in _M.items()}

    def icon_name(self, cata):
        """Client inventory-icon basename for an item, or '' (from Item.db2 DisplayInfoID)."""
        if not self.it.has(cata):
            return ""
        return self._disp_icon.get(self.it.i(cata, _M["DisplayInfoID"]), "")

    def resolve_displayid(self, cata):
        """3.3.5a ItemDisplayInfo id whose icon matches this item's client icon, or 0."""
        nm = self.icon_name(cata)
        return self._icon_disp.get(nm.strip().lower(), 0) if nm else 0


def remap(ctx):
    """missing_items -> reserved 84300+ block (sorted; matches migrate_items snapshot)."""
    missing = sorted(ctx.fixture("missing_items"))
    return missing, {cata: RESERVE_BASE + i for i, cata in enumerate(missing)}


def full_remap(ctx):
    """The authoritative, already-aggregated Cata->newid map (item_remap.json:
    Lost Isles + Kezan + vendor goods, 84300..84504). Keys coerced to int."""
    return {int(k): v for k, v in ctx.fixture("item_remap").items()}


def _fixture_opt(ctx, name):
    try:
        return ctx.fixture(name)
    except (FileNotFoundError, IOError):
        return None


def zone_catas(ctx):
    """Cata source ids owned by the current zone pass (ctx.sfx): the drop/quest
    `missing_items{sfx}` set plus the `vendor_new_items{sfx}` goods."""
    sfx = ctx.sfx
    catas = set(_fixture_opt(ctx, "missing_items" + sfx) or [])
    catas |= set(_fixture_opt(ctx, "vendor_new_items" + sfx) or [])
    return sorted(int(c) for c in catas)


def esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


def item_cols(wm, cata, newid):
    """Full item_template column dict for one Cata item, in migrate_items' exact order.

    Everything is sourced from the Whitemane 4.3.4 Item-sparse.db2 / Item.db2 and matches
    the committed rows -- except dmg_min1/dmg_max1/armor/MaxDurability, which the 4.3.4
    client computes at runtime (ItemDamage*.dbc / durability tables) and does NOT store in
    the DB2; they are left at 0 here (armor is filled by the item_armor emitter).
    """
    sp, m = wm.sp, wm.meta(cata)

    def si(idx):
        return sp.i(cata, idx)

    cls = m.get("ClassID", 0)
    sound = m.get("SoundOverrideSubclass", -1)
    ac = si(10)
    ac = -1 if ac in (0, 262143) else ac          # 4.3.4 encodes "all classes" as 0x3FFFF
    cols = {
        "entry": newid, "class": cls, "subclass": m.get("SubclassID", 0),
        "SoundOverrideSubclass": sound if sound > 0 else -1,
        "name": sp.s(cata, 99), "displayid": wm.resolve_displayid(cata),
        "Quality": si(1), "Flags": si(2) & 0x7FFFFFFF,
        "BuyCount": max(si(6), 1), "BuyPrice": si(7), "SellPrice": si(8),
        "InventoryType": si(9) or m.get("InventoryType", 0),
        "AllowableClass": ac, "AllowableRace": si(11) or -1,
        "ItemLevel": si(12), "RequiredLevel": si(13),
        "RequiredSkill": si(14), "RequiredSkillRank": si(15),
        "requiredspell": si(16), "requiredhonorrank": 0,
        "RequiredCityRank": 0, "RequiredReputationFaction": si(19),
        "RequiredReputationRank": si(20),
        "maxcount": si(21), "stackable": max(si(22), 1), "ContainerSlots": si(23),
    }
    for n in range(1, 11):
        st = si(23 + n)
        sv = si(33 + n)
        if st < 0 or st > 255:
            st, sv = 0, 0
        cols["stat_type%d" % n] = st
        cols["stat_value%d" % n] = sv
    cols["ScalingStatDistribution"] = si(64)
    cols["ScalingStatValue"] = 0
    cols["dmg_min1"] = 0.0            # not stored in 4.3.4 DB2 (client-computed)
    cols["dmg_max1"] = 0.0
    cols["dmg_type1"] = si(65)
    cols["dmg_min2"] = 0
    cols["dmg_max2"] = 0
    cols["dmg_type2"] = 0
    cols["armor"] = 0                 # derived by the item_armor emitter
    for i, res in enumerate(["holy_res", "fire_res", "nature_res", "frost_res",
                             "shadow_res", "arcane_res"]):
        cols[res] = 0
    cols["delay"] = si(66)
    cols["ammo_type"] = 0
    cols["RangedModRange"] = 0
    for n in range(1, 6):
        for suf, val in [("spellid", 0), ("spelltrigger", 0), ("spellcharges", 0),
                         ("spellppmRate", 0), ("spellcooldown", -1),
                         ("spellcategory", 0), ("spellcategorycooldown", -1)]:
            cols["%s_%d" % (suf, n)] = val
    cols["bonding"] = si(98)
    cols["description"] = sp.s(cata, 103)
    cols["PageText"] = si(104)
    cols["LanguageID"] = si(105)
    cols["PageMaterial"] = si(106)
    cols["startquest"] = si(107)
    cols["lockid"] = si(108)
    cols["Material"] = si(109) or m.get("Material", 0)
    cols["sheath"] = si(110) or m.get("SheatheType", 0)
    cols["RandomProperty"] = 0
    cols["RandomSuffix"] = 0
    cols["block"] = 0
    cols["itemset"] = si(113)
    cols["MaxDurability"] = 0         # not stored in 4.3.4 DB2 (client-computed)
    cols["area"] = 0
    cols["Map"] = 0
    cols["BagFamily"] = si(116)
    cols["TotemCategory"] = si(117)
    for n in range(1, 4):
        cols["socketColor_%d" % n] = si(117 + n)
        cols["socketContent_%d" % n] = 0
    cols["socketBonus"] = si(125)
    cols["GemProperties"] = si(126)
    cols["RequiredDisenchantSkill"] = -1
    cols["ArmorDamageModifier"] = 0
    cols["duration"] = si(128)
    cols["ItemLimitCategory"] = si(129)
    cols["HolidayId"] = 0
    cols["ScriptName"] = ""
    cols["DisenchantID"] = 0
    cols["FoodType"] = 0
    cols["minMoneyLoot"] = 0
    cols["maxMoneyLoot"] = 0
    cols["flagsCustom"] = 0
    cols["VerifiedBuild"] = 0
    return cols
