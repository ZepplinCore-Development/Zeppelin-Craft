"""
Spell School Immunity Balancing (F-187)

Converts nonsensical creature spell-school *immunities* into level-scaled
*resistances*, so nature/elemental-themed classes aren't hard-locked out of
solo open-world content while the creature keeps a thematic damage penalty.

Background
----------
Immunities live in `creature_template.CreatureImmunitiesId` -> shared rows in
`creature_immunities` (negative IDs are AzerothCore's auto-migrated sets from
the old `spell_school_immune_mask` / `mechanic_immune_mask` columns).

Only the PURE-SCHOOL sets (school bits set, MechanicsMask == 0) are converted.
Sets that pair a school immunity with a crowd-control mechanic mask are
deliberate boss/encounter design and are left untouched.

Resistance math (AC, no AutoBalance level scaling on this server)
----------------------------------------------------------------
    averageResist = R / (R + level * 5)        # non-boss resistance constant
=>  R = (T / (1 - T)) * 5 * level               # to hit target mitigation T

Default target 35% -> R = round(2.69 * level). Per-creature level is taken as
round((minlevel + maxlevel) / 2).
"""

from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .common import get_db_connection, write_sql_file

OUTPUT_FILENAME = "zz_[AUTO,F-187]_immunity_to_resist.sql"

# Default mitigation target (band 0.30-0.40 acceptable per F-187).
DEFAULT_TARGET = 0.35

# Pure-school immunity sets only (MechanicsMask == 0). Discovered from
# creature_immunities; gated again at runtime so a data change can't widen scope.
# SchoolMask bit -> creature_template_resistance.School index.
SCHOOL_BITS = {
    0x02: 1,   # Holy
    0x04: 2,   # Fire
    0x08: 3,   # Nature
    0x10: 4,   # Frost
    0x20: 5,   # Shadow
    0x40: 6,   # Arcane
}
# 0x01 (Physical/Normal) is armor-based, not a resistance school -> skip.

SCHOOL_NAMES = {1: "Holy", 2: "Fire", 3: "Nature", 4: "Frost", 5: "Shadow", 6: "Arcane"}


def resistance_for(level: int, target: float) -> int:
    """Resistance value yielding `target` average mitigation at `level`."""
    if level <= 0:
        level = 1
    return round((target / (1.0 - target)) * 5.0 * level)


def fetch_pure_school_sets(cursor) -> Dict[int, int]:
    """Return {immunity_set_id: school_mask} for pure-school sets (no mechanics)."""
    cursor.execute(
        "SELECT ID, SchoolMask FROM creature_immunities "
        "WHERE SchoolMask != 0 AND MechanicsMask = 0 AND DispelTypeMask = 0 "
        "AND Effects = '' AND Auras = ''"
    )
    return {row[0]: row[1] for row in cursor.fetchall()}


def fetch_creatures(cursor, set_ids: List[int]) -> List[Tuple]:
    """Return (entry, name, minlevel, maxlevel, CreatureImmunitiesId) for affected creatures."""
    if not set_ids:
        return []
    placeholders = ", ".join(["%s"] * len(set_ids))
    cursor.execute(
        f"SELECT entry, name, minlevel, maxlevel, CreatureImmunitiesId "
        f"FROM creature_template WHERE CreatureImmunitiesId IN ({placeholders}) "
        f"ORDER BY entry",
        tuple(set_ids),
    )
    return cursor.fetchall()


def schools_from_mask(mask: int) -> List[int]:
    """Resistance school indices for a school mask (Physical excluded)."""
    return [idx for bit, idx in SCHOOL_BITS.items() if mask & bit]


def generate_sql(entry: int, name: str, level: int, school_indices: List[int],
                 target: float) -> List[str]:
    """Idempotent SQL: drop immunity set, add level-scaled resistance per school."""
    resist = resistance_for(level, target)
    schools_str = "/".join(SCHOOL_NAMES[s] for s in school_indices)
    safe_name = name.replace("'", "''")
    lines = [
        f"-- {safe_name} ({entry}) lvl {level}: immune -> {int(target * 100)}% resist "
        f"({schools_str} = {resist})",
        f"UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = {entry};",
    ]
    for school in school_indices:
        lines.append(
            f"DELETE FROM `creature_template_resistance` "
            f"WHERE `CreatureID` = {entry} AND `School` = {school};"
        )
        lines.append(
            f"INSERT INTO `creature_template_resistance` "
            f"(`CreatureID`, `School`, `Resistance`) "
            f"VALUES ({entry}, {school}, {resist});"
        )
    lines.append("")
    return lines


def run(output_path: Path, target: float = DEFAULT_TARGET,
        verbose: bool = True) -> Tuple[int, int]:
    """
    Generate the immunity->resistance conversion SQL.

    Returns (creatures_converted, resistance_rows_written).
    """
    if not (0.0 < target < 0.95):
        raise ValueError(f"target must be between 0 and 0.95, got {target}")

    all_queries = [
        f"-- Target mitigation: {int(target * 100)}%  (R = round({target/(1-target)*5:.3f} * level))",
        "",
    ]
    converted = 0
    resist_rows = 0

    conn = get_db_connection()
    try:
        cursor = conn.cursor()
        pure_sets = fetch_pure_school_sets(cursor)
        set_ids = list(pure_sets.keys())
        creatures = fetch_creatures(cursor, set_ids)

        for entry, name, minlevel, maxlevel, set_id in creatures:
            mask = pure_sets[set_id]
            school_indices = schools_from_mask(mask)
            if not school_indices:
                # School mask was Physical-only (0x01); nothing resistance can model.
                if verbose:
                    print(f"  Skip {name} ({entry}): physical-only immunity, no resist school")
                continue
            level = max(1, round((minlevel + maxlevel) / 2))
            all_queries.extend(generate_sql(entry, name, level, school_indices, target))
            converted += 1
            resist_rows += len(school_indices)
            if verbose:
                schools_str = "/".join(SCHOOL_NAMES[s] for s in school_indices)
                print(f"  {name} ({entry}) lvl {level}: {schools_str} -> "
                      f"{resistance_for(level, target)} resist")
    finally:
        conn.close()

    write_sql_file(output_path, "Spell School Immunity Balancing (F-187)", all_queries)
    return converted, resist_rows
