"""
Character bake compositor (F-198).

Proven against the HD pack's own NPC bakes (grunt extras 2747/2748: edge-only DXT
noise, no layout or colour difference). The HD character atlas is the classic 256x256
layout at exactly 2x (512x512).
"""

import os
from pathlib import Path
from typing import Callable, Dict, List, Optional, Tuple

from PIL import Image

from .blp import read_blp

SCALE = 2
REGIONS = {  # classic 256x256 character texture regions (x, y, w, h)
    'ArmUpper': (0, 0, 128, 64), 'ArmLower': (0, 64, 128, 64), 'Hand': (0, 128, 128, 32),
    'FaceUpper': (0, 160, 128, 32), 'FaceLower': (0, 192, 128, 64),
    'TorsoUpper': (128, 0, 128, 64), 'TorsoLower': (128, 64, 128, 32),
    'LegUpper': (128, 96, 128, 64), 'LegLower': (128, 160, 128, 64), 'Foot': (128, 224, 128, 32),
}
# Item draw order. Legs before belt is proven (the reverse visibly fails); tabard under
# the belt matches in-game but has no stock bake to prove it against.
SLOT_ORDER = ['shirt', 'chest', 'tabard', 'legs', 'belt', 'boots', 'wrists', 'gloves']


class FileResolver:
    """Case-insensitive client-path lookup across roots in client priority order."""

    def __init__(self, roots: List[Path], subdirs=('character', 'item', 'textures')):
        self.roots = [Path(r) for r in roots]
        self.subdirs = {s.lower() for s in subdirs}
        self._idx: Dict[Path, Dict[str, str]] = {}

    def _index(self, root: Path) -> Dict[str, str]:
        if root not in self._idx:
            idx = {}
            if root.exists():
                for top in os.listdir(root):
                    if top.lower() not in self.subdirs:
                        continue
                    for dp, _, fns in os.walk(root / top):
                        rel = os.path.relpath(dp, root).replace('/', '\\')
                        for fn in fns:
                            idx[f'{rel}\\{fn}'.lower()] = os.path.join(dp, fn)
            self._idx[root] = idx
        return self._idx[root]

    def invalidate(self, root: Path) -> None:
        self._idx.pop(Path(root), None)

    def find(self, client_path: str) -> Optional[str]:
        key = client_path.replace('/', '\\').lower()
        for r in self.roots:
            hit = self._index(r).get(key)
            if hit:
                return hit
        return None

    def find_basename(self, basename: str, under: str) -> Optional[str]:
        """First client path whose file name matches, below a client folder prefix."""
        b, u = basename.lower(), under.replace('/', '\\').lower().rstrip('\\') + '\\'
        for r in self.roots:
            for k in self._index(r):
                if k.startswith(u) and k.endswith('\\' + b):
                    return k
        return None


def _blit(canvas: Image.Image, img: Image.Image, region: str) -> None:
    x, y, w, h = [v * SCALE for v in REGIONS[region]]
    canvas.alpha_composite(img.resize((w, h), Image.LANCZOS), (x, y))


def compose(appearance: Dict[str, int], charsection: Callable[[int, int, int], Optional[Dict]],
            item_layers: Dict[str, List[Tuple[str, str]]], resolver: FileResolver) -> Tuple[Image.Image, List[str]]:
    """Bake one appearance.

    appearance: skin_color, face_type, hair_style, hair_color, facial_hair.
    charsection(base_section, type, color) -> {'texture_1','texture_2','texture_3'} or None.
    item_layers: slot -> [(region, client texture path)], already gender-resolved.
    Returns (512x512 RGBA, log lines). Raises on any missing layer.
    """
    log = []

    def need(path: str, what: str) -> Image.Image:
        f = resolver.find(path)
        if not f:
            raise FileNotFoundError(f'{what}: {path} not found in any client root')
        log.append(f'{what:<22} {path}')
        return read_blp(f)

    skin = charsection(0, 0, appearance['skin_color'])
    if not skin:
        raise ValueError(f'no CharSections skin for colour {appearance["skin_color"]}')
    canvas = need(skin['texture_1'], 'skin').resize((256 * SCALE, 256 * SCALE), Image.LANCZOS)
    layers = [
        (charsection(1, appearance['face_type'], appearance['skin_color']), (('texture_1', 'FaceLower'), ('texture_2', 'FaceUpper')), 'face'),
        (charsection(2, appearance['facial_hair'], appearance['hair_color']), (('texture_1', 'FaceLower'), ('texture_2', 'FaceUpper')), 'facial hair'),
        (charsection(3, appearance['hair_style'], appearance['hair_color']), (('texture_2', 'FaceLower'), ('texture_3', 'FaceUpper')), 'scalp'),
        (charsection(4, 0, appearance['skin_color']), (('texture_1', 'LegUpper'), ('texture_2', 'TorsoUpper')), 'underwear'),
    ]
    for row, parts, what in layers:
        if row is None:
            if what == 'face':
                raise ValueError(f'no CharSections face {appearance["face_type"]} for skin {appearance["skin_color"]}')
            continue
        for col, region in parts:
            if row.get(col):
                _blit(canvas, need(row[col], f'{what} {region}'), region)
    for slot in SLOT_ORDER:
        for region, path in item_layers.get(slot, []):
            _blit(canvas, need(path, f'{slot} {region}'), region)
    return canvas, log
