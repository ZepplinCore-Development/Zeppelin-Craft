"""gen domain: immunities_movement.

creature_template (Cata, neltharion) -> AC creature_immunities (from
mechanic_immune_mask) + creature_template_movement (from InhabitType) for the
goblin zone NPCs.

Immunities: one creature_immunities row per distinct goblin mechanic_immune_mask
(ID block 91100+, sorted by mask), MechanicsMask=mask; creature_template
.CreatureImmunitiesId repointed. Restores boss CC-immunity.
Movement: InhabitType bits -> Ground(1)/Swim(2)/Flight(4 = DisableGravity, keeps
air units at spawn Z). Emitted for non-default (not 0/3) InhabitType, sorted by
entry.

Two single combined files for both zones -> emitted only on the "" pass.
"""
NAME = "immunities_movement"
TABLES = ["creature_template"]   # CreatureImmunitiesId overlay (immunities/movement tables still legacy)
TIER = "overlay"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)


def _i(v, d=0):
    try:
        return int(str(v).strip())
    except Exception:
        return d


def emit(ctx):
    if ctx.sfx == "_K":
        return "immunities_movement: skipped (single combined files, emitted on the Lost Isles pass)"

    gob = {_i(r["id"]) for r in ctx.q(
        "SELECT DISTINCT CAST(TRIM(id) AS SIGNED) AS id FROM creature "
        "WHERE TRIM(zone) IN ('%s','%s')"
        " AND CAST(TRIM(id) AS SIGNED) < 1000000" % ZONES)}  # no dev/leet NPCs (I-233)

    imm, move = {}, []
    for r in ctx.q("SELECT entry, mechanic_immune_mask, InhabitType FROM creature_template"):
        e = _i(r["entry"])
        if e not in gob:
            continue
        mm = _i(r["mechanic_immune_mask"])
        if mm != 0:
            imm.setdefault(mm, []).append(e)
        it = _i(r["InhabitType"])
        if it not in (0, 3):
            move.append((e, 1 if it & 1 else 0, 1 if it & 2 else 0, 1 if it & 4 else 0))

    # --- creature_immunities ---
    base = 91100
    L = ["-- [F-011] creature_immunities from Neltharion mechanic_immune_mask (bosses lost CC-immunity).",
         "-- One row per distinct mask; creature_template.CreatureImmunitiesId repointed. "
         "Regenerate: `zep goblin gen immunities_movement`.\n"]
    for idx, (mask, ents) in enumerate(sorted(imm.items())):
        iid = base + idx
        L.append("DELETE FROM creature_immunities WHERE ID=%d;" % iid)
        L.append("INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,"
                 "Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES "
                 "(%d,0,0,%d,0,0,0,0,'F-011 goblin boss immunities 0x%X');" % (iid, mask, mask))
        # fold creature_template.CreatureImmunitiesId into the collector INSERT (was clobbered)
        for e in sorted(ents):
            ctx.col.put("creature_template", e, {"CreatureImmunitiesId": iid}, tier="overlay")
    ctx.write("sql/zz_[AUTO,F-011]%s_creature_immunities.sql" % ctx.sfx, "\n".join(L) + "\n")

    # --- creature_template_movement ---
    ents = [m[0] for m in move]
    M = ["-- [F-011] creature_template_movement from Neltharion InhabitType (fliers/swimmers fell to ground).",
         "-- Ground/Swim from bits; Flight=1 (DisableGravity) keeps air units at spawn Z. "
         "Regenerate: `zep goblin gen immunities_movement`.\n",
         "DELETE FROM creature_template_movement WHERE CreatureId IN (%s);"
         % ",".join(map(str, sorted(ents))),
         "INSERT INTO creature_template_movement (CreatureId,Ground,Swim,Flight) VALUES"]
    M.append(",\n".join("  (%d,%d,%d,%d)" % (e, g, s, fl) for e, g, s, fl in sorted(move)) + ";")
    ctx.write("sql/zz_[AUTO,F-011]%s_creature_movement.sql" % ctx.sfx, "\n".join(M) + "\n")

    return "immunities=%d masks / movement=%d entries" % (len(imm), len(move))
