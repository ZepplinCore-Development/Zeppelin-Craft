"""
Bag scaling commands for Zeppelin-Craft CLI.

Commands:
    zep bag generate    Generate bag slot scaling SQL from bags.csv
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def bag(ctx):
    """Bag scaling tools (F-079 Bigger Bags)."""
    pass


@bag.command('generate')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/zepcraft-legacy/sql/...)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-bag output')
@click.pass_context
def bag_generate(ctx, output, quiet):
    """Generate bag slot scaling SQL from bags.csv.

    Reads bag definitions from cli/lib/bag/data/bags.csv and generates
    an UPDATE statement that scales ContainerSlots for ~98 bags.

    Examples:
        zep bag generate
        zep bag generate -o /tmp/bags.sql
        zep bag generate -q
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.bag.core import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'zepcraft-legacy' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("F-079 Bigger Bags — SQL Generator")
    click.echo(f"Output: {output_path}")
    click.echo()

    try:
        from lib.bag.core import run
        bag_count, _ = run(
            output_path=output_path,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {bag_count} bags")
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
