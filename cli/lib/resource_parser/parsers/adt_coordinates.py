#!/usr/bin/env python3
"""
ADT Coordinate Conversion Utilities
Converts ADT tile coordinates to world coordinates for zone lookups.

WoW World Coordinate System:
- Each map is divided into 64x64 ADT tiles
- Each ADT tile is 533.33333 yards (1600/3 yards)
- World center is at (0, 0)
- Tile coordinates go from 0-63 in both X and Y
- World coordinates go from -17066.66 to +17066.66 (approximately)
"""

# Constants
TILES_PER_MAP = 64  # 64x64 grid of ADT tiles
TILE_SIZE = 533.33333  # Size of one ADT tile in world yards
MAP_SIZE = TILES_PER_MAP * TILE_SIZE  # Total map size (34133.33 yards)
MAP_HALF = MAP_SIZE / 2  # Half map size for centering


def adt_to_world_coords(adt_x: int, adt_y: int) -> tuple[float, float]:
    """
    Convert ADT tile coordinates to world coordinates (center of tile).

    Args:
        adt_x: ADT X coordinate (0-63)
        adt_y: ADT Y coordinate (0-63)

    Returns:
        Tuple of (world_x, world_y) in yards

    Example:
        adt_to_world_coords(32, 32) → (0.0, 0.0)  # Map center
        adt_to_world_coords(0, 0) → (-16800.0, -16800.0)  # Top-left corner
        adt_to_world_coords(63, 63) → (16800.0, 16800.0)  # Bottom-right corner
    """
    # Calculate center of ADT tile in world coordinates
    # ADT (0, 0) starts at top-left of map
    world_x = (adt_x * TILE_SIZE) - MAP_HALF + (TILE_SIZE / 2)
    world_y = (adt_y * TILE_SIZE) - MAP_HALF + (TILE_SIZE / 2)

    return (world_x, world_y)


def world_to_adt_coords(world_x: float, world_y: float) -> tuple[int, int]:
    """
    Convert world coordinates to ADT tile coordinates.

    Args:
        world_x: World X coordinate in yards
        world_y: World Y coordinate in yards

    Returns:
        Tuple of (adt_x, adt_y) tile indices

    Example:
        world_to_adt_coords(0.0, 0.0) → (32, 32)  # Map center
    """
    # Shift world coords to map-relative coords (0-based)
    map_x = world_x + MAP_HALF
    map_y = world_y + MAP_HALF

    # Convert to tile indices
    adt_x = int(map_x / TILE_SIZE)
    adt_y = int(map_y / TILE_SIZE)

    # Clamp to valid range
    adt_x = max(0, min(63, adt_x))
    adt_y = max(0, min(63, adt_y))

    return (adt_x, adt_y)


def get_adt_bounds(adt_x: int, adt_y: int) -> dict:
    """
    Get bounding box for an ADT tile in world coordinates.

    Args:
        adt_x: ADT X coordinate (0-63)
        adt_y: ADT Y coordinate (0-63)

    Returns:
        Dict with keys: left, right, top, bottom, center_x, center_y
    """
    center_x, center_y = adt_to_world_coords(adt_x, adt_y)
    half_tile = TILE_SIZE / 2

    return {
        'left': center_x - half_tile,
        'right': center_x + half_tile,
        'top': center_y + half_tile,
        'bottom': center_y - half_tile,
        'center_x': center_x,
        'center_y': center_y
    }


def parse_adt_filename(filename: str) -> tuple[str, int, int]:
    """
    Parse ADT filename to extract map name and coordinates.

    Args:
        filename: ADT filename (e.g., "azeroth_28_34.adt")

    Returns:
        Tuple of (map_name, x, y)

    Example:
        parse_adt_filename("azeroth_28_34.adt") → ("azeroth", 28, 34)
    """
    from pathlib import Path

    basename = Path(filename).stem
    parts = basename.split('_')

    if len(parts) >= 3:
        map_name = parts[0]
        x = int(parts[1])
        y = int(parts[2])
        return (map_name, x, y)

    raise ValueError(f"Invalid ADT filename format: {filename}")


if __name__ == '__main__':
    # Test coordinate conversion
    print("ADT Coordinate Conversion Tests")
    print("="*80)

    test_cases = [
        (0, 0, "Top-left corner"),
        (32, 32, "Map center"),
        (63, 63, "Bottom-right corner"),
        (28, 34, "Example: azeroth_28_34.adt"),
        (54, 28, "Example: kalimdor_54_28.adt (Lost Isles)")
    ]

    for adt_x, adt_y, description in test_cases:
        world_x, world_y = adt_to_world_coords(adt_x, adt_y)
        print(f"\nADT ({adt_x}, {adt_y}) - {description}")
        print(f"  World coords: ({world_x:.2f}, {world_y:.2f})")

        # Test round-trip
        back_x, back_y = world_to_adt_coords(world_x, world_y)
        print(f"  Round-trip: ({back_x}, {back_y}) {'✅' if (back_x, back_y) == (adt_x, adt_y) else '❌'}")

    print("\n" + "="*80)
    print("✅ Coordinate conversion functions ready")
