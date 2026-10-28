"""F-151 race rings: the round portraits of every race and sub-race on the character creator's rings, and the two
round faction crests.

Retail draws its race portraits from one atlas, interface/glues/charactercreate/charactercreateicons.blp
(FileDataID 1662186). The members come from UiTextureAtlasMember ("raceicon128-<race>-<sex>"). A
sub-race with no retail portrait is derived from one that has, by colour-shifting its skin pixels (Fel Orc =
the retail orc portrait shifted from green to red, Blackrock = shifted to dark grey).

Writes zpaks/patch-modern-login/mpq/source-assets/Interface/Glues/CharacterCreate/
UI-CharacterCreate-SubRace-<NAME>_<SEX>.blp (SIZE x SIZE, palettized BLP2 with 8-bit alpha, round mask; NAME is the
sub-race icon, or for a race without sub-races its file name, e.g. SCOURGE), UI-CharacterCreate-SubRace-CREST_<FACTION>.blp
(the glue's AllianceLogo / HordeLogo on a dark disc) and the two rings drawn over them:
UI-CharacterCreate-SubRace-Ring.blp (always) and -RingChecked.blp (selected).

  python3 "Scripts/Character Skins/subrace_icons.py"
"""
import colorsys
import io
import struct
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from lib import retail  # noqa: E402

OUT = CRAFT / 'zpaks' / 'patch-modern-login' / 'mpq' / 'source-assets' / 'Interface' / 'Glues' / 'CharacterCreate'
ATLAS_FDID = 1662186
# the 130 px square portraits the Esteria creator's author shared (user, 2026-10-27), preferred over the atlas where
# they have the race: [<faction>/]Charactercreate-races_<name>-<sex>[2].png|.gif (64 px wiki icons dropped in too)
PACK = CRAFT.parent / 'Zeppelin-Tools' / 'Esteria-review' / 'Portraits'
PACK_NAMES = {'orc': 'orc', 'magharorc': 'maghar', 'dwarf': 'dwarf', 'darkirondwarf': 'darkirondwarf',
              'bloodelf': 'bloodelf', 'voidelf': 'voidelf', 'draenei': 'draenei', 'lightforged': 'lightforged',
              'gnome': 'gnome', 'human': 'human', 'nightelf': 'nightelf', 'undead': 'undead', 'tauren': 'tauren',
              'troll': 'troll', 'goblin': 'goblin', 'worgen': 'worgen', 'eredar': 'eredar', 'illidari': 'illidari'}
# own portraits recoloured from a pack portrait (already framed like the pack): no 85% shrink
UNFRAMED = {('plaguebound', 'male'), ('plaguebound', 'female'), ('embalmed', 'male'), ('embalmed', 'female'),
            ('cenarion', 'female'), ('bloodmoon', 'male'), ('bloodmoon', 'female')}
SIZE = 128			# sharp at 4K (the glue draws them at 40-52 units, ~110 px there; user 2026-10-28)
# our icon name -> (retail atlas race, skin hue shift or None)
ICONS = {
    'ORC': ('orc', None),
    'MAGHAR': ('magharorc', None),
    'FELORC': ('orc', 'red'),
    'BLACKROCK': ('orc', 'grey'),
    'DWARF': ('dwarf', None),
    'DARKIRON': ('darkirondwarf', None),
    'BLOODELF': ('bloodelf', None),
    'VOIDELF': ('voidelf', None),
    'DRAENEI': ('draenei', None),
    'LIGHTFORGED': ('lightforged', None),
    'EREDAR': ('eredar', None),		# the pack has a real eredar portrait (the atlas doesn't)
    'WILDHAMMER': ('dwarf', 'tattoo'),
    'GNOME': ('gnome', None),
    'LEPERGNOME': ('gnome', 'leper'),
    'CULTISTGNOME': ('gnome', 'dusk'),
    'GRIMTOTEM': ('tauren', None),			# the user's portraits in the pack (grimtotem-<sex>)
    'DARKTROLL': ('troll', None),			# darktroll-<sex>
    'SANDTROLL': ('troll', None),			# sandtroll-<sex>
    'ILLIDARI': ('illidari', None),			# pack illidari-<sex>
    'CENARION': ('nightelf', None),			# cenarion-<sex>: wiki Cenarian male, female recoloured from the pack night elf
    'RIMEBOUND': ('undead', None),			# rimebound-<sex>: wiki Forsaken death knight
    'PLAGUEBOUND': ('undead', None),		# plaguebound-<sex>: pack undead recoloured olive
    'EMBALMED': ('undead', None),			# embalmed-<sex>: pack undead recoloured tan
    'BLOODMOON': ('worgen', None),			# bloodmoon-<sex>: pack worgen recoloured frost-white
    # races without sub-races, by their file name (GetNameForRace)
    'HUMAN': ('human', None),
    'NIGHTELF': ('nightelf', None),
    'SCOURGE': ('undead', None),
    'TAUREN': ('tauren', None),
    'TROLL': ('troll', None),
    'GOBLIN': ('goblin', None),
    'WORGEN': ('worgen', None),
}
CRESTS = {'ALLIANCE': 'AllianceLogo', 'HORDE': 'HordeLogo'}		# CHARACTERCREATE/<file>.blp in this zpak


