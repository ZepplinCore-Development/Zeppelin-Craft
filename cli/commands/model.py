"""
M2 model tools for Zeppelin-Craft CLI.

Commands:
    zep model shift <path> --dz -0.5                       Single file
    zep model shift <dir> --race DR --dz -0.5              Bulk by race
    zep model shift <dir> --race DR --scale 0.9 --dz -0.1  Scale + shift
"""

from typing import Dict, List, Tuple
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


@model.command('sources')
@click.option('--display', '-d', 'display_ids', type=int, multiple=True,
              help='Show the per-source breakdown for these display ids')
@click.option('--flag', '-f', 'flag_filter', default=None,
              help='List displays carrying this flag (e.g. orphan-texture, fewer-emitters)')
@click.option('--enabled-only', is_flag=True, help='Ignore disabled zpaks')
@click.option('--limit', '-n', type=int, default=25, help='Rows to list for --flag')
@click.option('--deploy-viewer', is_flag=True,
              help='Stage the picker page + files into nginx/wow/modelviewer/')
@click.option('--scope', type=click.Choice(['flagged', 'spawned', 'all']), default='spawned',
              help='Displays to stage: every spawned decision (default), only flagged ones, or all decisions; '
                   'playable-race displays are always included')
@click.pass_context
def model_sources(ctx, display_ids, flag_filter, enabled_only, limit, deploy_viewer, scope):
    """F-216 prototype: compare each creature display across model sources.

    Resolves every CreatureDisplayInfo row per source (stock, each zpak on its
    own over stock, and the effective build) and decodes the M2 each would
    ship. Conflicts are keyed on the display, so a pack that repoints a display
    to a new path is caught as well as one that overwrites a file in place.

    Full report: logs/model_sources_scan.json

    Examples:
        zep model sources
        zep model sources -d 2346 -d 14554
        zep model sources -f orphan-texture -n 50
    """
    import json
    from collections import Counter
    from lib.model_sources import run_scan, report_json

    if deploy_viewer:
        raise click.ClickException('the display-based picker is retired - use `zep model viewer` '
                                   '(the layered picker, served at /modelviewer/)')
    craft_root = ctx.obj['craft_root']
    logs = craft_root.parent / 'logs'
    click.echo('  Scanning model sources...')
    result = run_scan(craft_root, logs / 'model_sources_cache.pkl', include_disabled=not enabled_only)
    displays = result['displays']
    out = logs / 'model_sources_scan.json'
    out.write_text(json.dumps(report_json(result), indent=1))

    for name, stmts in result.get('unparsed', {}).items():
        click.echo(click.style(f"  WARNING {name}: {len(stmts)} DBC statement(s) not applied, e.g. {stmts[0]}",
                               fg='yellow'))

    if display_ids:
        for did in display_ids:
            _print_display(did, displays.get(did))
        return

    if flag_filter:
        rows = []
        for did, d in displays.items():
            hit = [n for n, r in [('effective', d['effective']), *d['sources'].items()]
                   if r and flag_filter in r.flags]
            if hit:
                rows.append((did, d, hit))
        click.echo(f"\n  {len(rows)} displays with '{flag_filter}'\n")
        for did, d, hit in rows[:limit]:
            path = d['effective'].model_path if d['effective'] else '?'
            click.echo(f"  {did:>7}  {path:<60} {', '.join(hit)}")
        click.echo(f"\n  Report: {out}\n")
        return

    hits, misses = result['cache']
    conflicts = [d for d in displays.values() if d['conflict']]
    click.echo()
    click.echo(click.style('  Model Source Scan (F-216 prototype)', bold=True))
    click.echo(f"  {len(displays):,} displays touched by a zpak; "
               f"{len(conflicts):,} where zpaks disagree; M2 decodes {misses:,} new / {hits:,} cached")
    click.echo()
    click.echo(f"  {'source':<28}{'on':<4}{'pri':>5} {'patch':<9}{'displays':>9}{'conflict':>9}  author")
    for s in result['sources']:
        n = sum(1 for d in displays.values() if s.name in d['sources'])
        c = sum(1 for d in conflicts if s.name in d['sources'])
        if not n:
            continue
        click.echo(f"  {s.name:<28}{'y' if s.enabled else '-':<4}{s.priority:>5} {s.client_patch:<9}"
                   f"{n:>9}{c:>9}  {s.author}")

    eff_flags = Counter(f for d in displays.values() if d['effective'] for f in d['effective'].flags)
    click.echo('\n  Flags on what the build ships now (effective):')
    for f, n in eff_flags.most_common():
        click.echo(f"    {f:<20}{n:>6}")
    better = sum(1 for d in displays.values()
                 if d['effective'] and 'fewer-emitters' in d['effective'].flags)
    click.echo(f"\n  {better} shipped displays have a version with more emitters in another source "
               f"(zep model sources -f fewer-emitters)")
    click.echo(f"  Report: {out}\n")


