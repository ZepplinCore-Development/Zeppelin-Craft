"""F-151: preview skin colours on the 3D character model in the F-216 viewer, outside the game client.

Bakes each colour's character texture from the live DBC (skin, face, scalp, the full-atlas layers 6-8, underwear),
points the race's viewer body pane at it (texture slot 1 = the baked skin, slot 8 = the colour's _Extra) and takes
a front face close-up and a three-quarter body shot of each in headless Chrome. Writes one labelled contact sheet.

The viewer is not the client: no eye glow, the hair texture and mesh are the pane's own, and layers are pasted
over the whole atlas at once (the client pastes them section by section). Check a sheet before testing in game.

  python3 "Scripts/Character Skins/skin_preview.py" --race 11 --sex 0 --colours 33,34,35 [--face 0]
      [--layers tattoo,scars,warpaint] [--out sheet.png]
"""
import argparse
import functools
import http.server
import json
import os
import socketserver
import struct
import subprocess
import sys
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

VIEWER = CRAFT.parent / 'nginx' / 'wow' / 'modelviewer'
ASSETS = CRAFT / 'zpaks' / 'zep-skin-expansion' / 'mpq' / 'source-assets'
CURATED = CRAFT / 'zpaks' / 'zep-hd-curated' / 'mpq' / 'parsed-assets'
COMMUNITY = [CRAFT.parent / 'Zeppelin-Tools' / 'Asset Library' / 'COMMUNITY' / n / 'mpq' / 'source-assets'
             for n in ('patch-hd-everything', 'patch-hd-creatures-mounts')]   # the HD character pack's sources
CODES = {2: 'or', 3: 'dw', 10: 'be', 11: 'dr', 1: 'hu', 4: 'ni', 5: 'sc', 6: 'ta', 7: 'gn', 8: 'tr', 9: 'go', 22: 'wo'}
PUPPETEER = '/opt/claude-tools/lib/node_modules/puppeteer'
CHROME = Path.home() / '.cache' / 'puppeteer' / 'chrome' / 'linux-144.0.7559.96' / 'chrome-linux64' / 'chrome'
SHOT_JS = """const puppeteer = require(%s);
(async () => {
  const [,, port, ...jobs] = process.argv;
  const b = await puppeteer.launch({ headless: 'new', executablePath: %s,
    args: ['--use-angle=swiftshader', '--enable-unsafe-swiftshader', '--no-sandbox'] });
  for (const j of jobs) {
    const k = j.indexOf('='), out = j.slice(0, k), q = j.slice(k + 1);
    const p = await b.newPage();
    await p.setViewport({ width: 900, height: 1200 });
    await p.goto(`http://localhost:${port}/pane.html?` + q, { waitUntil: 'load' });
    await new Promise(r => setTimeout(r, 15000));
    await p.screenshot({ path: out });
    await p.close();
  }
  await b.close();
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


def bake(files, query, race, sex, colour, face, layers):
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
    if fr:
        for col, region in (('texture_1', 'FaceLower'), ('texture_2', 'FaceUpper')):
            im = load(fr[col])
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


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--race', type=int, required=True)
    ap.add_argument('--sex', type=int, required=True)
    ap.add_argument('--colours', required=True)
    ap.add_argument('--face', type=int, default=0)
    ap.add_argument('--layers', default='0,0,0')
    ap.add_argument('--out', default='skin_preview.png')
    a = ap.parse_args()
    colours = [int(c) for c in a.colours.split(',')]
    layers = [int(v) for v in a.layers.split(',')]
    first = [ASSETS, CURATED] + [p for p in COMMUNITY if p.is_dir()]
    files = FileResolver(first + [p for p in EXTERNAL_ROOTS if Path(p).resolve() not in {f.resolve() for f in first}])
    query = _dbc_query_fn('live')
    code = CODES[a.race] + 'mf'[a.sex]
    pane = json.loads((VIEWER / 'data' / 'v2' / 'bodies.json').read_text())[code]
    work = Path(tempfile.mkdtemp(prefix='skin_preview_'))
    www = work / 'www'
    www.mkdir()
    for entry in VIEWER.iterdir():
        (www / entry.name).symlink_to(entry)
    (www / 'local').mkdir()
    class Quiet(http.server.SimpleHTTPRequestHandler):
        def log_message(self, *args):
            pass

    handler = functools.partial(Quiet, directory=str(www))
    httpd = socketserver.TCPServer(('127.0.0.1', 0), handler)
    port = httpd.server_address[1]
    threading.Thread(target=httpd.serve_forever, daemon=True).start()

    tex = pane['tex']
    jobs = []
    for c in colours:
        canvas, extra = bake(files, query, a.race, a.sex, c, a.face, layers)
        blp_bgra(canvas, www / 'local' / f'{c}_bake.blp')
        ovr = {f'fdid/{tex["1"]}': f'http://localhost:{port}/local/{c}_bake.blp'}
        if extra is not None:
            blp_bgra(extra, www / 'local' / f'{c}_extra.blp')
            ovr[f'fdid/{tex["8"]}'] = f'http://localhost:{port}/local/{c}_extra.blp'
        base = (f'src=v2&model={pane["model"]}&map={pane["map"]}&tex=' + ','.join(f'{k}:{v}' for k, v in tex.items())
                + '&mesh=' + ','.join(map(str, pane['mesh'])) + '&ovr=' + urllib.parse.quote(json.dumps(ovr)))
        # the pane orbits the model's own centre: the face is cropped from a front shot (FACE_CROP)
        cam = f'&cam={",".join(map(str, pane["camera"]["target"]))},{pane["camera"]["dist"]}'
        jobs += [f'{work}/{c}_front.png={base}{cam}&view=0,0.08,{pane["camera"]["dist"] * 1.05:.3f}',
                 f'{work}/{c}_body.png={base}{cam}&view=0.6,0.15,{pane["camera"]["dist"] * 1.15:.3f}']
    js = work / 'shot.js'
    js.write_text(SHOT_JS % (json.dumps(PUPPETEER), json.dumps(str(CHROME))))
    subprocess.run(['node', str(js), str(port), *jobs], check=True)
    httpd.shutdown()

    T = 260
    sheet = Image.new('RGB', (len(colours) * T, 2 * T + 18), (30, 30, 30))
    d = ImageDraw.Draw(sheet)
    for i, c in enumerate(colours):
        front = Image.open(work / f'{c}_front.png').convert('RGB')
        sheet.paste(face_crop(front).resize((T, T), Image.LANCZOS), (i * T, 18))
        body = Image.open(work / f'{c}_body.png').convert('RGB')
        w, h = body.size
        sheet.paste(body.crop((w * 0.1, h * 0.05, w * 0.9, h * 0.95)).resize((T, T)), (i * T, 18 + T))
        d.text((i * T + 4, 3), f'race {a.race} sex {a.sex} colour {c}', fill=(255, 255, 0))
    sheet.save(a.out)
    print(a.out)


if __name__ == '__main__':
    main()
