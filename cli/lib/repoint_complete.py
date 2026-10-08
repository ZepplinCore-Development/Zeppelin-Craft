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
