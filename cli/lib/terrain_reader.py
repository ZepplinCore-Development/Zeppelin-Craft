"""
Terrain height reader for AzerothCore .map files.

Reads the binary heightmap data extracted by the server (maps/ directory)
and provides terrain height queries at arbitrary world coordinates.

Binary format matches GridTerrainData.h/cpp in AzerothCore source.
"""

import struct
from functools import lru_cache
from pathlib import Path


# Grid constants (from MapDefines.h / GridDefines.h)
MAX_NUMBER_OF_GRIDS = 64
SIZE_OF_GRIDS = 533.3333
MAP_RESOLUTION = 128  # cells per grid (V8 dimension)
CENTER_GRID_ID = MAX_NUMBER_OF_GRIDS // 2  # 32
INVALID_HEIGHT = -100000.0

# Map file magic and version
MAP_MAGIC = b'MAPS'
MAP_VERSION = 9
HEIGHT_MAGIC = b'MHGT'

# Height data flags
MAP_HEIGHT_NO_HEIGHT = 0x0001
MAP_HEIGHT_AS_INT16 = 0x0002
MAP_HEIGHT_AS_INT8 = 0x0004
MAP_HEIGHT_HAS_FLIGHT_BOUNDS = 0x0008

# File header: mapMagic(4) + versionMagic(4) + buildMagic(4) +
#   areaMapOffset(4) + areaMapSize(4) +
#   heightMapOffset(4) + heightMapSize(4) +
#   liquidMapOffset(4) + liquidMapSize(4) +
#   holesOffset(4) + holesSize(4)
FILE_HEADER_FORMAT = '<III II II II II'
FILE_HEADER_SIZE = struct.calcsize(FILE_HEADER_FORMAT)  # 44 bytes

# Height header: fourcc(4) + flags(4) + gridHeight(4) + gridMaxHeight(4)
HEIGHT_HEADER_FORMAT = '<4sIff'
HEIGHT_HEADER_SIZE = struct.calcsize(HEIGHT_HEADER_FORMAT)  # 16 bytes

# V9 = 129x129, V8 = 128x128
V9_SIZE = 129 * 129
V8_SIZE = 128 * 128

# Hole data
HOLETAB_H = [0x1111, 0x2222, 0x4444, 0x8888]
HOLETAB_V = [0x000F, 0x00F0, 0x0F00, 0xF000]


AREA_MAGIC = b'AREA'
AREA_HEADER_FORMAT = '<4sHH'  # fourcc(4) + flags(2) + gridArea(2)
AREA_HEADER_SIZE = struct.calcsize(AREA_HEADER_FORMAT)  # 8 bytes
MAP_AREA_NO_AREA = 0x0001


