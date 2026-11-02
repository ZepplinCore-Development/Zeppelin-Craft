"""F-230: import the new character customisation colours of Nexus Mods WoW mod 907.

The pack (patch-A.MPQ + DBCs/CharSections.dbc) is built on the same HD character textures
we ship (every colour-0 skin is pixel-identical to patch-hd-everything), so its new colours
fit our models as they are. Only CharSections keys we do not have are taken (race 1-11, not
goblin); colours we already offer, the pack's 15k BakedNPCTextures and its overrides of
existing files are left alone.

Per referenced texture:
  in our client already, same bytes   -> row uses it, nothing shipped
  in our client already, other bytes  -> shipped renamed <stem>_z907.blp (never over a client path)
  only in the pack                    -> shipped at the pack's path
  in neither                          -> row dropped (the pack names 483 files it never shipped)

Then every offered colour (ours and the pack's) gets a row for every face type / hair style its
race/sex offers. A missing face, or one of our F-230B / I-398 rows that only repeats another face,
gets that face from the nearest skin tone colour-shifted to the colour (generate()). The pack's
re-indexed copies of the stock DK skins are dropped as duplicates.

Writes zpaks/zep-skin-expansion/dbc/[AUTO,F-230]_charsections.sql (ids from ID_BASE) and the
textures under zpaks/zep-skin-expansion/mpq/source-assets/, then prints the completeness check
(every new colour needs skin, underwear and a face for each face type of its class groups).

  python3 "Scripts/Character Skins/mod907_import.py" <extracted patch-A dir> <pack CharSections.dbc>
"""
import collections
import importlib.util
import os
import re
import shutil
import struct
import sys
from pathlib import Path

import numpy as np
from PIL import Image

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS  # noqa: E402
from lib.wardrobe.compositor import FileResolver  # noqa: E402
from cli.lib.blp_image import decode_blp_rgb  # noqa: E402

_spec = importlib.util.spec_from_file_location('gfx', Path(__file__).with_name('gnome_female_extra_skins.py'))
gfx = importlib.util.module_from_spec(_spec)
_spec.loader.exec_module(gfx)

ZPAK = CRAFT / 'zpaks' / 'zep-skin-expansion'
ASSETS = ZPAK / 'mpq' / 'source-assets'
SQL = ZPAK / 'dbc' / '[AUTO,F-230]_charsections.sql'
OURS = Path('/workspace/project/data/dbc/CharSections.dbc')
ID_BASE = 30000
RACES = {1, 2, 3, 4, 5, 6, 7, 8, 10, 11}
COLS = ('id', 'race', 'gender', 'base', 't1', 't2', 't3', 'flags', 'type', 'color')


def load_dbc(path):
    b = Path(path).read_bytes()
    n, _fc, rs, _ss = struct.unpack('<4I', b[4:20])
    st = b[20 + n * rs:]

    def s(o):
        return st[o:st.index(b'\0', o)].decode('latin1')
    rows = []
    for i in range(n):
        f = struct.unpack_from('<10I', b, 20 + i * rs)
        rows.append(dict(zip(COLS, (f[0], f[1], f[2], f[3], s(f[4]), s(f[5]), s(f[6]), f[7], f[8], f[9]))))
    return rows


def key(r):
    return r['race'], r['gender'], r['base'], r['type'], r['color']