def _print_display(did, d):
    if d is None:
        click.echo(f"\n  {did}: no zpak touches this display\n")
        return
    click.echo(click.style(f"\n  Display {did}", bold=True)
               + ('  [CONFLICT]' if d['conflict'] else '')
               + (f"  retail FDID {d['retail_fdid']}" if d['retail_fdid'] else ''))
    rows = [('stock', d['stock']), *d['sources'].items(), ('effective', d['effective'])]
    for name, r in rows:
        if r is None:
            continue
        m = r.m2
        stats = (f"v{m.version} {m.size/1048576:5.2f}MB bones={m.bones} views={m.views} "
                 f"part={m.particles} rib={m.ribbons} sha={m.sha256[:8]}") if m else 'no file'
        click.echo(f"    {name:<26} {r.model_path}")
        click.echo(f"    {'':<26} model {r.model_id}, from {r.origin or '-'}; skins {[s for s in r.skins if s]}")
        click.echo(f"    {'':<26} {stats}")
        if m and m.orphan_textures():
            click.echo(f"    {'':<26} orphan: {', '.join(m.orphan_textures())}")
        if r.flags:
            click.echo(click.style(f"    {'':<26} flags: {', '.join(r.flags)}", fg='yellow'))
    click.echo()


@model.command('curate')
@click.option('--apply', 'do_apply', is_flag=True,
              help='Write zpaks/zep-hd-curated (parsed-assets, dbc/, sql/, curate_manifest.json)')
@click.option('--choices', 'choices_path', type=click.Path(exists=True, dir_okay=False), default=None,
              help='model_choices.json (default: the picker\'s, nginx/wow/modelviewer/choices/)')
