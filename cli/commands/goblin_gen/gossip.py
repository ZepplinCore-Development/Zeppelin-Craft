"""gen domain: gossip.

NPC gossip from Project Neltharion 4.3.4 (Cata) -> AzerothCore 3.3.5a:
gossip_menu + gossip_menu_option + npc_text, plus the gossip greeting/option
conditions (CONDITION_SOURCE_TYPE_GOSSIP_MENU=14 / _OPTION=15) that pick WHICH
greeting shows for the player's quest state.

Never migrated originally -> goblin NPCs opened blank gossip windows. Both zone
sets (Lost Isles 4720 + Kezan 4737) are ported together, so this emits ONE
combined, non-SFX-split set of files on the Lost Isles ("") pass and skips the
Kezan ("_K") pass. Full remap to fresh blocks (npc_text 500000+, gossip_menu
510000+) because 134/145 npc_text IDs and 4 MenuIDs collide with stock.

Three output files:
  * gossip                     — npc_text + gossip_menu + gossip_menu_option,
                                 and creature_template.gossip_menu_id repointed.
  * gossip_conditions          — the type-14/15 conditions carried from source.
  * gossip_conditions_derived  — hand-curated greeting gating for the 3
                                 high-confidence before/after menus that have a
                                 greeting pair but NO source condition (so AC's
                                 last-match-wins showed the post-quest text
                                 unconditionally). NOT from Neltharion source;
                                 the curated menu->quest table lives below, and
                                 each pair's text IDs are read from the live
                                 gossip_menu remap so they track the other files.
Ported from Scripts/Goblin Zone Port/migrate_gossip.py.
"""
NAME = "gossip"
TABLES = ["npc_text", "gossip_menu", "gossip_menu_option", "conditions",
          "creature_template", "gameobject_template"]
TIER = "base"

TXT_BASE = 500000
MENU_BASE = 510000
GOB_ZONES = ("4720", "4737")   # Lost Isles + Kezan

# Hand-curated greeting gating (gossip_conditions_derived). Each menu has a
# before/after greeting pair but no source condition; inferred from the NPC's
# quest relations. before = NOT rewarded (NegativeCondition=1), after = rewarded.
# Text IDs are NOT hardcoded — they are read from the live gossip_menu remap
# (the menu's two texts in order: first = before, second = after). Only the 3
# high-confidence menus are gated (510023 ambiguous / 510087 ambient deferred).
_DERIVED = [
    # (remapped MenuID, gating quest, header note, before-comment, after-comment)
    (510013, 14075, '510013 Foreman Dampwick (mine) — gate by 14075 "Trouble in the Mines"',
     'before: not yet helped', 'after: mine quest done'),
    (510025, 14008, '510025 Fizz Lighter (mage trainer) — gate by 14008 "Arcane Missiles"',
     'before', 'after'),
    (510053, 14013, '510053 Warrior-Matic NX-01 (warrior trainer) — gate by 14013 "Charge"',
     'before: offline', 'after: online'),
]


# Sub-menus the action_menu_id closure must NOT drag in (I-286). These are the
# donor core's own scaffolding, reached from stock/non-goblin NPCs that merely
# happen to spawn inside the zone boxes — porting them would ship visibly wrong
# text in our 510xxx block. Everything else in the closure is real zone content.
MENU_CLOSURE_SKIP = {
    1,      # Neltharion's raid-size picker, French ("On est 16 ...") — from 10716
            # "Let me fly back to Vengeance Wake!" (Vashj'ir) and 11244
    1221,   # stock innkeeper "What can I do at an inn?" — AC answers this natively
    10371,  # Dual Talent Specialization info; AC drives it from OptionType 18
    23620,  # "Back." page of the dual-spec menu above
    12045,  # French profession-vendor lists reached from 12002 (donor scaffolding)
    12046,
}


def _i(v, d=0):
    try:
        return int(float(str(v).strip()))
    except Exception:
        return d


def _esc(v):
    s = '' if v is None else str(v)
    s = s.strip().replace("\\", "\\\\").replace("'", "''")
    return "'" + s + "'"


