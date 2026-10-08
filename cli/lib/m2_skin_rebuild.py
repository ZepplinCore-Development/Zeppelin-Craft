"""F-216: WXL's skin rebuild, applied offline to a downported retail model.

A retail .skin stores each batch's material as a modern shader id (0x8000 | effect index, or a
packed blend-bit pair) and leaves the header texture-unit lookup for the engine to derive. WXL's
in-client loader rewrites that into the contract the 3.3.5 client reads
(wxl-modern-m2/src/compat/Skin.cpp, Skin::Rebuild), but only for models it reads itself: a file
downported offline (zep_downport, staged bit cleared) skips it, so it reaches the client with
shader 0x8000 batches (not drawn), 0x8004+ (crash at 0x836D11) and texture-coord index -1.

This is a straight port of Skin::Rebuild minus the parts that only exist at runtime:
  - the bone-budget split (WXL runs it in-client for every model, offline files included);
  - CombinerPatch's additive-overlay marking (effects 21/33/35 keep the 0x4011 2-texture combo).

All skins of a model share the header lookups, so they are rebuilt together.
"""
import struct
from typing import List, Tuple

SOURCE_SHADER_MIN = 0x8000
FLAG_TEXTURE_COMBINER_COMBOS = 0x8
MATERIAL_FLAG_MASK = 0x1F | 0x40 | 0x80

# MD20 v264 header: M2Array (count, offset) fields that may own data right after the header
_HEADER_ARRAYS = [0x08, 0x14, 0x1C, 0x24, 0x2C, 0x34, 0x3C, 0x48, 0x50, 0x58, 0x60, 0x68, 0x70, 0x78,
                  0x80, 0x88, 0x90, 0x98, 0xD8, 0xE0, 0xE8, 0xF0, 0xF8, 0x100, 0x108, 0x110, 0x118, 0x120,
                  0x128]
_ELEM = {0x08: 1, 0x14: 4, 0x1C: 64, 0x24: 2, 0x2C: 88, 0x34: 2, 0x3C: 48, 0x48: 40, 0x50: 16, 0x58: 20,
         0x60: 60, 0x68: 2, 0x70: 4, 0x78: 2, 0x80: 2, 0x88: 2, 0x90: 2, 0x98: 2, 0xD8: 2, 0xE0: 12,
         0xE8: 12, 0xF0: 40, 0xF8: 2, 0x100: 36, 0x108: 156, 0x110: 100, 0x118: 2, 0x120: 176, 0x128: 476}

# M2Batch: flags u8, priority i8, shader u16, section u16, geoset u16, colour i16, material u16,
# layer u16, texCount u16, texCombo u16, coordCombo u16, weightCombo u16, transformCombo u16
_BATCH = struct.Struct('<BbHHHhHHHHHHH')
_F = {k: i for i, k in enumerate(('flags', 'prio', 'shader', 'section', 'geoset', 'colour', 'material',
                                   'layer', 'tex_count', 'tex_combo', 'coord_combo', 'weight_combo',
                                   'transform_combo'))}


def _arr(b: bytes, at: int) -> Tuple[int, int]:
    return struct.unpack_from('<II', b, at)


def _lookup_single(lk: List[int], v: int) -> int:
    if v in lk:
        return lk.index(v)
    lk.append(v)
    return len(lk) - 1


def _lookup_pair(lk: List[int], a: int, b: int) -> int:
    for n in range(len(lk) - 1):
        if lk[n] == a and lk[n + 1] == b:
            return n
    sz = len(lk)
    if sz > 1 and lk[-1] == a:
        lk.append(b)
        return sz - 1
    lk += [a, b]
    return sz


def _blend_override(combos: List[int], b1: int, b2: int) -> int:
    for n in range(0, len(combos) - 1, 2):
        if combos[n] == b1 and combos[n + 1] == b2:
            return n
    combos += [b1, b2]
    return len(combos) - 2


def _decode_blend_bits(b: list, shader: int, tex_count: int, tul: List[int], combos: List[int]):
    blend1, blend2 = (shader >> 4) & 7, shader & 7
    two = tex_count > 1 and (shader & 0x4000) and blend1 and blend2
    save = _blend_override(combos, blend1, blend2) if two else 0
    if not two:
        tex_count = 1
    b[_F['flags']] &= 0x10
    b[_F['shader']] = save
    if tex_count == 1:
        b[_F['coord_combo']] = _lookup_single(tul, -1 if shader & 0x80 else 0)
    else:
        if shader & 0x80:
            t0, t1 = -1, (-1 if shader & 0x8 else 0)
        else:
            t0, t1 = 0, (-1 if shader & 0x8 else (1 if shader & 0x4000 else 0))
        b[_F['coord_combo']] = _lookup_pair(tul, t0, t1)
    b[_F['tex_count']] = min(tex_count, 2)


