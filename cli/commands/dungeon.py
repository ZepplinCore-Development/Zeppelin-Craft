"""
Daily dungeon commands for Zeppelin-Craft CLI.

Commands:
    zep world dungeon teleports    Generate dungeon teleport orb SQL
    zep world dungeon quests       Generate daily dungeon quest SQL
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def dungeon(ctx):
    """Daily dungeon quest & teleport tools (F-018)."""
    pass


@dungeon.command('teleports')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/zepcraft-legacy/sql/...)')
@click.option('--seed', '-s', type=int, default=None,
              help='Random seed for reproducible orb icon selection')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-dungeon output')
@click.pass_context
def dungeon_teleports(ctx, output, seed, quiet):
    """Generate dungeon teleport orb SQL from CSV.

    Reads dungeon definitions from cli/lib/dungeon/data/Dungeon Daily Teleports.csv
    and generates teleport orb items and spell_target_position entries for 63 dungeons.

    Examples:
        zep world dungeon teleports
        zep world dungeon teleports -s 42
        zep world dungeon teleports -o /tmp/teleports.sql -q
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.dungeon.teleports import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'zepcraft-legacy' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("F-018 Daily Dungeon Teleports — SQL Generator")
    click.echo(f"Output: {output_path}")
    if seed is not None:
        click.echo(f"Seed: {seed}")
    click.echo()

    try:
        from lib.dungeon.teleports import run
        dungeon_count, _ = run(
            output_path=output_path,
            seed=seed,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {dungeon_count} dungeons")
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")


@dungeon.command('quests')
@click.option('--output', '-o', type=click.Path(), default=None,
              help='Output SQL file path (default: zpaks/zepcraft-legacy/sql/...)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-quest output')
@click.pass_context
def dungeon_quests(ctx, output, quiet):
    """Generate daily dungeon quest SQL from CSV.

    Reads quest definitions from cli/lib/dungeon/data/Dungeon Daily Quests.csv
    and generates quest templates, pool assignments, boss loot tables, NPC links,
    and POI entries for 80 daily quests across 40 dungeons.

    Examples:
        zep world dungeon quests
        zep world dungeon quests -o /tmp/quests.sql
        zep world dungeon quests -q
    """
    craft_root = ctx.obj['craft_root']

    if output is None:
        from lib.dungeon.quests import OUTPUT_FILENAME
        output_path = craft_root / 'zpaks' / 'zepcraft-legacy' / 'sql' / OUTPUT_FILENAME
    else:
        output_path = Path(output)

    click.echo("F-018 Daily Dungeon Quests — SQL Generator")
    click.echo(f"Output: {output_path}")
    click.echo()

    try:
        from lib.dungeon.quests import run
        quest_count, _ = run(
            output_path=output_path,
            verbose=not quiet
        )

        click.echo()
        click.echo(f"Processed: {quest_count} quests")
        click.echo(click.style(f"Output written: {output_path}", fg='green'))

    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
