"""F-151: integrity check of the playable character skins as a build would ship them.

Resolves every CharSections texture of a playable race the way the client will: the enabled zpaks'
parsed-assets in patch load order (later letter wins, higher priority wins inside a letter), over the
clean stock client. Then checks each face, skin and underwear the character creator can reach.

Errors (a build of a skin-carrying patch stops):
  missing      the row names a file that no patch and no stock MPQ carries
  undecodable  the file is not a BLP the client can read
  blank        a face that is solid black (a texture the client cannot draw, or an empty conversion)
  hd-drop      the race's model ships from an HD pack, the pack has its own file at this path, and the
               build resolves the path to the stock file. The HD head then wears classic face art.

Warnings (reported, with a contact sheet):
  tone         the face's colour is far from the skin it is pasted on (a face cut from another colour)
  hole         a dark compact blob that the most similar colours of that face type do not have
               (a stray dot or a hole left by removing a marking)
  size         a face whose texture size differs from the race's usual one (a file from another set)
  face-types   a reachable colour lacks face types the race's colour 0 has (the creator skips it there)
  duplicate    two rows share race/sex/section/type/colour (the source client takes the highest id)
"""
import hashlib
import json
import re
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple

import numpy as np
from PIL import Image, ImageDraw

from lib import model_sources as ms
from lib.patch_builder import discover_patches
from lib.wardrobe.blp import read_blp
from lib.wardrobe.eye_islands import island

PLAYABLE = list(range(1, 13))                # ChrRaces 1-11 and 12, the Worgen (stock's Fel Orc row); 13+ are NPC races
SEXES = {0: 'male', 1: 'female'}
REACHABLE = 0x1 | 0x4                        # CharSections flags: playable, death knight
HD_PACKS = [ms.TOOLS_ROOT / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
            for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]
# 512-scale character atlas boxes the face halves are pasted into (classic REGIONS x2)
FACE_BOX = {'texture_1': (0, 384, 256, 128), 'texture_2': (0, 320, 256, 64)}
TONE_SKIP = {6, 9}                           # tauren, goblin: the face covers more than the classic face box
TONE_LIMIT = 6.0                             # Lab a*b* distance of a face-to-body offset from the race's stock offset


@dataclass
class Finding:
    level: str                               # 'error' | 'warning'
    kind: str
    race: int
    sex: int
    colour: int
    detail: str
    section: int = 1
    type: int = 0
    files: List[str] = field(default_factory=list)
    owner: str = ''                          # the zpak that ships the fault ('' = the CharSections rows, PATCH-Z)


def shipped_index(craft_root: Path) -> Dict[str, Tuple[Path, str]]:
    """normalised character/ path -> (file, owner) as the client sees it after every patch loads."""
    idx = {}
    ms.stock_asset('')                                       # build the stock index
    for p, f in ms._stock_asset_index.items():
        if p.startswith('character/'):
            idx[p] = (f, 'stock')
    patches = discover_patches(craft_root)
    for letter in sorted(patches):                           # client load order: later letter wins
        for z in reversed(patches[letter]):                  # highest priority packed first = wins: apply last
            parsed = z['path'] / 'mpq' / 'parsed-assets'
            char = next((d for d in parsed.iterdir() if d.name.lower() == 'character'), None) if parsed.is_dir() else None
            if char is None:
                continue
            for k, f in ms.list_files(char).items():
                idx['character/' + k] = (f, z['name'])
    return idx


def hd_pack_index() -> Dict[str, Path]:
    idx = {}
    for root in reversed(HD_PACKS):                          # patch-hd-everything wins
        char = next((d for d in root.iterdir() if d.name.lower() == 'character'), None) if root.is_dir() else None
        if char:
            idx.update({'character/' + k: f for k, f in ms.list_files(char).items()})
    return idx


