"""zep client — offscreen test client (F-219 Track B).

Runs the REAL patched client (nginx/wow exe + WarcraftXL + our PATCH MPQs over the stock
3.3.5a MPQs) under Wine on a virtual X display with Mesa software GL, so a CC instance can
log in, move around and screenshot it without a GPU, root or a user round trip.

    zep client setup              build/refresh everything (idempotent; re-run after an exe/WXL ship)
    zep client account            create the non-GM test account, store creds in the client dir
    zep client start / stop       launch in the background / kill
    zep client status             display, client process, window geometry
    zep client login              type the stored credentials (--enter-world: first character)
    zep client shot OUT.png       screenshot cropped to the client window
    zep client drive OUTDIR       launch -> login -> charselect -> world, a screenshot per stage
    zep client measure PNG...     colour sanity numbers for captures
    zep client selftest           prove the capture path isn't garbling colour (I-380)
    zep client refresh            re-sync exe/WXL/patch links (setup minus the downloads)

Kept current automatically: `zep build exe --deploy`, `zep wxl ship` and `zep build patch-mpq`
call refresh_if_present() after writing to nginx. PATCH-*.MPQ are symlinks into nginx, so a
rebuilt patch is live with no copy at all; the patch-mpq hook only matters for a NEW letter.

Layout (none of it tracked except this file):
    ~/.local/xvfb/usr     Xvfb, xdotool, xkbcomp unpacked from Ubuntu jammy .debs (no root)
    ~/wowtest             assembled client: Data/ symlinks, exe/WXL copies, WTF/, Logs/, account.txt
                          Logs/wine/wine-<time>.log per run (+seh on; last 20 kept), wine.log -> newest;
                          crash reports land in Errors/<time> Crash.txt
    ~/.wine-wowtest       Wine prefix
    ~/.local/wine         portable Wine 11 (from the retroport toolchain, Joplin "Retroport Toolchain")

Captures use XGetImage. NEVER xwd (I-380): with a private-colormap window open - Wine always makes
one - xwd writes 24bpp, and a 32bpp decode looks like a grey, vertically striped, 3/4-width render.
"""
import colorsys
import ctypes
import ctypes.util
import gzip
import os
import secrets
import shutil
import subprocess
import time
import urllib.request
import zipfile
from pathlib import Path

import click

from lib.env import NGINX_PATH as NGINX

_HOME = Path.home()
CLIENT_DIR = Path(os.getenv('WOWTEST_DIR', _HOME / 'wowtest'))
XROOT = Path(os.getenv('XROOT', _HOME / '.local/xvfb/usr'))
WINE_DIR = Path(os.getenv('WINE_DIR', _HOME / '.local/wine'))
WINEPREFIX = Path(os.getenv('WOWTEST_WINEPREFIX', _HOME / '.wine-wowtest'))
DISPLAY = os.getenv('WOWTEST_DISPLAY', ':77')
STOCK = Path(os.getenv('STOCK_DIR', '/workspace/project/Zeppelin-Tools/Asset Library/STOCK'))
DEB_CACHE = Path(os.getenv('XDEB_CACHE', _HOME / '.cache/zep-client/debs'))
ACCOUNT_FILE = CLIENT_DIR / 'account.txt'
CLIENT_ZIP_ROOT = 'ChromieCraft_3.3.5a'

# Screen larger than the 1280x800 client window on purpose: at 1280x800 Wine shrinks the window
# to 1224x765 to fit and the client frame no longer matches gxResolution.
SCREEN = '1600x1000x24'
XKB_DIR = Path('/tmp/xkb')   # same length as /usr/bin - see _patch_xvfb
DEBS = ['xvfb', 'xserver-common', 'x11-xkb-utils', 'libunwind8', 'x11-apps', 'xdotool', 'libxdo3']
SPEECH_MPQS = ['speech-enUS', 'expansion-speech-enUS', 'lichking-speech-enUS']
WINDOW_NAME = 'World of Warcraft'


# -- environment ----------------------------------------------------------------------------------

