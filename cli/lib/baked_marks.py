"""F-230: baked-marking detector for the skin check.

A skin colour or face texture "carries a baked marking" when it has paint, tattoos or a mask that its race / sex's
plain siblings do not. Three comparisons, all on tone-matched images (each sibling is mapped to the target's colour
by an affine RGB fit, its worst 15 % of pixels left out of the fit):

  body       each colour's body (head box left out) against the other colours' bodies
  face-colour  each colour's face of a type against the same face type of the other colours (a colour that bakes
             paint into every face, e.g. a Dark Iron or Lightforged colour)
  face-type  each face type against its nearest other face type of the same colour (the plain face it was painted
             over: troll war paint faces, night elf Cenarion tattoo faces, the Illidari cheek marks); DK copies of
             the same face (identical outside the eye) are skipped as bases

body / face-colour: per pixel the K-th smallest residual over the siblings (K = 15 % of them, at least 2), so a
marking only a few colours share still shows and colour families painted from other art do not swamp it.
face-type: the residual against the nearest base; a blob counts for the target only when the target is further from
the race's consensus face there than the base is (the marked one of the pair). Death knight eye glow (bright,
saturated blobs) is not a marking.

A region counts as marked when the residual (sum of |rgb|, 0-765) is over RES pixels in a blob of MIN_BLOB pixels or
more; the score is the marked share of the region. Findings are leads: look at the baked sheet.
"""
from typing import Dict, List, Tuple

import numpy as np
from PIL import Image
from scipy import ndimage

BODY_SIZE = (128, 128)
FACE_SIZE = (128, 96)                    # 256 x 192 face (upper over lower) at half size
HEAD = (0, 80, 64, 48)                   # the head box on the 128 body atlas
RES = 70
MIN_BLOB = 12
BODY_MIN, FACE_COLOUR_MIN, FACE_TYPE_MIN = 0.004, 0.025, 0.012
FACE_SINGLE_MIN = 0.04                          # one face of one colour
SHARED_MIN, SHARED_Z = 0.04, 6.0               # shared-paint pass: least score, robust z over the race
COPY_RES = 4.0                           # mean residual under which two faces are the same art (DK copies)
_rng = np.random.default_rng(0)


def prep(a: np.ndarray, size) -> Tuple[np.ndarray, np.ndarray]:
    im = np.asarray(Image.fromarray(a.clip(0, 255).astype(np.uint8), 'RGBA').resize(size, Image.BOX)).astype(np.float32)
    return im[..., :3], (im[..., 3] > 128) & (im[..., :3].sum(2) > 30)


