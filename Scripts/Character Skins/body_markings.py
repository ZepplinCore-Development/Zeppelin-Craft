"""F-151: orc body markings as their own choice, cut out of the skin colours that baked them in.

The Nexus skin colours come in families: a plain base colour plus copies with paint, tattoos, scars or
piercings. Each marking is the difference between a marked colour's skin texture and its base colour's
(after matching their overall tone), written as one full-atlas layer (512x512, palettized BLP2 + 8-bit alpha):

  paint, tattoos, metal   the marked pixels as they are: a fixed colour on every skin (user rule)
  scars                   black or white with alpha, so they darken or lighten whatever skin is underneath and
                          follow the skin colour (user rule)

CharSections base_section 7 = body markings: type = marking (1-9; 0 = none, no row), color_index 0,
texture_1 = the layer. The source client pastes it over the skin in every body section, under underwear and items.

F-230 plan A: SPLITS does the same for the other races (dwarf, tauren, human, undead, blood elf): their mod 907 colours
that are a base colour plus paint / tattoo become base_section 6 / 7 / 8 layers (ids 89300-89499), body and face
(the type-0 face pasted into the atlas head sections, eyeball island left clear). See split_markings().

Also writes the skin repair for colour 9 (its red loincloth was painted into the skin: user rule "plain skin")
and the old-colour -> (base colour, marking) table used by the migration.

F-230 regroup (2026-10-30): the layers are SOURCES only. layer_sources() hands them to markings_regroup.py, which cuts
each into a face part and a body part, dedupes and owns every layer row (base_section 6-8) and shipped layer BLP. This
script's SQL keeps only the colour-9 plain-skin UPDATE.

  python3 "Scripts/Character Skins/body_markings.py" [--preview DIR] [--migration]
"""
import importlib.util
import json
import subprocess
import sys
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402
from lib.wardrobe.eye_islands import island  # noqa: E402

_spec = importlib.util.spec_from_file_location('icons', Path(__file__).with_name('subrace_icons.py'))
icons = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(icons)

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
SQL = ZPAK / 'dbc' / '[F-151]_charsections_bodymarkings.sql'
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets'
COMMUNITY = [CRAFT.parent / 'Zeppelin-Tools' / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
             for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]
SPLIT = Path(__file__).with_name('orc_body_split.json')
MIGRATION = ZPAK / 'sql_characters' / 'zz_[F-151]_orc_body_split.sql'
RACE, SEXES = 2, {0: 'Male', 1: 'Female'}
SECTION_SKIN, SECTION_BODY_MARKINGS = 0, 7
FLAGS_ANY = 0x11
SKIN_TEX = 'Character\\Orc\\{sex}\\Orc{sex}Skin00_{colour:02d}.blp'
MARK_DIFF = 42                                   # |rgb| sum over which a marked skin differs from its base
TONE_SIGMA = 24                                  # px (of 512): reach of the local tone match
INK_SIGMA = 48                                   # 'ink': px reach of the tone match
STRONG = 150                                     # |rgb| a paint or ink region must reach somewhere
STRONG_P90 = 100                                 # ... and over most of it: c41 ink p90 115+, its darker toes 67
SIZE = 512
# The body markings cut from the marked skin colours are mostly retired: base_section 7 is retail's scars now
# (retail_layers.py). The four paints the user prefers to retail's are kept as extra War Paint choices
# (base_section 8, after retail's 12): marking -> war paint type. Two of the four stay, Mag'har only (glue
# MAGHAR_WAR_PAINT; user review 2026-10-25). The script also writes the c9 plain skin and the body split migration.
WAR_PAINT = {1: 13, 2: 14}
SECTION_WAR_PAINT = 8
OUT = 1024                                       # markings are cut at twice the skin's size for soft edges, then written at
                                                 # SIZE: the client composites the body at 512, and a 1024 layer crashed it (I-422)
HEAD = [((0, 320), (256, 64)), ((0, 384), (256, 128))]   # head sections: the face textures cover them

# marking -> (name, donor colour, base colour, mode[, smallest region kept, closing px]); mode 'fixed' keeps the
# colours, 'shade' follows the skin
MARKINGS = {
    1: ('Handprints', 28, 19, 'fixed'),
    2: ('War paint', 30, 19, 'fixed'),
    3: ('Small tribal', 32, 22, 'fixed'),
    4: ('Large tribal', 34, 22, 'fixed'),
    5: ('Scars', 36, 19, 'shade'),
    6: ('Piercings', 38, 19, 'pierce'),
    7: ('Black tattoo', 41, 19, 'fixed'),
    8: ('Green runes', 42, 19, 'ink', 0, 0, 43),
    9: ('Orange runes', 43, 19, 'ink', 0, 0, 42),
}
# old skin colour -> (base colour, marking): the colours that are a base plus a body marking
SPLIT_COLOURS = {28: (19, 1), 29: (22, 1), 30: (19, 2), 31: (22, 2), 32: (22, 3), 33: (26, 3), 34: (22, 4),
                 35: (26, 4), 36: (19, 5), 37: (26, 5), 38: (19, 6), 39: (26, 6), 40: (0, 7), 41: (19, 7),
                 42: (19, 8), 43: (19, 9)}
# sex -> {colour with a painted-in loincloth: (its original skin file, colour whose shading fills it)}
PLAIN_REPAIR = {0: {9: ('Character\\Orc\\Male\\OrcMaleSkin00_100.blp', 0)}}


def load(files, path):
    f = files.find(path)
    if not f:
        raise FileNotFoundError(path)
    return np.asarray(read_blp(f).convert('RGB').resize((SIZE, SIZE), Image.LANCZOS)).astype(np.float32)   # Pillow misreads palettized BLP2


def clean(mask, grow=0):
    mask = ndimage.binary_opening(mask, iterations=1)
    mask = ndimage.binary_closing(mask, iterations=2)
    labels, n = ndimage.label(mask)
    if n:
        sizes = ndimage.sum(mask, labels, range(1, n + 1))
        mask = np.isin(labels, 1 + np.flatnonzero(sizes >= 40))
    # small enclosed holes: tattoo interiors whose colour happens to be close to the base skin
    holes, n = ndimage.label(ndimage.binary_fill_holes(mask) & ~mask)
    if n:
        sizes = ndimage.sum(holes > 0, holes, range(1, n + 1))
        mask |= np.isin(holes, 1 + np.flatnonzero(sizes < 400))
    for (x, y), (w, h) in HEAD:
        mask[y:y + h, x:x + w] = False
    return ndimage.binary_dilation(mask, iterations=grow) if grow else mask


