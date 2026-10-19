"""WMO minimap tile generator (F-217).

Renders top-down minimap tiles directly from our own WMO geometry, instead of
re-using another build's per-group tiles.

Why this exists: a stock WMO minimap tile contains only its own group's
geometry, so a large room reads as sparse pockets on black no matter how
correct the art is (I-371). This renderer composites EVERY group that overlaps
the tile's cell and cuts away roof geometry, so each tile is a complete local
floor map.

Deliberately a manual tool: point it at the groups of an area whose map is
scuffed, check the preview, then write. It is not meant to be run over a whole
WMO unattended.

Tile geometry: tiles sit on a 133.33 yd grid (533.33/4). Groups whose bbox fits
one cell get a single tile and are unambiguous; multi-cell groups also need the
tile index orientation, which is NOT yet calibrated - generate() refuses them
unless allow_multi is set.
"""
import math
import os
import struct
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Tuple

import numpy as np

CELL = 533.33333 / 4
TILE_PX = 256
BLP_HEADER = 1172


# --------------------------------------------------------------------------
# asset lookup

class AssetIndex:
    """Case-insensitive index over one or more extracted asset trees.

    Roots are searched in order, so a zpak that overrides a stock texture wins -
    the same precedence the client sees from the patch MPQs.
    """

    def __init__(self, root):
        self.roots = [Path(r) for r in (root if isinstance(root, (list, tuple)) else [root])]
        self._map: Dict[str, Path] = {}

    def _build(self):
        for r in reversed(self.roots):          # later roots lose to earlier ones
            for base, _dirs, files in os.walk(r):
                b = Path(base)
                for f in files:
                    rel = str((b / f).relative_to(r)).lower().replace("\\", "/")
                    self._map[rel] = b / f

    def get(self, path: str) -> Optional[Path]:
        if not self._map:
            self._build()
        key = path.lower().replace("\\", "/")
        return self._map.get(key) or self._map.get("world/" + key)


# --------------------------------------------------------------------------
# WMO parsing

def _chunks(buf: bytes, start: int = 0) -> Dict[str, Tuple[int, int]]:
    out, off = {}, start
    while off < len(buf) - 8:
        magic = buf[off:off + 4][::-1].decode("ascii", "replace")
        size = struct.unpack_from("<I", buf, off + 4)[0]
        out.setdefault(magic, (off + 8, size))
        off += 8 + size
    return out


