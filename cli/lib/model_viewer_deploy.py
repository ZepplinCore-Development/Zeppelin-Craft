"""
F-216 model source picker: stage a static viewer under nginx/wow/modelviewer/.

Layout written:
    modelviewer/index.html            picker (queue, one iframe pane per source)
    modelviewer/pane.html             one WebWowViewerCpp instance (?src=&model=&skins=)
    modelviewer/engine/               project.js / .wasm / .data (wow.tools.local build)
    modelviewer/data/queue.json       displays to decide + per-source stats and flags
    modelviewer/files/<source>/...    lowercase copies of every file a pane needs
    modelviewer/files/<source>/fdid/N display skin BLPs under fake file ids
    modelviewer/choices/              written by the page via PUT (nginx dav)

The engine fetches "<prefix><filename>" exactly as the M2 spells it, so pane.html
lowercases and slash-normalises request URLs and every file is staged lowercase.
"""

from __future__ import annotations

import json
import shutil
from pathlib import Path
from typing import Callable, Dict, Iterable, List, Optional, Tuple

from lib import model_sources as ms

ASSET_DIR = Path(__file__).resolve().parent.parent / 'assets' / 'modelviewer'
# Live client DBCs written by the PATCH-Z build: these carry our custom items
# (F-211 wardrobe gear) and pack edits; fall back to stock when absent.
LIVE_DBC_DIR = Path(__file__).resolve().parent.parent / 'DBC Exports'


def _dbc_path(name: str) -> Path:
    live = LIVE_DBC_DIR / name
    return live if live.exists() else ms.STOCK_DBC_DIR / name


def publish_page(name: str, out_root: Path) -> None:
    """Copy a picker page; pages that embed panes get __PANE_V__ = pane.html's content hash,
    so browsers fetch the new pane after every deploy instead of a cached one."""
    import hashlib
    src = ASSET_DIR / name
    if name.endswith('.html') and name != 'pane.html':
        pv = hashlib.sha1((ASSET_DIR / 'pane.html').read_bytes()).hexdigest()[:10]
        (out_root / name).write_text(src.read_text().replace('__PANE_V__', pv))
    else:
        shutil.copy2(src, out_root / name)


_DRY = False   # resolve only (lib/hd_curate.py): log every lookup, copy nothing


def _copy(src: Path, dst: Path) -> None:
    """Plain copy (no hard links). copy2 keeps the source mtime, so an existing
    copy is reused only when size AND mtime match exactly (same source file)."""
    if _DRY:
        return
    if dst.exists():
        st, dt = src.stat(), dst.stat()
        if st.st_size == dt.st_size and int(st.st_mtime) == int(dt.st_mtime):
            return
        dst.unlink()
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)


class SourceFiles:
    """Looks a normalised path up the way the client would for one source:
    the source's own files, then the effective build, then stock."""

    def __init__(self, own: Dict[str, Path], eff: Dict[str, Path]):
        self.chain = [own, eff]
        self._dirs: Dict[str, List[str]] = {}
        self.log: Optional[List[Tuple[str, Optional[Path]]]] = None   # (path, file) per lookup, for provenance

    def find(self, p: str) -> Optional[Path]:
        f = next((idx[p] for idx in self.chain if p in idx), None) or ms.stock_asset(p)
        if self.log is not None:
            self.log.append((p, f))
        return f

    def anims(self, stem: str) -> Dict[str, Path]:
        """External .anim files (<stem>NNNN-NN.anim) from whichever index has them."""
        out = {}
        d, name = stem.rsplit('/', 1)
        for idx in [*self.chain, ms._stock_asset_index or {}]:
            for k, v in idx.items():
                if k.startswith(stem) and k.endswith('.anim') and k not in out:
                    out[k] = v
        if self.log is not None:
            self.log += list(out.items())
        return out


def _stage_pane(name: str, r: 'ms.Resolved', files: SourceFiles, out_root: Path,
                fdid_alloc: Callable[[str, Path], int]) -> dict:
    """Copy everything one pane needs; return the pane descriptor."""
    dest = out_root / 'files' / name
    staged, missing = [], []

    def put(p: str):
        f = files.find(p)
        if f is None:
            missing.append(p)
            return
        _copy(f, dest / p)
        staged.append(p)

    put(r.model_path)
    bbox = None
    mf = files.find(r.model_path)
    stem = r.model_path[:-3]
    m = r.m2
    tbc = mf is not None and 256 <= int.from_bytes(mf.read_bytes()[4:8], 'little') < 264
    if tbc and not _DRY:
        # TBC-format model (skin inline): stage a v264 copy + .skin for the viewer
        from lib import m2_tbc
        m2b, skins, _ = m2_tbc.convert(mf.read_bytes())
        (dest / r.model_path).parent.mkdir(parents=True, exist_ok=True)
        (dest / r.model_path).write_bytes(m2b)
        for v, skb in enumerate(skins):
            (dest / f'{stem}{v:02d}.skin').write_bytes(skb)
        mf = dest / r.model_path
        m = ms.decode_m2(mf)
    if mf:
        bbox = _mesh_bbox(mf.read_bytes())
    for v in range(0 if tbc else (m.views if m else 1)):
        put(f'{stem}{v:02d}.skin')
    for k, f in files.anims(stem).items():
        _copy(f, dest / k)
    # Stage only what the model actually draws: models often list textures no
    # batch or particle uses, and displays name skins for slots the model lacks.
    drawn = None
    if m:
        skf = files.find(f'{stem}00.skin')
        if skf is not None:
            drawn = ms.batch_textures(m, skf.read_bytes())
        for i, (tt, tn) in enumerate(m.textures):
            if tt == 0 and tn and (drawn is None or i in drawn):
                put(ms.norm(tn))
    skin_types = {t for t, _ in (m.textures if m else [])}
    skin_ids = [0, 0, 0]
    model_dir = r.model_path.rsplit('/', 1)[0]
    for i, s in enumerate(r.skins):
        if not s or (m and (11 + i) not in skin_types):
            continue
        p = f'{model_dir}/{s.lower()}.blp'
        f = files.find(p)
        if f is None:
            missing.append(p)
            continue
        fid = fdid_alloc(name, f)
        _copy(f, dest / 'fdid' / str(fid))
        skin_ids[i] = fid
    return {'src': name, 'model': r.model_path, 'skins': skin_ids, 'missing': missing, 'bbox': bbox}


