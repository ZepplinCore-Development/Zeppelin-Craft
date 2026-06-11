"""
Character operations for Zeppelin-Craft CLI.

Commands:
    zep char morph <name> --race <race> --gender <gender>
"""

import os
import subprocess
import tempfile
from pathlib import Path
from typing import List, Optional, Tuple

import click
from dotenv import load_dotenv

# Load .env from cli directory
_cli_dir = Path(__file__).parent.parent
_env_file = _cli_dir / '.env'
if _env_file.exists():
    load_dotenv(_env_file)

# Characters database connection
CHARS_DB_HOST = os.getenv('CHARS_DB_HOST', '192.168.0.55')
CHARS_DB_PORT = os.getenv('CHARS_DB_PORT', '3306')
CHARS_DB_USER = os.getenv('CHARS_DB_USER', 'chars')
CHARS_DB_PASS = os.getenv('CHARS_DB_PASS', '')
CHARS_DB_NAME = os.getenv('CHARS_DB_NAME', 'acore_characters')

# World database connection (item_template lookups for `mail`)
WORLD_DB_HOST = os.getenv('DB_HOST', '192.168.0.55')
WORLD_DB_PORT = os.getenv('DB_PORT', '3306')
WORLD_DB_USER = os.getenv('DB_USER', 'acore')
WORLD_DB_PASS = os.getenv('DB_PASS', 'acore')
WORLD_DB_NAME = 'acore_world'

# Race name -> ID mapping (display order)
RACE_LIST = [
    ('human', 1),
    ('orc', 2),
    ('dwarf', 3),
    ('nightelf', 4),
    ('undead', 5),
    ('tauren', 6),
    ('gnome', 7),
    ('troll', 8),
    ('goblin', 9),
    ('bloodelf', 10),
    ('draenei', 11),
    ('worgen', 12),
]

RACES = {name: rid for name, rid in RACE_LIST}
RACE_NAMES = {rid: name for name, rid in RACE_LIST}

GENDERS = {
    'male': 0, 'm': 0, '0': 0,
    'female': 1, 'f': 1, '1': 1,
}

GENDER_NAMES = {0: 'Male', 1: 'Female'}


def _create_mysql_config() -> str:
    """Create a temporary MySQL config file with characters DB credentials."""
    fd, path = tempfile.mkstemp(suffix='.cnf')
    with os.fdopen(fd, 'w') as f:
        f.write("[client]\n")
        f.write(f"user={CHARS_DB_USER}\n")
        f.write(f"password=\"{CHARS_DB_PASS}\"\n")
        f.write(f"host={CHARS_DB_HOST}\n")
        f.write(f"port={CHARS_DB_PORT}\n")
    return path


def _run_query(query: str) -> Tuple[bool, str]:
    """Run a MySQL query against the characters database."""
    cnf_path = _create_mysql_config()
    try:
        cmd = ["mysql", f"--defaults-extra-file={cnf_path}", CHARS_DB_NAME, "-e", query]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            return False, result.stderr.strip()
        return True, result.stdout.strip()
    except Exception as e:
        return False, str(e)
    finally:
        os.unlink(cnf_path)


def _create_world_mysql_config() -> str:
    """Create a temporary MySQL config file with world DB credentials."""
    fd, path = tempfile.mkstemp(suffix='.cnf')
    with os.fdopen(fd, 'w') as f:
        f.write("[client]\n")
        f.write(f"user={WORLD_DB_USER}\n")
        f.write(f"password=\"{WORLD_DB_PASS}\"\n")
        f.write(f"host={WORLD_DB_HOST}\n")
        f.write(f"port={WORLD_DB_PORT}\n")
    return path


def _run_world_query(query: str) -> Tuple[bool, str]:
    """Run a MySQL query against the world database."""
    cnf_path = _create_world_mysql_config()
    try:
        cmd = ["mysql", f"--defaults-extra-file={cnf_path}", WORLD_DB_NAME, "-e", query]
        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            return False, result.stderr.strip()
        return True, result.stdout.strip()
    except Exception as e:
        return False, str(e)
    finally:
        os.unlink(cnf_path)


def _sql_escape(s: str) -> str:
    """Escape single quotes for SQL string literals (CLAUDE.md convention)."""
    return s.replace("'", "''")


def _parse_race(value: str) -> int:
    """Parse race from name or numeric ID."""
    lower = value.lower().replace(' ', '').replace('_', '').replace('-', '')
    if lower in RACES:
        return RACES[lower]
    try:
        race_id = int(value)
        if race_id in RACE_NAMES:
            return race_id
        raise click.ClickException(f"Unknown race ID: {race_id}")
    except ValueError:
        valid = ', '.join(sorted(RACES.keys()))
        raise click.ClickException(f"Unknown race '{value}'. Valid: {valid}")


