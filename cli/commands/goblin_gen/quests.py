"""gen domain: quests.

Cata (neltharion) quest_template -> AC 3.3.5a quest_template / quest_template_addon
/ quest_offer_reward / quest_request_items / creature_queststarter / creature_questender.

Emits (per zone, ctx.sfx):
    quests_01_template   quest_template (item refs remapped, reward factions zeroed)
    quests_02_addon      quest_template_addon (chains, prereqs, provided items)
    quests_03_text       quest_offer_reward + quest_request_items turn-in text
    quests_04_relations  creature_queststarter / creature_questender

It does NOT emit _05_conditions (that file is standalone hand-authored). Item refs are
remapped via the item_remap fixture; scope comes from item_scope / item_scope_K. A
conflict guard warns (does not abort) when a quest item-ref lands outside stock item
space or F-011's own 84300-84799 reserved block.
"""
import os
import csv as _csv

NAME = "quests"

RESV_CSV = "/workspace/project/Zeppelin-Craft/Scripts/Item Scripts/Item Reservations.csv"
F011_LO, F011_HI = 84300, 84799
CUSTOM_FLOOR = 56900  # first custom-reservation id; stock WotLK item ids are below this

ITEM_COLS = (["StartItem"] + ["RewardItem%d" % n for n in range(1, 5)]
             + ["ItemDrop%d" % n for n in range(1, 5)]
             + ["RewardChoiceItemID%d" % n for n in range(1, 7)]
             + ["RequiredItemId%d" % n for n in range(1, 7)])


def _load_reservations():
    rows = []
    try:
        with open(RESV_CSV, encoding="utf-8-sig") as fh:
            for r in _csv.DictReader(fh):
                try:
                    rows.append((int(r["Start Range"]), int(r["End Range"]), r["Items"]))
                except (ValueError, KeyError):
                    pass
    except FileNotFoundError:
        pass
    return rows


