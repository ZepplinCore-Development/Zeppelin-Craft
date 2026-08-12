"""F-028 relic plan validator — catches dead effect-target pairings.

Every relic in `relic_effects.json` binds an effect archetype (mana cost
reduction, spell power, ...) to a target spell via a 96-bit family mask. Three
independent things can silently make that binding a no-op, and none of them
produce a server error — the item equips, the aura applies, and nothing
happens:

  1. The archetype needs something the target spell does not have. A mana-cost
     mod on Devotion Aura (free since 3.0.2) is the original instance: correct
     mask, correct aura, zero effect.
  2. The mask names the wrong spell in a multi-spell ability. Magma Totem's
     SUMMON spell carries the mask the ladder records, but the damage is dealt
     by a separate spell the totem casts, which the mod never reaches.
  3. The mask misses a word. Claw's flag lives in spell_class_mask_3; a mask
     that only sets word 1 covers Rake and silently drops Claw.

This module re-derives, from the live DBC, which spells each generated relic
actually reaches, and asserts that set is non-empty, covers every spell named
in the target string, and can carry the archetype.

Run standalone or via the generator's --validate flag:
    python3 -m cli.lib.item.relic_validate
"""

from pathlib import Path
from typing import Optional

from .relic_generator import (
    DATA,
    EFFECT_REQUIRES,
    PROJECT_ROOT,
    resolve_target_mask,
)

import json
import re

ENV_PATH = PROJECT_ROOT / "cli" / ".env"

# Effect ids / aura ids that mean "this spell deals direct or periodic damage"
# and "this spell heals". Used to tell a totem's SUMMON row (effect 28) apart
# from the row that actually carries the damage.
DAMAGE_EFFECTS = {2, 9, 30, 62}          # SCHOOL_DAMAGE, HEALTH_LEECH, POWER_BURN, WEAPON_DAMAGE
DAMAGE_AURAS = {3, 89, 200}              # PERIODIC_DAMAGE, PERIODIC_DAMAGE_PERCENT, ...
HEAL_EFFECTS = {10, 75}                  # HEAL, HEAL_MAX_HEALTH
HEAL_AURAS = {8, 20}                     # PERIODIC_HEAL, OBS_MOD_HEALTH


def _connect():
    """Live DBC connection, or None when the DB is unreachable (offline runs
    should not hard-fail the generator)."""
    try:
        from lib.dbc_utils import DBCConfig, DBCConnection
    except ImportError:
        try:
            from ..dbc_utils import DBCConfig, DBCConnection
        except ImportError:
            return None
    try:
        config = DBCConfig.from_env(ENV_PATH)
        return DBCConnection(config).get_connection(config.live)
    except Exception:
        return None


def _load_family(conn, families) -> list:
    cur = conn.cursor(dictionary=True)
    cur.execute(
        "SELECT id, spell_name_enus, spell_level, base_level, power_cost,"
        " power_cost_percentage, recovery_time, category_recovery_time,"
        " spell_class_set, spell_class_mask_1, spell_class_mask_2, spell_class_mask_3,"
        " effect_1, effect_2, effect_3,"
        " effect_apply_aura_name_1, effect_apply_aura_name_2, effect_apply_aura_name_3"
        " FROM spell WHERE spell_class_set IN (%s)"
        % ",".join(str(int(f)) for f in families)
    )
    rows = cur.fetchall()
    cur.close()
    return rows


def _matches(row: dict, mask: tuple) -> bool:
    return bool(
        (row["spell_class_mask_1"] or 0) & mask[0]
        or (row["spell_class_mask_2"] or 0) & mask[1]
        or (row["spell_class_mask_3"] or 0) & mask[2]
    )


def _has_cost(row: dict) -> bool:
    return bool((row["power_cost"] or 0) or (row["power_cost_percentage"] or 0))


def _has_cooldown(row: dict) -> bool:
    return bool((row["recovery_time"] or 0) or (row["category_recovery_time"] or 0))


def _carries(row: dict, effects: set, auras: set) -> bool:
    return any(
        (row[f"effect_{i}"] or 0) in effects
        or (row[f"effect_apply_aura_name_{i}"] or 0) in auras
        for i in (1, 2, 3)
    )


def _can_carry(row: dict, requirement: str) -> bool:
    if requirement == "cost":
        return _has_cost(row)
    if requirement == "cooldown":
        return _has_cooldown(row)
    if requirement == "damage":
        return _carries(row, DAMAGE_EFFECTS, DAMAGE_AURAS)
    if requirement == "heal":
        return _carries(row, HEAL_EFFECTS, HEAL_AURAS)
    if requirement == "aura_value":
        # SPELLMOD_EFFECT1 against an aura's amount — any spell with an effect 1
        # aura qualifies.
        return bool(row["effect_apply_aura_name_1"] or 0)
    return True


def _learnable_ids(conn) -> set:
    """Spell ids reachable by a player via a skill line.

    Name matching alone is not enough: plenty of NPC spells share a player
    ability's display name (there are five 'Lightning Bolt' rows at level 1,
    only one of which is spell 403). skilllineability is the authoritative
    "a class can actually know this" link.
    """
    cur = conn.cursor()
    cur.execute("SELECT spell_id FROM skilllineability")
    ids = {row[0] for row in cur.fetchall()}
    cur.close()
    return ids


def _player_ranks(rows: list, name: str, family: int, learnable: set) -> list:
    """Rows that are a player-learnable rank of `name`."""
    return [
        r for r in rows
        if r["spell_name_enus"] == name
        and r["spell_class_set"] == family
        and r["id"] in learnable
    ]