def _pane_stats(name: str, r: 'ms.Resolved', author: str = '') -> dict:
    m = r.m2
    return {
        'source': name, 'author': author, 'origin': r.origin, 'model_id': r.model_id,
        'model': r.model_path, 'skin_names': [s for s in r.skins if s], 'flags': r.flags,
        'stats': None if m is None else {
            'version': m.version, 'mb': round(m.size / 1048576, 2), 'bones': m.bones, 'views': m.views,
            'particles': m.particles, 'ribbons': m.ribbons, 'sha': m.sha256[:10],
            'orphans': m.orphan_textures(),
        },
    }


# ---------------------------------------------------------------------------
# Character-model displays (character/<race>/<sex>/*.m2 with an
# extended_display_info_id): the client textures them from the NPC bake and
# CharSections and picks geosets from the look + gear. Helmets, shoulders and
# weapons are attached models and are not drawn.
# ---------------------------------------------------------------------------

_char_lookups = None


def _load_char_lookups():
    """Stock CharHairGeosets, CharacterFacialHairStyles, ItemDisplayInfo geoset groups."""
    global _char_lookups
    if _char_lookups is None:
        import struct as _st
        def rows(name):
            data = (_dbc_path(name) if name == 'ItemDisplayInfo.dbc' else ms.STOCK_DBC_DIR / name).read_bytes()
            n, fc, rs, _ = _st.unpack_from('<4I', data, 4)
            return [_st.unpack_from(f'<{fc}I', data, 20 + i * rs) for i in range(n)]
        hair = {(r[1], r[2], r[3]): r[4] for r in rows('CharHairGeosets.dbc')}
        facial = {(r[0], r[1], r[2]): r[3:8] for r in rows('CharacterFacialHairStyles.dbc')}
        items = {r[0]: r[7:10] for r in rows('ItemDisplayInfo.dbc')}
        # Cape texture: ItemDisplayInfo.left_model_texture (field 3, a string).
        data = _dbc_path('ItemDisplayInfo.dbc').read_bytes()
        n, fc, rs, _ = _st.unpack_from('<4I', data, 4)
        strings = data[20 + n * rs:]
        def sv(off):
            return strings[off:strings.index(b'\0', off)].decode('latin-1')
        cape_tex = {}
        for i in range(n):
            r = _st.unpack_from(f'<{fc}I', data, 20 + i * rs)
            if r[3]:
                cape_tex[r[0]] = sv(r[3])
        _char_lookups = (hair, facial, items, cape_tex)
    return _char_lookups


# Geoset tables the HD packs rewrite alongside their character models (F-049):
# a pane must read its own source's rows, or the new geosets never switch on
# (HD scourge female: geoset_1 0 -> 2 = the 102 jaw).
_GEO_TABLES = {'characterfacialhairstyles': ('CharacterFacialHairStyles.dbc',
                   ('race', 'gender', 'variation_id', 'geoset_1', 'geoset_2', 'geoset_3', 'geoset_4', 'geoset_5')),
               'charhairgeosets': ('CharHairGeosets.dbc', ('id', 'race', 'gender', 'variation', 'geoset', 'show_scalp'))}
_geo_cache: Dict[str, Tuple[dict, dict]] = {}


def _geo_rows(table: str, dbc_file: Path, cols) -> List[dict]:
    import struct as _st
    data = dbc_file.read_bytes()
    n, fc, rs, _ = _st.unpack_from('<4I', data, 4)
    return [dict(zip(cols, _st.unpack_from(f'<{fc}i', data, 20 + i * rs))) for i in range(n)]


def _geo_apply(rows: List[dict], table: str, sql_files: List[Path]) -> List[dict]:
    """Stock rows + one zpak's statements for a composite-key geoset table."""
    import re as _re
    for f in sql_files:
        for stmt in ms._split_statements(f.read_text(errors='replace')):
            m = _re.match(r'(?is)^\s*(insert|replace|update|delete)\b', stmt)
            if not m or not _re.search(rf'(?i)`?{table}`?', stmt):
                continue
            kind = m.group(1).lower()
            if kind in ('insert', 'replace'):
                cm = _re.search(rf'(?is)`?{table}`?\s*\(([^)]*)\)\s*values\s*(.*)$', stmt)
                if cm:
                    cols = [c.strip(' `\n\t').lower() for c in cm.group(1).split(',')]
                    rows += [{k: int(v) for k, v in zip(cols, vals)} for vals in ms._tuple_values(cm.group(2))]
                continue
            wm = _re.search(r'(?is)\bwhere\b(.*)$', stmt)
            where = {k.lower(): int(ms._val(v)) for k, v in ms._ASSIGN_RE.findall(wm.group(1))} if wm else {}
            hit = lambda r: all(r.get(k) == v for k, v in where.items())
            if kind == 'delete':
                rows = [r for r in rows if not hit(r)]
            else:
                sets = {k.lower(): int(ms._val(v)) for k, v in ms._ASSIGN_RE.findall(
                    _re.split(r'(?is)\bwhere\b', _re.split(r'(?is)\bset\b', stmt, 1)[1])[0])}
                rows = [dict(r, **sets) if hit(r) else r for r in rows]
    return rows


def _geo_lookups(source: str) -> Tuple[dict, dict]:
    """(hair, facial) for 'stock', 'effective' (live build) or one zpak."""
    if source not in _geo_cache:
        out = []
        for table, (fname, cols) in _GEO_TABLES.items():
            if source == 'effective':
                rows = _geo_rows(table, _dbc_path(fname), cols)
            else:
                rows = _geo_rows(table, ms.STOCK_DBC_DIR / fname, cols)
                if source != 'stock':
                    zdir = Path(__file__).resolve().parents[2] / 'zpaks' / source / 'dbc'
                    rows = _geo_apply(rows, table, sorted(zdir.glob(f'*{table}*.sql')))
            out.append(rows)
        frows, hrows = out
        facial = {(r['race'], r['gender'], r['variation_id']): tuple(r[f'geoset_{i}'] for i in range(1, 6)) for r in frows}
        # First matching row wins, as in the client (stock goblin rows are placeholder
        # duplicates of variation 0: geoset 1 first, then geoset 2 + show_scalp).
        hair = {}
        for r in hrows:
            hair.setdefault((r['race'], r['gender'], r['variation']), (r['geoset'], r['show_scalp']))
        _geo_cache[source] = (hair, facial)
    return _geo_cache[source]


