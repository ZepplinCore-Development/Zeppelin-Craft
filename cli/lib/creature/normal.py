"""
Normal Creature Convertor (de-L33TER)

Converts elite creatures to normal rank with adjusted stats.
Reverts IPP zone file elite restorations — Zeppelin uses Autobalance
for difficulty scaling instead of vanilla elite mobs in open world zones.
"""

import json
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .common import DATA_DIR, get_db_connection, seed_random, write_sql_file

OUTPUT_FILENAME = "zz_de-L33TER.sql"

COLUMNS = ["name", "DamageModifier", "HealthModifier", "Rank", "spell_school_immune_mask"]


@dataclass
class ChallengeType:
    name: str
    health_min: float
    health_max: float
    damage_min: float
    damage_max: float
    rank: int


CHALLENGE_TYPES = {
    "named_solo_fight": ChallengeType("named_solo_fight", 2.0, 2.5, 2.0, 2.3, 0),
    "named_group_fight": ChallengeType("named_group_fight", 1.7, 2.0, 1.5, 2.0, 0),
    "normal": ChallengeType("normal", 1.0, 1.2, 1.0, 1.1, 0),
    "rare": ChallengeType("rare", 1.7, 2.0, 1.5, 2.0, 2),
}

# Ordered processing sequence
CHALLENGE_ORDER = ["named_solo_fight", "named_group_fight", "normal", "rare"]


def load_creatures() -> Dict:
    """Load creature definitions from data/creatures.json."""
    json_file = DATA_DIR / "creatures.json"
    if not json_file.exists():
        raise FileNotFoundError(f"Creature definitions not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    area_data = {}
    for area_name, challenges in data.items():
        if area_name.startswith("_"):
            continue
        area_data[area_name] = {}
        for challenge_name, creature_ids in challenges.items():
            if challenge_name.startswith("_"):
                continue
            if challenge_name in CHALLENGE_TYPES:
                area_data[area_name][challenge_name] = creature_ids

    return area_data


def fetch_creature(cursor, entry: int) -> Optional[Dict]:
    """Fetch creature data from database."""
    column_names = ", ".join([f"`{col}`" for col in COLUMNS])
    cursor.execute(
        f"SELECT {column_names} FROM `creature_template` WHERE `entry` = %s",
        (entry,)
    )
    result = cursor.fetchone()
    if result:
        return dict(zip(COLUMNS, result))
    return None


def generate_update(entry: int, creature: Dict, challenge: ChallengeType) -> List[str]:
    """Generate SQL UPDATE statements for a single creature."""
    lines = []
    lines.append(f"-- Processing: {creature['name']} as {challenge.name}")
    lines.append("")

    modified = {
        "DamageModifier": round(random.uniform(challenge.damage_min, challenge.damage_max), 2),
        "HealthModifier": round(random.uniform(challenge.health_min, challenge.health_max), 2),
        "Rank": challenge.rank,
    }

    if creature.get("spell_school_immune_mask", 0) != 0:
        modified["spell_school_immune_mask"] = 0

    update_fields = []
    for col, value in modified.items():
        if value is None:
            update_fields.append(f"    `{col}` = NULL")
        else:
            update_fields.append(f"    `{col}` = {value}")

    lines.append("UPDATE `creature_template` SET")
    lines.append(",\n".join(update_fields))
    lines.append(f"WHERE `entry` = {entry};")
    lines.append("")

    return lines


def run(output_path: Path, seed: Optional[int] = None, verbose: bool = True) -> Tuple[int, int]:
    """
    Run the Normal Creature Convertor.

    Args:
        output_path: Path to write the output SQL file.
        seed: Optional random seed for reproducibility.
        verbose: If True, print progress to stdout.

    Returns:
        Tuple of (creatures_processed, creatures_not_found).
    """
    seed_random(seed)
    area_data = load_creatures()
    all_queries = []
    processed = 0
    not_found = 0

    conn = get_db_connection()
    try:
        cursor = conn.cursor()

        for area_name, challenges in area_data.items():
            all_queries.append(f"-- {area_name}")
            all_queries.append("")

            for challenge_name in CHALLENGE_ORDER:
                creature_ids = challenges.get(challenge_name, [])
                challenge = CHALLENGE_TYPES[challenge_name]

                for entry_id in creature_ids:
                    creature = fetch_creature(cursor, entry_id)
                    if creature is None:
                        if verbose:
                            print(f"  Warning: No creature found with entry {entry_id}")
                        not_found += 1
                        continue

                    queries = generate_update(entry_id, creature, challenge)
                    all_queries.extend(queries)
                    processed += 1

                    if verbose:
                        print(f"  {creature['name']} ({entry_id}) -> {challenge_name}")
    finally:
        conn.close()

    write_sql_file(output_path, "Normal Creature Convertor (de-L33TER)", all_queries)

    return processed, not_found
