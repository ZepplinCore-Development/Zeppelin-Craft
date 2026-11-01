#!/usr/bin/env python3
"""F-239: add retail WoW's light data to the HD renderer's Forever tables (forever_data\\hd_forever_*.txt).

The x64 client's hdForever / hdFog / hdSky / hdGrade only act on a Light ID that has an `L` row in
hd_forever_light.txt (HD::ForeverLightParams, HdForever.cpp). WoW Forever's data (the WoW-HD pack) covers Light IDs
1-415 on Eastern Kingdoms and Kalimdor only. This script fills the Light IDs Forever lacks from retail's
Light / LightData tables (wago.tools CSV, default build 12.1.5.70688):

  scope   every Light.dbc row (ours) that has no Forever L row and is not on map 0 or 1 (old-world lights moved with
          Cataclysm; they need position matching, F-239 plan 3). Our positions and falloffs stay; only the values
          come from retail.
  slots   OUR Light.dbc LightParams IDs (params_clear, _clear_underwater, _storm, _storm_underwater, _death), looked
          up in retail LightData. LightParams IDs are stable: of 457 lights that also exist in retail Light by ID on
          the same continent, 451 have the same clear-weather LightParams; the 6 others point at newer retail art
          (6027+, 6562), and 44 of our lights (e.g. 1436 Vengeance Landing) are not in retail Light at all while
          their LightParams are. Retail Light.db2 is only used for the "same ID" statistic.
  ids     a retail LightParams ID P becomes setting OFFSET + P (OFFSET = 1000000): settings share one key space
          in the client, and retail IDs collide with Forever's own setting IDs.

Tables and how retail LightData fills them (time = LightData.Time, 0-2880 half-minutes; colour = the int as RRGGBB):
  hd_forever_light.txt    L light map slot0..slot7   our params, OFFSET + id (slots 5-7 = 0, like Forever;
                                                     a slot whose LightParams has no LightData = 0 = keep 3.3.5)
                          B setting band n t c ...   band 0 DirectColor, 1 AmbientColor, 2 SkyTopColor,
                                                     3 SkyMiddleColor, 4 SkyBand1Color, 5 SkyBand2Color,
                                                     6 SkySmogColor, 7 SkyFogColor, 9 SunColor, 10 CloudSunColor,
                                                     11 CloudLayer1AmbientColor (bands 8, 13-17 = 3.3.5)
  hd_forever_ambient.txt  B setting 18|19 ...        HorizonAmbientColor, GroundAmbientColor
  hd_forever_sky.txt      B setting 12 ...           CloudEmissiveColor
  hd_forever_grading.txt  G setting time lut         ColorGradingFileDataID (none in scope in 12.1.5: not written)
  hd_forever_fog.txt      F setting time layer ...   converted, see below
A band whose colours are all 0 at every time is left out (the client then keeps the 3.3.5 band), as Forever's
generator did. Checked against Forever: its B rows equal its LightData columns 1:1 with this band mapping.

Fog: Forever's layers come from LightDataGlobalVolumeFog, which retail does not fill (the 12.1.7 table has 0 rows).
Retail's fog is LightData's "legacy" fog (FogDensity, FogScaler, FogHeight, FogHeightScaler, FogHeightDensity,
SkyFogColor, FogHeightColor), drawn per pixel as (WebWowViewerCpp makeFog / MapSceneRenderer):
  transmittance = exp(-max(0, d - start) * density),   start = min(farClip, 3000) * FogScaler,
  density = FogDensity * 0.0005 per yard below FogHeight, FogHeightDensity * 0.0005 above, blended by
  saturate((z - FogHeight) * FogHeightScaler); colour SkyFogColor below, FogHeightColor above.
That becomes up to two HD layers (HD::ForeverFogLayer; the client scales density x 0.0035 per yard):
  layer 0 (flags 10 = drawn + heights relative to the player): the density both regions share, everywhere,
          thinning above the player (SKY_FADE_*: not retail, the HD fog also fogs the sky out to 5000 yd).
  layer 1 (flags 8, absolute heights): the extra density of the denser region, faded across the FogHeight
          transition (exp fade with its half point at the middle of retail's linear ramp).
  colour  in the sun term with an even phase (g 0) and intensity 1/0.88, so the fog colour drawn is the retail
          colour (the base-colour term is scaled x 0.034 for Forever's HDR and cannot reach it).
  density = retail density / 7 (0.0005 / 0.0035);  start = 3000 * FogScaler (0 when negative).
Only settings in the clear/storm slots get fog (HdFog reads no other slot); a FogDensity above 100 (retail 557 =
1000 in Old Hillsbrad) gets no layers.
Not converted: EndFogColor (distance colour shift), SunFogColor/Angle (sun glow), FogZScalar, the coefficient curves
(all 0 for Outland/Northrend in 12.1.5).

Generated rows live between the F-239 marker lines at the end of each file; a re-run replaces that section (and
drops any stray row with a setting >= OFFSET), so it is idempotent. stage_hd_data.py re-stages forever_data from the
pack and then runs this script.

Usage: gen_retail_light.py [--build 12.1.5.70688] [--light-tsv our_light.tsv] [--dry-run]
"""
import argparse
import csv
import subprocess
import sys
import urllib.request
from collections import defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent
CRAFT = HERE.parent.parent
DATA = HERE / 'mpq' / 'source-assets' / 'forever_data'
CACHE = Path('/workspace/project/Zeppelin-Tools/retail-light')
DEFAULT_BUILD = '12.1.5.70688'
OFFSET = 1000000
SKIP_MAPS = {0, 1}
MAX_KEYS = 32                      # kMaxKeys in HdForever.cpp

