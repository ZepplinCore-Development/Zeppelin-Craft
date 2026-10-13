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


MODULAR = '_modular'
GEO = 'creature_geoset_data'


def modular_parent(path: str) -> str:
    """creature/<dir>_modular/<name>_modular.m2 -> creature/<dir>/<name>.m2 (I-392), else ''."""
    m = re.fullmatch(r'(creature/[^/]+)' + MODULAR + r'/([^/]+)' + MODULAR + r'\.m2', path)
    return f'{m.group(1)}/{m.group(2)}.m2' if m else ''


def _offer_on(source: str, path: str) -> List[str]:
    """Stock models a pack declares its modular model replaces: "offer_on" on the model's .M2 recipe
    in zpaks/<source>/model_transforms.json (I-392: one dragonspawn for the whole family)."""
    import json
    from pathlib import Path
    f = Path(__file__).resolve().parents[2] / 'zpaks' / source / 'model_transforms.json'
    try:
        recipes = json.loads(f.read_text(encoding='utf-8-sig'))
    except (OSError, ValueError):
        return []
    for key, cfg in recipes.items():
        if isinstance(cfg, dict) and ms.norm(key) == path:
            return [ms.norm(p) for p in cfg.get('offer_on') or []]
    return []


def modular_variants(result: dict) -> Dict[str, Dict[int, Dict[str, dict]]]:
    """Modular rebuilds of a model (I-392, zep-modular-models): a pack model named
    creature/<dir>_modular/<name>_modular.m2 is the parent creature/<dir>/<name>.m2 rebuilt for
    part-by-part dressing (split armour geosets), offered on every named display that has the
    parent as an option: a source points the display at it or at another model in its folder, or
    retail's remaster of the display's stock model is it (retail.named_remasters: dragonspawn ->
    dragonspawn2), or its stock model is in the recipe's "offer_on" list.
        {source: {display id: {modular path: row}}}, the shape of community_remasters().
    The row comes from the pack's own template display on the model (its model row, skins,
    geoset data); a skin colour named in the display's own skins (DragonSpawnSkinBlue) swaps in
    the folder's skin of that colour. The display keeps its own scale. An option only."""
    from lib import retail
    stock_cdi, stock_cmd = result['stock_dbc']
    out: Dict[str, Dict[int, Dict[str, dict]]] = {}
    for s in result['sources']:
        cdi, cmd = getattr(s, 'cdi', None) or {}, getattr(s, 'cmd', None) or {}
        for path in sorted(p for p in (getattr(s, 'assets', None) or {}) if modular_parent(p)):
            parent = modular_parent(path)
            mids = [mid for mid, m in cmd.items() if ms.norm(str(m.get('model_path') or '')) == path]
            tmpl = next((r for did, r in sorted(cdi.items()) if did not in stock_cdi
                         and int(r.get('model_id') or 0) in mids), None)
            if tmpl is None:
                continue                                   # no display of its own to copy a look from
            folder = path.rsplit('/', 1)[0]
            skins = {p.rsplit('/', 1)[1][:-4] for p in s.assets if p.startswith(folder + '/') and p.endswith('.blp')}
            colours = sorted({n.rsplit('_', 1)[1] for n in skins if '_' in n}, key=lambda c: -len(c))
            stock_on = {p for p in {_path(stock_cmd, r) for r in stock_cdi.values()} if p}
            pd, pn = parent.rsplit('/', 1)                 # by-name remasters extend the stock dir and stem
            hit = {p for p in stock_on if pd.startswith(p.rsplit('/', 1)[0]) and pn.startswith(p.rsplit('/', 1)[1][:-3])
                   and parent in [t for t, _ in retail.named_remasters(p)]}
            hit |= set(_offer_on(s.name, path))            # stock models the pack declares it replaces
            for did, base in stock_cdi.items():
                rows = [base] + [getattr(x, 'cdi', {}).get(did) for x in result['sources']]
                rows = [r for r in rows if r]
                # a source moving the display into the parent's folder counts too: packs keep retail's
                # folder (dragonspawnarmored -> creature/dragonspawn2/dragonspawn2armored.m2), as
                # retail.folder_remasters reads it
                if _path(stock_cmd, base) not in hit and not any(
                        (_path(getattr(x, 'cmd', None) or {}, r) or _path(stock_cmd, r)).rsplit('/', 1)[0] == pd
                        for x in result['sources'] for r in [getattr(x, 'cdi', {}).get(did)] if r):
                    continue
                # the display's own (stock) skins name its colour first; a pack row's only if they don't
                c = next((c for r in rows for c in colours
                          if c in ' '.join(str(r.get(k) or '') for k in TEX).lower()), None)
                if c is None:                              # no skins (darkshade bakes its own): the stock model's name
                    c = next((c for c in colours if c in _path(stock_cmd, base).rsplit('/', 1)[-1]), None)
                row = {'model_id': int(tmpl.get('model_id') or 0), GEO: int(tmpl.get(GEO) or 0),
                       SCALE: float(base.get(SCALE) or 1), '_moved': 0, '_modular': parent}
                for k in TEX:
                    n = str(tmpl.get(k) or '')
                    if c and '_' in n and f'{n.rsplit("_", 1)[0]}_{c}' in skins:
                        n = f'{n.rsplit("_", 1)[0]}_{c}'
                    row[k] = n
                out.setdefault(s.name, {}).setdefault(did, {})[path] = row
    return out


def remaster_options(result: dict) -> Dict[str, Dict[int, Dict[str, dict]]]:
    """community_remasters() plus modular_variants(): every per-display remaster option."""
    out = community_remasters(result)
    for sn, by in modular_variants(result).items():
        for did, opts in by.items():
            out.setdefault(sn, {}).setdefault(did, {}).update(opts)
    return out
