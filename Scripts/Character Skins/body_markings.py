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
import os
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
FOLDERS = {1: 'Human', 2: 'Orc', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll', 10: 'BloodElf', 11: 'Draenei'}
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
    # 5b tried a base cut (100, 60) to keep the chest piece; its proof failed (chest piece and collar lost), so the
    # shipped shade cut stays until the chest piece / collar are an accessory (batch 1, 2026-11-01)
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


def skin_agnostic(layer, donor, matched, dark=12.0, black=35.0, glow=(60, 170), agree=None):
    """F-230 batch 2 (Eredar male: a value is worn on every skin colour, and the 31 cut painted lilac over red 41):
    keep only the cut's pixels that are pattern on any skin - much darker than the tone-matched base AND dark in
    themselves (the demon limbs), or fel green (the lines). Skin-tone differences fall out."""
    def lab(rgb):
        c = np.asarray(rgb, np.float64) / 255
        c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
        y = c @ np.array([0.2126, 0.7152, 0.0722])
        return np.where(y > 0.008856, 116 * np.cbrt(y) - 16, 903.3 * y)
    Ld, Lm = lab(donor), lab(matched)
    h = np.asarray(donor, np.float32) / 255
    mx, mn = h.max(axis=2), h.min(axis=2)
    sat = (mx - mn) / np.maximum(mx, 1e-3)
    hue = np.degrees(np.arctan2(np.sqrt(3) * (h[..., 1] - h[..., 2]), 2 * h[..., 0] - h[..., 1] - h[..., 2])) % 360
    green = (hue > glow[0]) & (hue < glow[1]) & (sat > 0.3) & (mx > (0.25 if glow[0] > 50 else 0.55))
    if glow[0] <= 50:
        green &= Ld > Lm + 8            # flames glow: brighter than the skin under them (orange skin is not fire)
    darker = (Ld < Lm - dark) & (Ld < black)
    glowmask = ndimage.binary_dilation(green, iterations=1)
    keep = ndimage.binary_opening(darker, iterations=1) | glowmask
    keep = ndimage.binary_closing(keep, iterations=1)
    if agree is not None:                     # another colour's keep of the same design: the pattern's layout
        keep &= ndimage.binary_dilation(agree, iterations=4)
    # islands: specks below MIN_ISLAND px are skin noise, not pattern (batch-2 review: red flecks on lilac)
    lab_, n = ndimage.label(keep)
    if n:
        keep = np.isin(lab_, 1 + np.flatnonzero(ndimage.sum(keep, lab_, range(1, n + 1)) >= MIN_ISLAND))
    soft = ndimage.gaussian_filter(keep.astype(np.float32), 0.8)
    out = layer.copy()
    alpha = layer[..., 3].astype(np.float32) * np.clip(soft * 1.3, 0, 1)
    # colour from the pattern only (batch-2 review: "colour bleed"): the glow keeps its own colour; the dark limbs are
    # the donor's darkness with its hue taken out (a red or lilac skin's dark limb is near-black on any skin); every
    # other pixel - the anti-aliased rim, which mixes in the source skin - takes the nearest interior pattern pixel's
    # colour and keeps only its alpha (unmatte)
    rgb = np.asarray(donor, np.float32).copy()
    lum = rgb @ np.array([0.299, 0.587, 0.114], np.float32)
    limb = keep & ~glowmask
    rgb[limb] = (lum[limb][:, None] * np.array([1.0, 0.97, 1.03], np.float32)) * 0.9 + rgb[limb] * 0.1
    core = ndimage.binary_erosion(keep, iterations=1) & (alpha > 200)
    if core.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~core, return_indices=True)
        rgb = np.where(core[..., None], rgb, rgb[iy, ix])
    out[..., :3] = np.clip(rgb, 0, 255).astype(np.uint8)
    out[..., 3] = np.where(ndimage.binary_dilation(keep, iterations=2), alpha, 0).astype(np.uint8)
    return out


MIN_ISLAND = 40


