"""F-216: every animated track of a WotLK (MD20 v264) model, and adding an alias sequence.

A track (M2Track: u16 interpolation, i16 global sequence, M2Array timestamps, M2Array values; an
M2TrackBase has no values) holds one entry per SEQUENCE in its outer arrays, aliases included (stock
NorthrendBearMount: 46 sequences, 12 aliases flagged 0x61, every bone track 46 entries), unless it runs
on a global sequence. Adding a sequence therefore appends one (empty) outer entry to every such track.

add_aliases() fills classic animations a converted retail model lacks: the 3.3.5 client falls back to the
missing id's PARENT (AnimationData.fallback: SpellCast 32 -> AttackUnarmed 16, a skeleton mage punching
instead of casting); a more specific CHILD the model has (SpellCastArea 33, SpellCastOmni 54 - whose
fallback chain reaches 32) is the better stand-in, as the community maldraxxusskeleton did by hand.
The alias owns no data (flags 0x61 like stock, aliasNext = the stand-in's primary), so no .anim file.
"""
import struct
from typing import Dict, Iterable, List, Optional, Tuple

SEQ_STRIDE = 0x40
# header M2Array offsets (WotLK v264)
H_SEQ, H_SEQ_LOOKUP = 0x1C, 0x24
# (header array offset, record stride, [(track offset, has values)])
TRACKS = [
    (0x2C, 88, [(0x10, True), (0x24, True), (0x38, True)]),                     # bones: T, R, S
    (0x48, 40, [(0x00, True), (0x14, True)]),                                   # colors: rgb, alpha
    (0x58, 20, [(0x00, True)]),                                                 # texture weights
    (0x60, 60, [(0x00, True), (0x14, True), (0x28, True)]),                     # texture transforms
    (0xF0, 40, [(0x14, True)]),                                                 # attachments: animate
    (0x100, 36, [(0x18, False)]),                                               # events (M2TrackBase)
    (0x108, 156, [(o, True) for o in (16, 36, 56, 76, 96, 116, 136)]),          # lights
    (0x110, 100, [(16, True), (48, True), (80, True)]),                         # cameras: pos, target, roll
    (0x120, 176, [(36, True), (56, True), (76, True), (96, True), (132, True), (152, True)]),   # ribbons
    (0x128, 476, [(o, True) for o in (0x34, 0x48, 0x5C, 0x70, 0x84, 0x98, 0xB0, 0xC8, 0xDC, 0xF0, 0x1C8)]),  # particles
]


def tracks(d: bytes) -> List[Tuple[int, bool]]:
    """(file offset of the track, has values) for every track in the model."""
    out = []
    for h, stride, offs in TRACKS:
        n, o = struct.unpack_from('<II', d, h)
        if not n:
            continue
        for i in range(n):
            for to, hv in offs:
                out.append((o + stride * i + to, hv))
    return out


def check(d: bytes) -> List[str]:
    """Layout sanity: every non-global track has 0, 1 (a constant: stock cameras, particles, colours) or
    nSequences outer entries, and as many values as timestamps."""
    ns = struct.unpack_from('<I', d, H_SEQ)[0]
    bad = []
    for at, hv in tracks(d):
        gs = struct.unpack_from('<h', d, at + 2)[0]
        tc = struct.unpack_from('<I', d, at + 4)[0]
        if gs >= 0:
            continue
        if tc not in (0, 1, ns):
            bad.append(f'track @{at:#x}: {tc} entries for {ns} sequences')
        if hv and struct.unpack_from('<I', d, at + 12)[0] != tc:
            bad.append(f'track @{at:#x}: values {struct.unpack_from("<I", d, at + 12)[0]} != timestamps {tc}')
    return bad


def _append(buf: bytearray, blob: bytes) -> int:
    while len(buf) % 16:
        buf.append(0)
    at = len(buf)
    buf += blob
    return at


def anim_ids(d: bytes) -> Dict[int, int]:
    """{animation id: index of its first sequence}."""
    ns, os_ = struct.unpack_from('<II', d, H_SEQ)
    out: Dict[int, int] = {}
    for i in range(ns):
        out.setdefault(struct.unpack_from('<H', d, os_ + SEQ_STRIDE * i)[0], i)
    return out