def main(pack_dir, pack_dbc):
    pack_dir = Path(pack_dir)
    pack_files = {}
    for dp, _, fns in os.walk(pack_dir):
        for fn in fns:
            rel = os.path.relpath(os.path.join(dp, fn), pack_dir).replace('/', '\\')
            pack_files[rel.lower()] = os.path.join(dp, fn)
    client = FileResolver([r for r in EXTERNAL_ROOTS if Path(r).resolve() != ASSETS.resolve()])

    our_rows = load_dbc(OURS)
    ours = {key(r) for r in our_rows}
    new = [r for r in load_dbc(pack_dbc) if r['race'] in RACES and key(r) not in ours]
    # the pack re-indexes the stock DK skins (_09/_10/_11) as its last colours: a "new" colour whose body
    # texture one of our colours already uses is a duplicate, drop it whole (body, faces, underwear)
    our_bodies = {(r['race'], r['gender'], r['t1'].lower()) for r in our_rows if r['base'] == 0}
    dup = {(r['race'], r['gender'], r['color']) for r in new
           if r['base'] == 0 and (r['race'], r['gender'], r['t1'].lower()) in our_bodies}
    new = [r for r in new if not (r['base'] in (0, 1, 4) and (r['race'], r['gender'], r['color']) in dup)]

    if ASSETS.exists():
        # our previous output; retail_worgoblin_colours.py's _zr<colour> files are its own
        for f in ASSETS.rglob('*'):
            if f.is_file() and not re.search(r'_zr\d+\.blp$', f.name, re.I):
                f.unlink()
    route, stats = {}, collections.Counter()

    def resolve(path):
        """Client path the row should name, or None when no file exists anywhere."""
        if not path:
            return ''
        lk = path.lower()
        if lk in route:
            return route[lk]
        src, have = pack_files.get(lk), client.find(path)
        if src is None:
            out = path if have else None
            stats['reused (pack lacks)' if have else 'missing'] += 1
        elif have and Path(have).read_bytes() == Path(src).read_bytes():
            out = path
            stats['identical to ours'] += 1
        else:
            out = path if not have else path[:-4] + '_z907.blp'
            stats['shipped renamed' if have else 'shipped'] += 1
            dst = ASSETS / out.replace('\\', '/')
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(src, dst)
        route[lk] = out
        return out

    kept, dropped = [], collections.Counter()
    for r in sorted(new, key=lambda r: (r['race'], r['gender'], r['base'], r['color'], r['type'])):
        t = [resolve(r[c]) for c in ('t1', 't2', 't3')]
        if None in t:
            dropped[r['base']] += 1
            continue
        kept.append(dict(r, t1=t[0], t2=t[1], t3=t[2], id=ID_BASE + len(kept)))

    kept, by = fill(our_rows, kept, dup)
    kept = generate(kept, by, FileResolver([ASSETS] + client.roots))
    for i, r in enumerate(kept):
        r['id'] = ID_BASE + i

    q = lambda s: "'" + s.replace('\\', '\\\\').replace("'", "''") + "'"
    lines = ['-- F-230 Expanded Character Skin Options: new CharSections keys from Nexus Mods WoW mod 907.',
             '-- GENERATED by Scripts/Character Skins/mod907_import.py - do not edit, re-run the script.',
             f'DELETE FROM charsections WHERE id BETWEEN {ID_BASE} AND {ID_BASE + 49999};']
    for i in range(0, len(kept), 500):
        lines.append('INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, '
                     'flags, type, color_index) VALUES')
        lines.append(',\n'.join(f"({r['id']}, {r['race']}, {r['gender']}, {r['base']}, {q(r['t1'])}, {q(r['t2'])}, "
                                f"{q(r['t3'])}, {r['flags']}, {r['type']}, {r['color']})" for r in kept[i:i + 500]) + ';')
    SQL.write_text('\n'.join(lines) + '\n')

    facial_styles(kept, Path(pack_dbc).with_name('CharacterFacialHairStyles.dbc'))
    print(f'duplicate colours dropped: {len(dup)}; hair rows repeated: {sum(1 for r in kept if r.get("filled"))}; '
          f'face rows generated: {sum(1 for r in kept if r.get("gen"))}')
    print(f'pack rows new to us: {len(new)}; kept {len(kept)}; dropped {sum(dropped.values())} by section {dict(dropped)}')
    print('textures:', dict(stats))
    print(f'-> {SQL.relative_to(CRAFT)}  ids {ID_BASE}-{ID_BASE + len(kept) - 1}')
    check(kept)


PLACEHOLDER_IDS = range(25001, 30000)   # F-230B / I-398 rows that repeat another face's texture
FACE_NUM = re.compile(r'face(?:lower|upper)(\d+)_', re.I)


def face_num(path):
    m = FACE_NUM.search(path.rsplit('\\', 1)[-1])
    return int(m.group(1)) if m else None


