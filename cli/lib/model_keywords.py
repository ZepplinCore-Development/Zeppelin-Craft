"""F-216: search keywords for the picker's models (shopping for new content).

Each model gets a lowercase keyword string built from what is already known about it:
  - the names of the creatures shown with it (ours, from the displays using the model);
  - retail's Creature table for the same model file: names, creature type, family
    (Creature -> DisplayID_n -> CreatureDisplayInfo.ModelID -> CreatureModelData.FileDataID);
  - its path, split into words, with expansion folders named (expansion06 -> legion).
Synonyms (worg ~ wolf) are expanded in the picker at search time.
"""
import csv
import re
from typing import Dict, Iterable, List, Set

from lib import retail

EXPANSIONS = {'expansion01': 'burning crusade tbc outland', 'expansion02': 'wrath lich king northrend',
              'expansion03': 'cataclysm', 'expansion04': 'mists pandaria', 'expansion05': 'warlords draenor',
              'expansion06': 'legion broken isles', 'expansion07': 'battle azeroth bfa kul tiras zandalar',
              'expansion08': 'shadowlands', 'expansion09': 'dragonflight dragon isles',
              'expansion10': 'war within khaz algar', 'expansion11': 'midnight'}
_by_model: Dict[int, Set[str]] = {}


def _table(name: str) -> Iterable[dict]:
    f = retail.CACHE / f'{name}.csv'
    if not f.exists() or not f.stat().st_size:
        f.write_text('\n'.join(r for r in _download(name)))
    return csv.DictReader(f.open(errors='replace'))


def _download(name: str) -> List[str]:
    with retail._get(f'https://wago.tools/db2/{name}/csv?build={retail.build()}', 300) as r:
        return r.read().decode('utf-8', 'replace').splitlines()


def retail_words() -> Dict[int, Set[str]]:
    """model FileDataID -> words from the retail creatures that use it."""
    if _by_model:
        return _by_model
    types = {r['ID']: r['Name_lang'] for r in _table('CreatureType')}
    fams = {r['ID']: r['Name_lang'] for r in _table('CreatureFamily')}
    retail.display_row(0)
    for r in _table('Creature'):
        words = {r.get('Name_lang') or '', types.get(r.get('CreatureType'), ''), fams.get(r.get('CreatureFamily'), '')}
        words = {w.lower() for w in words if w}
        if not words:
            continue
        for i in range(4):
            did = int(r.get(f'DisplayID_{i}') or 0)
            mf = retail._cdi.get(did, (0, []))[0] if did else 0
            if mf:
                _by_model.setdefault(mf, set()).update(words)
    return _by_model


def path_words(path: str) -> Set[str]:
    out = set()
    for part in re.split(r'[/_\-. ]+', path.lower()):
        part = re.sub(r'\d+$', '', part)
        if len(part) > 2 and part not in ('blp', 'wmo', 'world', 'doodads', 'passivedoodads', 'passive', 'creature', 'expansion', 'character', 'item', 'generic'):
            out.add(part)
        if part in EXPANSIONS:
            out.update(EXPANSIONS[part].split())
    for k, v in EXPANSIONS.items():
        if k in path:
            out.update(v.split())
    return out


def keywords(path: str, names: Iterable[str] = (), fdid: int = 0, cap: int = 240) -> str:
    words = set(n.lower() for n in names if n) | path_words(path)
    if not fdid:
        fdid = retail.listfile()[0].get(path, 0)
    if fdid:
        words |= retail_words().get(fdid, set())
    text = ' '.join(sorted(words, key=len))
    return text[:cap]