def _char_mesh(x: dict, source: str = 'stock', pane: Optional[dict] = None) -> List[int]:
    """Visible geoset per group (engine m_meshIds: group -> geoset % 100)."""
    _, _, items, _ = _load_char_lookups()
    hair, facial = _geo_lookups(source)
    race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
    mesh = [1] * 20
    mesh[0], scalp = hair.get((race, sex, int(x.get('hair_style') or 0)), (1, 0))
    f = facial.get((race, sex, int(x.get('facial_hair') or 0)), (1, 1, 1, 1, 1))
    mesh[1], mesh[3], mesh[2] = f[0], f[1], f[2]
    if len(f) > 4:
        mesh[16], mesh[17] = f[3], f[4]
    mesh[7] = 2                                   # ears
    gg = lambda slot: items.get(int(x.get(slot) or 0)) if int(x.get(slot) or 0) else None
    if gg('gloves_id'): mesh[4] = 1 + gg('gloves_id')[0]
    if gg('boots_id'): mesh[5] = 1 + gg('boots_id')[0]
    top = gg('chest_id') or gg('shirt_id')
    if top: mesh[8] = 1 + top[0]
    if gg('chest_id') and gg('chest_id')[2]: mesh[13] = 1 + gg('chest_id')[2]
    if gg('legs_id'):
        mesh[9] = 1 + gg('legs_id')[0]
        if gg('legs_id')[2]: mesh[13] = 1 + gg('legs_id')[2]
    if gg('tabard_id'): mesh[12] = 2
    if gg('cape_id'): mesh[15] = 1 + gg('cape_id')[0]
    if gg('belt_id'): mesh[18] = 1 + gg('belt_id')[0]
    # Helmet hides hair / facial hair / ears: ItemDisplayInfo.helmet_geoset_{male,female}
    # -> HelmetGeosetVisData row; each of its fields is a race mask (bit 1 << race).
    idi, _, hgvd = _load_item_lookups()
    helm = idi.get(int(x.get('helm_id') or 0))
    if helm:
        vis = hgvd.get(helm[14] if sex else helm[13])
        if vis:
            for field, group in zip(vis[:5], (0, 1, 2, 3, 7)):
                if (field & 0xFFFFFFFF) >> race & 1:
                    mesh[group] = 1          # 1 = bald scalp / no facial hair / no ears
    # show_scalp: the client also draws geoset 1 (the scalp) under this hair style.
    # The engine shows one geoset per group, so the pane promotes geoset 1 to always-on.
    if pane is not None and scalp and mesh[0] != 1:
        pane['scalp'] = 1
    return [int(v) & 0x7F for v in mesh]


def _char_textures(name: str, x: dict, chs: Dict[int, dict], files: 'SourceFiles', out_root: Path,
                   alloc) -> Tuple[Dict[int, int], List[str]]:
    """slot -> fake fdid: 1 = NPC bake (body + clothes), 2 = cape, 6 = hair, 8 = extra skin."""
    dest = out_root / 'files' / name / 'fdid'
    race, sex = int(x.get('race') or 0), int(x.get('gender') or 0)
    want: Dict[int, str] = {}
    if x.get('texture'):
        want[1] = 'textures/bakednpctextures/' + str(x['texture']).lower()
    cape = int(x.get('cape_id') or 0)
    if cape and _load_char_lookups()[3].get(cape):
        want[2] = 'item/objectcomponents/cape/' + _load_char_lookups()[3][cape].lower() + '.blp'
    for r in chs.values():
        if r.get('race') != race or r.get('gender') != sex:
            continue
        if (r.get('base_section') == 3 and r.get('type') == int(x.get('hair_style') or 0)
                and r.get('color_index') == int(x.get('hair_color') or 0) and r.get('texture_1')):
            want[6] = ms.norm(str(r['texture_1']))
        if (r.get('base_section') == 0 and r.get('type') == 0
                and r.get('color_index') == int(x.get('skin_color') or 0) and r.get('texture_2')):
            want[8] = ms.norm(str(r['texture_2']))
    tex, missing = {}, []
    for slot, path in want.items():
        f = files.find(path)
        if f is None:
            missing.append(path)
            continue
        fid = alloc(name, f)
        _copy(f, dest / str(fid))
        tex[slot] = fid
    return tex, missing


# ---------------------------------------------------------------------------
# Attached items (helmet, shoulders, weapons). The engine has no attach call,
# so pane.html merges each item mesh into the model, bound to the attachment's
# bone. Here: decide which items, stage their files, describe them for the pane.
# ---------------------------------------------------------------------------

_item_lookups = None


def _load_item_lookups():
    """ItemDisplayInfo models/textures and ChrRaces client prefixes (stock DBCs)."""
    global _item_lookups
    if _item_lookups is None:
        import struct as _st
        def table(name, string_idx):
            data = _dbc_path(name).read_bytes()
            n, fc, rs, _ = _st.unpack_from('<4I', data, 4)
            strings = data[20 + n * rs:]
            out = {}
            for i in range(n):
                r = list(_st.unpack_from(f'<{fc}I', data, 20 + i * rs))
                for k in string_idx:
                    r[k] = strings[r[k]:strings.index(b'\0', r[k])].decode('latin-1')
                out[r[0]] = r
            return out
        idi = table('ItemDisplayInfo.dbc', (1, 2, 3, 4, 5, 6))
        races = {k: v[6] for k, v in table('ChrRaces.dbc', (6,)).items()}
        hgvd = {k: [x if x < 2**31 else x - 2**32 for x in v[1:8]] for k, v in table('HelmetGeosetVisData.dbc', ()).items()}
        _item_lookups = (idi, races, hgvd)
    return _item_lookups


def _stem(model: str) -> str:
    return ms.norm(model).rsplit('.', 1)[0]