def _xlib_env():
    env = dict(os.environ, DISPLAY=DISPLAY)
    env['LD_LIBRARY_PATH'] = str(XROOT / 'lib/x86_64-linux-gnu')
    return env


def _wine_env(bypass_wxl=False):
    env = dict(os.environ, DISPLAY=DISPLAY, WINEPREFIX=str(WINEPREFIX), LIBGL_ALWAYS_SOFTWARE='1')
    # +seh logs every exception dispatch (code + address). A #132 often reports only the CRT SEH
    # validator faulting while handling an EARLIER exception; that earlier one is only in this log.
    env.setdefault('WINEDEBUG', 'err+all,+seh')
    # d3d9=n,b loads the WXL proxy shipped next to Wow.exe; builtin bypasses it.
    env['WINEDLLOVERRIDES'] = f"d3d9={'b' if bypass_wxl else 'n,b'};mscoree,mshtml="
    return env


def _xtool(*args, check=True):
    return subprocess.run([str(XROOT / 'bin' / args[0]), *args[1:]], env=_xlib_env(),
                          capture_output=True, text=True, check=check)


def _require_setup():
    if not (XROOT / 'bin/Xvfb').exists() or not (CLIENT_DIR / 'Wow.exe').exists():
        raise click.ClickException('test client not set up - run: zep client setup')


# -- X display ------------------------------------------------------------------------------------

class _XImage(ctypes.Structure):
    _fields_ = [('width', ctypes.c_int), ('height', ctypes.c_int), ('xoffset', ctypes.c_int),
                ('format', ctypes.c_int), ('data', ctypes.c_void_p), ('byte_order', ctypes.c_int),
                ('bitmap_unit', ctypes.c_int), ('bitmap_bit_order', ctypes.c_int),
                ('bitmap_pad', ctypes.c_int), ('depth', ctypes.c_int),
                ('bytes_per_line', ctypes.c_int), ('bits_per_pixel', ctypes.c_int)]


def _x11():
    x = ctypes.CDLL(ctypes.util.find_library('X11'))
    x.XOpenDisplay.restype = ctypes.c_void_p
    x.XOpenDisplay.argtypes = [ctypes.c_char_p]
    x.XDefaultRootWindow.restype = ctypes.c_ulong
    x.XDefaultRootWindow.argtypes = [ctypes.c_void_p]
    x.XDisplayWidth.argtypes = x.XDisplayHeight.argtypes = [ctypes.c_void_p, ctypes.c_int]
    x.XCloseDisplay.argtypes = [ctypes.c_void_p]
    x.XGetImage.restype = ctypes.POINTER(_XImage)
    x.XGetImage.argtypes = [ctypes.c_void_p, ctypes.c_ulong, ctypes.c_int, ctypes.c_int,
                            ctypes.c_uint, ctypes.c_uint, ctypes.c_ulong, ctypes.c_int]
    x.XDestroyImage = None   # macro in Xlib; image is freed with the process
    return x


def _display_up():
    x = _x11()
    d = x.XOpenDisplay(DISPLAY.encode())
    if d:
        x.XCloseDisplay(d)
    return bool(d)


def _ensure_xkbcomp_wrapper():
    # Our Xvfb is patched to run xkbcomp from /tmp/xkb (see _patch_xvfb); /tmp doesn't persist.
    wrapper = XKB_DIR / 'xkbcomp'
    if not wrapper.exists():
        XKB_DIR.mkdir(parents=True, exist_ok=True)
        wrapper.write_text(f'#!/bin/sh\nLD_LIBRARY_PATH={XROOT}/lib/x86_64-linux-gnu '
                           f'exec {XROOT}/bin/xkbcomp "$@"\n')
        wrapper.chmod(0o755)


def _xvfb_up():
    if _display_up():
        return
    _ensure_xkbcomp_wrapper()
    log = open(f'/tmp/xvfb{DISPLAY.lstrip(":")}.log', 'w')
    subprocess.Popen([str(XROOT / 'bin/Xvfb'), DISPLAY, '-screen', '0', SCREEN, '-nolisten', 'tcp'],
                     env=_xlib_env(), stdout=log, stderr=log, start_new_session=True)
    for _ in range(20):
        if _display_up():
            return
        time.sleep(0.5)
    raise click.ClickException(f'Xvfb failed to start - see {log.name}')