def _same(a: Path, b: Path) -> bool:
    if a.stat().st_size != b.stat().st_size:
        return False
    return hashlib.sha1(a.read_bytes()).digest() == hashlib.sha1(b.read_bytes()).digest()


class Images:
    def __init__(self):
        self.cache = {}

    def get(self, f: Path) -> Optional[np.ndarray]:
        if f not in self.cache:
            try:
                self.cache[f] = np.asarray(read_blp(f).convert('RGBA'))
            except Exception:
                self.cache[f] = None
        a = self.cache[f]
        return None if a is None else a.astype(np.float32)

    def ok(self, f: Path) -> bool:
        return self.get(f) is not None


def _lab(rgb: np.ndarray) -> np.ndarray:
    """sRGB 0-255 -> CIE Lab (D65)."""
    c = np.asarray(rgb, np.float64) / 255
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]]) @ c
    xyz /= np.array([0.95047, 1.0, 1.08883])
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.array([116 * f[1] - 16, 500 * (f[0] - f[1]), 200 * (f[1] - f[2])])


def _lit_rgb(a: np.ndarray) -> Optional[np.ndarray]:
    """The mean colour of the brighter half of the opaque pixels: how the skin reads. Medians sit in the
    shadows, where a pink face on a grey body still matched (user report, Mag'har 8 / 9). Near-pure colour
    (painted glowing eyes) is left out."""
    m = a[..., 3] > 128
    if m.sum() < 50:
        return None
    px = a[..., :3][m]
    px = px[(px.max(axis=1) - px.min(axis=1)) <= 140]
    if len(px) < 50:
        return None
    lum = px.mean(axis=1)
    return px[lum >= np.median(lum)].mean(axis=0)


def _median_rgb(a: np.ndarray) -> Optional[np.ndarray]:
    m = a[..., 3] > 128
    if m.sum() < 50:
        return None
    return np.median(a[..., :3][m], axis=0)


def _chroma_distance(a: np.ndarray, b: np.ndarray) -> float:
    ca, cb = a / max(a.sum(), 1), b / max(b.sum(), 1)
    light = abs(np.log((a.mean() + 8) / (b.mean() + 8)))
    return float(np.linalg.norm(ca - cb) * 3 + light * 0.5)


def _lum(upper: np.ndarray, lower: np.ndarray) -> np.ndarray:
    """A face's luminance at 256 x 192 (upper over lower); transparent pixels take the face's median."""
    parts = []
    for a, h in ((upper, 64), (lower, 128)):
        im = np.asarray(Image.fromarray(a.clip(0, 255).astype(np.uint8), 'RGBA').resize((256, h), Image.BOX)).astype(np.float32)
        lum = im[..., :3].mean(2)
        solid = im[..., 3] > 128
        lum[~solid] = np.median(lum[solid]) if solid.any() else 128
        parts.append(lum)
    return np.concatenate(parts, axis=0)