def _items_for(x: Optional[dict], equip: Optional[dict]) -> List[dict]:
    """[{a: attachment id, m: model path, t: texture path}] wanted for a pane."""
    idi, races, _ = _load_item_lookups()
    want = []
    if x:   # character display: helmet + shoulders from CreatureDisplayInfoExtra
        prefix = races.get(int(x.get('race') or 0), '')
        sex = 'F' if int(x.get('gender') or 0) else 'M'
        helm = idi.get(int(x.get('helm_id') or 0))
        if helm and helm[1] and prefix:
            want.append({'slot': 'Head', 'idi': int(x.get('helm_id') or 0),
                         'a': 11, 'm': f'item/objectcomponents/head/{_stem(helm[1])}_{prefix.lower()}{sex.lower()}.m2',
                         't': f'item/objectcomponents/head/{helm[3].lower()}.blp' if helm[3] else ''})
        sh = idi.get(int(x.get('shoulders_id') or 0))
        if sh:
            for a, mi, ti in ((6, 1, 3), (5, 2, 4)):       # left model -> left shoulder (6), right -> right (5)
                if sh[mi]:
                    want.append({'slot': 'Shoulder ' + ('L' if a == 6 else 'R'), 'idi': int(x.get('shoulders_id') or 0),
                                 'a': a, 'm': f'item/objectcomponents/shoulder/{_stem(sh[mi])}.m2',
                                 't': f'item/objectcomponents/shoulder/{sh[ti].lower()}.blp' if sh[ti] else ''})
    if x:   # wxl-equip-extension: models on the body slots (collections, buckles, ...)
        want += _extension_items(x, prefix, sex)
    for slot in (equip or {}).get('items', []):
        d = idi.get(slot['display'])
        if not d or not d[1]:
            continue
        shield = slot['class'] == 4 and slot['subclass'] == 6
        folder = 'shield' if shield else 'weapon'
        a = 0 if shield else (1 if slot['hand'] == 'main' else 2)
        want.append({'slot': 'Shield' if shield else ('Main hand' if a == 1 else 'Off hand'), 'idi': slot['display'],
                     'a': a, 'm': f'item/objectcomponents/{folder}/{_stem(d[1])}.m2',
                     't': f'item/objectcomponents/{folder}/{d[3].lower()}.blp' if d[3] else ''})
    return want


# wxl-equip-extension slot table (EquipExtension.cpp kSlotConfig): CDIExtra field,
# slot folder, default attachments. Head/shoulder stay with the client's own path.
_EXT_SLOTS = [('shirt_id', 'Shirt', 34, 34), ('chest_id', 'Chest', 34, 34), ('belt_id', 'Waist', 53, 53),
              ('legs_id', 'Leg', 9, 10), ('boots_id', 'Foot', 47, 48), ('wrists_id', 'Bracer', 3, 4),
              ('gloves_id', 'Glove', 1, 2), ('cape_id', 'Cape', 12, 12), ('tabard_id', 'Tabard', 34, 34)]


def _ext_icon2(icon2: str, a1: int, a2: int) -> Tuple[int, int, int, str]:
    """ParseIcon2: '<attach1>:<attach2>:<flags>:<folder>', each field optional."""
    if not icon2 or not (icon2[0] == ':' or icon2[0].isdigit()):
        return a1, a2, 0, ''
    parts = icon2.split(':') + ['', '', '', '']
    att = lambda v, d: int(v.split(',')[0]) if v.strip().split(',')[0].isdigit() else d
    flags = int(parts[2]) if parts[2].strip().isdigit() else 0
    return att(parts[0], a1), att(parts[1], a2), flags, parts[3].strip()


def _ext_path(stem: str, race: str, sex: str, flags: int, folder: str, kind: str, model_stem: str = '') -> str:
    """BuildSlotPath / BuildTexPath. kind 'm2': 0x4 no race, 0x2 no gender; kind 'blp':
    0x8 append race, 0x10 append gender. 0x20 subfolder, 0x40 '_Or_M' underscore."""
    if kind == 'm2':
        add_race, add_sex = not flags & 0x4, not flags & 0x2
    else:
        add_race, add_sex = bool(flags & 0x8), bool(flags & 0x10)
    sub = (model_stem or stem) + '\\' if flags & 0x20 else ''
    name = stem
    if add_race or add_sex:
        name += '_' + (race if add_race else '') + ('_' if flags & 0x40 and add_race and add_sex else '') + (sex if add_sex else '')
    ext = '.m2' if kind == 'm2' else '.blp'
    return ms.norm(f'item\\objectcomponents\\{folder}\\{sub}{name}{ext}')


def _extension_items(x: dict, race_code: str, sex: str) -> List[dict]:
    idi = _load_item_lookups()[0]
    out = []
    for field, folder, d1, d2 in _EXT_SLOTS:
        r = idi.get(int(x.get(field) or 0))
        if not r:
            continue
        a1, a2, icon_flags, custom = _ext_icon2(r[6] or '', d1, d2)
        for model, tex, attach in ((r[1], r[3], a1), (r[2], r[4], a2)):
            if not model:
                continue
            stem, _, geo = model.partition(':')
            stem = stem.rsplit('.', 1)[0]
            geosets = [int(g) for g in geo.split(',') if g.strip().isdigit()]
            is_col = bool(geosets)
            flags = icon_flags if is_col else icon_flags | 0x6      # body slots: no suffix by default
            fold = custom or ('Collections' if is_col else folder)
            item = {'slot': folder + ' (WXL)', 'idi': int(x.get(field) or 0),
                    'a': attach, 'm': _ext_path(stem, race_code, sex, flags, fold, 'm2'),
                    't': _ext_path(tex, race_code, sex, flags, fold, 'blp', stem) if tex else ''}
            if is_col:
                item['col'] = geosets
            out.append(item)
    return out