def _window_geom():
    """(x, y, w, h) of the client window, or None."""
    r = _xtool('xdotool', 'search', '--name', WINDOW_NAME, 'getwindowgeometry', '--shell', check=False)
    vals = dict(line.split('=', 1) for line in r.stdout.splitlines() if '=' in line)
    if 'WIDTH' not in vals:
        return None
    return int(vals['X']), int(vals['Y']), int(vals['WIDTH']), int(vals['HEIGHT'])


def _wait_window(timeout):
    end = time.time() + timeout
    while time.time() < end:
        if _window_geom():
            return True
        time.sleep(2)
    return False


def grab(out, crop=None):
    """Save the screen (optionally cropped to (x, y, w, h)) as PNG via XGetImage."""
    from PIL import Image
    x = _x11()
    d = x.XOpenDisplay(DISPLAY.encode())
    if not d:
        raise click.ClickException(f'cannot open display {DISPLAY}')
    w, h = x.XDisplayWidth(d, 0), x.XDisplayHeight(d, 0)
    im = x.XGetImage(d, x.XDefaultRootWindow(d), 0, 0, w, h, 0xFFFFFFFF, 2).contents   # ZPixmap
    if im.bits_per_pixel != 32:
        raise click.ClickException(f'unexpected {im.bits_per_pixel}bpp root image')
    raw = ctypes.string_at(im.data, im.bytes_per_line * h)
    x.XCloseDisplay(d)
    img = Image.frombuffer('RGBX', (w, h), raw, 'raw', 'BGRX', im.bytes_per_line, 1).convert('RGB')
    if crop:
        cx, cy, cw, ch = crop
        img = img.crop((cx, cy, cx + cw, cy + ch))
    img.save(out)
    return img


def measure(path):
    """(r, g, b means, mean saturation, column-delta mean, column-delta max).

    A real colour frame has differing channel means and saturation ~0.3-0.6. I-380's garbled
    captures read identical means, ~0.02 saturation and a high column delta.
    """
    from PIL import Image, ImageFilter
    im = Image.open(path).convert('RGB')
    px = list(im.filter(ImageFilter.GaussianBlur(3)).getdata())   # blur removes per-column noise
    means = [sum(p[c] for p in px) / len(px) for c in range(3)]
    sat = [colorsys.rgb_to_hsv(*(c / 255 for c in p))[1] for p in px[::7]]
    lum = im.convert('L')
    w, h = lum.size
    rows = range(0, h, 4)
    col = [sum(lum.getpixel((cx, y)) for y in rows) / len(rows) for cx in range(w)]
    delta = [abs(col[i + 1] - col[i]) for i in range(w - 1)]
    return (*means, sum(sat) / len(sat), sum(delta) / len(delta), max(delta))


# -- setup ----------------------------------------------------------------------------------------

def _fetch_debs():
    base = 'http://archive.ubuntu.com/ubuntu'
    found = {}
    for dist in ('jammy-updates', 'jammy'):           # newest first
        for comp in ('main', 'universe'):
            url = f'{base}/dists/{dist}/{comp}/binary-amd64/Packages.gz'
            idx = gzip.decompress(urllib.request.urlopen(url, timeout=60).read()).decode()
            for stanza in idx.split('\n\n'):
                f = dict(l.split(': ', 1) for l in stanza.splitlines() if ': ' in l and not l.startswith(' '))
                if f.get('Package') in DEBS and f['Package'] not in found:
                    found[f['Package']] = f['Filename']
    missing = set(DEBS) - set(found)
    if missing:
        raise click.ClickException(f'not in the Ubuntu index: {sorted(missing)}')
    DEB_CACHE.mkdir(parents=True, exist_ok=True)
    paths = []
    for fn in found.values():
        dst = DEB_CACHE / Path(fn).name
        if not dst.exists():
            urllib.request.urlretrieve(f'{base}/{fn}', dst)
        paths.append(dst)
    return paths


