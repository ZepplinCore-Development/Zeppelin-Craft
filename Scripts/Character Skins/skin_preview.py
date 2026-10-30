"""F-151: preview skin colours on the 3D character model in the F-216 viewer, outside the game client.

Bakes each colour's character texture from the live DBC (skin, face, scalp, the full-atlas layers 6-8, underwear),
points the race's viewer body pane at it (texture slot 1 = the baked skin, slot 8 = the colour's _Extra) and takes
a front face close-up and a three-quarter body shot of each in headless Chrome. Writes one labelled contact sheet.

The viewer is not the client: no eye glow, the hair texture and mesh are the pane's own, and layers are pasted
over the whole atlas at once (the client pastes them section by section). Check a sheet before testing in game.

  python3 "Scripts/Character Skins/skin_preview.py" --race 11 --sex 0 --colours 33,34,35|all [--face 0]
      [--layers FACE,BODY,SCARS] [--out sheet.png]

--layers: the layer values (CharSections base_section 6 face markings, 7 body markings, 8 scars since the F-230
regroup; 0 = none), e.g. --layers 3,0,0. markings_regroup.json `values` names them.
"""
import argparse
import atexit
import functools
import http.server
import json
import os
import socketserver
import struct
import subprocess
import sys
import shutil
import tempfile
import threading
import urllib.parse
from pathlib import Path

from PIL import Image, ImageDraw

CRAFT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(CRAFT / 'cli'))
sys.path.insert(0, str(CRAFT))
from commands.wardrobe import EXTERNAL_ROOTS, _dbc_query_fn  # noqa: E402
from lib.wardrobe.blp import read_blp  # noqa: E402
from lib.wardrobe.compositor import REGIONS, SCALE, FileResolver  # noqa: E402
from lib.wardrobe.eye_islands import island  # noqa: E402
import numpy as np  # noqa: E402

VIEWER = CRAFT.parent / 'nginx' / 'wow' / 'modelviewer'
ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets'
COMMUNITY = [CRAFT.parent / 'Zeppelin-Tools' / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
             for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]   # the HD character pack's sources
CODES = {2: 'or', 3: 'dw', 10: 'be', 11: 'dr', 1: 'hu', 4: 'ni', 5: 'sc', 6: 'ta', 7: 'gn', 8: 'tr', 9: 'go', 12: 'wo'}
UNBAKED_FDID = 999990001                         # a FileDataID no file has: the override is the only source
FOLDERS = {1: 'Human', 2: 'Orc', 3: 'Dwarf', 4: 'NightElf', 5: 'Scourge', 6: 'Tauren', 7: 'Gnome', 8: 'Troll',
           9: 'Goblin', 10: 'BloodElf', 11: 'Draenei', 12: 'Worgen'}
