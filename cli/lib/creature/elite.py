"""
Elite Creature Scaler

Adjusts elite creature templates for balanced scaling within shared Autobalance zones.
Used for dungeons like BRS where UBRS and LBRS share Autobalance tuning but have
wildly different mob strength.
"""

import json
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from .common import DATA_DIR, get_db_connection, seed_random, write_sql_file

OUTPUT_FILENAME = "zz_[AUTO,F-074]_elite_scaler.sql"

COLUMNS = ["name", "DamageModifier", "HealthModifier"]


@dataclass
class PowerLevel:
    name: str
    damage_min: float
    damage_max: float
    health_min: float
    health_max: float


POWER_LEVELS = {
    "boss": PowerLevel("boss", 5.0, 7.0, 8.0, 10.0),
    "rare": PowerLevel("rare", 4.0, 6.0, 5.0, 7.0),
    "trash": PowerLevel("trash", 3.0, 4.0, 3.0, 4.0),
}

POWER_ORDER = ["boss", "rare", "trash"]


def load_creatures() -> Dict:
    """Load creature definitions from data/creatures_elite.json."""
    json_file = DATA_DIR / "creatures_elite.json"
    if not json_file.exists():
        raise FileNotFoundError(f"Creature definitions not found: {json_file}")

    with open(json_file, 'r') as f:
        data = json.load(f)

    return {k: v for k, v in data.items() if not k.startswith("_")}


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


def generate_update(entry: int, creature: Dict, power: PowerLevel) -> List[str]:
    """Generate SQL UPDATE statements for a single creature."""
    lines = []
    lines.append(f"-- {creature['name']} as {power.name}")
    lines.append("")

    damage = round(random.uniform(power.damage_min, power.damage_max), 2)
    health = round(random.uniform(power.health_min, power.health_max), 2)

    lines.append("UPDATE `creature_template` SET")
    lines.append(f"    `DamageModifier` = {damage},")
    lines.append(f"    `HealthModifier` = {health}")
    lines.append(f"WHERE `entry` = {entry};")
    lines.append("")

    return lines


def run(
    output_path: Path,
    seed: Optional[int] = None,
    verbose: bool = True
) -> Tuple[int, int]:
    """
    Run the Elite Creature Scaler.

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

        for area_name, creatures in area_data.items():
            all_queries.append(f"-- {area_name}")
            all_queries.append("")

            for power_name in POWER_ORDER:
                creature_ids = creatures.get(power_name, [])
                power = POWER_LEVELS[power_name]

                for entry_id in creature_ids:
                    creature = fetch_creature(cursor, entry_id)
                    if creature is None:
                        if verbose:
                            print(f"  Warning: No creature found with entry {entry_id}")
                        not_found += 1
                        continue

                    queries = generate_update(entry_id, creature, power)
                    all_queries.extend(queries)
                    processed += 1

                    if verbose:
                        print(f"  {creature['name']} ({entry_id}) -> {power.name}")
    finally:
        conn.close()

    write_sql_file(output_path, "Elite Creature Scaler", all_queries)

    return processed, not_found
