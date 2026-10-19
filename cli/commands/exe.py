"""
WoW.exe binary patcher for Zeppelin-Craft CLI.

Commands:
    zep exe list                         Show all patches with enabled/disabled status
    zep exe verify [--source PATH]       Check exe against all patches
    zep exe patch [--dry-run] [options]  Apply patches to stock exe
"""

import shutil
from datetime import datetime
from pathlib import Path

import click

from lib.exe_patcher import (
    apply_all,
    check_patch,
    load_patches,
    parse_hex,
    validate_base,
)


def _get_paths(ctx):
    """Resolve standard paths from craft_root."""
    craft_root = ctx.obj['craft_root']
    exe_dir = craft_root / 'EXE Patching'
    return {
        'exe_dir': exe_dir,
        'patches_json': exe_dir / 'patches.json',
        'stock_exe': exe_dir / 'Chromie EXE' / 'Wow.exe',
        'output_exe': exe_dir / 'patched' / 'Wow.exe',
    }


@click.group()
def exe():
    """WoW.exe binary patcher"""
    pass


@exe.command('list')
@click.pass_context
def exe_list(ctx):
    """Show all patches with enabled/disabled status."""
    paths = _get_paths(ctx)

    if not paths['patches_json'].exists():
        raise click.ClickException(f"patches.json not found at {paths['patches_json']}")

    config = load_patches(paths['patches_json'])

    click.echo(f"Base exe: {config['base_exe']['md5']} ({config['base_exe']['size']:,} bytes)")
    click.echo()

    enabled_count = 0
    disabled_count = 0

    for patch in config['patches']:
        enabled = patch['enabled']
        if enabled:
            enabled_count += 1
            status = click.style('ON ', fg='green')
        else:
            disabled_count += 1
            status = click.style('OFF', fg='yellow')

        edit_count = len(patch['edits'])
        total_bytes = sum(len(parse_hex(e['original'])) for e in patch['edits'])

        requires = ''
        if patch.get('requires'):
            requires = click.style(f" (requires: {', '.join(patch['requires'])})", fg='cyan')

        click.echo(f"  [{status}] {patch['name']:30s} {edit_count:3d} edits, {total_bytes:4d} bytes{requires}")

    click.echo()
    click.echo(f"Total: {len(config['patches'])} patches ({enabled_count} enabled, {disabled_count} disabled)")


@exe.command('verify')
@click.option('--source', type=click.Path(exists=True), help='Exe to verify (default: stock)')
@click.pass_context
def exe_verify(ctx, source):
    """Check an exe against all patches (clean/applied/conflict)."""
    paths = _get_paths(ctx)

    if not paths['patches_json'].exists():
        raise click.ClickException(f"patches.json not found at {paths['patches_json']}")

    source_path = source or paths['stock_exe']
    if not source and not paths['stock_exe'].exists():
        raise click.ClickException(f"Stock exe not found at {paths['stock_exe']}")

    config = load_patches(paths['patches_json'])

    with open(source_path, 'rb') as f:
        data = f.read()

    # Validate base
    ok, msg = validate_base(data, config['base_exe'])
    if ok:
        click.echo(click.style(f"Base: {msg}", fg='green'))
    else:
        click.echo(click.style(f"Base: {msg}", fg='yellow'))
    click.echo()

    clean = 0
    applied = 0
    partial = 0
    conflict = 0

    for patch in config['patches']:
        status, details = check_patch(data, patch)

        if status == 'clean':
            clean += 1
            icon = click.style('clean   ', fg='green')
        elif status == 'applied':
            applied += 1
            icon = click.style('applied ', fg='cyan')
        elif status == 'partial':
            partial += 1
            n_clean = sum(1 for _, s in details if s == 'clean')
            n_applied = sum(1 for _, s in details if s == 'applied')
            n_conflict = sum(1 for _, s in details if s == 'conflict')
            icon = click.style(f'partial ', fg='yellow')
            icon += f'({n_clean}c/{n_applied}a/{n_conflict}x)'
        elif status == 'conflict':
            conflict += 1
            conflict_offsets = [e['offset'] for e, s in details if s == 'conflict']
            icon = click.style('CONFLICT', fg='red')
            icon += f' at {", ".join(conflict_offsets[:3])}'
            if len(conflict_offsets) > 3:
                icon += f' +{len(conflict_offsets) - 3} more'

        enabled = '*' if patch['enabled'] else ' '
        click.echo(f"  {enabled} {patch['name']:30s} {icon}")

    click.echo()
    click.echo(f"Summary: {clean} clean, {applied} applied, {partial} partial, {conflict} conflict")