def feather(mask):
    a = np.clip(ndimage.uniform_filter(mask.astype(np.float32), 3) * 255 * 1.5, 0, 255)
    a[~mask] = 0
    return a


def marking(donor, base, mode, min_blob=0, close=0, partner=None):
    """RGBA layer (uint8) of donor minus base."""
    # tone: a first pass on the global offset finds the marking, then the offset is averaged locally over the
    # unmarked pixels only, so a colour whose tone drifts across the body (c41 legs) is not read as a marking
    off = np.median((donor - base).reshape(-1, 3), axis=0)
    first = clean(np.abs(donor - np.clip(base + off, 0, 255)).sum(axis=2) > MARK_DIFF, grow=2)
    w = (~first).astype(np.float32)
    local = np.dstack([ndimage.gaussian_filter((donor - base)[..., k] * w, TONE_SIGMA) for k in range(3)])
    local /= np.maximum(ndimage.gaussian_filter(w, TONE_SIGMA), 1e-3)[..., None]
    matched = np.clip(base + local, 0, 255)
    diff = np.abs(donor - matched).sum(axis=2)
    mask = clean(diff > MARK_DIFF, grow=1)
    if mode == 'ink':
        # a dark, cool ink design with glowing runes (c42 / c43): ink is much darker than the tone-matched skin, or
        # cooler and a little darker; runes are strongly saturated. Wider tone reach: the design covers whole limbs.
        local = np.dstack([ndimage.gaussian_filter((donor - base)[..., k] * w, INK_SIGMA) for k in range(3)])
        local /= np.maximum(ndimage.gaussian_filter(w, INK_SIGMA), 1e-3)[..., None]
        matched = np.clip(base + local, 0, 255)
        def ink(img):
            li, lm = img.mean(axis=2), matched.mean(axis=2)
            cool = (img[..., 0] - img[..., 2]) < (matched[..., 0] - matched[..., 2]) - 18
            glow = (img.max(axis=2) - img.min(axis=2) > 90) & ((img[..., 1] > img[..., 0] + 30) | (img[..., 0] > img[..., 2] + 120))
            return (li < lm * 0.72) | (cool & (li < lm * 0.95)) | glow
        raw = ink(donor)
        if partner is not None:
            # the partner colour is the same art with other rune colours (c42 / c43, user tip): its ink widens the
            # shape where one colour's ink is faint, and the pixels where the two differ are exactly the runes
            raw |= ink(partner) | (np.abs(donor - partner).sum(axis=2) > 40)
        mask = clean(raw)
        mask = ndimage.binary_fill_holes(ndimage.binary_closing(np.pad(mask, 2, mode='edge'), iterations=2))[2:-2, 2:-2]
        return soft_layer(donor, matched, mask), mask.mean()
    if mode == 'fixed':
        # paint and ink have strong cores; a region that only differs a little is the donor's own shading
        labels, n = ndimage.label(mask)
        if n:
            peak = ndimage.maximum(diff, labels, range(1, n + 1))
            p90 = ndimage.labeled_comprehension(diff, labels, range(1, n + 1), lambda v: np.percentile(v, 90), float, 0)
            sizes = ndimage.sum(mask, labels, range(1, n + 1))
            mask = np.isin(labels, 1 + np.flatnonzero((peak >= STRONG) & (p90 >= STRONG_P90) & (sizes >= min_blob)))
        if close:
            # ragged designs (the runes): merge the fragments into solid shapes
            mask = ndimage.binary_fill_holes(ndimage.binary_closing(np.pad(mask, close, mode='edge'), iterations=close))[close:-close, close:-close]
    if mode == 'fixed':
        return soft_layer(donor, matched, mask), mask.mean()
    rgb = donor.copy()
    alpha = feather(mask)
    if mode in ('shade', 'pierce'):
        # shading as black / white over the skin: ratio < 1 darkens (black at 1-ratio), > 1 lightens (white)
        lum_d, lum_b = donor.mean(axis=2), matched.mean(axis=2)
        ratio = (lum_d + 1) / (lum_b + 1)
        shade = mask.copy()
        if mode == 'pierce':
            # metal: grey and brighter than the skin, kept as it is
            sat = donor.max(axis=2) - donor.min(axis=2)
            metal = mask & (lum_d > lum_b + 25) & (sat < 40)
            shade &= ~ndimage.binary_dilation(metal, iterations=1)
        dark = shade & (ratio < 1)
        light = shade & (ratio >= 1)
        rgb[dark] = 0
        rgb[light] = 255
        a_shade = np.where(dark, (1 - ratio) * 255 * 1.2, np.clip((ratio - 1), 0, 1) * 255 * 0.8)
        alpha = np.where(shade, np.clip(a_shade, 0, 255) * (alpha / 255), alpha)
    layer = Image.fromarray(np.dstack([rgb, alpha]).astype(np.uint8), 'RGBA').resize((OUT, OUT), Image.LANCZOS)
    return np.asarray(layer), mask.mean()


def up(a):
    """A float RGB / grey array at OUT size, LANCZOS."""
    if a.ndim == 2:
        return np.asarray(Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).resize((OUT, OUT), Image.LANCZOS)).astype(np.float32)
    return np.asarray(Image.fromarray(np.clip(a, 0, 255).astype(np.uint8)).resize((OUT, OUT), Image.LANCZOS)).astype(np.float32)


def soft_layer(donor, matched, mask):
    """Paint / ink at OUT size with a soft matte: alpha from how far each pixel is from the tone-matched base (full
    inside the marking, fading over its edge), colour unmixed from the base, so edges are antialiased, not stepped."""
    d, m = up(donor), up(matched)
    diff = np.abs(d - m).sum(axis=2)
    region = up(ndimage.binary_dilation(mask, iterations=2).astype(np.float32) * 255) / 255
    inner = up(ndimage.binary_erosion(mask, iterations=1).astype(np.float32) * 255) / 255
    t = np.clip((diff - MARK_DIFF * 0.5) / (MARK_DIFF * 1.1), 0, 1)
    a = np.maximum(t * t * (3 - 2 * t), inner) * np.clip(region, 0, 1)
    rgb = np.where(a[..., None] > 0.08, (d - (1 - a[..., None]) * m) / np.maximum(a[..., None], 0.08), d)
    # the edge band takes the colour of the marking's interior: unmixing a thin edge amplifies its light rim
    core = (up(ndimage.binary_erosion(mask, iterations=2).astype(np.float32) * 255) > 128) & (a > 0.85)
    if core.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~core, return_indices=True)
        rgb = np.where(core[..., None], rgb, rgb[iy, ix])
    return np.dstack([np.clip(rgb, 0, 255), np.clip(a * 255, 0, 255)]).astype(np.uint8)


