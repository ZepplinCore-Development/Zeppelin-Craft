"""Entry-ID reservations for F-013 generated dungeon items.

Each (tier, difficulty) gets a 1000-ID block. The generator enumerates the
matrix in a stable order and assigns IDs sequentially within the block, so
the same matrix cell always maps to the same entry ID across runs.

Source-of-truth ranges are also declared in
Scripts/Item Scripts/Item Reservations.csv — keep both in sync if you ever
move them.
"""

from typing import Tuple

TIERS = ("azeroth", "outland", "northrend")
DIFFICULTIES = ("heroic", "mythic")

RESERVATIONS = {
    ("azeroth", "heroic"):   (60200, 61199),
    ("azeroth", "mythic"):   (61200, 62199),
    ("outland", "heroic"):   (62200, 63199),
    ("outland", "mythic"):   (63200, 64199),
    ("northrend", "heroic"): (64200, 65199),
    ("northrend", "mythic"): (65200, 66199),
}

RANGE_SIZE = 1000


def range_for(tier: str, difficulty: str) -> Tuple[int, int]:
    if (tier, difficulty) not in RESERVATIONS:
        raise ValueError(f"No reservation for ({tier!r}, {difficulty!r})")
    return RESERVATIONS[(tier, difficulty)]


def entry_id(tier: str, difficulty: str, matrix_index: int) -> int:
    start, end = range_for(tier, difficulty)
    if matrix_index < 0 or matrix_index > (end - start):
        raise ValueError(
            f"Matrix index {matrix_index} overflows reserved range "
            f"{start}-{end} ({end - start + 1} IDs) for ({tier}, {difficulty}). "
            f"Expand the reservation in lib/item/reservations.py and the CSV."
        )
    return start + matrix_index