def _patch_xvfb():
    """Xvfb has xkbcomp's dir compiled in as /usr/bin (no runtime flag, no root to install there).
    Rewrite it to the same-length /tmp/xkb; _ensure_xkbcomp_wrapper puts a wrapper there."""
    p = XROOT / 'bin/Xvfb'
    b = bytearray(p.read_bytes())
    old, new = b'/usr/bin\x00/usr/share/X11/xkb', b'/tmp/xkb\x00/usr/share/X11/xkb'
    if new in b:
        return False
    i = b.find(old)
    if i < 0 or b.find(old, i + 1) >= 0:
        raise click.ClickException('Xvfb: xkbcomp dir string not found exactly once - '
                                   'package changed, re-derive the patch')
    shutil.copy2(p, p.with_name('Xvfb.orig'))
    b[i:i + 8] = b'/tmp/xkb'
    p.write_bytes(b)
    return True


def _link(src, dst_dir):
    dst = dst_dir / src.name
    if dst.is_symlink() or dst.exists():
        dst.unlink()
    dst.symlink_to(src)


def _install(src, dst):
    """Atomic copy: temp file + rename, so a client running from these files keeps its mapped
    image (an in-place overwrite truncates a mapped exe/dll under the running process)."""
    dst.parent.mkdir(parents=True, exist_ok=True)
    if dst.exists() and dst.stat().st_size == src.stat().st_size and dst.read_bytes() == src.read_bytes():
        return False
    tmp = dst.with_name(dst.name + '.zep-tmp')
    shutil.copy2(src, tmp)
    os.replace(tmp, dst)
    return True


def _sync_tree(src, dst):
    # Per-file atomic copy instead of rmtree + copytree: on the UNRAID share rmtree races and
    # fails with "Directory not empty". Then prune what is no longer shipped.
    changed = 0
    for f in src.rglob('*'):
        if f.is_file():
            changed += _install(f, dst / f.relative_to(src))
    for d in list(dst.iterdir()) if dst.exists() else []:
        if not (src / d.name).exists():
            shutil.rmtree(d) if d.is_dir() else d.unlink()
            changed += 1
    return changed


def refresh_files():
    """Bring the client's exe/WXL copies and PATCH links in line with nginx. Returns change count."""
    data = CLIENT_DIR / 'Data'
    changed = 0
    want = {f.name: f for f in (NGINX / 'MPQ').glob('PATCH-*.MPQ')}
    for f in data.glob('PATCH-*.MPQ'):
        if f.is_symlink() and (f.name not in want or os.readlink(f) != str(want[f.name])):
            f.unlink()
    for name, f in sorted(want.items()):
        if not (data / name).is_symlink():
            _link(f, data)
            changed += 1
    changed += _install(NGINX / 'EXE/Wow.exe', CLIENT_DIR / 'Wow.exe')
    for f in (NGINX / 'WXL').glob('*.dll'):
        changed += _install(f, CLIENT_DIR / f.name)
    marker = NGINX / 'WXL/wxl-assets'
    if marker.exists():
        changed += _install(marker, CLIENT_DIR / 'wxl-assets')
    elif (CLIENT_DIR / 'wxl-assets').exists():
        (CLIENT_DIR / 'wxl-assets').unlink()
        changed += 1
    changed += _sync_tree(NGINX / 'WXL/Extensions', CLIENT_DIR / 'Extensions')
    return changed


def refresh_if_present():
    """Build-hook entry point: refresh the test client if this machine has one. Never raises -
    a failed refresh must not fail the build that called it."""
    if not (CLIENT_DIR / 'Wow.exe').exists():
        return
    try:
        n = refresh_files()
        msg = f'  Test client refreshed ({n} file(s) updated)' if n else '  Test client already current'
        click.echo(click.style(msg, fg='cyan'))
        if n and _display_up() and _window_geom():
            click.echo(click.style('  Test client is running - restart it to load the new files '
                                   '(zep client stop && zep client start)', fg='yellow'))
    except Exception as e:   # noqa: BLE001 - must never break the calling build
        click.echo(click.style(f'  Test client refresh failed (build OK): {e}', fg='yellow'))


# -- commands -------------------------------------------------------------------------------------

