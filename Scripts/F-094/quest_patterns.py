"""F-094: classify stock quests into types and chains, as a pattern library for new quests.

Per quest, a primary TYPE from its objectives (first match wins):
  explore   areatrigger_involvedrelation
  event     SpecialFlags & 2 without an areatrigger (escorts, scripted events, spell credit)
  slay      kill objective on a single target: count 1, or an elite / rare / boss creature
  kill      kill objective (RequiredNpcOrGo > 0)
  use       interact with a gameobject (RequiredNpcOrGo < 0)
  trophy    one item from a named target: elite/rare or a unique spawn ('bring me the head of ...')
  drop      required item dropped by creatures
  gather    required item looted from gameobjects (chests, plants, crates)
  deliver   hand in an item the quest (or an earlier quest) gave you, or no objectives with
            StartItem / ProvidedItemCount
  use_item  quest provides an item; you use it and bring back a different item (Soul Gem ->
            Filled Soul Gem)
  skin / pickpocket / fish / container   required item from that loot source
  buy       required item sold by a vendor
  create    required item made by a spell (craft, combine, use-an-item)
  bring     required item with no known source
  talk      no objectives: go and speak to someone (breadcrumb or story step)
plus MODIFIERS: multi (several objective kinds), group, dungeon, raid, pvp, timed, repeatable,
item_start (begins from a looted item), choice (reward choice), breadcrumb.

Chains: quests linked by quest_template_addon.PrevQuestID (abs; negative = one of a group),
quest_template.RewardNextQuest, and addon NextQuestID (X.NextQuestID = Y -> X before Y).
A chain is a connected component; its SHAPE is the type sequence along the longest path.

Scope: stock quests (ID < 26100, UNUSED/[PH]/DEPRECATED titles dropped) in zones of maps 0/1/530 (QuestSortID > 0), QuestLevel 1-60.

Run from Zeppelin-Craft:  python3 "Scripts/F-094/quest_patterns.py"
Writes Scripts/F-094/quest_types.csv and Scripts/F-094/quest_chains.csv, prints a summary.
"""
import csv
import sys
from collections import Counter, defaultdict
from pathlib import Path

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT))
from cli.lib.display_reach import _q  # noqa: E402

OUT = Path(__file__).parent
ALLIANCE_MASK, HORDE_MASK = 3149, 946


def ints(rows):
    return [[int(x) if x.lstrip('-').isdigit() else x for x in r] for r in rows]