def _stage_items(name: str, want: List[dict], files: 'SourceFiles', out_root: Path,
                 prov: Optional[List[dict]] = None) -> Tuple[List[dict], List[str]]:
    """Stage item models for a pane. prov (if given) gets one entry per wanted
    item: slot, ItemDisplayInfo id, every file looked up with its owner, status."""
    dest = out_root / 'files' / name
    staged, missing = [], []
    outer = files.log                     # a caller's own lookup log (v2 panes) keeps every item's lookups
    for it in want:
        files.log = []
        entry = {'slot': it.get('slot', ''), 'idi': it.get('idi'), 'model': it['m'], 'status': 'drawn'}
        if prov is not None:
            prov.append(entry)
        try:
            m = files.find(it['m'])
            ver = int.from_bytes(m.read_bytes()[4:8], 'little') if m else 0
            if m and 256 <= ver < 264 and _DRY:
                # resolve-only callers (v2 viewer) convert TBC models into their own store
                entry['status'] = f'drawn: converted from TBC-format v{ver}'
                if it['t']:
                    files.find(it['t'])
                staged.append({k: v for k, v in (('a', it['a']), ('m', it['m']), ('t', it['t']), ('col', it.get('col'))) if v})
                continue
            if m and 256 <= ver < 264:
                # TBC-format model (skin inline): the client reads it as is, the viewer
                # needs v264 + a .skin, so stage a converted copy (lib/m2_tbc.py).
                from lib import m2_tbc
                m2b, skins, dropped = m2_tbc.convert(m.read_bytes())
                (dest / it['m']).parent.mkdir(parents=True, exist_ok=True)
                (dest / it['m']).write_bytes(m2b)
                for v, skb in enumerate(skins):
                    (dest / f"{it['m'][:-3]}{v:02d}.skin").write_bytes(skb)
                lost = ', '.join(f'{n} {k}' for k, n in dropped.items() if n)
                entry['status'] = f'drawn: converted from TBC-format v{ver}' + (f' ({lost} not shown)' if lost else '')
                m = dest / it['m']
                sk = dest / f"{it['m'][:-3]}00.skin"
            else:
                sk = files.find(it['m'][:-3] + '00.skin')
            if not m or not sk:
                entry['status'] = 'not drawn: model or skin missing'
                missing.append(it['m'])
                continue
            # An item whose display texture is missing would draw black: skip it
            # (and list it) rather than show something the game never shows.
            if it['t'] and not files.find(it['t']):
                entry['status'] = 'not drawn: display texture missing'
                missing.append(it['t'])
                continue
            if m != dest / it['m']:
                _copy(m, dest / it['m'])
                _copy(sk, dest / (it['m'][:-3] + '00.skin'))
            for tn in ms.decode_m2(m).hardcoded_textures():   # textures named inside the item model
                tp = ms.norm(tn)
                tf = files.find(tp)
                if tf:
                    _copy(tf, dest / tp)
                elif tp not in missing:
                    missing.append(tp)
            t = it['t']
            if t:
                _copy(files.find(t), dest / t)
            staged.append({k: v for k, v in (('a', it['a']), ('m', it['m']), ('t', t), ('col', it.get('col'))) if v is not None})
        finally:
            entry['files'] = _log_entries(files.log)
            entry['_h'] = sorted({f'{p}={_file_hash(f)}' for p, f in files.log or []})   # content, for dedupe
            if outer is not None:
                outer.extend(files.log or [])
            files.log = None
    files.log = outer
    return staged, missing


_hash_cache: Dict[str, str] = {}


def _file_hash(f: Optional[Path]) -> str:
    if f is None:
        return '-'
    k = str(f)
    if k not in _hash_cache:
        import hashlib
        _hash_cache[k] = hashlib.sha1(f.read_bytes()).hexdigest()
    return _hash_cache[k]


def _source_key(name: str, body_log, item_prov: List[dict]) -> str:
    import hashlib
    own = sorted({f'{p}={_file_hash(f)}' for p, f in body_log or [] if _owner(f) == name or name == 'stock'})
    for it in item_prov:
        own += [h for h in it.get('_h', [])]
    return hashlib.sha1('\n'.join(own).encode()).hexdigest()[:12]


def _content_key(body_log, item_prov: List[dict], pane: dict) -> str:
    """Hash of everything a pane draws: each looked-up path with its file's content,
    plus the geoset/scale choices the DBC rows produced."""
    import hashlib
    parts = sorted({f'{p}={_file_hash(f)}' for p, f in body_log or []})
    for it in item_prov:
        parts.append(f"item:{it['slot']}:{it['status']}:" + ','.join(it.get('_h', [])))
    parts.append(json.dumps([pane.get('mesh'), pane.get('scale'), pane.get('scalp'), pane.get('geoall'), sorted((pane.get('tex') or {}).keys())]))
    return hashlib.sha1('\n'.join(parts).encode()).hexdigest()


def _item_texture(name: str, d: dict, files: 'SourceFiles', out_root: Path, alloc, pane: dict) -> None:
    """An item model's skin is texture type 2 (object component), named by
    ItemDisplayInfo, not by the model: show its most used variant."""
    for t in d.get('item_tex') or []:
        f = files.find(t)
        if f is not None:
            fid = alloc(name, f)
            _copy(f, out_root / 'files' / name / 'fdid' / str(fid))
            pane['tex'] = {2: fid}
            return
    if d.get('item_tex'):
        pane['missing'].append(d['item_tex'][0])


def display_files(result: dict, did, source: str) -> Optional[Dict[str, Optional[Path]]]:
    """Every path one display draws when `source` is picked for it, resolved the way
    the viewer's pane does (the source's own files, stock for the rest), without
    copying anything. Items are not included (separate models). None = no such pane."""
    global _DRY
    d = result['displays'].get(did)
    if not d:
        return None
    srcs = {s.name: s for s in result['sources']}
    r = d['stock'] if source == 'stock' else d['sources'].get(source)
    if r is None or not r.model_path or r.m2 is None:
        return None
    files = SourceFiles({} if source == 'stock' else srcs[source].assets, {})
    files.log = []
    _DRY = True
    try:
        if d.get('kind') == 'item':
            # an item choice covers every model of the group (race/sex variants of a
            # helm, left + right shoulder) and every texture variant painted for it
            for m in d['members']:
                mf = files.find(m)
                info = decode_cached(mf) if mf else None
                tbc = mf is not None and 256 <= int.from_bytes(mf.read_bytes()[4:8], 'little') < 264
                for v in range(0 if tbc else min(info.views, 4) if info and not info.error else 1):
                    files.find(f'{m[:-3]}{v:02d}.skin')     # TBC-format models carry their skin inline
                if info and not info.error:
                    for tt, tn in info.textures:
                        if tt == 0 and tn:
                            files.find(ms.norm(tn))
            for t in d.get('item_tex') or []:
                files.find(t)
            out_i: Dict[str, Optional[Path]] = {}
            for p, f in files.log:
                out_i.setdefault(p, f)
            return out_i
        _stage_pane(source, r, files, Path('/nonexistent'), lambda n, f: 0)
        cdi = result['stock_dbc'][0] if source == 'stock' else srcs[source].cdi
        ext = int((cdi.get(did) or {}).get('extended_display_info_id') or 0)
        if ext and r.model_path.startswith('character/'):
            cdx, chs = result['stock_char_dbc'] if source == 'stock' else (srcs[source].cdx, srcs[source].chs)
            if cdx.get(ext):
                _char_textures(source, cdx[ext], chs, files, Path('/nonexistent'), lambda n, f: 0)
    finally:
        _DRY = False
    out: Dict[str, Optional[Path]] = {}
    for p, f in files.log:
        out.setdefault(p, f)
    return out


_decode_cache: Dict[str, 'ms.M2Info'] = {}


def decode_cached(f: Path):
    k = str(f)
    if k not in _decode_cache:
        _decode_cache[k] = ms.decode_m2(f)
    return _decode_cache[k]