@click.group()
def client():
    """Offscreen test client: run, drive and screenshot the real patched client (F-219)."""
    pass


@client.command('setup')
@click.option('--realm', default='192.168.0.55', show_default=True, help='realmlist address')
def client_setup(realm):
    """Build or refresh the test client environment. Idempotent.

    One-time per machine. After that, exe deploys, WXL ships and patch builds refresh the client
    themselves (refresh_if_present); PATCH-*.MPQ are symlinks into nginx so rebuilds need nothing.
    """
    if not (WINE_DIR / 'bin/wine').exists():
        raise click.ClickException(f'Wine not found at {WINE_DIR} (Joplin: Retroport Toolchain)')

    if not (XROOT / 'bin/Xvfb').exists() or not (XROOT / 'bin/xdotool').exists():
        click.echo('== fetching Xvfb/xdotool .debs')
        for deb in _fetch_debs():
            subprocess.run(['dpkg-deb', '-x', str(deb), str(XROOT.parent)], check=True)
    if _patch_xvfb():
        click.echo('patched Xvfb xkbcomp dir -> /tmp/xkb')

    click.echo(f'== assembling {CLIENT_DIR}')
    data = CLIENT_DIR / 'Data'
    (data / 'enUS').mkdir(parents=True, exist_ok=True)
    (CLIENT_DIR / 'WTF').mkdir(exist_ok=True)

    # Speech MPQs were left out when STOCK/MPQ was extracted; the client won't start without them.
    for n in SPEECH_MPQS:
        dst = STOCK / 'MPQ/enUS' / f'{n}.MPQ'
        if not dst.exists():
            click.echo(f'   extracting {n}.MPQ from the client zip')
            with zipfile.ZipFile(STOCK / f'{CLIENT_ZIP_ROOT}.zip') as z, \
                    z.open(f'{CLIENT_ZIP_ROOT}/Data/enUS/{n}.MPQ') as a, open(dst, 'wb') as b:
                shutil.copyfileobj(a, b, 1 << 22)
    for f in sorted((STOCK / 'MPQ').glob('*.MPQ')):
        _link(f, data)
    for f in sorted((STOCK / 'MPQ/enUS').glob('*.MPQ')):
        _link(f, data / 'enUS')

    # Our patches (symlinked) + exe/WXL (copied) = exactly what the launcher serves.
    refresh_files()
    for f in (STOCK / 'files/enUS/base-enUS').glob('*.dll'):   # DivxDecoder etc.
        if not (CLIENT_DIR / f.name).exists():                  # never overwrite WXL's d3d9.dll
            shutil.copy2(f, CLIENT_DIR)

    (data / 'enUS/realmlist.wtf').write_text(f'set realmlist {realm}\n')
    cfg = CLIENT_DIR / 'WTF/Config.wtf'
    if not cfg.exists():
        cfg.write_text('\n'.join(f'SET {k} "{v}"' for k, v in [
            ('gxWindow', 1), ('gxMaximize', 0), ('gxResolution', '1280x800'), ('readTOS', 1),
            ('readEULA', 1), ('readTerminationWithoutNotice', 1), ('locale', 'enUS'),
            ('checkAddonVersion', 0), ('movie', 0), ('Sound_EnableAllSound', 0), ('hwDetect', 0),
            ('accounttype', 'LK'), ('realmList', realm)]) + '\n')

    if not ACCOUNT_FILE.exists():
        click.echo('NOTE: no test account yet - run: zep client account')
    click.echo(click.style('== done. next: zep client start --wait', fg='green'))


@client.command('refresh')
def client_refresh():
    """Re-sync exe/WXL copies and PATCH links from nginx (setup without the downloads).

    Builds call this automatically; run it by hand after copying files into nginx another way.
    """
    _require_setup()
    n = refresh_files()
    click.echo(f'{n} file(s) updated' if n else 'already current')