def repair(skin, filler):
    """skin with its painted-in red cloth replaced by the filler colour's shading, in skin's tone."""
    red = (skin[..., 0] > skin[..., 1] + 25) & (skin[..., 0] > skin[..., 2] + 25)
    mask = clean(red, grow=4)
    keep = ~ndimage.binary_dilation(mask, iterations=6)
    # the filler's shading (brightness) in skin's own colour: a per-channel scale would carry the filler's hue
    tone = np.median(skin[keep], axis=0)
    lum = filler.mean(axis=2, keepdims=True)
    fill = np.clip(tone * lum / max(float(np.median(lum[keep])), 1.0), 0, 255)
    a = ndimage.uniform_filter(mask.astype(np.float32), 5)[..., None]
    return (skin * (1 - a) + fill * a).astype(np.uint8), mask.mean()


# ---------------------------------------------------------------------------------------------------------------
# F-230 plan A (step 1): the other races' skin colours that are a plain base colour plus a marking, unbundled into
# the same full-atlas layers (base_section 6 tattoo, 7 scars / body markings, 8 war paint; type = choice, 0 = none,
# color_index 0, flags 0x11). Each layer is cut from the marked colour's atlas (skin with its type-0 face pasted
# into the head sections) against its base colour's, tone-matched per region (body / head) so the cut carries no
# base skin colour, the eyeball island left clear. A design baked on several bases is cut from the first pair; the
# others are checked against it (base + layer vs the marked colour) and reported.
FOLDERS = {1: 'Human', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll', 10: 'BloodElf', 11: 'Draenei'}
HEAD_BOX = (0, 320, 256, 192)                    # FaceUpper (0,320,256,64) over FaceLower (0,384,256,128), atlas 512
# (race, sex) -> [(section, type, name, [(marked colour, base colour), ...], parts, strength[, mode[, (race, sex)]])]
#   parts: 'body', 'face', 'body+face' or 'arms'; strength: (peak, p90) a marking region's diff must reach (orc
#   STRONG); mode 'paint' (default): an opaque fixed colour on every skin, the orc user rule for paint and coloured
#   ink, the pair whose cut fits all the marked colours best; 'shade': the marking only darkens (bat paint, tear
#   streaks, black ink), black with alpha so it follows the skin, or the matte if that fits the marked colours
#   better; (race, sex): also try that race's layer of the same section and type (same art on the same UVs)
SPLITS = {
    (3, 0): [(8, 1, 'Wildhammer eye band', [(22, 2), (23, 4)], 'body+face', (150, 100)),
             (6, 1, 'Wildhammer brow tattoo', [(24, 2), (25, 4)], 'body+face', (150, 100)),
             (8, 2, 'Wildhammer red claws', [(30, 0)], 'body+face', (150, 100)),
             (8, 3, 'Wildhammer green chevrons', [(31, 0)], 'body+face', (150, 100)),
             (6, 2, 'Dark Iron tattoo', [(32, 27)], 'body+face', (120, 80))],
    (3, 1): [(8, 1, 'Wildhammer eye stripes', [(22, 2), (23, 4)], 'body+face', (150, 100)),
             (6, 1, 'Wildhammer brow tattoo', [(24, 2), (25, 4)], 'body+face', (150, 100)),
             (8, 2, 'Wildhammer red claws', [(30, 0)], 'body+face', (150, 100)),
             (8, 3, 'Wildhammer green chevrons', [(31, 0)], 'body+face', (150, 100))],
    (6, 0): [(8, 1, 'Grimtotem paint red', [(39, 0)], 'body+face', (120, 80)),
             (8, 2, 'Grimtotem paint blue', [(40, 0)], 'body+face', (120, 80)),
             (8, 3, 'Grimtotem paint white', [(41, 0)], 'body+face', (120, 80))],
    (6, 1): [(8, 1, 'Grimtotem paint red', [(39, 0)], 'body+face', (120, 80)),
             (8, 2, 'Grimtotem paint blue', [(40, 0)], 'body+face', (120, 80)),
             (8, 3, 'Grimtotem paint white', [(41, 0)], 'body+face', (120, 80))],
    (1, 0): [(8, 1, 'Bat eye paint', [(18, 0), (19, 7)], 'face', (100, 60), 'shade'),
             (8, 2, 'Tear streaks', [(20, 0), (21, 4), (22, 8), (23, 1), (24, 5), (25, 9)], 'face', (70, 45), 'shade')],
    (1, 1): [(6, 1, 'Thorn tattoo', [(18, 0), (19, 7)], 'body', (150, 100), 'shade')],
    (5, 1): [(6, 1, 'Thorn tattoo', [(23, 4), (22, 6)], 'body', (150, 100), 'shade', (1, 1))],
    (10, 0): [(6, 1, 'Arcane swirls red', [(48, 2), (49, 0)], 'arms', (150, 100)),
              (6, 2, 'Arcane swirls blue', [(50, 8), (51, 4)], 'arms', (150, 100)),
              (6, 3, 'Arcane swirls black', [(52, 8), (53, 3), (56, 8), (57, 3)], 'arms', (150, 100), 'shade'),
              (6, 4, 'Arcane swirls purple', [(54, 2), (55, 0), (58, 8), (59, 3)], 'arms', (150, 100)),
              (7, 1, 'Fel veins', [(60, 7)], 'body', (100, 60))],
    (10, 1): [(6, 1, 'Arcane swirls red', [(48, 2), (49, 0)], 'arms', (150, 100)),
              (6, 2, 'Arcane swirls blue', [(50, 8), (51, 4)], 'arms', (150, 100)),
              (6, 3, 'Arcane swirls black', [(52, 8), (53, 3), (56, 8), (57, 3)], 'arms', (150, 100), 'shade'),
              (6, 4, 'Arcane swirls purple', [(54, 2), (55, 0)], 'arms', (150, 100)),
              (7, 1, 'Fel veins', [(60, 2)], 'body', (100, 60))],
}


def atlas_rgb(files, query, race, sex, colour, face_type=0):
    """512 RGB atlas of a colour: its skin with its face (type face_type) in the head sections (highest id wins, F-225)."""
    def row(section):
        kind = face_type if section == 1 else 0
        r = query(f'SELECT texture_1, texture_2 FROM charsections WHERE race = {race} AND gender = {sex} AND '
                  f'base_section = {section} AND type = {kind} AND color_index = {colour} ORDER BY id DESC LIMIT 1')
        if not r:
            raise SystemExit(f'race {race} sex {sex} colour {colour}: no section {section} row')
        return r[0]

    def img(path, size):
        f = files.find(path)
        if not f:
            raise FileNotFoundError(path)
        return read_blp(f).convert('RGB').resize(size, Image.LANCZOS)

    canvas = img(row(0)['texture_1'], (SIZE, SIZE))
    face = row(1)
    canvas.paste(img(face['texture_2'], (256, 64)), (0, 320))
    canvas.paste(img(face['texture_1'], (256, 128)), (0, 384))
    return np.asarray(canvas).astype(np.float32)


def regions(race, sex):
    """(body, head, eye) masks on the 512 atlas."""
    head = np.zeros((SIZE, SIZE), bool)
    x, y, w, h = HEAD_BOX
    head[y:y + h, x:x + w] = True
    eye = np.zeros_like(head)
    eye[y:y + h, x:x + w] = island(race, sex)
    return ~head, head, ndimage.binary_dilation(eye, iterations=3)


def local_tone(donor, base, keep, region, sigma=TONE_SIGMA):
    """base moved to donor's tone: the donor - base offset averaged over keep pixels of the same region."""
    w = (keep & region).astype(np.float32)
    loc = np.dstack([ndimage.gaussian_filter((donor - base)[..., k] * w, sigma) for k in range(3)])
    norm = ndimage.gaussian_filter(w, sigma)
    loc /= np.maximum(norm, 1e-3)[..., None]
    fallback = np.median((donor - base)[region & keep], axis=0) if (region & keep).any() else np.zeros(3)
    loc = np.where((norm < 0.02)[..., None], fallback, loc)
    return np.clip(base + loc, 0, 255)


def tone_matched(donor, base, body, head, valid):
    off = np.median((donor - base)[valid], axis=0)
    first = np.abs(donor - np.clip(base + off, 0, 255)).sum(axis=2) > MARK_DIFF
    first = ndimage.binary_dilation(ndimage.binary_opening(first), iterations=3)
    m = np.zeros_like(donor)
    for region in (body, head):
        m = np.where(region[..., None], local_tone(donor, base, ~first, region), m)
    return m


def cut(donor, base, race, sex, parts, strength):
    """(512 RGBA layer, mask) of donor's marking over base."""
    body, head, eye = regions(race, sex)
    valid = np.zeros_like(body)
    if 'body' in parts:
        valid |= body
    if 'face' in parts:
        valid |= head
    if 'arms' in parts:                          # ArmUpper, ArmLower, Hand: the left column above the face
        valid[:320, :256] = True
    valid &= ~eye
    matched = tone_matched(donor, base, body, head, ~eye)
    diff = np.abs(donor - matched).sum(axis=2)
    mask = (diff > MARK_DIFF) & valid
    mask = ndimage.binary_opening(np.pad(mask, 2, mode='edge'), iterations=1)
    mask = ndimage.binary_closing(mask, iterations=2)[2:-2, 2:-2] & valid
    labels, n = ndimage.label(mask)
    if n:
        idx = range(1, n + 1)
        peak = ndimage.maximum(diff, labels, idx)
        p90 = ndimage.labeled_comprehension(diff, labels, idx, lambda v: np.percentile(v, 90), float, 0)
        sizes = ndimage.sum(mask, labels, idx)
        mask = np.isin(labels, 1 + np.flatnonzero((peak >= strength[0]) & (p90 >= strength[1]) & (sizes >= 12)))
    holes, n = ndimage.label(ndimage.binary_fill_holes(mask) & ~mask)
    if n:
        mask |= np.isin(holes, 1 + np.flatnonzero(ndimage.sum(holes > 0, holes, range(1, n + 1)) < 200))
    mask &= valid
    layer = soft_layer(donor, matched, mask)
    layer = np.asarray(Image.fromarray(layer, 'RGBA').resize((SIZE, SIZE), Image.LANCZOS)).copy()
    layer[..., 3][~ndimage.binary_dilation(valid, iterations=1) | eye] = 0
    return layer, mask, valid & ~eye, matched


def matte(donors, matched, mask, valid):
    """512 RGBA layer of one marking baked over several bases (triangulation matting): each marked colour is
    d_i = a * c + (1 - a) * m_i over its tone-matched base m_i, solved per pixel by least squares for the layer
    colour c and alpha a. So paint that only darkens or tints (the human bat paint is the skin at ~0.7) comes out
    as a translucent layer that follows any skin, and opaque paint as opaque. Where the bases are too alike to
    tell (|m_i - m| small) the alpha is borrowed from its neighbours."""
    d, m = np.stack(donors), np.stack(matched)
    dm, mm = d.mean(axis=0), m.mean(axis=0)
    num = ((d - dm) * (m - mm)).sum(axis=(0, 3))
    den = ((m - mm) ** 2).sum(axis=(0, 3))
    beta = np.clip(num / np.maximum(den, 1e-3), 0, 1)
    region = ndimage.binary_dilation(mask, iterations=2) & valid
    w = np.clip(den / (len(donors) * 30.0 ** 2), 0, 1) * region
    fill = ndimage.gaussian_filter(beta * w, 6) / np.maximum(ndimage.gaussian_filter(w, 6), 1e-3)
    beta = np.where(w > 0.5, beta, w * beta + (1 - w) * fill)
    beta = ndimage.gaussian_filter(beta, 0.7)
    a = np.where(region, 1 - beta, 0)
    a = np.where(ndimage.binary_dilation(mask, iterations=1), a, a * 0)   # nothing outside the marking
    ac = dm - (1 - a)[..., None] * mm
    c = ac / np.maximum(a, 0.05)[..., None]
    core = mask & (a > 0.15)
    if core.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~core, return_indices=True)
        c = np.where(core[..., None], c, c[iy, ix])
    return np.dstack([np.clip(c, 0, 255), np.clip(a * 255, 0, 255)]).astype(np.uint8)


