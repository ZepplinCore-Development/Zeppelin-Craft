"""F-094 prototype: find spawn groups with no quest for a faction.

For every killable creature entry with >= MIN spawns in one zone, check whether any
quest available to Alliance / Horde uses it:
  - kill target (RequiredNpcOrGo, directly or via the entry's KillCredit1/2)
  - drops a targeted quest item that a quest requires or that starts a quest (see 5)
  - SAI kill credit (action 33) fired from the entry
Spawn zone is computed from the extracted .map area grid (creature.zoneId is mostly 0)
and walked up AreaTable to the top-level zone.

Filters:
  1. spawns tied to a game event (game_event_creature) are ignored
  2. a side only gets candidates in its own or contested zones (AreaTable.faction_group,
     corrected by ZONE_SIDE_OVERRIDE) where it has a quest hub: >= --min-hub spawned
     quest givers (phase 1, non-event, not critters) it can take quests from
  3. mobs friendly to either side (guards, soldiers) or to all players / neutral-rep
     factions (Cenarion Circle, Argent Dawn, Scryers...) are dropped
  4. only phase-1 spawns (phaseMask & 1) count
  5. only TARGETED quests count: kill credit, or a quest-class (12) item on the mob's own
     loot table (or creature_questitem) dropping from <= --max-spread tables. Family
     trade-good drops, commodities, references and broad turn-ins don't count.
  6. scope: creature minlevel <= --max-level (default 60)

Run from Zeppelin-Craft:  python3 "Scripts/F-094/quest_gap_scan.py" [--min 10] [--maps 0,1,530] [--max-level 60] [--max-spread 15] [--min-hub 3]
Writes Scripts/F-094/quest_gap_candidates.csv
"""
import argparse
import csv
import sys
from collections import defaultdict
from pathlib import Path

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT))
from cli.lib.display_reach import _q  # noqa: E402
from cli.lib.terrain_reader import MapHeightReader  # noqa: E402

