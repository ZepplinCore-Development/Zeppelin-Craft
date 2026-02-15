"""
Creature scaling commands for Zeppelin-Craft CLI.

Commands:
    zep creature normal     Run Normal Convertor (de-L33TER)
    zep creature elite      Run Elite Scaler (coming soon)
    zep creature heroic     Generate heroic & mythic creature templates
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
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/mythic-dungeons/sql/...)')
@click.option('--seed', '-s', type=int, default=None,
              help='Random seed for reproducible output')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-creature output')
@click.pass_context
def creature_heroic(ctx, output, seed, quiet):
    """Generate heroic and mythic creature templates.

    Creates heroic/mythic versions of dungeon creatures with scaled stats.
    Duplicates creature_template rows with new IDs and links them via
    difficulty_entry_1 (heroic) and difficulty_entry_2 (mythic).
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.creature.heroic import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'mythic-dungeons' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("Heroic & Mythic Creature Generator")
    click.echo(f"Output: {output_path}")
    if seed is not None:
        click.echo(f"Seed: {seed}")
    click.echo()

    try:
        from lib.creature.heroic import run
        processed, not_found = run(
            output_path=output_path,
            seed=seed,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {processed} creatures (heroic + mythic)")
        if not_found > 0:
            click.echo(click.style(f"Not found: {not_found} creatures", fg='yellow'))
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")


@creature.command('all')
@click.option('--seed', '-s', type=int, default=None,
              help='Random seed for reproducible output')
@click.pass_context
def creature_all(ctx, seed):
    """Run all creature scaling scripts."""
    ctx.invoke(creature_normal, output=None, seed=seed, quiet=False)
    click.echo()
    ctx.invoke(creature_heroic, output=None, seed=seed, quiet=False)
