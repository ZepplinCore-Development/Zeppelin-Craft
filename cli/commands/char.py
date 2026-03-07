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

    # Clear talent data directly (prevents crash-on-load from corrupt/missing talent entries)
    success, output = _run_query(f"DELETE FROM character_talent WHERE guid = {guid}")
    if not success:
        raise click.ClickException(f"Failed to clear talents: {output}")

    # Set at-login flag so server does a full clean reset (relearns class spells, pet talents, etc.)
    success, output = _run_query(
        f"UPDATE characters SET at_login = at_login | {RESET_FLAGS}, "
        f"resettalents_cost = 0, resettalents_time = 0 WHERE guid = {guid}"
    )
    if not success:
        raise click.ClickException(f"Update failed: {output}")

    click.echo(f"  {char_name}: talents cleared and will reset on next login")