def _env_split(low: int, shader: int, primary: list, n_weight: int, n_transform: int,
               out: List[list], tul: List[int], combos: List[int]) -> bool:
    follower = list(primary)
    follower[_F['material']] = primary[_F['material']] + 1
    follower[_F['layer']] = 1
    follower[_F['tex_count']] = 1
    if low in (0, 3, 9, 17, 24, 2):
        primary = list(primary)
        if low != 2:
            primary[_F['tex_count']] = 2
        bi = _blend_override(combos, 1, 3 if low == 2 else 4)
        tc = _lookup_pair(tul, 0, -1)
        for x in (primary, follower):
            x[_F['shader']] = bi
            x[_F['coord_combo']] = tc
        out += [primary, follower]
        return True
    if low in (1, 15):
        primary = list(primary)
        primary[_F['tex_count']] = 1
        primary[_F['shader']] = follower[_F['shader']] = 0
        follower[_F['tex_combo']] = primary[_F['tex_combo']] + 1
        if primary[_F['weight_combo']] + 1 < n_weight:
            follower[_F['weight_combo']] = primary[_F['weight_combo']] + 1
        nxt = primary[_F['transform_combo']] + 1
        follower[_F['transform_combo']] = nxt if nxt < n_transform else primary[_F['transform_combo']]
        tc = _lookup_pair(tul, 0, -1 if shader == 0x8001 else 1)
        primary[_F['coord_combo']] = tc
        follower[_F['coord_combo']] = tc + 1
        out += [primary, follower]
        return True
    return False


def _down_convert(b: list, n_weight: int, n_transform: int, tul: List[int], combos: List[int]) -> List[list]:
    b = list(b)
    shader, tex_count = b[_F['shader']], b[_F['tex_count']]
    b[_F['flags']] &= 0x10
    if shader >= SOURCE_SHADER_MIN:
        idx = shader & 0x7FFF
        if idx <= 2:
            # Diffuse_T1_Env effects the client renders natively, re-based (engine index 0 = no shader)
            b[_F['shader']] = SOURCE_SHADER_MIN | (idx + 1)
            b[_F['tex_count']] = 2
            b[_F['coord_combo']] = _lookup_pair(tul, 0, -1)
            return [b]
        low = shader & 0xFF
        out: List[list] = []
        if _env_split(low, shader, b, n_weight, n_transform, out, tul, combos):
            return out
        if low in (5, 8, 10, 12, 16, 23):
            shader, tex_count = 0, 1
        elif low in (21, 33, 35):
            shader, tex_count = 0x4011, 2      # WXL also marks these for its additive combiner (runtime only)
        else:
            shader, tex_count = 0x0010, 1
    if shader < SOURCE_SHADER_MIN:
        _decode_blend_bits(b, shader, tex_count, tul, combos)
    else:
        b[_F['tex_count']] = min(tex_count, 2)
    return [b]


def _fix_submeshes(skin: bytearray, n_bone_combos: int, extended: bool) -> List[bool]:
    n_sub, o_sub = _arr(skin, 4 + 8 * 3)
    n_idx = _arr(skin, 4 + 8 * 1)[0]
    bad = []
    for i in range(n_sub):
        at = o_sub + 48 * i
        sid, level, vs, vc, ist, ic, bc, bci, binf, cbi = struct.unpack_from('<10H', skin, at)
        park = False
        if level > 0 and not extended:
            park = True
        elif ic:
            start = (level << 16) | ist if extended else ist
            park = start > n_idx or ic > n_idx - start
        if park:
            level = vs = vc = ist = ic = bci = cbi = 0
        if ic == 0:
            bc = max(bc, 1)
            bad.append(True)
        else:
            cap = min(75, n_bone_combos - bci if n_bone_combos > bci else 1) or 1
            bc = max(1, min(bc, cap))
            binf = binf or 1
            bad.append(False)
        struct.pack_into('<10H', skin, at, sid, level, vs, vc, ist, ic, bc, bci, binf, cbi)
        skin[at + 0x11] = 0
    return bad