def emit(ctx):
    sfx = ctx.sfx
    remap = {int(k): v for k, v in ctx.fixture("item_remap").items()}
    scope = ctx.fixture("item_scope" + sfx)
    QIDS = set(scope["quests"])
    LI_CRE = set(scope["creatures"])

    def rm(v):
        try:
            v = int(v)
        except (TypeError, ValueError):
            return 0
        return remap.get(v, v) if v > 0 else max(v, 0)   # custom->reserved, keep stock, drop negatives

    def gi(r, k, d=0):
        try:
            return int(float(r[k])) if r[k] not in (None, "") else d
        except (TypeError, ValueError):
            return d

    def gs(r, k):
        v = r[k]
        return (v or "").strip() if isinstance(v, str) else ""

    def esc(v):
        if v is None:
            return "NULL"
        if isinstance(v, str):
            return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
        if isinstance(v, float):
            return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
        return str(v)

    # --- conflict guard (F-011 item-ref sanity) ---
    RESV = _load_reservations()

    def _owner(i):
        return next((nm for lo, hi, nm in RESV if lo <= i <= hi), "UNRESERVED gap")

    CONFLICTS = []

    def scan_conflicts(qid, col):
        for k in ITEM_COLS:
            v = col.get(k, 0) or 0
            if v >= CUSTOM_FLOOR and not (F011_LO <= v <= F011_HI):
                CONFLICTS.append((qid, k, v, _owner(v)))

    qt = {int(r["Id"]): r for r in ctx.q(
        "SELECT * FROM quest_template WHERE Id IN (%s)" % ",".join("%d" % q for q in sorted(QIDS)))}
    qids = sorted(qt)
    print("LI quests with source data:", len(qids), "of", len(QIDS))

    # ---- quest_template ----
    b = ["-- F-011 Lost Isles quest_template (Cata->WotLK). Item refs remapped. Reward factions zeroed.\n"]
    for qid in qids:
        s = qt[qid]
        col = {
            "ID": qid, "QuestType": gi(s, "Method"), "QuestLevel": gi(s, "Level"),
            "MinLevel": gi(s, "MinLevel"), "QuestSortID": gi(s, "ZoneOrSort"),
            "QuestInfoID": gi(s, "Type"), "SuggestedGroupNum": gi(s, "SuggestedPlayers"),
            "RequiredFactionId1": 0, "RequiredFactionId2": 0,
            "RequiredFactionValue1": 0, "RequiredFactionValue2": 0,
            "RewardNextQuest": gi(s, "NextQuestIdChain"),
            "RewardXPDifficulty": gi(s, "RewardXPId"), "RewardMoney": gi(s, "RewardOrRequiredMoney"),
            "RewardMoneyDifficulty": gi(s, "RewardMoneyMaxLevel"),
            "RewardDisplaySpell": gi(s, "RewardSpellCast"), "RewardSpell": gi(s, "RewardSpell"),
            "RewardHonor": gi(s, "RewardHonor"), "RewardKillHonor": 0,
            "StartItem": rm(s["SourceItemId"]), "Flags": gi(s, "Flags"),
            "RequiredPlayerKills": gi(s, "RequiredPlayerKills"),
        }
        for n in range(1, 5):
            col["RewardItem%d" % n] = rm(s["RewardItemId%d" % n]); col["RewardAmount%d" % n] = gi(s, "RewardItemCount%d" % n)
        for n in range(1, 5):
            col["ItemDrop%d" % n] = rm(s["RequiredSourceItemId%d" % n]); col["ItemDropQuantity%d" % n] = gi(s, "RequiredSourceItemCount%d" % n)
        for n in range(1, 7):
            col["RewardChoiceItemID%d" % n] = rm(s["RewardChoiceItemId%d" % n]); col["RewardChoiceItemQuantity%d" % n] = gi(s, "RewardChoiceItemCount%d" % n)
        col.update({"POIContinent": gi(s, "PointMapId"), "POIx": float(s["PointX"] or 0), "POIy": float(s["PointY"] or 0),
                    "POIPriority": gi(s, "PointOption"), "RewardTitle": gi(s, "RewardTitleId"),
                    "RewardTalents": gi(s, "RewardTalents"), "RewardArenaPoints": gi(s, "RewardArenaPoints")})
        for n in range(1, 6):
            col["RewardFactionID%d" % n] = 0; col["RewardFactionValue%d" % n] = 0; col["RewardFactionOverride%d" % n] = 0
        col.update({"TimeAllowed": gi(s, "LimitTime"), "AllowableRaces": gi(s, "RequiredRaces"),
                    "LogTitle": gs(s, "Title"), "LogDescription": gs(s, "Objectives"),
                    "QuestDescription": gs(s, "Details"), "AreaDescription": "",
                    "QuestCompletionLog": gs(s, "EndText")})
        for n in range(1, 5):
            col["RequiredNpcOrGo%d" % n] = gi(s, "RequiredNpcOrGo%d" % n); col["RequiredNpcOrGoCount%d" % n] = gi(s, "RequiredNpcOrGoCount%d" % n)
        for n in range(1, 7):
            col["RequiredItemId%d" % n] = rm(s["RequiredItemId%d" % n]); col["RequiredItemCount%d" % n] = gi(s, "RequiredItemCount%d" % n)
        col["Unknown0"] = 0
        for n in range(1, 5):
            col["ObjectiveText%d" % n] = gs(s, "ObjectiveText%d" % n)
        col["VerifiedBuild"] = 0
        scan_conflicts(qid, col)
        b.append("DELETE FROM quest_template WHERE ID = %d;\n" % qid)
        b.append("INSERT INTO quest_template SET\n")
        b.append(",\n".join("  `%s` = %s" % (k, esc(v)) for k, v in col.items()))
        b.append(";\n\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_quests_01_template.sql" % sfx, "".join(b))

    # ---- conflict guard: WARN if any quest item-ref lands outside stock or F-011's block ----
    if CONFLICTS:
        print("\n!!! WARNING: %d quest item-ref(s) point into reserved space F-011 does not own:" % len(CONFLICTS))
        for qid, k, v, own in sorted(CONFLICTS):
            print("    quest %-6d %-20s item %-7d -> owned by [%s]" % (qid, k, v, own))
        print("    Fix at source (add to missing-items so it is ported) OR add a zz_[I-xxx]_*.sql override.")

    # ---- quest_template_addon ----
    b = ["-- F-011 quest_template_addon (chains, prereqs, provided items)\n\n"]
    for qid in qids:
        s = qt[qid]
        a = {"ID": qid, "MaxLevel": gi(s, "MaxLevel"), "AllowableClasses": gi(s, "RequiredClasses"),
             "SourceSpellID": gi(s, "SourceSpellId"), "PrevQuestID": gi(s, "PrevQuestId"),
             "NextQuestID": gi(s, "NextQuestId"), "ExclusiveGroup": gi(s, "ExclusiveGroup"),
             "BreadcrumbForQuestId": 0, "RewardMailTemplateID": gi(s, "RewardMailTemplateId"),
             "RewardMailDelay": gi(s, "RewardMailDelay"), "RequiredSkillID": gi(s, "RequiredSkillId"),
             "RequiredSkillPoints": gi(s, "RequiredSkillPoints"),
             "RequiredMinRepFaction": gi(s, "RequiredMinRepFaction"), "RequiredMaxRepFaction": gi(s, "RequiredMaxRepFaction"),
             "RequiredMinRepValue": gi(s, "RequiredMinRepValue"), "RequiredMaxRepValue": gi(s, "RequiredMaxRepValue"),
             "ProvidedItemCount": gi(s, "SourceItemCount"), "SpecialFlags": gi(s, "SpecialFlags") & 0xF}
        b.append("DELETE FROM quest_template_addon WHERE ID = %d;\n" % qid)
        b.append("INSERT INTO quest_template_addon SET " + ", ".join("`%s`=%s" % (k, esc(v)) for k, v in a.items()) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_quests_02_addon.sql" % sfx, "".join(b))

    # ---- offer_reward + request_items text ----
    b = ["-- F-011 quest turn-in text (offer_reward + request_items)\n\n"]
    for qid in qids:
        s = qt[qid]
        b.append("DELETE FROM quest_offer_reward WHERE ID=%d;\n" % qid)
        b.append("INSERT INTO quest_offer_reward (ID,Emote1,Emote2,Emote3,Emote4,EmoteDelay1,EmoteDelay2,EmoteDelay3,EmoteDelay4,RewardText,VerifiedBuild) VALUES (%d,%d,%d,%d,%d,%d,%d,%d,%d,%s,0);\n" % (
            qid, gi(s, "OfferRewardEmote1"), gi(s, "OfferRewardEmote2"), gi(s, "OfferRewardEmote3"), gi(s, "OfferRewardEmote4"),
            gi(s, "OfferRewardEmoteDelay1"), gi(s, "OfferRewardEmoteDelay2"), gi(s, "OfferRewardEmoteDelay3"), gi(s, "OfferRewardEmoteDelay4"),
            esc(gs(s, "OfferRewardText"))))
        b.append("DELETE FROM quest_request_items WHERE ID=%d;\n" % qid)
        b.append("INSERT INTO quest_request_items (ID,EmoteOnComplete,EmoteOnIncomplete,CompletionText,VerifiedBuild) VALUES (%d,%d,%d,%s,0);\n\n" % (
            qid, gi(s, "EmoteOnComplete"), gi(s, "EmoteOnIncomplete"), esc(gs(s, "RequestItemsText"))))
    ctx.write("sql/zz_[AUTO,F-011]%s_quests_03_text.sql" % sfx, "".join(b))

    # ---- creature_queststarter / questender ----
    starters = [(int(r["id"]), int(r["quest"])) for r in ctx.q("SELECT id, quest FROM creature_questrelation")
                if r["id"] is not None and r["quest"] is not None and int(r["id"]) in LI_CRE and int(r["quest"]) in QIDS]
    enders = [(int(r["id"]), int(r["quest"])) for r in ctx.q("SELECT id, quest FROM creature_involvedrelation")
              if r["id"] is not None and r["quest"] is not None and int(r["id"]) in LI_CRE and int(r["quest"]) in QIDS]
    b = ["-- F-011 creature_queststarter / questender\n\n"]
    if starters:
        b.append("DELETE FROM creature_queststarter WHERE quest IN (%s);\n" % ",".join(str(q) for q in sorted(QIDS)))
        b.append("INSERT INTO creature_queststarter (id,quest) VALUES\n" + ",\n".join("  (%d,%d)" % (i, q) for i, q in sorted(set(starters))) + ";\n\n")
    if enders:
        b.append("DELETE FROM creature_questender WHERE quest IN (%s);\n" % ",".join(str(q) for q in sorted(QIDS)))
        b.append("INSERT INTO creature_questender (id,quest) VALUES\n" + ",\n".join("  (%d,%d)" % (i, q) for i, q in sorted(set(enders))) + ";\n")
    ctx.write("sql/zz_[AUTO,F-011]%s_quests_04_relations.sql" % sfx, "".join(b))

    print("quest_template: %d, addon: %d, starters: %d, enders: %d" % (len(qids), len(qids), len(set(starters)), len(set(enders))))
    return "quests=%d addon=%d starters=%d enders=%d conflicts=%d" % (
        len(qids), len(qids), len(set(starters)), len(set(enders)), len(CONFLICTS))
