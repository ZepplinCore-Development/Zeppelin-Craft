#!/usr/bin/env python3
"""
zep world edits — drain the in-game spawn editor's journal into tagged zpak SQL.

F-208. The editor module (Zeppelin-Core/modules/mod-gobject-editor) records every
edit as rows in `zep_edit_journal`. The worldserver container has no mount for the
content repo, so it cannot write a .sql file itself — this command is the other
half of the hand-off.

    zep world edits list  [--task I-359] [--pending]
    zep world edits diff  [--task I-359] [--id N]
    zep world edits emit  --task I-359 --zpak zep-goblin-start
    zep world edits drain --task I-359

`emit` writes one idempotent `zz_[<task>]_<slug>.sql` per task, following the
project's SQL conventions: a single consolidated UPDATE per row we do not own, a
DELETE + INSERT for rows we do, one column per line.
"""

import re
import sys
from collections import OrderedDict
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

import click

from commands.sql import run_mysql_query

# Spawn tables the editor can journal, with the columns we are willing to emit.
EMITTABLE = {
    'gameobject': ['position_x', 'position_y', 'position_z', 'orientation',
                   'rotation0', 'rotation1', 'rotation2', 'rotation3'],
    'creature': ['position_x', 'position_y', 'position_z', 'orientation'],
}

TASK_RE = re.compile(r'^[FI]-\d{3}[A-Z]?$')


def _rows(query: str) -> List[Dict[str, str]]:
    """Run a query and return rows as dicts (mysql tab output, first line = header)."""
    ok, out = run_mysql_query(query)
    if not ok:
        raise click.ClickException(f"Query failed: {out}")
    lines = out.splitlines()
    if len(lines) < 2:
        return []
    header = lines[0].split('\t')
    rows = []
    for line in lines[1:]:
        # run_mysql_query strips the whole output, so the final row loses its
        # trailing tabs when its last columns are empty — pad back to the header.
        fields = line.split('\t')
        fields += [''] * (len(header) - len(fields))
        rows.append(dict(zip(header, fields)))
    return rows


def _sql_str(value: str) -> str:
    return "'" + value.replace('\\', '\\\\').replace("'", "''") + "'"


def _validate_task(task: str) -> str:
    task = task.strip().upper()
    if not TASK_RE.match(task):
        raise click.ClickException(
            f"'{task}' is not a valid task id — expected F-xxx or I-xxx (e.g. I-359, F-164D)")
    return task


def _pending_clause(pending_only: bool) -> str:
    return " AND `emitted_at` IS NULL" if pending_only else ""


def _fetch(task: Optional[str], pending_only: bool, entry_id: Optional[int] = None
           ) -> List[Dict[str, str]]:
    where = "1=1"
    if task:
        where += f" AND `task_id` = {_sql_str(task)}"
    if entry_id:
        where += f" AND `id` = {int(entry_id)}"
    where += _pending_clause(pending_only)
    return _rows(
        "SELECT `id`, `task_id`, `op`, `table_name`, `pk_value`, `column_name`, "
        "`old_value`, `new_value`, `character_name`, `created_at`, "
        "IFNULL(`emitted_at`, '') AS `emitted_at`, `emitted_file` "
        f"FROM `zep_edit_journal` WHERE {where} ORDER BY `id`")


def _collapse(entries: List[Dict[str, str]]) -> "OrderedDict":
    """Fold repeated edits to the same cell into one net change.

    A builder nudges the same object many times; only the first `old_value` and
    the last `new_value` matter. Keyed (table, pk) -> {column: (old, new)}, with
    the op recorded per target.
    """
    targets: "OrderedDict[Tuple[str, int], Dict]" = OrderedDict()
    for e in entries:
        key = (e['table_name'], int(e['pk_value']))
        target = targets.setdefault(key, {'op': e['op'], 'cols': OrderedDict(), 'ids': []})
        target['ids'].append(int(e['id']))

        # insert/delete outrank an update on the same row: the row's existence
        # changed, so emitting a column UPDATE for it would be meaningless.
        if e['op'] in ('insert', 'delete'):
            target['op'] = e['op']

        if e['column_name'] == '*':
            continue
        if e['column_name'] in target['cols']:
            first_old = target['cols'][e['column_name']][0]
            target['cols'][e['column_name']] = (first_old, e['new_value'])
        else:
            target['cols'][e['column_name']] = (e['old_value'], e['new_value'])
    return targets


