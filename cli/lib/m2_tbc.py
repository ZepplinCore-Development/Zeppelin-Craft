"""TBC-format (MD20 v256-263) M2 -> WotLK v264 M2 + .skin, for the F-216 model viewer.

The 3.3.5 client loads both formats; the viewer engine reads only v264. TBC differs in:
  - header: extra playableAnimationLookup (0x2C) and textureFlipbooks (0x6C) arrays,
    and `views` is an M2Array of INLINE skin profiles (v264: a count, skins in NN.skin)
  - sequences: start/end on one shared timeline (68 bytes) vs a duration (64 bytes)
  - every M2Track: ranges + flat timestamps + flat values (28 bytes) vs one
    timestamp/value sub-array per sequence (20 bytes); M2TrackBase 20 -> 12
  - bones: no name CRC (108 bytes) vs 88

Lights, cameras, ribbons and particles are dropped (counted in `dropped`) - they
are effects, not geometry, and their structs need a much larger port.
"""
import struct
from typing import Dict, List, Tuple

V264_HEADER = 0x130


class _Writer:
    def __init__(self, header_size: int):
        self.buf = bytearray(header_size)

    def put(self, data: bytes, align: int = 16) -> int:
        pad = (-len(self.buf)) % align
        self.buf += b'\0' * pad
        at = len(self.buf)
        self.buf += data
        return at

    def array(self, data: bytes, count: int) -> bytes:
        """Append data, return the 8-byte M2Array (count, offset)."""
        if not count:
            return struct.pack('<II', 0, 0)
        return struct.pack('<II', count, self.put(data))


def _arr(d: bytes, o: int) -> Tuple[int, int]:
    return struct.unpack_from('<II', d, o)


def _raw(d: bytes, o: int, size: int) -> Tuple[int, bytes]:
    n, off = _arr(d, o)
    return n, d[off:off + n * size] if n else b''


class _TrackConv:
    """Converts TBC M2Track / M2TrackBase into v264 form against the model's sequences."""

    def __init__(self, d: bytes, w: _Writer, seqs: List[Tuple[int, int]]):
        self.d, self.w, self.seqs = d, w, seqs

    def _split(self, o: int):
        interp, gseq = struct.unpack_from('<Hh', self.d, o)
        nr, orr = _arr(self.d, o + 4)
        nt, ot = _arr(self.d, o + 12)
        times = list(struct.unpack_from(f'<{nt}I', self.d, ot)) if nt else []
        ranges = [struct.unpack_from('<II', self.d, orr + 8 * i) for i in range(nr)]
        if gseq >= 0:                                  # global sequence: one timeline
            return interp, gseq, [list(range(nt))], [times]
        groups, rebased = [], []
        for si, (start, end) in enumerate(self.seqs):
            if len(ranges) == len(self.seqs) and nt:
                a, b = ranges[si]
                idx = [i for i in range(a, min(b + 1, nt))] if b >= a else []
            else:
                idx = [i for i, t in enumerate(times) if start <= t <= end]
            groups.append(idx)
            # keys before the sequence start (seen on TBC event tracks) stay at their time
            rebased.append([times[i] - start if times[i] >= start else times[i] for i in idx])
        return interp, gseq, groups, rebased

    def _outer(self, subs: List[bytes], counts: List[int]) -> bytes:
        inner = b''.join(self.w.array(b, c) for b, c in zip(subs, counts))
        return self.w.array(inner, len(subs))

    def track(self, o: int, vsize: int) -> bytes:
        interp, gseq, groups, times = self._split(o)
        nv, ov = _arr(self.d, o + 20)
        vals = [b''.join(self.d[ov + vsize * i: ov + vsize * (i + 1)] for i in g if i < nv) for g in groups]
        ts = [struct.pack(f'<{len(t)}I', *t) for t in times]
        counts = [len(t) for t in times]
        return struct.pack('<Hh', interp, gseq) + self._outer(ts, counts) + self._outer(vals, counts)

    def track_base(self, o: int) -> bytes:
        interp, gseq, groups, times = self._split(o)
        ts = [struct.pack(f'<{len(t)}I', *t) for t in times]
        return struct.pack('<Hh', interp, gseq) + self._outer(ts, [len(t) for t in times])


