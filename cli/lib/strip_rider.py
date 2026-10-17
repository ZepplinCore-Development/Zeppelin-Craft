"""F-220: a riderless mount cut out of a fused rider model (TeronGorefiend_Mounted -> the horse alone).

The rider and the mount are one mesh but (usually) two skeleton branches: every submesh mostly weighted
to the branch that carries the rider's own skin texture is the rider. When the mount hangs from that same
branch (the fel orc and his netherdrake share one root child), a bone is the rider's when the
rider-textured submeshes weigh more on it than the rest, and a submesh is the rider's when most of its
weight lies on rider bones. Pass every rider texture (skin, hair, shoulders, weapon) in that case. Those batches are dropped from every
LOD .skin; the .m2 keeps its bones and animations. Attachment 0 (the seat a rider is placed on) is
moved onto the mount: the fused model's attachment 0 is the rider's hand. The seat goes on the mount
bone nearest the old rider's pelvis, at the pelvis position.
"""
import struct
from collections import Counter
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


def _bones(m2: bytes) -> Tuple[List[int], List[Tuple[float, float, float]]]:
    n, o = struct.unpack_from('<II', m2, 0x2C)
    parent = [struct.unpack_from('<h', m2, o + 88 * i + 8)[0] for i in range(n)]
    pivot = [struct.unpack_from('<3f', m2, o + 88 * i + 76) for i in range(n)]
    return parent, pivot


def _branch(parent: List[int], b: int) -> int:
    """The bone right under the skeleton root on b's chain (the branch b hangs from)."""
    c = [b]
    while parent[c[-1]] >= 0:
        c.append(parent[c[-1]])
    return c[-2] if len(c) > 1 else c[-1]


def _textures(m2: bytes) -> List[Tuple[int, str]]:
    n, o = struct.unpack_from('<II', m2, 0x50)
    out = []
    for i in range(n):
        typ, _f, ln, no = struct.unpack_from('<4I', m2, o + 16 * i)
        out.append((typ, m2[no:no + ln - 1].decode('latin1').replace('\\', '/').lower() if ln else ''))
    return out


def _submesh_branches(m2: bytes, skin: bytes, parent: List[int]) -> List[Counter]:
    vn, vo = struct.unpack_from('<II', m2, 0x3C)
    svn, svo = struct.unpack_from('<II', skin, 0x04)
    sverts = struct.unpack_from(f'<{svn}H', skin, svo)
    sm_n, sm_o = struct.unpack_from('<II', skin, 0x1C)
    out = []
    for i in range(sm_n):
        _sid, _lvl, vst, vcnt = struct.unpack_from('<HHHH', skin, sm_o + 48 * i)
        br = Counter()
        for k in range(vst, vst + vcnt):
            v = sverts[k]
            for w, b in zip(struct.unpack_from('<4B', m2, vo + 48 * v + 12), struct.unpack_from('<4B', m2, vo + 48 * v + 16)):
                if w:
                    br[_branch(parent, b)] += w
        out.append(br)
    return out


def _batches(skin: bytes) -> Tuple[int, int, List[bytes]]:
    n, o = struct.unpack_from('<II', skin, 0x24)
    return n, o, [skin[o + 24 * i:o + 24 * i + 24] for i in range(n)]


def rider_branch(m2: bytes, skin: bytes, rider_textures: Set[str], slots: Set[int] = frozenset()) -> int:
    """The skeleton branch of the rider: where the submeshes drawn with the rider's skin hang."""
    parent, _ = _bones(m2)
    tex = _textures(m2)
    tl_n, tl_o = struct.unpack_from('<II', m2, 0x80)
    tl = struct.unpack_from(f'<{tl_n}H', m2, tl_o)
    br = _submesh_branches(m2, skin, parent)
    votes = Counter()
    for b in _batches(skin)[2]:
        sub, combo = struct.unpack_from('<H', b, 4)[0], struct.unpack_from('<H', b, 16)[0]
        typ, name = tex[tl[combo]]
        if name.rsplit('/', 1)[-1][:-4] in rider_textures or typ in slots:
            votes.update(br[sub])
    if not votes:
        raise ValueError('no batch uses the rider texture')
    return votes.most_common(1)[0][0]


def _submesh_bones(m2: bytes, skin: bytes) -> List[Counter]:
    """Per submesh: total vertex weight per bone."""
    vn, vo = struct.unpack_from('<II', m2, 0x3C)
    svn, svo = struct.unpack_from('<II', skin, 0x04)
    sverts = struct.unpack_from(f'<{svn}H', skin, svo)
    sm_n, sm_o = struct.unpack_from('<II', skin, 0x1C)
    out = []
    for i in range(sm_n):
        _sid, _lvl, vst, vcnt = struct.unpack_from('<HHHH', skin, sm_o + 48 * i)
        c = Counter()
        for k in range(vst, vst + vcnt):
            v = sverts[k]
            for w, b in zip(struct.unpack_from('<4B', m2, vo + 48 * v + 12), struct.unpack_from('<4B', m2, vo + 48 * v + 16)):
                if w:
                    c[b] += w
        out.append(c)
    return out


