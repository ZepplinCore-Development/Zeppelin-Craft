"""F-216 build integration: resolve the curated HD collection.

Today the client gets community packs as separate zpaks, and the winner of a path
shared by several packs is decided by patch letter (later letter wins in the
client) and, inside one letter, by zpak priority (higher wins in the merge). The
curated collection replaces that: one manifest that names, for every path any
community source ships, exactly which file goes out.

Phase 1 (this module): the resolver and its regression check.
  - base manifest = for every path whose CURRENT winner is a community source,
    that winning file (the "today's winner" fallback the user chose)
  - paths a Zeppelin zpak wins today stay with that zpak and are NOT curated
  - the check proves the resolver models the builder: every base path must be in
    the built MPQ of its winner's letter, byte-identical to the file it names
Model-viewer choices are layered on top in a later step.
"""
import hashlib
import os
import random
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from lib.manifest import load_manifest

# Pure HD packs folded into the curated collection (F-216, user decision 2026-10-05).
# Packs with their own world/module content ship as they are and are NOT curated:
# patch-open-azeroth (ADTs, custom WMOs) and mod-worgoblin (hybrid module zpak).
COMMUNITY = (
    'patch-hd-everything', 'patch-hd-creatures-mounts', 'patch-hd-buildings',
    'patch-hd-druid-forms', 'patch-gob-retroport',
    'appletrey-2026-07',          # Asset Library release superseding patch-hd-buildings
)


@dataclass
class Entry:
    zpak: str
    letter: str
    priority: int
    file: Path

    @property
    def rank(self) -> Tuple[str, int]:
        # client: later patch letter wins; builder: higher priority wins inside a letter
        return (self.letter, self.priority)


def _norm(rel: str) -> str:
    return rel.replace('\\', '/').lower()


def _index(parsed: Path) -> Dict[str, Path]:
    out = {}
    for root, _dirs, files in os.walk(parsed):
        for f in files:
            if f in ('.gitkeep', '.gitignore'):
                continue
            p = Path(root) / f
            out[_norm(str(p.relative_to(parsed)))] = p
    return out


def discover(craft_root: Path) -> List[dict]:
    """Every ENABLED zpak that packs into a client patch (what patch-mpq builds today)."""
    out = []
    for d in sorted((craft_root / 'zpaks').iterdir()):
        mf = d / 'zpak.json'
        if not mf.is_file():
            continue
        man = load_manifest(mf) or {}
        cp = man.get('client_patch')
        if not cp or not man.get('enabled', True):
            continue
        out.append({'name': man.get('name', d.name), 'path': d, 'letter': cp.replace('PATCH-', '').upper(),
                    'priority': int(man.get('priority', 100)), 'parsed': d / 'mpq' / 'parsed-assets'})
    return out


def apply_supersession(zpaks: List[dict]) -> List[dict]:
    """Asset Library releases that supersede a zpak take its slot (letter, priority) with their files."""
    from lib import model_sources as ms
    out = list(zpaks)
    for ls in ms.library_sources():
        for old in getattr(ls, 'supersedes', []):
            z = next((x for x in out if x['name'] == old), None)
            if z is None:
                continue
            out.remove(z)
            out.append({'name': ls.name, 'path': None, 'letter': z['letter'], 'priority': z['priority'],
                        'parsed': None, 'files': ls.assets})
    return out


def winners(zpaks: List[dict]) -> Dict[str, Entry]:
    """Path -> the copy the client ends up reading today."""
    best: Dict[str, Entry] = {}
    for z in zpaks:
        files = z.get('files')
        if files is None:
            if not z['parsed'] or not z['parsed'].is_dir():
                continue
            files = _index(z['parsed'])
        for p, f in files.items():
            e = Entry(z['name'], z['letter'], z['priority'], f)
            cur = best.get(p)
            if cur is None or e.rank > cur.rank:
                best[p] = e
    return best


def base_manifest(win: Dict[str, Entry]) -> Dict[str, Entry]:
    """Today's winner for every path a community source wins."""
    return {p: e for p, e in win.items() if e.zpak in COMMUNITY}


def _sha1(f: Path) -> str:
    h = hashlib.sha1()
    with f.open('rb') as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b''):
            h.update(chunk)
    return h.hexdigest()


def mpq_listing(mpq: Path) -> Optional[set]:
    from commands.mpq import run_mpqcli
    r = run_mpqcli(['list', str(mpq)], capture_output=True)
    if r.returncode != 0:
        return None
    return {_norm(line.strip()) for line in r.stdout.splitlines() if line.strip()}