def _append(buf: bytearray, data: bytes) -> int:
    while len(buf) % 16:
        buf.append(0)
    at = len(buf)
    buf += data
    return at


def _free_combiner_slot(m2: bytearray) -> bool:
    """Make room for the textureCombinerCombos M2Array at 0x130 (the converter packs the first data
    array right after a 0x130-byte header): move the header array(s) whose data sits there to the end."""
    for at in _HEADER_ARRAYS:
        n, o = _arr(m2, at)
        size = n * _ELEM[at]
        if n and o < 0x138 and o + size > 0x130:
            if o < 0x130:
                return False
            new = _append(m2, bytes(m2[o:o + size]))
            struct.pack_into('<I', m2, at + 4, new)
    return True


def rebuild(m2_data: bytes, skins: List[bytes], name: str, log=print) -> Tuple[bytes, List[bytes]]:
    m2 = bytearray(m2_data)
    if m2[:4] != b'MD20' or struct.unpack_from('<I', m2, 4)[0] != 264:
        return m2_data, skins
    flags = struct.unpack_from('<I', m2, 0x10)[0]
    n_weight = _arr(m2, 0x90)[0]
    n_uv, n_uvlk = _arr(m2, 0x60)[0], _arr(m2, 0x98)[0]
    n_bone_combos = _arr(m2, 0x78)[0]
    extended = name.lower().replace('/', '\\').startswith(('character\\', 'item\\objectcomponents\\'))
    tul: List[int] = []
    combos: List[int] = []
    parsed = []
    for sd in skins:
        s = bytearray(sd)
        if s[:4] != b'SKIN':
            parsed.append(None)
            continue
        bad = _fix_submeshes(s, n_bone_combos, extended)
        n_b, o_b = _arr(s, 4 + 8 * 4)
        parsed.append((s, bad, [list(_BATCH.unpack_from(s, o_b + 24 * i)) for i in range(n_b)]))
    # texture-transform lookup the source leaves empty (EnsureTextureTransformLookup)
    n_transform = n_uvlk
    if n_uv and not n_uvlk:
        need = n_uv
        for p in parsed:
            for b in (p[2] if p else []):
                base, cnt = b[_F['transform_combo']], b[_F['tex_count']] or 1
                if base != 0xFFFF:
                    need = max(need, base + cnt)
        at = _append(m2, struct.pack(f'<{need}h', *[i if i < n_uv else -1 for i in range(need)]))
        struct.pack_into('<II', m2, 0x98, need, at)
        n_transform = need
    out_skins = []
    for sd, p in zip(skins, parsed):
        if p is None:
            out_skins.append(sd)
            continue
        s, bad, batches = p
        new = []
        for b in batches:
            for nb in _down_convert(b, n_weight, n_transform, tul, combos):
                if nb[_F['section']] < len(bad) and bad[nb[_F['section']]]:
                    nb[_F['shader']] = 0x8000
                new.append(nb)
        if new:
            at = _append(s, b''.join(_BATCH.pack(*x) for x in new))
            struct.pack_into('<II', s, 4 + 8 * 4, len(new), at)
        out_skins.append(bytes(s))
    if tul:
        at = _append(m2, struct.pack(f'<{len(tul)}h', *tul))
        struct.pack_into('<II', m2, 0x88, len(tul), at)
    if combos:
        if flags & FLAG_TEXTURE_COMBINER_COMBOS or _free_combiner_slot(m2):
            at = _append(m2, struct.pack(f'<{len(combos)}H', *combos))
            struct.pack_into('<II', m2, 0x130, len(combos), at)
            struct.pack_into('<I', m2, 0x10, flags | FLAG_TEXTURE_COMBINER_COMBOS)
        else:
            log(f'    retail {name}: no room for the combiner combos, 2-texture blends fall back')
    # materials: blend modes past the client table -> Add, unknown render-flag bits dropped
    n_mat, o_mat = _arr(m2, 0x70)
    for i in range(n_mat):
        fl, bl = struct.unpack_from('<HH', m2, o_mat + 4 * i)
        if bl > 6:
            bl, fl = 4, fl | 0x5
        struct.pack_into('<HH', m2, o_mat + 4 * i, fl & MATERIAL_FLAG_MASK, bl)
    return bytes(m2), out_skins