def _rider_bones(m2: bytes, skin: bytes, rider_textures: Set[str], slots: Set[int]) -> Tuple[Set[int], int]:
    """(rider bones, heaviest rider bone) when the mount shares the rider's branch: a bone is the rider's
    when the rider-textured submeshes weigh more on it than the others (the fel orc is rigidly bound to
    one netherdrake bone, 22, his polearm to 33 - there is no rider skeleton to cut at)."""
    tex = _textures(m2)
    tl_n, tl_o = struct.unpack_from('<II', m2, 0x80)
    tl = struct.unpack_from(f'<{tl_n}H', m2, tl_o)
    sb = _submesh_bones(m2, skin)
    rider_subs = set()
    for b in _batches(skin)[2]:
        sub, combo = struct.unpack_from('<H', b, 4)[0], struct.unpack_from('<H', b, 16)[0]
        typ, name = tex[tl[combo]]
        if name.rsplit('/', 1)[-1][:-4] in rider_textures or typ in slots:
            rider_subs.add(sub)
    rw, mw = Counter(), Counter()
    for i, c in enumerate(sb):
        (rw if i in rider_subs else mw).update(c)
    bones = {b for b in rw if rw[b] > mw[b]}
    return bones, max(bones, key=lambda b: rw[b])

RIDER_ATTACH = (1, 2)       # the hands: a riderless mount holds no weapon


def _drop_rider_attachments(m: bytearray) -> None:
    """Unlink the rider's hand attachments in the attachment lookup table (0xF8): the cut mount keeps the
    dead rider's hand bones, so the creature's weapon (creature_equip_template, drawn by the picker - the
    Alliance Knight's sword) hung in the air where the knight's hand was. In game the weapon is the rider's."""
    n, o = struct.unpack_from('<II', m, 0xF8)
    for aid in RIDER_ATTACH:
        if aid < n:
            struct.pack_into('<h', m, o + 2 * aid, -1)
    # and renumber them in the attachment list itself (the picker's renderer scans the list by id)
    an, ao = struct.unpack_from('<II', m, 0xF0)
    for i in range(an):
        if struct.unpack_from('<I', m, ao + 40 * i)[0] in RIDER_ATTACH:
            struct.pack_into('<I', m, ao + 40 * i, 0xFFFF)


def strip(m2: bytes, skins: List[bytes], rider_textures: Set[str], slots: Set[int] = frozenset()
          ) -> Tuple[bytes, List[bytes], Dict]:
    """-> (m2 with attachment 0 on the mount, skins without the rider's batches, report)."""
    parent, pivot = _bones(m2)
    rb = rider_branch(m2, skins[0], rider_textures, slots)
    br0 = [c for c in _submesh_branches(m2, skins[0], parent) if c]
    shared = all(c.most_common(1)[0][0] == rb for c in br0)    # the mount hangs from the rider's branch too
    sub_bones, heavy = _rider_bones(m2, skins[0], rider_textures, slots) if shared else (None, None)
    tex = _textures(m2)
    tl_n, tl_o = struct.unpack_from('<II', m2, 0x80)
    tl = struct.unpack_from(f'<{tl_n}H', m2, tl_o)
    out_skins, removed = [], []
    for sk in skins:
        # drawn with a rider texture = the rider, whatever bones it hangs from (the gnome rocket car's
        # driver legs are weighted to the car)
        by_tex = set()
        for b_ in _batches(sk)[2]:
            sub_, combo_ = struct.unpack_from('<H', b_, 4)[0], struct.unpack_from('<H', b_, 16)[0]
            typ_, name_ = tex[tl[combo_]]
            if name_.rsplit('/', 1)[-1][:-4] in rider_textures or typ_ in slots:
                by_tex.add(sub_)
        if shared:
            rider_sub = {i for i, c in enumerate(_submesh_bones(m2, sk))
                         if c and sum(w for b, w in c.items() if b in sub_bones) * 2 > sum(c.values())}
        else:
            br = _submesh_branches(m2, sk, parent)
            rider_sub = {i for i, c in enumerate(br) if c and c.most_common(1)[0][0] == rb}
        rider_sub |= by_tex
        n, o, bs = _batches(sk)
        keep = [b for b in bs if struct.unpack_from('<H', b, 4)[0] not in rider_sub]
        new = bytearray(sk)
        new[o:o + 24 * n] = b''.join(keep) + b'\0' * (24 * (n - len(keep)))
        struct.pack_into('<I', new, 0x24, len(keep))
        out_skins.append(bytes(new))
        removed.append(n - len(keep))
    # the seat: the rider branch's first bone below its root = the pelvis
    if shared:
        pelvis = heavy                                  # where the rider's weight sits
        mount_bones = [i for i in range(len(parent)) if i not in sub_bones and parent[i] >= 0]
    else:
        kids = [i for i, p in enumerate(parent) if p == rb]
        pelvis = kids[0] if kids else rb
        mount_bones = [i for i in range(len(parent)) if _branch(parent, i) != rb and parent[i] >= 0]
    seat = pivot[pelvis]
    near = min(mount_bones, key=lambda i: sum((a - b) ** 2 for a, b in zip(pivot[i], seat)))
    m = bytearray(m2)
    an, ao = struct.unpack_from('<II', m, 0xF0)
    for i in range(an):
        if struct.unpack_from('<I', m, ao + 40 * i)[0] == 0:
            struct.pack_into('<H', m, ao + 40 * i + 4, near)
            struct.pack_into('<3f', m, ao + 40 * i + 8, *seat)
    _drop_rider_attachments(m)
    bones = sorted(sub_bones) if shared else [i for i in range(len(parent)) if parent[i] >= 0 and _branch(parent, i) == rb]
    return bytes(m), out_skins, dict(rider_branch=pelvis if shared else rb, shared=shared, removed=removed, seat=seat,
                                     seat_bone=near, rider_bones=bones, pelvis=pelvis, parents=parent)


