"""
Zeppelin launcher build and release (F-167, self-update F-224).

Commands:
    zep build launcher build                      make build (Windows + Linux) into Launcher/dist
    zep build launcher ship [--dry-run] [--activate]
                                                  publish dist/ to nginx/wow/LAUNCHER/ and the register's
                                                  "launcher" block, which launchers >= 3.1.0 self-update from

The release version is AppVersion in Launcher/config.go. LAUNCHER/ is also where players download the
launcher by hand, so nothing is copied there without --activate.
"""

import hashlib
import json
import re
import shutil
import subprocess
from datetime import datetime, timezone
from pathlib import Path

import click

# Published name per OS (the self-update block's "file", served from LAUNCHER/) -> dist/ build output.
LAUNCHER_ASSETS = {'windows': 'Zeppelin.exe', 'linux': 'Zeppelin'}
SERVE_DIR = 'LAUNCHER'


def _launcher_dir(ctx) -> Path:
    return ctx.obj['craft_root'] / 'Launcher'


def _app_version(launcher_dir: Path) -> str:
    m = re.search(r'AppVersion\s*=\s*"([^"]+)"', (launcher_dir / 'config.go').read_text())
    if not m:
        raise click.ClickException('AppVersion not found in Launcher/config.go')
    return m.group(1)


def _version_key(v: str):
    return tuple(int(x) if x.isdigit() else 0 for x in v.split('.'))


def _md5(path: Path) -> str:
    h = hashlib.md5()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 16), b''):
            h.update(chunk)
    return h.hexdigest()


@click.group()
def launcher():
    """Zeppelin launcher build and release"""
    pass


@launcher.command('build')
@click.pass_context
def launcher_build(ctx):
    """Run the launcher tests, then build both binaries into Launcher/dist."""
    d = _launcher_dir(ctx)
    for step in (['go', 'test', './...'], ['make', 'build']):
        click.echo('$ ' + ' '.join(step))
        if subprocess.run(step, cwd=d).returncode != 0:
            raise click.ClickException(f"{' '.join(step)} failed")
    version = _app_version(d)
    for os_name, name in LAUNCHER_ASSETS.items():
        p = d / 'dist' / name
        click.echo(f"  {os_name:8} dist/{name:13} {p.stat().st_size / 1048576:6.2f} MB  md5={_md5(p)}")
    click.echo(click.style(f"Launcher v{version} built", fg='green'))


@launcher.command('ship')
@click.option('--dist', 'dist_dir', type=click.Path(file_okay=False, path_type=Path),
              help='Directory holding the binaries (default Launcher/dist)')
@click.option('--dry-run', '-n', is_flag=True, help='Show what would happen')
@click.option('--activate', is_flag=True,
              help='Copy the binaries to LAUNCHER/ and write the register block (players get it)')
@click.pass_context
def launcher_ship(ctx, dist_dir, dry_run, activate):
    """Publish the launcher binaries and the register's self-update block.

    Identical binaries at the registered version: nothing to do. Changed binaries need a higher
    AppVersion, otherwise launchers would never pick them up.
    """
    from lib.env import NGINX_PATH
    from lib.patch_register import load_register, save_register

    d = _launcher_dir(ctx)
    dist_dir = dist_dir or d / 'dist'
    version = _app_version(d)
    assets = {}
    for os_name, name in LAUNCHER_ASSETS.items():
        p = dist_dir / name
        if not p.is_file():
            raise click.ClickException(f"{p} missing: run `zep build launcher build`")
        assets[os_name] = {'file': name, 'checksum': _md5(p), 'size_mb': round(p.stat().st_size / 1048576, 2)}

    register = load_register(NGINX_PATH)
    prev = register.get('launcher')
    if prev:
        same = all(prev.get(o, {}).get('checksum') == a['checksum'] for o, a in assets.items())
        if same and prev.get('version') == version:
            click.echo(click.style(f"launcher v{version}: unchanged - nothing to do", fg='cyan'))
            return
        if _version_key(version) <= _version_key(prev.get('version', '0')):
            raise click.ClickException(
                f"AppVersion {version} is not above the registered {prev.get('version')}, so launchers would not "
                "update: bump AppVersion in Launcher/config.go and rebuild")

    block = {'version': version, **assets,
             'last_modified': datetime.now(timezone.utc).strftime('%Y-%m-%dT%H:%M:%SZ')}
    click.echo(f"launcher: {prev.get('version') if prev else 'not registered'} -> v{version}")
    click.echo(json.dumps({'launcher': block}, indent=2))

    if dry_run or not activate:
        click.echo('[DRY RUN] nothing copied or registered' if dry_run else
                   'Not activated: rerun with --activate to copy to LAUNCHER/ and register it')
        return

    dest = NGINX_PATH / SERVE_DIR
    dest.mkdir(parents=True, exist_ok=True)
    for a in assets.values():
        tmp = dest / (a['file'] + '.tmp')
        shutil.copy2(dist_dir / a['file'], tmp)
        tmp.replace(dest / a['file'])  # never serve a half-copied binary
        click.echo(f"  staged {SERVE_DIR}/{a['file']}")
    register['launcher'] = block
    save_register(register, NGINX_PATH)
    click.echo(click.style(f"launcher v{version} registered - launchers >= 3.1.0 update themselves", fg='yellow'))