def fill(our_rows, kept, dup):
    """Give every offered colour a row for every variation its race/sex offers. The client skips a colour
    whose row for the current face / style is missing (I-398), and the pack's new face types 18+ exist
    only for its own colours. A missing face, and a custom face row that only repeats another face's
    texture (F-230B / I-398 placeholders, overridden by a higher id, F-225), is marked for generation:
    the real face of that type from the nearest skin tone, colour-shifted (generate()). Missing hair /
    facial hair rows repeat the colour's nearest style. Skin colours without underwear are dropped."""
    rows = our_rows + kept
    by = collections.defaultdict(list)
    for r in rows:
        by[(r['race'], r['gender'], r['base'])].append(r)
    out = list(kept)
    drop = set()
    for (race, g, base), rs in sorted(by.items()):
        if race not in RACES or base not in (1, 2, 3):
            continue
        if base == 1:
            colours = {r['color'] for r in by[(race, g, 0)] if r['flags'] & 1}
            under = {r['color'] for r in by[(race, g, 4)]}
            drop |= {(race, g, c) for c in colours - under}
            colours &= under
            rs = [r for r in rs if r['flags'] & 1]
        else:
            colours = {r['color'] for r in by[(race, g, 3)]}
        # the variations offered and the flags they carry (colour 0's, else the most common)
        votes = collections.defaultdict(collections.Counter)
        for r in rs:
            votes[r['type']][r['flags']] += 100 if r['color'] == 0 else 1
        slots = {t: v.most_common(1)[0][0] for t, v in votes.items()}
        have = {}
        for r in sorted(rs, key=lambda r: r['id']):
            have[(r['color'], r['type'])] = r          # highest id wins, as in the client
        for c in sorted(colours):
            if (race, g, c) in drop:
                continue
            for t, flags in sorted(slots.items()):
                r = have.get((c, t))
                if r is not None:
                    if r['id'] >= ID_BASE and r['flags'] != flags:
                        r['flags'] = flags                 # a pack row in the other class group
                    if not (base == 1 and r['id'] in PLACEHOLDER_IDS and face_num(r['t1']) != t):
                        continue
                if base == 1:
                    row = dict(race=race, gender=g, base=1, type=t, color=c, flags=flags, t1='', t2='', t3='', gen=True,
                               override=r is not None)
                else:
                    donors = [d for (cc, _), d in have.items() if cc == c]
                    if not donors:
                        continue
                    d = min(donors, key=lambda d: (abs(d['type'] - t), d['type']))
                    row = dict(d, type=t, flags=flags, filled=True)
                row['id'] = -1
                out.append(row)
                have[(c, t)] = row
    out = [r for r in out if (r['race'], r['gender'], r['color']) not in drop or r['base'] in (2, 3)]
    if drop:
        print('colours dropped for missing underwear:', sorted(drop))
    return out, by