def shade(donors, matched, mask, valid):
    """512 RGBA darkening layer: black at alpha 1 - (marked / base brightness), the mean over the pairs (orc 'shade')."""
    region = ndimage.binary_dilation(mask, iterations=1) & valid
    ratios = [(d.mean(axis=2) + 1) / (m.mean(axis=2) + 1) for d, m in zip(donors, matched)]
    a = np.clip(1 - np.mean(ratios, axis=0), 0, 1) * region
    a = ndimage.gaussian_filter(a, 0.6) * region
    return np.dstack([np.zeros(a.shape + (3,)), np.clip(a * 255, 0, 255)]).astype(np.uint8)


def over(base, layer):
    a = layer[..., 3:].astype(np.float32) / 255
    return base * (1 - a) + layer[..., :3].astype(np.float32) * a


def residual(donor, base, layer, race, sex, mask=None):
    """How far base + layer is from the marked colour (eyeball left out): (mean, p99, mean inside the marking) of
    |rgb| sum, tone-matched the way the cut is, so a colour whose base differs by a global tint still reads as base +
    layer; untoned mean last (0 = the marked colour IS its base + the layer, pixel for pixel)."""
    body, head, eye = regions(race, sex)
    comp = over(base, layer)
    matched = tone_matched(donor, comp, body, head, ~eye)
    full = np.abs(donor - matched).sum(axis=2)
    d = full[~eye]
    inside = full[ndimage.binary_dilation(mask, iterations=2) & ~eye].mean() if mask is not None and mask.any() else 0.0
    raw = np.abs(donor - comp).sum(axis=2)[~eye]
    return float(d.mean()), float(np.percentile(d, 99)), float(inside), float(raw.mean())