LIGHT_BANDS = [(0, 'DirectColor'), (1, 'AmbientColor'), (2, 'SkyTopColor'), (3, 'SkyMiddleColor'),
               (4, 'SkyBand1Color'), (5, 'SkyBand2Color'), (6, 'SkySmogColor'), (7, 'SkyFogColor'),
               (9, 'SunColor'), (10, 'CloudSunColor'), (11, 'CloudLayer1AmbientColor')]
AMBIENT_BANDS = [(18, 'HorizonAmbientColor'), (19, 'GroundAmbientColor')]
SKY_BANDS = [(12, 'CloudEmissiveColor')]

# Fog conversion constants (see the docstring)
RETAIL_DENSITY = 0.0005            # MapSceneRenderer densityMultFix: FogDensity -> per yard
HD_DENSITY = 0.0035                # HdFog kFogDensityScale: layer density -> per yard
RETAIL_FAR = 3000.0                # fog start = min(farClip, 3000) * FogScaler
SUN_SCALE = 0.88                   # HdFog kFogSunScale: intensity 1 / 0.88 draws the colour as given
SKY_FADE_HEIGHT = 150.0            # layer 0 thins above player z + 150 yd ...
SKY_FADE_RATE = 0.5                # ... by exp(-0.005 per yard)
LN2 = 0.6931471805599453
MAX_FOG_DENSITY = 100.0            # retail FogDensity above this (557: 1000, Old Hillsbrad) is not drawable fog: no layers
FOG_SLOTS = (0, 2)                 # HdFog reads only the clear (0) and storm (2) slots

BEGIN = '# --- F-239 retail lights {build} (gen_retail_light.py; re-run replaces this section) ---'   # < 127 chars: Gets() buffers
BEGIN_TAG = '# --- F-239 retail lights'
END = '# --- end F-239 ---'


def fetch_csv(build: str, table: str) -> Path:
    f = CACHE / build / f'{table}.csv'
    if not f.exists() or f.stat().st_size < 100:
        f.parent.mkdir(parents=True, exist_ok=True)
        url = f'https://wago.tools/db2/{table}/csv?build={build}'
        req = urllib.request.Request(url, headers={'User-Agent': 'Zeppelin-F239/1.0'})
        with urllib.request.urlopen(req, timeout=300) as r:
            data = r.read()
        if not data.startswith(b'ID,') and b',ID,' not in data.split(b'\n', 1)[0]:
            raise SystemExit(f'{url}: not a CSV ({data[:80]!r})')
        f.write_bytes(data)
    return f


LIGHT_SQL = ('SELECT id, map_id, params_clear, params_clear_underwater, params_storm, params_storm_underwater, '
             'params_death FROM light')