def _live_row(table: str, guid: int) -> Optional[Dict[str, str]]:
    rows = _rows(f"SELECT * FROM `{table}` WHERE `guid` = {guid}")
    return rows[0] if rows else None


@click.group('edits')
def edits():
    """In-game spawn editor journal (F-208)."""
    pass


@edits.command('list')
@click.option('--task', '-t', help='Only this F-xxx / I-xxx')
@click.option('--pending', '-p', is_flag=True, help='Only edits not yet emitted')
def edits_list(task: Optional[str], pending: bool):
    """List journalled edits."""
    task = _validate_task(task) if task else None
    entries = _fetch(task, pending)
    if not entries:
        click.echo("No journalled edits." if not pending else "No pending edits.")
        return

    click.echo(f"\n{len(entries)} edit(s):\n")
    click.echo(f"{'id':>5}  {'task':<7} {'op':<7} {'target':<28} {'column':<12} "
               f"{'old':>12} -> {'new':<12} {'by':<14} state")
    click.echo("-" * 122)
    for e in entries:
        target = f"{e['table_name']}#{e['pk_value']}"
        state = 'pending' if not e['emitted_at'] else f"emitted {e['emitted_file']}"
        click.echo(f"{e['id']:>5}  {e['task_id']:<7} {e['op']:<7} {target:<28} "
                   f"{e['column_name']:<12} {e['old_value']:>12} -> {e['new_value']:<12} "
                   f"{e['character_name']:<14} {state}")

    targets = _collapse(entries)
    click.echo(f"\n{len(targets)} distinct row(s) touched.")


@edits.command('diff')
@click.option('--task', '-t', help='Only this F-xxx / I-xxx')
@click.option('--id', 'entry_id', type=int, help='A single journal row')
@click.option('--pending/--all', default=True, help='Pending only (default) or everything')
def edits_diff(task: Optional[str], entry_id: Optional[int], pending: bool):
    """Compare journalled edits against the current live rows.

    A journalled `new_value` that no longer matches the live row means something
    overwrote the edit after it was made — a regen, a rebuild, or another editor.
    """
    task = _validate_task(task) if task else None
    entries = _fetch(task, pending, entry_id)
    if not entries:
        click.echo("Nothing to diff.")
        return

    drift = 0
    for (table, guid), target in _collapse(entries).items():
        live = _live_row(table, guid)
        if live is None:
            click.echo(f"  {table}#{guid}: row is GONE from the live database")
            drift += 1
            continue
        for column, (old, new) in target['cols'].items():
            current = live.get(column, '')
            same = abs(float(current) - float(new)) < 0.0001 if _isfloat(current) and _isfloat(new) \
                else current == new
            mark = ' ' if same else '!'
            if not same:
                drift += 1
            click.echo(f" {mark} {table}#{guid} {column:<12} journal {old} -> {new}"
                       f"{'' if same else f'   LIVE IS {current}'}")

    click.echo("\nAll journalled edits still match the live rows." if not drift
               else f"\n{drift} value(s) drifted from the journal — investigate before emitting.")


def _same_value(a: str, b: str) -> bool:
    if _isfloat(a) and _isfloat(b):
        return abs(float(a) - float(b)) < 0.00005
    return a == b


def _isfloat(value: str) -> bool:
    try:
        float(value)
        return True
    except (TypeError, ValueError):
        return False


