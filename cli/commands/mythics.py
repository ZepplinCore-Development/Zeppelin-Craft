"""Heroic / mythic dungeon mode orchestrator.

Single-button regen of the three coupled features that together produce
heroic/mythic dungeon content:

  - F-013 — synthetic items pooled into class-conditional caches
  - F-074 — creature clones (difficulty_entry_1/2) + cache items + refs +
            INSERT-SELECT inheritance of base loot into clone lootids
  - F-179 — stock BOP item scaler + creature_loot_template UPDATE rows
            that swap stock items for their scaled versions on clones

The regen graph is strict: F-013 → F-074 → F-179, because F-074 reads
F-013 IDs for cache contents, and F-179 reads F-074 clone IDs from
`creature_template.difficulty_entry_1/2` then UPDATEs the loot tables
F-074 just rebuilt. Running any earlier feature alone leaves the later
ones stale; this command ensures they all run in order.

Each underlying feature stays reachable as its own subcommand
(`zep world item generate`, `zep world creature heroic`, `zep world
item scale-existing`) — this orchestrator is the convenience button,
not a replacement.

Commands:
    zep world mythics regen --tier azeroth         Full chain + apply
    zep world mythics regen --tier azeroth --skip-apply
"""
import subprocess
import sys

import click


@click.group()
@click.pass_context
def mythics(ctx):
    """Heroic/mythic dungeon orchestration (F-013 + F-074 + F-179)."""
    pass


def _run_step(args, label, craft_root, accept_nonzero=False):
    """Invoke `zep <args>` as a subprocess. If accept_nonzero is True, return
    the exit code instead of raising — used for sql-changed -k where partial
    failures are expected (the pre-existing characters migration index
    collision is a known long-standing issue unrelated to F-179)."""
    cmd = [sys.executable, "-m", "cli.zep"] + args
    result = subprocess.run(cmd, cwd=str(craft_root))
    if result.returncode != 0 and not accept_nonzero:
        raise click.ClickException(f"{label} failed (exit {result.returncode})")
    return result.returncode


@mythics.command('regen')
@click.option('--tier', '-t', type=click.Choice(['azeroth', 'outland', 'northrend']),
              default='azeroth',
              help='Tier to regen (default: azeroth — only tier with full F-179 coverage)')
@click.option('--seed', '-s', type=int, default=0,
              help='RNG seed used by F-013 + F-179 stat distribution (default: 0)')
@click.option('--skip-apply', is_flag=True,
              help='Write SQL files but skip the world DB apply at the end')
@click.option('--skip-f013', is_flag=True,
              help='Skip the F-013 item generate step (use existing items)')
@click.option('--skip-f074', is_flag=True,
              help='Skip the F-074 creature heroic step (use existing clones)')
@click.option('--skip-f179', is_flag=True,
              help='Skip the F-179 scale-existing step (no scaled stock loot)')
@click.option('--quiet', '-q', is_flag=True, help='Suppress per-step verbose output')
@click.pass_context
def mythics_regen(ctx, tier, seed, skip_apply, skip_f013, skip_f074, skip_f179, quiet):
    """Run F-013 → F-074 → F-179 in sequence, then apply to the world DB.

    Each underlying step is invoked as its existing standalone CLI command
    via subprocess — this orchestrator just chains them in the correct
    order so you don't have to remember the regen dependency graph.

    F-074 currently has no --tier filter (its creatures_heroic.json only
    covers azeroth); when outland/northrend mythic dungeons land, F-074
    will need extending and this orchestrator will route accordingly.
    """
    craft_root = ctx.obj['craft_root']
    quiet_flag = ['--quiet'] if quiet else []

    click.echo(click.style("=== zep world mythics regen ===", bold=True))
    click.echo(f"Tier:       {tier}")
    click.echo(f"Seed:       {seed}")
    click.echo(f"Steps:      "
               f"F-013={'skip' if skip_f013 else 'run'}, "
               f"F-074={'skip' if skip_f074 else 'run'}, "
               f"F-179={'skip' if skip_f179 else 'run'}, "
               f"apply={'skip' if skip_apply else 'run'}")
    click.echo()

    # --- F-013: synthetic item matrix (cache contents) ---
    if not skip_f013:
        click.echo(click.style("[1/4] F-013 — synthetic item matrix", fg='cyan', bold=True))
        _run_step(
            ['world', 'item', 'generate', '--tier', tier, '--seed', str(seed)] + quiet_flag,
            "F-013 item generate", craft_root,
        )
        click.echo()
    else:
        click.echo(click.style("[1/4] F-013 — SKIPPED\n", fg='yellow'))

    # --- F-074: creature clones + caches ---
    if not skip_f074:
        click.echo(click.style("[2/4] F-074 — creature clones + caches", fg='cyan', bold=True))
        f074_args = ['world', 'creature', 'heroic']
        if seed:
            f074_args += ['--seed', str(seed)]
        _run_step(f074_args + quiet_flag, "F-074 creature heroic", craft_root)
        click.echo()
    else:
        click.echo(click.style("[2/4] F-074 — SKIPPED\n", fg='yellow'))

    # --- F-179: scale stock items + wire into clone loot tables ---
    if not skip_f179:
        click.echo(click.style("[3/4] F-179 — scale stock items + wire clones",
                               fg='cyan', bold=True))
        _run_step(
            ['world', 'item', 'scale-existing', '--tier', tier, '--seed', str(seed)] + quiet_flag,
            "F-179 scale-existing", craft_root,
        )
        click.echo()
    else:
        click.echo(click.style("[3/4] F-179 — SKIPPED\n", fg='yellow'))

    # --- Apply ---
    # The F-074 + F-179 wiring lives in one sectioned file
    # (`zz_[AUTO,F-074+F-179]_heroic_creature_loot.sql`) — when either
    # generator rewrites its section, the combined file's hash changes
    # and `sql changed` re-applies both in the correct order. No tracker
    # manipulation needed.
    if not skip_apply:
        click.echo(click.style("[4/4] world sql changed -k (apply to world DB)",
                               fg='cyan', bold=True))
        # `-k` mode: partial failures are expected (the pre-existing characters
        # migration index collision is unrelated to F-179). Treat exit 1 as a
        # warning, not fatal — the orchestrator's contract is "all the regen
        # outputs were attempted".
        rc = _run_step(['world', 'sql', 'changed', '-k'], "world sql changed",
                       craft_root, accept_nonzero=True)
        if rc != 0:
            click.echo(click.style(
                "  ⚠ sql changed exit 1 — review per-file results above. "
                "Pre-existing characters migration error is harmless.",
                fg='yellow'))
        click.echo()
    else:
        click.echo(click.style(
            "[4/4] APPLY SKIPPED — run `zep world sql changed -k` to commit\n",
            fg='yellow'))

    click.echo(click.style("=== regen complete ===", fg='green', bold=True))