ALLIANCE_MASK, HORDE_MASK = 3149, 946  # F-094 note: masks incl. goblin/worgen
SIDE_GROUP = {'A': 2, 'H': 4}  # FactionTemplate / AreaTable player groups
OTHER = {'A': 'H', 'H': 'A'}
# AreaTable.faction_group is wrong for some custom / reused zones (0 = contested)
ZONE_SIDE_OVERRIDE = {
    4720: 4,  # The Lost Isles - goblin start, Horde
    4922: 0,  # Twilight Highlands
    5034: 0,  # Uldum
    5095: 0,  # Tol Barad
    5389: 0,  # Tol Barad Peninsula
    5146: 0,  # Vashj'ir
    5695: 0,  # Ahn'Qiraj: The Fallen Kingdom
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--min', type=int, default=10)
    ap.add_argument('--maps', default='0,1,530')
    ap.add_argument('--max-level', type=int, default=60)
    ap.add_argument('--min-hub', type=int, default=3, help='a side needs >= N quest givers it can use in a zone')
    ap.add_argument('--max-spread', type=int, default=15, help='a quest item dropping from more than N loot tables is a broad turn-in, not a targeted quest')
    ap.add_argument('--out', default=str(Path(__file__).parent / 'quest_gap_candidates.csv'))
    a = ap.parse_args()

    # --- creature templates: killable, not critter, no npcflag, not trigger, in level scope ---
    tmpl = {}
    for r in _q("SELECT entry, name, minlevel, maxlevel, faction, KillCredit1, KillCredit2, lootid, `rank`, type "
                "FROM creature_template WHERE type <> 8 AND npcflag = 0 AND (unit_flags & 0x02000002) = 0 "
                f"AND (flags_extra & 0x80) = 0 AND minlevel <= {a.max_level}"):  # 0x80 = TRIGGER
        e = int(r[0])
        tmpl[e] = dict(name=r[1], lvl=f"{r[2]}-{r[3]}", faction=int(r[4]), kc={int(r[5]), int(r[6])} - {0},
                       lootid=int(r[7]), rank=int(r[8]))

    # --- faction template ---
    ft = {int(r[0]): tuple(int(x) for x in r[1:5]) for r in _q(
        "SELECT t.id, t.faction_group, t.friend_group, t.enemy_group, COALESCE(f.reputation_index, -1) "
        "FROM factiontemplate t LEFT JOIN faction f ON f.id = t.faction", dbc=True)}

    def friendly(fac, side):
        g, fr, _, _ = ft.get(fac, (0, 0, 0, -1))
        return bool((g | fr) & SIDE_GROUP[side])

    def town_npc(fac):
        """Friendly to every player (group bit 1: Cenarion Circle, Argent Dawn, Everlook...) or a
        reputation faction with no enemies and not a monster (The Scryers)."""
        g, fr, en, rep = ft.get(fac, (0, 0, 0, -1))
        return bool((g | fr) & 1) or (rep >= 0 and en == 0 and not g & 8)

    # --- quests per side: race mask AND who can actually take it from its giver ---
    def giver_sides(fac):
        """Sides that can talk to a giver of this faction. Faction-0 gameobjects and neutral
        non-monster givers (Booty Bay, Cenarion Circle...) serve both."""
        if fac == 0:
            return {'A', 'H'}
        s = {side for side in ('A', 'H') if friendly(fac, side)}
        if not s and not ft.get(fac, (0, 0, 0, -1))[0] & 8:
            s = {'A', 'H'}
        return s

    all_fac = {int(r[0]): int(r[1]) for r in _q("SELECT entry, faction FROM creature_template")}
    go_fac = {int(r[0]): int(r[1]) for r in _q("SELECT entry, faction FROM gameobject_template_addon")}
    starter_sides = defaultdict(set)  # quest -> sides of all its givers
    item_started = set()
    giver_quests = defaultdict(set)  # quest-giver creature entry -> quests it starts (hub count)
    critters = {int(r[0]) for r in _q("SELECT entry FROM creature_template WHERE type = 8")}
    for r in _q("SELECT id, quest FROM creature_queststarter"):
        starter_sides[int(r[1])] |= giver_sides(all_fac.get(int(r[0]), 0))
        if int(r[0]) not in critters:  # CLUCK! chickens wander everywhere; not a hub
            giver_quests[int(r[0])].add(int(r[1]))
    for r in _q("SELECT id, quest FROM gameobject_queststarter"):
        starter_sides[int(r[1])] |= giver_sides(go_fac.get(int(r[0]), 0))
    for r in _q("SELECT startquest FROM item_template WHERE startquest > 0"):
        item_started.add(int(r[0]))  # item pickup: anyone the race mask allows

    q_side = {}
    for r in _q("SELECT ID, AllowableRaces FROM quest_template"):
        qid, m = int(r[0]), int(r[1])
        sides = {s for s, mask in (('A', ALLIANCE_MASK), ('H', HORDE_MASK)) if m == 0 or m & mask}
        if qid in starter_sides and qid not in item_started:
            sides &= starter_sides[qid]
        q_side[qid] = sides

    by_npc = defaultdict(set)   # creature entry -> quest ids
    by_item = defaultdict(set)  # item -> quest ids
    for r in _q("SELECT ID, RequiredNpcOrGo1, RequiredNpcOrGo2, RequiredNpcOrGo3, RequiredNpcOrGo4, "
                "RequiredItemId1, RequiredItemId2, RequiredItemId3, RequiredItemId4, RequiredItemId5, RequiredItemId6, "
                "ItemDrop1, ItemDrop2, ItemDrop3, ItemDrop4 FROM quest_template"):
        qid = int(r[0])
        for v in r[1:5]:
            if int(v) > 0:
                by_npc[int(v)].add(qid)
        for v in r[5:]:
            if int(v) > 0:
                by_item[int(v)].add(qid)
    for r in _q("SELECT entry, startquest FROM item_template WHERE startquest > 0"):
        by_item[int(r[0])].add(int(r[1]))

    # --- targeted drops (filter 5) ---
    c_items = defaultdict(set)  # lootid -> items listed directly (references ignored)
    for r in _q("SELECT Entry, Item FROM creature_loot_template WHERE Reference = 0"):
        c_items[int(r[0])].add(int(r[1]))

    quest_class = {int(r[0]) for r in _q("SELECT entry FROM item_template WHERE class = 12")}
    spread = defaultdict(int)  # item -> number of creature loot tables listing it directly
    for items in c_items.values():
        for it in items:
            spread[it] += 1

    def loot_items(lootid):
        """Targeted drops only: quest-class (12) items on the mob's OWN loot table that drop
        from <= --max-spread tables. Trade-good family drops (murloc fins, meat), commodities
        (cloth, herbs) and everything behind a reference are not a quest aimed at this mob;
        nor are wide collection/rep turn-ins (Scourgestones, Green Hills pages, AV medals)."""
        return {it for it in c_items.get(lootid, ()) if it in quest_class and spread[it] <= a.max_spread}

    qitem = defaultdict(set)
    for r in _q("SELECT CreatureEntry, ItemId FROM creature_questitem"):
        if int(r[1]) in quest_class and spread[int(r[1])] <= a.max_spread:
            qitem[int(r[0])].add(int(r[1]))
    sai_credit = defaultdict(set)
    for r in _q("SELECT entryorguid, action_param1 FROM smart_scripts WHERE source_type = 0 AND action_type = 33 AND entryorguid > 0"):
        sai_credit[int(r[0])].add(int(r[1]))

    def quests_for(e):
        t = tmpl[e]
        qs = set()
        for n in {e} | t['kc'] | sai_credit.get(e, set()):
            qs |= by_npc.get(n, set())
        for it in loot_items(t['lootid']) | qitem.get(e, set()):
            qs |= by_item.get(it, set())
        return qs

    # --- areas -> top zone + zone side (filter 2) ---
    area = {int(r[0]): (int(r[1]), r[2], int(r[3]))
            for r in _q("SELECT id, zone_id, name_enus, faction_group FROM areatable", dbc=True)}

    def top_zone(aid):
        seen = set()
        while aid in area and area[aid][0] and aid not in seen:
            seen.add(aid)
            aid = area[aid][0]
        return aid

    hub = defaultdict(set)  # (zone, side) -> distinct quest-giver entries that side can use there

    def zone_open_to(z, side):
        """Zone faction allows the side AND the side has a quest hub there (>= --min-hub givers
        it can take quests from). Contested-by-DBC zones with no hub for a side (Horde in
        Duskwood / Wetlands / Redridge) are closed to it."""
        g = ZONE_SIDE_OVERRIDE.get(z, area.get(z, (0, '', 0))[2])
        if not (g == 0 or bool(g & SIDE_GROUP[side]) or (g & 6) == 6):
            return False
        return len(hub[(z, side)]) >= a.min_hub

    # --- spawns: phase 1 (filter 4), no event spawns (filter 1) ---
    reader = MapHeightReader(CRAFT.parent / 'data' / 'maps', cache_size=256)
    spawns = _q(f"SELECT c.id, c.map, c.position_x, c.position_y FROM creature c "
                f"LEFT JOIN game_event_creature g ON g.guid = c.guid "
                f"WHERE c.map IN ({a.maps}) AND (c.phaseMask & 1) AND g.guid IS NULL")
    groups = defaultdict(int)
    for r in sorted(spawns, key=lambda r: (r[1], reader.world_to_grid(float(r[2]), float(r[3]))[:2])):
        e = int(r[0])
        if e not in tmpl and e not in giver_quests:
            continue
        z = top_zone(reader.get_area(int(r[1]), float(r[2]), float(r[3])))
        if e in tmpl:
            groups[(e, z)] += 1
        for side in ('A', 'H'):
            if side in giver_sides(all_fac.get(e, 0)) and any(side in q_side.get(q, ()) for q in giver_quests.get(e, ())):
                hub[(z, side)].add(e)

    rows = []
    for (e, z), n in groups.items():
        if n < a.min or z == 0:
            continue
        t = tmpl[e]
        qs = quests_for(e)
        for side in ('A', 'H'):
            # can't fight own side's NPCs; other side's guards/soldiers are PvP, not quest mobs (filter 3)
            if friendly(t['faction'], side) or friendly(t['faction'], OTHER[side]) or town_npc(t['faction']):
                continue
            if not zone_open_to(z, side):
                continue
            if any(side in q_side.get(q, ()) for q in qs):
                continue
            rows.append(dict(side=side, zone_id=z, zone=area.get(z, (0, '?'))[1], entry=e, name=t['name'],
                             level=t['lvl'], rank=t['rank'], spawns=n,
                             other_side_quests=' '.join(str(q) for q in sorted(qs) if OTHER[side] in q_side.get(q, ()))))
    rows.sort(key=lambda r: (r['zone'], r['side'], -r['spawns']))
    with open(a.out, 'w', newline='') as f:
        w = csv.DictWriter(f, fieldnames=list(rows[0].keys()) if rows else ['side'])
        w.writeheader()
        w.writerows(rows)
    print(f"{len(rows)} candidate (side, zone, mob) groups -> {a.out}")


if __name__ == '__main__':
    main()
