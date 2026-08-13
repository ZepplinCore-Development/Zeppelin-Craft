"""gen domain: questitems.

creature_questitem + gameobject_questitem — the client-side "this mob/object holds
your quest item" advertisement (I-332).

The tooltip line on a mob, and GO_DYNFLAG_LO_SPARKLE on a quest object, are driven
by ObjectMgr's quest-item lists, NOT by the loot tables. QueryHandler packs six
item ids into SMSG_CREATURE_QUERY_RESPONSE straight out of
GetCreatureQuestItemList(); with no row the client is simply never told, however
the loot is set up. Every F-011 quest drop shipped without those rows because the
donor keeps this data in the 4.x combined schema — `questItem1`..`questItem6` as
columns ON creature_template / gameobject_template — and both template domains
drop the columns on import (gameobjects.py's header says so outright). Only two
rows existed zone-wide, hand-written in I-320/I-323 for the two egg objects.

Two sources, in priority order:

  * DECLARED — the donor's questItem1-6 columns. This is a retail creature/GO
    query sniff, so it is the authoritative list: it names exactly the droppers
    Blizzard advertised and nothing else.
  * DERIVED — donor loot rows that are quest-required (ChanceOrQuestChance < 0)
    at >= 50% for an item some in-scope quest asks for. Covers holes in the sniff:
    the donor dump has Goblin Zombie 38813 dropping Rockin' Powder 84321 at a
    guaranteed rate with no questItem column set.

The derived pass is deliberately gated on chance, not merely on QuestRequired.
The donor scatters pity drops of the same quest items across the whole zone at
0.001-0.1% (Shark Parts 84314 sits on 20 unrelated mobs down to Jungle Panther);
advertising those would put a quest line on half the zone's tooltips, which is
not what retail did. 50% keeps designed droppers and drops the scatter.

Overlay tier: scope is whatever creature/gameobject templates the base domains
actually collected, read back via col.pks(owned=True), so this never advertises
an entry we do not emit. Items are range-checked like loot.py — a remapped id
must be stock (< CUSTOM_FLOOR) or inside F-011's own 84300-84799 block AND
actually emitted by items.py, otherwise ObjectMgr drops the row at load with
"has nonexistent item" and the advertisement silently does nothing.
"""

NAME = "questitems"
# creature_template / gameobject_template are declared as read dependencies so a
# partial `zep goblin gen questitems` pulls their owning domains into the
# contributor closure — this domain reads the collector, it has no scope of its own.
TABLES = ["creature_questitem", "gameobject_questitem",
          "creature_template", "gameobject_template"]
TIER = "overlay"

CUSTOM_FLOOR = 56900      # first custom-reservation id; stock WotLK ids are below
F011_LO, F011_HI = 84300, 84799
MAX_QUEST_ITEMS = 6       # SMSG_CREATURE_QUERY_RESPONSE packs exactly six slots
DERIVED_MIN_CHANCE = 50.0

# (collector table, template table, loot table, loot-id column, entry column,
#  loot_types = GO `type` values for which the loot-id column really is a loot id;
#  None for creatures, where `lootid` is unambiguous. On a gameobject `data1` is a
#  per-type union field — only chest (3) and fishing hole (25) store a lootId there,
#  so without this gate a door's data1 would be read as a loot table.)
SPECS = (
    ("creature_questitem", "creature_template", "creature_loot_template",
     "lootid", "CreatureEntry", None),
    ("gameobject_questitem", "gameobject_template", "gameobject_loot_template",
     "data1", "GameObjectEntry", (3, 25)),
)


def _required_items(ctx, remap):
    """Items asked for by any in-scope quest, both zones (post-remap).

    Zone-independent on purpose: a creature collected on the Kezan pass may carry
    a Lost Isles quest's item, and the derived pass must not care which pass it
    runs on. Cached on the collector so the second pass reuses it.
    """
    cached = getattr(ctx.col, "_questitem_required", None)
    if cached is not None:
        return cached
    qids = set()
    for sfx in ("", "_K"):
        try:
            qids |= {int(q) for q in ctx.fixture("item_scope" + sfx)["quests"]}
        except (FileNotFoundError, KeyError):
            pass
    req = set()
    if qids:
        cols = ",".join("RequiredItemId%d" % i for i in range(1, 7))
        rows = ctx.q("SELECT %s FROM quest_template WHERE TRIM(Id) IN (%s)"
                     % (cols, ",".join(str(q) for q in sorted(qids))))
        for r in rows:
            for v in r.values():
                try:
                    v = int(v or 0)
                except (TypeError, ValueError):
                    continue
                if v > 0:
                    req.add(remap.get(v, v))
    ctx.col._questitem_required = req
    return req