def tattoo(im):
    """Wildhammer: the dwarf portrait with a blue tribal band across the brow (their skin colours' tattoo)."""
    a = np.asarray(im).astype(float)
    yy, xx = np.mgrid[:a.shape[0], :a.shape[1]]
    band = (np.abs(yy - (0.36 * a.shape[0] + 0.03 * np.sin(xx / 3.0) * a.shape[0])) < 0.035 * a.shape[0]) & (xx > 0.25 * a.shape[1]) & (xx < 0.75 * a.shape[1])
    a[band, :3] = a[band, :3] * 0.35 + np.array([30, 90, 200]) * 0.65
    return Image.fromarray(a.astype(np.uint8), 'RGBA')


def pack_portrait(race, sex, own=False):
    """The pack's portrait of an atlas race name (or, own=True, of one of our icon names, e.g. felorc: a portrait
    dropped into the pack for that sub-race, used as it is), or None."""
    name = race if own else PACK_NAMES.get(race)
    for suffix in ('', '2'):
        found = [f for ext in ('png', 'gif') for f in sorted(PACK.glob(f'**/Charactercreate-races_{name}-{sex}{suffix}.{ext}'))
                 if not any(part.startswith('_') for part in f.relative_to(PACK).parts)] if name else []	# _x/ = kept aside
        for f in found:
            return Image.open(f).convert('RGBA')
    return None


FRAMED = 0.85		# the wiki portraits are tight face crops: drawn at 85% inside the circle (user, 2026-10-28)