@click.pass_context
def model_curate(ctx, do_apply, choices_path):
    """F-216: resolve the curated HD collection from the model-viewer choices.

    Every path a pure HD pack ships today keeps today's winner unless a choice
    says otherwise; each choice ships exactly what its pack serves for that
    display (stock for what the pack lacks). OA and mod-worgoblin keep shipping
    as their own zpaks. Without --apply this is a dry run: counts, collisions,
    and the picker's conflict list (data/curate_conflicts.json) are refreshed.

    \b
    Examples:
        zep model curate              # dry run + refresh picker conflicts
        zep model curate --apply      # write zep-hd-curated
    """
    import json
    import time
    from lib import hd_curate as hc, hd_curate_dbc as hd
    from lib.model_sources import run_scan, scan_gobjects, scan_items

    t0 = time.time()
    craft_root = ctx.obj['craft_root']
    logs = craft_root.parent / 'logs'
    viewer = craft_root.parent / 'nginx' / 'wow' / 'modelviewer'
    cp = Path(choices_path) if choices_path else viewer / 'choices' / 'model_choices.json'
    choices = json.loads(cp.read_text())['choices']
    click.echo(f'  {len(choices):,} choices from {cp}')

    click.echo('  Scanning sources (all packs, incl. disabled) ...')
    cache = logs / 'model_sources_cache.pkl'
    result = run_scan(craft_root, cache, include_disabled=True)
    result['displays'] = {**result['displays'], **scan_gobjects(result, cache), **scan_items(result, cache)}

    zpaks = hc.apply_supersession(hc.discover(craft_root))
    layers_path = viewer / 'choices' / 'layers.json'
    if layers_path.exists() and not choices_path:
        # F-216 layered choices: mesh -> texture -> bake (lib/hd_curate_v2.py)
        import pickle
        from lib import hd_curate_v2 as hc2
        ixp = logs / 'asset_index.pkl'
        if not ixp.exists():
            raise click.ClickException('no asset index - run `zep model viewer` first')
        ix = pickle.loads(ixp.read_bytes())
        ix.hash.__init__()
        layers = hd.Layers(craft_root)
        lc = json.loads(layers_path.read_text())
        click.echo(f"  layered choices: {len(lc.get('mesh') or {}):,} mesh, {len(lc.get('texture') or {}):,} texture, "
                   f"{len(lc.get('custom') or {}):,} custom")
        # Retail picks: convert those models now (download + WXL conversion), only these
        retail_picks = [p for p, c in (lc.get('mesh') or {}).items()
                        if c.get('option') == 'retail' or 'retail' in (c.get('sources') or [])]
        if retail_picks:
            if not hasattr(ix, 'retail'):
                ix.retail = {}
            from lib import retail as rt
            rmap = rt.remasters(*result['effective_dbc'], retail_picks)
            for p in sorted(set(retail_picks) - set(rmap)):
                click.echo(f'  retail: {p} has no single remaster any more - pick dropped, put back up for review')
            n = ix.add_retail(retail_picks, log=click.echo, fdids=rmap)
            click.echo(f'  retail: {n}/{len(retail_picks)} picked models converted the WXL way')
        ix.pack_refs(result)
        res = hc2.resolve(result, ix, lc, zpaks, layers, log=click.echo)
        manifest, rep = res['manifest'], res['report']
        sql = hd.curated_sql(layers, res['wanted_rows'])
        click.echo(f"  files: {rep['files']:,} ({rep['meshes']:,} mesh assets, {rep['retail_meshes']:,} retail; "
                   f"{rep['textures']:,} textures; {rep['bakes']:,} NPC bakes, {rep['bakes_changed']:,} changed); "
                   f"{rep['dropped']:,} dropped to OA/worgoblin/ours, {rep['stock_copies']:,} stock copies")
        click.echo(f"  unresolved: {len(rep['textures_unresolved']):,} textures with no compatible option, "
                   f"{len(rep['bake_no_compatible']):,} displays with no compatible bake (kept as today)")
        click.echo(f"  dbc: {rep['rows']:,} rows -> {sum(map(len, sql.values())):,} stock-diff statements")
        (logs / 'hd_curate_report.json').write_text(json.dumps(rep, indent=1, default=str))
        if not do_apply:
            click.echo(f'  dry run ({time.time() - t0:.0f}s). Re-run with --apply to write {hc.CURATED_ZPAK}.')
            return
        zdir = craft_root / 'zpaks' / hc.CURATED_ZPAK
        st = hc.sync_parsed(manifest, zdir, log=click.echo)
        click.echo(f"    parsed-assets: {st['copied']:,} copied, {st['kept']:,} unchanged, {st['removed']:,} removed")
        ds = hc.write_dbc_sql(craft_root, zdir, sql)
        click.echo(f"    dbc: {ds['override_statements']:,} stock-diff statements + {ds['dbc_files_copied']} [I-xxx] fix files; "
                   f"sql: {ds['sql_files_copied']} files")
        mf = hc.write_manifest(manifest, zdir, {'layers': True, 'files': len(manifest),
                                                 'generated': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())})
        click.echo(f'    manifest: {mf}')
        if rep.get('outfits') or any(f.name.startswith('custom_') for f in (craft_root / 'zpaks' / 'zep-npc-wardrobe' / 'outfits').glob('*.json')):
            from lib.hd_curate_outfits import write_manifests
            from commands.sql import run_mysql_query
            ok, rows = run_mysql_query('SELECT CreatureID, CreatureDisplayID FROM creature_template_model ORDER BY CreatureID, Idx')
            cm: Dict = {}
            for line in (rows.splitlines()[1:] if ok else []):
                e, d = line.split('\t')
                cm.setdefault(int(e), []).append(int(d))
            wr, notes = write_manifests(rep.get('outfits') or {}, lc.get('custom') or {}, result, cm,
                                        craft_root / 'zpaks' / 'zep-npc-wardrobe' / 'outfits')
            click.echo(f"    outfits: {len(rep.get('outfits') or {})} customised display(s); manifests written: {', '.join(wr) or 'none'}")
            for n in notes:
                click.echo(f'      {n}')
            if wr:
                click.echo('    next: `zep wardrobe build` (imports items, composites the bakes, emits the display rows)')
        click.echo(f'  done ({time.time() - t0:.0f}s). The zpak stays DISABLED until the switch-over.')
        return
    win = hc.winners(zpaks)
    base = hc.base_manifest(win)
    rest = hc.winners_excluding(zpaks, hc.COMMUNITY)
    ov = hc.overlay(result, choices, base, rest)
    manifest = ov['manifest']
    click.echo(f"  files: base {len(base):,} (today's PATCH-Q winners) -> curated {len(manifest):,}; "
               f"{ov['from_choice']:,} from choices, {ov['dropped']:,} dropped to OA/worgoblin/ours, "
               f"{ov['stock_copies']:,} stock copies; {len(ov['collisions']):,} file collisions")

    layers = hd.Layers(craft_root)
    needs = hd.row_needs(result, choices, layers)
    wanted, dbc_coll = hd.resolve_rows(needs, layers)
    sql = hd.curated_sql(layers, wanted)
    click.echo(f"  dbc: {len(needs):,} rows the picks depend on; stock -> curated = "
               f"{sum(map(len, sql.values())):,} statements over {sum(1 for v in sql.values() if v)} tables; "
               f"{len(dbc_coll):,} row collisions")

    # collisions -> report + the picker's conflict chip
    report = {'files': ov['collisions'], 'dbc': dbc_coll, 'unresolved': ov['unresolved']}
    (logs / 'hd_curate_report.json').write_text(json.dumps(report, indent=1))
    pc = hc.conflicts_by_display(ov['collisions'])
    for c in dbc_coll:
        for src, dids in c['displays'].items():
            others = ', '.join(f'{s2} ({len(d2)} displays)' for s2, d2 in c['displays'].items() if s2 != src)
            for did in dids:
                lst = pc.setdefault(did, [])
                msg = f"{c['table']} row {c['key']}: your pick ({src}) shares this row with {others}"
                if msg not in lst and len(lst) < 12:
                    lst.append(msg)
    (viewer / 'data').mkdir(parents=True, exist_ok=True)
    (viewer / 'data' / 'curate_conflicts.json').write_text(json.dumps(pc, separators=(',', ':')))
    click.echo(f'  report: {logs / "hd_curate_report.json"}; picker conflicts for {len(pc):,} displays')

    if not do_apply:
        click.echo(f'  dry run ({time.time() - t0:.0f}s). Re-run with --apply to write {hc.CURATED_ZPAK}.')
        return
    zdir = craft_root / 'zpaks' / hc.CURATED_ZPAK
    if not (zdir / 'zpak.json').is_file():
        raise click.ClickException(f'{zdir} missing - create it with `zep zpak create {hc.CURATED_ZPAK} -t mpq`')
    click.echo(f'  Writing {zdir} ...')
    st = hc.sync_parsed(manifest, zdir, log=click.echo)
    click.echo(f"    parsed-assets: {st['copied']:,} copied, {st['kept']:,} unchanged, {st['removed']:,} removed")
    ds = hc.write_dbc_sql(craft_root, zdir, sql)
    click.echo(f"    dbc: {ds['override_statements']:,} stock-diff statements + {ds['dbc_files_copied']} [I-xxx] fix files; "
               f"sql: {ds['sql_files_copied']} files")
    mf = hc.write_manifest(manifest, zdir, {'choices': len(choices), 'files': len(manifest),
                                             'generated': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())})
    click.echo(f'    manifest: {mf}')
    click.echo(f'  done ({time.time() - t0:.0f}s). The zpak stays DISABLED until the switch-over.')