def our_lights(tsv: Path = None):
    """[(id, map, [5 LightParams])] from our Light.dbc (DBC database)."""
    if tsv:
        text = tsv.read_text()
    else:
        text = subprocess.run([sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', LIGHT_SQL],
                              cwd=CRAFT, check=True, capture_output=True, text=True).stdout
    out = []
    for ln in text.splitlines():
        p = ln.split('\t')
        if len(p) >= 7 and p[0].strip().isdigit():
            out.append((int(p[0]), int(p[1]), [int(x) for x in p[2:7]]))
    if not out:
        raise SystemExit('no Light rows read')
    return out


def col(r, name) -> int:
    return int(r[name] or 0) & 0xFFFFFF


def num(r, name) -> float:
    return float(r[name] or 0)


def fmt(v: float) -> str:
    s = f'{v:.6g}'
    return '0' if s in ('-0', '0') else s


def band_rows(setting: int, keys, bands):
    out = []
    for band, name in bands:
        vals = [(int(r['Time'] or 0), col(r, name)) for r in keys]
        if not any(c for _, c in vals):
            continue
        out.append(f'B {setting} {band} {len(vals)} ' + ' '.join(f'{t} {c:06X}' for t, c in vals))
    return out


def fog_layers(r):
    """Retail legacy fog of one LightData row -> [(flags, colour, density, start, topRate, topHeight, botRate, botHeight)]."""
    fd = num(r, 'FogDensity')
    if fd > MAX_FOG_DENSITY:
        return []
    scaler = max(-1.0, min(1.0, num(r, 'FogScaler')))
    fog_end = max(num(r, 'FogEnd'), 10.0)
    if fd <= 0:                                    # DayNightLightHolder::fixLightTimedData
        clamped = min(RETAIL_FAR, 700.0) - 200.0
        diff = fog_end - fog_end * scaler
        fd = 1.5 if diff > clamped or diff <= 0 else (1.0 - diff / clamped) * 5.5 + 1.5
    height = num(r, 'FogHeight')
    if height > 10000:
        height = 0.0
    height = max(height, -10000.0)
    rate = max(-1.0, min(1.0, num(r, 'FogHeightScaler')))
    fhd = num(r, 'FogHeightDensity') if rate != 0 else fd
    fc = col(r, 'SkyFogColor')
    hc = col(r, 'FogHeightColor') or fc
    start = max(0.0, RETAIL_FAR * scaler)
    s = RETAIL_DENSITY / HD_DENSITY

    if rate == 0 or abs(fhd - fd) < 1e-6:
        return [(10, fc, fd * s, start, SKY_FADE_RATE, SKY_FADE_HEIGHT, 0.0, 0.0)]
    # the region where saturate((z - H) * rate) is 0 uses FogDensity / SkyFogColor, where it is 1 FogHeightDensity /
    # FogHeightColor; rate > 0: that is above H, rate < 0: below H. The linear ramp is 1 / |rate| yards long.
    if rate > 0:
        low_d, low_c, high_d, high_c = fd, fc, fhd, hc
    else:
        low_d, low_c, high_d, high_c = fhd, hc, fd, fc
    a = abs(rate)
    mid = height + 0.5 / rate                      # middle of the ramp
    k = 2.0 * LN2 * a                              # exp fade with its half point at the middle of the ramp
    layers = [(10, low_c if low_d <= high_d else high_c, min(low_d, high_d) * s, start,
               SKY_FADE_RATE, SKY_FADE_HEIGHT, 0.0, 0.0)]
    extra = abs(low_d - high_d) * s
    if extra > 0:
        if low_d > high_d:                         # denser below: fades out upward from mid - 0.5/|rate|
            layers.append((8, low_c, extra, start, 100.0 * k, mid - 0.5 / a, 0.0, 0.0))
        else:                                      # denser above: fades out downward from mid + 0.5/|rate|
            layers.append((8, high_c, extra, start, 0.0, 0.0, 100.0 * k, mid + 0.5 / a))
    return layers


def fog_rows(setting: int, keys):
    out = []
    intensity = 1.0 / SUN_SCALE
    for r in keys:
        t = int(r['Time'] or 0)
        for i, (flags, c, dens, start, top_r, top_h, bot_r, bot_h) in enumerate(fog_layers(r)):
            if dens <= 0:
                continue
            # flags diffuse emissive shadow start density shadowMul topRate topHeight bottomRate bottomHeight
            # intensity g strength exponent
            out.append(f'F {setting} {t} {i} {flags} {c:06X} 000000 000000 {fmt(start)} {fmt(dens)} 1 '
                       f'{fmt(top_r)} {fmt(top_h)} {fmt(bot_r)} {fmt(bot_h)} {fmt(intensity)} 0 0 1')
    return out


def strip_generated(lines, kind):
    """The file without the F-239 section and without stray rows owned by it."""
    out, inside = [], False
    for ln in lines:
        if ln.startswith(BEGIN_TAG):
            inside = True
            continue
        if inside:
            if ln.startswith(END):
                inside = False
            continue
        p = ln.split()
        if p and p[0] in ('B', 'F', 'G') and len(p) > 1 and p[1].lstrip('-').isdigit() and int(p[1]) >= OFFSET:
            continue
        if p and p[0] == 'L' and len(p) > 10 and any(int(x) >= OFFSET for x in p[3:11]):
            continue
        out.append(ln)
    while out and not out[-1].strip():
        out.pop()
    return out


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('--build', default=DEFAULT_BUILD, help='retail build on wago.tools')
    ap.add_argument('--light-tsv', type=Path, help='rows of LIGHT_SQL (tab separated) instead of querying the DBC database')
    ap.add_argument('--data', type=Path, default=DATA, help='forever_data directory to update')
    ap.add_argument('--dry-run', action='store_true')
    args = ap.parse_args()

    light_csv = fetch_csv(args.build, 'Light')
    data_csv = fetch_csv(args.build, 'LightData')
    retail_light = {int(r['ID']): r for r in csv.DictReader(open(light_csv, newline=''))}
    keys = defaultdict(list)
    for r in csv.DictReader(open(data_csv, newline='')):
        keys[int(r['LightParamID'])].append(r)
    for p in keys:
        keys[p].sort(key=lambda r: int(r['Time'] or 0))

    files = {n: (args.data / n).read_text().splitlines() for n in
             ('hd_forever_light.txt', 'hd_forever_ambient.txt', 'hd_forever_sky.txt', 'hd_forever_fog.txt',
              'hd_forever_grading.txt')}
    for n in files:
        files[n] = strip_generated(files[n], n)
    forever = {}
    for ln in files['hd_forever_light.txt']:
        p = ln.split()
        if p and p[0] == 'L':
            forever[int(p[1])] = int(p[2])

    L, settings, fog_settings = [], set(), set()
    stats = defaultdict(lambda: [0, 0, 0, 0])      # group -> [ours, forever, generated, generated + same ID in retail]
    for lid, mp, params in sorted(our_lights(args.light_tsv)):
        group = {0: 'Eastern Kingdoms', 1: 'Kalimdor', 530: 'Outland', 571: 'Northrend'}.get(mp, 'Other maps')
        st = stats[group]
        st[0] += 1
        if forever.get(lid) == mp:
            st[1] += 1
            continue
        if mp in SKIP_MAPS or lid in forever:
            continue
        slots = []
        for k, p in enumerate(params):
            if p and keys.get(p):
                if len(keys[p]) > MAX_KEYS:
                    print(f'warning: LightParams {p} has {len(keys[p])} time keys, the client reads {MAX_KEYS}')
                slots.append(OFFSET + p)
                settings.add(p)
                if k in FOG_SLOTS:
                    fog_settings.add(p)
            else:
                slots.append(0)
        if not slots[0]:
            continue
        L.append(f'L {lid} {mp} ' + ' '.join(map(str, slots + [0, 0, 0])))
        st[2] += 1
        r = retail_light.get(lid)
        if r and int(r['ContinentID']) == mp:
            st[3] += 1

    out = {n: [] for n in files}
    grading = 0
    for p in sorted(settings):
        s, k = OFFSET + p, keys[p]
        out['hd_forever_light.txt'] += band_rows(s, k, LIGHT_BANDS)
        out['hd_forever_ambient.txt'] += band_rows(s, k, AMBIENT_BANDS)
        out['hd_forever_sky.txt'] += band_rows(s, k, SKY_BANDS)
        if p in fog_settings:
            out['hd_forever_fog.txt'] += fog_rows(s, k)
        if any(int(r['ColorGradingFileDataID'] or 0) for r in k):
            grading += 1
    out['hd_forever_light.txt'] = L + out['hd_forever_light.txt']
    if grading:
        print(f'note: {grading} settings have ColorGradingFileDataID; grading (LUT conversion) is not generated yet')

    for group in ('Eastern Kingdoms', 'Kalimdor', 'Outland', 'Northrend', 'Other maps'):
        o, f, g, same = stats[group]
        print(f'{group:17s} lights {o:4d}  Forever {f:4d}  F-239 {g:4d} ({same} also in retail Light by ID)  '
              f'none {o - f - g:4d}')
    print(f'{len(settings)} retail LightParams -> settings {OFFSET}+id; rows: ' +
          ', '.join(f'{n} {len(v)}' for n, v in out.items()))
    if args.dry_run:
        return
    for n, lines in files.items():
        body = lines
        if out[n]:
            body = lines + ['', BEGIN.format(build=args.build)] + out[n] + [END]
        (args.data / n).write_bytes(('\r\n'.join(body) + '\r\n').encode())   # the pack's files are CRLF


if __name__ == '__main__':
    main()
