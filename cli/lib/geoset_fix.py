"""F-216: creature_geoset_data that asks for geosets the shipped mesh does not have.

creature_geoset_data holds one nibble per geoset group (nibble k = group k+1, value v = geoset
(k+1)*100 + v; a 0 nibble leaves its group unfiltered - wendigo2's face, I-388). A pack's row that names a geoset its own mesh lacks
draws NOTHING for that group: patch-hd-everything gives all 29 wendigo2 displays 801 (0x321),
group 3 asks for 303, its mesh has only 301 - the brows and lip fur vanish, in the picker and in
the real client alike (F-219 check, 2026-10-08). fixed() points such a nibble at the lowest
variant the group really has (303 -> 301): explicit, so nothing rests on what a 0 nibble does
to a multi-variant group (unproven; ALL-zero data = no filtering, every geoset drawn - gnoll2melee
display 123 in the real client wears every variant, 2026-10-08).
"""
import struct
from typing import Iterable, Optional, Set


def mesh_geosets(skin: bytes) -> Set[int]:
    if skin[:4] != b'SKIN' or len(skin) < 0x30:
        return set()
    n, o = struct.unpack_from('<II', skin, 4 + 8 * 3)
    return {struct.unpack_from('<H', skin, o + 48 * j)[0] for j in range(n) if o + 48 * j + 2 <= len(skin)}


def fixed(cgd: int, geosets: Iterable[int]) -> Optional[int]:
    """The geoset data with every nibble naming an absent geoset of a PRESENT group pointed at
    that group's lowest variant (1..15), or None when nothing needs fixing."""
    gs = set(geosets)
    if not cgd or not gs:
        return None
    out = cgd
    for k in range(8):
        v = (cgd >> (4 * k)) & 0xF
        g = k + 1
        have = sorted(x % 100 for x in gs if x // 100 == g and 0 < x % 100 < 16)
        if v and g * 100 + v not in gs and have:
            out = (out & ~(0xF << (4 * k))) | (have[0] << (4 * k))
    return out if out != cgd else None


def pane_mesh(cgd: int) -> tuple:
    """creature_geoset_data -> (engine mesh array, groups to draw unfiltered).

    The engine filters every group its array covers to ONE value (m2Object.cpp:1571), so a 0
    there hides the group. The client leaves a 0-nibble group unfiltered: patch-hd-everything's
    wendigo2 (0x121 after fixed()) draws its face, geoset 401 (group 4, nibble 0), in game
    (I-388, 2026-10-08). The array stops after the last non-zero nibble (groups past its end are
    not filtered); a 0 nibble before that is returned for the pane to promote to geoset 0."""
    nib = [(cgd >> (4 * k)) & 0xF for k in range(8)]
    last = max((k for k in range(8) if nib[k]), default=-1)
    return [0] + nib[:last + 1], [k + 1 for k in range(last) if not nib[k]]