class GridHeightData:
    """Height data for a single grid tile."""

    __slots__ = ('grid_height', 'grid_max_height', 'v9', 'v8',
                 'format', 'multiplier', 'holes', 'valid',
                 'grid_area', 'area_map')

    def __init__(self):
        self.grid_height = 0.0
        self.grid_max_height = 0.0
        self.grid_area = 0      # Default area ID for entire grid
        self.area_map = None    # 16x16 area ID map, or None (uniform grid)
        self.v9 = None  # 129x129 height values (corner vertices)
        self.v8 = None  # 128x128 height values (cell centers)
        self.format = 'flat'  # 'flat', 'float', 'int16', 'int8'
        self.multiplier = 0.0
        self.holes = None  # 16x16 uint16 hole mask, or None
        self.valid = False

    def get_area(self, x, y):
        """Get area ID at normalized grid coordinates.

        Uses the 16x16 area map (same coordinate transform as height).
        Matches GridTerrainData::getArea() in C++.
        """
        if self.area_map is None:
            return self.grid_area

        # Area map is 16x16 (each cell covers 8x8 height cells)
        lx = int(x / 8) & 15
        ly = int(y / 8) & 15
        return self.area_map[lx * 16 + ly]

    def is_hole(self, row, col):
        """Check if a cell has a terrain hole."""
        if self.holes is None:
            return False
        cell_row = row // 8
        cell_col = col // 8
        hole_row = (row % 8) // 2
        hole_col = (col - cell_col * 8) // 2
        hole = self.holes[cell_row * 16 + cell_col]
        return (hole & HOLETAB_H[hole_col] & HOLETAB_V[hole_row]) != 0

    def get_height(self, x, y):
        """Get interpolated height at normalized grid coordinates.

        x, y are already transformed to grid-local coordinates:
          x = MAP_RESOLUTION * (32 - world_x / SIZE_OF_GRIDS)
          y = MAP_RESOLUTION * (32 - world_y / SIZE_OF_GRIDS)
        Then masked to [0, MAP_RESOLUTION).
        """
        if self.format == 'flat':
            return self.grid_height

        x_int = int(x)
        y_int = int(y)
        x_frac = x - x_int
        y_frac = y - y_int
        x_int &= (MAP_RESOLUTION - 1)  # 0-127
        y_int &= (MAP_RESOLUTION - 1)

        if self.is_hole(x_int, y_int):
            return INVALID_HEIGHT

        if self.format == 'float':
            return self._interpolate_float(x_int, y_int, x_frac, y_frac)
        else:
            return self._interpolate_int(x_int, y_int, x_frac, y_frac)

    def _interpolate_float(self, x_int, y_int, x, y):
        """Triangle interpolation for float height data.

        Cell layout (matching C++ exactly):
          h1-------h2     h1 = v9[x_int * 129 + y_int]
          | \\  1  / |     h2 = v9[(x_int+1) * 129 + y_int]
          | 2  h5 3 |     h3 = v9[x_int * 129 + (y_int+1)]
          | /  4  \\ |     h4 = v9[(x_int+1) * 129 + (y_int+1)]
          h3-------h4     h5 = v8[x_int * 128 + y_int]
        """
        v9 = self.v9
        v8 = self.v8

        if x + y < 1:
            if x > y:
                # Triangle 1 (h1, h2, h5)
                h1 = v9[x_int * 129 + y_int]
                h2 = v9[(x_int + 1) * 129 + y_int]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h2 - h1
                b = h5 - h1 - h2
                c = h1
            else:
                # Triangle 2 (h1, h3, h5)
                h1 = v9[x_int * 129 + y_int]
                h3 = v9[x_int * 129 + y_int + 1]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h5 - h1 - h3
                b = h3 - h1
                c = h1
        else:
            if x > y:
                # Triangle 3 (h2, h4, h5)
                h2 = v9[(x_int + 1) * 129 + y_int]
                h4 = v9[(x_int + 1) * 129 + y_int + 1]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h2 + h4 - h5
                b = h4 - h2
                c = h5 - h4
            else:
                # Triangle 4 (h3, h4, h5)
                h3 = v9[x_int * 129 + y_int + 1]
                h4 = v9[(x_int + 1) * 129 + y_int + 1]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h4 - h3
                b = h3 + h4 - h5
                c = h5 - h4

        return a * x + b * y + c

    def _interpolate_int(self, x_int, y_int, x, y):
        """Triangle interpolation for uint8/uint16 height data.

        Uses pointer arithmetic matching the C++ implementation:
          V9_h1_ptr = &v9[x_int * 128 + x_int + y_int]
          (which equals x_int * 129 + y_int)
        """
        v9 = self.v9
        v8 = self.v8
        base = x_int * 128 + x_int + y_int  # = x_int * 129 + y_int

        if x + y < 1:
            if x > y:
                h1 = v9[base]
                h2 = v9[base + 129]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h2 - h1
                b = h5 - h1 - h2
                c = h1
            else:
                h1 = v9[base]
                h3 = v9[base + 1]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h5 - h1 - h3
                b = h3 - h1
                c = h1
        else:
            if x > y:
                h2 = v9[base + 129]
                h4 = v9[base + 130]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h2 + h4 - h5
                b = h4 - h2
                c = h5 - h4
            else:
                h3 = v9[base + 1]
                h4 = v9[base + 130]
                h5 = 2 * v8[x_int * 128 + y_int]
                a = h4 - h3
                b = h3 + h4 - h5
                c = h5 - h4

        return (a * x + b * y + c) * self.multiplier + self.grid_height