def split_markings(files, query, preview=None, table=None, extra=False):
    """F-230: the other races' unbundled markings as sources for markings_regroup.py:
    [{race, sex, old_section, old_type, kind, design, colour, pairs, source, image (512 RGBA)}]. Writes nothing to the zpak.
    table: SPLITS (default) or ROUND2; extra: the sources are flagged `extra` / `round2` (values appended, no old
    customization value to migrate)."""
    table = SPLITS if table is None else table
    report, out = [], []
    cache, chosen = {}, {}

    def atlas(race, sex, c):
        if (race, sex, c) not in cache:
            cache[(race, sex, c)] = atlas_rgb(files, query, race, sex, c)
        return cache[(race, sex, c)]

    for (race, g), designs in table.items():
        folder, sex = FOLDERS[race], SEXES[g]
        for section, kind, name, pairs, parts, strength, *opt in designs:
            mode, also = (opt[0] if opt else 'paint'), (opt[1] if len(opt) > 1 else None)
            donor, base = pairs[0]
            cuts = [cut(atlas(race, g, d), atlas(race, g, b), race, g, parts, strength) for d, b in pairs]
            mask = np.logical_or.reduce([c[1] for c in cuts])
            # candidates: the opaque cut from each pair, and (several bases) the matte; the one closest to every
            # marked colour inside the marking wins
            cands = [(f'cut {d}/{b}', c[0]) for (d, b), c in zip(pairs, cuts)]
            if mode == 'shade':
                donors, bases = [atlas(race, g, d) for d, _ in pairs], [c[3] for c in cuts]
                cands = [('shade', shade(donors, bases, mask, cuts[0][2]))]
                if len(pairs) > 1:
                    cands.append(('matte', matte(donors, bases, mask, cuts[0][2])))
            if also and (*also, section, kind) in chosen:
                cands.append((f'{FOLDERS[also[0]]} {SEXES[also[1]]} layer', chosen[(*also, section, kind)]))
            scores = [np.mean([residual(atlas(race, g, d), atlas(race, g, b), lay, race, g, mask)[2] for d, b in pairs])
                      for _, lay in cands]
            how, layer = cands[int(np.argmin(scores))]
            if extra and (race, g, kind) in ROUND2_HUE:
                layer = keep_hue(layer, *ROUND2_HUE[(race, g, kind)])
                how += ' - hue'
            if extra and (race, g, kind) in ROUND2_DROP:
                layer = drop_regions(layer, ROUND2_DROP[(race, g, kind)])
                how += ' - ' + ', '.join(ROUND2_DROP[(race, g, kind)])
            chosen[(race, g, section, kind)] = layer
            report.append(f'{folder} {sex} s{section} t{kind} {name}: ' + ', '.join(
                f'{n} {sc:.1f}' for (n, _), sc in zip(cands, scores)) + f' -> {how}')
            words = name.split()
            colour = words[-1] if words[-1] in ('red', 'blue', 'black', 'purple', 'white', 'gold', 'violet', 'green') else ''
            design = ' '.join(words[:-1]) if colour else name
            out.append({'race': race, 'sex': g, 'old_section': section, 'old_type': None if extra else kind,
                        'kind': 'marking', 'design': design, 'colour': colour, 'pairs': pairs,
                        **({'extra': True, 'round2': True, 'round': 3 if kind >= 111 else 2} if extra else {}),
                        'source': f'baked split of colour(s) {", ".join(str(d) for d, _ in pairs)} ({how}, {parts})',
                        'image': Image.fromarray(layer, 'RGBA')})
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(layer, 'RGBA').save(preview / f'{folder}{sex}_{section}_{kind:02d}.png')
    print('\n'.join(report))
    return out