@client.command('account')
@click.argument('username', default='ZEPTEST')
def client_account(username):
    """Create the NON-GM test account and store its credentials in the client dir.

    Non-GM on purpose: GMs see every phase, which masks wrong-phase bugs. The password is random
    and lives only in account.txt (0600, untracked).
    """
    from commands.account import create_account
    if ACCOUNT_FILE.exists():
        raise click.ClickException(f'{ACCOUNT_FILE} already exists - the harness already has an account')
    password = secrets.token_hex(6).upper()
    account_id = create_account(username, password)
    CLIENT_DIR.mkdir(parents=True, exist_ok=True)
    ACCOUNT_FILE.write_text(f'{username.upper()}\n{password}\n')
    ACCOUNT_FILE.chmod(0o600)
    click.echo(click.style(f'created {username.upper()} (id {account_id}); credentials in {ACCOUNT_FILE}',
                           fg='green'))


KEEP_LOGS = 20
LOG_DIR = CLIENT_DIR / 'Logs/wine'


def _new_run_log():
    """Per-run Wine log (Logs/wine/wine-<time>.log); wine.log -> newest. Keeps the last KEEP_LOGS so
    a crash's log survives the next run. Crash reports go to Errors/ with the same timestamps."""
    LOG_DIR.mkdir(parents=True, exist_ok=True)
    path = LOG_DIR / time.strftime('wine-%Y%m%d-%H%M%S.log')
    latest = CLIENT_DIR / 'wine.log'
    if latest.is_symlink() or latest.exists():
        latest.unlink()
    latest.symlink_to(path)
    for old in sorted(LOG_DIR.glob('wine-*.log'))[:-KEEP_LOGS]:
        old.unlink()
    return path


def _latest_crash():
    crashes = sorted((CLIENT_DIR / 'Errors').glob('* Crash.txt'), key=lambda p: p.stat().st_mtime)
    return crashes[-1] if crashes else None


def _start(timeout, opengl, no_wxl, wait):
    _require_setup()
    _xvfb_up()
    if opengl and not no_wxl:
        # WXL's EnsureDeviceHooks reads the D3D9 device field of gx; in OpenGL mode that field is
        # garbage (0x84F5) and WXL faults within seconds (#132 at WarcraftXL.dll RVA 0x47A5, I-381).
        click.echo(click.style('  --opengl implies --no-wxl (WarcraftXL is D3D9-only)', fg='yellow'))
        no_wxl = True
    log_path = _new_run_log()
    log = open(log_path, 'w')
    cmd = ['timeout', str(timeout), str(WINE_DIR / 'bin/wine'), 'Wow.exe'] + (['-opengl'] if opengl else [])
    subprocess.Popen(cmd, cwd=CLIENT_DIR, env=_wine_env(no_wxl), stdout=log, stderr=log,
                     start_new_session=True)
    if wait and not _wait_window(wait):
        raise click.ClickException(f'no client window after {wait}s - see {log_path}')
    return log_path


def _stop():
    subprocess.run([str(WINE_DIR / 'bin/wineserver'), '-k'], env=_wine_env(), capture_output=True)


@client.command('start')
@click.option('--timeout', default=3600, show_default=True, help='kill the client after N seconds')
@click.option('--opengl', is_flag=True, help='client OpenGL mode instead of D3D9 (bypasses wined3d; implies --no-wxl)')
@click.option('--no-wxl', is_flag=True, help='use Wine builtin d3d9, skipping the WarcraftXL proxy')
@click.option('--wait', default=0, help='block until the client window exists (max N seconds)')
def client_start(timeout, opengl, no_wxl, wait):
    """Launch the client in the background on the virtual display."""
    log_path = _start(timeout, opengl, no_wxl, wait)
    click.echo(f'client started on {DISPLAY} (log: {log_path})')


@client.command('stop')
def client_stop():
    """Kill the client (wineserver -k).

    Don't use `pkill -f Wow.exe` from a shell: it matches and kills the calling shell.
    """
    _stop()
    click.echo('client stopped')


