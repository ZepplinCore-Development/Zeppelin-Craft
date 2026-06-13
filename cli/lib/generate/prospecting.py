"""Generate Jeweler's Kit bonus prospecting yield SQL (F-001, Jewelcrafting)."""

from pathlib import Path

from ._dedicated_bonus import generate_bonus

# Jeweler's Kit tiers (item buff spells 91244-91247)
TIERS = [
    {'name': 'Journeyman', 'spell': 91244, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91245, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91246, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91247, 'chance': 40, 'tier_id': 4},
]

REF_START = 97000
REF_END = 97999
OUTPUT_FILENAME = 'zz_[AUTO,F-001]_jewelers_kit_prospecting_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    return generate_bonus(
        craft_root,
        loot_table='prospecting_loot_template',
        tiers=TIERS,
        ref_start=REF_START,
        ref_end=REF_END,
        output_filename=OUTPUT_FILENAME,
        label="Jeweler's Kit",
        action='prospecting',
        output=output,
    )
