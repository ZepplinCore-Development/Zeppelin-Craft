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
@click.option('--scope', type=click.Choice(['all', 'epic', 'quality']), default='all',
              help='epic = refit budget_formulas.json (stock epics); quality = refit '
                   'budget_formulas_quality.json (stock greens/blues); all = both')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-slot output')
@click.pass_context
def item_analyze_budget(ctx, scope, quiet):
    """Reverse-engineer stat-budget formulas from stock AC items.

    epic: non-custom, non-set, non-spell-effect epic gear, one quadratic per
    InventoryType (and era) -> cli/lib/item/data/budget_formulas.json.

    quality: stock uncommon (2) and rare (3) gear at every ilvl, one
    piecewise power law per pooled slot ->
    cli/lib/item/data/budget_formulas_quality.json. Refitting one never
    touches the other file.
    """
    from lib.item.budget_analyzer import run, run_quality_curves
    paths = []
    try:
        if scope in ('all', 'epic'):
            click.echo("F-013 Budget Analyzer (stock AC epic gear)")
            click.echo()
            paths.append(run(verbose=not quiet))
            click.echo()
        if scope in ('all', 'quality'):
            click.echo("F-013 Budget Analyzer (stock AC uncommon/rare gear)")
            click.echo()
            paths.append(run_quality_curves(verbose=not quiet))
            click.echo()
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
    for path in paths:
        click.echo(click.style(f"Wrote: {path}", fg='green'))


# Slot name -> (InventoryType(s) the curve is looked up by, InventoryTypes
# compared against in stock, subclass for split slots or None).
_BUDGET_SLOTS = {
    'head': (1, [1], None), 'neck': (2, [2], None), 'shoulder': (3, [3], None),
    'chest': (5, [5, 20], None), 'robe': (20, [5, 20], None),
    'waist': (6, [6], None), 'legs': (7, [7], None), 'feet': (8, [8], None),
    'wrist': (9, [9], None), 'hands': (10, [10], None),
    'finger': (11, [11], None), 'ring': (11, [11], None),
    'trinket': (12, [12], None), 'back': (16, [16], None), 'cloak': (16, [16], None),
    'held': (23, [23], None), 'offhand': (23, [23], None),
    'shield': (14, [14], None),
    '1h': (13, [13, 21, 22], None), 'mainhand': (21, [13, 21], None),
    'offhand-weapon': (22, [13, 22], None), '2h': (17, [17], None),
    'bow': (15, [15], 2), 'gun': (26, [26], 3), 'crossbow': (26, [26], 18),
    'wand': (26, [26], 19), 'thrown': (25, [25], None), 'relic': (28, [28], None),
}

_STAT_ALIASES = {
    'agi': 3, 'agility': 3, 'str': 4, 'strength': 4, 'int': 5, 'intellect': 5,
    'spi': 6, 'spirit': 6, 'sta': 7, 'stam': 7, 'stamina': 7,
    'def': 12, 'defense': 12, 'dodge': 13, 'parry': 14, 'block': 15,
    'hit': 31, 'crit': 32, 'resil': 35, 'resilience': 35, 'haste': 36,
    'exp': 37, 'expertise': 37, 'ap': 38, 'rap': 39, 'mp5': 43, 'arp': 44,
    'sp': 45, 'hp5': 46, 'spen': 47, 'bv': 48, 'blockvalue': 48,
}
_STAT_SHORT = {3: 'Agi', 4: 'Str', 5: 'Int', 6: 'Spi', 7: 'Sta', 12: 'Def',
               13: 'Dodge', 14: 'Parry', 15: 'Block', 31: 'Hit', 32: 'Crit',
               35: 'Resil', 36: 'Haste', 37: 'Exp', 38: 'AP', 39: 'RAP',
               43: 'Mp5', 44: 'ArP', 45: 'SP', 46: 'Hp5', 47: 'SpPen', 48: 'BV'}


def _fmt_stats(pairs):
    return ", ".join(f"+{v} {_STAT_SHORT.get(t, f'stat{t}')}" for t, v in pairs) or "(none)"


@item.command('budget')
@click.option('--slot', required=True, type=click.Choice(sorted(_BUDGET_SLOTS)),
              help='Equip slot of the hand-made item')
@click.option('--ilvl', required=True, type=int, help='Item level')
@click.option('--quality', required=True, type=click.IntRange(2, 5),
              help='2 = uncommon, 3 = rare, 4 = epic')
@click.option('--stats', 'stats_csv', default=None,
              help='Comma list of stats to split the budget over, e.g. str,sta '
                   '(names: str agi int spi sta ap sp hit crit haste mp5 def dodge ...; '
                   'or numeric stat ids)')
@click.option('--dps', type=float, default=None,
              help='Weapons only: the weapon DPS; DPS x 5 is taken off the total budget '
                   'before the stat split')