# a creature_template_model row the game can actually show: Probability is a weight among the creature's
# rows, so a 0 next to a weighted sibling never appears (Underbog Lord 17734: 17758 at 1, 12293 at 0 - he
# is not a Landslide-display creature). A single row, or a creature with no weights at all, still counts.
_SHOWN_CTM = ("(ctm.Probability > 0 OR NOT EXISTS (SELECT 1 FROM creature_template_model x "
              "WHERE x.CreatureID = ctm.CreatureID AND x.Idx <> ctm.Idx AND x.Probability > 0))")


def _mount_riders() -> Dict[int, List[Tuple[str, int]]]:
    """F-220: {mount display: [(creature name, rider display)]} - creature X shows display R and rides
    mount M (creature_template_addon.mount, or a spawn's creature_addon.mount), so the picker's Rider
    toggle on M can seat R itself instead of a generic race body."""
    from commands.sql import run_mysql_query
    ok, rows = run_mysql_query(
        "SELECT a.mount, ct.name, ctm.CreatureDisplayID FROM creature_template_addon a "
        "JOIN creature_template ct ON ct.entry = a.entry JOIN creature_template_model ctm ON ctm.CreatureID = a.entry "
        "WHERE a.mount > 0 AND " + _SHOWN_CTM + " UNION "
        "SELECT a.mount, ct.name, ctm.CreatureDisplayID FROM creature_addon a JOIN creature c ON c.guid = a.guid "
        "JOIN creature_template ct ON ct.entry = c.id JOIN creature_template_model ctm ON ctm.CreatureID = c.id "
        "WHERE a.mount > 0 AND " + _SHOWN_CTM)
    out: Dict[int, List[Tuple[str, int]]] = {}
    for line in (rows.splitlines()[1:] if ok else []):
        mount, name, rider = line.split('\t')
        if (name, int(rider)) not in out.setdefault(int(mount), []):
            out[int(mount)].append((name, int(rider)))
    return out