def demon_skin(donor, matched, glow=(60, 170), agree=None, dark_rgb=(16, 13, 18), sigma=9.0, reach=40):
    """F-230 batch 2 (user: "the original bake has dark areas of the skin to blend in, so everything below the elbow is
    affected ... fail to apply the marking neatly"): the demon limbs as TWO parts, so they sit on any skin like the bake:
    (a) a darkening gradient - alpha = how much darker the bake is than its tone-matched base (1 - L_bake / L_base in
    linear light, low-passed), over one neutral near-black, so it fades into the skin above the elbow / knee exactly
    as the bake does and darkens any skin tone the same way; (b) the fel lines / flames on top, crisp, their colour
    their own (the rim unmatted to the nearest core glow pixel)."""
    d = np.asarray(donor, np.float32) / 255
    m = np.asarray(matched, np.float32) / 255
    lin = lambda c: np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)  # noqa: E731
    w = np.array([0.2126, 0.7152, 0.0722], np.float32)
    Yd, Ym = lin(d) @ w, lin(m) @ w
    mx, mn = d.max(axis=2), d.min(axis=2)
    sat = (mx - mn) / np.maximum(mx, 1e-3)
    hue = np.degrees(np.arctan2(np.sqrt(3) * (d[..., 1] - d[..., 2]), 2 * d[..., 0] - d[..., 1] - d[..., 2])) % 360
    lum_d = 116 * np.cbrt(np.maximum(Yd, 0.008856)) - 16
    lum_m = 116 * np.cbrt(np.maximum(Ym, 0.008856)) - 16
    fire = glow[0] <= 50
    lines = (hue > glow[0]) & (hue < glow[1]) & (sat > 0.3) & (mx > (0.55 if fire else 0.25))
    if fire:
        lines &= lum_d > lum_m + 8
    lines = ndimage.binary_opening(lines, iterations=1) | (lines & ndimage.binary_dilation(ndimage.binary_opening(lines), iterations=1))
    # (a) darkening, read off the bake itself (its bases were baked with other shading, female 30 over 15 showed it):
    # how dark each spot is against the bake's own skin (the median light over the body, the demon limbs being the
    # minority). The lines are filled in from their surroundings first, then low-passed: the fade, not the grain.
    body = Ym > 0.01
    # the skin's light: the bake's upper arm / upper leg / torso (never demon skin), 60th percentile
    sz = d.shape[0] / 256
    upper = np.zeros(Yd.shape, bool)
    for x, y, w_, h_ in ((0, 0, 128, 64), (128, 96, 128, 64), (128, 0, 128, 64)):
        upper[int(y * sz):int((y + h_) * sz), int(x * sz):int((x + w_) * sz)] = True
    skin_ref = max(float(np.percentile(Yd[upper & body], 60)), 1e-3)
    dark = np.clip(1 - Yd / skin_ref, 0, 1)
    dark[ndimage.binary_dilation(lines, iterations=2)] = np.nan
    nanm = np.isnan(dark)
    if nanm.any():
        _, (iy, ix) = ndimage.distance_transform_edt(nanm, return_indices=True)
        dark = dark[iy, ix]
    dark = ndimage.gaussian_filter(dark, sigma)
    # the demon limbs: large regions the bake keeps near-black
    # the demon skin is below the elbow and knee: ArmLower, Hand, LegLower, Foot only (the bake's other dark is shading)
    limbs = np.zeros(Yd.shape, bool)
    for x, y, w_, h_ in ((0, 64, 128, 96), (128, 160, 128, 96)):
        limbs[int(y * sz):int((y + h_) * sz), int(x * sz):int((x + w_) * sz)] = True
    core = (dark > 0.6) & limbs
    core = ndimage.gaussian_filter(core.astype(np.float32), 3) > 0.5
    lab_, n = ndimage.label(core)
    if n:
        core = np.isin(lab_, 1 + np.flatnonzero(ndimage.sum(core, lab_, range(1, n + 1)) >= 300))
    if agree is not None:
        core &= ndimage.binary_dilation(agree, iterations=6)
    # the limb is dark all through (the bake shades its forearm lighter in the middle: a gap read as a blob at the
    # elbow): close wide, fill, within the lower-limb boxes
    core = ndimage.binary_fill_holes(ndimage.binary_closing(np.pad(core, 12), iterations=12)[12:-12, 12:-12]) & limbs
    # inside: one even level; outside: a smooth distance fade (smoothstep over `fade` px, ~ a third of the upper arm on
    # the atlas) into the skin above the elbow / knee. The bake's own shading there read as blotches on light skins
    # (blue draenei proof), so the fade is geometric, not copied.
    level = 0.88
    fade = 30 * sz / 2
    dist = ndimage.distance_transform_edt(~core)
    x = np.clip(1 - dist / fade, 0, 1)
    a_dark = level * (x * x * (3 - 2 * x))
    a_dark = ndimage.gaussian_filter(a_dark, 1.5)
    # (b) the lines: own colour, rim unmatted, alpha from the line mask (1 px soft edge)
    rgb = np.empty_like(d)
    rgb[:] = np.array(dark_rgb, np.float32) / 255
    if lines.any():
        solid = ndimage.binary_erosion(lines, iterations=1) if ndimage.binary_erosion(lines).sum() > 50 else lines
        _, (iy, ix) = ndimage.distance_transform_edt(~solid, return_indices=True)
        line_rgb = d[iy, ix]
        a_line = np.clip(ndimage.gaussian_filter(lines.astype(np.float32), 0.6) * 1.4, 0, 1)
        if agree is not None:
            a_line *= ndimage.binary_dilation(agree, iterations=8)
    else:
        line_rgb, a_line = rgb, np.zeros(Yd.shape, np.float32)
    # lines over the darkening (premultiplied over)
    a = a_line + a_dark * (1 - a_line)
    c = (line_rgb * a_line[..., None] + rgb * (a_dark * (1 - a_line))[..., None]) / np.maximum(a, 1e-3)[..., None]
    return np.dstack([np.clip(c * 255, 0, 255), np.clip(a * 255, 0, 255)]).astype(np.uint8), core


# Cultist paints (human ROUND5 kinds 121-124): (rgb scale, alpha gain) - the sources are the shipped originals (mod 907
# faces, byte-identical), the cut just reads lighter than the bake on the clean skin (batch-2 review)
DARKEN = {(1, 0, 121): (0.8, 1.4), (1, 0, 122): (0.8, 1.4), (1, 1, 121): (0.8, 1.4), (1, 1, 122): (0.8, 1.4),
          (1, 1, 123): (0.8, 1.4), (1, 1, 124): (0.8, 1.4)}


# face paints redrawn sharp (batch-2 review, user: "get the lines sharper ... cheek lines on female in particular"):
# (race, sex, kind) -> (alpha threshold, closing radius at x4 px)
HIRES = {(1, 0, 121): (0.35, 4), (1, 0, 122): (0.35, 4)}   # the female paints are FLAT (redrawn shapes)
ESRGAN = Path('/workspace/project/Zeppelin-Tools/Esteria-review/Portraits/_upscale/RealESRGAN_x4plus.pth')
_esrgan = []


def esrgan4(rgb):
    """x4 Real-ESRGAN (spandrel, CPU; the model F-151 used for the sub-race portraits). rgb: HxWx3 float 0-255."""
    import torch
    from spandrel import ModelLoader
    if not _esrgan:
        _esrgan.append(ModelLoader().load_from_file(str(ESRGAN)).eval())
    x = torch.from_numpy(np.asarray(rgb, np.float32) / 255).permute(2, 0, 1)[None]
    with torch.no_grad():
        y = _esrgan[0](x)[0].clamp(0, 1).permute(1, 2, 0).numpy()
    return y * 255


# face paints whose cut picked up the base face's own differences (female 17 over 7: lip colour and nose-bridge blobs,
# ragged crescent edges; batch-2 review): redrawn from the donor alone - (race, sex, kind) -> (darkness ratio, min px)
# (race, sex, kind) -> the partner colour (donor, base) that paints the same design: 16 / 17 crescents, 24 / 25 streaks
# the cut lifts base skin into these (light splotches, cut out of the layer: see flat_paint)
SPLOTCHY = {(1, 1, 121)}
FLAT = {(1, 1, 121): (17, 7), (1, 1, 122): (16, 1), (1, 1, 123): (25, 9), (1, 1, 124): (24, 5)}