@edits.command('emit')
@click.option('--task', '-t', required=True, help='F-xxx / I-xxx to emit')
@click.option('--zpak', '-z', 'zpak_name', required=True, help='Target zpak (file lands in its sql/)')
@click.option('--file', 'filename', help='Override the generated filename')
@click.option('--slug', default='spawn_transforms', help='Filename slug (default: spawn_transforms)')
@click.option('--all', 'include_emitted', is_flag=True, help='Include already-emitted edits')
@click.option('--dry-run', '-n', is_flag=True, help='Print the SQL instead of writing it')
@click.pass_context
def edits_emit(ctx, task: str, zpak_name: str, filename: Optional[str], slug: str,
               include_emitted: bool, dry_run: bool):
    """Write journalled edits to a tagged, idempotent zpak SQL file."""
    task = _validate_task(task)
    craft_root: Path = ctx.obj['craft_root']

    zpak_dir = craft_root / 'zpaks' / zpak_name
    if not zpak_dir.is_dir():
        raise click.ClickException(f"No such zpak: {zpak_name}")
    sql_dir = zpak_dir / 'sql'
    if not sql_dir.is_dir():
        raise click.ClickException(f"{zpak_name} has no sql/ directory")

    entries = _fetch(task, not include_emitted)
    if not entries:
        click.echo(f"No {'pending ' if not include_emitted else ''}edits for {task}.")
        return

    targets = _collapse(entries)
    body, emitted_ids, skipped, drifted = _build_sql(task, targets)
    if not body:
        click.echo("Nothing emittable (all edits were on columns outside the allow-list).")
        return

    out_name = filename or f"zz_[{task}]_{slug}.sql"
    out_path = sql_dir / out_name

    header = [
        "-- " + "=" * 74,
        f"-- {task}  spawn transforms captured with the in-game editor (F-208)",
        "--",
        f"-- Generated by `zep world edits emit` on "
        f"{datetime.now().strftime('%Y-%m-%d %H:%M')}. Idempotent: re-running it",
        "-- restores exactly these values.",
        "--",
        "-- `-- was:` records the value the row held when the edit was made. If a row no",
        "-- longer holds that value, something overwrote the edit — check with",
        f"-- `zep world edits diff --task {task}` before trusting this file.",
        "-- " + "=" * 74,
        "",
    ]
    sql_text = "\n".join(header) + body

    if drifted:
        click.echo(click.style(
            "\n  WARNING: the live row no longer matches the journal for:", fg='yellow'))
        for d in drifted:
            click.echo(f"    {d}")
        click.echo("  Emitting the LIVE value — it is what the server actually holds.")
        click.echo("  If that is not what you intended, a regen or another editor may have")
        click.echo("  overwritten the work: check `zep world edits diff` before applying.\n")

    if dry_run:
        click.echo(sql_text)
        click.echo(f"\n-- would write {out_path} ({len(emitted_ids)} journal row(s))")
        return

    out_path.write_text(sql_text, encoding='utf-8')
    click.echo(f"✓ Wrote {out_path.relative_to(craft_root)} "
               f"({len(targets)} row(s), {len(emitted_ids)} journal entr(ies))")

    ids = ",".join(str(i) for i in emitted_ids)
    ok, err = run_mysql_query(
        f"UPDATE `zep_edit_journal` SET `emitted_at` = NOW(), "
        f"`emitted_file` = {_sql_str(str(out_path.relative_to(craft_root)))} "
        f"WHERE `id` IN ({ids})")
    if not ok:
        raise click.ClickException(f"Wrote the file but failed to mark the journal: {err}")

    if skipped:
        click.echo(f"  ({skipped} edit(s) skipped — column outside the allow-list)")
    click.echo(f"\nApply with: zep world sql changed")


