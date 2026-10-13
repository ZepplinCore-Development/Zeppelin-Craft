"""F-216: does a model LOOK the same as another? A visual signature of a WotLK (MD20 v264) model + its
first .skin, independent of byte layout (two packs' gilneas_vines_02.m2: 2,192 vs 2,256 bytes, other skin
bytes, the same render).

The signature is what the client draws, not how the file is written:
  - every triangle as its three vertices (position, normal, UV; rounded to 1e-3), unordered, grouped by
    the batch that draws it: (texture refs (type + name), blend mode, render flags, shader id)
  - animations (id, variation, duration), bone count
  - particle / ribbon / light / attachment counts
Vertex order, index order, padding, header metadata and string layout do not count.
"""
import hashlib
import struct
from typing import Optional

R = 3          # rounding: 1/1000 of a yard / of a UV


def _tex_names(m2: bytes):
    n, o = struct.unpack_from('<II', m2, 0x50)
    out = []
    for i in range(n):
        ty, fl, ln, fo = struct.unpack_from('<IIII', m2, o + 16 * i)
        out.append((ty, m2[fo:fo + ln].rstrip(b'\0').decode('latin1').lower().replace('\\', '/') if ln and ty == 0 else ''))
    return out


def _shader(m2: bytes, mats, sh: int, mi: int, tc: int, coord: int) -> tuple:
    """The runtime shader the 3.3.5 client derives for a batch (port of pane.html fixLegacySkin, from the
    builder at 0x836C90): without blend maps (global flag 0x8) the STORED id is ignored - only the material's
    blend and the coord unit count (gilneas_vines_02: stored 16 vs 0, the same draw)."""
    if sh & 0x8000:
        return ('native', sh & 0x7FFF)
    flags = struct.unpack_from('<I', m2, 0x10)[0]
    ntu, otu = struct.unpack_from('<II', m2, 0x88)
    tu = lambda i: struct.unpack_from('<H', m2, otu + 2 * i)[0] if i < ntu else 0xFFFF
    blending = mats[mi][1] if mi < len(mats) else 0
    if not flags & 0x8:
        i_ = 1 if blending else 0
        if tu(coord) > 2:
            i_ |= 8
        i_ <<= 4
        if tu(coord) == 1:
            i_ |= 0x4000
        return ('derived', i_)
    nbm, obm = struct.unpack_from('<II', m2, 0x130)
    bm = lambda i: struct.unpack_from('<H', m2, obm + 2 * i)[0] if i < nbm else 0
    vals, i_ = [0, 0], 0
    for j in range(min(tc, 2)):
        v = 0 if (j == 0 and blending == 0) else bm(sh + j)
        vals[j] = v | 8 if tu(coord + j) > 2 else v
        if tu(coord + j) == 1 and j + 1 == tc:
            i_ |= 0x4000
    return ('derived', (i_ | (vals[1] & 0xFFFF) | ((vals[0] << 4) & 0xFFFF)) & 0xFFFF)