def _holes(lums: Dict[int, np.ndarray], near=8) -> Dict[int, Tuple[int, Tuple[int, int]]]:
    """Per colour, the biggest dark compact blob (a hole, a stray dot) that at most one of its `near` most similar
    colours of this face type has at that spot. Features of the art (nostrils, an open mouth) are shared by the
    colours painted from the same art and pass."""
    from scipy import ndimage
    keys = list(lums)
    masks, comps = [], []
    for c in keys:
        lum = lums[c]
        bg = ndimage.uniform_filter(lum, 25)
        lab, _ = ndimage.label((lum < 0.45 * bg) & (lum < 70))
        keep = np.zeros(lum.shape, bool)
        found = []
        for i, sl in enumerate(ndimage.find_objects(lab), 1):
            h, w = sl[0].stop - sl[0].start, sl[1].stop - sl[1].start
            x0, y0 = sl[1].start, sl[0].start
            area = int((lab[sl] == i).sum())
            inside = x0 >= 10 and y0 >= 6 and x0 + w <= 246 and y0 + h <= 186      # texture edges carry seams
            if inside and 80 <= area <= 400 and area >= 0.55 * h * w and max(h, w) <= 2.2 * min(h, w):
                keep[lab == i] = True
                found.append((area, lab == i, (x0 + w // 2, y0 + h // 2)))
        masks.append(ndimage.binary_dilation(keep, iterations=4))
        comps.append(found)
    norm = np.stack([lums[c] / max(np.median(lums[c]), 1.0) for c in keys])
    small = norm[:, ::4, ::4]
    dist = np.abs(small[:, None] - small[None]).mean(axis=(2, 3))
    np.fill_diagonal(dist, np.inf)
    masks = np.stack(masks)
    out = {}
    for i, c in enumerate(keys):
        sib = np.argsort(dist[i])[:near]
        for area, m, centre in comps[i]:
            if masks[sib][:, m].any(axis=1).sum() <= 1 and area > out.get(c, (0,))[0]:
                out[c] = (area, centre)
    return out


GLUE = Path('zpaks/patch-modern-login/mpq/source-assets/Interface/GlueXML/CharacterCreate.lua')


def offered(craft_root: Path) -> Dict[Tuple[str, int], set]:
    """(race file name upper case, sex) -> the skin colours character create offers (CHAR_CREATE_SUBRACES, every
    sub-race and the shared ones). A race without an entry offers every reachable colour (no key)."""
    out = {}
    text = (craft_root / GLUE).read_text(errors='replace')
    start = text.find('CHAR_CREATE_SUBRACES = {')
    if start < 0:
        return out
    body = text[start:text.find('\n};', start)]
    for m in re.finditer(r'\["(\w+)"\] = \{(.*?)\n\t\},', body, re.S):
        for sex, key in ((0, 'MALE'), (1, 'FEMALE')):
            cols = set()
            for lst in re.findall(key + r' = \{([\d,\s]*)\}', m.group(2)):
                cols |= {int(x) for x in lst.replace(' ', '').split(',') if x}
            out[(m.group(1), sex)] = cols
    return out


def check(query, craft_root: Path, races=PLAYABLE) -> Tuple[List[Finding], Dict]:
    files = shipped_index(craft_root)
    hd = hd_pack_index()
    imgs = Images()
    out: List[Finding] = []
    stats = defaultdict(int)
    names = {int(r['id']): r['client_filestring'] for r in query('SELECT id, client_filestring FROM chrraces')}
    rows = query('SELECT id, race, gender, base_section, type, color_index, flags, texture_1, texture_2, texture_3 '
                 f'FROM charsections WHERE race IN ({",".join(map(str, races))}) AND base_section IN (0, 1, 4) '
                 'ORDER BY id')
    by_key = defaultdict(list)
    for r in rows:
        by_key[(r['race'], r['gender'], r['base_section'], r['type'], r['color_index'])].append(r)
    for key, rs in by_key.items():
        if len(rs) > 1 and rs[-1]['flags'] & REACHABLE:
            out.append(Finding('warning', 'duplicate', key[0], key[1], key[4],
                               f'ids {", ".join(str(r["id"]) for r in rs)} share section {key[2]} type {key[3]}; '
                               f'id {rs[-1]["id"]} wins', key[2], key[3]))
    live = {k: rs[-1] for k, rs in by_key.items()}            # the source client takes the highest id

    for race in races:
        rname = names.get(race, '')
        for sex, sname in SEXES.items():
            m2 = f'character/{rname.lower()}/{sname}/{rname.lower()}{sname}.m2'
            model_owner = files.get(m2, (None, 'missing'))[1]
            model_hd = model_owner != 'stock' and m2 in hd
            imgs.cache.clear()                                 # one race and sex in memory at a time
            mine = {k: r for k, r in live.items() if k[0] == race and k[1] == sex}
            skins = {k[4]: r for k, r in mine.items() if k[2] == 0 and k[3] == 0 and r['flags'] & REACHABLE}
            faces = defaultdict(dict)                          # type -> colour -> row
            for k, r in mine.items():
                if k[2] == 1 and r['flags'] & REACHABLE:
                    faces[k[3]][k[4]] = r
            want_types = {t for t, cs in faces.items() if 0 in cs}

            def resolve(r, col):
                path = r[col]
                if not path:
                    return None
                n = ms.norm(path)
                if n not in files:
                    out.append(Finding('error', 'missing', race, sex, r['color_index'], f'{col} {path}',
                                       r['base_section'], r['type'], [path]))
                    return None
                f, owner = files[n]
                stats['files'] += 1
                if not imgs.ok(f):
                    out.append(Finding('error', 'undecodable', race, sex, r['color_index'], f'{col} {path} ({owner})',
                                       r['base_section'], r['type'], [str(f)], owner))
                    return None
                if model_hd and owner == 'stock' and n in hd and not _same(hd[n], f):
                    out.append(Finding('error', 'hd-drop', race, sex, r['color_index'],
                                       f'{col} {path}: HD model ({model_owner}) but the HD pack file is not shipped',
                                       r['base_section'], r['type'], [path], model_owner))
                return f

            skin_img, extra_img = {}, {}
            for c, r in skins.items():
                f = resolve(r, 'texture_1')
                if f is not None:
                    skin_img[c] = imgs.get(f)
                fx = resolve(r, 'texture_2') if r['texture_2'] else None
                if fx is not None:
                    extra_img[c] = imgs.get(fx)
                missing = sorted(want_types - {t for t in faces if c in faces[t]})
                if missing:
                    out.append(Finding('warning', 'face-types', race, sex, c,
                                       f'no face row for type{"s" if len(missing) > 1 else ""} '
                                       f'{",".join(map(str, missing))}', 1, missing[0]))
            for k, r in mine.items():
                if k[2] == 4 and r['flags'] & REACHABLE:
                    for col in ('texture_1', 'texture_2'):
                        if r[col]:
                            resolve(r, col)

            sizes, tones, body_lit = {}, [], {}
            for t, cs in faces.items():
                details = {}
                for c, r in cs.items():
                    parts, stock = {}, False
                    for col in ('texture_1', 'texture_2'):
                        f = resolve(r, col)
                        if f is not None:
                            parts[col] = imgs.get(f)
                            stock |= model_hd and files[ms.norm(r[col])][1] == 'stock'
                    # tone: the face against the skin it is pasted on
                    sk = skin_img.get(c)
                    low = parts.get('texture_1')
                    if low is not None and not stock and (low[..., 3] > 128).mean() > 0.5 \
                            and low[..., :3][low[..., 3] > 128].mean() < 25:
                        out.append(Finding('error', 'blank', race, sex, c, f'face type {t} lower face is solid black',
                                           1, t, [r['texture_1'], r['texture_2']], files[ms.norm(r['texture_1'])][1]))
                    if sk is not None and 'texture_1' in parts and not stock and race not in TONE_SKIP \
                            and not skins[c]['flags'] & 0x4 and not r['flags'] & 0x4:   # DK skins and faces glow
                        if c not in body_lit:
                            s512 = np.asarray(Image.fromarray(sk.clip(0, 255).astype(np.uint8), 'RGBA')
                                              .resize((512, 512), Image.BOX)).astype(np.float32)
                            s512[320:, :256, 3] = 0                # the face area under the face is never seen
                            body_lit[c] = _lit_rgb(s512)
                        low = parts['texture_1'].copy()
                        eye = island(race, sex)[64:]                   # the eye's own colour is not the face's
                        if eye.any():
                            hh, ww = low.shape[:2]
                            low[..., 3][np.asarray(Image.fromarray(eye).resize((ww, hh), Image.NEAREST))] = 0
                        face = _lit_rgb(low)
                        if body_lit[c] is not None and face is not None:
                            tones.append((c, t, _lab(face) - _lab(body_lit[c]), r))
                    if 'texture_1' in parts:
                        sizes[c, t] = parts['texture_1'].shape[:2]
                    if len(parts) == 2 and not stock:          # classic art on an HD head is already an error
                        details[c] = _lum(parts['texture_2'], parts['texture_1'])
                if len(details) < 4:
                    continue
                stats['hole_checked'] += len(details)
                for c, (area, (x, y)) in _holes(details).items():
                    r = cs[c]
                    out.append(Finding('warning', 'hole', race, sex, c,
                                       f'face type {t}: dark blob of {area} px at {x},{y} that few colours have', 1, t,
                                       [r['texture_1'], r['texture_2']]))
            # tone: a face's lit colour against its body's (Lab a*b*), measured from what this race's own stock colours
            # (0-9) do: their faces may be ruddier than the body, a clash is a face that strays from that. Death knight
            # colours are left out (their faces glow). Calibrated on the old per-channel recolour's pink / magenta
            # orc faces (6-14) against every shipped face (95th percentile 8): the two overlap, and so did a render of
            # the face against its neck (skin_preview.seam_check), so tone is a warning on the sheet, never a stop.
            ref = [dv for c, t, dv, r in tones if c <= 9]
            if len(ref) >= 4:
                ref = np.median(np.stack(ref), axis=0)
                for c, t, dv, r in tones:
                    d = float(np.linalg.norm((dv - ref)[1:]))      # a*, b*: hue and saturation; brightness may differ
                    stats['tone_checked'] += 1
                    if d > TONE_LIMIT:
                        out.append(Finding('warning', 'tone', race, sex, c,
                                           f'face type {t} colour {d:.1f} off its body (against the stock colours)',
                                           1, t, [r['texture_1'], r['texture_2']], files[ms.norm(r['texture_1'])][1]))
            # the _Extra (an HD head with its ears and scalp, horns, tentacles) against its body, the same way: the
            # ears a different colour from the head (user report, Mag'har 7 / 8)
            extra_tones = []
            for c, ex in extra_img.items():
                if race in TONE_SKIP or skins[c]['flags'] & 0x4 or c not in body_lit or body_lit[c] is None:
                    continue
                el = _lit_rgb(ex)
                if el is not None:
                    extra_tones.append((c, _lab(el) - _lab(body_lit[c])))
            eref = [dv for c, dv in extra_tones if c <= 9]
            if len(eref) >= 4:
                eref = np.median(np.stack(eref), axis=0)
                for c, dv in extra_tones:
                    d = float(np.linalg.norm((dv - eref)[1:]))
                    if d > TONE_LIMIT:
                        r = skins[c]
                        out.append(Finding('warning', 'tone', race, sex, c,
                                           f'_Extra (head, ears, horns) colour {d:.1f} off its body (against the stock colours)',
                                           0, 0, [r['texture_2']], files[ms.norm(r['texture_2'])][1]))
            if sizes:
                common = max(set(sizes.values()), key=list(sizes.values()).count)
                for (c, t), hw in sizes.items():
                    if hw != common:
                        r = faces[t][c]
                        out.append(Finding('warning', 'size', race, sex, c,
                                           f'face type {t} lower face is {hw[1]}x{hw[0]}, the others {common[1]}x{common[0]}',
                                           1, t, [r['texture_1'], r['texture_2']]))
    # a colour character create does not offer cannot reach a player: its faults are warnings
    offer = offered(craft_root)
    for f in out:
        cols = offer.get((names.get(f.race, '').upper(), f.sex))
        if f.level == 'error' and cols is not None and f.colour not in cols and f.kind not in ('missing', 'undecodable'):
            f.level = 'warning'
            f.detail += ' (not offered in character create)'
    return out, dict(stats)


def sheet(findings: List[Finding], craft_root: Path, out: Path, limit=160) -> Optional[Path]:
    """A contact sheet of the flagged faces (upper over lower) as shipped, one tile per colour and face type."""
    files = shipped_index(craft_root)
    seen, picked = set(), []
    for f in sorted(findings, key=lambda f: (f.level != 'error', f.race, f.sex, f.colour, f.type)):
        key = (f.race, f.sex, f.colour, f.type)
        if f.section == 1 and len(f.files) == 2 and f.kind in ('hd-drop', 'blank', 'tone', 'hole') and key not in seen:
            seen.add(key)
            picked.append(f)
    picked = picked[:limit]
    if not picked:
        return None
    W, H, cols = 192, 144, 8
    canvas = Image.new('RGB', (cols * W, ((len(picked) + cols - 1) // cols) * (H + 30)), (24, 24, 24))
    d = ImageDraw.Draw(canvas)
    for i, f in enumerate(picked):
        x, y = (i % cols) * W, (i // cols) * (H + 30)
        tile = Image.new('RGBA', (256, 192), (120, 0, 120, 255))
        for path, (py, ph) in ((f.files[1], (0, 64)), (f.files[0], (64, 128))):
            hit = files.get(ms.norm(path)) if path else None
            if hit:
                try:
                    tile.alpha_composite(read_blp(hit[0]).convert('RGBA').resize((256, ph)), (0, py))
                except Exception:
                    pass
        canvas.paste(tile.convert('RGB').resize((W, H)), (x, y + 30))
        d.text((x + 3, y + 2), f'{f.kind}', fill=(255, 80, 80) if f.level == 'error' else (255, 210, 0))
        d.text((x + 3, y + 15), f'race {f.race} {"MF"[f.sex]} colour {f.colour} face {f.type}', fill=(220, 220, 220))
    canvas.save(out)
    return out


def report(findings: List[Finding], stats: Dict) -> str:
    errs = [f for f in findings if f.level == 'error']
    warns = [f for f in findings if f.level == 'warning']
    lines = [f'skin check: {stats.get("files", 0)} texture lookups, {len(errs)} errors, {len(warns)} warnings']
    groups = defaultdict(list)
    for f in errs + warns:
        groups[(f.level, f.kind, f.race, f.sex)].append(f)
    for (level, kind, race, sex), fs in groups.items():
        cols = sorted({f.colour for f in fs})
        lines.append(f'  {level.upper():7} {kind:11} race {race:2} {SEXES[sex]:6} {len(fs):4} rows, '
                     f'colours {",".join(map(str, cols))}')
        if kind != 'duplicate':
            for f in fs[:2]:
                lines.append(f'            c{f.colour}: {f.detail}')
    return '\n'.join(lines)


def to_json(findings: List[Finding]) -> str:
    return json.dumps([f.__dict__ for f in findings], indent=1)


LOG_DIR = Path('/workspace/project/logs/skin_check')


def run(craft_root: Path, races=PLAYABLE, out_dir: Path = LOG_DIR, letter: Optional[str] = None
        ) -> Tuple[int, str, Optional[Path]]:
    """Check the live DBC against what the build ships. Writes report.txt, findings.json and faces.png into
    out_dir; returns (error count, report text, sheet path). With `letter`, the count is only the errors that patch
    ships: a file of one of its zpaks, or (PATCH-Z) a row naming a missing file."""
    from commands.wardrobe import _dbc_query_fn
    findings, stats = check(_dbc_query_fn('live'), craft_root, races)
    out_dir.mkdir(parents=True, exist_ok=True)
    text = report(findings, stats)
    (out_dir / 'report.txt').write_text(text + '\n')
    (out_dir / 'findings.json').write_text(to_json(findings))
    png = sheet(findings, craft_root, out_dir / 'faces.png')
    errors = [f for f in findings if f.level == 'error']
    if letter:
        mine = {z['name'] for z in discover_patches(craft_root).get(letter, [])}
        errors = [f for f in errors if f.owner in mine or (letter == 'Z' and not f.owner)]
    return len(errors), text, png
