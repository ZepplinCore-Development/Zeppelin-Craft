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
          "creature_template"]
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


def _i(v, d=0):
    try:
        return int(float(str(v).strip()))
    except Exception:
        return d


def _esc(v):
    s = '' if v is None else str(v)
    s = s.strip().replace("\\", "\\\\").replace("'", "''")
    return "'" + s + "'"


def emit(ctx):
    # Combined file, both zones queried together -> emit once on the "" pass.
    if ctx.sfx == "_K":
        return "skipped (combined file emitted on the Lost Isles pass)"

    q = ctx.q
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
    menus = sorted(set(cre_menu.values()))
    mset = ",".join(map(str, menus))

    gm = [(_i(r["e"]), _i(r["t"])) for r in
          q("SELECT CAST(TRIM(entry) AS SIGNED) AS e, CAST(TRIM(text_id) AS SIGNED) AS t "
            "FROM gossip_menu WHERE CAST(TRIM(entry) AS SIGNED) IN (%s)" % mset)]
    textids = sorted(set(t for _e, t in gm if t > 0))
    menu_remap = {m: MENU_BASE + ix for ix, m in enumerate(menus)}
    text_remap = {t: TXT_BASE + ix for ix, t in enumerate(textids)}

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
            return _esc(d.get(col))
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
    for r in opts:
        amid2 = menu_remap.get(_i(r["action_menu_id"]), 0) if _i(r["action_menu_id"]) > 0 else 0
        ctx.col.add("gossip_menu_option", {
            "MenuID": menu_remap[_i(r["menu_id"])], "OptionID": _i(r["id"]),
            "OptionIcon": _i(r["option_icon"]), "OptionText": R(_esc(r["option_text"])),
            "OptionBroadcastTextID": 0, "OptionType": _i(r["option_id"]),
            "OptionNpcFlag": _i(r["npc_option_npcflag"]), "ActionMenuID": amid2,
            "ActionPoiID": _i(r["action_poi_id"]), "BoxCoded": _i(r["box_coded"]),
            "BoxMoney": _i(r["box_money"]), "BoxText": R(_esc(r["box_text"])),
            "BoxBroadcastTextID": 0,
        })
    # repoint each NPC at its remapped menu — overlay onto our creature_template INSERTs
    for e, mm in cre_menu.items():
        ctx.col.put("creature_template", e, {"gossip_menu_id": menu_remap[mm]},
                    tier="overlay")

    # ---- file 2: gossip conditions (type 14 greeting / 15 option) ----
    crows = q("SELECT SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,"
              "ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,"
              "ConditionValue3,NegativeCondition FROM conditions "
              "WHERE SourceTypeOrReferenceId IN (14,15) "
              "AND CAST(TRIM(SourceGroup) AS SIGNED) IN (%s)" % mset)
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
        kept.append((st, menu_remap[sg], new_se, _i(r["SourceId"]), _i(r["ElseGroup"]),
                     _i(r["ConditionTypeOrReference"]), _i(r["ConditionTarget"]),
                     _i(r["ConditionValue1"]), _i(r["ConditionValue2"]),
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

    return ("gossip: %d menus, %d npc_text, %d options, %d NPCs repointed; "
            "conditions=%d (%d dropped); derived=%d menus"
            % (len(menus), len(ntrows), len(opts), len(cre_menu),
               len(kept), dropped, len(_DERIVED)))