def _world_context():
    """Creature names per display and the weapons the most-spawned creature carries."""
    from commands.sql import run_mysql_query
    ok, rows = run_mysql_query(
        "SELECT ctm.CreatureDisplayID, ct.name FROM creature_template_model ctm "
        "JOIN creature_template ct ON ct.entry = ctm.CreatureID WHERE " + _SHOWN_CTM)
    if not ok:
        raise click.ClickException(f'creature lookup failed: {rows}')
    names: Dict = {}
    for line in rows.splitlines()[1:]:
        did, name = line.split('\t')
        names.setdefault(int(did), []).append(name)
    # displays NPCs ride (addon mount, F-220): named after the rider, so a search for the creature finds its mount
    ok, m_rows = run_mysql_query(
        "SELECT a.mount, ct.name FROM creature_template_addon a JOIN creature_template ct ON ct.entry = a.entry "
        "WHERE a.mount > 0 UNION SELECT a.mount, ct.name FROM creature_addon a JOIN creature c ON c.guid = a.guid "
        "JOIN creature_template ct ON ct.entry = c.id WHERE a.mount > 0")
    for line in (m_rows.splitlines()[1:] if ok else []):
        did, name = line.split('\t')
        if f'{name} (mount)' not in names.setdefault(int(did), []):
            names[int(did)].append(f'{name} (mount)')
    ok, eq_rows = run_mysql_query(
        "SELECT ctm.CreatureDisplayID, ct.name, (SELECT COUNT(*) FROM creature c WHERE c.id = ct.entry) AS n, "
        "COALESCE(i1.displayid, 0), COALESCE(i1.class, 0), COALESCE(i1.subclass, 0), "
        "COALESCE(i2.displayid, 0), COALESCE(i2.class, 0), COALESCE(i2.subclass, 0) "
        "FROM creature_template_model ctm JOIN creature_template ct ON ct.entry = ctm.CreatureID "
        "JOIN creature_equip_template e ON e.CreatureID = ct.entry AND e.ID = 1 "
        "LEFT JOIN item_template i1 ON i1.entry = e.ItemID1 LEFT JOIN item_template i2 ON i2.entry = e.ItemID2 "
        "WHERE (e.ItemID1 <> 0 OR e.ItemID2 <> 0) AND " + _SHOWN_CTM)
    equipment, best = {}, {}
    if ok:
        for line in eq_rows.splitlines()[1:]:
            did, name, n, d1, c1, s1, d2, c2, s2 = line.split('\t')
            did, n = int(did), int(n)
            if did in best and best[did] >= n:
                continue
            best[did] = n
            items = []
            if int(d1):
                items.append({'hand': 'main', 'display': int(d1), 'class': int(c1), 'subclass': int(s1)})
            if int(d2):
                items.append({'hand': 'off', 'display': int(d2), 'class': int(c2), 'subclass': int(s2)})
            equipment[did] = {'creature': name, 'items': items}
    ok, it_rows = run_mysql_query('SELECT displayid, name FROM item_template WHERE displayid <> 0')
    idi_names: Dict = {}
    if ok:
        for line in it_rows.splitlines()[1:]:
            idid, _, iname = line.partition('\t')
            if idid.isdigit():
                idi_names.setdefault(int(idid), []).append(iname)
    return names, equipment, idi_names