def flat_paint(layer, partner_alpha, head, eye, Z=4, min_px=20, skin=None):
    """A paint redrawn as a clean shape: the cut's own mask kept only where the partner colour's cut of the same design
    agrees (drops what the base face added - female 17 over 7: lip colour, nose-bridge blobs), holes filled, specks
    dropped; the outline smoothed at x4 (blur + threshold: curves stay curves, thin streaks unbroken) and
    anti-aliased back down. Colour: the cut's own paint pixels only (see below)."""
    a = layer[..., 3] > 90
    agree = ndimage.binary_dilation(partner_alpha > 60, iterations=2)
    region = head & ~ndimage.binary_dilation(eye, iterations=1)
    m = a & agree & region
    lab_, n = ndimage.label(m)
    if n:
        m = np.isin(lab_, 1 + np.flatnonzero(ndimage.sum(m, lab_, range(1, n + 1)) >= min_px))
    # fill only pinholes (a full fill closed the lids between the crescent tops and the eyes into paint)
    holes, nh = ndimage.label(~m)
    if nh:
        small = 1 + np.flatnonzero(ndimage.sum(~m, holes, range(1, nh + 1)) < 12)
        m |= np.isin(holes, small)
    m &= region
    big = np.kron(m.astype(np.float32), np.ones((Z, Z), np.float32))
    big = ndimage.gaussian_filter(big, Z * 0.8) > 0.45
    big_a = ndimage.gaussian_filter(big.astype(np.float32), Z * 0.35)
    h, w = m.shape
    alpha = big_a.reshape(h, Z, w, Z).mean(axis=(1, 3))
    alpha[~region] = 0
    # true paint pixels: solid in the cut and not lighter than the paint itself (the cut lifts base skin into the female
    # 16 crescents as light grey splotches). Darker detail (the lids' shadow) stays.
    rgb = layer[..., :3].astype(np.float32)
    lum = rgb @ np.array([0.299, 0.587, 0.114], np.float32)
    core = m & (layer[..., 3] > 180)
    core = core if core.any() else m
    # true paint: in the bake the paint is darker than the face skin around it; the grey splotches of female 16 (base
    # skin lifted into the cut) are as light as the skin or lighter, so they are not paint
    good = core.copy()
    if skin is not None:
        sl = np.asarray(skin, np.float32) @ np.array([0.299, 0.587, 0.114], np.float32)
        skin_l = float(np.median(sl[head & ~ndimage.binary_dilation(core, iterations=3)]))
        good = core & (sl < skin_l - 4)
        truly = good.copy()                              # the paint's own colour comes only from these
        # a splotch is lifted skin at the paint's EDGE (it touches the skin outside the shape); a light patch enclosed
        # by paint is paint (user: "a hole with base colour passing through"), so only edge-touching patches are cut
        outside = ndimage.binary_dilation(~ndimage.binary_dilation(m, iterations=1), iterations=1)
        hl, nh = ndimage.label(core & ~good)
        if nh:
            touch = np.unique(hl[outside & (hl > 0)])
            good |= (hl > 0) & ~np.isin(hl, touch)
        good = ndimage.binary_fill_holes(good) & m | good
    # user (batch 2): the off-colour splotches are cut out of the marking, not recoloured - pixels of the shape that
    # are lighter than the paint (lifted skin) lose their alpha; the rim keeps its anti-aliasing, coloured from the paint
    if skin is not None:
        # only true paint and its own anti-aliased rim keep alpha
        alpha = alpha * np.clip(ndimage.gaussian_filter(ndimage.binary_dilation(good, iterations=1).astype(np.float32), 0.6) * 1.5, 0, 1)
        if truly.any():                                  # enclosed light patches are paint: the paint's colour
            _, (iy, ix) = ndimage.distance_transform_edt(~truly, return_indices=True)
            rgb = np.where(truly[..., None], rgb, rgb[iy, ix])
    if good.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~good, return_indices=True)
        rgb = np.where(good[..., None], rgb, rgb[iy, ix])
    return np.dstack([np.clip(rgb, 0, 255), np.clip(alpha * 255, 0, 255)]).astype(np.uint8)


def hires_paint(layer, head, thresh=0.3, close=6):
    """A face paint redrawn sharp: the head block upscaled x4 (alpha and the unmatted colour separately), the alpha
    rebuilt as a crisp matte there - threshold, gaps closed (broken thin lines, the female 17 nose-bridge gap), a
    ~1.5 px feather - then brought back to atlas size with a box filter, which leaves clean 1 px anti-aliased edges."""
    ys, xs = np.nonzero(head)
    y0, y1, x0, x1 = ys.min(), ys.max() + 1, xs.min(), xs.max() + 1
    blk = layer[y0:y1, x0:x1].astype(np.float32)
    a = blk[..., 3] / 255
    solid = a > 0.6
    rgb = blk[..., :3]
    if solid.any():
        _, (iy, ix) = ndimage.distance_transform_edt(~solid, return_indices=True)
        rgb = rgb[iy, ix]
    big_rgb = esrgan4(rgb)
    big_a = esrgan4(np.repeat(blk[..., 3:4], 3, axis=2)).mean(axis=2) / 255
    m = big_a > thresh
    if close:
        st = ndimage.generate_binary_structure(2, 1)
        m = ndimage.binary_closing(np.pad(m, close), structure=st, iterations=close)[close:-close, close:-close]
    lab_, n = ndimage.label(m)
    if n:
        m = np.isin(lab_, 1 + np.flatnonzero(ndimage.sum(m, lab_, range(1, n + 1)) >= 64))
    alpha = ndimage.gaussian_filter(m.astype(np.float32), 1.5)
    # keep the paint's own opacity inside (translucent washes stay translucent), crisp edge from the matte
    inner = np.clip(ndimage.gaussian_filter(big_a, 2.0) * 1.15, 0, 1)
    alpha = alpha * np.maximum(inner, 0.85 * m)
    h, w = a.shape
    out_rgb = np.asarray(Image.fromarray(np.clip(big_rgb, 0, 255).astype(np.uint8)).resize((w, h), Image.BOX), np.float32)
    out_a = np.asarray(Image.fromarray(np.clip(alpha * 255, 0, 255).astype(np.uint8)).resize((w, h), Image.BOX), np.float32)
    out = layer.copy()
    out[y0:y1, x0:x1, :3] = out_rgb.astype(np.uint8)
    out[y0:y1, x0:x1, 3] = out_a.astype(np.uint8)
    return out


