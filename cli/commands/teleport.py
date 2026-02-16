"""
City teleport commands for Zeppelin-Craft CLI.

Commands:
    zep world teleport generate    Generate city teleport scroll SQL
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def teleport(ctx):
    """City teleport scroll tools (F-017)."""
    pass


@teleport.command('generate')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/zepcraft-legacy/sql/...)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-city output')
@click.pass_context
def teleport_generate(ctx, output, quiet):
    """Generate city teleport scroll SQL from CSV.

    Reads city definitions from cli/lib/teleport/data/City Teleports.csv
    and generates inscription scroll items, technique recipes, and vendor
    entries for 10 major cities.

    Examples:
        zep world teleport generate
        zep world teleport generate -o /tmp/teleports.sql
        zep world teleport generate -q
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.teleport.core import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'zepcraft-legacy' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("F-017 City Teleports — SQL Generator")
    click.echo(f"Output: {output_path}")
    click.echo()

    try:
        from lib.teleport.core import run
        city_count, _ = run(
            output_path=output_path,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {city_count} cities")
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