def _primary(d: bytes, i: int) -> int:
    """Follow alias links to the sequence that owns the data."""
    ns, os_ = struct.unpack_from('<II', d, H_SEQ)
    seen = set()
    while i not in seen:
        seen.add(i)
        fl = struct.unpack_from('<I', d, os_ + SEQ_STRIDE * i + 12)[0]
        if not (fl & 0x40) or (fl & 0x20 and struct.unpack_from('<H', d, os_ + SEQ_STRIDE * i + 62)[0] == i):
            return i
        nxt = struct.unpack_from('<H', d, os_ + SEQ_STRIDE * i + 62)[0]
        if nxt >= ns:
            return i
        i = nxt
    return i


def add_aliases(data: bytes, pairs: Iterable[Tuple[int, int]]) -> bytes:
    """Append an alias sequence per (missing id, stand-in id): id -> the stand-in's primary sequence."""
    d = bytearray(data)
    if d[:4] != b'MD20':
        raise ValueError('not an MD20 model')
    if check(bytes(d)):
        raise ValueError('track layout check failed: ' + '; '.join(check(bytes(d))[:3]))
    have = anim_ids(bytes(d))
    pairs = [(x, y) for x, y in pairs if x not in have and y in have]
    if not pairs:
        return bytes(data)
    ns, os_ = struct.unpack_from('<II', d, H_SEQ)
    seqs = bytearray(d[os_:os_ + SEQ_STRIDE * ns])
    for x, y in pairs:
        src = _primary(bytes(d), have[y])
        rec = bytearray(d[os_ + SEQ_STRIDE * src:os_ + SEQ_STRIDE * (src + 1)])
        struct.pack_into('<HH', rec, 0, x, 0)                       # id, variation 0
        struct.pack_into('<I', rec, 12, struct.unpack_from('<I', rec, 12)[0] | 0x61)   # as stock aliases
        struct.pack_into('<h', rec, 60, -1)                         # no next variation
        struct.pack_into('<H', rec, 62, src)                        # aliasNext -> the data owner
        seqs += rec
    n_new = ns + len(pairs)
    # every per-sequence track gets one empty outer entry per alias (relocated; old copy left unused)
    for at, hv in tracks(bytes(d)):
        gs = struct.unpack_from('<h', d, at + 2)[0]
        tc, to = struct.unpack_from('<II', d, at + 4)
        if gs >= 0 or tc != ns:
            continue
        for k in ((4, 12) if hv else (4,)):
            c, o = struct.unpack_from('<II', d, at + k)
            blob = bytes(d[o:o + 8 * c]) + b'\0' * 8 * len(pairs)
            struct.pack_into('<II', d, at + k, c + len(pairs), _append(d, blob))
    struct.pack_into('<II', d, H_SEQ, n_new, _append(d, bytes(seqs)))
    # the lookup: a hash table (slot id % size, linear probing; stock 1127 of 1298 models) - a direct
    # table is the same thing with size > the largest id. Insert, or rebuild twice the size when full.
    lc, lo = struct.unpack_from('<II', d, H_SEQ_LOOKUP)
    look = list(struct.unpack_from(f'<{lc}h', d, lo)) if lc else []

    def insert(tab, aid, idx):
        for k in range(len(tab)):
            sl = (aid + k) % len(tab)
            if tab[sl] == -1:
                tab[sl] = idx
                return True
        return False

    for k, (x, _) in enumerate(pairs):
        if not look or not insert(look, x, ns + k):
            size = max(16, 2 * (len(look) or 8))
            firsts = sorted(have.items(), key=lambda kv: kv[1]) + [(px, ns + j) for j, (px, _) in enumerate(pairs[:k + 1])]
            look = [-1] * size
            for aid, idx in firsts:
                insert(look, aid, idx)
    struct.pack_into('<II', d, H_SEQ_LOOKUP, len(look), _append(d, struct.pack(f'<{len(look)}h', *look)))
    out = bytes(d)
    if check(out):
        raise ValueError('aliases broke the track layout: ' + '; '.join(check(out)[:3]))
    return out