def _entext():
    """Load the shared enUS repair helper (domains are file-loaded, not a package)."""
    import importlib.util
    import os
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "_entext.py")
    spec = importlib.util.spec_from_file_location("goblin_gen__entext", path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def emit(ctx):
    # Combined file, both zones queried together -> emit once on the "" pass.
    if ctx.sfx == "_K":
        return "skipped (combined file emitted on the Lost Isles pass)"

    q = ctx.q
    # I-302: the Neltharion dump is a partly French fork and is double-encoded
    # throughout. Every string that leaves this domain goes through `en` first.
    et = _entext()
    en = et.EnglishText(ctx)
    zone_in = ",".join("'%s'" % z for z in GOB_ZONES)

    # Goblin NPCs (both zones) and their gossip menus.
    gob = set(_i(r["c"]) for r in
              q("SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS c FROM creature "
                "WHERE TRIM(zone) IN (%s)"
                " AND CAST(TRIM(id) AS SIGNED) < 1000000" % zone_in))  # no dev/leet NPCs (I-233)
    cre_menu = {}
    for r in q("SELECT CAST(TRIM(entry) AS SIGNED) AS e, gossip_menu_id AS gm "
               "FROM creature_template"):
        e, gmid = _i(r["e"]), _i(r["gm"])
        if e in gob and gmid > 0:
            cre_menu[e] = gmid

    # Goober/questgiver GOs reference gossip menus from their data fields
    # (type 2 questgiver -> Data3, type 10 goober -> Data19). Raw Cata menu ids
    # clash with the stock 3.3.5 menu space exactly like creature menus (I-261:
    # vault 195525 Data19=11013 = the stock ICC Scourge Transporter menu).
    # gameobjects.py zeroes the base field; menus ported here are overlaid back
    # as remapped 510xxx ids. Scope mirrors gameobjects.py: spawned GOs
    # (go_scope) plus quest-objective-referenced templates (item_scope quests).
    GO_MENU_SKIP = {
        195525,  # First Bank of Kezan Vault: vestigial retail ref to the ICC transporter menu; click drives the heist (I-261)
        202108,  # Mechashark X-Steam Controller: same vestigial 11013 ref
    }
    go_ents = set()
    for z in ("", "_K"):
        go_ents |= set(ctx.fixture("go_scope" + z)["ents"])
        quests = ctx.fixture("item_scope" + z)["quests"]
        if quests:
            for r in q("SELECT RequiredNpcOrGo1,RequiredNpcOrGo2,RequiredNpcOrGo3,RequiredNpcOrGo4 "
                       "FROM quest_template WHERE TRIM(Id) IN (%s)"
                       % ",".join(str(int(x)) for x in quests)):
                for k in ("RequiredNpcOrGo1", "RequiredNpcOrGo2",
                          "RequiredNpcOrGo3", "RequiredNpcOrGo4"):
                    if r[k] is not None and _i(r[k]) < 0:
                        go_ents.add(-_i(r[k]))
    go_menu = {}   # GO entry -> (data field, source menu id)
    for r in q("SELECT CAST(TRIM(entry) AS SIGNED) AS e, CAST(TRIM(type) AS SIGNED) AS ty, "
               "CAST(TRIM(data3) AS SIGNED) AS d3, CAST(TRIM(data19) AS SIGNED) AS d19 "
               "FROM gameobject_template WHERE CAST(TRIM(type) AS SIGNED) IN (2, 10)"):
        e = _i(r["e"])
        if e not in go_ents or e in GO_MENU_SKIP:
            continue
        fld, m = ("Data3", _i(r["d3"])) if _i(r["ty"]) == 2 else ("Data19", _i(r["d19"]))
        if m > 0:
            go_menu[e] = (fld, m)

    # Creature menus keep their historical 510xxx ids (hand overrides + the
    # _DERIVED table reference them); GO-only menus append AFTER, so adding
    # them never renumbers the existing remap.
    cre_menus = sorted(set(cre_menu.values()))
    go_only = sorted({m for _f, m in go_menu.values()} - set(cre_menus))

    # ---- transitive closure over action_menu_id (I-286) --------------------
    # A gossip option of OptionType 1 (GOSSIP) does exactly one thing in AC: open
    # the menu named by ActionMenuID (Player::OnGossipSelect). Those sub-menus are
    # reached ONLY from an option, never from creature_template.gossip_menu_id, so
    # the scope above never collected them and the remap lookup below quietly
    # resolved them to 0 — i.e. an option that renders normally and does NOTHING
    # when clicked (Foreman Dampwick 10677: both options). Close over the chain so
    # the sub-menus ship and the id resolves. Appended LAST for the same
    # append-only stability the GO menus rely on.
    known = set(cre_menus) | set(go_only)
    closure, frontier = set(), set(known)
    while frontier:
        ids = ",".join(map(str, frontier))
        nxt = {_i(r["a"]) for r in
               q("SELECT DISTINCT CAST(TRIM(action_menu_id) AS SIGNED) AS a "
                 "FROM gossip_menu_option WHERE CAST(TRIM(menu_id) AS SIGNED) IN (%s) "
                 "AND CAST(TRIM(action_menu_id) AS SIGNED) > 0" % ids)}
        frontier = nxt - known - closure - MENU_CLOSURE_SKIP
        closure |= frontier
    closure_only = sorted(closure)

    menus = cre_menus + go_only + closure_only
    mset = ",".join(map(str, menus))

    gm = [(_i(r["e"]), _i(r["t"])) for r in
          q("SELECT CAST(TRIM(entry) AS SIGNED) AS e, CAST(TRIM(text_id) AS SIGNED) AS t "
            "FROM gossip_menu WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)" % mset)]
    # Same append-only stability for npc_text ids: creature-menu texts keep
    # their historical 500xxx ids, GO-only-menu texts append after.
    # Three tiers, appended in the order the tiers were added to the port, so a new
    # tier never renumbers an older one (I-286: a flat cre/go split put the closure
    # sub-menus' lower source ids ahead of the GO texts and shifted 500145/500146).
    cre_menu_set, go_menu_set = set(cre_menus), set(go_only)
    cre_textids = sorted({t for e, t in gm if t > 0 and e in cre_menu_set})
    go_textids = sorted({t for e, t in gm if t > 0 and e in go_menu_set}
                        - set(cre_textids))
    closure_textids = sorted({t for e, t in gm if t > 0}
                             - set(cre_textids) - set(go_textids))
    textids = cre_textids + go_textids + closure_textids
    menu_remap = {m: MENU_BASE + ix for ix, m in enumerate(menus)}
    text_remap = {t: TXT_BASE + ix for ix, t in enumerate(textids)}
    # stash for later domains (smartai remaps SMART_EVENT_GOSSIP_SELECT menu ids);
    # gossip is base-tier and contributes creature_template, so any gen run that
    # includes smartai pulls gossip in first via the contributor closure.
    ctx.col.gossip_menu_remap = dict(menu_remap)

    # ---- file 1: npc_text + gossip_menu + gossip_menu_option + repoint ----
    cur = ctx.nel.cursor(dictionary=True)
    cur.execute("SELECT * FROM npc_text WHERE CAST(TRIM(ID) AS SIGNED) IN (%s)"
                % ",".join(map(str, textids)))
    src_cols = [d[0] for d in cur.description]
    ntrows = [tuple(row[c] for c in src_cols) for row in cur.fetchall()]
    cur.close()

    ac_txt_cols = ["ID"]
    for n in range(8):
        ac_txt_cols += [f"text{n}_0", f"text{n}_1", f"BroadcastTextID{n}",
                        f"lang{n}", f"Probability{n}"] + [f"em{n}_{k}" for k in range(6)]
    ac_txt_cols.append("VerifiedBuild")

    def npc_val(row, col):
        d = dict(zip(src_cols, row))
        if col == "ID":
            return str(text_remap[_i(d['ID'])])
        if col == "VerifiedBuild":
            return "0"
        if col.startswith("BroadcastTextID"):
            return "0"
        if col.startswith("Probability"):
            return str(_i(d.get("prob" + col[len('Probability'):]), 100))
        if col.startswith("text"):
            # I-302: keyed on the SOURCE id, which tdb434 shares with the dump.
            return _esc(en.npc_text_field(_i(d['ID']), col, d.get(col)))
        return str(_i(d.get(col)))

    R = ctx.col.Raw
    # fixed 10,000-id block DELETEs (count-independent; blocks are F-011-owned)
    ctx.col.delete("npc_text", "ID BETWEEN %d AND %d" % (TXT_BASE, TXT_BASE + 9999))
    for r in ntrows:
        ctx.col.add("npc_text", {col: R(npc_val(r, col)) for col in ac_txt_cols})

    ctx.col.delete("gossip_menu", "MenuID BETWEEN %d AND %d" % (MENU_BASE, MENU_BASE + 9999))
    for m, t in gm:
        ctx.col.add("gossip_menu", {"MenuID": menu_remap[m], "TextID": text_remap.get(t, 0)})

    opts = q("SELECT menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,"
             "action_menu_id,action_poi_id,box_coded,box_money,box_text FROM gossip_menu_option "
             "WHERE CAST(TRIM(menu_id) AS SIGNED) IN (%s)" % mset)
    ctx.col.delete("gossip_menu_option", "MenuID BETWEEN %d AND %d" % (MENU_BASE, MENU_BASE + 9999))
    dead_clicks = []
    for r in opts:
        amid = _i(r["action_menu_id"])
        amid2 = menu_remap.get(amid, 0) if amid > 0 else 0
        if amid > 0 and not amid2:
            # An OptionType-1 option with an unresolved ActionMenuID renders fine and
            # does nothing when clicked. That must never be a silent 0 again (I-286).
            dead_clicks.append((menu_remap[_i(r["menu_id"])], _i(r["id"]), amid,
                                (r["option_text"] or "").strip()[:40]))
        src_menu, oidx = _i(r["menu_id"]), _i(r["id"])
        ctx.col.add("gossip_menu_option", {
            "MenuID": menu_remap[src_menu], "OptionID": oidx,
            "OptionIcon": _i(r["option_icon"]),
            # I-302: keyed on the SOURCE menu id, which tdb434 shares with the dump.
            "OptionText": R(_esc(en.gossip_option(src_menu, oidx, r["option_text"]))),
            "OptionBroadcastTextID": 0, "OptionType": _i(r["option_id"]),
            "OptionNpcFlag": _i(r["npc_option_npcflag"]), "ActionMenuID": amid2,
            "ActionPoiID": _i(r["action_poi_id"]), "BoxCoded": _i(r["box_coded"]),
            "BoxMoney": _i(r["box_money"]),
            # No BoxText in the port is localised; demojibake only (I-302).
            "BoxText": R(_esc(et.demojibake(r["box_text"]))),
            "BoxBroadcastTextID": 0,
        })
    # repoint each NPC at its remapped menu — overlay onto our creature_template INSERTs
    for e, mm in cre_menu.items():
        ctx.col.put("creature_template", e, {"gossip_menu_id": menu_remap[mm]},
                    tier="overlay")
    # repoint gossip-bearing GOs at their remapped menus (only menus that exist
    # in the source gossip_menu; anything else stays at the zeroed base value)
    go_existing = {e for e, _t in gm}
    go_repointed = 0
    for e, (fld, m) in sorted(go_menu.items()):
        if m in go_existing:
            ctx.col.put("gameobject_template", e, {fld: menu_remap[m]}, tier="overlay")
            go_repointed += 1

    # ---- file 2: gossip conditions (type 14 greeting / 15 option) ----
    crows = q("SELECT SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,"
              "ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,"
              "ConditionValue3,NegativeCondition FROM conditions "
              "WHERE SourceTypeOrReferenceId IN (14,15) "
              "AND CAST(TRIM(SourceGroup) AS SIGNED) IN (%s)" % mset)
    iremap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    kept, dropped = [], 0
    for r in crows:
        st, sg, se = _i(r["SourceTypeOrReferenceId"]), _i(r["SourceGroup"]), _i(r["SourceEntry"])
        if sg not in menu_remap:
            dropped += 1
            continue
        if st == 14 and se not in text_remap:   # greeting text itself dropped -> can't map
            dropped += 1
            continue
        new_se = text_remap[se] if st == 14 else se
        ct, cv1 = _i(r["ConditionTypeOrReference"]), _i(r["ConditionValue1"])
        if ct in (2, 3):   # CONDITION_ITEM / _ITEM_EQUIPPED: Value1 is a Cata item id (I-245)
            cv1 = iremap.get(cv1, cv1)
        kept.append((st, menu_remap[sg], new_se, _i(r["SourceId"]), _i(r["ElseGroup"]),
                     ct, _i(r["ConditionTarget"]),
                     cv1, _i(r["ConditionValue2"]),
                     _i(r["ConditionValue3"]), _i(r["NegativeCondition"])))
    # stable order: (remapped SourceGroup, SourceType, final SourceEntry, ElseGroup)
    kept.sort(key=lambda x: (x[1], x[0], x[2], x[4]))
    cmenus = sorted({menu_remap[_i(r["SourceGroup"])] for r in crows
                     if _i(r["SourceGroup"]) in menu_remap})
    n14 = sum(1 for k in kept if k[0] == 14)
    ctx.col.delete("conditions",
                   "SourceTypeOrReferenceId IN (14,15) AND SourceGroup IN (%s)"
                   % ", ".join(map(str, cmenus)))
    for (st, sg, se, sid, eg, ct, ctg, cv1, cv2, cv3, neg) in kept:
        ctx.col.add("conditions", {
            "SourceTypeOrReferenceId": st, "SourceGroup": sg, "SourceEntry": se,
            "SourceId": sid, "ElseGroup": eg, "ConditionTypeOrReference": ct,
            "ConditionTarget": ctg, "ConditionValue1": cv1, "ConditionValue2": cv2,
            "ConditionValue3": cv3, "NegativeCondition": neg,
            "ErrorType": 0, "ErrorTextId": 0, "ScriptName": "", "Comment": "",
        })

    # ---- DERIVED greeting gating (hand-curated, not from source): menus with a
    # before/after greeting pair but no source condition -> AC last-match-wins
    # showed the "after" text unconditionally. before = NOT rewarded, after = rewarded.
    inv_menu = {v: k for k, v in menu_remap.items()}
    dmenus = [d[0] for d in _DERIVED]
    ctx.col.delete("conditions",
                   "SourceTypeOrReferenceId=14 AND SourceGroup IN (%s)"
                   % ",".join(map(str, dmenus)))
    for menu, quest, _note, cb, ca in _DERIVED:
        orig = inv_menu[menu]
        texts = [text_remap[t] for e, t in gm if e == orig and t > 0]
        before, after = texts[0], texts[1]
        for se, neg, cm in ((before, 1, cb), (after, 0, ca)):
            ctx.col.add("conditions", {
                "SourceTypeOrReferenceId": 14, "SourceGroup": menu, "SourceEntry": se,
                "SourceId": 0, "ElseGroup": 0, "ConditionTypeOrReference": 8,
                "ConditionTarget": 0, "ConditionValue1": quest, "ConditionValue2": 0,
                "ConditionValue3": 0, "NegativeCondition": neg,
                "ErrorType": 0, "ErrorTextId": 0, "ScriptName": "", "Comment": cm,
            })

    out = ("gossip: %d menus (+%d chained sub-menus), %d npc_text, %d options, "
           "%d NPCs + %d GOs repointed; conditions=%d (%d dropped); derived=%d menus"
           "\n  %s"
           % (len(menus), len(closure_only), len(ntrows), len(opts), len(cre_menu),
              go_repointed, len(kept), dropped, len(_DERIVED), en.summary()))
    if dead_clicks:
        out += "\n  %d option(s) keep ActionMenuID=0 -> DEAD CLICK:" % len(dead_clicks)
        for mm, oid, src, txt in dead_clicks:
            why = "MENU_CLOSURE_SKIP" if src in MENU_CLOSURE_SKIP else "no source gossip_menu row"
            out += "\n    menu %d option %d -> source menu %d (%s): \"%s\"" % (
                mm, oid, src, why, txt)
    return out