def strip_like(m2: bytes, skins: List[bytes], ref: Dict) -> Tuple[bytes, List[bytes], Dict]:
    """A community pack's copy of a fused model cut the way its stock model was (ref = strip()'s report):
    pack copies keep the stock skeleton but rename textures (the HD rocket car's pilot is gnome11 / gnome13),
    so the rider is found by BONES - a submesh mostly weighted onto the stock cut's rider bones - not by name.
    Raises when the skeleton differs."""
    parent, pivot = _bones(m2)
    if parent != ref['parents']:
        raise ValueError(f'skeleton differs from the stock model ({len(parent)} vs {len(ref["parents"])} bones)')
    rider = set(ref['rider_bones'])
    out_skins, removed = [], []
    for sk in skins:
        rider_sub = {i for i, c in enumerate(_submesh_bones(m2, sk)) if c and sum(w for b, w in c.items() if b in rider) * 2 > sum(c.values())}
        n, o, bs = _batches(sk)
        keep = [b for b in bs if struct.unpack_from('<H', b, 4)[0] not in rider_sub]
        new = bytearray(sk)
        new[o:o + 24 * n] = b''.join(keep) + b'\0' * (24 * (n - len(keep)))
        struct.pack_into('<I', new, 0x24, len(keep))
        out_skins.append(bytes(new))
        removed.append(n - len(keep))
    seat = pivot[ref['pelvis']]
    mount_bones = [i for i in range(len(parent)) if i not in rider and parent[i] >= 0]
    near = min(mount_bones, key=lambda i: sum((a - b) ** 2 for a, b in zip(pivot[i], seat)))
    m = bytearray(m2)
    an, ao = struct.unpack_from('<II', m, 0xF0)
    for i in range(an):
        if struct.unpack_from('<I', m, ao + 40 * i)[0] == 0:
            struct.pack_into('<H', m, ao + 40 * i + 4, near)
            struct.pack_into('<3f', m, ao + 40 * i + 8, *seat)
    _drop_rider_attachments(m)
    return bytes(m), out_skins, dict(removed=removed, seat=seat, seat_bone=near)


def strip_files(src_m2: Path, out_m2: Path, rider_textures: Set[str], slots: Set[int] = frozenset()) -> Dict:
    """src_m2 + its NN.skin files -> out_m2 + out NN.skin files (the model name changes with the file)."""
    skins_in = sorted(src_m2.parent.glob(src_m2.stem + '0[0-9].skin')) or \
        sorted(p for p in src_m2.parent.iterdir() if p.name.lower().startswith(src_m2.stem.lower()) and p.suffix.lower() == '.skin')
    m2, skins, rep = strip(src_m2.read_bytes(), [p.read_bytes() for p in skins_in], rider_textures, slots)
    out_m2.parent.mkdir(parents=True, exist_ok=True)
    out_m2.write_bytes(m2)
    for p, data in zip(skins_in, skins):
        (out_m2.parent / (out_m2.stem + p.name[-7:].lower())).write_bytes(data)
    rep['skins'] = [p.name for p in skins_in]
    return rep