@exe.command('patch')
@click.option('--dry-run', is_flag=True, help='Preview changes without writing')
@click.option('--only', multiple=True, help='Only apply these patches (by name)')
@click.option('--exclude', multiple=True, help='Skip these patches (by name)')
@click.option('--output', type=click.Path(), help='Output path (default: EXE Patching/patched/Wow.exe)')
@click.option('--all', 'include_all', is_flag=True, help='Include disabled patches too')
@click.option('--deploy', is_flag=True, help='Deploy patched exe to nginx for launcher distribution')
@click.pass_context
def exe_patch(ctx, dry_run, only, exclude, output, include_all, deploy):
    """Apply patches to the stock exe.

    By default applies all enabled patches. Use --only or --exclude to customize.

    Examples:
        zep exe patch                    Apply all enabled patches
        zep exe patch --dry-run          Preview what would be applied
        zep exe patch --only occluder    Apply only the occluder patch
        zep exe patch --all              Include disabled patches too
    """
    paths = _get_paths(ctx)

    if not paths['patches_json'].exists():
        raise click.ClickException(f"patches.json not found at {paths['patches_json']}")
    if not paths['stock_exe'].exists():
        raise click.ClickException(f"Stock exe not found at {paths['stock_exe']}")

    output_path = output or str(paths['output_exe'])

    # If --all, load all patch names into 'only'
    if include_all and not only:
        config = load_patches(paths['patches_json'])
        only = tuple(p['name'] for p in config['patches'])

    result = apply_all(
        base_path=paths['stock_exe'],
        patches_json_path=paths['patches_json'],
        output_path=output_path,
        only=set(only) if only else None,
        exclude=set(exclude) if exclude else None,
        dry_run=dry_run,
    )

    if not result['base_valid']:
        raise click.ClickException(result['error'])

    if result.get('error'):
        raise click.ClickException(result['error'])

    prefix = '[DRY RUN] ' if dry_run else ''

    # Show results
    if result['patches_applied']:
        click.echo(f"{prefix}Applied patches:")
        for p in result['patches_applied']:
            detail = f"{p['edits_applied']} edits"
            if p['edits_skipped']:
                detail += f" ({p['edits_skipped']} already applied)"
            click.echo(click.style(f"  + {p['name']:30s} {detail}", fg='green'))

    if result['patches_skipped']:
        click.echo(f"\n{prefix}Skipped (already applied):")
        for p in result['patches_skipped']:
            click.echo(click.style(f"  = {p['name']}", fg='cyan'))

    if result['patches_failed']:
        click.echo(f"\n{prefix}Failed:")
        for p in result['patches_failed']:
            click.echo(click.style(f"  x {p['name']:30s} {p['reason']}", fg='red'))

    click.echo()
    click.echo(f"{prefix}Total: {result['total_edits']} edits applied across "
               f"{len(result['patches_applied'])} patches")

    if result.get('output_md5'):
        click.echo(f"Output: {output_path}")
        click.echo(f"MD5:    {result['output_md5']}")

    # Deploy to nginx if requested
    if deploy and not dry_run and result.get('output_md5'):
        from lib.env import NGINX_PATH
        from lib.patch_register import load_register, save_register, update_exe_entry

        exe_file = Path(output_path)
        deploy_path = NGINX_PATH / 'EXE' / 'Wow.exe'
        backup_dir = NGINX_PATH / 'backup'

        click.echo()

        # Backup existing
        if deploy_path.exists():
            backup_dir.mkdir(exist_ok=True)
            timestamp = datetime.now().strftime('%Y%m%d_%H%M%S')
            backup_path = backup_dir / f'Wow.exe.{timestamp}'
            shutil.copy2(deploy_path, backup_path)
            click.echo(click.style(f"  Backed up existing exe to {backup_path.name}", fg='cyan'))

        # Copy patched exe to nginx
        deploy_path.parent.mkdir(exist_ok=True)
        shutil.copy2(exe_file, deploy_path)
        size_mb = deploy_path.stat().st_size / (1024 * 1024)
        click.echo(click.style(f"  Deployed to {deploy_path} ({size_mb:.1f} MB)", fg='green'))

        # Update patch register
        register = load_register(NGINX_PATH)
        entry = update_exe_entry(register, deploy_path)
        save_register(register, NGINX_PATH)
        click.echo(click.style(f"  Updated patch register: Wow.exe v{entry['version']}", fg='green'))

        from commands.client import refresh_if_present
        refresh_if_present()   # F-219: keep the offscreen test client on the deployed exe

    elif deploy and dry_run:
        click.echo()
        click.echo("[DRY RUN] Would deploy patched exe to nginx/EXE/Wow.exe")