def framed(im, scale=FRAMED, bg=(18, 14, 10)):
    """A tight portrait shrunk to `scale` of the icon on a dark backdrop, its square edges faded into it, so the
    round mask doesn't cut the face."""
    from PIL import ImageDraw, ImageFilter
    side = int(SIZE * scale)
    im = im.convert('RGBA').resize((side, side), Image.LANCZOS)
    fade = max(2, side // 10)
    mask = Image.new('L', (side, side), 0)
    ImageDraw.Draw(mask).rectangle((fade, fade, side - fade, side - fade), fill=255)
    mask = mask.filter(ImageFilter.GaussianBlur(fade / 1.6))
    out = Image.new('RGBA', (SIZE, SIZE), bg + (255,))
    out.paste(im, ((SIZE - side) // 2, (SIZE - side) // 2 + int(SIZE * 0.03)), mask)
    return out


def crest(path):
    """A faction logo (its opaque part, 82% of the width) centred on a dark disc, SIZE square."""
    from lib.wardrobe.blp import read_blp
    logo = read_blp(path).convert('RGBA')
    logo = logo.crop(logo.getchannel('A').point(lambda a: 255 if a > 24 else 0).getbbox())
    side = int(SIZE * 0.82)
    logo.thumbnail((side, side), Image.LANCZOS)
    im = Image.new('RGBA', (SIZE, SIZE), (18, 14, 10, 255))
    im.alpha_composite(logo, ((SIZE - logo.width) // 2, (SIZE - logo.height) // 2))
    return im


def atlas_members():
    want = {f'raceicon128-{race}-{sex}' for race, _ in ICONS.values() for sex in ('male', 'female')}	# eredar: none
    return {r['CommittedName']: tuple(int(r[k]) for k in ('CommittedLeft', 'CommittedTop', 'CommittedRight', 'CommittedBottom'))
            for r in retail._csv('UiTextureAtlasMember') if r['UiTextureAtlasID'] == '897' and r['CommittedName'] in want}


# shift -> (source skin hue range in degrees, minimum saturation, target hue, saturation x, value x)
SHIFTS = {'red': ((40, 140), 0.25, 4, 1.1, 0.95),          # green orc -> fel red
          'grey': ((40, 140), 0.25, 220, 0.12, 0.7),      # green orc -> Blackrock grey
          'eredar': ((190, 290), 0.2, 355, 1.0, 0.85),    # blue / violet draenei -> eredar red
          'leper': ((12, 45), 0.2, 80, 0.8, 0.85),         # gnome skin -> leper green
          'dusk': ((12, 45), 0.2, 290, 0.3, 0.8)}          # gnome skin -> the pale violet of the dark gnomes


def shift_skin(im, shift):
    """Skin pixels in the shift's hue range recoloured to its target hue; eyes and hair stay."""
    (lo, hi), smin, hue, sx, vx = SHIFTS[shift]
    a = np.asarray(im).astype(float) / 255
    out = a.copy()
    for y in range(a.shape[0]):
        for x in range(a.shape[1]):
            h, s, v = colorsys.rgb_to_hsv(*a[y, x, :3])
            if lo <= h * 360 <= hi and s > smin:
                out[y, x, :3] = colorsys.hsv_to_rgb(hue / 360, min(1, s * sx), v * vx)
    return Image.fromarray((out * 255).astype(np.uint8), 'RGBA')


def round_mask(im):
    yy, xx = np.mgrid[:SIZE, :SIZE]
    r = SIZE / 2
    d = np.sqrt((xx + 0.5 - r) ** 2 + (yy + 0.5 - r) ** 2)
    mask = np.clip(r - d, 0, 1)                      # 1 px soft edge
    a = np.asarray(im).copy()
    a[..., 3] = (a[..., 3] * mask).astype(np.uint8)
    return Image.fromarray(a, 'RGBA')


def ring(width, glow, rgb):
    """A ring on the portrait's edge: `width` px of solid colour, then `glow` px fading inwards."""
    yy, xx = np.mgrid[:SIZE, :SIZE]
    r = SIZE / 2
    d = r - np.sqrt((xx + 0.5 - r) ** 2 + (yy + 0.5 - r) ** 2)     # px inside the edge
    fade = np.clip(1 - (d - width) / glow, 0, 1) * 0.6 if glow else 0
    alpha = np.where(d < 0, 0, np.where(d <= width, 1, fade))
    a = np.zeros((SIZE, SIZE, 4), np.uint8)
    a[..., :3] = rgb
    a[..., 3] = (alpha * 255).astype(np.uint8)
    return Image.fromarray(a, 'RGBA')


def write_blp_rgba(path, im):
    """BLP2, encoding 1 (256-colour palette) with 8-bit alpha, full mip chain: per mip the palette indices,
    then one alpha byte per pixel."""
    rgb = im.convert('RGB')
    q = rgb.quantize(256, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE)
    pal = (q.getpalette()[:768] + [0] * 768)[:768]
    mips, cur, cq = [], im, q
    while True:
        alpha = np.asarray(cur)[..., 3]
        mips.append(cq.tobytes() + alpha.tobytes())
        if cur.width == 1 or cur.height == 1:
            break
        cur = cur.resize((cur.width // 2, cur.height // 2), Image.BOX)
        cq = cur.convert('RGB').quantize(palette=q, dither=Image.Dither.NONE)
    offs, sizes, o = [0] * 16, [0] * 16, 1172
    for i, m in enumerate(mips):
        offs[i], sizes[i] = o, len(m)
        o += len(m)
    palette = b''.join(bytes((pal[k * 3 + 2], pal[k * 3 + 1], pal[k * 3], 0)) for k in range(256))
    head = b'BLP2' + struct.pack('<I4B2I', 1, 1, 8, 8, 1, im.width, im.height)   # as stock palettized UI art
    head += struct.pack('<16I', *offs) + struct.pack('<16I', *sizes) + palette
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(head + b''.join(mips))


def main():
    atlas = Image.open(io.BytesIO(retail.fetch(ATLAS_FDID))).convert('RGBA')
    members = atlas_members()
    for name, (race, shift) in ICONS.items():
        for sex in ('male', 'female'):
            own = pack_portrait(name.lower(), sex, own=True)	# a portrait made for this sub-race itself
            im = own or pack_portrait(race, sex) or atlas.crop(members[f'raceicon128-{race}-{sex}'])
            if own and (name.lower(), sex) not in UNFRAMED:
                im = framed(im)
            else:
                im = im.resize((SIZE, SIZE), Image.LANCZOS)
            if own:
                pass
            elif shift == 'tattoo':
                im = tattoo(im)
            elif shift:
                im = shift_skin(im, shift)
            dst = OUT / f'UI-CharacterCreate-SubRace-{name}_{sex.upper()}.blp'
            write_blp_rgba(dst, round_mask(im))
            print(dst.relative_to(CRAFT))
    for faction, logo in CRESTS.items():
        dst = OUT / f'UI-CharacterCreate-SubRace-CREST_{faction}.blp'
        write_blp_rgba(dst, round_mask(crest(OUT.parent / 'CHARACTERCREATE' / f'{logo}.blp')))
        print(dst.relative_to(CRAFT))
    k = SIZE // 64		# the rings were drawn for 64 px; keep their on-screen thickness
    for name, im in (('Ring', ring(2 * k, 0, (150, 120, 60))), ('RingChecked', ring(3 * k, 8 * k, (255, 210, 80)))):
        dst = OUT / f'UI-CharacterCreate-SubRace-{name}.blp'
        write_blp_rgba(dst, im)
        print(dst.relative_to(CRAFT))


if __name__ == '__main__':
    main()