@click.option('--seed', type=int, default=0, help='RNG seed for the split jitter (default 0)')
@click.option('--min-stat', type=int, default=None,
              help='Drop stats that come out below this value (default MIN_STAT_VALUE = 3)')
@click.option('--nearest', type=int, default=5, help='Stock items to list (0 = skip DB)')
@click.pass_context
def item_budget(ctx, slot, ilvl, quality, stats_csv, dps, seed, min_stat, nearest):
    """Price a hand-made item (e.g. a quest reward) against the stat budget.

    Prints the budget for slot/ilvl/quality, a suggested integer stat split
    and its weighted cost, and the nearest stock items of that slot and
    quality with their weighted costs. Read-only (DB SELECT only).

    \b
    Example:
      zep world item budget --slot neck --ilvl 27 --quality 2 --stats str,sta
    """
    import random
    from lib.item.scaler import (
        budget_details, distribute_stats, stat_weight, MIN_STAT_VALUE,
        DPS_BUDGET_WEIGHT,
    )

    curve_iv, stock_ivs, subclass = _BUDGET_SLOTS[slot]
    try:
        d = budget_details(curve_iv, ilvl, quality, subclass=subclass)
    except ValueError as e:
        raise click.ClickException(str(e))
    is_weapon = curve_iv in (13, 15, 17, 21, 22, 25, 26)

    qname = {2: 'uncommon', 3: 'rare', 4: 'epic', 5: 'legendary'}[quality]
    click.echo(f"{slot} ilvl {ilvl} {qname}")
    curve = d['path'] + (f" [{d['curve_key']}]" if d['curve_key'] else "")
    if d['fallback_from']:
        curve += f" (fallback from {d['fallback_from']})"
    lo, hi = d['ilvl_range']
    click.echo(f"  curve:   {curve}, fitted ilvl {lo}-{hi}"
               + (f", n={d['n']}" if d['n'] else ""))
    if d['clamped']:
        click.echo(click.style(
            f"  WARNING: ilvl {ilvl} is outside the fitted range; priced at ilvl "
            f"{d['ilvl_used']} (clamped, not extrapolated).", fg='yellow'))
    budget = d['budget']
    line = f"  budget:  {budget:.2f} weighted points"
    band = d['band']
    if band:
        line += (f"  (stock band p10-p90 {budget * band['p10']:.2f}-"
                 f"{budget * band['p90']:.2f}, n={band['n']})")
    click.echo(line)

    stat_budget = budget
    if is_weapon:
        if dps is None:
            click.echo(click.style(
                "  NOTE: weapon budget includes DPS x 5; pass --dps to get a stat split.",
                fg='yellow'))
            stat_budget = None
        else:
            stat_budget = budget - dps * DPS_BUDGET_WEIGHT
            click.echo(f"  stats:   {stat_budget:.2f} after DPS {dps:g} x {DPS_BUDGET_WEIGHT:g}")

    if stats_csv and stat_budget is not None:
        ids = []
        for tok in stats_csv.split(','):
            tok = tok.strip().lower()
            if not tok:
                continue
            if tok.isdigit():
                ids.append(int(tok))
            elif tok in _STAT_ALIASES:
                ids.append(_STAT_ALIASES[tok])
            else:
                raise click.ClickException(f"Unknown stat '{tok}'")
        rng = random.Random(seed)
        split = distribute_stats(ids, max(0.0, stat_budget), rng, min_value=min_stat)
        cost = sum(v * stat_weight(t) for t, v in split)
        thr = MIN_STAT_VALUE if min_stat is None else min_stat
        click.echo(f"  split:   {_fmt_stats(split)}  = {cost:.2f} weighted"
                   f"  (seed {seed}, min stat {thr})")
        dropped = [t for t in ids if t not in {s for s, _ in split}]
        if dropped:
            click.echo(click.style(
                f"  NOTE: dropped below +{thr}: "
                + ", ".join(_STAT_SHORT.get(t, str(t)) for t in dropped)
                + " (try --min-stat 1 for low-level items)", fg='yellow'))
        if band and stat_budget == budget and budget > 0:
            ratio = cost / budget
            inband = band['p10'] <= ratio <= band['p90']
            click.echo(f"  verdict: {ratio:.2f}x budget -> "
                       + (click.style("in stock band", fg='green') if inband
                          else click.style("OUTSIDE stock band", fg='red')))

    if nearest > 0:
        from lib.item.budget_analyzer import nearest_stock_items
        subs = None
        if curve_iv == 26 or slot == 'bow':
            subs = [subclass]
        try:
            rows = nearest_stock_items(stock_ivs, quality, ilvl, limit=nearest, subclasses=subs)
        except Exception as e:
            raise click.ClickException(f"Stock lookup failed: {e}")
        click.echo(f"  nearest stock {qname} {slot} items:")
        if not rows:
            click.echo("    (none within +/-15 ilvl)")
        for r in rows:
            click.echo(f"    {r['entry']:>6} il{r['ilvl']:>3} {r['total']:7.2f}  "
                       f"{r['name'][:34]:<34} {_fmt_stats(r['stats'])}")