class MapHeightReader:
    """Reads terrain height from AzerothCore extracted .map files.

    Usage:
        reader = MapHeightReader(Path('/workspace/project/data/maps'))
        height = reader.get_height(map_id=0, x=-8949.95, y=-132.493)
    """

    def __init__(self, maps_dir: Path, cache_size: int = 64):
        self.maps_dir = maps_dir
        if not maps_dir.exists():
            raise FileNotFoundError(f"Maps directory not found: {maps_dir}")
        # Override default cache size
        self._load_grid = lru_cache(maxsize=cache_size)(self._load_grid_impl)

    def get_grid_file(self, map_id: int, grid_x: int, grid_y: int) -> Path:
        """Get the .map file path for a grid tile.

        Filename format: {mapId:03d}{gridX:02d}{gridY:02d}.map
        (matching GridTerrainLoader.cpp)
        """
        return self.maps_dir / f"{map_id:03d}{grid_x:02d}{grid_y:02d}.map"

    @staticmethod
    def world_to_grid(x: float, y: float):
        """Convert world coordinates to grid file indices and cell position.

        Returns (grid_x, grid_y, local_x, local_y) where:
          - grid_x, grid_y: which .map file to load
          - local_x, local_y: position within grid (0-128 range)
        """
        # Grid indices (which .map file)
        grid_x = int(CENTER_GRID_ID - x / SIZE_OF_GRIDS)
        grid_y = int(CENTER_GRID_ID - y / SIZE_OF_GRIDS)

        # Local coordinates within grid (0-128 range for cell lookup)
        local_x = MAP_RESOLUTION * (CENTER_GRID_ID - x / SIZE_OF_GRIDS)
        local_y = MAP_RESOLUTION * (CENTER_GRID_ID - y / SIZE_OF_GRIDS)

        return grid_x, grid_y, local_x, local_y

    def get_area(self, map_id: int, x: float, y: float) -> int:
        """Get area ID at world coordinates.

        Returns 0 if no area data available.
        """
        grid_x, grid_y, local_x, local_y = self.world_to_grid(x, y)

        if grid_x < 0 or grid_x >= MAX_NUMBER_OF_GRIDS:
            return 0
        if grid_y < 0 or grid_y >= MAX_NUMBER_OF_GRIDS:
            return 0

        grid = self._load_grid(map_id, grid_x, grid_y)
        if grid is None or not grid.valid:
            return 0

        return grid.get_area(local_x, local_y)

    def get_height(self, map_id: int, x: float, y: float) -> float:
        """Get terrain height at world coordinates.

        Args:
            map_id: Map ID (0=Eastern Kingdoms, 1=Kalimdor, 530=Outland, 571=Northrend, etc.)
            x, y: World coordinates (as stored in creature/gameobject tables)

        Returns:
            Terrain height (Z value), or INVALID_HEIGHT if no data available.
        """
        grid_x, grid_y, local_x, local_y = self.world_to_grid(x, y)

        # Bounds check
        if grid_x < 0 or grid_x >= MAX_NUMBER_OF_GRIDS:
            return INVALID_HEIGHT
        if grid_y < 0 or grid_y >= MAX_NUMBER_OF_GRIDS:
            return INVALID_HEIGHT

        grid = self._load_grid(map_id, grid_x, grid_y)
        if grid is None or not grid.valid:
            return INVALID_HEIGHT

        return grid.get_height(local_x, local_y)

    def _load_grid_impl(self, map_id: int, grid_x: int, grid_y: int):
        """Load a grid's height data from its .map file (cached via LRU)."""
        map_file = self.get_grid_file(map_id, grid_x, grid_y)
        if not map_file.exists():
            return None

        try:
            with open(map_file, 'rb') as f:
                return self._parse_map_file(f)
        except Exception:
            return None

    def _parse_map_file(self, f) -> GridHeightData:
        """Parse a .map file and extract height data."""
        grid = GridHeightData()

        # Read file header
        header_data = f.read(FILE_HEADER_SIZE)
        if len(header_data) < FILE_HEADER_SIZE:
            return grid

        (magic, version, build,
         area_offset, area_size,
         height_offset, height_size,
         liquid_offset, liquid_size,
         holes_offset, holes_size) = struct.unpack(FILE_HEADER_FORMAT, header_data)

        # Validate magic and version
        if struct.pack('<I', magic) != MAP_MAGIC or version != MAP_VERSION:
            return grid

        # Load area data
        if area_offset and area_size:
            f.seek(area_offset)
            area_hdr = f.read(AREA_HEADER_SIZE)
            if len(area_hdr) >= AREA_HEADER_SIZE:
                area_fourcc, area_flags, area_grid_area = struct.unpack(
                    AREA_HEADER_FORMAT, area_hdr)
                if area_fourcc == AREA_MAGIC:
                    grid.grid_area = area_grid_area
                    if not (area_flags & MAP_AREA_NO_AREA):
                        area_data = f.read(16 * 16 * 2)  # 512 bytes
                        if len(area_data) == 16 * 16 * 2:
                            grid.area_map = struct.unpack(f'<{16*16}H', area_data)

        # Load holes data (needed for height queries)
        if holes_offset and holes_size:
            f.seek(holes_offset)
            holes_data = f.read(16 * 16 * 2)  # 512 bytes
            if len(holes_data) == 16 * 16 * 2:
                grid.holes = struct.unpack(f'<{16*16}H', holes_data)

        # Load height data
        if not height_offset:
            grid.valid = True  # No height section = flat grid
            return grid

        f.seek(height_offset)
        hdr_data = f.read(HEIGHT_HEADER_SIZE)
        if len(hdr_data) < HEIGHT_HEADER_SIZE:
            return grid

        fourcc, flags, grid_height, grid_max_height = struct.unpack(
            HEIGHT_HEADER_FORMAT, hdr_data)

        if fourcc != HEIGHT_MAGIC:
            return grid

        grid.grid_height = grid_height
        grid.grid_max_height = grid_max_height

        if flags & MAP_HEIGHT_NO_HEIGHT:
            grid.format = 'flat'
            grid.valid = True
            return grid

        if flags & MAP_HEIGHT_AS_INT16:
            # uint16 compressed height
            v9_bytes = f.read(V9_SIZE * 2)
            v8_bytes = f.read(V8_SIZE * 2)
            if len(v9_bytes) < V9_SIZE * 2 or len(v8_bytes) < V8_SIZE * 2:
                return grid
            grid.v9 = struct.unpack(f'<{V9_SIZE}H', v9_bytes)
            grid.v8 = struct.unpack(f'<{V8_SIZE}H', v8_bytes)
            grid.multiplier = (grid_max_height - grid_height) / 65535.0
            grid.format = 'int16'

        elif flags & MAP_HEIGHT_AS_INT8:
            # uint8 compressed height
            v9_bytes = f.read(V9_SIZE)
            v8_bytes = f.read(V8_SIZE)
            if len(v9_bytes) < V9_SIZE or len(v8_bytes) < V8_SIZE:
                return grid
            grid.v9 = struct.unpack(f'<{V9_SIZE}B', v9_bytes)
            grid.v8 = struct.unpack(f'<{V8_SIZE}B', v8_bytes)
            grid.multiplier = (grid_max_height - grid_height) / 255.0
            grid.format = 'int8'

        else:
            # Float height data
            v9_bytes = f.read(V9_SIZE * 4)
            v8_bytes = f.read(V8_SIZE * 4)
            if len(v9_bytes) < V9_SIZE * 4 or len(v8_bytes) < V8_SIZE * 4:
                return grid
            grid.v9 = struct.unpack(f'<{V9_SIZE}f', v9_bytes)
            grid.v8 = struct.unpack(f'<{V8_SIZE}f', v8_bytes)
            grid.format = 'float'

        grid.valid = True
        return grid
