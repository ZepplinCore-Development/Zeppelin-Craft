"""F-216: finish a pack's half-done model repoint.

A pack that moves most displays of model A to its upgrade B (arcanegolem -> arcanegolem2,
Spaceslam: 23 of 28) but leaves a few on A strands them on the old model - an oversight, not a
choice. completions() gives those stranded displays the row they would have had: B's model row,
skins from a moved sibling that wore the same skins on A (else the commonest skin set on B), and
the display's own scale times that sibling's scale change.

Only plain upgrades are completed: B's stem with digits/underscores stripped equals A's
(arcanegolem2 ~ arcanegolem). Variants are deliberate per-display picks and are left alone
(ancientofwar2diseased for the corrupted ancients only, arcanegolem2broken, crackelfmaleblue).

Used by the picker (viewer_v2.display_entries) and the curated build (hd_curate_v2), so both
see the same rows.
"""
import re
from collections import Counter
from typing import Dict, List, Tuple

from lib import model_sources as ms

TEX = ('texture_variation_1', 'texture_variation_2', 'texture_variation_3')
SCALE = 'creature_model_scale'


def _stem(path: str) -> str:
    return re.sub(r'[\d_]+', '', path.rsplit('/', 1)[-1].rsplit('.', 1)[0].lower())


def _path(cmd: dict, row: dict) -> str:
    m = cmd.get(int(row.get('model_id') or 0)) if row else None
    return ms.norm(str(m.get('model_path') or '')) if m else ''


def completions(result: dict) -> Dict[str, Dict[int, dict]]:
    """{source: {display id: {model_id, texture_variation_1..3, creature_model_scale}}} for the
    displays each source stranded on a model it upgrades elsewhere."""
    stock_cdi, stock_cmd = result['stock_dbc']
    by_model: Dict[str, List[int]] = {}
    for did, row in stock_cdi.items():
        p = _path(stock_cmd, row)
        if p:
            by_model.setdefault(p, []).append(did)
    out: Dict[str, Dict[int, dict]] = {}
    for s in result['sources']:
        cdi, cmd = getattr(s, 'cdi', None) or {}, getattr(s, 'cmd', None) or {}
        if not cdi:
            continue
        moved: Dict[str, List[Tuple[int, str, dict, dict]]] = {}
        for did, srow in cdi.items():
            base = stock_cdi.get(did)
            if not base:
                continue
            a = _path(stock_cmd, base)
            b = _path(cmd, srow) or _path(stock_cmd, srow)
            if a and b and a != b:
                moved.setdefault(a, []).append((did, b, srow, base))
        for a, rows in moved.items():
            tgt, n = Counter(b for _, b, _, _ in rows).most_common(1)[0]
            # a plain upgrade the pack applied to MOST of the model's displays (15 of 89 tigers
            # -> tiger2 is a deliberate subset, not an oversight)
            # same stem only: relaxing it to "any new model of the pack's own" (2026-10-08) completed 27
            # more displays, mostly the deliberate splits (ancientofwar 7, druidcat 5, crackelf 3).
            # A new-name remaster that covers every used display needs no completion: the picker's
            # model card offers it as a whole-model swap (skeletonmage -> maldraxxusskeleton).
            if n < 2 or _stem(tgt) != _stem(a) or n * 2 < len(by_model.get(a, [])):
                continue
            sibs = [(did, srow, base) for did, b, srow, base in rows if b == tgt]
            done = {did for did, _, _, _ in rows}
            common = Counter(tuple(str(r.get(k) or '') for k in TEX) for _, r, _ in sibs).most_common(1)[0][0]
            for did in by_model.get(a, []):
                if did in done:
                    continue
                own = stock_cdi[did]
                key = tuple(str(own.get(k) or '').lower() for k in TEX)
                sib = next(((r, b) for _, r, b in sibs
                            if tuple(str(b.get(k) or '').lower() for k in TEX) == key), None)
                r, b = sib or (sibs[0][1], sibs[0][2])
                skins = tuple(str(r.get(k) or '') for k in TEX) if sib else common
                try:
                    ratio = float(r.get(SCALE) or 1) / float(b.get(SCALE) or 1)
                except (TypeError, ValueError, ZeroDivisionError):
                    ratio = 1.0
                out.setdefault(s.name, {})[did] = {
                    'model_id': int(r.get('model_id') or 0),
                    **dict(zip(TEX, skins)),
                    SCALE: round(float(own.get(SCALE) or 1) * ratio, 4),
                }
    return out


def community_remasters(result: dict) -> Dict[str, Dict[int, Dict[str, dict]]]:
    """The remaster lookup's community half (F-216, 2026-10-08):
        {source: {stock display id: {remaster model path: row}}}
    A pack that moves MOST of stock model A's displays (at least 2, at least half) to a model of its
    own - a path no stock display uses, i.e. an HD remaster shipped under a new name
    (skeletonmage -> maldraxxusskeleton, 8 of 9) - registers that model as a remaster of A. Every OTHER display of A then gets it as an option: the
    pack's model row, skins from a moved sibling that wore the same skins on A (else the commonest
    set the pack gave the moved ones), scale times that sibling's scale change - the same row
    completions() builds. An option only: the picker offers it per display, nothing applies it."""
    stock_cdi, stock_cmd = result['stock_dbc']
    by_model: Dict[str, List[int]] = {}
    for did, row in stock_cdi.items():
        p = _path(stock_cmd, row)
        if p:
            by_model.setdefault(p, []).append(did)
    out: Dict[str, Dict[int, Dict[str, dict]]] = {}
    for s in result['sources']:
        cdi, cmd = getattr(s, 'cdi', None) or {}, getattr(s, 'cmd', None) or {}
        if not cdi:
            continue
        moved: Dict[Tuple[str, str], List[Tuple[int, dict, dict]]] = {}
        for did, srow in cdi.items():
            base = stock_cdi.get(did)
            if not base:
                continue
            a = _path(stock_cmd, base)
            b = _path(cmd, srow) or _path(stock_cmd, srow)
            if a and b and a != b and b not in by_model:           # onto a model of the pack's own
                moved.setdefault((a, b), []).append((did, srow, base))
        for (a, b), sibs in moved.items():
            # a remaster = where MOST of A went (8 of 9 skeletonmages); one boss moved onto a unique
            # model is that boss's look, not a remaster of the family
            if len(sibs) < 2 or len(sibs) * 2 < len(by_model.get(a, [])):
                continue
            done = {did for did, _, _ in sibs}
            common = Counter(tuple(str(r.get(k) or '') for k in TEX) for _, r, _ in sibs).most_common(1)[0][0]
            for did in by_model.get(a, []):
                if did in done:
                    continue
                own = stock_cdi[did]
                key = tuple(str(own.get(k) or '').lower() for k in TEX)
                sib = next(((r, bs) for _, r, bs in sibs
                            if tuple(str(bs.get(k) or '').lower() for k in TEX) == key), None)
                r, bs = sib or (sibs[0][1], sibs[0][2])
                skins = tuple(str(r.get(k) or '') for k in TEX) if sib else common
                try:
                    ratio = float(r.get(SCALE) or 1) / float(bs.get(SCALE) or 1)
                except (TypeError, ValueError, ZeroDivisionError):
                    ratio = 1.0
                out.setdefault(s.name, {}).setdefault(did, {})[b] = {
                    'model_id': int(r.get('model_id') or 0),
                    **dict(zip(TEX, skins)),
                    SCALE: round(float(own.get(SCALE) or 1) * ratio, 4),
                    '_moved': len(sibs),
                }
    return out