def main():
    zones = {int(r[0]): r[1] for r in _q(
        "SELECT id, name_enus FROM areatable WHERE zone_id = 0 AND map_id IN (0, 1, 530)", dbc=True)}

    cols = ("ID, QuestLevel, MinLevel, QuestSortID, QuestInfoID, SuggestedGroupNum, RewardNextQuest, StartItem, "
            "TimeAllowed, AllowableRaces, RewardChoiceItemID1, "
            "RequiredNpcOrGo1, RequiredNpcOrGo2, RequiredNpcOrGo3, RequiredNpcOrGo4, "
            "RequiredNpcOrGoCount1, RequiredNpcOrGoCount2, RequiredNpcOrGoCount3, RequiredNpcOrGoCount4, "
            "RequiredItemId1, RequiredItemId2, RequiredItemId3, RequiredItemId4, RequiredItemId5, RequiredItemId6, "
            "RequiredItemCount1, RequiredItemCount2, RequiredItemCount3, RequiredItemCount4, RequiredItemCount5, RequiredItemCount6")
    qt = {}
    for r in ints(_q(f"SELECT {cols} FROM quest_template WHERE ID < 26100 AND QuestSortID > 0 "
                     "AND QuestLevel BETWEEN 1 AND 60")):
        if r[3] in zones:
            qt[r[0]] = r
    junk = ('UNUSED', '[PH]', 'DEPRECATED', 'NYI', 'Test ', '[DNT]', 'OLD ')
    title = {int(r[0]): r[1] for r in _q("SELECT ID, LogTitle FROM quest_template WHERE ID < 26100")}
    for qid in [q for q in qt if any(j.lower() in title.get(q, '').lower() for j in junk)]:
        del qt[qid]
    addon = {r[0]: r[1:] for r in ints(_q(
        "SELECT ID, PrevQuestID, NextQuestID, ExclusiveGroup, BreadcrumbForQuestId, SpecialFlags, ProvidedItemCount "
        "FROM quest_template_addon"))}

    explore = {int(r[0]) for r in _q("SELECT quest FROM areatrigger_involvedrelation")}
    item_start = {int(r[0]) for r in _q("SELECT startquest FROM item_template WHERE startquest > 0")}
    crank = {int(r[0]): int(r[1]) for r in _q("SELECT entry, `rank` FROM creature_template")}
    item_droppers = defaultdict(set)  # item -> loot ids (= creature entries in practice)
    for r in _q("SELECT Entry, Item FROM creature_loot_template WHERE Reference = 0"):
        item_droppers[int(r[1])].add(int(r[0]))
    c_loot_items = set(item_droppers)
    spawns = defaultdict(int)
    for r in _q("SELECT id, COUNT(*) FROM creature GROUP BY id"):
        spawns[int(r[0])] = int(r[1])

    def is_named(x):  # elite/rare/boss, or a unique spawn
        return crank.get(x, 0) > 0 or 0 < spawns[x] <= 2
    go_loot_items = {int(r[0]) for r in _q("SELECT DISTINCT Item FROM gameobject_loot_template WHERE Reference = 0")}
    src = {}  # item -> other sources, checked in this order after creature/GO loot
    for k, sql in (('skin', "SELECT DISTINCT Item FROM skinning_loot_template WHERE Reference = 0"),
                   ('pickpocket', "SELECT DISTINCT Item FROM pickpocketing_loot_template WHERE Reference = 0"),
                   ('fish', "SELECT DISTINCT Item FROM fishing_loot_template WHERE Reference = 0"),
                   ('container', "SELECT DISTINCT Item FROM item_loot_template WHERE Reference = 0"),
                   ('buy', "SELECT DISTINCT item FROM npc_vendor")):
        for r in _q(sql):
            src.setdefault(int(r[0]), k)
    created = set()
    for r in _q("SELECT effect_item_type_1, effect_item_type_2, effect_item_type_3, effect_1, effect_2, effect_3 FROM spell "
                "WHERE 24 IN (effect_1, effect_2, effect_3)", dbc=True):
        for i in range(3):
            if r[3 + i] == '24' and int(r[i]) > 0:
                created.add(int(r[i]))
    reward_items = set()
    for r in _q("SELECT RewardItem1, RewardItem2, RewardItem3, RewardItem4, StartItem FROM quest_template"):
        reward_items |= {int(x) for x in r if int(x) > 0}
    cname = {int(r[0]): r[1] for r in _q("SELECT entry, name FROM creature_template")}
    starter = defaultdict(list)
    for r in _q("SELECT id, quest FROM creature_queststarter"):
        starter[int(r[1])].append(cname.get(int(r[0]), r[0]))
    ender = defaultdict(list)
    for r in _q("SELECT id, quest FROM creature_questender"):
        ender[int(r[1])].append(cname.get(int(r[0]), r[0]))

    def classify(qid):
        r = qt[qid]
        a = addon.get(qid, (0, 0, 0, 0, 0, 0))
        npc, cnt, items = r[11:15], r[15:19], [i for i in r[19:25] if i > 0]
        kills = [(n, c) for n, c in zip(npc, cnt) if n > 0]
        gos = [n for n in npc if n < 0]
        kinds = []
        if qid in explore:
            kinds.append('explore')
        elif a[4] & 2:
            kinds.append('event')
        if kills:
            named = all(c == 1 or crank.get(n, 0) in (1, 2, 3, 4) and c <= 3 for n, c in kills)
            kinds.append('slay' if named else 'kill')
        if gos:
            kinds.append('use')
        for it in items:
            cnt_i = r[25 + r[19:25].index(it)]
            if it in c_loot_items:
                d = item_droppers[it]
                k = 'trophy' if cnt_i == 1 and len(d) <= 3 and all(is_named(x) for x in d) else 'drop'
            elif it in go_loot_items:
                k = 'gather'
            elif r[7] > 0 and it != r[7]:
                k = 'use_item'  # use the provided StartItem on something, bring back the result
            elif it == r[7] or it in reward_items:
                k = 'deliver'  # handed out by this or an earlier quest
            elif it in src:
                k = src[it]
            elif it in created:
                k = 'create'
            else:
                k = 'bring'
            if k not in kinds:
                kinds.append(k)
        if not kinds:
            kinds.append('deliver' if r[7] > 0 or a[5] > 0 else 'talk')
        mods = []
        if len(kinds) > 1:
            mods.append('multi')
        info = r[4]
        if info == 81:
            mods.append('dungeon')
        elif info == 62:
            mods.append('raid')
        elif info == 41:
            mods.append('pvp')
        elif info == 1 or r[5] > 1:
            mods.append('group')
        if r[8] > 0:
            mods.append('timed')
        if a[4] & 1:
            mods.append('repeatable')
        if qid in item_start:
            mods.append('item_start')
        if r[10] > 0:
            mods.append('choice')
        if a[3] > 0:
            mods.append('breadcrumb')
        return kinds, mods

    def side(qid):
        m = qt[qid][9]
        if m == 0:
            return 'both'
        a, h = bool(m & ALLIANCE_MASK), bool(m & HORDE_MASK)
        return 'both' if a and h else 'A' if a else 'H' if h else '?'

    info = {}
    for qid in qt:
        kinds, mods = classify(qid)
        info[qid] = dict(id=qid, title=title.get(qid, ''), zone=zones[qt[qid][3]], level=qt[qid][1], side=side(qid),
                         type=kinds[0], kinds='+'.join(kinds), mods=' '.join(mods),
                         giver='; '.join(map(str, starter.get(qid, []))), ender='; '.join(map(str, ender.get(qid, []))))

    # --- chains ---
    nxt = defaultdict(set)
    for qid in qt:
        a = addon.get(qid, (0, 0, 0, 0, 0, 0))
        prev = abs(a[0])
        if prev in qt:
            nxt[prev].add(qid)
        if a[1] and abs(a[1]) in qt:
            nxt[qid].add(abs(a[1]))
        if qt[qid][6] in qt:
            nxt[qid].add(qt[qid][6])
    und = defaultdict(set)
    for x, ys in nxt.items():
        for y in ys:
            und[x].add(y)
            und[y].add(x)
    seen, chains = set(), []
    for qid in qt:
        if qid in seen or qid not in und:
            continue
        comp, stack = set(), [qid]
        while stack:
            x = stack.pop()
            if x in comp:
                continue
            comp.add(x)
            stack.extend(und[x] - comp)
        seen |= comp
        memo = {}

        def longest(x, path=()):
            if x in path:
                return []
            if x in memo:
                return memo[x]
            best = []
            for y in nxt.get(x, ()):
                if y in comp:
                    p = longest(y, path + (x,))
                    if len(p) > len(best):
                        best = p
            memo[x] = [x] + best
            return memo[x]

        heads = [x for x in comp if not any(x in nxt[y] for y in comp)] or [min(comp)]
        path = max((longest(h) for h in heads), key=len)
        chains.append(dict(
            length=len(path), quests=len(comp), zone=info[path[0]]['zone'],
            levels=f"{min(info[x]['level'] for x in comp)}-{max(info[x]['level'] for x in comp)}",
            side=info[path[0]]['side'], shape=' > '.join(info[x]['type'] for x in path),
            branches=len(comp) - len(path),
            path=' > '.join(f"{x} {info[x]['title']}" for x in path)))
    for qid in info:
        info[qid]['chain'] = 'yes' if qid in seen else ''

    with open(OUT / 'quest_types.csv', 'w', newline='') as f:
        w = csv.DictWriter(f, fieldnames=list(next(iter(info.values())).keys()))
        w.writeheader()
        w.writerows(sorted(info.values(), key=lambda r: (r['zone'], r['level'], r['id'])))
    chains.sort(key=lambda c: (c['zone'], c['levels']))
    with open(OUT / 'quest_chains.csv', 'w', newline='') as f:
        w = csv.DictWriter(f, fieldnames=list(chains[0].keys()))
        w.writeheader()
        w.writerows(chains)

    # --- summary ---
    n = len(info)
    print(f"{n} quests, {len(chains)} chains ({sum(1 for q in info.values() if q['chain'])} quests in chains, "
          f"{n - sum(1 for q in info.values() if q['chain'])} standalone)")
    print("\nprimary type:")
    for t, c in Counter(q['type'] for q in info.values()).most_common():
        print(f"  {t:8s} {c:5d}  {100 * c / n:4.1f}%")
    print("\nmodifiers:")
    print(' ', Counter(m for q in info.values() for m in q['mods'].split()).most_common())
    print("\nchain length:", sorted(Counter(c['length'] for c in chains).items()))
    print("\ntop chain shapes (length >= 2):")
    for s, c in Counter(c['shape'] for c in chains if c['length'] >= 2).most_common(25):
        ex = next(ch for ch in chains if ch['shape'] == s)
        print(f"  {c:4d}  {s}    e.g. {ex['zone']}: {ex['path'][:110]}")


if __name__ == '__main__':
    main()