# agnostic cuts limited to where another colour's cut of the same design agrees (Eredar male red: 30's shading put
# red skin patches on the shoulders, batch-2 proof b2_eredar_m_red_on42) - (race, sex, kind) -> (donor, base)
AGREE = {(11, 0, 127): (31, 40), (11, 1, 127): (31, 17)}


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
            if mode == 'self':
                # round 5: the marked skin against its own smoothed skin (no base art needed, see self_cut)
                body_r, head_r, eye_r = regions(race, g)
                valid = np.zeros_like(body_r)
                if 'body' in parts:
                    valid |= body_r
                if 'face' in parts:
                    valid |= head_r
                valid &= ~eye_r
                layer = self_cut(atlas(race, g, donor), valid)
                how, scores, cands = 'self', [0.0], [('self', layer)]
            elif mode == 'tone':
                layer = tone_pattern(atlas(race, g, donor), atlas(race, g, base), race, g, parts)
                how, scores, cands = 'tone', [0.0], [('tone', layer)]
            elif mode in ('agnostic', 'agnostic_fire'):
                # batch 2: the first pair's cut, kept only where it is pattern on ANY skin (see skin_agnostic); fire =
                # the orange / yellow flames instead of fel green
                agree = None
                gl = (5, 60) if mode == 'agnostic_fire' else (60, 170)
                if (race, g, kind) in AGREE:
                    d2, b2 = AGREE[(race, g, kind)]
                    agree = demon_skin(atlas(race, g, d2), atlas(race, g, b2), gl)[0][..., 3] > 60
                layer, _core = demon_skin(atlas(race, g, donor), atlas(race, g, base), gl, agree)
                body_r, head_r, _eye_r = regions(race, g)
                layer[..., 3][~body_r] = 0
                if (race, g) == (4, 0):
                    layer[..., 3][regions(race, g)[1]] = 0   # Illidari male's face row is the blindfold: body only
                how, scores, cands = 'agnostic', [0.0], [('agnostic', layer)]
            elif mode == 'first':
                # the first pair's cut only (5b: the other pair's colour has its own value, but stays a source of this
                # one so an applied migration does not change)
                how, layer, scores = f'cut {pairs[0][0]}/{pairs[0][1]}', cuts[0][0], [0.0]
            else:
                scores = [np.mean([residual(atlas(race, g, d), atlas(race, g, b), lay, race, g, mask)[2]
                                   for d, b in pairs]) for _, lay in cands]
                how, layer = cands[int(np.argmin(scores))]
            if extra and (race, g, kind) in ROUND2_HUE:
                layer = keep_hue(layer, *ROUND2_HUE[(race, g, kind)])
                how += ' - hue'
            if extra and (race, g, kind) in FLAT:
                body_r, head_r, eye_r = regions(race, g)
                pd, pb = FLAT[(race, g, kind)]
                partner = cut(atlas(race, g, pd), atlas(race, g, pb), race, g, parts, strength)[0][..., 3]
                layer = flat_paint(cuts[0][0], partner, head_r, eye_r,
                                   skin=atlas(race, g, donor) if (race, g, kind) in SPLOTCHY else None)
                how += ' - flat paint'
            if extra and (race, g, kind) in HIRES:
                layer = hires_paint(layer, regions(race, g)[1], *HIRES[(race, g, kind)])
                layer[..., 3][regions(race, g)[2]] = 0           # the paints stay off the eyeball
                how += ' - hires'
            if extra and (race, g, kind) in DARKEN:
                # batch-2 review (user): the Cultist paints read too light on the clean skin - darker paint, more of it
                scale, gain = DARKEN[(race, g, kind)]
                layer = layer.copy()
                layer[..., :3] = np.clip(layer[..., :3].astype(np.float32) * scale, 0, 255).astype(np.uint8)
                layer[..., 3] = np.clip(layer[..., 3].astype(np.float32) * gain, 0, 255).astype(np.uint8)
                how += f' - darker x{scale} alpha x{gain}'
            if extra and (race, g, kind) in ROUND2_DROP:
                layer = drop_regions(layer, ROUND2_DROP[(race, g, kind)])
                how += ' - ' + ', '.join(ROUND2_DROP[(race, g, kind)])
            chosen[(race, g, section, kind)] = layer
            report.append(f'{folder} {sex} s{section} t{kind} {name}: ' + ', '.join(
                f'{n} {sc:.1f}' for (n, _), sc in zip(cands, scores)) + f' -> {how}')
            words = name.split()
            colour = words[-1] if words[-1] in ('red', 'blue', 'black', 'purple', 'white', 'gold', 'violet', 'green', 'lilac') else ''
            design = ' '.join(words[:-1]) if colour else name
            out.append({'race': race, 'sex': g, 'old_section': section, 'old_type': None if extra else kind,
                        'kind': 'marking', 'design': design, 'colour': colour, 'pairs': pairs,
                        **({'extra': True, 'round2': True, 'round': 5 if kind >= 121 else 3 if kind >= 111 else 2} if extra else {}),
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
    # batch 1 (2026-11-01): the self cut ships only where its proof passed (male runes white / blue); fel slashes and
    # violet keep the shipped round-3 cut (+ hue filter) until they pass
    (4, 0): [(7, 112, 'Illidari fel slashes', [(34, 19)], 'body', (100, 60)),
             (7, 113, 'Illidari runes white', [(35, 23)], 'body', (100, 60), 'self'),
             (7, 114, 'Illidari runes violet', [(36, 19)], 'body', (100, 60)),
             (7, 115, 'Illidari runes blue', [(37, 19)], 'body', (100, 60), 'self')],
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
    # 5b tried the whole demon pattern of 31 (first pair, (60, 40)): it passed on 31 but carries 31's lilac skin, which
    # paints lilac over red colour 41 (30's clean colour) - held back from batch 1, shipped cut stays
    (11, 0): [(7, 111, 'Fel lines', [(30, 20), (31, 40)], 'body', (100, 60))],
    (11, 1): [(7, 111, 'Fel lines', [(30, 4), (31, 17)], 'body', (100, 60))],   # female 5b proof failed: shipped cut
}
# round-3 cuts whose marking shares regions with baked clothing: keep only the pixels near the design's own hue
# (night elf female Cenarion 30-32 carry bead cords over the leaf tattoos)
# night elf fel slashes and draenei fel lines: only the green fel glow, the cut otherwise takes the demon skin with it
# -> (hue in degrees or None = the layer's own dominant hue, least HSV value): fel is the bright green glow (~100)
ROUND2_HUE = {(4, 1, 116): (None, 0.4), (4, 1, 117): (None, 0.4), (4, 1, 118): (None, 0.4),
              (4, 0, 112): (100, 0.35), (4, 1, 112): (100, 0.35), (11, 0, 111): (100, 0.35), (11, 1, 111): (100, 0.35)}
if True:   # batch 2 shipped (2026-11-01): violet runes as a self cut
    # batch-2 candidates for shipped round-3 values: Illidari male violet runes as a self cut (as white / blue), fel
    # slashes skin-agnostic (green glow + dark) instead of the glow-only hue filter
    # (the fel slashes' agnostic cut is parked with the other fel patterns: it keeps its shipped cut)
    ROUND3[(4, 0)] = [(s, k, n, p, pt, st, 'self') if k == 114 else (s, k, n, p, pt, st, *o)
                      for s, k, n, p, pt, st, *o in ROUND3[(4, 0)]]
# (round 5: the fel slashes / fel lines are self cuts now; the hue filter kept only their glow)


# round 5 (2026-10-31, user): human Cultist colours still painted, the Illidari fire colours split after all.
# n >= 121: the sources are flagged round 5 (own migration).
ROUND5 = {
    # 5b: one value per paint (16 and 17 carry different designs), each cut from its own colour
    (1, 0): [(6, 121, 'Cultist pale points', [(16, 3)], 'face', (40, 25)),
             (6, 122, 'Cultist dark mask', [(17, 8)], 'face', (60, 40))],
    (1, 1): [(6, 121, 'Cultist tear crescents pale', [(16, 1)], 'face', (40, 25)),
             (6, 122, 'Cultist tear crescents dark', [(17, 7)], 'face', (40, 25)),
             (6, 123, 'Cultist tear streaks', [(24, 5)], 'face', (60, 40)),
             (6, 124, 'Cultist tear streaks dark', [(25, 9)], 'face', (60, 40))],
    # 5b proof: the self cut kept only the flames; the bake also darkens hands, forearms, feet and the brow (the whole
    # demon pattern), so it is the base-difference cut over the body like the Eredar
    (4, 0): [(7, 121, 'Illidari fel fire tattoo', [(33, 13)], 'body', (60, 40), 'agnostic_fire')],
    (4, 1): [(7, 121, 'Illidari fel fire tattoo', [(25, 0)], 'body', (60, 40), 'agnostic_fire')],   # face fire: no clean cut
}
# round 5b (2026-10-31, after the round-5 values): Illidari 34-37 face paint (dropped by the round-3 body-only cut),
# the Blackrock demon skins 15 / 44 / 45, the Eredar demon pattern's face part. Kept apart from ROUND5 so its values
# number after every round-5 value.
ROUND5B = {
    (4, 0): [(6, 123, 'Illidari tear paint', [(34, 19)], 'face', (80, 50)),
             (6, 124, 'Illidari cheek runes white', [(35, 23)], 'face', (80, 50)),
             (6, 125, 'Illidari cheek runes violet', [(36, 19)], 'face', (80, 50)),
             (6, 126, 'Illidari cheek runes blue', [(37, 19)], 'face', (80, 50))],
    (2, 0): [(7, 121, 'Blackrock demon pattern blue', [(15, 19)], 'body+face', (60, 40), 'tone'),
             (7, 122, 'Blackrock demon pattern lilac', [(44, 19)], 'body+face', (60, 40), 'tone'),
             (7, 123, 'Blackrock demon pattern purple', [(45, 19)], 'body+face', (60, 40), 'tone')],
    (2, 1): [(7, 122, 'Blackrock demon pattern lilac', [(44, 19)], 'body+face', (60, 40), 'tone'),
             (7, 123, 'Blackrock demon pattern purple', [(45, 19)], 'body+face', (60, 40), 'tone')],
    # the Eredar demon pattern of the red colour 30, cut against a red base (the 31 cut over 20 pulled lilac skin in);
    # no face layer: the baked faces carry no pattern the clean faces lack (5b proof: a face cut only added a blaze)
    # batch 2: one whole demon pattern per base colour, skin-agnostic (only dark limbs and fel green)
    (11, 0): [(7, 127, 'Fel pattern red', [(30, 20)], 'body', (60, 40), 'agnostic'),
              (7, 128, 'Fel pattern lilac', [(31, 40)], 'body', (60, 40), 'agnostic')],
    (11, 1): [(7, 127, 'Fel pattern red', [(30, 15)], 'body', (60, 40), 'agnostic'),
              (7, 128, 'Fel pattern lilac', [(31, 17)], 'body', (60, 40), 'agnostic')],
}


# round 5 face-type splits: human male 33 / 34 (+ DK 36 / 37) are face 2 (DK 14) with painted eye sockets
FACE_SPLITS5 = {
    (1, 0): [('Bat eye sockets', '', [(33, 2), (36, 14)], 0, 'crisp'),
             ('Black eye sockets', '', [(34, 2), (37, 14)], 0, 'crisp')],
}
# round 5: the Illidari blindfold as a face marking (user: Illidari are always masked, on any night elf face). The
# blindfold faces 5 / 20 (+ DK 14 / 27) have no plain twin with the same art, and the leather is recoloured per skin
# colour, so the band is the gold leather of colour 0 (hue 25-80 on the pink skin), closed and filled, kept in that gold
# on every skin; face 20 adds its cheek marks (cut against face 5).
# value design -> (marked type, DK copy, plain base, its DK copy)
# value design -> (marked type, DK copy, plain base, its DK copy, strap colour). Round 5b (user: "too faint, more like a
# tattoo"): an opaque leather strap (work/blindfold_strap.py) along the band, black / crimson / fel-trimmed; the first two
# names shipped in PATCH-L v72 and keep their numbers, the colour variants append.
BLINDFOLD = {(4, 0): [('Illidari blindfold', 5, 14, 3, 12, 'gold'),
                      ('Illidari blindfold dark', 5, 14, 3, 12, 'dark')]}
# (user 2026-11-01: gold + dark approved; 'Illidari blindfold and cheek marks' (face 20) dropped for now - its cheek
# marks, cut at colour 0, came out reddish on dark skins. Face 20 / 27 characters get the gold band.)
# 5b review (user): the black ragged strap was worse than the original -> 'gold' = face 5's own leather band, with the
# dark rim grown back in and the edge fitted to a clean curve (work/blindfold_gold.py). Crimson / fel variants dropped.


def blindfold_band(files, query, race, g):
    """The blindfold's pixels on the 512 atlas: the gold leather of face 5, colour 0 (hue 25-80 on the pink skin)."""
    _body_r, head_r, eye_r = regions(race, g)
    h = atlas_rgb(files, query, race, g, 0, 5) / 255
    mx, mn = h.max(axis=2), h.min(axis=2)
    sat = (mx - mn) / np.maximum(mx, 1e-3)
    hue = np.degrees(np.arctan2(np.sqrt(3) * (h[..., 1] - h[..., 2]), 2 * h[..., 0] - h[..., 1] - h[..., 2])) % 360
    band = (hue > 25) & (hue < 80) & (sat > 0.2) & head_r & ~eye_r
    band = ndimage.binary_closing(band, iterations=3)
    lab_, n = ndimage.label(band)
    if n:
        sizes = ndimage.sum(band, lab_, range(1, n + 1))
        band = np.isin(lab_, 1 + np.flatnonzero(sizes >= 300))
    return ndimage.binary_fill_holes(band) & head_r & ~eye_r


def blindfold_sources(files, query, preview=None):
    spec = importlib.util.spec_from_file_location('blindfold_strap', Path(__file__).with_name('work') / 'blindfold_strap.py')
    bs = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(bs)
    out = []
    for (race, g), designs in BLINDFOLD.items():
        band = blindfold_band(files, query, race, g)
        spec_g = importlib.util.spec_from_file_location('blindfold_gold', Path(__file__).with_name('work') / 'blindfold_gold.py')
        bg = importlib.util.module_from_spec(spec_g)
        spec_g.loader.exec_module(bg)
        face5 = np.asarray(atlas_rgb(files, query, race, g, 0, 5)).clip(0, 255).astype(np.uint8)
        gold = bg.gold_layer(face5, bg.grow_band(face5, band, regions(race, g)[1]))
        band = gold[..., 3] > 0
        strip = None
        base0 = atlas_rgb(files, query, race, g, 0, 5)
        for name, marked, dk, base, dk_base, colour in designs:
            layer = (gold.copy() if colour == 'gold' else bg.dark_layer(gold) if colour == 'dark'
                     else bs.strap(band, colour, strip or bs.leather_strip()))
            if marked != 5:
                cheek, _m, _v, _mt = cut(atlas_rgb(files, query, race, g, 0, marked), base0, race, g, 'face', (100, 60))
                cheek[..., 3][band] = 0
                ca = cheek[..., 3:].astype(np.float32) / 255
                ba = layer[..., 3:].astype(np.float32) / 255
                rgb = layer[..., :3] * ba + cheek[..., :3] * ca * (1 - ba)
                al = ba + ca * (1 - ba)
                layer = np.dstack([rgb / np.maximum(al, 1e-3), al * 255]).clip(0, 255).astype(np.uint8)
            pairs = [(marked, base), (dk, dk_base)] if colour in ('black', 'gold') else []
            if colour == 'gold':
                pairs += [(20, base), (27, dk_base)]          # the cheek-mark faces: gold band, marks dropped
            out.append({'race': race, 'sex': g, 'old_section': 6, 'old_type': None, 'kind': 'marking',
                        'design': name, 'colour': '', 'pairs': [], 'face_pairs': pairs,
                        'extra': True, 'round2': True, 'round': 5,
                        'source': f'leather strap along the blindfold band of face {marked} ({colour})',
                        'image': Image.fromarray(layer, 'RGBA')})
            print(f'{FOLDERS[race]} {SEXES[g]}: {name} ({colour}, {(layer[..., 3] > 48).mean():.2%})')
            if preview:
                preview.mkdir(parents=True, exist_ok=True)
                Image.fromarray(layer, 'RGBA').save(preview / f'{FOLDERS[race]}{SEXES[g]}_{name.replace(" ", "_")}.png')
    return out


# atlas regions a round-2 cut must not keep (compositor REGIONS): baked clothing, not markings. Dwarf female 32 carried
# its dark gloves and boots (the cut reads them as a marking over the bare base), Lightforged 32 its gold sabatons
# (2026-10-30 review: the solid wrist band next to the gloves is their cuff and goes with them; the zigzag upper-arm
# band and the torso / back pattern are tattoo and stay)
ROUND2_DROP = {(3, 1, 102): ('ArmLower', 'Hand', 'Foot', 'LegLower'), (11, 0, 101): ('Foot',), (11, 1, 101): ('Foot',)}


def tone_pattern(donor, base, race, sex, parts, sigma=6.0, full=70.0):
    """5b (Blackrock demon skins): a two-tone pattern that is lighting, not ink. The base is moved to the donor's overall
    tone by one global quadratic RGB map (so the clean colour, made the same way, is the base in that tone); the pattern
    is the LOW-frequency difference left over (blurred donor - blurred mapped base), painted as the donor's own smoothed
    colour with alpha rising with that difference. Shading and creases stay the clean colour's."""
    body, head, eye = regions(race, sex)
    valid = np.zeros_like(body)
    if 'body' in parts:
        valid |= body
    if 'face' in parts:
        valid |= head
    valid &= ~eye
    x = base.reshape(-1, 3) / 255
    feats = np.stack([np.ones(len(x)), x[:, 0], x[:, 1], x[:, 2], x[:, 0] ** 2, x[:, 1] ** 2, x[:, 2] ** 2,
                      x[:, 0] * x[:, 1], x[:, 0] * x[:, 2], x[:, 1] * x[:, 2]], axis=1)
    m = valid.ravel() & (donor.reshape(-1, 3).sum(1) > 30)
    coef, *_ = np.linalg.lstsq(feats[m], donor.reshape(-1, 3)[m], rcond=None)
    mapped = np.clip(feats @ coef, 0, 255).reshape(base.shape)
    dl = np.dstack([ndimage.gaussian_filter(donor[..., k], sigma) for k in range(3)])
    bl = np.dstack([ndimage.gaussian_filter(mapped[..., k], sigma) for k in range(3)])
    diff = np.abs(dl - bl).sum(axis=2)
    a = np.clip((diff - 12) / full, 0, 1) * valid
    a = ndimage.gaussian_filter(a, 1.0)
    # the layer colour: the donor's value at that pixel against the mapped base's (keeps the pattern's own detail)
    c = np.clip(mapped + (dl - bl) / np.maximum(a[..., None], 0.15), 0, 255)
    return np.dstack([c, np.clip(a * 255, 0, 255)]).astype(np.uint8)


def self_cut(rgb, valid, lo=10.0, hi=22.0, min_px=30, size=31):
    """Round 5 (user: the Illidari runes / fel slashes, draenei fel lines and human thorn tattoo cut against a base colour
    were poor): a 512 RGBA layer of the marking cut against the skin's OWN smooth estimate - the neighbourhood median
    with the marking replaced, iterated - so no base colour with the same art is needed. The marking = CIE Lab deltaE
    over `hi` from that estimate (soft from `lo`), components of `min_px` and more; colour unmixed from the estimate."""
    def lab(x):
        c = np.asarray(x, np.float64) / 255
        c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
        xyz = c @ np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]]).T
        xyz /= np.array([0.95047, 1.0, 1.08883])
        f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
        return np.stack([116 * f[..., 1] - 16, 500 * (f[..., 0] - f[..., 1]), 200 * (f[..., 1] - f[..., 2])], axis=-1)

    rgb = np.asarray(rgb, np.float32)
    lab_rgb = lab(rgb)
    work = rgb.copy()
    for _ in range(3):
        bg = np.dstack([ndimage.median_filter(work[..., k], size=size) for k in range(3)])
        d = np.linalg.norm(lab_rgb - lab(bg), axis=2)
        work = np.where(((d > 14.0) & valid)[..., None], bg, rgb)
    mask = ndimage.binary_closing((d > hi) & valid, iterations=1) & valid
    lab_, n = ndimage.label(mask)
    if n:
        sizes = ndimage.sum(mask, lab_, range(1, n + 1))
        mask = np.isin(lab_, 1 + np.flatnonzero(sizes >= min_px))
    grow = ndimage.binary_dilation(mask, iterations=2) & valid
    a = np.maximum(np.clip((d - lo) / (hi - lo), 0, 1) * grow, mask.astype(np.float32))
    c = (rgb - (1 - a[..., None]) * bg) / np.maximum(a[..., None], 0.08)
    return np.dstack([np.clip(c, 0, 255), np.clip(a * 255, 0, 255)]).astype(np.uint8)


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
# round 4 (2026-10-31, user: "male blood elves have baked face markings in skins"): blood elf male faces 20-24 (and
# their death knight copies 25-29) are faces 0, 1, 3, 6, 9 plus scars, runes and fel thorns
FACE_SPLITS4 = {
    (10, 0): [('Scarred runes', '', [(20, 0), (25, 10)], 0),
              ('Slashed runes', '', [(21, 1), (26, 11)], 0),
              ('Eye slash scar', '', [(22, 3), (27, 13)], 0),
              ('Fel thorns', 'green', [(23, 6), (28, 16)], 0),
              ('Fel thorns', 'green', [(24, 9), (29, 19)], 0)],
}
# troll male "facial hair" styles 5-10 are face paint (CharSections base_section 2, colour = hair colour): one face
# marking per style and distinct paint colour (hair colours whose paint reads as the same named colour merge)
TROLL_PAINT = {5: 'Spiked skull paint', 6: 'Ringed eye paint', 7: 'Warmask paint', 8: 'Bone face paint',
               9: 'Striped paint', 10: 'Splash paint'}