PUPPETEER = '/opt/claude-tools/lib/node_modules/puppeteer'
CHROME = Path.home() / '.cache' / 'puppeteer' / 'chrome' / 'linux-144.0.7559.96' / 'chrome-linux64' / 'chrome'
PAGE_JS = """const puppeteer = require(%s);
const launch = () => puppeteer.launch({ headless: 'new', executablePath: %s,
  args: ['--use-angle=swiftshader', '--enable-unsafe-swiftshader', '--no-sandbox'] });
async function openPage(b) {
  const p = await b.newPage();
  await p.setViewport({ width: 900, height: 1200 });
  // a fixed engine clock: 1/60 s a frame for the first 90 frames, then no time at all, so every shot holds the same
  // pose 1.5 s into the idle animation (its first frame leans the head forward). A running animation keeps a body
  // shot from ever settling
  await p.evaluateOnNewDocument(() => {
    const raf = window.requestAnimationFrame.bind(window);
    window.__frames = 0;
    window.requestAnimationFrame = (f) => raf(() => f(Math.min(window.__frames++, 90) * 1000 / 60));
  });
  return p;
}
// a shot is taken once the picture has settled, not after a fixed wait: pane.html is started (`ready`), nothing it
// fetched is still loading (`pending`), the clock has stopped (90 frames) and a quarter-size probe of the frame (its
// PNG size) is over `floor` and within 1 %% of the last for 0.5 s. pending alone hits 0 before the model's own files
// are asked for; a full-size screenshot per probe was most of a shot's time
const probe = (p) => p.screenshot({ clip: { x: 0, y: 0, width: p.viewport().width, height: p.viewport().height, scale: 0.25 } });
async function settledShot(p, out, floor) {
  const t0 = Date.now();
  let last = 0, still = 0;
  while (Date.now() - t0 < 40000) {
    await new Promise(r => setTimeout(r, 125));
    if (!(await p.evaluate('typeof ready !== "undefined" && ready && pending === 0 && window.__frames > 90').catch(() => false))) { still = 0; continue; }
    const n = (await probe(p)).length;
    still = n > floor && Math.abs(n - last) < 0.01 * n ? still + 1 : 0;
    last = n;
    if (still >= 4) break;
  }
  if (process.env.SHOT_TRACE) console.error(`${out} ${Date.now() - t0} ms -> ${last}`);
  if (still < 4) console.error(`not settled after 40 s: ${out}`);
  await p.screenshot({ path: out });
}
"""
SHOT_JS = PAGE_JS + """(async () => {
  const [,, port, ...jobs] = process.argv;
  const b = await launch();
  try {
    const p = await openPage(b);
    for (const j of jobs) {
      const k = j.indexOf('='), out = j.slice(0, k), q = j.slice(k + 1);
      await p.goto(`http://localhost:${port}/pane.html?` + q, { waitUntil: 'load' });
      await settledShot(p, out, 1.3 * (await probe(p)).length);
    }
  } finally { await b.close(); }
})();
"""
# a strip: one page per camera loads the model once, then each colour only repoints the skin slots (1 = bake, 8 =
# _Extra) at that colour's files, under texture ids of its own so the engine loads them fresh, and is shot. The
# model load is most of a shot's time, so this is one load per race, sex and camera instead of one per picture
STRIP_JS = PAGE_JS + """(async () => {
  const [,, port, spec] = process.argv;
  const { pages, colours, tex } = JSON.parse(require('fs').readFileSync(spec, 'utf8'));
  // a browser per camera: a background tab gets no animation frames, so two pages of one browser never both settle
  const browsers = [];
  try {
    for (const _ of pages) browsers.push(await launch());
    await Promise.all(pages.map(async ({ query, suffix }, n) => {
      const p = await openPage(browsers[n]);
      await p.goto(`http://localhost:${port}/pane.html?` + query, { waitUntil: 'load' });
      const floor = 1.3 * (await probe(p)).length;
      for (const [i, c] of colours.entries()) {
        // the page opens wearing the first colour (its query's overrides): only the later ones are swapped in, once
        // the first shot has seen the page's file map loaded
        if (i) await p.evaluate((c, tex) => {
          const slots = new Int32Array(27);
          for (const [k, v] of Object.entries(tex)) slots[+k] = v;
          slots[1] = c.bake_id; FILEMAP['fdid/' + c.bake_id] = c.bake;
          if (c.extra) { slots[8] = c.extra_id; FILEMAP['fdid/' + c.extra_id] = c.extra; }
          const buf = Module._malloc(slots.length * 4);
          Module.HEAP32.set(slots, buf >> 2);
          Module._setTextures(buf, slots.length);
          Module._free(buf);
        }, c, tex);
        await settledShot(p, c.out + suffix, floor);
      }
    }));
  } finally { await Promise.all(browsers.map(b => b.close().catch(() => {}))); }
})();
"""


