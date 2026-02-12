"""
Creature scaling commands for Zeppelin-Craft CLI.

Commands:
    zep creature normal     Run Normal Convertor (de-L33TER)
    zep creature elite      Run Elite Scaler (coming soon)
    zep creature heroic     Run Heroic Convertor (coming soon)
    zep creature all        Run all available scripts
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def creature(ctx):
    """Creature scaling and conversion tools."""
    pass


@creature.command('normal')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/game-balancing/sql/zz_de-L33TER.sql)')
@click.option('--seed', '-s', type=int, default=None,
              help='Random seed for reproducible output')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-creature output')
@click.pass_context
def creature_normal(ctx, output, seed, quiet):
    """Run Normal Creature Convertor (de-L33TER).

    Reverts IPP elite restorations to normal rank with adjusted stats.
    Zeppelin uses Autobalance for difficulty scaling instead of vanilla
    elite mobs in open world zones.
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.creature.normal import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'game-balancing' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("Normal Creature Convertor (de-L33TER)")
    click.echo(f"Output: {output_path}")
    if seed is not None:
        click.echo(f"Seed: {seed}")
    click.echo()

    try:
        from lib.creature.normal import run
        processed, not_found = run(
            output_path=output_path,
            seed=seed,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {processed} creatures")
        if not_found > 0:
            click.echo(click.style(f"Not found: {not_found} creatures", fg='yellow'))
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")


@creature.command('elite')
@click.pass_context
def creature_elite(ctx):
    """Run Elite Creature Scaler (coming soon)."""
    click.echo("Elite Creature Scaler is not yet migrated to the CLI.")


@creature.command('heroic')
@click.pass_context
def creature_heroic(ctx):
    """Run Heroic Creature Convertor (coming soon)."""
    click.echo("Heroic Creature Convertor is not yet migrated to the CLI.")


@creature.command('all')
@click.option('--seed', '-s', type=int, default=None,
              help='Random seed for reproducible output')
@click.pass_context
def creature_all(ctx, seed):
    """Run all creature scaling scripts."""
    ctx.invoke(creature_normal, output=None, seed=seed, quiet=False)