def _build_sql(task: str, targets) -> Tuple[str, List[int], int, List[str]]:
    """Render collapsed targets as idempotent SQL.

    Rows we merely adjust get ONE consolidated UPDATE, so the diff from the
    shipped state is reviewable. Rows the editor created get DELETE + INSERT,
    because we own them and the INSERT is their final state.
    """
    chunks: List[str] = []
    emitted_ids: List[int] = []
    skipped = 0
    drifted: List[str] = []

    for (table, guid), target in targets.items():
        if table not in EMITTABLE:
            skipped += len(target['ids'])
            continue

        if target['op'] == 'delete':
            chunks.append(f"-- editor deleted this spawn\nDELETE FROM `{table}` WHERE `guid` = {guid};\n")
            emitted_ids.extend(target['ids'])
            continue

        if target['op'] == 'insert':
            live = _live_row(table, guid)
            if live is None:
                skipped += len(target['ids'])
                continue
            cols = [c for c in live.keys()]
            sets = ",\n".join(
                f"  `{c}` = " + (live[c] if _isfloat(live[c]) and live[c] != '' else _sql_str(live[c]))
                for c in cols if c != 'guid')
            chunks.append(
                f"-- editor-placed spawn\n"
                f"DELETE FROM `{table}` WHERE `guid` = {guid};\n"
                f"INSERT INTO `{table}` SET\n  `guid` = {guid},\n{sets};\n")
            emitted_ids.extend(target['ids'])
            continue

        # Drop columns whose net change is nothing — a builder who nudged out and
        # back leaves journal rows that describe no edit at all.
        allowed = [(c, ov, nv) for c, (ov, nv) in target['cols'].items()
                   if c in EMITTABLE[table] and not _same_value(ov, nv)]
        if not allowed:
            skipped += len(target['ids'])
            continue

        # Emit the LIVE value, not the journal's copy. The module journals through
        # a 4-decimal formatter, and that rounding is enough to push a rotation
        # quaternion outside AzerothCore's unit test
        # (`fabs(x*x+y*y+z*z+w*w - 1.0f) >= 1e-5f`, ObjectMgr.cpp:3064) — the row
        # would still render correctly, because the core falls back to deriving the
        # rotation from `orientation`, but it would log an sql.sql error for that
        # row on EVERY startup. The live row holds what the editor actually wrote,
        # at full precision, so prefer it whenever it still agrees with the journal.
        # The journal says WHICH rows and columns were touched; the LIVE row is the
        # authority on the values. Two independent reasons to prefer live:
        #
        # 1. precision — the module journals through a 4-decimal formatter, and that
        #    rounding alone can push a rotation quaternion outside AzerothCore's unit
        #    test (`fabs(x*x+y*y+z*z+w*w - 1.0f) >= 1e-5f`, ObjectMgr.cpp:3064). The
        #    row would still render right (the core falls back to deriving rotation
        #    from `orientation`) but would log an sql.sql error on EVERY startup.
        #
        # 2. completeness — the editor's baseline is ObjectMgr's startup cache, which
        #    its own saves do not refresh, so a second editing session starts from
        #    stale values and a column returned to its startup value is never
        #    journalled at all. The journal can therefore be a column short of the
        #    truth. (I-359 valve #1: orientation went 4.7997 -> 4.8870 -> 4.7997, and
        #    only the first leg was recorded.)
        #
        # Disagreement is still reported, because it can equally mean a regen or
        # another editor overwrote the work.
        live = _live_row(table, guid)
        rescued = []
        for c, ov, nv in allowed:
            actual = live.get(c) if live else None
            if actual is None:
                rescued.append((c, ov, nv))
                continue
            if not _same_value(actual, nv):
                drifted.append(f"{table}#{guid}.{c}: journal {nv}, live {actual} (emitting live)")
            rescued.append((c, ov, actual))

        # Re-run the no-op filter against the LIVE values. Substituting live can turn
        # a journalled change back into a no-op — exactly what happens when a column
        # was moved and then moved back across two editing sessions.
        allowed = [(c, ov, nv) for c, ov, nv in rescued if not _same_value(ov, nv)]
        if not allowed:
            skipped += len(target['ids'])
            continue

        # The comma must precede the comment: `--` runs to end of line, so a
        # trailing comma inside it would be swallowed and break the statement.
        lines = []
        for i, (c, ov, nv) in enumerate(allowed):
            comma = ',' if i < len(allowed) - 1 else ''
            lines.append(f"  `{c}` = {nv}{comma}   -- was: {ov}")
        sets = "\n".join(lines)
        chunks.append(f"UPDATE `{table}` SET\n{sets}\nWHERE `guid` = {guid};\n")
        emitted_ids.extend(target['ids'])

    return "\n".join(chunks), emitted_ids, skipped, drifted


@edits.command('drain')
@click.option('--task', '-t', help='Only this F-xxx / I-xxx')
@click.option('--purge', is_flag=True, help='Delete the rows instead of marking them emitted')
@click.option('--force', '-f', is_flag=True, help='Skip confirmation')
def edits_drain(task: Optional[str], purge: bool, force: bool):
    """Mark journal entries emitted, or purge them.

    Use after emitting by hand, or to discard experiments that were never meant
    to reach a SQL file.
    """
    task = _validate_task(task) if task else None
    entries = _fetch(task, pending_only=True)
    if not entries:
        click.echo("No pending edits.")
        return

    what = "purge" if purge else "mark emitted"
    if not force and not click.confirm(f"{what.capitalize()} {len(entries)} pending edit(s)"
                                       f"{' for ' + task if task else ''}?"):
        click.echo("Aborted.")
        return

    where = "`emitted_at` IS NULL"
    if task:
        where += f" AND `task_id` = {_sql_str(task)}"
    query = (f"DELETE FROM `zep_edit_journal` WHERE {where}" if purge
             else f"UPDATE `zep_edit_journal` SET `emitted_at` = NOW(), "
                  f"`emitted_file` = 'drained-by-hand' WHERE {where}")
    ok, err = run_mysql_query(query)
    if not ok:
        raise click.ClickException(f"Failed: {err}")
    click.echo(f"✓ {len(entries)} edit(s) {'purged' if purge else 'marked emitted'}.")