# ─── Source-built client (F-223 build, F-224 launcher migration) ────────────────────────────────────
# The decompiled client (Zeppelin-Tools/wowdecomp-build, forge zpak wowdecomp-client) builds to an x64
# WowClient64.exe plus XvidDecoder.dll. The build is reproducible (no link timestamp, SOURCE_DATE_EPOCH
# = the source commit), so an unchanged source rebuilds byte-identical and `ship` can tell a real
# change from a recompile by checksum alone.

SOURCE_BUILD_DIR = Path('/workspace/project/Zeppelin-Tools/wowdecomp-build')
SOURCE_KEY = 'WowClient64'                        # register bundle key
SOURCE_MEMBERS = ['WowClient64.exe', 'XvidDecoder.dll']
SOURCE_SERVE_DIR = 'EXE64'                        # nginx/wow/EXE64/
SOURCE_ZPAK = 'wowdecomp-client'
SOURCE_STAMP = 'build-source.json'               # written by `build`, checked by `ship`


def _git(*args) -> str:
    import subprocess
    return subprocess.run(['git', '-C', str(SOURCE_BUILD_DIR / 'src'), *args],
                          capture_output=True, text=True, check=True).stdout.strip()


def _source_state(craft_root: Path) -> dict:
    """Source revision and whether every commit on it is captured as a forge patch."""
    patches = sorted((craft_root / 'zpaks' / SOURCE_ZPAK / 'patches').glob('*.patch'))
    ours = int(_git('rev-list', '--count', 'upstream/main..HEAD'))
    return {
        'head': _git('rev-parse', '--short', 'HEAD'),
        'upstream': _git('rev-parse', '--short', 'upstream/main'),
        'dirty': bool(_git('status', '--porcelain', '--untracked-files=no')),
        'ours': ours,
        'patches': len(patches),
    }


def _md5(path: Path) -> str:
    import hashlib
    h = hashlib.md5()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(1 << 16), b''):
            h.update(chunk)
    return h.hexdigest()


def _source_members() -> dict:
    out = SOURCE_BUILD_DIR / 'src' / 'bin' / 'Win'
    meta = {}
    for name in SOURCE_MEMBERS:
        path = out / name
        if not path.is_file():
            raise click.ClickException(f"{path} missing - run `zep build exe source build` first")
        meta[name] = {'path': path, 'checksum': _md5(path), 'size_mb': round(path.stat().st_size / (1024 * 1024), 2)}
    return meta


def _combined(meta: dict) -> str:
    import hashlib
    return hashlib.md5(''.join(meta[n]['checksum'] for n in SOURCE_MEMBERS).encode()).hexdigest()


@exe.group('source')
def exe_source():
    """Source-built x64 client (wowdecomp, F-223/F-224): reproducible build and hash-checked shipping."""


@exe_source.command('build')
@click.pass_context
def exe_source_build(ctx):
    """Build WowClient64.exe from the source tree as it is (uncommitted edits included, for testing).

    Writes bin/Win/build-source.json beside the output: the source revision, whether src had
    uncommitted edits, and whether every commit is captured as a wowdecomp-client patch. `ship` reads
    it and refuses a build that is not reproducible from Zeppelin-Craft.
    """
    import json
    import subprocess
    state = _source_state(ctx.obj['craft_root'])
    captured = not state['dirty'] and state['ours'] == state['patches']
    click.echo(f"source {state['head']} = upstream {state['upstream']} + {state['ours']} commit(s); "
               f"{state['patches']} forge patch(es){'' if captured else ' - TEST BUILD (uncaptured source, not shippable)'}")
    rc = subprocess.call(['bash', str(SOURCE_BUILD_DIR / 'build.sh')])
    if rc != 0:
        raise click.ClickException(f"build.sh failed (exit {rc}); see {SOURCE_BUILD_DIR / 'build.log'}")
    meta = _source_members()
    stamp = dict(state, captured=captured, files={n: meta[n]['checksum'] for n in SOURCE_MEMBERS})
    (SOURCE_BUILD_DIR / 'src' / 'bin' / 'Win' / SOURCE_STAMP).write_text(json.dumps(stamp, indent=2))
    for name in SOURCE_MEMBERS:
        click.echo(f"  {name:18s} {meta[name]['size_mb']:6.2f} MB  md5={meta[name]['checksum']}")
    click.echo(f"  combined           md5={_combined(meta)}")


