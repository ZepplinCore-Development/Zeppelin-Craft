"""Deterministic WMO / doodad placement into WotLK ADT tiles (F-209).

ADT binaries are gitignored, so a Noggit edit leaves nothing reviewable in the
repo. This module applies placements from a tracked JSON recipe instead, the
same way `model_transforms.json` handles M2 edits (F-203): the recipe carries
the base and result sha256 so a build can prove it replayed onto the file it
was authored against.

Coordinate spaces
-----------------
MODF/MDDF positions are in the ADT placement space; MCNK header positions are
plain world coordinates. The two are related by::

    world_x = 17066.666 - adt_z
    world_y = 17066.666 - adt_x
    world_z = adt_y

Note the sign flip: converting a bounding box swaps min and max on X and Y.
"""

import hashlib
import json
import math
import struct
from pathlib import Path
from typing import Dict, List, Optional, Tuple

MAP_HALF = 17066.666015625
CHUNK_SIZE = 533.33333 / 16.0

# MHDR is 16 uint32 offsets; these are the ones that point at a chunk.
MHDR_FIELDS = ['flags', 'mcin', 'mtex', 'mmdx', 'mmid', 'mwmo', 'mwid',
               'mddf', 'modf', 'mfbo', 'mh2o', 'mtxf', 'u1', 'u2', 'u3', 'u4']
MHDR_CHUNK_FOR_FIELD = {
    'mcin': 'MCIN', 'mtex': 'MTEX', 'mmdx': 'MMDX', 'mmid': 'MMID',
    'mwmo': 'MWMO', 'mwid': 'MWID', 'mddf': 'MDDF', 'modf': 'MODF',
    'mfbo': 'MFBO', 'mh2o': 'MH2O', 'mtxf': 'MTXF',
}


def world_from_adt(pos: Tuple[float, float, float]) -> Tuple[float, float, float]:
    return (MAP_HALF - pos[2], MAP_HALF - pos[0], pos[1])


def adt_from_world(pos: Tuple[float, float, float]) -> Tuple[float, float, float]:
    return (MAP_HALF - pos[1], pos[2], MAP_HALF - pos[0])


def world_box_from_adt_extents(ext) -> Tuple[float, float, float, float]:
    """(min_x, min_y, max_x, max_y) in world space from a MODF extents sextet."""
    lo = world_from_adt((ext[0], ext[1], ext[2]))
    hi = world_from_adt((ext[3], ext[4], ext[5]))
    return (min(lo[0], hi[0]), min(lo[1], hi[1]),
            max(lo[0], hi[0]), max(lo[1], hi[1]))


