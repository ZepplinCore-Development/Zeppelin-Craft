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


@item.command('analyze-stat-shares')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-role output')
@click.pass_context
def item_analyze_stat_shares(ctx, quiet):
    """Derive per-role stat BUDGET SHARES from stock gear.

    Measures, from obtainable stock items, how the stat budget splits across
    stats within each role (caster/healer/melee/tank) — e.g. caster Spell
    Power gets ~2x the share of Stamina. Writes the ratios to
    cli/lib/item/data/stat_shares.json, which the generator uses to
    distribute budget (instead of a flat random spread).
    """
    from lib.item.stat_share_analyzer import run
    click.echo("F-013 Stat Budget Share Analyzer (stock AC gear)")
    click.echo()
    try:
        path = run(verbose=not quiet)
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
    click.echo()
    click.echo(click.style(f"Wrote: {path}", fg='green'))


@item.command('analyze-weapon-dps')
@click.pass_context
def item_analyze_weapon_dps(ctx):
    """Reverse-engineer weapon DPS curves per family from stock AC epics.

    Pools weapons into 8 families by (subclass, role), fits an exponential
    DPS(ilvl) = a*exp(b*ilvl) per family via linear regression on (ilvl,
    ln(DPS)), and rewrites FAMILY_PROFILES in cli/lib/item/scaler.py.
    Filters items to those obtainable via loot/quest/vendor (no GM/test).
    """
    from lib.item.weapon_dps_analyzer import run
    click.echo("F-013 Weapon DPS Analyzer (stock AC epic weapons)")
    try:
        run()
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")


@item.command('scale-existing')
@click.option('--tier', '-t', type=click.Choice(['azeroth', 'outland', 'northrend']),
              default='azeroth', help='Tier to scale (default: azeroth — only tier with map list right now)')
@click.option('--difficulty', '-d', type=click.Choice(['heroic', 'mythic']),
              default=None, help='Limit to one difficulty (default: both)')
@click.option('--seed', '-s', type=int, default=0,
              help='RNG seed for stat distribution (default: 0)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-item output')
@click.pass_context
def item_scale_existing(ctx, tier, difficulty, seed, quiet):
    """F-179 — clone stock BOP dungeon items into heroic/mythic scaled
    versions. Anchors come from creature_loot_template inside the tier's
    dungeon maps, filtered to BOP equippable weapons/armor (no sets, no
    procs, no relics). Each anchor is classified into a role bucket and
    scaled via the per-era piecewise budget engine.

    Writes one AUTO SQL file per (tier, difficulty) into
    zpaks/zep-dungeons/sql/.
    """
    from lib.item.scaler_existing import run, run_loot_wiring, F179_RESERVATIONS

    craft_root = ctx.obj['craft_root']
    difficulties = [difficulty] if difficulty else ['heroic', 'mythic']

    click.echo(f"F-179 Existing Item Scaler")
    click.echo(f"Tier:         {tier}")
    click.echo(f"Difficulties: {', '.join(difficulties)}")
    click.echo(f"Seed:         {seed}")
    click.echo()

    total_items = 0
    for d in difficulties:
        if (tier, d) not in F179_RESERVATIONS:
            click.echo(click.style(f"  ✗ {tier}/{d}: no reservation", fg='red'))
            continue
        try:
            path, count = run(craft_root, tier, d, seed=seed, verbose=not quiet)
        except Exception as e:
            raise click.ClickException(f"{tier}/{d} failed: {e}")
        click.echo(click.style(f"  ✓ {tier}/{d}: {count} items → {path.name}", fg='green'))
        total_items += count

    # Phase 4: Loot wiring. Writes one file per tier (covers both
    # difficulties at once via heroic/mythic clone IDs from F-074).
    if not difficulty or difficulty == 'mythic':  # only wire when both files exist
        try:
            loot_path, h_n, m_n = run_loot_wiring(craft_root, tier, verbose=not quiet)
        except Exception as e:
            raise click.ClickException(f"{tier} loot wiring failed: {e}")
        click.echo(click.style(
            f"  ✓ {tier} loot wiring: {h_n}+{m_n} UPDATE rows → {loot_path.name}",
            fg='green'))

    click.echo()
    click.echo(f"Wrote {total_items} items across {len(difficulties)} files.")