def _owner(f: Optional[Path]) -> str:
    """Which pack a resolved file comes from: a zpak name, or 'stock (<mpq>)'."""
    if f is None:
        return 'missing'
    sp = str(f)
    if '/zpaks/' in sp:
        return sp.split('/zpaks/', 1)[1].split('/', 1)[0]
    if '/STOCK/files/' in sp:
        return 'stock (' + sp.split('/STOCK/files/', 1)[1].split('/', 1)[0] + ')'
    if '/Asset Library/COMMUNITY/' in sp:                     # an Asset Library pack (F-216)
        d = sp.split('/Asset Library/COMMUNITY/', 1)[1].split('/', 1)[0]
        try:
            return json.loads((ms.COMMUNITY_LIBRARY / d / 'source.json').read_text()).get('name', d)
        except (OSError, ValueError):
            return d
    return 'unknown'


def _log_entries(log) -> List[List[str]]:
    """Lookup log -> [[path, owner]], first lookup of each path only."""
    out, seen = [], set()
    for p, f in log or []:
        if p not in seen:
            seen.add(p)
            out.append([p, _owner(f)])
    return out


_idi_prov_cache: Optional[Dict[int, List[str]]] = None


def _idi_provenance() -> Dict[int, List[str]]:
    """ItemDisplayInfo id -> ['zpak/file.sql'] that touch it (DELETE/UPDATE WHERE id, INSERT ids)."""
    global _idi_prov_cache
    if _idi_prov_cache is None:
        import re
        out: Dict[int, List[str]] = {}
        root = Path(__file__).resolve().parents[2] / 'zpaks'
        for f in sorted(root.glob('*/dbc/*itemdisplayinfo*.sql')):
            tag = f'{f.parts[-3]}/{f.name}'
            text = f.read_text(errors='replace')
            ids = {int(m) for m in re.findall(r'(?i)\bwhere\s+`?id`?\s*=\s*(\d+)', text)}
            ids |= {int(m) for m in re.findall(r'(?i)\bset\s+`?id`?\s*=\s*(\d+)', text)}
            ids |= {int(m) for m in re.findall(r'(?i)\bvalues\s*\(\s*(\d+)', text)}
            ids |= {int(m) for m in re.findall(r'\),\s*\(\s*(\d+)', text)}
            for i in ids:
                out.setdefault(i, []).append(tag)
        _idi_prov_cache = out
    return _idi_prov_cache


def _rows_by(layer: List['ms.Source'], table: str, key: int, row: Optional[dict]) -> List[str]:
    """'zpak/file.sql' for every op in the layer that touches this DBC row, in apply order."""
    out = []
    for src in layer:
        for (kind, k, _), fname in zip(src.delta.ops[table], src.delta.origin[table]):
            hit = (k == key) if not isinstance(k, tuple) else bool(row and ms._match(row, k))
            tag = f'{src.name}/{fname}'
            if hit and tag not in out:
                out.append(tag)
    return out


def _provenance(layer: List['ms.Source'], geo_source: str, did: int, cdi_row: Optional[dict],
                model_id: int, cmd_row: Optional[dict], ext: int, cdx_row: Optional[dict],
                model_path: str, body_log, items: List[dict], srcs: Dict[str, 'ms.Source']) -> dict:
    """Everything one pane is built from, and who supplied it."""
    dbc = [] if not isinstance(did, int) else [   # items / game objects have no display rows of their own
           {'table': 'CreatureDisplayInfo', 'id': did, 'by': _rows_by(layer, 'creaturedisplayinfo', did, cdi_row)},
           {'table': 'CreatureModelData', 'id': model_id, 'by': _rows_by(layer, 'creaturemodeldata', model_id, cmd_row)}]
    if ext:
        dbc.append({'table': 'CreatureDisplayInfoExtra', 'id': ext,
                    'by': _rows_by(layer, 'creaturedisplayinfoextra', ext, cdx_row)})
    idi = _idi_provenance()
    for it in items:
        it['idi_by'] = idi.get(int(it.get('idi') or 0), [])
    body = _log_entries(body_log)
    owner = {p: o for p, o in body}
    model_owner = owner.get(model_path, 'missing')

    def split(path: str, tex_owner: str, mesh_path: str, mesh_owner: str) -> Optional[str]:
        # A texture from a pack that ships its OWN mesh for this model, worn by
        # another pack's mesh: the UV layouts may not match (scuffed textures).
        if tex_owner in srcs and tex_owner != mesh_owner and mesh_path in srcs[tex_owner].assets:
            return f'{path}: texture from {tex_owner}, which ships its own mesh for this model; mesh here is {mesh_owner}'
        return None

    splits = [w for p, o in body if p.endswith('.blp') and (w := split(p, o, model_path, model_owner))]
    for it in items:
        io = {p: o for p, o in it.get('files', [])}
        mo = io.get(it['model'], 'missing')
        for p, o in it.get('files', []):
            if p.endswith('.blp') and (w := split(p, o, it['model'], mo)):
                splits.append(f"{it['slot']}: {w}")
    return {'dbc': dbc, 'geosets': geo_source, 'body': body, 'items': items, 'splits': splits}


def _mesh_bbox(data: bytes) -> Optional[List[float]]:
    """Rest-pose extents of the vertices. The header bounding box is the
    visibility bound (covers particle/animation reach) and overstates size."""
    import struct
    if len(data) < 0x48 or data[:4] != b'MD20':
        return None
    n, off = struct.unpack_from('<II', data, 0x3C)
    if not n or off + 48 * n > len(data):
        return None
    lo, hi = [1e9] * 3, [-1e9] * 3
    for i in range(n):
        v = struct.unpack_from('<3f', data, off + 48 * i)
        for k in range(3):
            if v[k] < lo[k]: lo[k] = v[k]
            if v[k] > hi[k]: hi[k] = v[k]
    return lo + hi


def _ingame_scale(cdi_row: Optional[dict], cmd_row: Optional[dict]) -> float:
    """In-game size factor: CreatureModelData.model_scale x CreatureDisplayInfo
    .creature_model_scale (0 in either means 1, as in the client). Server-side
    creature_template_model.DisplayScale is per creature and not included."""
    def f(row, key):
        try:
            v = float((row or {}).get(key) or 0)
        except (TypeError, ValueError):
            v = 0
        return v if 0 < v < 1000 else 1.0
    return round(f(cmd_row, 'model_scale') * f(cdi_row, 'creature_model_scale'), 4)


