"""Generate Writing Table bonus milling yield SQL (F-001, Inscription)."""

from pathlib import Path

from ._dedicated_bonus import generate_bonus

# Writing Table tiers (item buff spells 91248-91251)
TIERS = [
    {'name': 'Journeyman', 'spell': 91248, 'chance': 10, 'tier_id': 1},
    {'name': 'Artisan', 'spell': 91249, 'chance': 20, 'tier_id': 2},
    {'name': 'Master', 'spell': 91250, 'chance': 30, 'tier_id': 3},
    {'name': 'Grand Master', 'spell': 91251, 'chance': 40, 'tier_id': 4},
]

REF_START = 96000
REF_END = 96999
OUTPUT_FILENAME = 'zz_[AUTO,F-001]_writing_table_milling_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    return generate_bonus(
        craft_root,
        loot_table='milling_loot_template',
        tiers=TIERS,
        ref_start=REF_START,
        ref_end=REF_END,
        output_filename=OUTPUT_FILENAME,
        label='Writing Table',
        action='milling',
        output=output,
    )