def blp_bgra(im, path):
    """Uncompressed BLP2 (encoding 3, 8-bit alpha): what the viewer's blp.js reads for a baked texture."""
    im = im.convert('RGBA')
    w, h = im.size
    head = 148 + 1024
    b = bytearray(head + w * h * 4)
    b[0:4] = b'BLP2'
    struct.pack_into('<I', b, 4, 1)
    b[8:12] = bytes([3, 8, 8, 0])
    struct.pack_into('<3I', b, 12, w, h, head)
    struct.pack_into('<I', b, 84, w * h * 4)
    r, g, bl, a = im.split()
    b[head:] = Image.merge('RGBA', (bl, g, r, a)).tobytes()
    path.write_bytes(bytes(b))


def bake(files, query, race, sex, colour, face, layers, face_imgs=None, mask=False):
    """The colour's character texture. face_imgs = {'texture_1': lower, 'texture_2': upper} replaces the face;
    mask = the face boxes magenta and everything else cyan (the eye island yellow), to tell in a render which
    pixels are face and which are body (seam_check)."""
    def row(section, kind, col):
        rows = query(f'SELECT texture_1, texture_2, texture_3 FROM charsections WHERE race = {race} AND gender = {sex} '
                     f'AND base_section = {section} AND type = {kind} AND color_index = {col} ORDER BY id DESC LIMIT 1')
        return rows[0] if rows else None

    def load(path):
        f = files.find(path) if path else None
        return read_blp(f) if f else None              # Pillow misreads palettized BLP2 (ours are)

    def blit(canvas, im, region):
        x, y, w, h = [v * SCALE for v in REGIONS[region]]
        canvas.alpha_composite(im.resize((w, h), Image.LANCZOS), (x, y))

    skin = row(0, 0, colour)
    if not skin:
        raise SystemExit(f'colour {colour}: no skin row')
    canvas = load(skin['texture_1']).resize((512, 512), Image.LANCZOS)
    fr = row(1, face, colour) or next((row(1, f, colour) for f in range(32) if row(1, f, colour)), None)
    if mask:
        canvas = Image.new('RGBA', (512, 512), (0, 255, 255, 255))
        eye = Image.fromarray(((island(race, sex)) * 255).astype(np.uint8))
        for region, (y0, h) in (('FaceUpper', (0, 64)), ('FaceLower', (64, 128))):
            x, y, w, hh = [v * SCALE for v in REGIONS[region]]
            canvas.paste((255, 0, 255, 255), (x, y, x + w, y + hh))
            e = eye.crop((0, y0, 256, y0 + h)).resize((w, hh), Image.NEAREST)
            canvas.paste((255, 255, 0, 255), (x, y), e)
        return canvas, None
    if fr:
        for col, region in (('texture_1', 'FaceLower'), ('texture_2', 'FaceUpper')):
            im = (face_imgs or {}).get(col) or load(fr[col])
            if im:
                blit(canvas, im, region)
    for section, kind in zip((6, 7, 8), layers):
        lr = row(section, kind, 0) if kind else None
        im = load(lr['texture_1']) if lr else None
        if im:
            canvas.alpha_composite(im.resize((512, 512), Image.LANCZOS))
    ur = row(4, 0, colour)
    if ur:
        for col, region in (('texture_1', 'LegUpper'), ('texture_2', 'TorsoUpper')):
            im = load(ur[col])
            if im:
                blit(canvas, im, region)
    return canvas, load(skin['texture_2'])


