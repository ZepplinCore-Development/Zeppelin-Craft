"""Generate Runed Rod bonus disenchanting yield SQL (F-001, Enchanting)."""

from pathlib import Path

from ._dedicated_bonus import generate_bonus

# Runed Rod tiers (item buff spells 91222-91231, Copper -> Titanium).
# Bonus chance scales 5% -> 50% in 5% steps across the 10 rods.
TIERS = [
    {'name': 'Runed Copper', 'spell': 91222, 'chance': 5, 'tier_id': 1},
    {'name': 'Runed Silver', 'spell': 91223, 'chance': 10, 'tier_id': 2},
    {'name': 'Runed Golden', 'spell': 91224, 'chance': 15, 'tier_id': 3},
    {'name': 'Runed Truesilver', 'spell': 91225, 'chance': 20, 'tier_id': 4},
    {'name': 'Runed Arcanite', 'spell': 91226, 'chance': 25, 'tier_id': 5},
    {'name': 'Runed Fel Iron', 'spell': 91227, 'chance': 30, 'tier_id': 6},
    {'name': 'Runed Adamantite', 'spell': 91228, 'chance': 35, 'tier_id': 7},
    {'name': 'Runed Eternium', 'spell': 91229, 'chance': 40, 'tier_id': 8},
    {'name': 'Runed Cobalt', 'spell': 91230, 'chance': 45, 'tier_id': 9},
    {'name': 'Runed Titanium', 'spell': 91231, 'chance': 50, 'tier_id': 10},
]

REF_START = 98000
REF_END = 99999
OUTPUT_FILENAME = 'zz_[AUTO,F-001]_runed_rod_disenchant_loot.sql'


def generate(craft_root: Path, output: Path = None) -> Path:
    return generate_bonus(
        craft_root,
        loot_table='disenchant_loot_template',
        tiers=TIERS,
        ref_start=REF_START,
        ref_end=REF_END,
        output_filename=OUTPUT_FILENAME,
        label='Runed Rod',
        action='disenchanting',
        output=output,
    )
