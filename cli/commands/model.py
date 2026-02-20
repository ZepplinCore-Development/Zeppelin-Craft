"""
M2 model tools for Zeppelin-Craft CLI.

Commands:
    zep model shift <path> --dz -0.5                       Single file
    zep model shift <dir> --race DR --dz -0.5              Bulk by race
    zep model shift <dir> --race DR --scale 0.9 --dz -0.1  Scale + shift
"""

import re
from pathlib import Path

import click

from lib.m2_vertex_shifter import transform_vertices


@click.group()
def model():
    """M2 model tools."""
    pass


@model.command('shift')
@click.argument('path', type=click.Path(exists=True))
@click.option('--dx', '-x', type=float, default=0.0, help='X offset')
@click.option('--dy', '-y', type=float, default=0.0, help='Y offset')
@click.option('--dz', '-z', type=float, default=0.0, help='Z offset')
@click.option('--scale', '-s', type=float, default=1.0, help='Uniform scale factor (e.g. 0.9 = 90%%)')
@click.option('--race', '-r', default=None, help='Race suffix filter (e.g. DR, Hu, Ta)')
@click.option('--gender', '-g', default=None, type=click.Choice(['M', 'F', 'm', 'f'], case_sensitive=False),
              help='Gender filter (M or F)')
@click.option('--no-backup', is_flag=True, help='Skip creating .bak backups')
def model_shift(path, dx, dy, dz, scale, race, gender, no_backup):
    """Shift and scale vertex positions in M2 model files.

    Scale is applied first (around the model centroid), then shift.
    PATH can be a single .m2 file or a directory to process in bulk.
    When targeting a directory, use --race and --gender to filter files.

    \b
    Examples:
        zep model shift helm.m2 --dz -0.5
        zep model shift helm.m2 --scale 0.9
        zep model shift helm.m2 --scale 0.9 --dz -0.1
        zep model shift ./HEAD/ --race DR --scale 0.85 --dz -0.15
    """
    if dx == 0.0 and dy == 0.0 and dz == 0.0 and scale == 1.0:
        raise click.ClickException("Nothing to do — provide at least one of --dx, --dy, --dz, --scale")

    target = Path(path)

    if target.is_file():
        _process_file(target, dx, dy, dz, scale, not no_backup)
    elif target.is_dir():
        _process_directory(target, dx, dy, dz, scale, race, gender, not no_backup)
    else:
        raise click.ClickException(f"Path is neither a file nor directory: {target}")


def _match_race_gender(filename: str, race: str | None, gender: str | None) -> bool:
    """Check if an M2 filename matches the race/gender filter.

    Handles patterns like:
        Helm_Plate_D_04_DrM.M2   (race+gender joined)
        Helm_Plate_D_04_Dr_M.M2  (race_gender separated)
    """
    stem = Path(filename).stem  # e.g. "Helm_Plate_D_04_DrM"

    if race is None:
        return True

    suffix = race.upper()
    if gender:
        suffix += gender.upper()

    # Pattern 1: *_{race}{gender}  (e.g. _DRM)
    # Pattern 2: *_{race}_{gender} (e.g. _DR_M)
    pat_joined = re.compile(r'_' + re.escape(suffix) + r'$', re.IGNORECASE)
    if pat_joined.search(stem):
        return True

    if gender:
        pat_sep = re.compile(
            r'_' + re.escape(race) + r'_' + re.escape(gender) + r'$',
            re.IGNORECASE,
        )
        if pat_sep.search(stem):
            return True

    # If only race specified (no gender), match both genders
    if not gender:
        pat_any = re.compile(r'_' + re.escape(race) + r'[MF]$', re.IGNORECASE)
        if pat_any.search(stem):
            return True
        pat_any_sep = re.compile(r'_' + re.escape(race) + r'_[MF]$', re.IGNORECASE)
        if pat_any_sep.search(stem):
            return True

    return False


def _invalidate_parsed(m2_path: Path):
    """Remove the corresponding file from parsed-assets so the next build picks up the change.

    source-assets/X/Y/file.M2  ->  parsed-assets/X/Y/FILE.M2  (uppercased by staging)
    """
    parts = m2_path.parts
    try:
        idx = parts.index('source-assets')
    except ValueError:
        return  # not inside a zpak source-assets tree

    parsed_dir = Path(*parts[:idx]) / 'parsed-assets'
    # parsed-assets normalises to uppercase path components
    rel = Path(*parts[idx + 1:])
    parsed_file = parsed_dir / Path(str(rel).upper())

    if parsed_file.exists():
        parsed_file.unlink()
        click.echo(f"       Cleared parsed cache: {parsed_file.name}")


def _format_transform(dx, dy, dz, scale):
    """Build a human-readable description of the transform."""
    parts = []
    if scale != 1.0:
        parts.append(f"scale={scale:.4f}")
    if dx != 0.0:
        parts.append(f"DX={dx:+.4f}")
    if dy != 0.0:
        parts.append(f"DY={dy:+.4f}")
    if dz != 0.0:
        parts.append(f"DZ={dz:+.4f}")
    return ', '.join(parts)


def _process_file(m2_path: Path, dx: float, dy: float, dz: float,
                  scale: float, backup: bool):
    """Transform a single M2 file and print result."""
    try:
        n = transform_vertices(m2_path, dx, dy, dz, scale=scale, backup=backup)
        click.echo(f"  {click.style('OK', fg='green')}  {m2_path.name}  ({n} vertices)")
        _invalidate_parsed(m2_path)
    except Exception as e:
        click.echo(f"  {click.style('ERR', fg='red')}  {m2_path.name}  ({e})")


def _process_directory(target: Path, dx: float, dy: float, dz: float,
                       scale: float, race: str | None, gender: str | None, backup: bool):
    """Transform all matching M2 files in a directory."""
    m2_files = sorted(target.rglob('*.[mM]2'))

    if race or gender:
        m2_files = [f for f in m2_files if _match_race_gender(f.name, race, gender)]

    if not m2_files:
        filter_desc = ""
        if race:
            filter_desc += f" race={race}"
        if gender:
            filter_desc += f" gender={gender}"
        raise click.ClickException(f"No M2 files found in {target}{filter_desc}")

    desc = _format_transform(dx, dy, dz, scale)
    click.echo(f"Transforming {len(m2_files)} file(s)  {desc}")
    click.echo()

    ok = 0
    for m2 in m2_files:
        try:
            n = transform_vertices(m2, dx, dy, dz, scale=scale, backup=backup)
            click.echo(f"  {click.style('OK', fg='green')}  {m2.name}  ({n} verts)")
            _invalidate_parsed(m2)
            ok += 1
        except Exception as e:
            click.echo(f"  {click.style('ERR', fg='red')}  {m2.name}  ({e})")

    click.echo()
    click.echo(f"Done — {ok}/{len(m2_files)} files transformed")
