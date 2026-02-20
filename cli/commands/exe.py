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
        deploy_path = NGINX_PATH / 'mandatory' / 'Wow.exe'
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

    elif deploy and dry_run:
        click.echo()
        click.echo("[DRY RUN] Would deploy patched exe to nginx/mandatory/Wow.exe")