def face_crop(front):
    """The head of a front shot: the model's topmost opaque rows (against the pane's flat background)."""
    import numpy as np
    a = np.asarray(front).astype(int)
    bg = a[2, 2]
    fg = np.abs(a - bg).sum(axis=2) > 40
    fg[:40] = False                                      # the pane's scale ruler
    fg[:, -80:] = False                                  # and its zoom buttons
    rows = np.flatnonzero(fg.any(axis=1))
    if not len(rows):
        return front
    top, height = rows[0], rows[-1] - rows[0]
    size = int(height * 0.22)
    cols = np.flatnonzero(fg[top:top + size].any(axis=0))
    cx = (cols[0] + cols[-1]) // 2 if len(cols) else front.width // 2
    return front.crop((cx - size // 2, top, cx + size // 2, top + size))


def naked(mesh):
    """A pane's geoset choices (one per group) as an undressed character wears them: the body panes come from creature
    displays, whose group 13 is 2 (1302, the robe). A robe draws with the body texture, so the previews showed a skin
    coloured dress on the females (user report); 1301 is the bare legs."""
    mesh = list(mesh)
    # every armour group bare (gloves 4, boots 5, sleeves 8, leg cuffs 9, chest 10, pants 11, tabard 12, robe 13,
    # cloak 15): the worgen male pane is an armoured NPC (a pale lump at the feet); hair, facial and ears stay
    for g in (4, 5, 8, 9, 10, 11, 12, 13, 15):
        if g < len(mesh):
            mesh[g] = 1
    return mesh


class Viewer:
    """A temp www of symlinks to the F-216 viewer on an ephemeral port, and headless Chrome shots of its panes."""

    def __init__(self):
        self.work = Path(tempfile.mkdtemp(prefix='skin_preview_'))
        # bake BLPs and shots run to hundreds of MB per run: gone at close or exit (filled the docker image once)
        atexit.register(shutil.rmtree, self.work, True)
        self.www = self.work / 'www'
        self.www.mkdir()
        for entry in VIEWER.iterdir():
            (self.www / entry.name).symlink_to(entry)
        (self.www / 'local').mkdir()

        class Quiet(http.server.SimpleHTTPRequestHandler):
            def log_message(self, *args):
                pass

        self.httpd = socketserver.TCPServer(('127.0.0.1', 0), functools.partial(Quiet, directory=str(self.www)))
        self.port = self.httpd.server_address[1]
        threading.Thread(target=self.httpd.serve_forever, daemon=True).start()
        self.bodies = json.loads((VIEWER / 'data' / 'v2' / 'bodies.json').read_text())

    def pane_query(self, race, sex, name, canvas, extra):
        """The pane URL query for a race / sex body wearing `canvas` (and `extra` as its _Extra)."""
        pane = self.bodies.get(CODES.get(race, '?') + 'mf'[sex])
        folder = FOLDERS.get(race, '')
        if pane is None or f'character/{folder.lower()}/' not in pane['model']:
            # the viewer's 'wo' panes are stock's Fel Orc model (ChrRaces 12's old row), not the worgen: a preview
            # there drew worgen fur on a fel orc (user report)
            raise SystemExit(f'race {race}: the viewer has no {folder or "body"} pane '
                             f'({pane["model"] if pane else "none"}); preview it in the client')
        if 'tex' not in pane:
            # an unbaked pane (no NPC wears the model: the worgen female): a texture slot of our own for the body, and
            # the other sex's geoset choices
            other = self.bodies.get(CODES[race] + 'mf'[1 - sex], {})
            pane = dict(pane, tex={'1': UNBAKED_FDID}, mesh=other.get('mesh', [1] * 20))
        tex = pane['tex']
        self.pane = pane
        blp_bgra(canvas, self.www / 'local' / f'{name}_bake.blp')
        ovr = {f'fdid/{tex["1"]}': f'http://localhost:{self.port}/local/{name}_bake.blp'}
        if extra is not None and '8' in tex:                 # a pane without an _Extra slot (worgen) keeps its own
            blp_bgra(extra, self.www / 'local' / f'{name}_extra.blp')
            ovr[f'fdid/{tex["8"]}'] = f'http://localhost:{self.port}/local/{name}_extra.blp'
        base = (f'src=v2&model={pane["model"]}&map={pane["map"]}&tex=' + ','.join(f'{k}:{v}' for k, v in tex.items())
                + '&mesh=' + ','.join(map(str, naked(pane['mesh']))) + '&ovr=' + urllib.parse.quote(json.dumps(ovr)))
        # the pane orbits the model's own centre: the face is cropped from a front shot (face_crop)
        cam = f'&cam={",".join(map(str, pane["camera"]["target"]))},{pane["camera"]["dist"]}'
        return base + cam, pane['camera']['dist']

    def shots(self, jobs):
        """jobs = [(png path, pane query)]: renders them in turn in one browser, a page load each."""
        js = self.work / 'shot.js'
        js.write_text(SHOT_JS % (json.dumps(PUPPETEER), json.dumps(str(CHROME))))
        subprocess.run(['node', str(js), str(self.port), *[f'{p}={q}' for p, q in jobs]], check=True)

    def strip(self, race, sex, items, views):
        """items = [(name, canvas, extra)], views = {suffix: (yaw, pitch, distance factor)}: shoots every item from
        every view, writing <work>/<name><suffix>.png. One page per view loads the race's model once and swaps only
        the skin slots between items (STRIP_JS)."""
        query, dist = self.pane_query(race, sex, items[0][0], items[0][1], items[0][2])
        tex = {k: v for k, v in self.pane['tex'].items()}
        colours = []
        for i, (name, canvas, extra) in enumerate(items):
            blp_bgra(canvas, self.www / 'local' / f'{name}_bake.blp')
            c = {'out': str(self.work / name), 'bake_id': UNBAKED_FDID + 1000 + 2 * i,
                 'bake': f'http://localhost:{self.port}/local/{name}_bake.blp'}
            if extra is not None and '8' in tex:
                blp_bgra(extra, self.www / 'local' / f'{name}_extra.blp')
                c.update(extra_id=UNBAKED_FDID + 1001 + 2 * i, extra=f'http://localhost:{self.port}/local/{name}_extra.blp')
            colours.append(c)
        pages = [{'suffix': f'{suffix}.png', 'query': query + f'&view={y},{pt},{dist * f:.3f}'}
                 for suffix, (y, pt, f) in views.items()]
        spec = self.work / f'strip_{race}_{sex}.json'
        spec.write_text(json.dumps({'pages': pages, 'colours': colours, 'tex': tex}))
        js = self.work / 'strip.js'
        js.write_text(STRIP_JS % (json.dumps(PUPPETEER), json.dumps(str(CHROME))))
        subprocess.run(['node', str(js), str(self.port), str(spec)], check=True)

    def close(self):
        self.httpd.shutdown()
        shutil.rmtree(self.work, ignore_errors=True)


def files_resolver():
    first = [ASSETS, CURATED] + [p for p in COMMUNITY if p.is_dir()]
    return FileResolver(first + [p for p in EXTERNAL_ROOTS if Path(p).resolve() not in {f.resolve() for f in first}])


def seam_check(race, sex, items, files=None, query=None, viewer=None):
    """How far each face's colour sits off the body right round it, as rendered: items = [(key, colour, face type,
    face_imgs or None)] -> {key: (Lab a*b* distance, face Lab, neck Lab)}. Two front shots per item from one camera:
    the real texture, and the mask (bake mask=True) that says which pixels are face and which body. The neck is the
    body within 10 px of the face. None when the render found too few pixels of either."""
    from scipy import ndimage
    files = files or files_resolver()
    query = query or _dbc_query_fn('live')
    own = viewer is None
    viewer = viewer or Viewer()
    jobs, keys = [], []
    for key, colour, face, face_imgs in items:
        name = f'{race}_{sex}_{len(keys)}'
        canvas, extra = bake(files, query, race, sex, colour, face, [0, 0, 0], face_imgs)
        mask, _ = bake(files, query, race, sex, colour, face, [0, 0, 0], mask=True)
        q_real, dist = viewer.pane_query(race, sex, name, canvas, extra)
        q_mask, _ = viewer.pane_query(race, sex, name + 'm', mask, extra)
        view = f'&view=0,0.08,{dist * 1.05:.3f}'
        jobs += [(viewer.work / f'{name}.png', q_real + view), (viewer.work / f'{name}m.png', q_mask + view)]
        keys.append((key, name))
    viewer.shots(jobs)
    out = {}
    for key, name in keys:
        real = np.asarray(Image.open(viewer.work / f'{name}.png').convert('RGB')).astype(float)
        m = np.asarray(Image.open(viewer.work / f'{name}m.png').convert('RGB')).astype(float)
        r, g, b = m[..., 0], m[..., 1], m[..., 2]
        face_px = (r > 60) & (b > 60) & (g < 0.5 * np.minimum(r, b))           # magenta, lit or shaded
        body_px = (g > 60) & (b > 60) & (r < 0.5 * np.minimum(g, b))           # cyan
        neck = ndimage.binary_dilation(face_px, iterations=10) & body_px
        if face_px.sum() < 200 or neck.sum() < 100:
            out[key] = None
            continue
        f, n = _lit(real[face_px]), _lit(real[neck])
        lf, ln = _lab(f), _lab(n)
        out[key] = (float(np.linalg.norm((lf - ln)[1:])), lf, ln)
    if own:
        viewer.close()
    return out


def _lit(px):
    lum = px.mean(axis=1)
    return px[lum >= np.median(lum)].mean(axis=0)


def _lab(rgb):
    c = np.asarray(rgb, np.float64) / 255
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = np.array([[0.4124, 0.3576, 0.1805], [0.2126, 0.7152, 0.0722], [0.0193, 0.1192, 0.9505]]) @ c
    xyz /= np.array([0.95047, 1.0, 1.08883])
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.array([116 * f[1] - 16, 500 * (f[0] - f[1]), 200 * (f[1] - f[2])])


def playable_colours(query, race, sex):
    """The skin colours character creation offers the race and sex: each colour's highest-id skin row (the one the
    client uses) with the playable flag 0x1."""
    rows = query(f'SELECT color_index, flags FROM charsections WHERE race = {race} AND gender = {sex} '
                 f'AND base_section = 0 AND type = 0 ORDER BY id')
    last = {}
    for r in rows:
        last[int(r['color_index'] if isinstance(r, dict) else r[0])] = int(r['flags'] if isinstance(r, dict) else r[1])
    return sorted(c for c, f in last.items() if f & 1)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--race', type=int, required=True)
    ap.add_argument('--sex', type=int, required=True)
    ap.add_argument('--colours', required=True, help="comma list, or 'all' = every char-create colour")
    ap.add_argument('--face', type=int, default=0)
    ap.add_argument('--layers', default='0,0,0')
    ap.add_argument('--out', default='skin_preview.png')
    a = ap.parse_args()
    layers = [int(v) for v in a.layers.split(',')]
    files = files_resolver()
    query = _dbc_query_fn('live')
    colours = playable_colours(query, a.race, a.sex) if a.colours == 'all' else [int(c) for c in a.colours.split(',')]
    viewer = Viewer()
    work = viewer.work
    items = [(str(c), *bake(files, query, a.race, a.sex, c, a.face, layers)) for c in colours]
    viewer.strip(a.race, a.sex, items, {'_front': (0, 0.08, 1.05), '_body': (0.6, 0.15, 1.15)})
    viewer.close()

    T, COLS = 260, 12                                     # a row of the sheet = up to COLS colours, face over body
    rows = -(-len(colours) // COLS)
    sheet = Image.new('RGB', (min(len(colours), COLS) * T, rows * (2 * T + 18)), (30, 30, 30))
    d = ImageDraw.Draw(sheet)
    for i, c in enumerate(colours):
        x, y = i % COLS * T, i // COLS * (2 * T + 18)
        front = Image.open(work / f'{c}_front.png').convert('RGB')
        sheet.paste(face_crop(front).resize((T, T), Image.LANCZOS), (x, y + 18))
        body = Image.open(work / f'{c}_body.png').convert('RGB')
        w, h = body.size
        sheet.paste(body.crop((w * 0.1, h * 0.05, w * 0.9, h * 0.95)).resize((T, T)), (x, y + 18 + T))
        d.text((x + 4, y + 3), f'race {a.race} sex {a.sex} colour {c}', fill=(255, 255, 0))
    sheet.save(a.out)
    print(a.out)


if __name__ == '__main__':
    main()