def crisp_tips(layer, donor, base, race, g, core=0.9):
    """5b review (user, Cultist sockets): the cut thickens the drips running down onto the cheeks and cuts off their fine
    points; the baked original tapers to crisp tips. Opaque paint re-matted per pixel instead: alpha = how far the baked
    pixel has moved from the plain face towards the paint colour (projection of donor - base on paint - base), the paint
    colour taken from the nearest solid core pixel. Composited over the plain face this gives the baked pixels back, so
    the edges and points are the original's (its own 1 px anti-aliasing, no blur)."""
    _b, _h, eye_r = regions(race, g)
    a0 = layer[..., 3].astype(np.float32) / 255
    solid = ndimage.binary_erosion(a0 >= core, iterations=1)
    if not solid.any():
        return layer
    near = ndimage.distance_transform_edt(~solid, return_indices=True)[1]
    d, b = np.asarray(donor, np.float32), np.asarray(base, np.float32)
    paint = np.asarray(layer[..., :3], np.float32)[near[0], near[1]]
    pb = paint - b
    a = ((d - b) * pb).sum(axis=2) / np.maximum((pb ** 2).sum(axis=2), 1.0)
    zone = ndimage.binary_dilation(a0 > 0.02, iterations=3) & ~eye_r
    a = np.where(zone & ((pb ** 2).sum(axis=2) > 400), np.clip(a, 0, 1), 0)
    a = np.where(a < 0.08, 0, a)                                     # drop the skin-noise floor
    out = layer.copy()
    out[..., :3] = np.where(zone[..., None], paint, layer[..., :3]).clip(0, 255).astype(np.uint8)
    out[..., 3] = np.where(zone, a * 255, layer[..., 3]).clip(0, 255).astype(np.uint8)
    return out


