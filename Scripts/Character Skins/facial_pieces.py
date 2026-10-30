"""F-230: cut painted facial hair into per-choice pieces (CharSections base_section 10).

A race's facial-hair texture (CharSections base_section 2, keyed by hair colour) paints a whole look at once:
beard, moustache, sideburns and eyebrows together. Once that look is split into geoset slots (facial_split.py), the
paint has to travel with the slot choice that shows it, or a beardless face keeps the painted beard. This script
cuts each source texture into parts by connected component and writes one "piece" per slot choice:

  CharSections base_section 10, type = piece, color_index = hair colour, texture_1 = FaceLower, texture_2 = FaceUpper
  ids 107000-107999, zpaks/zep-skin-expansion/dbc/[F-230]_charsections_facial_pieces.sql
  textures Character\\<Folder>\\<Sex>\\<Folder><Sex>FacialPiece<NN>{Lower,Upper}_<CC>.blp (zep-skin-expansion)

facial_split.py names the piece of each choice (`tex=<piece>` in Zeppelin\\CharCustomizations.txt, table PIECE_OF).
The source client draws the pieces of a player's set slots instead of the legacy facial texture; NPCs keep it.

Parts (classified per component of the paint, on the FaceUpper + FaceLower block, 256 x 192, upper on top):
  brows      centroid above y 84, between x 48 and 208 (the eyebrows straddle the upper / lower seam)
  sides      centroid left of x 72 or right of x 184 (sideburns, cheek patches)
  moustache  the rest, centroid above y 150 (mouth ring, moustache tips)
  chin       the rest (goatee, chin beard)
A piece is a source type and a set of parts; `nobrows` = every part but the brows.

Piece numbers are storage keys of the data file: append, never renumber.

  python3 "Scripts/Character Skins/facial_pieces.py" [--sheet out.png] [--check]
"""
import argparse
import importlib.util
import sys
from pathlib import Path

import numpy as np
from PIL import Image, ImageDraw
from scipy import ndimage

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
PARSED = ZPAK / 'mpq' / 'parsed-assets'
SQL = ZPAK / 'dbc' / '[F-230]_charsections_facial_pieces.sql'
ID_BASE, ID_END = 107000, 107999
FOLDERS = {4: 'NightElf'}
SEXES = ['Male', 'Female']
PARTS = ('brows', 'sides', 'moustache', 'chin')

# (race, sex) -> piece -> (source facial-hair type, parts). Night elf male: types 1-5 are the five stock looks
# (1 full beard + moustache ring, 2 chin strap, 3 cheek patches + moustache tips, 4 sideburns + chin, 5 long
# sideburns + goatee), each with its own eyebrows. The HD model's geosets per choice come from the legacy row that
# showed them (facial_split.PIECE_OF); 107 / 207 / 307 have no legacy row and take the nearest look.
PIECES = {
    (4, 0): {
        1: (2, 'nobrows'),      # beard 103 (legacy 2): the chin strap
        2: (5, {'chin'}),       # beard 106 (legacy 5): goatee
        3: (4, {'chin'}),       # beard 107 (no legacy row): the short chin beard of look 4
        4: (1, 'nobrows'),      # painted full beard, no mesh (legacy 1: its beard mesh 102 is not in the HD model)
        5: (3, {'sides'}),      # sideburns 204 (legacy 3): cheek patches
        6: (4, {'sides'}),      # sideburns 205 (legacy 4)
        7: (5, {'sides'}),      # sideburns 207 (no legacy row): the long sideburns of look 5
        8: (1, {'brows'}),      # eyebrows 302..306 (legacy 1..5)
        9: (2, {'brows'}),
        10: (3, {'brows'}),
        11: (4, {'brows'}),
        12: (5, {'brows'}),
        13: (5, {'brows'}),     # eyebrows 307 (no legacy row, the widest mesh): the widest brows (look 5)
        14: (3, {'moustache'}),  # moustache 1604 (cut out of legacy 304): the moustache tips of look 3
    },
}


def _load(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).with_name(f'{name}.py'))
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def esc(s):
    return s.replace('\\', '\\\\').replace("'", "''")


