"""F-216 Retail option: the modern (retail) version of a model, as WarcraftXL ships it.

WXL downports modern MD21 models to WotLK MD20 (in the client, or offline with the
same transform). The offline converter (Zeppelin-Tools/Retroport/zep_downport, built
from wxl-core-main's shared m2 sources) produces exactly what WXL renders, so the
viewer shows that file and the curated build can ship it.

Scope: creature / object models (self-texturing). Character-type modern models do not
render as 3.3.5 displays even through WXL (no CharSections/geoset bridge, I-234), so
they are not offered.

Files: logs/retail_cache/raw/<fdid>        downloaded originals
       logs/retail_cache/out/<model path>  converted model + skins/anims, textures at their paths
"""
import json
import os
import pickle
import shutil
import struct
import subprocess
import threading
import time
import urllib.request
from pathlib import Path
from typing import Callable, Dict, List, Optional, Tuple

LISTFILE = Path('/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/MultiConverter2/listfile.csv')
CACHE = Path('/workspace/project/logs/retail_cache')
DOWNPORT = Path('/workspace/project/Zeppelin-Tools/Retroport/zep_downport/zep_downport')
WAGO = 'https://wago.tools/api'
CONVERT_VERSION = 3     # 2: WXL skin rebuild (m2_skin_rebuild) applied after the downport; 3: classic animation aliases
_UA = {'User-Agent': 'Zeppelin-F216-model-viewer/1.0 (+curl compatible)'}


def _get(url: str, timeout: int):
    return urllib.request.urlopen(urllib.request.Request(url, headers=_UA), timeout=timeout)

_lf: Optional[Tuple[Dict[str, int], Dict[int, str]]] = None


def listfile() -> Tuple[Dict[str, int], Dict[int, str]]:
    """(path -> fdid, fdid -> path) for the community listfile, cached as a pickle."""
    global _lf
    if _lf is None:
        pk = CACHE / 'listfile.pkl'
        if pk.exists() and pk.stat().st_mtime >= LISTFILE.stat().st_mtime:
            _lf = pickle.loads(pk.read_bytes())
        else:
            by_path, by_id = {}, {}
            with LISTFILE.open(errors='replace') as fh:
                for line in fh:
                    fd, _, p = line.rstrip('\r\n').partition(';')
                    if fd.isdigit() and p:
                        p = p.replace('\\', '/').lower()
                        by_path[p] = int(fd)
                        by_id[int(fd)] = p
            _lf = (by_path, by_id)
            CACHE.mkdir(parents=True, exist_ok=True)
            pk.write_bytes(pickle.dumps(_lf))
    return _lf


_build: Optional[str] = None


def build() -> str:
    global _build
    if _build is None:
        bf = CACHE / 'build.json'
        if bf.exists() and time.time() - bf.stat().st_mtime < 7 * 86400:
            _build = json.loads(bf.read_text())['build']
        else:
            with _get(f'{WAGO}/builds', 60) as r:
                data = json.loads(r.read())
            wow = data.get('wow') or []
            _build = (wow[0]['version'] if isinstance(wow[0], dict) else wow[0]) if wow else '12.1.0.68629'
            CACHE.mkdir(parents=True, exist_ok=True)
            bf.write_text(json.dumps({'build': _build}))
    return _build


def fetch(fdid: int) -> Optional[bytes]:
    """One file by FileDataID: the local CASC store (lib/casc_store, full build), else wago.tools (cached)."""
    from lib import casc_store
    cp = casc_store.path(fdid)
    if cp is not None:
        return cp.read_bytes()
    f = CACHE / 'raw' / str(fdid)
    if f.exists():
        return f.read_bytes() or None
    f.parent.mkdir(parents=True, exist_ok=True)
    try:
        with _get(f'{WAGO}/casc/{fdid}?version={build()}', 120) as r:
            data = r.read()
    except Exception:
        return None                                    # a network failure (wago.tools stalls) is retried next time, never cached
    tmp = f.with_name(f'.{fdid}.{threading.get_ident()}')
    tmp.write_bytes(data)
    tmp.replace(f)                                     # atomic: a killed run never leaves a short file behind
    time.sleep(0.05)                                   # be polite to wago.tools
    return data or None


def chunks(data: bytes) -> Dict[bytes, bytes]:
    out, o = {}, 0
    while o + 8 <= len(data):
        tag, size = data[o:o + 4], struct.unpack_from('<I', data, o + 4)[0]
        out[tag] = data[o + 8:o + 8 + size]
        o += 8 + size
    return out