def _pane_cameras(panes: List[dict]) -> None:
    """Initial camera per pane, chosen so the panes start at true IN-GAME relative
    size: each aims at its own mesh centre, and its distance is the shared
    in-game framing divided by its own scale factor (the engine draws raw
    geometry). Zoom and pan are per pane afterwards; only the angle is mirrored."""
    def geo(p):
        b = p.get('bbox')
        if not b or not all(abs(v) < 1e5 for v in b):
            return None
        centre = [(b[i] + b[i + 3]) / 2 for i in range(3)]
        radius = 0.5 * sum((b[i + 3] - b[i]) ** 2 for i in range(3)) ** 0.5
        return centre, max(radius, 0.05)
    sizes = [(p, geo(p)) for p in panes]
    game_r = max([g[1] * (p.get('scale') or 1) for p, g in sizes if g] or [1.0])
    for p, g in sizes:
        scale = p.get('scale') or 1
        centre = g[0] if g else [0, 0, 1]
        # The engine's near plane is 1 yd (emscripten_port main.cpp nearPlane = 1.0): anything
        # closer is clipped, so a small model (helm, shoulder, a 0.3 yd prop) framed at 2.1 x its
        # radius vanished. Keep the whole model beyond the plane.
        r = (g[1] if g else 1.0)
        p['camera'] = {'target': [round(v, 3) for v in centre], 'dist': round(max(2.1 * game_r / scale, r + 1.5), 3)}


def _effective_pane(result: dict, did: int, out_root: Path, alloc, equipment: dict) -> Optional[dict]:
    """A display as the build ships it (effective DBC chain + effective files),
    staged under files/effective/. Used for creature-level comparison panes."""
    cdi, cmd = result['effective_dbc']
    row = cdi.get(did)
    if not row:
        return None
    mid = int(row.get('model_id') or 0)
    mrow = cmd.get(mid)
    if not mrow:
        return None
    mp = ms.norm(str(mrow.get('model_path', '')))
    eff = result['effective_assets']
    f = eff.get(mp) or ms.stock_asset(mp)
    if f is None:
        return None
    info = ms.decode_m2(f)
    skins = [str(row.get(k) or '') for k in ms.CDI_TEX_FIELDS]
    r = ms.Resolved(mid, mp, result['effective_owner'].get(mp, 'stock'), info, skins, [])
    files = SourceFiles(eff, {})
    files.log = []
    pane = _stage_pane('effective', r, files, out_root, alloc)
    pane.update(_pane_stats('effective', r, 'build'))
    pane['scale'] = _ingame_scale(row, mrow)
    bb = pane.get('bbox')
    pane['height_yd'] = round((bb[5] - bb[2]) * pane['scale'], 2) if bb else None
    ext = int(row.get('extended_display_info_id') or 0)
    x = None
    if ext and mp.startswith('character/'):
        cdx, chs = result['effective_char_dbc']
        x = cdx.get(ext)
        if x:
            pane['tex'], miss = _char_textures('effective', x, chs, files, out_root, alloc)
            pane['missing'] += miss
            pane['mesh'] = _char_mesh(x, 'effective', pane)
    body_log, files.log = files.log, None
    item_prov: List[dict] = []
    items, miss = _stage_items('effective', _items_for(x, equipment.get(did)), files, out_root, item_prov)
    if items:
        pane['items'] = items
        pane['missing'] += miss
    srcs = {s.name: s for s in result['sources']}
    layer = sorted((s for s in result['sources'] if s.enabled), key=lambda s: s.priority)
    pane['prov'] = _provenance(layer, 'live build', did, row, mid, mrow, ext if x else 0, x,
                               mp, body_log, item_prov, srcs)
    pane['same_as'] = []
    return pane


