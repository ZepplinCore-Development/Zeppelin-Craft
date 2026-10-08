"""F-216: a seated rider for comparing mount seat positions in the picker.

bake(m2, skin, mesh, textures) -> (m2, skin): the character body posed at the first frame of its
Mount animation (AnimationData 91), ready to be attached rigidly at a mount's seat point
(attachment 0) the way the pane attaches items:
  - every vertex skinned once on the CPU (bone tracks evaluated at frame 0, parent chain applied);
  - the skin keeps only the body's geosets (the same rule the engine applies to ?mesh=);
  - character texture slots (type 1 body, 6 hair, 8 extra) become named textures.

MD20 v264 only; the Mount sequence must be embedded (flag 0x20), else the pose falls back to
the rest pose (still a body of the right size in the seat).
"""
import math
import struct
from typing import Dict, List, Optional, Sequence, Tuple

MOUNT = 91


def _arr(b: bytes, at: int) -> Tuple[int, int]:
    return struct.unpack_from('<II', b, at)


def _seq_index(m2: bytes, anim_id: int) -> Optional[int]:
    n, o = _arr(m2, 0x1C)
    for i in range(n):
        aid, var = struct.unpack_from('<HH', m2, o + 64 * i)
        flags = struct.unpack_from('<I', m2, o + 64 * i + 12)[0]
        if aid == anim_id and var == 0 and flags & 0x20:
            return i
    return None


def _track(m2: bytes, at: int, seq: Optional[int], kind: str):
    """First keyframe of a bone track for sequence seq (or a global sequence), or None."""
    _interp, gseq = struct.unpack_from('<hh', m2, at)
    n_ts, o_ts = _arr(m2, at + 4)
    n_v, o_v = _arr(m2, at + 12)
    idx = 0 if gseq >= 0 else seq
    if idx is None or idx >= n_v:
        return None
    cnt, off = _arr(m2, o_v + 8 * idx)
    if not cnt or off + 16 > len(m2):
        return None
    if kind == 'q':
        x, y, z, w = struct.unpack_from('<4h', m2, off)
        f = lambda v: (v + 32768 if v < 0 else v - 32767) / 32767.0
        return (f(x), f(y), f(z), f(w))
    return struct.unpack_from('<3f', m2, off)


def _mat(t, q, s, p):
    """4x4 (row-major): T(p) T(t) R(q) S(s) T(-p)."""
    x, y, z, w = q
    r = [[1 - 2 * (y * y + z * z), 2 * (x * y - z * w), 2 * (x * z + y * w)],
         [2 * (x * y + z * w), 1 - 2 * (x * x + z * z), 2 * (y * z - x * w)],
         [2 * (x * z - y * w), 2 * (y * z + x * w), 1 - 2 * (x * x + y * y)]]
    m = [[r[i][j] * s[j] for j in range(3)] for i in range(3)]
    tr = [p[i] + t[i] - sum(m[i][j] * p[j] for j in range(3)) for i in range(3)]
    return [m[0] + [tr[0]], m[1] + [tr[1]], m[2] + [tr[2]], [0, 0, 0, 1]]


def _mul(a, b):
    return [[sum(a[i][k] * b[k][j] for k in range(4)) for j in range(4)] for i in range(4)]


def bone_matrices(m2: bytes, anim_id: int = MOUNT) -> List[list]:
    seq = _seq_index(m2, anim_id)
    n, o = _arr(m2, 0x2C)
    out: List[list] = []
    for i in range(n):
        b = o + 88 * i
        parent = struct.unpack_from('<h', m2, b + 8)[0]
        t = _track(m2, b + 16, seq, 'v') or (0.0, 0.0, 0.0)
        q = _track(m2, b + 36, seq, 'q') or (0.0, 0.0, 0.0, 1.0)
        s = _track(m2, b + 56, seq, 'v') or (1.0, 1.0, 1.0)
        nq = math.sqrt(sum(c * c for c in q)) or 1.0
        local = _mat(t, tuple(c / nq for c in q), s, struct.unpack_from('<3f', m2, b + 76))
        out.append(_mul(out[parent], local) if 0 <= parent < i else local)
    return out


def _keep(section_id: int, mesh: Sequence[int]) -> bool:
    g = section_id // 100
    return section_id == 0 or g >= len(mesh) or mesh[g] == section_id % 100


def bake(m2: bytes, skin: bytes, mesh: Sequence[int], textures: Dict[int, str]) -> Tuple[bytes, bytes]:
    out = bytearray(m2)
    mats = bone_matrices(m2)
    nv, ov = _arr(m2, 0x3C)
    for i in range(nv):
        v = ov + 48 * i
        p = struct.unpack_from('<3f', m2, v)
        nrm = struct.unpack_from('<3f', m2, v + 20)
        w = m2[v + 12:v + 16]
        bi = m2[v + 16:v + 20]
        P, N, tot = [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], sum(w) or 1
        for k in range(4):
            if not w[k] or bi[k] >= len(mats):
                continue
            M, f = mats[bi[k]], w[k] / tot
            for r in range(3):
                P[r] += f * (M[r][0] * p[0] + M[r][1] * p[1] + M[r][2] * p[2] + M[r][3])
                N[r] += f * (M[r][0] * nrm[0] + M[r][1] * nrm[1] + M[r][2] * nrm[2])
        if not any(w):
            P = list(p)
        struct.pack_into('<3f', out, v, *P)
        ln = math.sqrt(sum(c * c for c in N)) or 1.0
        struct.pack_into('<3f', out, v + 20, *(c / ln for c in N))
    # the pose is baked in: every bone track empty (the rest pose = identity), so nothing re-poses it
    nb, ob = _arr(m2, 0x2C)
    for i in range(nb):
        for t in (16, 36, 56):
            struct.pack_into('<II', out, ob + 88 * i + t + 4, 0, 0)
            struct.pack_into('<II', out, ob + 88 * i + t + 12, 0, 0)
    # character texture slots -> named textures (appended strings)
    nt, ot = _arr(m2, 0x50)
    for i in range(nt):
        typ = struct.unpack_from('<I', out, ot + 16 * i)[0]
        if typ in textures:
            name = textures[typ].encode() + b'\0'
            while len(out) % 16:
                out.append(0)
            at = len(out)
            out += name
            struct.pack_into('<IIII', out, ot + 16 * i, 0, 0, len(name), at)
    # skin: only the body's geosets
    sk = bytearray(skin)
    n_s, o_s = _arr(skin, 4 + 8 * 3)
    n_b, o_b = _arr(skin, 4 + 8 * 4)
    keep = [_keep(struct.unpack_from('<H', skin, o_s + 48 * j)[0], mesh) for j in range(n_s)]
    batches = [skin[o_b + 24 * j:o_b + 24 * j + 24] for j in range(n_b)
               if struct.unpack_from('<H', skin, o_b + 24 * j + 4)[0] < n_s
               and keep[struct.unpack_from('<H', skin, o_b + 24 * j + 4)[0]]]
    while len(sk) % 16:
        sk.append(0)
    at = len(sk)
    sk += b''.join(batches)
    struct.pack_into('<II', sk, 4 + 8 * 4, len(batches), at)
    return bytes(out), bytes(sk)