def emit(ctx):
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    our_items = set(ctx.col.pks("item_template"))
    req = _required_items(ctx, remap)
    # (table, entry, item) already emitted. The two zone passes share one collector
    # and an entry collected in both passes would otherwise add its rows twice.
    seen = getattr(ctx.col, "_questitem_seen", None)
    if seen is None:
        seen = ctx.col._questitem_seen = set()

    out = []
    for table, tmpl_table, loot_table, loot_col, entry_col, loot_types in SPECS:
        skipped = []

        def usable(item, entry):
            if item < CUSTOM_FLOOR:
                return True                   # stock WotLK item, present in the client
            if F011_LO <= item <= F011_HI and item in our_items:
                return True
            skipped.append((entry, item))
            return False

        ents = sorted(ctx.col.pks(tmpl_table, owned=True))
        if not ents:
            out.append("%s=0 (no %s collected)" % (table, tmpl_table))
            continue
        ent_in = ",".join(str(e) for e in ents)
        qcols = ",".join("questItem%d" % i for i in range(1, MAX_QUEST_ITEMS + 1))
        rows = ctx.q("SELECT entry,type,%s AS lid,%s FROM %s WHERE entry IN (%s)"
                     % (loot_col, qcols, tmpl_table, ent_in))
        tmpl = {}
        for r in rows:
            if loot_types is not None and int(r["type"] or 0) not in loot_types:
                r["lid"] = 0                  # data1 is not a loot id for this GO type
            tmpl[int(r["entry"])] = r
        if not tmpl:
            out.append("%s=0 (nothing in donor)" % table)
            continue

        # donor loot, quest-required and above the scatter threshold, by loot id
        lids = sorted({int(r["lid"] or 0) for r in tmpl.values() if r["lid"]})
        loot = {}
        if lids:
            for r in ctx.q("SELECT entry,item,ChanceOrQuestChance AS ch,mincountOrRef AS m "
                           "FROM %s WHERE entry IN (%s)"
                           % (loot_table, ",".join(str(x) for x in lids))):
                if int(r["m"] or 0) < 0:       # shared reference row, not a real item
                    continue
                ch = float(r["ch"] or 0)
                if ch >= 0 or abs(ch) < DERIVED_MIN_CHANCE:
                    continue                   # not quest-required, or scatter noise
                it = int(r["item"] or 0)
                if it > 0:
                    loot.setdefault(int(r["entry"]), []).append(remap.get(it, it))

        declared = derived = 0
        for e in ents:
            t = tmpl.get(e)
            if t is None:
                continue
            items = []
            for i in range(1, MAX_QUEST_ITEMS + 1):
                v = int(t["questItem%d" % i] or 0)
                if v <= 0:
                    continue
                it = remap.get(v, v)
                if it not in items and usable(it, e):
                    items.append(it)
                    declared += 1
            for it in sorted(set(loot.get(int(t["lid"] or 0), ()))):
                if it in req and it not in items and usable(it, e):
                    items.append(it)
                    derived += 1
            if not items:
                continue
            # Six slots on the wire; anything past that never reaches the client.
            if len(items) > MAX_QUEST_ITEMS:
                print("!!! %s entry %d advertises %d quest items, truncated to %d"
                      % (table, e, len(items), MAX_QUEST_ITEMS))
                items = items[:MAX_QUEST_ITEMS]
            ctx.col.delete(table, "%s = %d" % (entry_col, e))
            for idx, it in enumerate(items):
                key = (table, e, it)
                if key in seen:
                    continue
                seen.add(key)
                ctx.col.add(table, {entry_col: e, "Idx": idx, "ItemId": it,
                                    "VerifiedBuild": 0}, sort_key=(e, idx))
        if skipped:
            print("\n!!! WARNING: %d %s row(s) skipped — item not emitted by F-011 "
                  "and not stock (ObjectMgr would drop them at load):" % (len(skipped), table))
            for e, it in sorted(set(skipped)):
                print("    entry %-7d item %d" % (e, it))
        out.append("%s: declared=%d derived=%d skipped=%d"
                   % (table, declared, derived, len(set(skipped))))
    return "; ".join(out)