@item.command('validate')
@click.option('--tier', '-t', type=click.Choice(['azeroth', 'outland', 'northrend']),
              default=None, help='Limit to a single tier (default: all)')
@click.option('--out', '-o', type=click.Path(), default=None,
              help='Report path (default: reports/item_validation.log)')
@click.pass_context
def item_validate(ctx, tier, out):
    """Validate generated items against stock raid-loot cohorts.

    Objective, repeatable comparison of LIVE generated items vs real raid
    loot at the same power band (azeroth heroic vs Molten Core, mythic vs
    Blackwing Lair, etc.). Checks weapon DPS, total budget, stat budget per
    bucket, and per-role stat distribution. Writes a reviewable report.
    """
    from lib.item.validator import run
    click.echo("F-013 Item Validator (generated vs stock raid cohorts)")
    click.echo()
    try:
        path, totals = run(tiers=[tier] if tier else None,
                           out_path=out)
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")
    click.echo(f"  {totals['OK']} OK, {totals['WARN']} WARN, {totals['FAIL']} FAIL")
    click.echo(click.style(f"Report: {path}", fg='green'))


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


@item.command('stack-sizes')
@click.option('--dry-run', is_flag=True, help='Report without writing files')
@click.pass_context
def item_stack_sizes(ctx, dry_run):
    """F-067: regenerate by-entry stack-size SQL from the stock dump.

    Resolves the blanket tier rules (100->1000, 20->200, 10->100, 5->50)
    against AzerothCore's stock item_template dump once and emits explicit
    by-entry UPDATEs, so the file is idempotent and safe to replay under the
    universal downstream cascade. Hand-authored exceptions live in
    cli/lib/item/data/f067_stacks_overrides.json — edit that, not the SQL.
    """
    from lib.item.stacks import run

    craft_root = ctx.obj['craft_root']
    try:
        out_path, summary = run(craft_root, dry_run=dry_run)
    except Exception as e:
        raise click.ClickException(f"Failed: {e}")

    click.echo("F-067 Stack Sizes")
    click.echo(f"  Stock rows read:      {summary['stock_rows']}")
    click.echo(f"  Blanket roster:       {summary['roster']} items")
    for value, n in summary['tiers'].items():
        click.echo(f"      -> {value}: {n}")
    click.echo(f"  Hand overrides:       {summary['overrides']}")
    click.echo(f"  Emitted:              {summary['emitted_blanket']} blanket "
               f"+ {summary['emitted_overrides']} override statement(s)")
    click.echo(click.style(
        f"  {'would write' if dry_run else '✓'} {out_path}", fg='green'))
    if not dry_run:
        click.echo("Apply with: zep world sql changed")


@item.command('purge-whites')
@click.option('--dry-run', is_flag=True, help='Report without writing files or roster')
@click.pass_context
def item_purge_whites(ctx, dry_run):
    """F-081: flag non-vendor white statless gear as disenchantable.

    Items stay white (core patch 0033 lowers the disenchant quality gate);
    each gets a +1 class-relevant stat and a 'Disenchantable.' description
    as the signal. Vendor-sold items are excluded and reverted to stock.
    Re-run after adding white gear or changing vendor stock.
    """
    from lib.item.whites import run

    craft_root = ctx.obj['craft_root']
    written, summary = run(craft_root, dry_run=dry_run)

    click.echo("F-081 Purge Whites")
    click.echo(f"  New whites discovered: {summary['_discovered_new']}")
    if summary['_vendor_reverted']:
        click.echo(f"  Vendor-sold reverted to stock: {len(summary['_vendor_reverted'])}")
    click.echo(f"  Total items covered:   {summary['_total']}")
    for name in sorted(k for k in summary if not k.startswith('_')):
        click.echo(f"    +1 {name}: {summary[name]}")
    for path in written:
        click.echo(click.style(f"  {'would write' if dry_run else '✓'} {path}", fg='green'))
    for entry, name in summary['_skipped_unmapped']:
        click.echo(click.style(
            f"  ! entry {entry} ({name}) in unmapped custom range — "
            f"add its zpak to CUSTOM_ZPAK_RANGES in lib/item/whites.py", fg='yellow'))
    if summary['_missing_from_db']:
        click.echo(click.style(
            f"  ! {len(summary['_missing_from_db'])} roster entries missing from "
            f"item_template: {summary['_missing_from_db'][:10]}", fg='yellow'))
    if not dry_run:
        click.echo("Apply with: zep world sql changed")