def regression(base: Dict[str, Entry], win: Dict[str, Entry], mpq_dir: Path,
               sample: int = 40, extract_dir: Optional[Path] = None) -> dict:
    """Check the resolver against the MPQs patch-mpq actually built.

    presence: every base path must be listed in its winner letter's MPQ.
    content:  a random sample is extracted and hashed against the file the
              manifest names (proves the per-letter priority model too).
    """
    from commands.mpq import run_mpqcli
    report = {'letters': {}, 'missing': [], 'content_checked': 0, 'content_mismatch': []}
    by_letter: Dict[str, List[str]] = {}
    for p, e in base.items():
        by_letter.setdefault(e.letter, []).append(p)
    for letter, paths in sorted(by_letter.items()):
        mpq = mpq_dir / f'PATCH-{letter}.MPQ'
        listing = mpq_listing(mpq) if mpq.is_file() else None
        if listing is None:
            report['letters'][letter] = {'mpq': str(mpq), 'error': 'not built / unreadable', 'paths': len(paths)}
            continue
        miss = [p for p in paths if p not in listing]
        report['letters'][letter] = {'mpq': mpq.name, 'paths': len(paths), 'missing': len(miss),
                                     'mpq_files': len(listing)}
        report['missing'] += [f'{letter}:{p}' for p in miss[:50]]
        if extract_dir is not None and sample:
            rng = random.Random(216)
            for p in rng.sample([p for p in paths if p in listing], min(sample, len(paths) - len(miss))):
                out = extract_dir / letter
                out.mkdir(parents=True, exist_ok=True)
                parts = base[p].file.parts
                arc = Path(*parts[parts.index('parsed-assets') + 1:])
                r = run_mpqcli(['extract', str(mpq), '-o', str(out), '-f', str(arc).replace('/', '\\'), '-k'],
                               capture_output=True)
                got = next((x for x in out.rglob('*') if x.is_file() and _norm(x.name) == _norm(arc.name)), None)
                report['content_checked'] += 1
                if got is None or _sha1(got) != _sha1(base[p].file):
                    report['content_mismatch'].append(f'{letter}:{p}' + ('' if got else ' (not extracted)'))
                if got:
                    got.unlink()
    return report


# --------------------------------------------------------------------------
# Choices overlay
# --------------------------------------------------------------------------

@dataclass
class Want:
    """What one choice needs at one path: `file` from `source` (None = nothing)."""
    source: str
    file: Optional[Path]

    @property
    def key(self) -> str:
        return f'{self.source}|{self.file}'


def winners_excluding(zpaks: List[dict], names) -> Dict[str, Entry]:
    """Who the client would read at each path if the `names` zpaks did not ship."""
    return winners([z for z in zpaks if z['name'] not in names])


def overlay(result: dict, choices: Dict[str, dict], base: Dict[str, Entry],
            rest: Dict[str, Entry]) -> dict:
    """Layer saved model-viewer choices over the base manifest.

    For each choice, every file the chosen source draws for that display (the
    viewer's pure pane: that source's files, stock for the rest) becomes the
    wanted file at its path. The curated set then ships the wanted file, unless
    the zpak that would show through without it (`rest`) already serves exactly
    that file, in which case the path is dropped. Several choices wanting
    different files at one path = a collision, settled by most displays.
    """
    from lib import model_viewer_deploy as mvd
    wants: Dict[str, Dict[str, Tuple[Want, set]]] = {}
    unresolved = []
    for did_s, c in choices.items():
        did, src = (int(did_s) if did_s.isdigit() else did_s), c.get('source')   # 'go:<id>' = game object
        files = mvd.display_files(result, did, src)
        if files is None:
            unresolved.append((did, src))
            continue
        for p, f in files.items():
            w = Want(src, f)
            slot = wants.setdefault(_norm(p), {}).setdefault(w.key, (w, set()))
            slot[1].add(did)
    manifest = dict(base)
    shipped_stock, dropped, collisions, from_choice = 0, 0, [], 0
    for p, opts in wants.items():
        ranked = sorted(opts.values(), key=lambda t: -len(t[1]))
        w, dids = ranked[0]
        if len(ranked) > 1:
            collisions.append({'path': p, 'kept': f'{w.source} ({len(dids)} displays)',
                               'lost': [f'{x.source} ({len(d)} displays)' for x, d in ranked[1:]],
                               'displays': {x.source: sorted(map(str, d)) for x, d in ranked}})
        under = rest.get(p)
        if w.file is None or (under is not None and _same(under.file, w.file)) or \
                (under is None and _is_stock(w.file)):
            if manifest.pop(p, None) is not None:
                dropped += 1
            continue
        manifest[p] = Entry(w.source if w.source in COMMUNITY else 'stock' if _is_stock(w.file) else w.source,
                            'Q', 0, w.file)
        from_choice += 1
        if _is_stock(w.file):
            shipped_stock += 1
    return {'manifest': manifest, 'paths_chosen': len(wants), 'from_choice': from_choice,
            'stock_copies': shipped_stock, 'dropped': dropped, 'collisions': collisions,
            'unresolved': unresolved}


def _is_stock(f: Optional[Path]) -> bool:
    return f is not None and '/STOCK/files/' in str(f)


def _same(a: Path, b: Path) -> bool:
    if a == b:
        return True
    try:
        return a.stat().st_size == b.stat().st_size and _sha1(a) == _sha1(b)
    except OSError:
        return False