def _parse_gender(value: str) -> int:
    """Parse gender from name or numeric ID."""
    lower = value.lower().strip()
    if lower in GENDERS:
        return GENDERS[lower]
    raise click.ClickException(f"Unknown gender '{value}'. Use: male/m/0 or female/f/1")


def _prompt_race(current_race: int) -> int:
    """Show interactive race picker."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        raise click.ClickException("Install simple-term-menu for interactive selection")

    entries = []
    current_idx = 0
    for i, (name, rid) in enumerate(RACE_LIST):
        marker = " (current)" if rid == current_race else ""
        entries.append(f"  {name.title()}{marker}")
        if rid == current_race:
            current_idx = i

    entries.append("  [Cancel]")

    menu = TerminalMenu(
        entries,
        title="\n  Select Race:\n",
        cursor_index=current_idx,
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    idx = menu.show()

    if idx is None or idx == len(RACE_LIST):
        return current_race
    return RACE_LIST[idx][1]


def _prompt_gender(current_gender: int) -> int:
    """Show interactive gender picker."""
    try:
        from simple_term_menu import TerminalMenu
    except ImportError:
        raise click.ClickException("Install simple-term-menu for interactive selection")

    entries = []
    for gid, gname in GENDER_NAMES.items():
        marker = " (current)" if gid == current_gender else ""
        entries.append(f"  {gname}{marker}")

    entries.append("  [Cancel]")

    menu = TerminalMenu(
        entries,
        title="\n  Select Gender:\n",
        cursor_index=current_gender,
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
    )
    idx = menu.show()

    if idx is None or idx == len(GENDER_NAMES):
        return current_gender
    return idx


@click.group()
def char():
    """Character operations."""
    pass


@char.command('morph')
@click.argument('name')
@click.option('--race', '-r', 'race', help='Race name or ID')
@click.option('--gender', '-g', 'gender', help='Gender: male/m/0 or female/f/1')
def char_morph(name: str, race: Optional[str], gender: Optional[str]):
    """Change a character's race and/or gender.

    Examples:
        zep char morph One --race draenei --gender male
        zep char morph One -r worgen -g f
        zep char morph One -r 12
        zep char morph One -g male
    """
    # Look up current character
    success, output = _run_query(
        f"SELECT guid, name, race, gender, class FROM characters WHERE name = '{name}'"
    )
    if not success:
        raise click.ClickException(f"Query failed: {output}")

    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"Character '{name}' not found")

    fields = lines[1].split('\t')
    guid = fields[0]
    char_name = fields[1]
    cur_race = int(fields[2])
    cur_gender = int(fields[3])

    cur_race_name = RACE_NAMES.get(cur_race, f'Unknown({cur_race})')
    cur_gender_name = GENDER_NAMES.get(cur_gender, f'Unknown({cur_gender})')

    click.echo(f"  {char_name}: {cur_race_name.title()} {cur_gender_name}")

    # Interactive mode if no flags provided
    if not race and not gender:
        new_race = _prompt_race(cur_race)
        new_gender = _prompt_gender(cur_gender)
    else:
        new_race = _parse_race(race) if race else cur_race
        new_gender = _parse_gender(gender) if gender else cur_gender

    new_race_name = RACE_NAMES.get(new_race, f'Unknown({new_race})')
    new_gender_name = GENDER_NAMES.get(new_gender, f'Unknown({new_gender})')

    if new_race == cur_race and new_gender == cur_gender:
        click.echo(f"  No change")
        return

    # Build update
    updates = []
    if new_race != cur_race:
        updates.append(f"race={new_race}")
    if new_gender != cur_gender:
        updates.append(f"gender={new_gender}")

    set_clause = ', '.join(updates)
    success, output = _run_query(f"UPDATE characters SET {set_clause} WHERE guid={guid}")
    if not success:
        raise click.ClickException(f"Update failed: {output}")

    click.echo(f"  {char_name}: {cur_race_name.title()} {cur_gender_name} -> {new_race_name.title()} {new_gender_name}")


char_morph.menu_passthrough = True


@char.command('reset-talents')
@click.argument('name')
def char_reset_talents(name: str):
    """Reset a character's talents on next login. Character must be offline.

    Sets the AT_LOGIN_RESET_TALENTS flag so the server handles the full
    reset (talents, spells, and pet talents) on next login.

    Examples:
        zep world char reset-talents Vera
        zep world char reset-talents One
    """
    AT_LOGIN_RESET_TALENTS = 0x04
    AT_LOGIN_RESET_PET_TALENTS = 0x10
    RESET_FLAGS = AT_LOGIN_RESET_TALENTS | AT_LOGIN_RESET_PET_TALENTS

    # Look up character
    success, output = _run_query(
        f"SELECT guid, name, online, at_login FROM characters WHERE name = '{name}'"
    )
    if not success:
        raise click.ClickException(f"Query failed: {output}")

    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"Character '{name}' not found")

    fields = lines[1].split('\t')
    guid = fields[0]
    char_name = fields[1]
    online = int(fields[2])
    at_login = int(fields[3])

    if online:
        raise click.ClickException(f"{char_name} is online — log out first")

    # Remove talent-granted spells from character_spell before clearing talent rows
    # (character_talent references spells the server would normally removeSpell() during reset)
    success, output = _run_query(
        f"DELETE cs FROM character_spell cs "
        f"INNER JOIN character_talent ct ON cs.guid = ct.guid AND cs.spell = ct.spell "
        f"WHERE cs.guid = {guid}"
    )
    if not success:
        raise click.ClickException(f"Failed to clear talent spells: {output}")

    # Clear talent data (prevents crash-on-load from corrupt/missing DBC talent entries)
    success, output = _run_query(f"DELETE FROM character_talent WHERE guid = {guid}")
    if not success:
        raise click.ClickException(f"Failed to clear talents: {output}")

    # Set at-login flag so server does a full clean reset (pet talents, etc.)
    success, output = _run_query(
        f"UPDATE characters SET at_login = at_login | {RESET_FLAGS}, "
        f"resettalents_cost = 0, resettalents_time = 0 WHERE guid = {guid}"
    )
    if not success:
        raise click.ClickException(f"Update failed: {output}")

    click.echo(f"  {char_name}: talents and talent spells cleared, will reset on next login")


MAX_MAIL_ITEMS = 12
ENCHANTMENTS_BLANK = '0 ' * 36  # 12 slots × 3 values, space-separated, trailing space


def _alloc_id(table: str, column: str, offset: int) -> int:
    """Pick a guid/id far enough ahead of the worldserver's in-memory generator
    to avoid the REPLACE INTO race documented in F-178."""
    success, output = _run_query(f"SELECT COALESCE(MAX({column}), 0) FROM {table}")
    if not success:
        raise click.ClickException(f"MAX({column}) query on {table} failed: {output}")
    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"unexpected output from MAX({column}): {output!r}")
    return int(lines[1]) + offset


@char.command('mail')
@click.argument('name')
@click.argument('items', nargs=-1, metavar='ITEM:QTY[,ITEM:QTY...]')
@click.option('--subject', default='Mail from System', help='Mail subject')
@click.option('--body', default='', help='Mail body text')
@click.option('--money', type=int, default=0, help='Copper attached to the mail')
@click.option('--cod', type=int, default=0, help='COD copper (receiver pays before claiming)')
@click.option('--offset', 'offset', type=int, default=50_000_000,
              help='Guid allocation offset above MAX(guid) — outruns the worldserver in-memory generator')
@click.option('--dry-run', is_flag=True, help='Print the composed SQL block without executing')
def char_mail(name: str, items: Tuple[str, ...], subject: str, body: str,
              money: int, cod: int, offset: int, dry_run: bool):
    """Mail items and/or money to a character (system sender).

    Examples:
        zep world char mail Vera 13926                       # 1× Golden Pearl
        zep world char mail Vera 13926:5,12811:1 --subject "Pearls"
        zep world char mail Vera --money 100000 --subject "Compensation"
    """
    if not items and money == 0 and cod == 0:
        raise click.ClickException("must supply items, --money, or --cod")
    if money < 0 or cod < 0 or offset < 0:
        raise click.ClickException("--money, --cod, and --offset must be ≥ 0")

    # Parse ENTRY[:COUNT] tokens (comma- and/or space-separated)
    parsed: List[Tuple[int, int]] = []
    tokens = [t.strip() for raw in items for t in raw.split(',') if t.strip()]
    for raw in tokens:
        if ':' in raw:
            entry_s, count_s = raw.split(':', 1)
        else:
            entry_s, count_s = raw, '1'
        try:
            entry = int(entry_s)
            count = int(count_s)
        except ValueError:
            raise click.ClickException(f"bad item arg '{raw}' — expected ENTRY[:COUNT]")
        if entry <= 0:
            raise click.ClickException(f"item entry must be > 0 (got {entry})")
        if count <= 0:
            raise click.ClickException(f"item {entry} count must be ≥ 1 (got {count})")
        parsed.append((entry, count))

    # Look up receiver
    success, output = _run_query(
        f"SELECT guid, name FROM characters WHERE name = '{_sql_escape(name)}'"
    )
    if not success:
        raise click.ClickException(f"Query failed: {output}")
    lines = output.strip().split('\n')
    if len(lines) < 2:
        raise click.ClickException(f"Character '{name}' not found")
    fields = lines[1].split('\t')
    receiver_guid = int(fields[0])
    char_name = fields[1]

    # Resolve each item entry against world DB, split stacks
    item_rows: List[Tuple[int, int, str, int, str]] = []  # (entry, count, name, durability, charges_str)
    for entry, count in parsed:
        success, output = _run_world_query(
            "SELECT entry, name, stackable, MaxDurability, "
            "spellcharges_1, spellcharges_2, spellcharges_3, spellcharges_4, spellcharges_5 "
            f"FROM item_template WHERE entry = {entry}"
        )
        if not success:
            raise click.ClickException(f"World query failed for item {entry}: {output}")
        lines = output.strip().split('\n')
        if len(lines) < 2:
            raise click.ClickException(f"item {entry} not found in item_template")
        f = lines[1].split('\t')
        iname = f[1]
        stackable = max(1, int(f[2]))
        durability = int(f[3])
        charges_str = ' '.join(f[4:9]) + ' '
        remaining = count
        while remaining > 0:
            chunk = min(remaining, stackable)
            item_rows.append((entry, chunk, iname, durability, charges_str))
            remaining -= chunk

    if len(item_rows) > MAX_MAIL_ITEMS:
        raise click.ClickException(
            f"{len(item_rows)} item rows after stack splitting — exceeds MAX_MAIL_ITEMS ({MAX_MAIL_ITEMS})"
        )

    # Allocate ids (single SELECT MAX per table; race-safe via offset)
    base_item_guid = _alloc_id('item_instance', 'guid', offset) if item_rows else 0
    mail_id = _alloc_id('mail', 'id', offset)

    # Compose SQL
    subj_esc = _sql_escape(subject)
    body_esc = _sql_escape(body)
    has_items = 1 if item_rows else 0

    statements: List[str] = ['START TRANSACTION;']
    item_guids: List[int] = []
    for i, (entry, count, _, durability, charges_str) in enumerate(item_rows):
        gid = base_item_guid + i
        item_guids.append(gid)
        statements.append(
            "INSERT INTO item_instance "
            "(guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, count, duration, "
            "charges, flags, enchantments, randomPropertyId, durability, playedTime, text) "
            f"VALUES ({gid}, {entry}, {receiver_guid}, 0, 0, {count}, 0, "
            f"'{charges_str}', 0, '{ENCHANTMENTS_BLANK}', 0, {durability}, 0, NULL);"
        )

    statements.append(
        "INSERT INTO mail "
        "(id, messageType, stationery, mailTemplateId, sender, receiver, subject, body, "
        "has_items, expire_time, deliver_time, money, cod, checked) "
        f"VALUES ({mail_id}, 0, 41, 0, 0, {receiver_guid}, '{subj_esc}', '{body_esc}', "
        f"{has_items}, UNIX_TIMESTAMP()+2592000, UNIX_TIMESTAMP(), {money}, {cod}, 16);"
    )
    for gid in item_guids:
        statements.append(
            f"INSERT INTO mail_items (mail_id, item_guid, receiver) "
            f"VALUES ({mail_id}, {gid}, {receiver_guid});"
        )
    statements.append('COMMIT;')

    sql_block = '\n'.join(statements)

    if dry_run:
        click.echo(sql_block)
        return

    success, output = _run_query(sql_block)
    if not success:
        raise click.ClickException(f"Insert failed: {output}")

    # Summary
    if item_rows:
        summary = ', '.join(f"{c}× {n} ({e})" for e, c, n, _, _ in item_rows)
    else:
        summary = '—'
    parts = [f"  {char_name}: mailed {summary}"]
    if money:
        parts.append(f"+ {money}c money")
    if cod:
        parts.append(f"(COD {cod}c)")
    click.echo(' '.join(parts))
    if item_guids:
        if len(item_guids) == 1:
            click.echo(f"  mail id {mail_id}  item guid {item_guids[0]}")
        else:
            click.echo(f"  mail id {mail_id}  item guids {item_guids[0]}..{item_guids[-1]}")
    else:
        click.echo(f"  mail id {mail_id}")
    click.echo(f"  note: {char_name} must relog (or zone-change) to see the new mail")