def root_materials(root_path: Path) -> List[str]:
    b = Path(root_path).read_bytes()
    c = _chunks(b)
    o, s = c["MOTX"]; motx = b[o:o + s]
    o, s = c["MOMT"]
    names = []
    for i in range(s // 64):
        t1 = struct.unpack_from("<I", b, o + i * 64 + 12)[0]
        names.append(motx[t1:motx.find(b"\0", t1)].decode("ascii", "replace"))
    return names


def group_data(group_path: Path) -> dict:
    b = Path(group_path).read_bytes()
    base = 12 + 8
    bbox = struct.unpack_from("<6f", b, base + 12)
    flags = struct.unpack_from("<I", b, base + 8)[0]
    c = _chunks(b, base + 68)

    def grab(tag):
        if tag not in c:
            return None
        o, s = c[tag]
        return b[o:o + s]

    mopy = np.frombuffer(grab("MOPY"), dtype=np.uint8).reshape(-1, 2)
    uv = grab("MOTV")
    cv = grab("MOCV")
    return dict(
        bbox=bbox, flags=flags,
        verts=np.frombuffer(grab("MOVT"), dtype="<f4").reshape(-1, 3).copy(),
        idx=np.frombuffer(grab("MOVI"), dtype="<u2").reshape(-1, 3).copy(),
        mat=mopy[:, 1].copy(),
        uv=np.frombuffer(uv, dtype="<f4").reshape(-1, 2).copy() if uv else None,
        mocv=np.frombuffer(cv, dtype=np.uint8).reshape(-1, 4).copy() if cv else None,
    )


# --------------------------------------------------------------------------
# rasteriser

class Renderer:
    def __init__(self, wmo_dir: Path, root_name: str, assets: AssetIndex):
        self.dir = Path(wmo_dir)
        self.root = next((f for f in self.dir.iterdir()
                          if f.name.lower() == f"{root_name}.wmo".lower()),
                         self.dir / f"{root_name}.wmo")
        self.assets = assets
        self.materials = root_materials(self.root)
        self._tex: Dict[str, Optional[np.ndarray]] = {}
        self._groups: Dict[int, dict] = {}
        self._stem = root_name

    def group(self, i: int) -> Optional[dict]:
        if i not in self._groups:
            if not hasattr(self, "_byname"):
                self._byname = {f.name.lower(): f for f in self.dir.iterdir() if f.is_file()}
            p = self._byname.get(f"{self._stem}_{i:03d}.wmo".lower())
            self._groups[i] = group_data(p) if p else None
        return self._groups[i]

    def texture(self, name: str) -> Optional[np.ndarray]:
        if name not in self._tex:
            from lib.blp_image import decode_blp_rgb
            p = self.assets.get(name)
            img = None
            if p:
                try:
                    img = decode_blp_rgb(p)
                except Exception:
                    img = None
            self._tex[name] = img
        return self._tex[name]

    def render(self, groups: Sequence[int], bbox, size=TILE_PX,
               zcut: Optional[float] = None,
               headroom: Optional[float] = None,
               gamma: float = 1.0,
               zwindow=None) -> np.ndarray:
        """Rasterise the groups top-down over bbox.

        zcut     - flat height plane; triangles entirely above it are dropped.
                   May be a dict {group_index: plane} so each group is cut at its
                   OWN height. That matters: a group composited into a neighbour's
                   tile must be sliced exactly as it is in its own tile, or the
                   same geometry renders two different ways and the picture changes
                   as the client swaps tiles (I-371 - Grommash's corridor was cut
                   at z 23.5 inside group 119's tile but z 17.78 inside its own).
        headroom - per-pixel floor mode: first find the LOWEST surface at each
                   pixel, then keep the highest surface within `headroom` yards
                   of it. Follows sloping ground and ignores roofs without
                   punching holes the way a flat plane does.
        """
        x0, y0, _a, x1, y1, _b = bbox
        sw, sh = (size, size) if isinstance(size, int) else size
        col = np.zeros((sh, sw, 3), dtype=np.float32)
        depth = np.full((sh, sw), -1e9, dtype=np.float32)
        ceiling = None
        if headroom is not None:
            floor = np.full((sh, sw), 1e9, dtype=np.float32)
            for gi in groups:
                g = self.group(gi)
                if g is not None:
                    zc = zcut.get(gi) if isinstance(zcut, dict) else zcut
                    self._raster(g, None, floor, x0, y0, x1, y1, (sw, sh), zc,
                                 minz=True, zwindow=zwindow)
            ceiling = floor + float(headroom)
        for gi in groups:
            g = self.group(gi)
            if g is None:
                continue
            zc = zcut.get(gi) if isinstance(zcut, dict) else zcut
            self._raster(g, col, depth, x0, y0, x1, y1, (sw, sh), zc,
                         ceiling=ceiling, zwindow=zwindow)
        if gamma and gamma != 1.0:
            # Lift midtones so an interior reads as a map. Matching stock's average
            # brightness exactly (lv/200) left these halls too dark to read; a gamma
            # curve brightens the floor without blowing highlights the way a bigger
            # linear multiplier did (11.7% blown pixels at lv/96).
            lit = col.sum(axis=2) > 12
            curve = 255.0 * np.power(np.clip(col, 0, 255) / 255.0, gamma)
            col = np.where(lit[..., None], curve, col)
        return np.clip(col, 0, 255).astype(np.uint8)

    def _raster(self, g, col, depth, x0, y0, x1, y1, size, zcut,
                minz=False, ceiling=None, zwindow=None):
        V, I, M, UV, CV = g["verts"], g["idx"], g["mat"], g["uv"], g["mocv"]
        sw, sh = size
        # Axis convention, measured from Blizzard's own tiles: COLUMNS carry world
        # X (increasing), ROWS carry world Y (decreasing, +Y up). Content hugs the
        # left edge and the bottom edge, padding goes right and top. Mapping X to
        # rows instead transposes every tile, which reads as haphazard joins.
        sx = (sw - 1) / max(1e-6, (x1 - x0))
        sy = (sh - 1) / max(1e-6, (y1 - y0))
        for t in range(len(I)):
            if M[t] == 0xFF:
                continue
            tri = I[t]
            p = V[tri]
            if zcut is not None and p[:, 2].min() > zcut:
                continue
            cx = (p[:, 0] - x0) * sx
            cy = (y1 - p[:, 1]) * sy
            lo_x, hi_x = int(max(0, np.floor(cx.min()))), int(min(sw - 1, np.ceil(cx.max())))
            lo_y, hi_y = int(max(0, np.floor(cy.min()))), int(min(sh - 1, np.ceil(cy.max())))
            if lo_x > hi_x or lo_y > hi_y:
                continue
            gx, gy = np.meshgrid(np.arange(lo_x, hi_x + 1), np.arange(lo_y, hi_y + 1))
            d = ((cy[1] - cy[2]) * (cx[0] - cx[2]) + (cx[2] - cx[1]) * (cy[0] - cy[2]))
            if abs(d) < 1e-9:
                continue
            w0 = ((cy[1] - cy[2]) * (gx - cx[2]) + (cx[2] - cx[1]) * (gy - cy[2])) / d
            w1 = ((cy[2] - cy[0]) * (gx - cx[2]) + (cx[0] - cx[2]) * (gy - cy[2])) / d
            w2 = 1.0 - w0 - w1
            inside = (w0 >= -1e-4) & (w1 >= -1e-4) & (w2 >= -1e-4)
            if not inside.any():
                continue
            z = p[:, 2]
            zz = w0 * z[0] + w1 * z[1] + w2 * z[2]
            sub = depth[lo_y:hi_y + 1, lo_x:hi_x + 1]
            if minz:
                hit = inside & (zz < sub)
                if hit.any():
                    sub[hit] = zz[hit]
                continue
            win = inside & (zz > sub)
            if ceiling is not None:
                win &= zz <= ceiling[lo_y:hi_y + 1, lo_x:hi_x + 1]
            if not win.any():
                continue
            name = self.materials[M[t]] if M[t] < len(self.materials) else ""
            tex = self.texture(name)
            if tex is not None and UV is not None:
                tu = w0 * UV[tri[0], 0] + w1 * UV[tri[1], 0] + w2 * UV[tri[2], 0]
                tv = w0 * UV[tri[0], 1] + w1 * UV[tri[1], 1] + w2 * UV[tri[2], 1]
                th, tw = tex.shape[:2]
                c = tex[(np.mod(tv, 1.0) * (th - 1)).astype(np.int32),
                        (np.mod(tu, 1.0) * (tw - 1)).astype(np.int32)].astype(np.float32)
            else:
                c = np.full(w0.shape + (3,), 110.0, dtype=np.float32)
            if CV is not None:
                lv = (w0 * float(CV[tri[0], :3].mean()) + w1 * float(CV[tri[1], :3].mean())
                      + w2 * float(CV[tri[2], :3].mean()))
                # Measured against stock Whitemane tiles: lv/96 clipped at 2.2 came
                # out 2.07x too bright with 11.7% blown pixels (stock: 0.0%).
                c = c * np.clip(lv / 200.0, 0.12, 1.10)[..., None]
            sc = col[lo_y:hi_y + 1, lo_x:hi_x + 1]
            sc[win] = np.clip(c, 0, 255)[win]
            sub[win] = zz[win]


def tiles_for(bbox) -> Tuple[int, int]:
    x0, y0, _a, x1, y1, _b = bbox
    return max(1, math.ceil((x1 - x0) / CELL)), max(1, math.ceil((y1 - y0) / CELL))


def auto_zcut(bbox, fraction: float = 0.40) -> float:
    return bbox[2] + fraction * (bbox[5] - bbox[2])


def tile_resolution(bbox, px_per_yard: float = 2.0,
                    lo: int = 32, hi: int = 256) -> Tuple[int, int]:
    """Pixel size for a tile, matching the stock convention.

    Stock tiles are NOT square: a dimension is the next power of two at or above
    (yards * 2), clamped to [32, 256]. This reproduces only 48 of 106 stock
    Orgrimmar tiles exactly, so it is an approximation of Blizzard's choice, not
    the rule itself.

    That is fine, because resolution is a DETAIL knob, not a scale: the client
    stretches the tile's full UV 0..1 over the group's bbox, and the renderer
    covers that same bbox, so the round trip is the identity whatever resolution
    is picked. What resolution does control is pixel density, and pow2 rounding
    per axis can leave pixels up to 2x anisotropic; stock tracks the bbox aspect
    to within 5% (median over 106 tiles), so it is the better model to follow if
    this is ever tightened up.
    """
    def p2(v):
        n = lo
        while n < v and n < hi:
            n *= 2
        return min(hi, max(lo, n))
    x0, y0, _a, x1, y1, _b = bbox
    # Per-axis, independently. The client derives the CELL from this same pow2
    # of the bbox, so the texture's aspect must match it: shipping a square
    # 256x256 for a group whose pow2 is 256x128 makes the client squash it 2x
    # vertically (I-371 - "second room stretched almost vertically").
    return p2((x1 - x0) * px_per_yard), p2((y1 - y0) * px_per_yard)