# ---------------------------------------------------------------------------------------------------------------
# F-230 round 2 (2026-10-30): the baked markings the skin check's detector (cli/lib/baked_marks.py) found on offered
# skins and faces that the user flagged. Same entry shape as SPLITS ((section, n) only key the cut; no old value).
# Bases are the plain colour of the same tone (markings_regroup tone test, marking left out).
ROUND2 = {
    (3, 0): [(6, 101, 'Dark Iron star paint purple', [(28, 35), (29, 33)], 'face', (120, 80))],
    (3, 1): [(6, 101, 'Dark Iron tear paint', [(28, 41), (29, 33)], 'face', (100, 60)),
             (6, 102, 'Dark Iron brand tattoo', [(32, 40)], 'body+face', (120, 80))],
    (4, 0): [(7, 101, 'Cenarion shoulder tattoo purple', [(25, 0)], 'body', (100, 60)),
             (7, 102, 'Cenarion back tattoo purple', [(26, 0)], 'body', (100, 60)),
             (7, 103, 'Cenarion vine tattoo purple', [(27, 0)], 'body', (100, 60)),
             (7, 104, 'Cenarion thorn tattoo purple', [(28, 0)], 'body', (100, 60)),
             (7, 105, 'Cenarion shoulder tattoo blue', [(29, 5)], 'body', (100, 60)),
             (7, 106, 'Cenarion back tattoo blue', [(30, 5)], 'body', (100, 60)),
             (7, 107, 'Cenarion vine tattoo blue', [(31, 5)], 'body', (100, 60)),
             (7, 108, 'Cenarion thorn tattoo blue', [(32, 5)], 'body', (100, 60))],
    (11, 0): [(7, 101, 'Lightforged gilded markings gold', [(32, 5)], 'body', (120, 80))],
    (11, 1): [(7, 101, 'Lightforged gilded markings gold', [(32, 37)], 'body', (120, 80))],
}
# round 3 (2026-10-30, user: "extract them"): the rest of the detector's leads that are paint. Not split: night elf
# Illidari fire colours (M 33, F 25: the fire is the orange demon skin itself, the cut takes the whole body), clothing
# and jewellery (night elf F 33 / 34 chains, undead F 25 / 26 harness), death knight glow (dwarf M 20 / F 13, draenei
# 13-16, gnome F 9). Bases are the plain colour
# with the closest structure (affine fit), the cut is tone-matched to it. Same (race, sex) keys: the n values are new.
ROUND3 = {                                       # n >= 111: the source is flagged round 3 (own migration)
    (4, 0): [(7, 112, 'Illidari fel slashes', [(34, 19)], 'body', (100, 60)),
             (7, 113, 'Illidari runes white', [(35, 23)], 'body', (100, 60)),
             (7, 114, 'Illidari runes violet', [(36, 19)], 'body', (100, 60)),
             (7, 115, 'Illidari runes blue', [(37, 19)], 'body', (100, 60))],
    (4, 1): [(7, 112, 'Illidari fel slashes', [(26, 20)], 'body', (100, 60)),
             (7, 113, 'Illidari runes white', [(27, 19)], 'body', (100, 60)),
             (7, 114, 'Illidari runes violet', [(28, 19)], 'body', (100, 60)),
             (7, 115, 'Illidari runes blue', [(29, 20)], 'body', (100, 60)),
             (7, 116, 'Cenarion leaf tattoo green', [(30, 33)], 'body', (100, 60)),
             (7, 117, 'Cenarion leaf tattoo purple', [(31, 8)], 'body', (100, 60)),
             (7, 118, 'Cenarion leaf tattoo blue', [(32, 19)], 'body', (100, 60))],
    (10, 0): [(6, 111, 'Void star paint', [(34, 2), (35, 20)], 'face', (100, 60))],
    (10, 1): [(6, 111, 'Void tear paint', [(34, 2), (35, 20)], 'face', (100, 60))],
    (7, 0): [(6, 111, 'Cultist mask paint', [(13, 15), (14, 4)], 'face', (100, 60))],
    (7, 1): [(6, 111, 'Cultist mask paint', [(13, 12), (14, 4), (5, 11)], 'face', (100, 60))],
    (8, 0): [(7, 111, 'Tiger stripes', [(37, 2)], 'body+face', (100, 60)),
             (7, 112, 'Blood paint red', [(38, 36)], 'body+face', (120, 80))],
    (8, 1): [(7, 111, 'Tiger stripes', [(37, 19)], 'body+face', (100, 60)),
             (7, 112, 'Blood paint red', [(38, 1)], 'body+face', (120, 80))],
    (11, 0): [(7, 111, 'Fel lines', [(30, 20), (31, 40)], 'body', (100, 60))],
    (11, 1): [(7, 111, 'Fel lines', [(30, 4), (31, 17)], 'body', (100, 60))],
}
# round-3 cuts whose marking shares regions with baked clothing: keep only the pixels near the design's own hue
# (night elf female Cenarion 30-32 carry bead cords over the leaf tattoos)
# night elf fel slashes and draenei fel lines: only the green fel glow, the cut otherwise takes the demon skin with it
# -> (hue in degrees or None = the layer's own dominant hue, least HSV value): fel is the bright green glow (~100)
ROUND2_HUE = {(4, 1, 116): (None, 0.4), (4, 1, 117): (None, 0.4), (4, 1, 118): (None, 0.4),
              (4, 0, 112): (100, 0.35), (4, 1, 112): (100, 0.35), (11, 0, 111): (100, 0.35), (11, 1, 111): (100, 0.35)}


# atlas regions a round-2 cut must not keep (compositor REGIONS): baked clothing, not markings. Dwarf female 32 carried
# its dark gloves and boots (the cut reads them as a marking over the bare base), Lightforged 32 its gold sabatons
# (2026-10-30 review: the solid wrist band next to the gloves is their cuff and goes with them; the zigzag upper-arm
# band and the torso / back pattern are tattoo and stay)
ROUND2_DROP = {(3, 1, 102): ('ArmLower', 'Hand', 'Foot', 'LegLower'), (11, 0, 101): ('Foot',), (11, 1, 101): ('Foot',)}


def keep_hue(layer, target=None, min_value=0.0, reach=35, min_sat=0.22):
    """Only the layer pixels near its dominant hue (saturated ink), so dark cords / beads / metal drop out."""
    import colorsys
    rgb = layer[..., :3].astype(np.float32) / 255
    mx, mn = rgb.max(axis=2), rgb.min(axis=2)
    sat = (mx - mn) / np.maximum(mx, 1e-3)
    solid = layer[..., 3] > 128
    hsv = np.asarray([colorsys.rgb_to_hsv(*p) for p in rgb[solid & (sat > min_sat)].reshape(-1, 3)]) if solid.any() else None
    if hsv is None or not len(hsv):
        return layer
    hist, edges = np.histogram(hsv[:, 0] * 360, bins=36, range=(0, 360))
    peak = target if target is not None else (edges[hist.argmax()] + 5)
    r, g, b = rgb[..., 0], rgb[..., 1], rgb[..., 2]
    hue = np.degrees(np.arctan2(np.sqrt(3) * (g - b), 2 * r - g - b)) % 360
    dist = np.minimum(np.abs(hue - peak), 360 - np.abs(hue - peak))
    keep = (dist < reach) & (sat > min_sat) & (mx >= min_value)
    from scipy import ndimage as _nd
    keep = _nd.binary_closing(keep, iterations=1) & (layer[..., 3] > 20)
    lab, n = _nd.label(keep)                     # bead strings and stray dots: small separate pieces
    if n:
        sizes = _nd.sum(keep, lab, range(1, n + 1))
        flat = [i + 1 for i, sl in enumerate(_nd.find_objects(lab))       # bead strings: thin horizontal runs
                if (sl[1].stop - sl[1].start) > 4 * (sl[0].stop - sl[0].start) and (sl[0].stop - sl[0].start) < 16]
        keep = np.isin(lab, 1 + np.flatnonzero(sizes >= 40)) & ~np.isin(lab, flat)
    keep = _nd.binary_dilation(keep, iterations=1) & (layer[..., 3] > 20)   # the soft edge back
    out = layer.copy()
    out[..., 3] = np.where(keep, out[..., 3], 0)
    return out


def drop_regions(layer, names):
    from lib.wardrobe.compositor import REGIONS as _R
    layer = layer.copy()
    for n in names:
        x, y, w, h = (v * 2 for v in _R[n])
        layer[y:y + h, x:x + w, 3] = 0
    return layer