def face_split_sources(files, query, preview=None, table=None, rnd=2):
    out = []
    for (race, g), designs in (FACE_SPLITS if table is None else table).items():
        for name, colour, pairs, c, *post in designs:
            marked, base = pairs[0]
            layer, mask, _v, _m = cut(atlas_rgb(files, query, race, g, c, marked),
                                      atlas_rgb(files, query, race, g, c, base), race, g, 'face', (100, 60))
            if 'crisp' in post:
                layer = crisp_tips(layer, atlas_rgb(files, query, race, g, c, marked),
                                   atlas_rgb(files, query, race, g, c, base), race, g)
            out.append({'race': race, 'sex': g, 'old_section': 6, 'old_type': None, 'kind': 'marking',
                        'design': name, 'colour': colour, 'pairs': [], 'face_pairs': pairs,
                        'extra': True, 'round2': True, 'round': rnd,
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


# Shipping in batches (coordinator 2026-11-01): a round-5 design ships only once its three-panel proof passed. The
# others stay switched off here (no value, no clean colour, no migration) until they pass.
# Illidari cheek runes (white / blue) passed but stay off: Illidari male's face row is the blindfold only (always
# masked), so they would be values nobody can pick - they come back as blindfold + runes combinations if wanted.
BATCH_ON = {'Bat eye sockets', 'Black eye sockets', 'Illidari blindfold', 'Illidari blindfold dark'}
SHIPPED = set(BATCH_ON)                      # batch 1 (2026-11-01); later batches are added here as they ship
# batch 2 (2026-11-01, user: "they look good, ship em"): the Cultist paints - round 6 (own migration)
BATCH2_SHIPPED = {'Cultist pale points', 'Cultist dark mask', 'Cultist tear crescents pale', 'Cultist tear crescents dark',
                  'Cultist tear streaks', 'Cultist tear streaks dark'}
BATCH_ON |= BATCH2_SHIPPED
# batch-2 candidates: on only in a staged proof run (F230_STAGE_B2=1), merged into BATCH_ON once approved
# batch 2 (2026-11-01): the Cultist paints. PARKED (user: "pin them across all races as defective ... block the
# markings from shipping"): every fel / demon-skin / fire pattern - Fel pattern red / lilac (Eredar M / F), Illidari fel
# fire tattoo, the agnostic fel slashes - stays off until the fel extraction issue note is resolved
BATCH2 = {'Cultist pale points', 'Cultist dark mask', 'Cultist tear crescents pale', 'Cultist tear crescents dark',
          'Cultist tear streaks', 'Cultist tear streaks dark'}
FEL_PARKED = {'Fel pattern red', 'Fel pattern lilac', 'Illidari fel fire tattoo'}
if os.environ.get('F230_STAGE_B2'):
    BATCH_ON |= BATCH2


def _batch(sources):
    """Round-5 sources: the shipped batches first (in their source order, so their values never move), then the
    batch being staged, appended after them."""
    def on(s, names):
        return f"{s['design']} {s.get('colour') or ''}".strip() in names or s['design'] in names
    shipped = [s for s in sources if s.get('round') != 5 or on(s, SHIPPED)]
    staged = [s for s in sources if s.get('round') == 5 and not on(s, SHIPPED) and on(s, BATCH_ON)]
    for s in staged:                       # round 6: batch 2 gets its own migration (round 5's is applied)
        s['round'] = 6
    return shipped + staged


def round2_sources(files=None, query=None, preview=None):
    """F-230 round 2 sources for markings_regroup.py (flagged extra / round2): colour splits, face-type splits and the
    troll male facial-hair paint."""
    files = files or resolver()
    query = query or _dbc_query_fn('live')
    # round 3 last: values are numbered in source order, so the shipped round-2 values never move
    return (split_markings(files, query, preview, ROUND2, extra=True) + face_split_sources(files, query, preview)
            + troll_paint_sources(files, query, preview) + split_markings(files, query, preview, ROUND3, extra=True)
            + face_split_sources(files, query, preview, FACE_SPLITS4, rnd=4)
            + _batch(split_markings(files, query, preview, ROUND5, extra=True)
                     + face_split_sources(files, query, preview, FACE_SPLITS5, rnd=5)
                     + blindfold_sources(files, query, preview)
                     + fel_rune_sources(files) + split_markings(files, query, preview, ROUND5B, extra=True)))


def fel_rune_sources(files):
    """Round 5b (user: Fel Orc should get the fel pattern): the green / orange rune ink of orc colours 42 / 43 over 19
    (MARKINGS 8 / 9, 'ink' cut, F-151), body markings gated to Fel Orc. The offered Fel Orc skins carry no bake."""
    out = []
    for g, sex in SEXES.items():
        skins = {}

        def skin(c):
            if c not in skins:
                skins[c] = load(files, SKIN_TEX.format(sex=sex, colour=c))
            return skins[c]
        for n, colour in ((8, 'green'), (9, 'orange')):
            name, donor, base, mode, *opts = MARKINGS[n]
            layer, _cover = marking(skin(donor), skin(base), mode, *opts[:2], *(skin(c) for c in opts[2:3]))
            out.append({'race': RACE, 'sex': g, 'old_section': 7, 'old_type': None, 'kind': 'marking',
                        'design': 'Fel runes', 'colour': colour, 'pairs': [], 'extra': True, 'round2': True, 'round': 5,
                        'source': f'baked split of orc colour {donor} over {base} (ink)',
                        'image': Image.fromarray(layer, 'RGBA').resize((SIZE, SIZE), Image.LANCZOS)})
    return out


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