def signature(m2: bytes, skin: bytes) -> Optional[str]:
    if m2[:4] != b'MD20' or skin[:4] != b'SKIN':
        return None
    try:
        nv, ov = struct.unpack_from('<II', m2, 0x3C)
        verts = []
        for i in range(nv):
            at = ov + 48 * i
            p = struct.unpack_from('<3f', m2, at)
            nrm = struct.unpack_from('<3f', m2, at + 20)
            uv = struct.unpack_from('<2f', m2, at + 32)
            verts.append(tuple(round(x, R) for x in p + nrm + uv))
        ni, oi = struct.unpack_from('<II', skin, 0x04)
        vidx = struct.unpack_from(f'<{ni}H', skin, oi)
        nt, ot = struct.unpack_from('<II', skin, 0x0C)
        tri = struct.unpack_from(f'<{nt}H', skin, ot)
        ns, os_ = struct.unpack_from('<II', skin, 0x1C)
        subs = [struct.unpack_from('<HHHHHH', skin, os_ + 48 * i) for i in range(ns)]
        nb, ob = struct.unpack_from('<II', skin, 0x24)
        tex = _tex_names(m2)
        nl, ol = struct.unpack_from('<II', m2, 0x80)
        tlook = struct.unpack_from(f'<{nl}H', m2, ol) if nl else ()
        nm, om = struct.unpack_from('<II', m2, 0x70)
        mats = [struct.unpack_from('<HH', m2, om + 4 * i) for i in range(nm)]
        groups = {}
        for b in range(nb):
            fl, pr, sh, si, gi, ci, mi, ml, tc, tcomb, coord = struct.unpack_from('<BbHHHhHHHHH', skin, ob + 24 * b)
            if si >= len(subs):
                continue
            sid, lvl, vs, vc, is_, ic = subs[si]
            start = is_ + (lvl << 16)
            tris = []
            for t in range(start, start + ic - 2, 3):
                tri3 = tuple(sorted(verts[vidx[tri[t + k]]] for k in range(3)))
                tris.append(tri3)
            texs = tuple(tex[tlook[tcomb + k]] if tcomb + k < len(tlook) and tlook[tcomb + k] < len(tex) else None
                         for k in range(tc))
            key = (sid, texs, mats[mi] if mi < len(mats) else None, _shader(m2, mats, sh, mi, tc, coord), ci)
            groups.setdefault(repr(key), []).extend(tris)
        nseq, oseq = struct.unpack_from('<II', m2, 0x1C)
        seqs = sorted(struct.unpack_from('<HHI', m2, oseq + 0x40 * i) for i in range(nseq))
        counts = tuple(struct.unpack_from('<I', m2, h)[0] for h in (0x2C, 0xF0, 0x108, 0x120, 0x128))
    except (struct.error, IndexError):
        return None
    h = hashlib.sha1()
    for k in sorted(groups):
        h.update(k.encode())
        for t in sorted(groups[k]):
            h.update(repr(t).encode())
    h.update(repr(seqs).encode())
    h.update(repr(counts).encode())
    return h.hexdigest()[:16]


def bones_signature(m2: bytes) -> Optional[str]:
    """The skeleton and the keyframes the model itself holds: each bone's parent and pivot, and per
    translation / rotation / scale track its interpolation, global sequence and, for every sequence whose
    data lives in the .m2 (flag 0x20), the timestamps and values (external .anim files are compared as files)."""
    if m2[:4] != b'MD20':
        return None
    try:
        nseq, oseq = struct.unpack_from('<II', m2, 0x1C)
        inline = [bool(struct.unpack_from('<I', m2, oseq + 0x40 * i + 12)[0] & 0x20) for i in range(nseq)]
        nb, ob = struct.unpack_from('<II', m2, 0x2C)
        h = hashlib.sha1()
        sizes = (12, 8, 12)                                # T: vec3, R: compressed quat, S: vec3
        for i in range(nb):
            at = ob + 88 * i
            parent = struct.unpack_from('<h', m2, at + 8)[0]
            pivot = tuple(round(x, R) for x in struct.unpack_from('<3f', m2, at + 0x4C))
            h.update(repr((parent, pivot)).encode())
            for k, to in enumerate((0x10, 0x24, 0x38)):
                interp, gs, tc, tofs, vc, vofs = struct.unpack_from('<HhIIII', m2, at + to)
                h.update(repr((interp, gs, tc)).encode())
                for q in range(min(tc, vc)):
                    if gs < 0 and q < nseq and not inline[q]:
                        continue
                    n1, o1 = struct.unpack_from('<II', m2, tofs + 8 * q)
                    n2, o2 = struct.unpack_from('<II', m2, vofs + 8 * q)
                    h.update(m2[o1:o1 + 4 * n1])
                    h.update(m2[o2:o2 + sizes[k] * n2])
        return h.hexdigest()[:16]
    except (struct.error, IndexError):
        return None