def convert(d: bytes) -> Tuple[bytes, List[bytes], Dict[str, int]]:
    """TBC MD20 bytes -> (v264 m2 bytes, [skin bytes per view], dropped effect counts)."""
    if d[:4] != b'MD20':
        raise ValueError('not an MD20 model')
    ver = struct.unpack_from('<I', d, 4)[0]
    if not 256 <= ver < 264:
        raise ValueError(f'not a TBC-format model (v{ver})')
    w = _Writer(V264_HEADER)
    h = bytearray(V264_HEADER)
    struct.pack_into('<4sI', h, 0, b'MD20', 264)

    def copy_arr(src_o: int, size: int) -> bytes:
        n, raw = _raw(d, src_o, size)
        return w.array(raw, n)

    # name, flags, global sequences
    h[0x08:0x10] = copy_arr(0x08, 1)
    struct.pack_into('<I', h, 0x10, struct.unpack_from('<I', d, 0x10)[0] & ~0x8)   # no blend-map block
    h[0x14:0x1C] = copy_arr(0x14, 4)

    # sequences: start/end -> duration; flag 0x20 = keyframes live in this file (no .anim)
    ns, os_ = _arr(d, 0x1C)
    seqs, out = [], b''
    for i in range(ns):
        (sid, var, start, end, speed, flags, freq, pad, rmin, rmax, blend) = struct.unpack_from('<HHIIfIhHIII', d, os_ + 68 * i)
        bounds = d[os_ + 68 * i + 40: os_ + 68 * i + 68]          # 6f bbox, radius, next, alias
        seqs.append((start, end))
        out += struct.pack('<HHIfIhHIII', sid, var, max(end - start, 1), speed, flags | 0x20, freq, pad, rmin, rmax, blend) + bounds
    h[0x1C:0x24] = w.array(out, ns)
    h[0x24:0x2C] = copy_arr(0x24, 2)                              # sequence lookup
    tc = _TrackConv(d, w, seqs)

    # bones: 108 -> 88 (CRC 0, tracks converted)
    nb, ob = _arr(d, 0x34)
    out = b''
    for i in range(nb):
        o = ob + 108 * i
        out += d[o:o + 12] + b'\0\0\0\0'
        out += tc.track(o + 12, 12) + tc.track(o + 40, 8) + tc.track(o + 68, 12)
        out += d[o + 96:o + 108]
    h[0x2C:0x34] = w.array(out, nb)
    h[0x34:0x3C] = copy_arr(0x3C, 2)                              # key bone lookup
    h[0x3C:0x44] = copy_arr(0x44, 48)                             # vertices
    nviews, ovw = _arr(d, 0x4C)
    struct.pack_into('<I', h, 0x44, nviews)

    # colors (color C3Vector + alpha fixed16), 56 -> 40
    n, o0 = _arr(d, 0x54)
    h[0x48:0x50] = w.array(b''.join(tc.track(o0 + 56 * i, 12) + tc.track(o0 + 56 * i + 28, 2) for i in range(n)), n)
    # textures: type, flags, filename
    n, o0 = _arr(d, 0x5C)
    out = b''
    for i in range(n):
        tt, tf = struct.unpack_from('<II', d, o0 + 16 * i)
        ln, so = _arr(d, o0 + 16 * i + 8)
        out += struct.pack('<II', tt, tf) + w.array(d[so:so + ln], ln)
    h[0x50:0x58] = w.array(out, n)
    # transparency (fixed16), 28 -> 20
    n, o0 = _arr(d, 0x64)
    h[0x58:0x60] = w.array(b''.join(tc.track(o0 + 28 * i, 2) for i in range(n)), n)
    # texture animations: translation C3Vector, rotation C4Quaternion, scale C3Vector; 84 -> 60
    n, o0 = _arr(d, 0x74)
    h[0x60:0x68] = w.array(b''.join(tc.track(o0 + 84 * i, 12) + tc.track(o0 + 84 * i + 28, 16) +
                                    tc.track(o0 + 84 * i + 56, 12) for i in range(n)), n)
    h[0x68:0x70] = copy_arr(0x7C, 2)                              # texture replace lookup
    h[0x70:0x78] = copy_arr(0x84, 4)                              # materials
    h[0x78:0x80] = copy_arr(0x8C, 2)                              # bone lookup
    h[0x80:0x88] = copy_arr(0x94, 2)                              # texture lookup
    h[0x88:0x90] = copy_arr(0x9C, 2)                              # texture unit lookup
    h[0x90:0x98] = copy_arr(0xA4, 2)                              # transparency lookup
    h[0x98:0xA0] = copy_arr(0xAC, 2)                              # uv animation lookup
    h[0xA0:0xD8] = d[0xB4:0xEC]                                   # bounding + collision boxes/radii
    h[0xD8:0xE0] = copy_arr(0xEC, 2)                              # collision indices
    h[0xE0:0xE8] = copy_arr(0xF4, 12)                             # collision positions
    h[0xE8:0xF0] = copy_arr(0xFC, 12)                             # collision normals
    # attachments: id, bone, unk, position, animate track (uint8); 48 -> 40
    n, o0 = _arr(d, 0x104)
    h[0xF0:0xF8] = w.array(b''.join(d[o0 + 48 * i: o0 + 48 * i + 20] + tc.track(o0 + 48 * i + 20, 1) for i in range(n)), n)
    h[0xF8:0x100] = copy_arr(0x10C, 2)                            # attachment lookup
    # events: identifier, data, bone, position, enabled M2TrackBase; 44 -> 36
    n, o0 = _arr(d, 0x114)
    h[0x100:0x108] = w.array(b''.join(d[o0 + 44 * i: o0 + 44 * i + 24] + tc.track_base(o0 + 44 * i + 24) for i in range(n)), n)
    dropped = {k: _arr(d, o)[0] for k, o in (('lights', 0x11C), ('cameras', 0x124), ('ribbons', 0x134), ('particles', 0x13C))}
    # lights (0x108), cameras (0x110), camera lookup (0x118), ribbons (0x120), particles (0x128): left empty
    w.buf[:V264_HEADER] = h

    # inline skin profiles -> standalone .skin files (offsets become skin-relative)
    skins = []
    for v in range(nviews):
        o = ovw + 44 * v
        sw = _Writer(48)
        sh = bytearray(48)
        sh[0:4] = b'SKIN'
        for k, size in enumerate((2, 2, 4, 48, 24)):
            n, raw = _raw(d, o + 8 * k, size)
            sh[4 + 8 * k: 12 + 8 * k] = sw.array(raw, n)
        sh[44:48] = d[o + 40:o + 44]                               # boneCountMax
        sw.buf[:48] = sh
        skins.append(bytes(sw.buf))
    return bytes(w.buf), skins, dropped