def validate(verbose: bool = False) -> list:
    """Returns a list of human-readable problem strings (empty == all good)."""
    conn = _connect()
    if conn is None:
        return ["SKIPPED: live DBC unreachable — relic plan not validated"]

    d = json.loads(Path(DATA).read_text())
    class_spells = d["class_spells"]
    class_set_dbc = d["_class_set_dbc"]
    rows = _load_family(conn, sorted(set(class_set_dbc.values())))
    learnable = _learnable_ids(conn)

    problems = []
    entries = []
    for band, v in d["relic_plan"].items():
        if isinstance(v, list):
            entries.extend(v)

    for e in entries:
        cls = e["class"]
        eff = e["effect"]
        family = class_set_dbc[cls]
        label = f"{e['item_id']}/{e['spell_id']} {e['name_hint']}"

        try:
            m1, m2, m3, display = resolve_target_mask(e["target"], cls, class_spells, eff)
        except ValueError as exc:
            problems.append(f"{label}: {exc}")
            continue

        mask = (m1, m2, m3)
        if not any(mask):
            problems.append(
                f"{label}: empty class mask — SpellInfo::IsAffected treats an "
                f"all-zero mask as 'whole family', so this would modify every "
                f"{cls} spell"
            )
            continue

        reached = [r for r in rows if r["spell_class_set"] == family and _matches(r, mask)]
        if not reached:
            problems.append(f"{label}: mask {mask} matches no spell in family {family}")
            continue

        # 1. Can anything the mask reaches actually carry this archetype?
        requirement = EFFECT_REQUIRES.get(eff)
        if requirement:
            carriers = [r for r in reached if _can_carry(r, requirement)]
            if not carriers:
                problems.append(
                    f"{label}: '{eff}' needs a target with '{requirement}', but none "
                    f"of the {len(reached)} spells this mask reaches has one "
                    f"(e.g. {sorted({r['spell_name_enus'] for r in reached})[:4]})"
                )
                continue

        # 2. Is every spell named in the target string actually covered?
        named = [p.strip() for p in re.sub(r"\s*\(mask[^)]*\)", "", e["target"]).split("+")]
        for name in named:
            ladder = class_spells[cls].get(name, {})
            redirected = eff in (ladder.get("effect_masks") or {})
            if redirected:
                # The ladder explicitly redirects this archetype at a spell the
                # player does not cast directly (a totem's own damage spell).
                # Rank-for-rank coverage does not apply; assert only that the
                # mask reaches something of that name which carries the effect.
                same_name = [
                    r for r in rows
                    if r["spell_name_enus"].startswith(name)
                    and r["spell_class_set"] == family
                    and _matches(r, mask)
                    and (not requirement or _can_carry(r, requirement))
                ]
                if not same_name:
                    problems.append(
                        f"{label}: effect_masks redirects '{eff}' for '{name}', but "
                        f"the redirected mask reaches no '{name}' spell carrying "
                        f"'{requirement}'"
                    )
                continue

            ranks = _player_ranks(rows, name, family, learnable)
            if requirement:
                # Judge coverage only against ranks that could carry the effect.
                # Holy Shock's healing half is a separate spell of the same name;
                # a damage relic is right to miss it.
                ranks = [r for r in ranks if _can_carry(r, requirement)]
            if not ranks:
                continue  # display-only phrasing, or nothing that can carry it
            hit = [r for r in ranks if _matches(r, mask)]
            if not hit:
                problems.append(
                    f"{label}: target names '{name}' but the mask covers none of "
                    f"its {len(ranks)} player ranks"
                )
            elif len(hit) < len(ranks):
                missed = sorted({r["spell_level"] for r in ranks if r not in hit})
                problems.append(
                    f"{label}: target names '{name}' but the mask covers only "
                    f"{len(hit)}/{len(ranks)} player ranks (missing at levels {missed})"
                )

        # 3. Does the mask reach MORE than it was meant to?
        #
        # Family flags mix spell-identifying bits with shared CATEGORY bits:
        # paladin mask_3 bit 5 means "is an Aura" (all seven share it), shaman
        # mask_3 bit 17 means "is an Earth Totem". Targeting a category bit
        # silently widens a single-spell relic into a whole-category one, which
        # no runtime check would ever report.
        intended = set()
        for name in named:
            intended.update(
                r["id"] for r in _player_ranks(rows, name, family, learnable)
            )
        stray = sorted({
            r["spell_name_enus"] for r in reached
            if r["id"] in learnable and r["id"] not in intended
            and (not requirement or _can_carry(r, requirement))
        })
        if stray and named:
            problems.append(
                f"{label}: mask also reaches {len(stray)} unintended player "
                f"spell(s) not named in the target — {stray[:6]} "
                f"(a shared category bit rather than a spell-identifying one?)"
            )

        # 4. Is the target learnable at or below the relic's required level?
        if requirement:
            usable = [
                r for r in reached
                if _can_carry(r, requirement) and 0 < (r["spell_level"] or 0) <= e["req_level"]
            ]
            if not usable and any(0 < (r["spell_level"] or 0) for r in reached):
                earliest = min(
                    (r["spell_level"] for r in reached if (r["spell_level"] or 0) > 0),
                    default=0,
                )
                problems.append(
                    f"{label}: req_level {e['req_level']} but the earliest rank the "
                    f"mask reaches is level {earliest}"
                )

        if verbose and not problems:
            print(f"  ok  {label} -> {sorted({r['spell_name_enus'] for r in reached})[:5]}")

    return problems


def main() -> int:
    problems = validate()
    if not problems:
        print("F-028 relic plan: all 52 relics validated against the live DBC — OK")
        return 0
    print(f"F-028 relic plan: {len(problems)} problem(s)\n")
    for p in problems:
        print(f"  - {p}")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
