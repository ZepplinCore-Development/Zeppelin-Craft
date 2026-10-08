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
import pickle
import struct
import subprocess
import time
import urllib.request
from pathlib import Path
from typing import Dict, List, Optional, Tuple

LISTFILE = Path('/workspace/project/Zeppelin-Tools/Retroport/retroport_tools/MultiConverter2/listfile.csv')
CACHE = Path('/workspace/project/logs/retail_cache')
DOWNPORT = Path('/workspace/project/Zeppelin-Tools/Retroport/zep_downport/zep_downport')
WAGO = 'https://wago.tools/api'
CONVERT_VERSION = 2     # 2: WXL skin rebuild (m2_skin_rebuild) applied after the downport
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
    """One file by FileDataID from wago.tools (cached)."""
    f = CACHE / 'raw' / str(fdid)
    if f.exists():
        return f.read_bytes() or None
    f.parent.mkdir(parents=True, exist_ok=True)
    try:
        with _get(f'{WAGO}/casc/{fdid}?version={build()}', 120) as r:
            data = r.read()
    except Exception:
        data = b''
    f.write_bytes(data)
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
    work.write_bytes(m2b)
    for k, b in zip(skins, sks):
        files[k].write_bytes(b)
    done.write_text(json.dumps({'__v': CONVERT_VERSION, '__fd': fd, **{k: str(v) for k, v in files.items()}}))
    return files


_cdi: Optional[Dict[int, Tuple[int, List[int]]]] = None


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


def texture_file(fdid: int) -> Optional[Path]:
    """A retail texture by FileDataID, stored under its listfile path."""
    if not fdid:
        return None
    _, by_id = listfile()
    tp = by_id.get(fdid, f'textures/retail/{fdid}.blp')
    dst = CACHE / 'out' / tp
    if dst.exists() and dst.stat().st_size:
        return dst
    blob = fetch(fdid)
    if not blob:
        return None
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(blob)
    return dst


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
    pat = re.compile(re.escape(f'creature/{dd}2') + r'[a-z_]*/' + re.escape(stem + '2') + r'[a-z_]*\.m2')
    global _named_index
    if _named_index is None:
        _named_index = sorted(p for p in by_path if p.startswith('creature/') and p.endswith('.m2'))
    hits = [p for p in _named_index if pat.fullmatch(p)]
    hits.sort(key=lambda p: (p != exact, p))
    return [(p, by_path[p]) for p in hits]


_named_index: Optional[List[str]] = None


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