def deploy(result: dict, out_root: Path, display_ids: Iterable[int], names: Dict[int, List[str]],
           equipment: Optional[Dict[int, dict]] = None, edits: Optional[dict] = None,
           creature_names: Optional[Dict[int, str]] = None) -> dict:
    """Stage the given displays. names: display id -> creature names using it.
    equipment: display id -> {'creature': name, 'items': [{hand, display, class, subclass}]}."""
    equipment = equipment or {}
    out_root.mkdir(parents=True, exist_ok=True)
    srcs = {s.name: s for s in result['sources']}
    eff_assets = result['effective_assets']
    fdids: Dict[tuple, int] = {}
    used_ids: Dict[int, tuple] = {}

    def alloc(src_name: str, f: Path) -> int:
        """Stable fake FileDataID per (source, file): the same on every deploy, so
        a staged fdid/<n> can never hold a different texture after a redeploy."""
        import zlib
        key = (src_name, str(f))
        if key not in fdids:
            fid = 900000000 + zlib.crc32(f'{src_name}|{f}'.encode()) % 99000000
            while fid in used_ids and used_ids[fid] != key:   # collision: probe on
                fid = 900000000 + (fid - 900000000 + 1) % 99000000
            used_ids[fid] = key
            fdids[key] = fid
        return fdids[key]

    # Skin files are keyed by fake id; clear them so nothing stale survives.
    files_root = out_root / 'files'
    if files_root.is_dir():
        for d in files_root.iterdir():
            if (d / 'fdid').is_dir():
                shutil.rmtree(d / 'fdid')

    queue, staged_panes = [], 0
    staged_groups = set()
    for did in display_ids:
        d = result['displays'].get(did)
        if not d:
            continue
        panes = []
        seen = {}
        by_content: Dict[str, dict] = {}
        pane_of: Dict[str, dict] = {}       # source name -> the pane that shows it (after merging twins)
        candidates = [('stock', d['stock'], {})] + \
                     [(n, r, srcs[n].assets) for n, r in d['sources'].items()]
        # The picker renders only the first display of each model group (same set
        # of source|model|sha, as index.html groups them). Stage files for that one;
        # the rest get metadata-only panes, which is all saving a choice needs.
        gkey = tuple(sorted(f'{n}|{r.model_path}|{r.m2.sha256[:10] if r.m2 else None}'
                            for n, r, _ in candidates if r is not None and r.model_path and r.m2 is not None))
        light = gkey in staged_groups
        staged_groups.add(gkey)
        for name, r, own in candidates:
            if r is None or not r.model_path or r.m2 is None:
                continue
            key = (r.model_path, r.m2.sha256, tuple(r.skins))
            # Each pack exactly as it ships: the files it serves, stock for the rest -
            # never another pack's files, so a pane is never pack A's mesh wearing
            # pack B's texture. Items follow the same rule.
            files = SourceFiles(own, {})
            if light:
                if key in seen:            # metadata-only pane: same model file as an earlier one
                    seen[key]['same_as'].append(name)
                    continue
                # Grouping and saving need only source, model and sha (+ flags for the filter).
                pane = {'src': name, 'source': name, 'model': r.model_path, 'flags': r.flags, 'light': True,
                        'stats': {'sha': r.m2.sha256[:10] if r.m2 else None}, 'same_as': []}
                seen[key] = pane
                panes.append(pane)
                continue
            files.log = []
            pane = _stage_pane(name, r, files, out_root, alloc)
            if d.get('kind') == 'item':
                _item_texture(name, d, files, out_root, alloc, pane)
            cdi, cmd = (result['stock_dbc'] if name == 'stock' else (srcs[name].cdi, srcs[name].cmd))
            pane['scale'] = _ingame_scale(cdi.get(did), cmd.get(r.model_id))
            ext = int((cdi.get(did) or {}).get('extended_display_info_id') or 0)
            if ext and r.model_path.startswith('character/'):
                cdx, chs = (result['stock_char_dbc'] if name == 'stock' else (srcs[name].cdx, srcs[name].chs))
                x = cdx.get(ext)
                if x:
                    pane['tex'], miss = _char_textures(name, x, chs, files, out_root, alloc)
                    pane['missing'] += miss
                    pane['mesh'] = _char_mesh(x, name, pane)
                    pane['character'] = {'extra': ext, 'bake': x.get('texture')}
            else:
                x = None
            # Creature-style displays pick geosets with CreatureDisplayInfo.creature_geoset_data:
            # nibble k = the visible geoset of group k+1 (100s..800s); 0 leaves the group unfiltered
            # in game (I-388), see geoset_fix.pane_mesh.
            # e.g. spaceslam's tuskarr 0x11111111 = x01 in groups 1-8.
            if 'mesh' not in pane:
                cgd = int((cdi.get(did) or {}).get('creature_geoset_data') or 0)
                if cgd:
                    from lib import geoset_fix as gf
                    pane['mesh'], allg = gf.pane_mesh(cgd)
                    if allg:
                        pane['geoall'] = allg
            body_log, files.log = files.log, None
            item_prov: List[dict] = []
            items, miss = _stage_items(name, _items_for(x if ext and r.model_path.startswith('character/') else None,
                                                        equipment.get(did)), SourceFiles(own, {}), out_root, item_prov)
            if items:
                pane['items'] = items
                pane['missing'] += miss
            pane['prov'] = _provenance([] if name == 'stock' else [srcs[name]], name, did, cdi.get(did),
                                       r.model_id, cmd.get(r.model_id), ext if x else 0, x,
                                       r.model_path, body_log, item_prov, srcs)
            bb = pane.get('bbox')
            pane['height_yd'] = round((bb[5] - bb[2]) * pane['scale'], 2) if bb else None
            pane.update(_pane_stats(name, r, srcs[name].author if name in srcs else 'Blizzard'))
            # Two sources are "the same" only when every file the pane draws is
            # byte-identical (mesh, skins, anims, textures, items) and the DBC rows
            # resolve the same - not just the same .m2 and texture names.
            ckey = _content_key(body_log, item_prov, pane)
            # The choice log's fingerprint of this option: the content of the files the
            # SOURCE ITSELF serves here (not stock fallbacks). A pack update or a new pack
            # changes it, and the picker sends choices made against the old one to review.
            pane['skeys'] = {name: _source_key(name, body_log, item_prov)}
            if ckey in by_content:
                twin = by_content[ckey]
                twin['same_as'].append(name)
                twin['skeys'][name] = pane['skeys'][name]
                pane_of[name] = twin
                continue
            pane['same_as'] = []
            by_content[ckey] = pane
            pane_of[name] = pane
            seen.setdefault(key, pane)
            panes.append(pane)
            staged_panes += 1
        # Creature-level edits: creatures that left this stock display for others
        # (e.g. F-211 grunts on custom displays). Shown for comparison only.
        for cid, e in sorted(((edits or {}).get('repointed') or {}).items()):
            if light or did not in e['stock']:
                continue
            for live_did in e['live']:
                if live_did in e['stock']:
                    continue
                cp = _effective_pane(result, live_did, out_root, alloc, equipment)
                if not cp:
                    continue
                zp = sorted({x.split('/')[0] for x in e['provenance']})
                cp['source'] = f'creature {cid} → {live_did}'
                cp['author'] = ', '.join(zp) or 'unknown (not in any zpak SQL)'
                cp['compare'] = {'creature': cid, 'name': (creature_names or {}).get(cid, ''),
                                 'display': live_did, 'provenance': e['provenance']}
                panes.append(cp)
                staged_panes += 1
        _pane_cameras(panes)
        ef = d['effective']
        shipping = None
        if ef and ef.m2:
            # the pane of the pack that wins the model file (the build may still mix
            # in other packs' textures; its Sources panel shows exactly what ships)
            shipping = pane_of[ef.origin]['source'] if ef.origin in pane_of else ef.origin
        queue.append({'display': did, 'kind': d.get('kind', 'creature'), 'creatures': names.get(did, [])[:6], 'shipping': shipping,
                      'equipment_from': (equipment.get(did) or {}).get('creature'),
                      'retail_fdid': d['retail_fdid'], 'panes': panes})

    (out_root / 'data').mkdir(exist_ok=True)
    # Provenance ("Sources" panel) is loaded on demand: one small file per pane.
    prov_dir = out_root / 'data' / 'prov'
    if prov_dir.is_dir():
        shutil.rmtree(prov_dir)
    prov_dir.mkdir()
    n_prov = 0
    for entry in queue:
        for pane in entry['panes']:
            if 'prov' in pane:
                for it in pane['prov'].get('items', []):
                    it.pop('_h', None)
                (prov_dir / f'{n_prov}.json').write_text(json.dumps(pane.pop('prov'), separators=(',', ':')))
                pane['prov'] = n_prov
                n_prov += 1
    (out_root / 'data' / 'queue.json').write_text(json.dumps({'displays': queue}, separators=(',', ':')))
    for f in ('index.html', 'pane.html'):
        publish_page(f, out_root)
    eng = out_root / 'engine'
    eng.mkdir(exist_ok=True)
    for f in ('project.js', 'project.wasm', 'project.data', 'hammer.min.js'):
        shutil.copy2(ASSET_DIR / 'engine' / f, eng / f)
    choices = out_root / 'choices'
    choices.mkdir(exist_ok=True)
    try:
        choices.chmod(0o777)
    except OSError:
        pass
    cf = choices / 'model_choices.json'
    if not cf.exists():
        cf.write_text('{}')
        cf.chmod(0o666)
    return {'displays': len(queue), 'panes': staged_panes}
