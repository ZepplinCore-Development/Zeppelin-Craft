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
Training dummies (I-247): the source roots/pacifies these via the
npc_training_dummy C++ script, which the port drops (the SAI quest-credit rows
need AIName=SmartAI, and a ScriptName would silence them). The script's
behaviour is ported as data instead: creature_template_movement Rooted=1 (never
chases) + UNIT_FLAG_PACIFIED (never retaliates).

Two single combined files for both zones -> emitted only on the "" pass.
"""
import os
import importlib.util

NAME = "immunities_movement"
TABLES = ["creature_template", "creature_immunities", "creature_template_movement"]
TIER = "overlay"

ZONES = ("4720", "4737")   # Lost Isles + Kezan (one combined file)


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


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

    # summon-only creatures (I-310 blind spot, hit again as I-311): never in the
    # source `creature` table, so the zone-spawn scope misses them — the
    # Warchief's Revenge cyclone (36178, InhabitType 4) shipped with no Flight
    # row and sat on the ground instead of flying its circuit.
    gob |= set(_sibling("_summons").summoned_entries(ctx))

    imm, move, dummies = {}, [], []
    for r in ctx.q("SELECT entry, mechanic_immune_mask, InhabitType, ScriptName, "
                   "unit_flags FROM creature_template"):
        e = _i(r["entry"])
        if e not in gob:
            continue
        mm = _i(r["mechanic_immune_mask"])
        if mm != 0:
            imm.setdefault(mm, []).append(e)
        it = _i(r["InhabitType"])
        if it not in (0, 3):
            move.append((e, 1 if it & 1 else 0, 1 if it & 2 else 0, 1 if it & 4 else 0))
        if str(r["ScriptName"] or "").strip() == "npc_training_dummy":
            dummies.append((e, _i(r["unit_flags"])))

    # --- creature_immunities (one row per distinct mask, ID block 91100+) ---
    base = 91100
    for idx, (mask, ents) in enumerate(sorted(imm.items())):
        iid = base + idx
        ctx.col.put("creature_immunities", iid, {
            "ID": iid, "SchoolMask": 0, "DispelTypeMask": 0, "MechanicsMask": mask,
            "Effects": 0, "Auras": 0, "ImmuneAoE": 0, "ImmuneChain": 0,
            "Comment": "F-011 goblin boss immunities 0x%X" % mask,
        }, tier="base", owner="immunities_movement")
        # fold creature_template.CreatureImmunitiesId into the collector INSERT (was clobbered)
        for e in sorted(ents):
            ctx.col.put("creature_template", e, {"CreatureImmunitiesId": iid}, tier="overlay")

    # --- creature_template_movement (InhabitType bits; Flight=DisableGravity) ---
    for e, g, s, fl in move:
        ctx.col.put("creature_template_movement", e, {
            "CreatureId": e, "Ground": g, "Swim": s, "Flight": fl,
        }, tier="base", owner="immunities_movement")

    # --- training dummies: rooted + pacified (I-247, see module docstring) ---
    for e, uf in sorted(dummies):
        ctx.col.put("creature_template_movement", e, {
            "CreatureId": e, "Ground": 1, "Swim": 0, "Flight": 0, "Rooted": 1,
        }, tier="base", owner="immunities_movement")
        ctx.col.put("creature_template", e, {"unit_flags": uf | 0x20000}, tier="overlay")

    return "immunities=%d masks / movement=%d entries / dummies=%d rooted+pacified" % (
        len(imm), len(move), len(dummies))