def face_image(upper: np.ndarray, lower: np.ndarray) -> np.ndarray:
    w, h = FACE_SIZE
    u = np.asarray(Image.fromarray(upper.clip(0, 255).astype(np.uint8), 'RGBA').resize((w, h // 3), Image.BOX))
    lo = np.asarray(Image.fromarray(lower.clip(0, 255).astype(np.uint8), 'RGBA').resize((w, h - h // 3), Image.BOX))
    return np.concatenate([u, lo]).astype(np.float32)


def _fit_apply(src, dst, sample_mask, full_src):
    X = np.c_[src[sample_mask], np.ones(sample_mask.sum(), np.float32)]
    Y = dst[sample_mask]
    coef, *_ = np.linalg.lstsq(X, Y, rcond=None)
    e = np.abs(X @ coef - Y).sum(1)
    keep = e < np.percentile(e, 85)
    coef, *_ = np.linalg.lstsq(X[keep], Y[keep], rcond=None)
    flat = full_src.reshape(-1, 3)
    return (np.c_[flat, np.ones(len(flat), np.float32)] @ coef).reshape(full_src.shape)


def blobs(res: np.ndarray, valid: np.ndarray, target: np.ndarray = None, base: np.ndarray = None) -> np.ndarray:
    m = ndimage.binary_opening((res > RES) & valid, iterations=1)
    lab, n = ndimage.label(m)
    if not n:
        return m
    idx = np.arange(1, n + 1)
    sizes = ndimage.sum(m, lab, idx)
    keep = sizes >= MIN_BLOB
    if target is not None:                       # death knight eye glow: bright, saturated
        sat = target.max(2) - target.min(2)
        glow = (sat > 90) & (target.max(2) > 170)
        keep &= ndimage.mean(glow, lab, idx) < 0.5
    if target is not None and base is not None:  # ... or a blob much brighter and more saturated than its base
        lift = target.mean(2) - base.mean(2)
        sat = (target.max(2) - target.min(2)) - (base.max(2) - base.min(2))
        keep &= ~((ndimage.mean(lift, lab, idx) > 25) & (ndimage.mean(sat, lab, idx) > 30))
    return np.isin(lab, idx[keep])


def _glow(*imgs) -> np.ndarray:
    m = np.zeros(imgs[0].shape[:2], bool)
    for im in imgs:
        m |= ((im.max(2) - im.min(2)) > 80) & (im.max(2) > 150)
    return ndimage.binary_dilation(m, iterations=3)


def kth_residual(items: Dict, extra=None, q=None) -> Dict:
    """items {key: (rgb, valid)} -> {key: (score, mask)}: residual = K-th smallest over the siblings."""
    keys = list(items)
    if len(keys) < 4:
        return {}
    shape = items[keys[0]][0].shape
    valid = {k: items[k][1] & (extra if extra is not None else True) for k in keys}
    pix = shape[0] * shape[1]
    samp = np.zeros(pix, bool)
    samp[_rng.choice(pix, min(3000, pix), replace=False)] = True
    samp = samp.reshape(shape[:2])
    out = {}
    for c in keys:
        rgb, v = items[c][0], valid[c]
        rs = []
        for s in keys:
            if s == c:
                continue
            m = v & valid[s]
            if (m & samp).sum() < 100:
                continue
            r = np.abs(_fit_apply(items[s][0], rgb, m & samp, items[s][0]) - rgb).sum(2)
            if r[m & ~_glow(rgb, items[s][0])].mean() < COPY_RES:   # a copy (DK glow aside): no evidence either way
                continue
            r[~m] = 0
            rs.append(r)
        if len(rs) < 3:
            continue
        k = max(2, int(round((0.15 if q is None else q) * len(rs))))
        res = np.partition(np.stack(rs), k - 1, axis=0)[k - 1]
        mask = blobs(res, v, rgb)
        out[c] = (mask.sum() / max(v.sum(), 1), mask)
    return out


def nearest_type(items: Dict, eye: np.ndarray) -> Dict:
    """items {type: (rgb, valid)} of one colour -> {type: (score, base type, mask)}."""
    types = list(items)
    if len(types) < 3:
        return {}
    cons = np.median(np.stack([items[t][0] for t in types]), axis=0)
    out = {}
    for t in types:
        rgb, v = items[t][0], items[t][1] & ~eye
        best = None
        for s in types:
            if s == t:
                continue
            m = v & items[s][1]
            if m.sum() < 200:
                continue
            r = np.abs(_fit_apply(items[s][0], rgb, m, items[s][0]) - rgb).sum(2)
            mean = float(r[m & ~_glow(rgb, items[s][0])].mean())
            if mean < COPY_RES:                 # its own death knight copy: the same paint, no evidence
                continue
            r[~m] = 0
            if best is None or mean < best[0]:
                best = (mean, s, r, m)
        if best is None:
            continue
        _mean, s, r, m = best
        mask = blobs(r, m, rgb, _fit_apply(items[s][0], rgb, m, items[s][0]))
        if mask.any():
            mine = np.abs(rgb - cons).sum(2)[mask].mean() > np.abs(items[s][0] - cons).sum(2)[mask].mean()
            if not mine:
                mask[:] = False
        out[t] = (mask.sum() / max(m.sum(), 1), s, mask)
    return out


def detect(race: int, sex: int, skins: Dict[int, np.ndarray], faces: Dict[Tuple[int, int], np.ndarray],
           eye: np.ndarray) -> List[dict]:
    """skins {colour: RGBA body}, faces {(type, colour): RGBA 256x192-ish face}; eye: 192 x 256 eyeball mask.
    -> findings [{what, colour, type, score, base, detail}], strongest first."""
    found = []
    head = np.zeros(BODY_SIZE[::-1], bool)
    x, y, w, h = HEAD
    head[y:y + h, x:x + w] = True
    body = kth_residual({c: prep(a, BODY_SIZE) for c, a in skins.items()}, ~head)
    for c, (score, mask) in body.items():
        if score >= BODY_MIN:
            ys, xs = np.nonzero(mask)
            found.append({'what': 'body', 'colour': c, 'type': None, 'score': score, 'base': None,
                          'detail': f'body markings over {score:.1%} of the body (around {int(xs.mean()) * 4},'
                                    f'{int(ys.mean()) * 4} of 512)'})
    F = {k: prep(a, FACE_SIZE) for k, a in faces.items()}
    eye_s = ndimage.binary_dilation(np.asarray(Image.fromarray(eye.astype(np.uint8) * 255).resize(FACE_SIZE,
                                                                                                    Image.NEAREST)) > 0,
                                    iterations=2)
    types = sorted({t for t, _c in F})
    colours = sorted({c for _t, c in F})
    per_colour = {}
    for t in types:
        res = kth_residual({c: (F[(t, c)][0], F[(t, c)][1] & ~eye_s) for c in colours if (t, c) in F})
        for c, (score, _m) in res.items():
            per_colour.setdefault(c, []).append((score, t))
    for c, scores in per_colour.items():
        marked = [t for s, t in scores if s >= FACE_COLOUR_MIN]
        if len(marked) >= max(2, 0.5 * len(scores)):
            med = float(np.median([s for s, _t in scores]))
            found.append({'what': 'face-colour', 'colour': c, 'type': None, 'score': med, 'base': None,
                          'detail': f'face paint on {len(marked)}/{len(scores)} face types (median {med:.1%})'})
    # a single face of one colour (round 4: gnome F 5 paints face 0 only, so no colour-wide finding)
    flagged = {f['colour'] for f in found if f['what'] == 'face-colour'}
    for c, scores in per_colour.items():
        if c in flagged:
            continue
        for sc, t in scores:
            if sc >= FACE_SINGLE_MIN:
                found.append({'what': 'face', 'colour': c, 'type': t, 'score': sc, 'base': None,
                              'detail': f'face type {t}: paint over {sc:.1%} of the face that the other colours lack'})
    # shared paint (round 4: gnome F 5 / 13 / 14, dwarf "twilight" 28 / 29): when several colours carry the same paint
    # they explain each other at the 15 % sibling, so a second pass compares against the MEDIAN sibling and keeps
    # the colours that stand out from the race's own spread (art families raise every colour alike)
    flagged = {f['colour'] for f in found if f['what'] == 'face-colour'}
    per_colour_m = {}
    for t in types:
        res = kth_residual({c: (F[(t, c)][0], F[(t, c)][1] & ~eye_s) for c in colours if (t, c) in F}, q=0.5)
        for c, (score, _m) in res.items():
            per_colour_m.setdefault(c, []).append(score)
    if len(per_colour_m) >= 6:
        meds = {c: float(np.median(v)) for c, v in per_colour_m.items()}
        spread = np.median(list(meds.values()))
        mad = np.median(np.abs(np.array(list(meds.values())) - spread)) + 1e-4
        for c, m in meds.items():
            if c not in flagged and m >= SHARED_MIN and (m - spread) / mad >= SHARED_Z:
                found.append({'what': 'face-colour', 'colour': c, 'type': None, 'score': m, 'base': None,
                              'detail': f'shared face paint: median {m:.1%} against the median sibling '
                                        f'(race spread {spread:.1%})'})
    per_type = {}
    for c in colours:
        items = {t: F[(t, c)] for t in types if (t, c) in F}
        for t, (score, base, _m) in nearest_type(items, eye_s).items():
            per_type.setdefault(t, []).append((score, base, c))
    for t, rows in per_type.items():
        hit = [r for r in rows if r[0] >= FACE_TYPE_MIN]
        if len(hit) >= max(2, 0.7 * len(rows)):
            bases = [b for _s, b, _c in hit]
            base = max(set(bases), key=bases.count)
            med = float(np.median([s for s, _b, _c in hit]))
            found.append({'what': 'face-type', 'colour': None, 'type': t, 'score': med, 'base': base,
                          'detail': f'face type {t}: markings on {len(hit)}/{len(rows)} colours (median {med:.1%}), '
                                    f'nearest plain face type {base}'})
    return sorted(found, key=lambda f: -f['score'])
