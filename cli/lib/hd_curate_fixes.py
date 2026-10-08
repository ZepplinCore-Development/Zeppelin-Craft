"""F-216: recorded fixes for community-pack files the curated build ships.

zpaks/zep-hd-curated/curate_transforms.json (git-tracked) maps a model path to the ops that repair
the pack's file (cli/lib/m2_ops.py), gated by the pack file's sha256. The picker shows the fixed
file and `zep model curate` ships it, so both agree. Not a model_transforms.json: the curated zpak
has no source-assets and ships with --build, so the patch builder's preprocessor never runs.
"""
import hashlib
import json
from pathlib import Path
from typing import Dict, Optional, Tuple

RECIPES = Path(__file__).resolve().parents[2] / 'zpaks' / 'zep-hd-curated' / 'curate_transforms.json'
_cache: Optional[Dict[str, dict]] = None


def recipes() -> Dict[str, dict]:
    global _cache
    if _cache is None:
        try:
            raw = json.loads(RECIPES.read_text())
        except Exception:
            raw = {}
        _cache = {k.lower(): v for k, v in raw.items() if not k.startswith('_')}
    return _cache


def fixed(path: str, data: bytes, log=None) -> Optional[Tuple[bytes, dict]]:
    """(fixed bytes, recipe) when `path` has a recipe written for exactly these bytes, else None.
    A path may carry several recipes (one per pack file), matched by base_sha256."""
    rs = recipes().get(path.lower())
    if not rs:
        return None
    rs = rs if isinstance(rs, list) else [rs]
    sha = hashlib.sha256(data).hexdigest()
    r = next((x for x in rs if x.get('base_sha256') in (None, sha)), None)
    if r is None:
        return None
    from lib import m2_ops
    out, _ = m2_ops.apply_ops_bytes(data, r.get('ops') or [])
    if r.get('result_sha256') and hashlib.sha256(out).hexdigest() != r['result_sha256']:
        raise m2_ops.M2OpError(f'{path}: recipe result does not match result_sha256')
    return out, r


def key(path: str) -> str:
    """Cache key part: the recipe's content (empty when none)."""
    r = recipes().get(path.lower())
    return hashlib.sha1(json.dumps(r, sort_keys=True).encode()).hexdigest()[:12] if r else ''