@client.command('status')
def client_status():
    """Show whether the display and the client window are up."""
    up = _display_up()
    click.echo(f'display {DISPLAY}: {"up" if up else "down"}')
    geom = _window_geom() if up else None
    click.echo(f'client window: {"%d,%d %dx%d" % geom if geom else "none"}')
    click.echo(f'test account: {ACCOUNT_FILE.read_text().split()[0] if ACCOUNT_FILE.exists() else "none"}')
    latest = CLIENT_DIR / 'wine.log'
    click.echo(f'latest wine log: {os.readlink(latest) if latest.is_symlink() else "none"}')
    crash = _latest_crash()
    if crash:
        when = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(crash.stat().st_mtime))
        click.echo(f'latest crash: {crash} ({when}) - client crashes go to the I-381 session')


def _shot(out, full=False):
    geom = None if full else _window_geom()
    grab(out, geom)
    return geom


@client.command('shot')
@click.argument('out', type=click.Path(dir_okay=False))
@click.option('--full', is_flag=True, help='whole virtual screen instead of the client window')
def client_shot(out, full):
    """Screenshot the client window to a PNG (XGetImage - never xwd, see I-380)."""
    _shot(out, full)
    click.echo(out)


def _login(enter_world, charselect_wait):
    if not ACCOUNT_FILE.exists():
        raise click.ClickException('no test account - run: zep client account')
    user, password = ACCOUNT_FILE.read_text().split()[:2]
    geom = _window_geom()
    if not geom:
        raise click.ClickException('client window not found - zep client start --wait 120')
    x, y, w, h = geom
    # Account-name box on the 3.3.5 login screen, relative to the window.
    _xtool('xdotool', 'mousemove', str(x + w // 2), str(y + h * 431 // 800), 'click', '1')
    time.sleep(1)
    _xtool('xdotool', 'type', '--delay', '60', user)
    _xtool('xdotool', 'key', 'Tab')
    _xtool('xdotool', 'type', '--delay', '60', password)
    _xtool('xdotool', 'key', 'Return')
    if enter_world:
        time.sleep(charselect_wait)
        _xtool('xdotool', 'key', 'Return')


@client.command('login')
@click.option('--enter-world', is_flag=True, help='press Enter at character select (first character)')
@click.option('--charselect-wait', default=40, show_default=True)
def client_login(enter_world, charselect_wait):
    """Type the stored test-account credentials into the login screen."""
    _login(enter_world, charselect_wait)
    click.echo('login sent' + (' and entering world' if enter_world else ''))


@client.command('drive')
@click.argument('outdir', type=click.Path(file_okay=False))
@click.option('--login-wait', default=60, show_default=True, help='seconds from launch to login screen')
@click.option('--charselect-wait', default=40, show_default=True)
@click.option('--world-wait', default=90, show_default=True)
def client_drive(outdir, login_wait, charselect_wait, world_wait):
    """Launch -> login -> character select -> world, a screenshot per stage.

    Leaves the client running in-world; `zep client stop` when done. Waits are generous because
    llvmpipe is slow.
    """
    out = Path(outdir)
    out.mkdir(parents=True, exist_ok=True)
    _stop()
    time.sleep(2)
    _start(3600, False, False, wait=120)
    stages = [('01-login', login_wait, None),
              ('02-charselect', charselect_wait, lambda: _login(False, 0)),
              ('03-world', world_wait, lambda: _xtool('xdotool', 'key', 'Return')),
              ('04-world-settled', 30, None)]
    for name, wait, action in stages:
        if action:
            action()
        time.sleep(wait)
        _shot(out / f'{name}.png')
        click.echo(f'shot {name}')


@client.command('measure')
@click.argument('pngs', nargs=-1, required=True, type=click.Path(exists=True, dir_okay=False))
def client_measure(pngs):
    """Colour sanity numbers: channel means, saturation, adjacent-column delta."""
    for p in pngs:
        r, g, b, sat, dmean, dmax = measure(p)
        click.echo(f'{Path(p).name}: RGB means {r:.1f} {g:.1f} {b:.1f}  mean sat {sat:.3f}  '
                   f'col-delta mean {dmean:.2f} max {dmax:.1f}')


@client.command('selftest')
def client_selftest():
    """Prove the capture path reads colour correctly (I-380 regression check).

    Draws known R/G/B/W bars with XPutImage into a window WITH a private colormap - the case that
    made xwd emit 24bpp - captures it with XGetImage and checks every bar. Needs no client.
    """
    _require_setup()
    _xvfb_up()
    x = _x11()
    vp = ctypes.c_void_p
    x.XDefaultVisual.restype = vp
    x.XDefaultVisual.argtypes = [vp, ctypes.c_int]
    x.XCreateColormap.restype = ctypes.c_ulong
    x.XCreateColormap.argtypes = [vp, ctypes.c_ulong, vp, ctypes.c_int]

    class SetWindowAttributes(ctypes.Structure):
        _fields_ = [('bg_pixmap', ctypes.c_ulong), ('bg_pixel', ctypes.c_ulong),
                    ('border_pixmap', ctypes.c_ulong), ('border_pixel', ctypes.c_ulong),
                    ('bit_gravity', ctypes.c_int), ('win_gravity', ctypes.c_int),
                    ('backing_store', ctypes.c_int), ('backing_planes', ctypes.c_ulong),
                    ('backing_pixel', ctypes.c_ulong), ('save_under', ctypes.c_int),
                    ('event_mask', ctypes.c_long), ('dnp', ctypes.c_long), ('override', ctypes.c_int),
                    ('colormap', ctypes.c_ulong), ('cursor', ctypes.c_ulong)]

    x.XCreateWindow.restype = ctypes.c_ulong
    x.XCreateWindow.argtypes = [vp, ctypes.c_ulong, ctypes.c_int, ctypes.c_int, ctypes.c_uint,
                                ctypes.c_uint, ctypes.c_uint, ctypes.c_int, ctypes.c_uint, vp,
                                ctypes.c_ulong, ctypes.c_void_p]
    x.XMapWindow.argtypes = x.XDestroyWindow.argtypes = [vp, ctypes.c_ulong]
    x.XSync.argtypes = [vp, ctypes.c_int]
    x.XCreateGC.restype = vp
    x.XCreateGC.argtypes = [vp, ctypes.c_ulong, ctypes.c_ulong, vp]
    x.XCreateImage.restype = vp
    x.XCreateImage.argtypes = [vp, vp, ctypes.c_uint, ctypes.c_int, ctypes.c_int, ctypes.c_char_p,
                               ctypes.c_uint, ctypes.c_uint, ctypes.c_int, ctypes.c_int]
    x.XPutImage.argtypes = [vp, ctypes.c_ulong, vp, vp] + [ctypes.c_int] * 4 + [ctypes.c_uint] * 2

    d = x.XOpenDisplay(DISPLAY.encode())
    root, vis = x.XDefaultRootWindow(d), x.XDefaultVisual(d, 0)
    swa = SetWindowAttributes(colormap=x.XCreateColormap(d, root, vis, 0))
    win = x.XCreateWindow(d, root, 0, 0, 400, 100, 0, 24, 1, vis, 0x2000 | 0x8, ctypes.byref(swa))
    x.XMapWindow(d, win)
    x.XSync(d, 0)
    time.sleep(0.5)
    bars = [(255, 0, 0), (0, 255, 0), (0, 0, 255), (255, 255, 255)]
    buf = bytearray()
    for _ in range(100):
        for i in range(400):
            r, g, b = bars[i // 100]
            buf += bytes((b, g, r, 0))
    cbuf = (ctypes.c_char * len(buf)).from_buffer(buf)
    img = x.XCreateImage(d, vis, 24, 2, 0, ctypes.cast(cbuf, ctypes.c_char_p), 400, 100, 32, 0)
    x.XPutImage(d, win, x.XCreateGC(d, win, 0, None), img, 0, 0, 0, 0, 400, 100)
    x.XSync(d, 0)
    time.sleep(0.5)
    shot = grab('/tmp/zep-client-selftest.png', (0, 0, 400, 100))
    x.XDestroyWindow(d, win)
    x.XCloseDisplay(d)

    got = [shot.getpixel((i * 100 + 50, 50)) for i in range(4)]
    if got != bars:
        raise click.ClickException(f'capture garbled: expected {bars}, got {got} (see I-380)')
    click.echo(click.style('capture path OK (private-colormap window reads back exact R/G/B/W)', fg='green'))
