"""F-216: does a pack's model RENDER the same as stock? (a tool re-save, not an upgrade)

Packs ship many classic models re-saved by an M2 tool: same vertices, triangles, textures and
materials, but offsets shifted by padding, texture names re-cased, a bone-combo index or a header
count rewritten, flag 0x80 set (zangarmushroomtree08dead: +53 bytes .m2, +32 bytes .skin). Byte
comparison calls them different; same_render() compares what the client draws:
  m2:   vertices, bones (key id, parent, pivot), animations (id, variation, duration), materials,
        texture records (type, flags, name case-insensitive), every lookup table, colours,
        transparency, texture animations, attachments, particles/ribbons counts
  skin: triangles resolved to model vertex ids per submesh, submesh geoset ids, and batches
        (flags, submesh, material, layer, texture count, the texture / uv / weight / transform combos)
Bone-combo indices, padding, offsets and header counts are ignored: they only move data around.
"""
import struct
from typing import List, Optional, Tuple

_M2 = [('vertices', 0x3C, 48), ('materials', 0x70, 4), ('texlookup', 0x80, 2), ('texunitlk', 0x88, 2),
       ('translk', 0x90, 2), ('uvanimlk', 0x98, 2), ('bonelookup', 0x78, 2), ('keybonelk', 0x34, 2),
       ('animlookup', 0x24, 2), ('globalseq', 0x14, 4)]
_COUNTS = [('colors', 0x48), ('transparency', 0x58), ('uvanims', 0x60), ('attachments', 0xF0), ('events', 0x100),
           ('lights', 0x108), ('cameras', 0x110), ('ribbons', 0x120), ('particles', 0x128)]


def _arr(b: bytes, at: int, stride: int) -> Optional[bytes]:
    if at + 8 > len(b):
        return None
    n, o = struct.unpack_from('<II', b, at)
    return b[o:o + n * stride] if o + n * stride <= len(b) else None


def _m2_sig(b: bytes) -> Optional[tuple]:
    if b[:4] != b'MD20' or len(b) < 0x130:
        return None
    sig = [(k, _arr(b, at, st)) for k, at, st in _M2]
    sig += [(k, struct.unpack_from('<I', b, at)[0]) for k, at in _COUNTS]
    n, o = struct.unpack_from('<II', b, 0x50)
    tex = []
    for i in range(n):
        t, f, ln, no = struct.unpack_from('<4I', b, o + 16 * i)
        tex.append((t, f, b[no:no + ln - 1].decode('latin1').lower().replace('\\', '/') if ln else ''))
    sig.append(('textures', tuple(tex)))
    n, o = struct.unpack_from('<II', b, 0x2C)
    sig.append(('bones', tuple((struct.unpack_from('<iIhH', b, o + 88 * i)[0], struct.unpack_from('<h', b, o + 88 * i + 8)[0],
                                tuple(round(x, 4) for x in struct.unpack_from('<3f', b, o + 88 * i + 76))) for i in range(n))))
    n, o = struct.unpack_from('<II', b, 0x1C)
    sig.append(('anims', tuple(struct.unpack_from('<HHI', b, o + 64 * i) for i in range(n))))
    return tuple(sig)


def _skin_sig(s: bytes) -> Optional[tuple]:
    if s[:4] != b'SKIN' or len(s) < 0x30:
        return None
    nl, ol = struct.unpack_from('<II', s, 4)
    ni, oi = struct.unpack_from('<II', s, 12)
    ns, os_ = struct.unpack_from('<II', s, 28)
    nb, ob = struct.unpack_from('<II', s, 36)
    look = struct.unpack_from(f'<{nl}H', s, ol) if ol + 2 * nl <= len(s) else ()
    idx = struct.unpack_from(f'<{ni}H', s, oi) if oi + 2 * ni <= len(s) else ()
    subs = []
    for j in range(ns):
        gid, lvl, vs, vc, is_, ic = struct.unpack_from('<HHHHHH', s, os_ + 48 * j)
        tris = tuple(look[idx[k]] if idx[k] < len(look) else -1 for k in range(is_, min(is_ + ic, len(idx))))
        subs.append((gid, tris))
    bat = tuple(struct.unpack_from('<BbHHHhHHHHHHH', s, ob + 24 * j) for j in range(nb))
    return (tuple(subs), bat)


def same_render(m2a: bytes, skina: bytes, m2b: bytes, skinb: bytes) -> bool:
    sa, sb = _m2_sig(m2a), _m2_sig(m2b)
    if sa is None or sa != sb:
        return False
    ka, kb = _skin_sig(skina), _skin_sig(skinb)
    return ka is not None and ka == kb