# face types that are another face type of the same colour plus paint (detector `face-type`): (race, sex) ->
# [(design, colour, [(marked type, plain type), ...the death knight copies], cut colour)]. The marked type is taken out
# of the creator (glue faces lists) and characters on it move to the plain type + this face marking.
FACE_SPLITS = {
    (4, 0): [('Cenarion mask tattoo', 'purple', [(18, 7), (25, 16)], 0),
             ('Cenarion vine face tattoo', 'purple', [(19, 8), (26, 17)], 0),
             ('Cenarion cheek tattoo', 'purple', [(21, 0), (28, 9)], 0),
             ('Cenarion brow tattoo', 'purple', [(22, 1), (29, 10)], 0),
             ('Cenarion antler tattoo', 'purple', [(23, 2), (30, 11)], 0),
             ('Cenarion sweep tattoo', 'purple', [(24, 4), (31, 13)], 0),
             ('Illidari cheek marks', '', [(20, 5), (27, 14)], 0)],
    (8, 0): [('Shadow brow paint', '', [(11, 10), (14, 13)], 0),
             ('Shadow eye paint', '', [(12, 1), (15, 6)], 0)],
    (8, 1): [('Shadow brow paint', '', [(13, 2), (16, 8)], 0),
             ('Shadow eye paint', '', [(14, 0), (17, 6)], 0)],
}
# troll male "facial hair" styles 5-10 are face paint (CharSections base_section 2, colour = hair colour): one face
# marking per style and distinct paint colour (hair colours whose paint reads as the same named colour merge)
TROLL_PAINT = {5: 'Spiked skull paint', 6: 'Ringed eye paint', 7: 'Warmask paint', 8: 'Bone face paint',
               9: 'Striped paint', 10: 'Splash paint'}


def face_split_sources(files, query, preview=None):
    out = []
    for (race, g), designs in FACE_SPLITS.items():
        for name, colour, pairs, c in designs:
            marked, base = pairs[0]
            layer, mask, _v, _m = cut(atlas_rgb(files, query, race, g, c, marked),
                                      atlas_rgb(files, query, race, g, c, base), race, g, 'face', (100, 60))
            out.append({'race': race, 'sex': g, 'old_section': 6, 'old_type': None, 'kind': 'marking',
                        'design': name, 'colour': colour, 'pairs': [], 'face_pairs': pairs,
                        'extra': True, 'round2': True,
                        'source': f'baked split of face type {marked} over {base} (colour {c})',
                        'image': Image.fromarray(layer, 'RGBA')})
            print(f'{FOLDERS[race]} {SEXES[g]} face {marked} -> {base}: {name} ({mask.mean():.2%} of the atlas)')
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(layer, 'RGBA').save(preview / f'{FOLDERS[race]}{SEXES[g]}_face{marked:02d}.png')
    return out


def colour_name(rgb):
    import colorsys
    r, gg, b = (float(v) / 255 for v in rgb)
    h, l, sat = colorsys.rgb_to_hls(r, gg, b)
    if sat < 0.18 or max(r, gg, b) - min(r, gg, b) < 0.08:
        return 'black' if l < 0.3 else 'grey' if l < 0.68 else 'white'
    h *= 360
    for edge, name in ((12, 'red'), (40, 'orange'), (68, 'yellow'), (155, 'green'), (195, 'teal'), (255, 'blue'),
                       (290, 'purple'), (340, 'pink'), (361, 'red')):
        if h < edge:
            return name


def troll_paint_sources(files, query, preview=None):
    """[source] per (style, named paint colour), and the map (style, hair colour) -> (design, colour) for the
    character migration."""
    rows = query('SELECT type, color_index, texture_1, texture_2 FROM charsections WHERE race = 8 AND gender = 0 '
                  'AND base_section = 2 AND type BETWEEN 5 AND 10 ORDER BY id')
    live = {(r['type'], r['color_index']): r for r in rows}                  # highest id wins (F-225)
    out, colour_map = [], {}
    for style, design in TROLL_PAINT.items():
        layers = {}
        for (t, c), r in sorted(live.items()):
            if t != style:
                continue
            canvas = Image.new('RGBA', (SIZE, SIZE), (0, 0, 0, 0))
            for col, (x, y, w, h) in (('texture_2', (0, 320, 256, 64)), ('texture_1', (0, 384, 256, 128))):
                f = files.find(r[col])
                if f:
                    canvas.alpha_composite(read_blp(f).convert('RGBA').resize((w, h), Image.LANCZOS), (x, y))
            layers[c] = np.asarray(canvas)
        stack = np.stack([layers[c][..., :3].astype(np.float32) for c in sorted(layers)])
        solid = np.logical_and.reduce([layers[c][..., 3] > 128 for c in layers])
        paint = solid & (stack.std(axis=0).mean(axis=2) > 20)                # the pixels that follow the hair colour
        groups = {}
        for c in sorted(layers):
            name = colour_name(np.median(layers[c][..., :3][paint], axis=0)) if paint.any() else ''
            groups.setdefault(name, []).append(c)
        for name, cols in groups.items():
            meds = np.stack([np.median(layers[c][..., :3][paint], axis=0) for c in cols])
            rep = cols[int(np.argmin(np.abs(meds - np.median(meds, axis=0)).sum(axis=1)))]
            for c in cols:
                colour_map[(style, c)] = (design, name)
            out.append({'race': 8, 'sex': 0, 'old_section': 6, 'old_type': None, 'kind': 'marking',
                        'design': design, 'colour': name, 'pairs': [], 'extra': True, 'round2': True,
                        'troll_paint': [style, cols],
                        'source': f'troll male facial-hair paint style {style}, hair colour {rep} (same paint: '
                                  f'{", ".join(map(str, cols))})',
                        'image': Image.fromarray(layers[rep], 'RGBA')})
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(layers[rep], 'RGBA').save(preview / f'trollpaint_{style}_{name}.png')
        print(f'troll paint style {style} ({design}): ' + ', '.join(f'{n} {cs}' for n, cs in groups.items()))
    return out


def round2_sources(files=None, query=None, preview=None):
    """F-230 round 2 sources for markings_regroup.py (flagged extra / round2): colour splits, face-type splits and the
    troll male facial-hair paint."""
    files = files or resolver()
    query = query or _dbc_query_fn('live')
    # round 3 last: values are numbered in source order, so the shipped round-2 values never move
    return (split_markings(files, query, preview, ROUND2, extra=True) + face_split_sources(files, query, preview)
            + troll_paint_sources(files, query, preview) + split_markings(files, query, preview, ROUND3, extra=True))