def conflicts_by_display(collisions: List[dict]) -> Dict[str, List[str]]:
    """Collisions -> {display id: [message]} for the picker's conflict chip."""
    out: Dict[str, List[str]] = {}
    for c in collisions:
        srcs = c.get('displays', {})
        for src, dids in srcs.items():
            others = ', '.join(f'{s2} ({len(d2)} displays)' for s2, d2 in srcs.items() if s2 != src)
            msg = f"{c['path']}: your pick ({src}) shares this file with {others}"
            for did in dids:
                lst = out.setdefault(did, [])
                if msg not in lst and len(lst) < 12:
                    lst.append(msg)
    return out


# --------------------------------------------------------------------------
# Apply: write the curated zpak
# --------------------------------------------------------------------------

CURATED_ZPAK = 'zep-hd-curated'
BASE_ZPAKS_WITH_DATA = ('patch-hd-everything', 'patch-hd-buildings')   # their dbc/ + sql/ carry over


def _arc(path: str) -> str:
    """Normalised path -> the uppercase archive path parsed-assets uses."""
    return path.upper()


def sync_parsed(manifest: Dict[str, Entry], zpak_dir: Path, log=print) -> dict:
    """Make zpak_dir/mpq/parsed-assets hold exactly the manifest's files.
    Plain copies (no hard links); a file is recopied only when size or mtime differ."""
    import shutil
    dest_root = zpak_dir / 'mpq' / 'parsed-assets'
    dest_root.mkdir(parents=True, exist_ok=True)
    want = {_arc(p): e.file for p, e in manifest.items()}
    copied = kept = removed = 0
    for rel, src in want.items():
        dst = dest_root / rel
        if dst.exists():
            ss, ds = src.stat(), dst.stat()
            if ss.st_size == ds.st_size and int(ss.st_mtime) == int(ds.st_mtime):
                kept += 1
                continue
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src, dst)
        copied += 1
        if copied % 5000 == 0:
            log(f'    copied {copied:,} ...')
    for root, _dirs, files in os.walk(dest_root):
        for f in files:
            p = Path(root) / f
            if str(p.relative_to(dest_root)) not in want:
                p.unlink()
                removed += 1
    return {'copied': copied, 'kept': kept, 'removed': removed}


def write_dbc_sql(craft_root: Path, zpak_dir: Path, overrides: Dict[str, List[str]]) -> dict:
    """dbc/: [F-216]_<table>.sql = stock -> curated, one statement per row, for every
    table the base pack or a pick touches; then our own [I-xxx] fixes that lived in the
    base packs, as they are (they sort after [F-216], so they still apply on top).
    The packs' [BASE,*] files are NOT copied: the stock diff replaces them.
    sql/: the base packs' server SQL (our own I-xxx fixes) as they are."""
    import shutil
    dbc_dir, sql_dir = zpak_dir / 'dbc', zpak_dir / 'sql'
    dbc_dir.mkdir(exist_ok=True)
    sql_dir.mkdir(exist_ok=True)
    for old in list(dbc_dir.glob('*.sql')) + list(sql_dir.glob('*.sql')):
        old.unlink()
    n_dbc = n_sql = 0
    for z in BASE_ZPAKS_WITH_DATA:
        for f in sorted((craft_root / 'zpaks' / z / 'dbc').glob('*.sql')):
            if f.name.startswith('[BASE,'):
                continue
            shutil.copy2(f, dbc_dir / f.name)
            n_dbc += 1
        for f in sorted((craft_root / 'zpaks' / z / 'sql').glob('*.sql')):
            shutil.copy2(f, sql_dir / f.name)
            n_sql += 1
    n_ov = 0
    for table, stmts in sorted(overrides.items()):
        if not stmts:
            continue
        body = [f'-- [F-216] curated HD collection: {table}, stock -> curated',
                '-- Generated by `zep model curate --apply` - DO NOT EDIT; re-pick in the viewer and re-run.',
                '-- The curated state = the base pack\'s data with every row a model-viewer pick depends on',
                '-- taken from the picked pack. One statement per row against STOCK: UPDATE of the columns',
                '-- that differ from stock; DELETE + INSERT for rows stock does not have; DELETE for stock',
                '-- rows the curated state removes. Our [I-xxx] fixes apply after this file.', '']
        (dbc_dir / f'[F-216]_{table}.sql').write_text('\n'.join(body + stmts) + '\n')
        n_ov += len(stmts)
    return {'dbc_files_copied': n_dbc, 'sql_files_copied': n_sql, 'override_statements': n_ov}


def write_manifest(manifest: Dict[str, Entry], zpak_dir: Path, meta: dict) -> Path:
    """curate_manifest.json (git-tracked): path -> [source, sha1]."""
    import json
    out = zpak_dir / 'curate_manifest.json'
    rows = {_arc(p): [e.zpak, _sha1(e.file)] for p, e in sorted(manifest.items())}
    out.write_text(json.dumps({'meta': meta, 'files': rows}, indent=0, separators=(',', ':')))
    return out