def _anim_payload(data: bytes) -> bytes:
    """Modern .anim files wrap the raw keyframe data in an AFM2 chunk (and may add
    AFSA/AFSB); the 3.3.5 loader reads the raw block."""
    c = chunks(data)
    return c.get(b'AFM2', data) if data[:4] in (b'AFM2', b'AFSA', b'AFSB') else data


def convert(path: str, log=print, fdid: Optional[int] = None) -> Optional[Dict[str, Path]]:
    """Retail model `fdid` (default: the retail copy of `path` itself; normally its remaster,
    see remaster()), converted the WXL way and laid out AT `path` (skins/anims named after it).
    -> {normalised path: file} (model, skins, anims, textures) or None."""
    by_path, by_id = listfile()
    fd = fdid or by_path.get(path)
    if not fd:
        return None
    out_root = CACHE / 'out'
    done = out_root / (path + '.json')
    if done.exists():
        rec = json.loads(done.read_text())
        if not rec and not fdid:
            return None
        if rec and rec.pop('__v', 0) == CONVERT_VERSION and rec.pop('__fd', by_path.get(path)) == fd:
            return {k: Path(v) for k, v in rec.items()}
    raw = fetch(fd)
    if not raw or raw[:4] != b'MD21':
        done.parent.mkdir(parents=True, exist_ok=True)
        done.write_text('{}')
        return None
    c = chunks(raw)
    stem = path[:-3]
    files: Dict[str, Path] = {}
    work = out_root / path
    work.parent.mkdir(parents=True, exist_ok=True)
    # textures (TXID) -> their retail paths, inlined into the model by the converter
    tsv = []
    txid = c.get(b'TXID', b'')
    for i in range(len(txid) // 4):
        t = struct.unpack_from('<I', txid, 4 * i)[0]
        if not t:
            continue
        tp = by_id.get(t, f'textures/retail/{t}.blp')
        tsv.append(f'{t}\t{tp.replace("/", chr(92)).upper()}')
        blob = fetch(t)
        if blob:
            dst = out_root / tp
            dst.parent.mkdir(parents=True, exist_ok=True)
            dst.write_bytes(blob)
            files[tp] = dst
    (work.parent / (work.name + '.tsv')).write_text('\n'.join(tsv) + '\n')
    skel = None
    if b'SKID' in c:
        sk = fetch(struct.unpack_from('<I', c[b'SKID'], 0)[0])
        if sk:
            skel = work.parent / (work.name + '.skel')
            skel.write_bytes(sk)
    src = work.parent / (work.name + '.md21')
    src.write_bytes(raw)
    cmd = [str(DOWNPORT), str(src), str(work), str(work.parent / (work.name + '.tsv'))] + ([str(skel)] if skel else [])
    r = subprocess.run(cmd, capture_output=True, text=True)
    if r.returncode != 0 or not work.exists():
        log(f'    retail {path}: convert failed: {(r.stderr or r.stdout).strip()[-200:]}')
        done.write_text('{}')
        return None
    files[path] = work
    sfid = c.get(b'SFID', b'')
    for v in range(min(len(sfid) // 4, 4)):
        s = struct.unpack_from('<I', sfid, 4 * v)[0]
        blob = fetch(s) if s else None
        if blob:
            dst = out_root / f'{stem}{v:02d}.skin'
            dst.write_bytes(blob)
            files[f'{stem}{v:02d}.skin'] = dst
    afid = c.get(b'AFID', b'')
    for i in range(len(afid) // 8):
        aid, sub, a = struct.unpack_from('<HHI', afid, 8 * i)
        blob = fetch(a) if a else None
        if blob:
            dst = out_root / f'{stem}{aid:04d}-{sub:02d}.anim'
            dst.write_bytes(_anim_payload(blob))
            files[f'{stem}{aid:04d}-{sub:02d}.anim'] = dst
    # WXL's skin rebuild: the in-client loader only does it for files it reads itself
    from lib import m2_skin_rebuild
    skins = sorted(k for k in files if k.startswith(stem) and k.endswith('.skin'))
    m2b, sks = m2_skin_rebuild.rebuild(work.read_bytes(), [files[k].read_bytes() for k in skins], path, log)
    # classic animations retail's model lacks: alias each to its nearest more-specific stand-in (m2_tracks)
    try:
        from lib import m2_tracks
        pairs = classic_standins(m2_tracks.anim_ids(m2b))
        if pairs:
            m2b = m2_tracks.add_aliases(m2b, pairs)
            log(f'    retail {path}: {len(pairs)} classic animation(s) aliased: '
                + ', '.join(f'{x}<-{y}' for x, y in pairs[:12]))
    except Exception as ex:                            # the plain conversion still ships
        log(f'    retail {path}: animation aliases skipped - {ex}')
    work.write_bytes(m2b)
    for k, b in zip(skins, sks):
        files[k].write_bytes(b)
    done.write_text(json.dumps({'__v': CONVERT_VERSION, '__fd': fd, **{k: str(v) for k, v in files.items()}}))
    return files


_cdi: Optional[Dict[int, Tuple[int, List[int]]]] = None
_anim_fb: Optional[Dict[int, int]] = None
CLIENT_MAX_ANIM = 505                                   # the 3.3.5 client resolves ids 0..505


def anim_fallbacks() -> Dict[int, int]:
    """Retail AnimationData: id -> fallback id (cached per build)."""
    global _anim_fb
    if _anim_fb is None:
        f = CACHE / f'animfb_{build()}.pkl'
        if f.exists():
            _anim_fb = pickle.loads(f.read_bytes())
        else:
            _anim_fb = {int(r['ID']): int(r.get('Fallback') or 0) for r in _csv('AnimationData')}
            f.write_bytes(pickle.dumps(_anim_fb))
    return _anim_fb


def classic_standins(have) -> List[Tuple[int, int]]:
    """(missing classic id, stand-in id) pairs for a model with animations `have`: for each classic id
    (<= 505) the model lacks, the animation it has whose fallback chain reaches that id soonest - a more
    specific child (SpellCast 32 <- SpellCastArea 33 <- SpellCastOmni 54). The client would otherwise drop
    to the PARENT (32 -> AttackUnarmed 16). Ids with no such child are left to the client's fallback."""
    fb = anim_fallbacks()
    have = set(have)
    best: Dict[int, Tuple[int, int]] = {}
    for y in have - {0}:                                # Stand falls back to the door chain (Closed 147 ...)
        x, d, seen = fb.get(y, 0), 1, {y}
        while x and x not in seen and d < 12:           # a chain ends at Stand (0)
            if x <= CLIENT_MAX_ANIM and x not in have and (x not in best or (d, y) < best[x]):
                best[x] = (d, y)
            seen.add(x)
            x, d = fb.get(x, 0), d + 1
    return sorted((x, y) for x, (d, y) in best.items())


def _csv(table: str):
    import csv
    import io
    with _get(f'https://wago.tools/db2/{table}/csv?build={build()}', 300) as r:
        text = r.read().decode('utf-8', 'replace')
    return csv.DictReader(io.StringIO(text))


def display_row(did: int) -> Tuple[int, List[int]]:
    """Retail CreatureDisplayInfo for a display id: (model FileDataID, TextureVariationFileDataID[0..2]),
    (0, []) when absent. Same id in retail for classic-era content."""
    global _cdi
    if _cdi is None:
        pk = CACHE / f'cdi2_{build()}.pkl'
        if pk.exists():
            _cdi = pickle.loads(pk.read_bytes())
        else:
            models = {int(r['ID']): int(r['FileDataID'] or 0) for r in _csv('CreatureModelData') if r['ID'].isdigit()}
            _cdi = {}
            for r in _csv('CreatureDisplayInfo'):
                if r['ID'].isdigit():
                    _cdi[int(r['ID'])] = (models.get(int(r['ModelID'] or 0), 0),
                                          [int(r[f'TextureVariationFileDataID_{i}'] or 0) for i in range(3)])
            CACHE.mkdir(parents=True, exist_ok=True)
            pk.write_bytes(pickle.dumps(_cdi))
    return _cdi.get(did, (0, []))


def display_textures(did: int, model_fdid: int) -> List[int]:
    """The retail skins of a display, for the retail copy of the model file `model_fdid`.
    Retail moved many classic displays onto newer models (thunderlizard 3005 -> a new mesh with
    a new UV layout); their skins only fit that new mesh, so they are not offered for the old
    file: [] = keep the display's own (stock) skins, which match the old file's UVs."""
    mf, tex = display_row(did)
    return tex[:3] if mf and mf == model_fdid else []


def remaster(path: str, dids) -> int:
    """The retail remaster of a classic model: Blizzard ships a remaster as a NEW file
    (thunderlizard -> thunderlizard2/thunderlizard2.m2) and repoints the displays; the old file
    stays as it was. -> its FileDataID when at least 3/4 of the model's displays that retail has
    moved to ONE other model and the rest still use this file (golemstone: 50 of 52 ->
    golemstone2), else 0 (unchanged, or split between several models: decided per display).
    The displays retail left behind wear a moved sibling's skins (sibling_textures)."""
    if path.startswith(('character/', 'item/')):
        return 0
    by_path, by_id = listfile()
    own = by_path.get(path, 0)
    rows = [display_row(int(d))[0] for d in dids]
    rows = [m for m in rows if m]
    moved = [m for m in rows if m != own]
    if not moved or len(set(moved)) != 1 or len(moved) * 4 < len(rows) * 3:
        return 0
    m = moved[0]
    target = by_id.get(m, '')
    # character models can't be 3.3.5 creature displays (I-234); an unrelated name on ONE
    # display is retail reusing the id (crystalspider 4 -> murloc2), not a remaster
    if not target.startswith('creature/'):
        return 0
    if len(moved) < 2 and not _related(path, target):
        return 0
    return m


def sibling_textures(did: int, model_fdid: int, dids, our_skins) -> List[int]:
    """Retail skins for a display retail left on the old file while remastering its siblings:
    those of a moved sibling that wore the same skins on the old model (our_skins(did) -> tuple),
    else the commonest set among the moved ones."""
    own = display_textures(did, model_fdid)
    if any(own):
        return own
    from collections import Counter
    mine = our_skins(did)
    moved = [d for d in dids if display_row(int(d))[0] == model_fdid and any(display_textures(int(d), model_fdid))]
    same = next((d for d in moved if our_skins(d) == mine), None)
    if same is not None:
        return display_textures(int(same), model_fdid)
    common = Counter(tuple(display_textures(int(d), model_fdid)) for d in moved).most_common(1)
    return list(common[0][0]) if common else []


def _related(a: str, b: str) -> bool:
    import re
    from difflib import SequenceMatcher
    x, y = (re.sub(r'[\d_]+', '', p.rsplit('/', 1)[-1].rsplit('.', 1)[0]) for p in (a, b))
    n = SequenceMatcher(None, x, y).find_longest_match(0, len(x), 0, len(y)).size
    return n >= min(4, len(x), len(y))


def remasters(cdi: dict, cmd: dict, paths) -> Dict[str, int]:
    """{path: remaster FileDataID} for the given model paths, from a CreatureDisplayInfo /
    CreatureModelData pair (the live DBC)."""
    from lib import model_sources as ms
    want = set(paths)
    dids: Dict[str, List[int]] = {}
    for did, row in cdi.items():
        mrow = cmd.get(int(row.get('model_id') or 0))
        p = ms.norm(str(mrow.get('model_path') or '')) if mrow else ''
        if p in want:
            dids.setdefault(p, []).append(did)
    out = {}
    for p, ds in dids.items():
        r = remaster(p, ds)
        if r:
            out[p] = r
    return out


def texture_file(fdid: int, offline: bool = False) -> Optional[Path]:
    """A retail texture by FileDataID, stored under its listfile path (a hard link to the raw store).
    offline=True never touches the network: None when the file is not in the local store yet
    (fill it with prefetch() / `zep model retail-store`)."""
    if not fdid:
        return None
    _, by_id = listfile()
    tp = by_id.get(fdid, f'textures/retail/{fdid}.blp')
    dst = CACHE / 'out' / tp
    from lib import casc_store
    cp = casc_store.path(fdid)                         # the CASC store first: full quality, current build
    if cp is not None:
        if dst.exists() and os.path.samefile(dst, cp):
            return dst
        dst.parent.mkdir(parents=True, exist_ok=True)
        tmp = dst.with_name(f'.{dst.name}.{threading.get_ident()}')
        try:
            os.link(cp, tmp)
        except OSError:
            shutil.copyfile(cp, tmp)
        tmp.replace(dst)                               # replaces an older wago / Wowhead copy
        return dst
    if dst.exists() and dst.stat().st_size:
        return dst
    raw = CACHE / 'raw' / str(fdid)
    if not (raw.exists() and raw.stat().st_size):
        alt = CACHE / 'raw_wowhead' / str(fdid)
        if alt.exists() and alt.stat().st_size:
            raw = alt
        elif offline:
            return None
        elif not fetch(fdid):
            if not wowhead_texture(fdid):
                return None
            raw = alt
    dst.parent.mkdir(parents=True, exist_ok=True)
    try:
        os.link(raw, dst)                              # one copy on disk
    except OSError:
        shutil.copyfile(raw, dst)
    return dst


def wowhead_texture(fdid: int) -> Optional[Path]:
    """Fallback for a texture wago.tools cannot serve (HTTP 503 on ~3k armour region files, every build):
    Wowhead's model viewer CDN has it as WebP; re-encoded to BLP (DXT5 with alpha, else DXT1) and kept
    apart from the raw wago bytes in logs/retail_cache/raw_wowhead/<fdid>. Textures only."""
    import io
    from PIL import Image
    from lib.wardrobe.blp import write_blp_dxt
    dst = CACHE / 'raw_wowhead' / str(fdid)
    if dst.exists() and dst.stat().st_size:
        return dst
    try:
        req = urllib.request.Request(f'https://wow.zamimg.com/modelviewer/live/textures/{fdid}.webp',
                                     headers={'User-Agent': 'Mozilla/5.0'})
        with urllib.request.urlopen(req, timeout=60) as r:
            im = Image.open(io.BytesIO(r.read())).convert('RGBA')
    except Exception:
        return None
    dst.parent.mkdir(parents=True, exist_ok=True)
    tmp = dst.with_name(f'.{fdid}.{threading.get_ident()}')
    alpha = im.getchannel('A').getextrema()[0] < 255
    write_blp_dxt(im, tmp, 'DXT5' if alpha else 'DXT1')
    tmp.replace(dst)
    return dst


def prefetch(fdids, workers: int = 6, log: Callable = print, wowhead: bool = False) -> Tuple[int, int, int]:
    """Download FileDataIDs into the local store (logs/retail_cache/raw/<fdid>) so texture_file /
    fetch never stream them. Resumable: files already stored are skipped. -> (had, got, failed)."""
    want = sorted({int(x) for x in fdids if x})
    todo = [x for x in want if not (CACHE / 'raw' / str(x)).exists() and not (CACHE / 'raw_wowhead' / str(x)).exists()]
    had, got, bad = len(want) - len(todo), 0, 0
    log(f'  retail store: {len(want):,} wanted, {had:,} stored, {len(todo):,} to download ({workers} workers)')
    if not todo:
        return had, 0, 0
    build()                                            # resolve the build once, not per thread
    t0 = time.time()
    from concurrent.futures import ThreadPoolExecutor, as_completed
    with ThreadPoolExecutor(workers) as ex:
        # wowhead=True (textures only): a file wago.tools cannot serve comes from Wowhead's CDN instead
        futs = [ex.submit((lambda x: fetch(x) or wowhead_texture(x)) if wowhead else fetch, x) for x in todo]
        for i, fu in enumerate(as_completed(futs), 1):
            if fu.result():
                got += 1
            else:
                bad += 1
            if i % 500 == 0 or i == len(todo):
                el = time.time() - t0
                log(f'  retail store: {i:,}/{len(todo):,} ({bad:,} failed) - {el / 60:.0f} min, '
                    f'~{el / i * (len(todo) - i) / 60:.0f} min left')
    return had, got, bad


def named_remasters(path: str) -> List[Tuple[str, int]]:
    """Retail remasters of a classic creature model found BY NAME, for models the display rule
    (remaster()) finds nothing for: retail made <dir>2/<name>2.m2 but never moved the classic
    displays onto it (mountaingiant -> mountaingiant2, used only by new retail displays).
    -> [(path, fdid)]: the exact <dir>2/<name>2.m2 first, then suffixed siblings
    (mountaingiant2ice, gnoll2caster), each a separate option. Nothing is automatic: the new mesh
    has its own UVs and no retail display maps our display ids to a skin, so every display is
    given its target + retail skins in the picker (choices 'display', sources ['retail'])."""
    import re
    if not path.startswith('creature/') or not path.endswith('.m2'):
        return []
    by_path, _ = listfile()
    d, f = path.rsplit('/', 1)
    dd, stem = d.rsplit('/', 1)[-1], f[:-3]
    exact = f'creature/{dd}2/{stem}2.m2'
    # <name>2 and the other numberings retail used (wendigo_02 beside wendigo2)
    pat = re.compile(re.escape(f'creature/{dd}') + r'_?\d+[a-z_]*/' + re.escape(stem) + r'_?\d+[a-z_]*\.m2')
    global _named_index
    if _named_index is None:
        _named_index = sorted(p for p in by_path if p.startswith('creature/') and p.endswith('.m2'))
    hits = [p for p in _named_index if pat.fullmatch(p) and p != path]
    hits.sort(key=lambda p: (p != exact, p))
    return [(p, by_path[p]) for p in hits]


_named_index: Optional[List[str]] = None


_by_name: Optional[Dict[str, List[str]]] = None


def name_key(text: str) -> str:
    """'Molten Giant' / 'MoltenGiant' -> 'moltengiant' (lowercase letters and digits only)."""
    import re
    return re.sub(r'[^a-z0-9]', '', str(text or '').lower())


def name_remasters(names) -> List[Tuple[str, int]]:
    """Retail creature models named after a DISPLAY's creature or skin, not its model: display 8269 Molten
    Giant is stock mountaingiant.m2 wearing MoltenGiant, and retail has creature/moltengiant/moltengiant.m2.
    A name matches creature/<name>*/<name>[_]<digits>.m2 exactly (keys under 6 letters are skipped:
    'ogre' would sweep in every ogre model)."""
    import re
    global _by_name, _named_index
    by_path, _ = listfile()
    if _by_name is None:
        if _named_index is None:
            _named_index = sorted(p for p in by_path if p.startswith('creature/') and p.endswith('.m2'))
        _by_name = {}
        for p in _named_index:
            d, f = p.rsplit('/', 1)
            k = re.sub(r'_?\d+$', '', f[:-3])
            if d.rsplit('/', 1)[-1].startswith(k):
                _by_name.setdefault(k, []).append(p)
    out: List[Tuple[str, int]] = []
    for n in names:
        k = name_key(n)
        if len(k) < 6:
            continue
        for p in sorted(_by_name.get(k, []), key=lambda x: (len(x), x)):
            if (p, by_path[p]) not in out:
                out.append((p, by_path[p]))
    return out


def skin_sets(fdid: int) -> List[Tuple[List[int], int]]:
    """Distinct retail skin sets the displays of model `fdid` wear: [([fdid x3], displays)],
    commonest first."""
    from collections import Counter
    display_row(0)
    c = Counter(tuple(t[:3]) for m, t in _cdi.values() if m == fdid and any(t))
    return [(list(k), n) for k, n in sorted(c.items(), key=lambda kv: (-kv[1], kv[0]))]


def retail_displays(fdid: int) -> int:
    display_row(0)
    return sum(1 for m, _ in _cdi.values() if m == fdid)


def anim_ids(data: bytes) -> List[int]:
    """Sequence animation ids of an MD20 (any version) or MD21 model, sorted, unique."""
    if data[:4] == b'MD21':
        data = data[8:]
    if data[:4] != b'MD20' or len(data) < 0x24:
        return []
    n, o = struct.unpack_from('<II', data, 0x1C)
    ver = struct.unpack_from('<I', data, 4)[0]
    stride = 0x40 if ver >= 264 else 0x44          # TBC sequences carry an end timestamp
    if o + n * stride > len(data):
        return []
    return sorted({struct.unpack_from('<H', data, o + i * stride)[0] for i in range(n)})


def retail_anim_ids(fdid: int) -> List[int]:
    raw = fetch(fdid)
    return anim_ids(raw) if raw else []


_cmd_ids: Optional[Dict[int, int]] = None


def model_data_id(fdid: int) -> int:
    """Retail CreatureModelData ID of model file `fdid` (the lowest, when several rows share it),
    0 when none. A retail model shipped as a new model of ours takes this id, so it is stable
    across builds and recognisable."""
    global _cmd_ids
    if _cmd_ids is None:
        pk = CACHE / f'cmdid_{build()}.pkl'
        if pk.exists():
            _cmd_ids = pickle.loads(pk.read_bytes())
        else:
            _cmd_ids = {}
            for r in _csv('CreatureModelData'):
                if r['ID'].isdigit() and (r['FileDataID'] or '').isdigit():
                    fd, i = int(r['FileDataID']), int(r['ID'])
                    if fd and (fd not in _cmd_ids or i < _cmd_ids[fd]):
                        _cmd_ids[fd] = i
            CACHE.mkdir(parents=True, exist_ok=True)
            pk.write_bytes(pickle.dumps(_cmd_ids))
    return _cmd_ids.get(fdid, 0)


_cdg: Optional[Dict[int, List[Tuple[int, int]]]] = None


def geoset_data(did: int) -> List[Tuple[int, int]]:
    """Retail CreatureDisplayInfoGeosetData of a display: [(GeosetIndex, GeosetValue)]. Index i is
    geoset GROUP i+1 and the value its variant, i.e. geoset (i+1)*100 + value - the same layout as
    3.3.5's creature_geoset_data nibbles (dragonspawn2: (0,6) (1,2) (2,1) (3,1) = 106 202 301 401,
    all present in its .skin). Without it a model draws EVERY variant at once."""
    global _cdg
    if _cdg is None:
        pk = CACHE / f'cdg_{build()}.pkl'
        if pk.exists():
            _cdg = pickle.loads(pk.read_bytes())
        else:
            _cdg = {}
            for r in _csv('CreatureDisplayInfoGeosetData'):
                try:
                    _cdg.setdefault(int(r['CreatureDisplayInfoID']), []).append((int(r['GeosetIndex']), int(r['GeosetValue'])))
                except (KeyError, ValueError):
                    continue
            CACHE.mkdir(parents=True, exist_ok=True)
            pk.write_bytes(pickle.dumps(_cdg))
    return _cdg.get(did, [])


def geo_nibbles(pairs) -> List[int]:
    """[(index, value)] -> the 8 creature_geoset_data nibbles (groups 1..8); later groups dropped."""
    out = [0] * 8
    for i, v in pairs:
        if 0 <= i < 8 and 0 <= v < 16:
            out[i] = v
    return out


def to_335_nibbles(pairs, mesh: Dict[int, List[int]]) -> List[int]:
    """Retail geoset data -> 3.3.5 creature_geoset_data nibbles FOR THIS MESH. The two clients read an unset
    group differently: retail draws geoset group*100 + value, so a group with no data (value 0) draws NOTHING;
    3.3.5 reads a 0 nibble as "every variant". mountaingiant2's grass-tuft group 1 (101) is set only on the
    mossy skins (106014); the bare-rock displays (100214) carry no data and show no tufts - copied as 0 they
    drew the tufts as dark plates. So every group the mesh has gets retail's value when the mesh has it, else
    the lowest variant it lacks ("none (hidden)"). Groups past 8 can't be expressed; groups the mesh lacks stay 0."""
    vals = dict((i + 1, v) for i, v in pairs)
    out = [0] * 8
    for g, vs in mesh.items():
        if not 1 <= g <= 8:
            continue
        v = vals.get(g, 0)
        if v in vs:
            out[g - 1] = v
        else:
            out[g - 1] = next((x for x in range(1, 16) if x not in vs), 0)
    return out


def pack_nibbles(nibbles) -> int:
    return sum((int(v) & 0xF) << (4 * k) for k, v in enumerate(list(nibbles)[:8]))


def set_nibbles(fdid: int, skins) -> List[int]:
    """The 3.3.5 nibbles retail's displays of this model wearing `skins` use (commonest); a set no retail
    display wears gets retail's no-data default (every optional group hidden)."""
    want = [int(x or 0) for x in list(skins)[:3]] + [0] * (3 - len(list(skins)[:3]))
    sets, _ = skin_sets_geo(fdid)
    hit = next((x for x in sets if [int(y or 0) for y in x[0]] == want), None)
    return list(hit[2]) if hit else to_335_nibbles([], mesh_geosets(fdid))


def skin_sets_geo(fdid: int):
    """skin_sets() plus, per set, the commonest geoset choice of the displays wearing it, and the
    geoset values retail uses per group on this model: ([[skins x3, displays, nibbles x8]], {group: [values]})."""
    from collections import Counter
    display_row(0)
    by_set: Dict[tuple, Counter] = {}
    mesh = mesh_geosets(fdid)
    groups: Dict[int, set] = {}
    for did, (m, t) in _cdi.items():
        if m != fdid:
            continue
        raw = geoset_data(did)
        for k, v in enumerate(geo_nibbles(raw)):
            if v:
                groups.setdefault(k + 1, set()).add(v)
        if any(t[:3]):
            by_set.setdefault(tuple(t[:3]), Counter())[tuple(to_335_nibbles(raw, mesh))] += 1
    sets = [[list(k), sum(c.values()), list(c.most_common(1)[0][0])] for k, c in by_set.items()]
    sets.sort(key=lambda x: (-x[1], x[0]))
    if not sets:
        sets = folder_skin_sets(fdid)
    return sets, {g: sorted(v) for g, v in sorted(groups.items())}


_mesh_geo: Dict[int, Dict[int, List[int]]] = {}


def mesh_geosets(fdid: int) -> Dict[int, List[int]]:
    """{group: [variants]} the retail model's first .skin really has (groups >= 1). Retail displays use only
    some of them (dragonspawn2darkshade: armour group 2 has 2/3/4, its 11 displays use 3/4); the Display editor
    offers the mesh's full set."""
    import struct
    if fdid in _mesh_geo:
        return _mesh_geo[fdid]
    out: Dict[int, set] = {}
    try:
        data = fetch(fdid)
        ch = chunks(data) if data and data[:4] == b'MD21' else {}
        sf = struct.unpack_from('<I', ch[b'SFID'], 0)[0] if b'SFID' in ch else 0
        sk = fetch(sf) if sf else None
        if sk and sk[:4] == b'SKIN':
            ns, os_ = struct.unpack_from('<II', sk, 28)
            for j in range(ns):
                g = struct.unpack_from('<H', sk, os_ + 48 * j)[0]
                if g // 100 >= 1 and g % 100:
                    out.setdefault(g // 100, set()).add(g % 100)
    except (struct.error, TypeError, KeyError):
        pass
    _mesh_geo[fdid] = {k: sorted(v) for k, v in sorted(out.items())}
    return _mesh_geo[fdid]


def folder_skin_sets(fdid: int) -> List[list]:
    """Skin sets for a retail model NO retail display uses (creature/wendigo_02: 0 displays, so 0 sets
    and an invisible pane - its body is a display-skin slot): each texture in the model's folder that the
    model does not hardcode (TXID), in its first display-skin slot. [[skins x3, 0 displays, no geosets]]"""
    import struct
    _, by_id = listfile()
    path = by_id.get(fdid, '')
    if '/' not in path:
        return []
    data = fetch(fdid)
    if not data:
        return []
    ch = chunks(data) if data[:4] == b'MD21' else {b'MD21': data}
    md = ch.get(b'MD21', data)
    try:
        n, o = struct.unpack_from('<II', md, 0x50)
        types = [struct.unpack_from('<I', md, o + 16 * i)[0] for i in range(n)]
    except struct.error:
        return []
    slot = next((t - 11 for t in types if 11 <= t <= 13), None)
    if slot is None:
        return []
    fixed = set(struct.unpack_from(f'<{len(ch[b"TXID"]) // 4}I', ch[b'TXID'])) if b'TXID' in ch else set()
    folder = path.rsplit('/', 1)[0] + '/'
    by_path, _ = listfile()
    out = []
    for p, f in sorted(by_path.items()):
        if p.startswith(folder) and p.endswith('.blp') and '/' not in p[len(folder):] and f not in fixed:
            sk = [0, 0, 0]
            sk[slot] = f
            out.append([sk, 0, [0] * 8])
    return out


def folder_remasters(pack_path: str, stock_paths) -> List[Tuple[str, int]]:
    """Retail models a community pack's model points at: the same path in retail (a straight
    retroport) and the creature models in its folder - packs keep retail's folder, renaming the file
    (patch-hd-creatures-mounts' creature/dragon2/dragon2fixed.m2 -> retail creature/dragon2/dragon2.m2).
    Only for a pack folder that is not a stock folder (stock folders are the classic models)."""
    if not pack_path.startswith('creature/') or not pack_path.endswith('.m2'):
        return []
    by_path, _ = listfile()
    folder = pack_path.rsplit('/', 1)[0] + '/'
    if any(str(p).startswith(folder) for p in stock_paths):
        return []
    hits = sorted(p for p in by_path if p.startswith(folder) and p.endswith('.m2') and '/' not in p[len(folder):])
    hits.sort(key=lambda p: (p != pack_path, p))
    return [(p, by_path[p]) for p in hits]