def layer_sources(files=None, query=None):
    """F-230: every layer this script cuts, as sources for markings_regroup.py (which owns the CharSections rows and
    the shipped BLPs): the two orc paints kept (Handprints, War paint: were war paint 13 / 14) and SPLITS."""
    files = files or resolver()
    query = query or _dbc_query_fn('live')
    out = []
    for g, sex in SEXES.items():
        skins = {}

        def skin(c):
            if c not in skins:
                skins[c] = load(files, SKIN_TEX.format(sex=sex, colour=c))
            return skins[c]

        for n, (name, donor, base, mode, *opts) in ((n, v) for n, v in MARKINGS.items() if n in WAR_PAINT):
            layer, cover = marking(skin(donor), skin(base), mode, *opts[:2], *(skin(c) for c in opts[2:3]))
            layer = Image.fromarray(layer, 'RGBA').resize((SIZE, SIZE), Image.LANCZOS)
            out.append({'race': RACE, 'sex': g, 'old_section': SECTION_WAR_PAINT, 'old_type': WAR_PAINT[n],
                        'kind': 'marking', 'design': f'Ascension {name.lower()}', 'colour': '',
                        'pairs': [(c, b) for c, (b, m) in SPLIT_COLOURS.items() if m == n],
                        'source': f'baked split of orc colour {donor} over {base} ({mode})', 'image': layer})
    return out + split_markings(files, query)


def resolver():
    # the HD art lives in the curated pack and its COMMUNITY sources, not in EXTERNAL_ROOTS (PATCH-Q split)
    first = [ASSETS, CURATED] + [p for p in COMMUNITY if p.is_dir()]
    return FileResolver(first + [r for r in EXTERNAL_ROOTS if Path(r).resolve() not in {f.resolve() for f in first}])


# skin colours whose faces baked in face paint, now facial marking BAKED_MARK (eyes_markings.py BAKED)
BAKED_FACE = {'colours': (44, 45), 'marking': 8}


def max_character_guid():
    out = subprocess.run([sys.executable, '-m', 'cli.zep', 'world', 'sql', 'query', 'SELECT MAX(guid) FROM characters',
                          '-d', 'characters'], cwd=CRAFT, capture_output=True, text=True, check=True).stdout.split()
    return int(out[-1])


def migration_sql(split, cutoff):
    lines = ['-- F-151 Modern Character Creator: orcs on a skin colour that baked a body marking move to the',
             '-- base colour + that marking (character_customizations 3).',
             '-- GENERATED by Scripts/Character Skins/body_markings.py --migration - do not edit, re-run the script.',
             'DROP TEMPORARY TABLE IF EXISTS zep_orc_body_split;',
             'CREATE TEMPORARY TABLE zep_orc_body_split (gender TINYINT UNSIGNED, skin TINYINT UNSIGNED,',
             '  base TINYINT UNSIGNED, marking TINYINT UNSIGNED, PRIMARY KEY (gender, skin));',
             'INSERT INTO zep_orc_body_split (gender, skin, base, marking) VALUES',
             ',\n'.join(f'({g}, {c}, {b}, {m})' for g in SEXES for c, (b, m) in sorted(split.items())) + ';',
             'INSERT INTO character_customizations (guid, customization, choice)',
             'SELECT c.guid, 3, s.marking FROM characters AS c',
             'JOIN zep_orc_body_split AS s ON s.gender = c.gender AND s.skin = c.skin',
             'WHERE c.race = 2 AND NOT EXISTS (SELECT 1 FROM character_customizations AS x WHERE x.guid = c.guid AND x.customization = 3);',
             'UPDATE characters AS c JOIN zep_orc_body_split AS s ON s.gender = c.gender AND s.skin = c.skin',
             'SET c.skin = s.base WHERE c.race = 2;',
             'DROP TEMPORARY TABLE zep_orc_body_split;',
             f'-- the face paint colours {BAKED_FACE["colours"]} draw plain faces now: their orcs get facial marking '
             f'{BAKED_FACE["marking"]}. Only characters that existed when',
             f'-- this was generated (guid <= {cutoff}), so a later character that chose no marking keeps none.',
             f'UPDATE character_customizations AS x JOIN characters AS c ON c.guid = x.guid SET x.choice = {BAKED_FACE["marking"]}',
             f'WHERE c.race = 2 AND c.skin IN ({", ".join(map(str, BAKED_FACE["colours"]))}) AND x.customization = 2 '
             f'AND x.choice = 0 AND c.guid <= {cutoff};']
    return '\n'.join(lines) + '\n'


def main():
    preview = Path(sys.argv[sys.argv.index('--preview') + 1]) if '--preview' in sys.argv else None
    files = resolver()
    sql = ['-- F-151 Modern Character Creator: orc colour 9 plain skin (its painted-in loincloth removed).',
           '-- The body markings this script cuts are sources for markings_regroup.py (F-230), which owns the layer rows.',
           '-- GENERATED by Scripts/Character Skins/body_markings.py - do not edit, re-run the script.']
    for g, sex in SEXES.items():
        for c, (original, filler) in PLAIN_REPAIR.get(g, {}).items():
            fixed, cover = repair(load(files, original), load(files, SKIN_TEX.format(sex=sex, colour=filler)))
            rel = f'Character\\Orc\\{sex}\\Orc{sex}Skin00_{c:02d}Plain.blp'
            icons.write_blp_rgba(ASSETS / rel.replace('\\', '/'), Image.fromarray(fixed, 'RGB').convert('RGBA'))
            print(f'{sex} colour {c}: painted-in cloth ({cover:.1%}) replaced with colour {filler} shading')
            sql.append(f"UPDATE charsections SET texture_1 = '{rel.replace(chr(92), chr(92) * 2)}' WHERE race = {RACE} "
                       f"AND gender = {g} AND base_section = {SECTION_SKIN} AND type = 0 AND color_index = {c};  -- plain skin")
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(fixed, 'RGB').save(preview / f'{sex}_skin{c}_plain.png')
    if preview:
        for src in layer_sources(files):
            src['image'].save(preview / f"{src['race']}_{src['sex']}_{src['old_section']}_{src['old_type']:02d}.png")
    SQL.write_text('\n'.join(sql) + '\n')
    SPLIT.write_text(json.dumps({str(c): v for c, v in SPLIT_COLOURS.items()}, indent=1) + '\n')
    print(f'-> {SQL.relative_to(CRAFT)}, {SPLIT.name}')
    if '--migration' in sys.argv:
        MIGRATION.write_text(migration_sql(SPLIT_COLOURS, max_character_guid()))
        print(f'-> {MIGRATION.relative_to(CRAFT)}')


if __name__ == '__main__':
    main()