def migrate_v1_choices(result: dict, ix, v1: Dict[str, dict]) -> Dict[str, dict]:
    """v1 display choices -> layer-1 mesh picks: each display's chosen source -> the
    mesh option that source serves for the display's model (majority per mesh)."""
    import collections
    import time
    votes = collections.defaultdict(collections.Counter)
    for did_s, c in v1.items():
        src = c.get('source')
        d = result['displays'].get(int(did_s) if did_s.isdigit() else did_s)
        if not d:
            continue
        r = d['stock'] if src == 'stock' else d['sources'].get(src)
        if not r or not r.model_path:
            continue
        for p in d.get('members') or [r.model_path]:
            a = ix.meshes.get(p)
            if a and len(a.options) > 1:
                o = a.option_of(src) or a.option_of('stock')
                if o:
                    votes[p][o.key] += 1
    out = {}
    at = time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())
    for p, cnt in votes.items():
        key = cnt.most_common(1)[0][0]
        opts = {o.key: o.sources for o in ix.meshes[p].options}
        out[p] = {'option': key, 'sources': opts[key], 'options': opts, 'at': at, 'migrated': 'v1 display choices'}
    return out


@model.command('viewer')
@click.option('--rebuild-index', is_flag=True, help='Re-hash everything (otherwise hashes are cached)')
@click.option('--reuse-index', is_flag=True, help='Load logs/asset_index.pkl instead of re-indexing')
@click.pass_context
def model_viewer(ctx, rebuild_index, reuse_index):
    """F-216 layered picker: 3D assets, textures, displays, customise (nginx /modelviewer/).

    \b
    Layers: 1. 3D asset (mesh)  2. 2D asset (texture)  3. customise (per display).
    Packs shipping byte-identical files are one option; texture defaults are the
    largest option compatible with the picked mesh. Incremental: unchanged panes
    are reused. Safe to run any time: a run started while another is going is
    queued, and the running deploy does one more pass when it finishes.
    """
    import fcntl
    logs = ctx.obj['craft_root'].parent / 'logs'
    lock_f = open(logs / 'viewer.lock', 'w')
    pending = logs / 'viewer.pending'
    try:
        fcntl.flock(lock_f, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except OSError:
        pending.touch()
        click.echo('  a viewer deploy is already running - queued; it will do another pass when it finishes')
        return
    try:
        while True:
            pending.unlink(missing_ok=True)
            _model_viewer_run(ctx, rebuild_index, reuse_index)
            rebuild_index = reuse_index = False
            if not pending.exists():
                break
            click.echo('  queued deploy request found - running another incremental pass')
    finally:
        fcntl.flock(lock_f, fcntl.LOCK_UN)
        lock_f.close()


def _model_viewer_run(ctx, rebuild_index, reuse_index):
    """F-216 layered picker: 3D asset tabs + the texture tab (nginx /modelviewer/layers.html).

    \b
    Layers: 1. 3D asset (mesh)  2. 2D asset (texture)  3. customise (per display).
    Packs shipping byte-identical files are one option; texture defaults are the
    largest option compatible with the picked mesh.
    """
    import json
    import pickle
    import shutil
    import time
    from lib import asset_index as ai
    from lib.model_sources import run_scan, scan_gobjects, scan_items
    from lib.viewer_v2 import deploy_v2
    from lib.model_viewer_deploy import ASSET_DIR

    t0 = time.time()
    craft_root = ctx.obj['craft_root']
    logs = craft_root.parent / 'logs'
    out = craft_root.parent / 'nginx' / 'wow' / 'modelviewer'
    cache = logs / 'model_sources_cache.pkl'
    click.echo('  Scanning sources ...')
    result = run_scan(craft_root, cache, include_disabled=True)
    items = scan_items(result, cache)
    result['displays'] = {**result['displays'], **scan_gobjects(result, cache), **items}
    if rebuild_index and ai.HASH_CACHE.exists():
        ai.HASH_CACHE.unlink()
    ixp = logs / 'asset_index.pkl'
    # the index is a pure function of the sources: reuse it when their fingerprint is unchanged
    from lib.model_sources import _scan_fingerprint
    ix_fp = _scan_fingerprint(result['sources'], craft_root, True)
    fpp = logs / 'asset_index.fingerprint'
    if not rebuild_index and ixp.exists() and fpp.exists() and fpp.read_text() == ix_fp:
        reuse_index = True
    if reuse_index and ixp.exists():
        click.echo(f'  Reusing the asset index from {ixp} ...')
        ix = pickle.loads(ixp.read_bytes())
        ix.hash.__init__()
        ix.log = click.echo
        if not hasattr(ix, 'retail'):
            ix.retail = {}                     # indexes pickled before the Retail option existed
    else:
        click.echo(f'  Indexing assets ({time.time() - t0:.0f}s) ...')
        ix = ai.AssetIndex(result['sources'], log=click.echo)
        ix.build_meshes()
        ix.link_dbc(result)
        ix.link_items(items)
        ix.build_textures()
        ix.log = None
        ixp.write_bytes(pickle.dumps(ix))          # before Retail: a later --reuse-index starts here
        fpp.write_text(ix_fp)
        ix.log = click.echo
    # Retail is LIVE in the picker (straight from wago.tools, data/v2/retail.json); the
    # WXL-converted file is made only for models picked as Retail, by `zep model curate`.
    ix.pack_refs(result)                       # orphan pack skins never pass as upscales
    click.echo(f'  {len(ix.meshes):,} meshes, {len(ix.textures):,} textures ({time.time() - t0:.0f}s)')
    names, equipment, idi_names = _world_context()
    for k, v in items.items():
        names[k] = sorted({n for i in v['idi'] for n in idi_names.get(i, [])}, key=len)[:6]

    cpath = out / 'choices' / 'layers.json'
    if cpath.exists():
        choices = json.loads(cpath.read_text())
    else:
        v1p = out / 'choices' / 'model_choices.json'
        v1 = json.loads(v1p.read_text())['choices'] if v1p.exists() else {}
        choices = {'version': 2, 'mesh': migrate_v1_choices(result, ix, v1), 'texture': {}, 'custom': {}}
        cpath.parent.mkdir(parents=True, exist_ok=True)
        cpath.write_text(json.dumps(choices, indent=1))
        click.echo(f"  migrated {len(v1):,} v1 display choices -> {len(choices['mesh']):,} mesh picks ({cpath})")
    # creature-level edits (creatures our zpaks moved off stock displays) for the Displays tab
    from commands.sql import run_mysql_query
    from lib.model_sources import creature_edits
    ok, ctm_rows = run_mysql_query(
        "SELECT ctm.CreatureID, ctm.Idx, ctm.CreatureDisplayID, ctm.DisplayScale, ct.name "
        "FROM creature_template_model ctm JOIN creature_template ct ON ct.entry = ctm.CreatureID")
    live, cnames = [], {}
    for line in (ctm_rows.splitlines()[1:] if ok else []):
        cid, idx, did, sc, cname = line.split('\t')
        live.append((int(cid), int(idx), int(did), float(sc)))
        cnames[int(cid)] = cname
    edits = creature_edits(live, craft_root) if live else {}
    stats = deploy_v2(result, ix, out, choices, names, equipment, log=click.echo, edits=edits, cnames=cnames,
                      mount_riders=_mount_riders())
    from lib.model_viewer_deploy import publish_page
    # ONE picker: the layered page is /modelviewer/ itself (the old display-based page is retired)
    for f in ('layers.html', 'pane.html', 'blp.js'):
        publish_page(f, out)
    # animation names for the picker's animation menu (AnimationData.dbc)
    try:
        import subprocess, sys as _sys
        r = subprocess.run([_sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', 'SELECT id, name FROM animationdata'],
                           cwd=str(craft_root), capture_output=True, text=True)
        names_ = {int(a): b for a, _, b in (l.partition('\t') for l in r.stdout.splitlines()) if a.isdigit()}
        (out / 'data' / 'v2.new' / 'anims.json').write_text(json.dumps(names_, separators=(',', ':')))
    except Exception as ex:
        click.echo(f'  animation names: skipped - {ex}')
    # models used as MOUNTS (the picker's rider toggle only seats a rider on these): creatures
    # summoned by mount spells (aura 78) or flight paths, plus displays NPCs ride (addon mount)
    try:
        import subprocess, sys as _sys
        def dbcq(q):
            r = subprocess.run([_sys.executable, '-m', 'cli.zep', 'dbc', 'info', 'query', q],
                               cwd=str(craft_root), capture_output=True, text=True)
            return [l.split('\t') for l in r.stdout.splitlines()[1:] if l and l[0].isdigit()]
        entries = set()
        for k in (1, 2, 3):
            entries |= {int(r[0]) for r in dbcq(f'SELECT DISTINCT effect_misc_value_a_{k} FROM spell '
                                                f'WHERE effect_apply_aura_name_{k} = 78 AND effect_misc_value_a_{k} > 0')}
        for r in dbcq('SELECT mount_creature_id_1, mount_creature_id_2 FROM taxinodes'):
            entries |= {int(x) for x in r if x.isdigit() and int(x) > 0}
        dids = set()
        if entries:
            ok_, rows_ = run_mysql_query('SELECT CreatureDisplayID FROM creature_template_model WHERE CreatureID IN (%s)'
                                         % ','.join(map(str, sorted(entries))))
            dids |= {int(l) for l in (rows_.splitlines()[1:] if ok_ else []) if l.strip().isdigit()}
        for q in ('SELECT DISTINCT mount FROM creature_template_addon WHERE mount > 0',
                  'SELECT DISTINCT mount FROM creature_addon WHERE mount > 0'):
            ok_, rows_ = run_mysql_query(q)
            dids |= {int(l) for l in (rows_.splitlines()[1:] if ok_ else []) if l.strip().isdigit()}
        cdi_, cmd_ = result['effective_dbc']
        from lib import model_sources as _ms
        path_of = lambda d: _ms.norm(str((cmd_.get(int(cdi_[d].get('model_id') or 0)) or {}).get('model_path') or '')) if d in cdi_ else ''
        # {model path: [attachment id, dx, dy, dz]} - mounts seat the rider at attachment 0
        seats = {p_: [0, 0, 0, 0] for p_ in {path_of(d) for d in dids} - {''}}
        # vehicles: the driver seat's attachment + offset (Vehicle.seat_id_1 -> VehicleSeat)
        vs = {int(r[0]): [int(r[1]), float(r[2]), float(r[3]), float(r[4])] for r in dbcq(
            'SELECT v.id, s.attachment_id, s.attachment_offset_x, s.attachment_offset_y, s.attachment_offset_z '
            'FROM vehicle v JOIN vehicleseat s ON s.id = v.seat_id_1')}
        ok_, rows_ = run_mysql_query('SELECT ct.VehicleId, ctm.CreatureDisplayID FROM creature_template ct '
                                     'JOIN creature_template_model ctm ON ctm.CreatureID = ct.entry WHERE ct.VehicleId > 0')
        n_veh = 0
        for l in (rows_.splitlines()[1:] if ok_ else []):
            vid, did_ = (int(x) for x in l.split('\t')[:2])
            p_ = path_of(did_)
            if p_ and vid in vs and p_ not in seats:
                seats[p_] = vs[vid]
                n_veh += 1
        (out / 'data' / 'v2.new' / 'mounts.json').write_text(json.dumps(seats))
        click.echo(f'  mounts: {len(seats) - n_veh} mount models + {n_veh} vehicle models ({len(dids)} mount displays)')
    except Exception as ex:
        click.echo(f'  mounts: skipped - {ex}')
    from lib.viewer_v2 import swap_v2
    swap_v2(out)
    (out / 'index.html').write_text((out / 'layers.html').read_text())
    (out / 'layers.html').unlink()
    ix.log = None
    (logs / 'asset_index.pkl').write_bytes(pickle.dumps(ix))
    click.echo(f"  {stats['assets']:,} assets, {stats['textures']:,} textures, {stats['maps']:,} panes "
               f"({time.time() - t0:.0f}s). Open /modelviewer/")