@exe_source.command('ship')
@click.option('--activate', is_flag=True,
              help='Write the register entry: the launcher then pushes the client to players. Default: stage only.')
@click.option('--dry-run', is_flag=True, help='Report only; copy nothing.')
@click.pass_context
def exe_source_ship(ctx, activate, dry_run):
    """Stage the built client for the launcher, skipping an identical rebuild.

    The combined checksum of WowClient64.exe and XvidDecoder.dll is compared with the registered
    WowClient64 entry. Identical: nothing is staged and the version is not bumped. Changed: the members
    are copied to nginx/wow/EXE64/ and the entry that --activate would write (version + 1) is printed.
    Refuses a test build (one made from uncommitted or uncaptured source).
    """
    from lib.env import NGINX_PATH
    from lib.patch_register import format_version, load_register, next_version, save_register

    import json
    state = _source_state(ctx.obj['craft_root'])
    meta = _source_members()
    stamp_path = SOURCE_BUILD_DIR / 'src' / 'bin' / 'Win' / SOURCE_STAMP
    stamp = json.loads(stamp_path.read_text()) if stamp_path.is_file() else None
    # Only a build of fully captured source ships: reproducible from Zeppelin-Craft, and the binaries
    # on disk are the ones that build produced.
    if not stamp or not stamp.get('captured'):
        raise click.ClickException("the current build is a test build (uncaptured source) or has no stamp: "
                                   f"commit in src, `zep forge build-patch --name {SOURCE_ZPAK}`, then "
                                   "`zep build exe source build` again")
    if stamp.get('head') != state['head'] or stamp.get('files') != {n: meta[n]['checksum'] for n in SOURCE_MEMBERS}:
        raise click.ClickException("bin/Win does not match the stamped build (source moved or files changed): rebuild")
    combined = _combined(meta)
    register = load_register(NGINX_PATH)
    prev = register.get('patches', {}).get(SOURCE_KEY)

    if prev and prev.get('checksum') == combined:
        click.echo(click.style(
            f"{SOURCE_KEY}: unchanged (v{format_version(prev['version'])}, md5 {combined}) - identical "
            "build, nothing staged, no version bump", fg='cyan'))
        return

    entry = {
        'name': 'Zeppelin Client (x64 source build)',
        'description': 'WowClient64.exe built from the wowdecomp source with the Zeppelin extensions',
        'requires': [],
        'required_for': [],
        'build_source': 'wowdecomp',
        'version': next_version(prev.get('version', 0) if prev else 0),
        'size_mb': round(sum(meta[n]['size_mb'] for n in SOURCE_MEMBERS), 2),
        'checksum': combined,
        'source': f"{state['head']} (upstream {state['upstream']} + {state['patches']} patches)",
        'last_modified': datetime.utcnow().isoformat() + 'Z',
        'files': [{'name': n, 'checksum': meta[n]['checksum'], 'size_mb': meta[n]['size_mb']} for n in SOURCE_MEMBERS],
    }
    was = f"v{format_version(prev['version'])} md5 {prev.get('checksum')}" if prev else 'not registered'
    click.echo(f"{SOURCE_KEY}: changed ({was} -> md5 {combined})")

    if dry_run:
        click.echo(f"[DRY RUN] would stage {', '.join(SOURCE_MEMBERS)} to {NGINX_PATH / SOURCE_SERVE_DIR}")
    else:
        dest = NGINX_PATH / SOURCE_SERVE_DIR
        dest.mkdir(parents=True, exist_ok=True)
        for name in SOURCE_MEMBERS:
            shutil.copy2(meta[name]['path'], dest / name)
            click.echo(f"  staged {SOURCE_SERVE_DIR}/{name}")
        from commands.client import refresh_if_present
        refresh_if_present()   # F-219: keep the offscreen test client on the staged exe (I-413)

    if activate and not dry_run:
        register.setdefault('patches', {})[SOURCE_KEY] = entry
        save_register(register, NGINX_PATH)
        click.echo(click.style(f"{SOURCE_KEY}: registered v{format_version(entry['version'])} - the launcher will push it", fg='yellow'))
    else:
        import json
        click.echo("Entry --activate would write:")
        click.echo(json.dumps({SOURCE_KEY: entry}, indent=2))