def labels(alpha):
    """part name per pixel of a 192 x 256 alpha block (upper on top); '' where there is no paint"""
    core = alpha > 8
    lab, n = ndimage.label(ndimage.binary_dilation(core, iterations=2))
    out = np.full(alpha.shape, '', dtype=object)
    for k in range(1, n + 1):
        comp = (lab == k) & core
        if comp.sum() < 20:
            continue                        # stray dots (one sits at the top of look 5)
        ys, xs = np.nonzero(comp)
        cy, cx = ys.mean(), xs.mean()
        if cy < 84 and 48 <= cx < 208:
            part = 'brows'
        elif cx < 72 or cx >= 184:
            part = 'sides'
        elif cy < 150:
            part = 'moustache'
        else:
            part = 'chin'
        out[(lab == k) & (alpha > 0)] = part
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__.split('\n')[0])
    ap.add_argument('--sheet', help='write a contact sheet (source | each piece) of hair colour 2 here')
    ap.add_argument('--check', action='store_true', help='cut and compare with the shipped SQL, write nothing')
    a = ap.parse_args()
    files = _load('skin_preview').files_resolver()
    write_blp_rgba = _load('subrace_icons').write_blp_rgba
    q = _dbc_query_fn('live')

    sql = ['-- F-230: facial-hair pieces - the painted part under each split facial-hair choice (CharSections base_section 10,',
           '-- type = piece, color_index = hair colour; Zeppelin\\CharCustomizations.txt "tex=<piece>").',
           '-- GENERATED by Scripts/Character Skins/facial_pieces.py - do not edit, re-run the script.',
           f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_END};',
           'INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, '
           'color_index) VALUES']
    vals, writes, sheet, rid = [], [], [], ID_BASE
    for (race, sex), pieces in PIECES.items():
        top = {}
        for r in q(f'SELECT id, type, color_index, texture_1, texture_2, flags FROM charsections WHERE race = {race} '
                   f'AND gender = {sex} AND base_section = 2 ORDER BY id'):
            top[(int(r['type']), int(r['color_index']))] = r          # highest id wins, as in the client
        colours = sorted({c for (t, c) in top})
        folder, sx = FOLDERS[race], SEXES[sex]
        for colour in colours:
            cut = {}
            for t in sorted({p[0] for p in pieces.values()}):
                r = top.get((t, colour))
                if not r or not r['texture_1']:
                    continue
                lo = read_blp(files.find(r['texture_1'])).convert('RGBA').resize((256, 128), Image.LANCZOS)
                up = (read_blp(files.find(r['texture_2'])).convert('RGBA').resize((256, 64), Image.LANCZOS)
                      if r['texture_2'] and files.find(r['texture_2']) else Image.new('RGBA', (256, 64)))
                block = np.vstack([np.asarray(up), np.asarray(lo)])
                cut[t] = (block, labels(block[..., 3]), int(r['flags']))
            for piece, (t, parts) in pieces.items():
                if t not in cut:
                    continue
                block, lab, flags = cut[t]
                want = set(PARTS) - {'brows'} if parts == 'nobrows' else parts
                keep = np.isin(lab, list(want))
                out = block.copy()
                out[~keep] = 0
                if out[..., 3].max() == 0:
                    continue
                names = []
                for half, y0, y1, kind in (('texture_1', 64, 192, 'Lower'), ('texture_2', 0, 64, 'Upper')):
                    part = out[y0:y1]
                    if part[..., 3].max() == 0:
                        names.append('')
                        continue
                    rel = f'Character\\{folder}\\{sx}\\{folder}{sx}FacialPiece{piece:02d}{kind}_{colour:02d}.blp'
                    writes.append((rel, Image.fromarray(part, 'RGBA')))
                    names.append(rel)
                if rid > ID_END:
                    sys.exit('id range full')
                vals.append(f"({rid}, {race}, {sex}, 10, '{esc(names[0])}', '{esc(names[1])}', '', {flags}, {piece}, {colour})")
                rid += 1
                if colour == 2:
                    sheet.append((piece, Image.fromarray(out, 'RGBA')))
            if colour == 2 and cut:
                for t, (block, _, _) in sorted(cut.items()):
                    sheet.insert(0, (f'src{t}', Image.fromarray(block, 'RGBA')))
    text = '\n'.join(sql) + '\n' + ',\n'.join(vals) + ';\n'
    if a.check:
        same = SQL.exists() and SQL.read_text() == text
        print(f'{SQL.name}: ' + ('up to date' if same else 'DIFFERS') + f' ({len(vals)} rows)')
        sys.exit(0 if same else 1)
    for d in (ASSETS, PARSED):
        for race, sex in PIECES:
            folder, sx = FOLDERS[race], SEXES[sex]
            root = d / 'Character' / folder / sx if d is ASSETS else d / 'CHARACTER' / folder.upper() / sx.upper()
            for f in root.glob(f'{folder}{sx}FacialPiece*' if d is ASSETS else f'{folder.upper()}{sx.upper()}FACIALPIECE*'):
                f.unlink()                  # stale pieces (the parsed copies too)
    for rel, im in writes:
        src = ASSETS / rel.replace('\\', '/')
        write_blp_rgba(src, im)
        dst = PARSED / rel.replace('\\', '/').upper()
        dst.parent.mkdir(parents=True, exist_ok=True)
        dst.write_bytes(src.read_bytes())
    SQL.write_text(text)
    print(f'wrote {SQL} ({len(vals)} rows, {len(writes)} textures)')
    if a.sheet and sheet:
        cell_w, cell_h = 256, 192
        cols = 6
        S = Image.new('RGBA', (cell_w * cols, (cell_h + 14) * ((len(sheet) + cols - 1) // cols)), (60, 60, 60, 255))
        d = ImageDraw.Draw(S)
        for i, (name, im) in enumerate(sheet):
            x, y = (i % cols) * cell_w, (i // cols) * (cell_h + 14)
            bg = Image.new('RGBA', im.size, (235, 225, 225, 255))
            bg.alpha_composite(im)
            S.paste(bg, (x, y + 14))
            d.text((x + 3, y + 1), str(name), fill=(255, 255, 0, 255))
        S.save(a.sheet)
        print('wrote', a.sheet)


if __name__ == '__main__':
    main()