class AdtFile:
    """An ADT parsed into ordered top-level chunks, mutable and re-serialisable."""

    def __init__(self, data: bytes):
        self.chunks: List[List] = []          # [magic, payload bytearray]
        off = 0
        while off + 8 <= len(data):
            magic = data[off:off + 4][::-1].decode('latin1')
            size = struct.unpack_from('<I', data, off + 4)[0]
            if off + 8 + size > len(data):
                raise ValueError(f"{magic} at {off} runs past end of file")
            self.chunks.append([magic, bytearray(data[off + 8:off + 8 + size])])
            off += 8 + size
        if off != len(data):
            raise ValueError("trailing bytes after last chunk")

    # -- chunk access ------------------------------------------------------
    def first(self, magic: str) -> Optional[bytearray]:
        for m, payload in self.chunks:
            if m == magic:
                return payload
        return None

    def index_of(self, magic: str) -> Optional[int]:
        for i, (m, _) in enumerate(self.chunks):
            if m == magic:
                return i
        return None

    def mcnks(self) -> List[bytearray]:
        return [p for m, p in self.chunks if m == 'MCNK']

    # -- name tables -------------------------------------------------------
    def _names(self, magic: str) -> List[str]:
        payload = self.first(magic)
        if payload is None:
            return []
        return [s.decode('latin1') for s in bytes(payload).split(b'\0') if s]

    def _add_name(self, str_magic: str, id_magic: str, name: str) -> int:
        """Return the index into the *ID* table for `name`, appending if absent.

        Existing names are resolved through the ID table rather than by
        splitting the string block: a padded string block would otherwise make
        the split-index disagree with the real nameId.
        """
        strs = self.first(str_magic)
        ids = self.first(id_magic)
        if strs is None or ids is None:
            raise ValueError(f"{str_magic}/{id_magic} missing from tile")
        upper = name.upper()
        for i in range(len(ids) // 4):
            at = struct.unpack_from('<I', ids, i * 4)[0]
            end = bytes(strs).find(b'\0', at)
            existing = bytes(strs[at:end if end >= 0 else len(strs)]).decode('latin1')
            if existing.upper() == upper:
                return i
        offset = len(strs)
        strs.extend(name.encode('latin1') + b'\0')
        ids.extend(struct.pack('<I', offset))
        return len(ids) // 4 - 1

    # -- placements --------------------------------------------------------
    def add_wmo(self, model: str, adt_pos, rot, extents, *, uid: int,
                flags: int = 0, doodad_set: int = 0, name_set: int = 0,
                scale: int = 1024) -> int:
        name_id = self._add_name('MWMO', 'MWID', model)
        modf = self.first('MODF')
        if modf is None:
            raise ValueError('MODF missing from tile')
        index = len(modf) // 64
        modf.extend(struct.pack('<II3f3f6f4H', name_id, uid,
                                *adt_pos, *rot, *extents,
                                flags, doodad_set, name_set, scale))
        return index

    def add_doodad(self, model: str, adt_pos, rot, *, uid: int,
                   scale: int = 1024, flags: int = 0) -> int:
        name_id = self._add_name('MMDX', 'MMID', model)
        mddf = self.first('MDDF')
        if mddf is None:
            raise ValueError('MDDF missing from tile')
        index = len(mddf) // 36
        mddf.extend(struct.pack('<II3f3f2H', name_id, uid,
                                *adt_pos, *rot, scale, flags))
        return index

    # -- MCNK references ---------------------------------------------------
    def _mcnk_cell(self, payload: bytearray) -> Tuple[float, float, float, float]:
        """World bounds (min_x, min_y, max_x, max_y) of one MCNK cell."""
        px, py, _ = struct.unpack_from('<3f', payload, 0x68)
        return (px - CHUNK_SIZE, py - CHUNK_SIZE, px, py)

    def add_refs(self, wmo_boxes: List[Tuple[int, Tuple[float, float, float, float]]],
                 doodad_points: List[Tuple[int, Tuple[float, float], float]]) -> Dict:
        """Append MODF/MDDF indices to the MCRF list of every chunk they touch.

        New entries were appended, so existing indices keep their meaning and
        only the counts and the MCRF payload change.
        """
        stats = {'chunks_touched': 0, 'wmo_refs': 0, 'doodad_refs': 0}
        for payload in self.mcnks():
            cx0, cy0, cx1, cy1 = self._mcnk_cell(payload)
            new_doodads = [i for i, (x, y), r in doodad_points
                           if cx0 - r <= x <= cx1 + r and cy0 - r <= y <= cy1 + r]
            new_wmos = [i for i, (bx0, by0, bx1, by1) in wmo_boxes
                        if bx0 <= cx1 and bx1 >= cx0 and by0 <= cy1 and by1 >= cy0]
            if not new_doodads and not new_wmos:
                continue
            self._insert_refs(payload, new_doodads, new_wmos)
            stats['chunks_touched'] += 1
            stats['wmo_refs'] += len(new_wmos)
            stats['doodad_refs'] += len(new_doodads)
        return stats

    @staticmethod
    def _insert_refs(payload: bytearray, new_doodads: List[int], new_wmos: List[int]):
        n_doodad, ofs_refs, n_wmo = (struct.unpack_from('<I', payload, 0x10)[0],
                                     struct.unpack_from('<I', payload, 0x20)[0],
                                     struct.unpack_from('<I', payload, 0x38)[0])
        if ofs_refs == 0:
            raise ValueError('MCNK has no MCRF sub-chunk')
        # ofs_refs is relative to the MCNK chunk magic, so subtract the 8-byte
        # header to index into the payload, then skip MCRF's own header.
        mcrf_hdr = ofs_refs - 8
        if bytes(payload[mcrf_hdr:mcrf_hdr + 4])[::-1] != b'MCRF':
            raise ValueError('ofsRefs does not point at MCRF')
        old_size = struct.unpack_from('<I', payload, mcrf_hdr + 4)[0]
        data_at = mcrf_hdr + 8
        doodads = payload[data_at:data_at + n_doodad * 4]
        wmos = payload[data_at + n_doodad * 4:data_at + (n_doodad + n_wmo) * 4]
        doodads += b''.join(struct.pack('<I', i) for i in new_doodads)
        wmos += b''.join(struct.pack('<I', i) for i in new_wmos)
        new_block = doodads + wmos
        delta = len(new_block) - old_size

        payload[data_at:data_at + old_size] = new_block
        struct.pack_into('<I', payload, mcrf_hdr + 4, len(new_block))
        struct.pack_into('<I', payload, 0x10, n_doodad + len(new_doodads))
        struct.pack_into('<I', payload, 0x38, n_wmo + len(new_wmos))

        # Everything stored after MCRF moves. MCVT/MCNR/MCLY precede it.
        for hdr_off in (0x24, 0x2C, 0x58, 0x60, 0x74, 0x78):  # alpha shadow mcse mclq mccv mclv
            val = struct.unpack_from('<I', payload, hdr_off)[0]
            if val > ofs_refs:
                struct.pack_into('<I', payload, hdr_off, val + delta)

    def find_doodad(self, uid: int) -> Optional[int]:
        mddf = self.first('MDDF')
        if mddf is None:
            return None
        for i in range(len(mddf) // 36):
            if struct.unpack_from('<I', mddf, i * 36 + 4)[0] == uid:
                return i
        return None

    def move_doodad(self, index: int, adt_pos, rot, scale: Optional[int] = None
                    ) -> Tuple[Tuple[float, float], Tuple[float, float]]:
        """Rewrite one MDDF entry in place. Returns (old_world_xy, new_world_xy)."""
        mddf = self.first('MDDF')
        at = index * 36
        old = struct.unpack_from('<3f', mddf, at + 8)
        old_scale = struct.unpack_from('<H', mddf, at + 32)[0]
        struct.pack_into('<3f3f2H', mddf, at + 8, *adt_pos, *rot,
                         old_scale if scale is None else scale,
                         struct.unpack_from('<H', mddf, at + 34)[0])
        ow = world_from_adt(old)
        nw = world_from_adt(adt_pos)
        return ((ow[0], ow[1]), (nw[0], nw[1]))

    def retarget_doodad_refs(self, index: int, old_xy, new_xy, radius: float) -> Dict:
        """Move a doodad's MCRF references from the cells it left to the ones it entered."""
        stats = {'refs_added': 0, 'refs_removed': 0}
        for payload in self.mcnks():
            cx0, cy0, cx1, cy1 = self._mcnk_cell(payload)

            def touches(xy):
                return (cx0 - radius <= xy[0] <= cx1 + radius
                        and cy0 - radius <= xy[1] <= cy1 + radius)

            was, now = touches(old_xy), touches(new_xy)
            if was == now:
                continue
            if now:
                self._insert_refs(payload, [index], [])
                stats['refs_added'] += 1
            else:
                self._drop_doodad_ref(payload, index)
                stats['refs_removed'] += 1
        return stats

    @staticmethod
    def _drop_doodad_ref(payload: bytearray, index: int):
        n_doodad = struct.unpack_from('<I', payload, 0x10)[0]
        ofs_refs = struct.unpack_from('<I', payload, 0x20)[0]
        n_wmo = struct.unpack_from('<I', payload, 0x38)[0]
        if ofs_refs == 0:
            return
        mcrf_hdr = ofs_refs - 8
        old_size = struct.unpack_from('<I', payload, mcrf_hdr + 4)[0]
        data_at = mcrf_hdr + 8
        doodads = [struct.unpack_from('<I', payload, data_at + i * 4)[0]
                   for i in range(n_doodad)]
        if index not in doodads:
            return
        doodads.remove(index)
        wmos = payload[data_at + n_doodad * 4:data_at + (n_doodad + n_wmo) * 4]
        new_block = b''.join(struct.pack('<I', i) for i in doodads) + bytes(wmos)
        delta = len(new_block) - old_size
        payload[data_at:data_at + old_size] = new_block
        struct.pack_into('<I', payload, mcrf_hdr + 4, len(new_block))
        struct.pack_into('<I', payload, 0x10, len(doodads))
        for hdr_off in (0x24, 0x2C, 0x58, 0x60, 0x74, 0x78):
            val = struct.unpack_from('<I', payload, hdr_off)[0]
            if val > ofs_refs:
                struct.pack_into('<I', payload, hdr_off, val + delta)

    # -- terrain -----------------------------------------------------------
    # MCVT is 145 floats relative to the MCNK header z: 9 outer then 8 inner
    # vertices per row, rows stepping -x, columns stepping -y from the MCNK
    # header position (the cell's max corner). MCNR is 145 x int8[3] =
    # (nx, ny, nz) * 127 in that same frame. Its size field says 435 and
    # does not count the 13 padding bytes after it, so both are located
    # through the header offsets (0x14 / 0x18), which count from the MCNK magic.
    def _terrain_vertices(self):
        """Yield (payload, mcvt_off, mcnr_off, i, world_x, world_y, abs_z) per vertex."""
        step = CHUNK_SIZE / 8.0
        for payload in self.mcnks():
            px, py, pz = struct.unpack_from('<3f', payload, 0x68)
            # header offsets point at the sub-chunk's magic, counted from the MCNK
            # magic; the payload starts 8 bytes later and the data 8 bytes after that
            mcvt = struct.unpack_from('<I', payload, 0x14)[0]
            mcnr = struct.unpack_from('<I', payload, 0x18)[0]
            for i in range(145):
                row, col = divmod(i, 17)
                if col < 9:
                    fx, fy = row, col
                else:
                    fx, fy = row + 0.5, col - 9 + 0.5
                h = struct.unpack_from('<f', payload, mcvt + i * 4)[0]
                yield payload, mcvt, mcnr, i, px - fx * step, py - fy * step, pz + h

    def height_at(self, x: float, y: float) -> Optional[float]:
        """Ground height at world (x, y), bilinear on the outer vertex grid."""
        step = CHUNK_SIZE / 8.0
        for payload in self.mcnks():
            px, py, pz = struct.unpack_from('<3f', payload, 0x68)
            fx, fy = (px - x) / step, (py - y) / step
            if 0 <= fx <= 8 and 0 <= fy <= 8:
                mcvt = struct.unpack_from('<I', payload, 0x14)[0]
                r, c = min(int(fx), 7), min(int(fy), 7)
                tx, ty = fx - r, fy - c

                def hh(rr, cc):
                    return struct.unpack_from('<f', payload, mcvt + (rr * 17 + cc) * 4)[0]
                return pz + (hh(r, c) * (1 - tx) * (1 - ty) + hh(r + 1, c) * tx * (1 - ty)
                             + hh(r, c + 1) * (1 - tx) * ty + hh(r + 1, c + 1) * tx * ty)
        return None

    def raise_terrain(self, center, z: float, inner: float, outer: float) -> Dict:
        """Raise ground to `z` within `inner` yards of `center` (world x, y),
        blending back to the original height by `outer`. Never lowers.
        Doodads (MDDF) standing in the area ride up by the ground's rise
        under them, so nothing is buried."""
        cx, cy = center
        mddf = self.first('MDDF')
        carry = []
        for k in range(len(mddf) // 36 if mddf is not None else 0):
            wx, wy, wz = world_from_adt(struct.unpack_from('<3f', mddf, k * 36 + 8))
            if math.hypot(wx - cx, wy - cy) < outer:
                carry.append((k, wx, wy, self.height_at(wx, wy)))
        raised, top = 0, 0.0
        for payload, mcvt, _, i, x, y, h in list(self._terrain_vertices()):
            d = math.hypot(x - cx, y - cy)
            if d >= outer or h >= z:
                continue
            w = 1.0 if d <= inner else _smoothstep((outer - d) / (outer - inner))
            new = h + (z - h) * w
            if new - h < 1e-4:
                continue
            pz = struct.unpack_from('<f', payload, 0x70)[0]
            struct.pack_into('<f', payload, mcvt + i * 4, new - pz)
            raised += 1
            top = max(top, new - h)
        carried = []
        for k, wx, wy, before in carry:
            rise = self.height_at(wx, wy) - before
            if rise > 1e-4:
                off = k * 36 + 8 + 4          # adt_pos.y is world z
                struct.pack_into('<f', mddf, off, struct.unpack_from('<f', mddf, off)[0] + rise)
                carried.append((struct.unpack_from('<I', mddf, k * 36 + 4)[0], round(rise, 3)))
        return {'vertices_raised': raised, 'max_raise': round(top, 3), 'doodads_carried': carried}

    def recompute_normals(self, center, radius: float) -> int:
        """Rewrite MCNR for every vertex within `radius` of `center` from the
        current heights, by central differences across chunk borders."""
        step = CHUNK_SIZE / 8.0
        grid = {}
        verts = list(self._terrain_vertices())
        for _, _, _, _, x, y, h in verts:
            grid[(round(x / step * 2), round(y / step * 2))] = h
        cx, cy = center

        def at(kx, ky):
            return grid.get((kx, ky))

        n = 0
        for payload, _, mcnr, i, x, y, h in verts:
            if math.hypot(x - cx, y - cy) > radius:
                continue
            kx, ky = round(x / step * 2), round(y / step * 2)

            def slope(k0, k1, dk):
                hi, lo = at(k0 + dk[0], k1 + dk[1]), at(k0 - dk[0], k1 - dk[1])
                if hi is not None and lo is not None:
                    return (hi - lo) / (2 * step)
                if hi is not None:
                    return (hi - h) / step
                if lo is not None:
                    return (h - lo) / step
                return 0.0

            # neighbours one full vertex step away (2 half-steps) on the same lattice
            dhdx = slope(kx, ky, (2, 0))
            dhdy = slope(kx, ky, (0, 2))
            vec = (-dhdx, -dhdy, 1.0)
            ln = math.sqrt(sum(c * c for c in vec))
            struct.pack_into('<3b', payload, mcnr + i * 3,
                             *(max(-127, min(127, round(c / ln * 127))) for c in vec))
            n += 1
        return n

    # -- serialise ---------------------------------------------------------
    def to_bytes(self) -> bytes:
        # First pass: chunk offsets with final sizes.
        offsets = {}
        mcnk_offsets = []
        pos = 0
        for magic, payload in self.chunks:
            if magic == 'MCNK':
                mcnk_offsets.append((pos, len(payload) + 8))
            else:
                offsets.setdefault(magic, pos)
            pos += 8 + len(payload)

        mcin = self.first('MCIN')
        if mcin is not None:
            if len(mcin) != 256 * 16:
                raise ValueError('MCIN is not 256 entries')
            for i, (off, size) in enumerate(mcnk_offsets):
                struct.pack_into('<II', mcin, i * 16, off, size)

        mhdr = self.first('MHDR')
        if mhdr is not None:
            mhdr_base = offsets['MHDR'] + 8
            vals = list(struct.unpack_from('<16I', mhdr, 0))
            for i, field in enumerate(MHDR_FIELDS):
                chunk = MHDR_CHUNK_FOR_FIELD.get(field)
                if chunk is None or vals[i] == 0:
                    continue
                if chunk not in offsets:
                    raise ValueError(f'MHDR points at missing {chunk}')
                vals[i] = offsets[chunk] - mhdr_base
            struct.pack_into('<16I', mhdr, 0, *vals)

        out = bytearray()
        for magic, payload in self.chunks:
            out += magic.encode('latin1')[::-1]
            out += struct.pack('<I', len(payload))
            out += payload
        return bytes(out)


def _smoothstep(t: float) -> float:
    t = max(0.0, min(1.0, t))
    return t * t * (3 - 2 * t)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def apply_recipe(adt_path: Path, entry: Dict, *, strict: bool = True) -> Tuple[bytes, Dict]:
    """Apply one recipe entry to one ADT. Returns (new_bytes, stats)."""
    original = adt_path.read_bytes()
    base = sha256(original)
    if entry.get('base_sha256') and base != entry['base_sha256']:
        if base == entry.get('result_sha256'):
            return original, {'skipped': 'already applied'}
        msg = (f"{adt_path.name}: base sha256 {base[:16]} does not match recipe "
               f"{entry['base_sha256'][:16]}")
        if strict:
            raise ValueError(msg)

    adt = AdtFile(original)
    wmo_boxes, doodad_points = [], []

    for w in entry.get('wmo', []):
        idx = adt.add_wmo(w['model'], w['adt_pos'], w['rot'], w['extents'],
                          uid=w['uid'], flags=w.get('flags', 0),
                          doodad_set=w.get('doodad_set', 0),
                          name_set=w.get('name_set', 0),
                          scale=w.get('scale', 1024))
        wmo_boxes.append((idx, world_box_from_adt_extents(w['extents'])))

    for dd in entry.get('doodad', []):
        idx = adt.add_doodad(dd['model'], dd['adt_pos'], dd['rot'], uid=dd['uid'],
                             scale=dd.get('scale', 1024), flags=dd.get('flags', 0))
        wx, wy, _ = world_from_adt(dd['adt_pos'])
        doodad_points.append((idx, (wx, wy), dd.get('radius', 8.0)))

    moved = 0
    for mv in entry.get('move_doodad', []):
        idx = adt.find_doodad(mv['uid'])
        if idx is None:
            raise ValueError(f"no doodad with uid {mv['uid']} in {adt_path.name}")
        old_xy, new_xy = adt.move_doodad(idx, mv['adt_pos'], mv['rot'], mv.get('scale'))
        adt.retarget_doodad_refs(idx, old_xy, new_xy, mv.get('radius', 8.0))
        moved += 1

    stats = adt.add_refs(wmo_boxes, doodad_points)
    stats['doodads_moved'] = moved

    raised = 0
    for tr in entry.get('terrain_raise', []):
        r = adt.raise_terrain(tr['center'], tr['z'], tr['inner_radius'], tr['outer_radius'])
        adt.recompute_normals(tr['center'], tr['outer_radius'] + CHUNK_SIZE / 4)
        raised += r['vertices_raised']
        stats.setdefault('doodads_carried', []).extend(r['doodads_carried'])
    stats['terrain_vertices_raised'] = raised
    out = adt.to_bytes()
    stats.update({'wmos_added': len(wmo_boxes), 'doodads_added': len(doodad_points),
                  'base_sha256': base, 'result_sha256': sha256(out),
                  'size_delta': len(out) - len(original)})
    return out, stats


def load_recipe(path: Path) -> Dict:
    return json.loads(Path(path).read_text())