def generate(out, by, files):
    """Textures for the rows fill() marked gen: for face type t at colour c, take the real face of type t
    (its file is that face, not a repeat) from the colour whose body is nearest in tone, fit a quadratic
    RGB map from that colour's body atlas to c's (face block excluded) and run the face through it.
    Only skin-like pixels are recoloured, so eyes, DK glow, teeth and paint stay as painted (F-230G)."""
    feats, write_blp = gfx.feats, gfx.write_blp
    img_cache, fit_cache, dist_cache, made = {}, {}, {}, collections.Counter()

    def img(path):
        f = files.find(path)
        return decode_blp_rgb(f).astype(float) if f else None

    def body(race, g, c):
        # bodies are cached (uint8: every face of a race/sex fits against them), faces are not
        rs = [r for r in by[(race, g, 0)] if r['color'] == c and r['type'] == 0]
        if not rs:
            return None
        path = max(rs, key=lambda r: r['id'])['t1']
        if path not in img_cache:
            im = img(path)
            img_cache[path] = None if im is None else im.astype(np.uint8)
        im = img_cache[path]
        return None if im is None else im.astype(float)

    def mask(shape):
        m = np.ones(shape[:2], bool)
        m[shape[0] * 5 // 8:, :shape[1] // 2] = False
        return m

    def fit(race, g, src, dst):
        k = (race, g, src, dst)
        if k not in fit_cache:
            a, b = body(race, g, src), body(race, g, dst)
            if a is None or b is None:
                fit_cache[k] = None
            else:
                if b.shape != a.shape:
                    b = np.asarray(Image.fromarray(b.astype(np.uint8)).resize(a.shape[1::-1], Image.LANCZOS)).astype(float)
                m = mask(a.shape)
                w, *_ = np.linalg.lstsq(feats(a[m]), b[m], rcond=None)
                if (race, g, src) not in dist_cache:
                    px = a[m]
                    grid = np.zeros((64, 64, 64), bool)
                    grid[tuple(np.unique((px // 4).astype(int), axis=0).T)] = True
                    d = np.full(grid.shape, 99, np.uint8)
                    d[grid] = 0
                    cur = grid.copy()
                    for step in range(1, 12):
                        n = cur.copy()
                        for ax in range(3):
                            n |= np.roll(cur, 1, ax)
                            n |= np.roll(cur, -1, ax)
                        d[n & ~cur] = step * 4
                        cur = n
                    dist_cache[(race, g, src)] = d
                d = dist_cache[(race, g, src)]
                fit_cache[k] = (w, d)
        return fit_cache[k]

    tone = {}

    def mean(race, g, c):
        if (race, g, c) not in tone:
            b = body(race, g, c)
            tone[(race, g, c)] = None if b is None else b[mask(b.shape)].mean(0)
        return tone[(race, g, c)]

    for r in out:
        if not r.get('gen'):
            continue
        race, g, t, c = r['race'], r['gender'], r['type'], r['color']
        real = [s for s in by[(race, g, 1)] if s['type'] == t and face_num(s['t1']) == t and not s.get('gen')
                and s['flags'] & 1 and files.find(s['t1']) and mean(race, g, s['color']) is not None]
        target = mean(race, g, c)
        if not real or target is None:
            # no real face of this type anywhere: an override keeps the placeholder it would replace,
            # a missing face repeats the colour's nearest face (F-230B style)
            donors = [s for s in by[(race, g, 1)] if s['color'] == c and s['flags'] & 1 and s['t1'] and not s.get('gen')]
            if r.get('override') or not donors:
                r['gen'] = 'none'
            else:
                d = min(donors, key=lambda s: (abs(s['type'] - t), s['type']))
                r.update(t1=d['t1'], t2=d['t2'], t3=d['t3'], gen='repeat')
                made['repeated'] += 1
            continue
        same = [s for s in real if s['flags'] & 4 == r['flags'] & 4] or real
        src = min(same, key=lambda s: np.abs(mean(race, g, s['color']) - target).sum())
        w, d = fit(race, g, src['color'], c)
        for col in ('t1', 't2'):
            if not src[col]:
                continue
            im = img(src[col])
            b = (im // 4).astype(int).clip(0, 63)
            keep = np.clip(1 - (d[b[..., 0], b[..., 1], b[..., 2]].astype(float) - 12) / 24, 0, 1)[..., None]
            res = keep * np.clip(feats(im) @ w, 0, 255) + (1 - keep) * im
            name = re.sub(r'(face(?:lower|upper)\d+)_.*\.blp$', lambda m: f'{m.group(1)}_z{c}.blp', src[col], flags=re.I)
            dst = ASSETS / name.replace('\\', '/')
            dst.parent.mkdir(parents=True, exist_ok=True)
            write_blp(str(dst), res)
            r[col] = name
            made['files'] += 1
        r['src'] = src['color']
        made['rows'] += 1
    print('generated faces:', dict(made), '| no source:', sum(1 for r in out if r.get('gen') == 'none'))
    return [r for r in out if r.get('gen') != 'none']


def facial_styles(kept, pack_cfhs):
    """CharacterFacialHairStyles must list every facial hair / markings variation CharSections offers, or
    the client's cycle runs past the table and sticks (I-419: night elf female markings 9-18). Missing
    variations take the pack's rows."""
    def rows(path):
        b = Path(path).read_bytes()
        n, fc, rs, _ss = struct.unpack('<4I', b[4:20])
        return {f[:3]: f[3:] for f in (struct.unpack_from('<%dI' % fc, b, 20 + i * rs) for i in range(n))}
    ours, pack = rows(OURS.with_name('CharacterFacialHairStyles.dbc')), rows(pack_cfhs)
    want = {(r['race'], r['gender'], r['type']) for r in kept if r['base'] == 2}
    add = sorted(k for k in want if k not in ours and k in pack)
    lines = ['-- F-230: facial hair / markings variations the F-230 CharSections rows add, and their barbershop rows (from mod 907).',
             '-- GENERATED by Scripts/Character Skins/mod907_import.py - do not edit, re-run the script.']
    for k in add:
        lines.append(f'DELETE FROM characterfacialhairstyles WHERE race = {k[0]} AND gender = {k[1]} AND variation_id = {k[2]};')
        lines.append('INSERT INTO characterfacialhairstyles (race, gender, variation_id, geoset_1, geoset_2, geoset_3, '
                     f'geoset_4, geoset_5) VALUES ({k[0]}, {k[1]}, {k[2]}, ' + ', '.join(map(str, pack[k])) + ');')
    # the barbershop lists facial hair separately (BarberShopStyle type 2, data = variation): same rows
    import subprocess
    b = Path(pack_cfhs).with_name('BarberShopStyle.dbc').read_bytes()
    n, fc, rs, ss = struct.unpack('<4I', b[4:20])
    st = b[20 + n * rs:]
    taken = {int(x) for x in subprocess.run(
        [sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', 'SELECT id FROM barbershopstyle'],
        cwd=CRAFT, capture_output=True, text=True).stdout.split() if x.isdigit()}
    nid = max(taken) + 1
    for i in range(n):
        f = struct.unpack_from('<%dI' % fc, b, 20 + i * rs)
        bid, typ, name, desc, cost = f[0], f[1], f[2], f[19], struct.unpack_from('<f', b, 20 + i * rs + 36 * 4)[0]
        race, g, data = f[37], f[38], f[39]
        if typ != 2 or (race, g, data) not in add:
            continue
        s_ = lambda o: st[o:st.index(b'\0', o)].decode('latin1').replace("'", "''")
        rid = bid if bid not in taken else nid
        nid += rid == nid
        taken.add(rid)
        lines.append(f'DELETE FROM barbershopstyle WHERE type = 2 AND race = {race} AND gender = {g} AND data = {data};')
        lines.append(f"INSERT INTO barbershopstyle (id, type, display_name_enus, description_enus, cost_modifier, race, "
                     f"gender, data) VALUES ({rid}, 2, '{s_(name)}', '{s_(desc)}', {cost:g}, {race}, {g}, {data});")
    (ZPAK / 'dbc' / '[AUTO,F-230]_characterfacialhairstyles.sql').write_text('\n'.join(lines) + '\n')
    missing = sorted(k for k in want if k not in ours and k not in pack)
    print(f'facial hair styles added: {len(add)} {sorted({k[:2] for k in add})}; still missing: {missing[:10]}')


def check(kept):
    """Every new playable colour: skin, underwear and a face per face type of each class group."""
    allrows = load_dbc(OURS) + kept
    by = collections.defaultdict(list)
    for r in allrows:
        by[(r['race'], r['gender'], r['base'])].append(r)
    gaps = 0
    for r in kept:
        if r['base'] != 0 or not r['flags'] & 1:
            continue
        rg = (r['race'], r['gender'])
        faces = by[rg + (1,)]
        want = {f['type'] for f in faces if f['flags'] & 1}
        have = {f['type'] for f in faces if f['color'] == r['color'] and f['flags'] & 1}
        under = any(u['color'] == r['color'] for u in by[rg + (4,)])
        miss = sorted(want - have)
        if miss or not under:
            gaps += 1
            print(f'  gap race {r["race"]} g {r["gender"]} colour {r["color"]}: faces missing {miss[:6]}'
                  f'{"..." if len(miss) > 6 else ""} underwear {"ok" if under else "MISSING"}')
    print(f'completeness: {gaps} colour(s) with gaps')


if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
