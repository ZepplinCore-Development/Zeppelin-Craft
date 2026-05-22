"""Item generation commands for Zeppelin-Craft CLI (F-013).

Commands:
    zep world item generate                          Regenerate all 6 AUTO files
    zep world item generate --tier azeroth           Limit to one tier
    zep world item generate --difficulty heroic      Limit to one difficulty
    zep world item generate --tier outland --difficulty mythic
"""

from pathlib import Path

import click


@click.group()
@click.pass_context
def item(ctx):
    """F-013 Heroic & Mythic item matrix generation."""
    pass


@item.command('generate')
@click.option('--tier', '-t', type=click.Choice(['azeroth', 'outland', 'northrend']),
              default=None, help='Limit to a single tier (default: all)')
@click.option('--difficulty', '-d', type=click.Choice(['heroic', 'mythic']),
              default=None, help='Limit to a single difficulty (default: both)')
@click.option('--seed', '-s', type=int, default=0,
              help='RNG seed for stat/name randomization (default: 0)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-item output')
@click.pass_context
def item_generate(ctx, tier, difficulty, seed, quiet):
    """Generate item_template SQL for the heroic/mythic loot matrix.

    Writes one AUTO file per (tier, difficulty) into
    zpaks/zep-dungeons/sql/. Re-running with the same data files and
    seed produces byte-identical output.
    """
    from lib.item.presets import run_all
    from lib.item.reservations import TIERS, DIFFICULTIES

    craft_root = ctx.obj['craft_root']
    tiers = [tier] if tier else list(TIERS)
    difficulties = [difficulty] if difficulty else list(DIFFICULTIES)

    click.echo(f"F-013 Item Generator")
    click.echo(f"Tiers:        {', '.join(tiers)}")
    click.echo(f"Difficulties: {', '.join(difficulties)}")
    click.echo(f"Seed:         {seed}")
    click.echo()

    total_items = 0
    total_files = 0
    try:
        for t, d, path, count in run_all(craft_root, tiers, difficulties,
                                         seed=seed, verbose=not quiet):
            click.echo(click.style(
                f"  ✓ {t}/{d}: {count} items → {path.name}", fg='green'))
            total_items += count
            total_files += 1
    except FileNotFoundError as e:
        raise click.ClickException(str(e))
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")

    click.echo()
    click.echo(f"Wrote {total_items} items across {total_files} files.")


@item.command('analyze-budget')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-slot output')
@click.pass_context
def item_analyze_budget(ctx, quiet):
    """Reverse-engineer stat-budget formulas from stock AC epic items.

    Queries item_template for non-custom, non-set, non-spell-effect epic
    gear, fits one quadratic per InventoryType, and writes the result to
    cli/lib/item/data/budget_formulas.json. The scaler reads that file to
    target empirical stat budgets per slot/ilvl.
    """
    from lib.item.budget_analyzer import run
    click.echo("F-013 Budget Analyzer (stock AC epic gear)")
    click.echo()
    try:
        path = run(verbose=not quiet)
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
    click.echo()
    click.echo(click.style(f"Wrote: {path}", fg='green'))
