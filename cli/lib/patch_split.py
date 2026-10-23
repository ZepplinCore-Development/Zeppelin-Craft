"""Split MPQ patches: one register line, many ~1 GB archive pieces (F-216 / F-167).

A zpak whose zpak.json carries `build.split` ships its patch letter as pieces instead of one archive:

    "build": {"split": [{"piece": "01", "match": ["CREATURE/[A-D]*"]}, ..., {"piece": "15", "match": ["*"]}]}

- Each packed path (parsed-assets, uppercase) goes to the FIRST piece whose glob matches, so a file never
  moves between pieces while the rules stay the same: a changed model re-ships only its own piece.
- Piece files are `PATCH-<L>-<piece>.MPQ` in MPQ/. The x64 client loads `patch-*.MPQ` with any suffix,
  alphabetically (F-162); pieces never share a path, so their order does not matter.
- The register gets ONE bundle entry `PATCH-<L>` whose `files` are the pieces, each with the md5 of its
  archive and `content`, a hash of what it packs. A piece whose content is unchanged is not repacked and
  keeps its md5, so a launcher (>= 3.3.0) re-downloads only the pieces whose md5 changed.
- The single-archive entry `PATCH-<L>.MPQ` leaves the register. Launchers delete that file and pieces that
  leave the bundle: `PATCH-Q.MPQ` sorts after `PATCH-Q-*.MPQ`, so a leftover would override every piece.
"""
from __future__ import annotations

import fnmatch
import hashlib
import json
import os
import shutil
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

HASH_CACHE = Path('/workspace/project/logs/split_hash_cache.json')
STAGE_ROOT = Path('/workspace/project/logs/split_stage')     # same filesystem as the zpaks: hardlinks


def piece_name(letter: str, piece: str) -> str:
    return f'PATCH-{letter}-{piece}.MPQ'


def assign(rel: str, rules: List[Dict[str, Any]]) -> Optional[str]:
    """The piece a packed path ships in: the first rule with a matching glob (paths are matched uppercase)."""
    up = rel.replace('\\', '/').upper()
    for r in rules:
        if any(fnmatch.fnmatchcase(up, g.upper()) for g in r.get('match', [])):
            return str(r['piece'])
    return None


def collect(buildable: List[Tuple[Dict[str, Any], Path]]) -> Dict[str, Path]:
    """rel path -> source file of the merged patch: higher priority wins, as build_patch's merge does
    (buildable is sorted highest priority first)."""
    out: Dict[str, Path] = {}
    for _zpak, parsed in buildable:
        for root, _dirs, files in os.walk(parsed):
            for fn in files:
                if fn in ('.gitkeep', '.gitignore'):
                    continue
                p = Path(root) / fn
                rel = p.relative_to(parsed).as_posix()
                out.setdefault(rel, p)
    return out


def _load_cache() -> Dict[str, list]:
    try:
        return json.loads(HASH_CACHE.read_text())
    except (OSError, ValueError):
        return {}


def content_hash(f: Path, cache: Dict[str, list]) -> str:
    """sha1 of a file, cached by (size, mtime_ns): a curate apply that rewrites a file with the same bytes
    does not count as a change."""
    st = f.stat()
    hit = cache.get(str(f))
    if hit and hit[0] == st.st_size and hit[1] == st.st_mtime_ns:
        return hit[2]
    h = hashlib.sha1()
    with open(f, 'rb') as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b''):
            h.update(chunk)
    cache[str(f)] = [st.st_size, st.st_mtime_ns, h.hexdigest()]
    return h.hexdigest()


def _stage(files: Dict[str, Path], dest: Path) -> None:
    """A directory holding exactly these files at their archive paths: hardlinks (mpqcli stores a symlink
    under its target's path), a copy where a link is not possible."""
    shutil.rmtree(dest, ignore_errors=True)
    for rel, src in files.items():
        d = dest / rel
        d.parent.mkdir(parents=True, exist_ok=True)
        try:
            os.link(src, d)
        except OSError:
            shutil.copy2(src, d)


def build_split(letter: str, buildable: List[Tuple[Dict[str, Any], Path]], rules: List[Dict[str, Any]],
                nginx_path: Path, register: Dict[str, Any], pack, backup, md5, timestamp, next_version,
                display_name: str, description: str, dry_run: bool = False) -> bool:
    """Pack PATCH-<letter> as pieces and write its bundle entry (see the module doc). pack/backup/md5/
    timestamp/next_version are patch_builder's and patch_register's helpers."""
    files = collect(buildable)
    by_piece: Dict[str, Dict[str, Path]] = {}
    unassigned = []
    for rel, src in files.items():
        p = assign(rel, rules)
        if p is None:
            unassigned.append(rel)
            continue
        by_piece.setdefault(p, {})[rel] = src
    if unassigned:
        print(f"  {len(unassigned)} files match no piece (add a catch-all '*' rule): {unassigned[:5]}")
        return False

    key = f'PATCH-{letter}'
    patches = register.setdefault('patches', {})
    old = patches.get(key) or {}
    old_files = {m['name']: m for m in old.get('files') or []}
    out_dir = nginx_path / 'MPQ'
    cache = _load_cache()
    members, changed = [], []
    order = [str(r['piece']) for r in rules]
    for piece in order:
        pf = by_piece.get(piece)
        if not pf:
            continue                                   # an empty piece ships nothing
        name = piece_name(letter, piece)
        sig = hashlib.sha1()
        for rel in sorted(pf):
            sig.update(f'{rel.upper()}\0{content_hash(pf[rel], cache)}\n'.encode())
        content = sig.hexdigest()
        size = sum(f.stat().st_size for f in pf.values())
        prev = old_files.get(name)
        out = out_dir / name
        same = prev is not None and prev.get('content') == content and out.exists()
        print(f"  {name}: {len(pf):,} files, {size / 2**30:.2f} GB - {'unchanged' if same else 'changed'}")
        if same:
            members.append(prev)
            continue
        changed.append(name)
        if dry_run:
            members.append({'name': name, 'content': content})
            continue
        stage = STAGE_ROOT / name
        _stage(pf, stage)
        try:
            backup(out, nginx_path)
            if not pack(stage, out):
                return False
        finally:
            shutil.rmtree(stage, ignore_errors=True)
        members.append({'name': name, 'checksum': md5(out), 'size_mb': round(out.stat().st_size / 2**20, 1),
                        'content': content})
    HASH_CACHE.write_text(json.dumps(cache))
    gone = [n for n in old_files if n not in {m['name'] for m in members}]
    if dry_run:
        print(f"[DRY RUN] {key}: {len(members)} pieces, {len(changed)} would be packed, {len(gone)} would leave")
        return True
    for n in gone:                                     # pieces that left the bundle: off the server too
        f = out_dir / n
        if f.exists():
            backup(f, nginx_path)
            f.unlink()
    if not changed and not gone and old:
        print(f"{key}: no piece changed, register untouched")
        return True
    entry = dict(old)
    entry.update({
        'name': display_name,
        'description': description,
        'build_source': 'split',
        'version': next_version(old.get('version', 0)),
        'size_mb': round(sum(m['size_mb'] for m in members), 1),
        # one md5 for the bundle: changes whenever any piece's archive changes
        'checksum': hashlib.md5(''.join(m['checksum'] for m in members).encode()).hexdigest(),
        'last_modified': timestamp(),
        'files': members,
    })
    patches[key] = entry
    patches.pop(f'{key}.MPQ', None)                   # the single archive this replaces
    print(f"{key}: {len(members)} pieces, {len(changed)} packed, {len(gone)} removed - version {entry['version']}")
    return True
