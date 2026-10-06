"""
Character operations for Zeppelin-Craft CLI.

Commands:
    zep char morph <name> --race <race> --gender <gender>
"""

import os
import subprocess
import tempfile
from pathlib import Path
from typing import Dict, List, Optional, Tuple

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


# ---------------------------------------------------------------------------
# test-setup (F-213)
# ---------------------------------------------------------------------------

CLASSES = {
    'warrior': 1, 'paladin': 2, 'hunter': 3, 'rogue': 4, 'priest': 5,
    'deathknight': 6, 'dk': 6, 'shaman': 7, 'mage': 8, 'warlock': 9, 'druid': 11,
}
CLASS_NAMES = {1: 'Warrior', 2: 'Paladin', 3: 'Hunter', 4: 'Rogue', 5: 'Priest',
               6: 'Death Knight', 7: 'Shaman', 8: 'Mage', 9: 'Warlock', 11: 'Druid'}

AT_LOGIN_RESET_SPELLS = 0x02
TEST_CHAR_GUID_OFFSET = 100    # ahead of the worldserver's in-memory char guid counter
QUEST_STATUS_INCOMPLETE = 3

# Tables Player::DeleteFromDB clears, keyed by the column holding the char guid,
# plus the per-guid state it leaves to other paths. --replace only.
REPLACE_WIPE = [
    ('character_account_data', 'guid'), ('character_achievement', 'guid'),
    ('character_achievement_progress', 'guid'), ('character_action', 'guid'),
    ('character_aura', 'guid'), ('character_declinedname', 'guid'),
    ('character_equipmentsets', 'guid'), ('character_gifts', 'guid'),
    ('character_glyphs', 'guid'), ('character_homebind', 'guid'),
    ('character_instance', 'guid'), ('character_inventory', 'guid'),
    ('character_pet', 'owner'), ('character_queststatus', 'guid'),
    ('character_queststatus_daily', 'guid'), ('character_queststatus_monthly', 'guid'),
    ('character_queststatus_rewarded', 'guid'), ('character_queststatus_seasonal', 'guid'),
    ('character_queststatus_weekly', 'guid'), ('character_reputation', 'guid'),
    ('character_skills', 'guid'), ('character_social', 'guid'), ('character_social', 'friend'),
    ('character_spell', 'guid'), ('character_spell_cooldown', 'guid'),
    ('character_talent', 'guid'), ('item_instance', 'owner_guid'),
    ('mail_items', 'receiver'), ('mail', 'receiver'), ('characters', 'guid'),
]


def _wipe_statements(guid: int) -> List[str]:
    """DELETEs for every row a character owns. Pet child tables are keyed by the
    pet id, so they are cleared through character_pet before it goes (as
    Pet::DeleteFromDB does)."""
    pets = f"SELECT id FROM character_pet WHERE owner = {guid}"
    stmts = [f"DELETE FROM {t} WHERE guid IN ({pets});"
             for t in ('pet_aura', 'pet_spell', 'pet_spell_cooldown')]
    stmts.append(f"DELETE FROM character_pet_declinedname WHERE id IN ({pets});")
    stmts += [f"DELETE FROM {table} WHERE {col} = {guid};" for table, col in REPLACE_WIPE]
    return stmts


def _rows(output: str) -> List[dict]:
    """Parse mysql -e tab output into a list of dicts."""
    lines = [l for l in output.split('\n') if l != '']
    if not lines:
        return []
    head = lines[0].split('\t')
    return [dict(zip(head, l.split('\t'))) for l in lines[1:]]


def _q(runner, sql: str) -> List[dict]:
    ok, out = runner(sql)
    if not ok:
        raise click.ClickException(f"Query failed: {out}\n  {sql[:200]}")
    return _rows(out)


def _run_auth_query(sql: str) -> Tuple[bool, str]:
    from commands.sql import run_mysql_query_as_root
    return run_mysql_query_as_root(sql, 'acore_auth')


def _parse_class(value: str) -> int:
    lower = value.lower().replace(' ', '').replace('_', '').replace('-', '')
    if lower in CLASSES:
        return CLASSES[lower]
    try:
        cid = int(value)
    except ValueError:
        raise click.ClickException(f"Unknown class '{value}'. Valid: {', '.join(sorted(CLASSES))}")
    if cid not in CLASS_NAMES:
        raise click.ClickException(f"Unknown class ID: {cid}")
    return cid


def _quest_prereqs(targets: List[int], race: int, cls: int) -> Tuple[List[int], List[int], List[int]]:
    """Every quest that must be rewarded before the targets are available.

    Walks backwards through PrevQuestID (abs), NextQuestID pointing at the quest,
    and quest-available conditions (SourceType 19, lowest ElseGroup, types
    8 rewarded / 28 complete / 9 taken). Returns (needed, skipped_race_class,
    negative_prev_warnings).
    """
    race_bit = 1 << (race - 1)
    class_bit = 1 << (cls - 1)
    info = {}

    def load(ids):
        ids = [i for i in ids if i not in info]
        if not ids:
            return
        idl = ','.join(map(str, ids))
        for r in _q(_run_world_query,
                    "SELECT q.ID, q.AllowableRaces, IFNULL(a.AllowableClasses,0) AllowableClasses, "
                    "IFNULL(a.PrevQuestID,0) PrevQuestID FROM quest_template q "
                    f"LEFT JOIN quest_template_addon a ON a.ID = q.ID WHERE q.ID IN ({idl})"):
            info[int(r['ID'])] = r
        for i in ids:
            info.setdefault(i, None)

    def preds(qid):
        out, neg = set(), set()
        r = info.get(qid)
        if r and int(r['PrevQuestID']):
            p = int(r['PrevQuestID'])
            (neg if p < 0 else out).add(abs(p))
        for n in _q(_run_world_query,
                    f"SELECT ID FROM quest_template_addon WHERE NextQuestID = {qid}"):
            out.add(int(n['ID']))
        conds = _q(_run_world_query,
                   "SELECT ElseGroup, ConditionValue1 FROM conditions "
                   f"WHERE SourceTypeOrReferenceId = 19 AND SourceEntry = {qid} "
                   "AND ConditionTypeOrReference IN (8, 9, 28) AND NegativeCondition = 0")
        if conds:
            first = min(int(c['ElseGroup']) for c in conds)
            out |= {int(c['ConditionValue1']) for c in conds if int(c['ElseGroup']) == first}
        return out, neg

    needed, skipped, negative = set(), set(), set()
    stack = list(targets)
    load(stack)
    seen = set(stack)
    while stack:
        qid = stack.pop()
        p, n = preds(qid)
        negative |= n
        new = [x for x in (p | n) if x not in seen]
        load(new)
        for x in new:
            seen.add(x)
            r = info.get(x)
            if r is None:
                continue
            races, classes = int(r['AllowableRaces']), int(r['AllowableClasses'])
            if (races and not races & race_bit) or (classes and not classes & class_bit):
                skipped.add(x)
                continue
            needed.add(x)
            stack.append(x)
    return sorted(needed), sorted(skipped), sorted(negative)


# Heirlooms per class, head to toe: the stock 3.3.5a shoulders/chest/weapons/
# trinket/ring plus the F-214 per-slot pieces (head, legs, feet, waist, hands,
# wrists - zpaks/zep-items/sql/zz_[F-214]_*_heirlooms.sql). Ids are
# item_template entries (Quality 7). Items a class/level can't equip yet (e.g.
# dual wield) are mailed by the core on login, not lost. The second trinket is
# the faction's Inherited Insignia (_insignia), picked by race.
TRINKET_MELEE = 42991   # Swift Hand of Justice
TRINKET_CASTER = 42992  # Discerning Eye of the Beast
RING = 50255            # Dread Pirate Ring (unique-equipped)
INSIGNIA = (44097, 44098)   # Inherited Insignia of the Horde / of the Alliance
WAND = 85042               # Tattered Dreadmist Wand (F-214; shield/relic heirlooms 85036-85041)
SET_PLATE = [42949, 48685] + list(range(85012, 85018))           # Polished Valor
SET_MAIL_AGI = [42950, 48677] + list(range(85006, 85012))        # Champion Herod
SET_MAIL_INT = [42951, 48683] + list(range(85018, 85024))        # Mystical Elements
SET_LEATHER_AGI = [42952, 48689] + list(range(85024, 85030))     # Stained Shadowcraft
SET_LEATHER_INT = [42984, 48687] + list(range(85030, 85036))     # Preened Ironfeather
SET_CLOTH = [42985, 48691] + list(range(85000, 85006))           # Tattered Dreadmist
HEIRLOOMS = {
    1:  SET_PLATE + [42943, TRINKET_MELEE, RING],                 # warrior: 2H axe
    2:  SET_PLATE + [44092, 85039, TRINKET_MELEE, RING],          # paladin: 2H sword, libram
    3:  SET_MAIL_AGI + [42943, 42946, TRINKET_MELEE, RING],       # hunter: 2H axe, bow/gun
    4:  SET_LEATHER_AGI + [42944, 44091, 44093, TRINKET_MELEE, RING],  # rogue: 2 daggers, gun/bow
    5:  SET_CLOTH + [42947, WAND, TRINKET_CASTER, RING],          # priest: staff, wand
    6:  SET_PLATE + [42943, 85041, TRINKET_MELEE, RING],          # death knight: 2H axe, sigil
    7:  SET_MAIL_INT + [42948, 85037, 85038, TRINKET_CASTER, RING],  # shaman: caster mace, shield, totem
    8:  SET_CLOTH + [42947, WAND, TRINKET_CASTER, RING],          # mage: staff, wand
    9:  SET_CLOTH + [42947, WAND, TRINKET_CASTER, RING],          # warlock: staff, wand
    11: SET_LEATHER_INT + [42947, 85040, TRINKET_CASTER, RING],   # druid: staff, idol
}


def _insignia(race: int) -> Optional[int]:
    race_bit = 1 << (race - 1)
    for r in _q(_run_world_query, "SELECT entry, AllowableRace FROM item_template "
                f"WHERE entry IN ({', '.join(map(str, INSIGNIA))})"):
        if int(r['AllowableRace']) & race_bit:
            return int(r['entry'])
    return None


# Ranged heirlooms by the weapon skill the race/class starts with (playercreateinfo_skills).
# Hunters: bows for orc/night elf/troll/blood elf, guns for dwarf/tauren/goblin/worgen - a
# goblin given the bow had it mailed back on login ("problems with equipping").
RANGED_HEIRLOOM_BY_SKILL = {45: 42946, 46: 44093}   # Bows -> Charmed Ancient Bone Bow, Guns -> Upgraded Dwarven Hand Cannon


def _ranged_heirloom(race: int, cls: int) -> Optional[int]:
    race_bit, class_bit = 1 << (race - 1), 1 << (cls - 1)
    for r in _q(_run_world_query,
                "SELECT skill FROM playercreateinfo_skills WHERE skill IN (45, 46) "
                f"AND (raceMask = 0 OR raceMask & {race_bit}) AND (classMask = 0 OR classMask & {class_bit})"):
        return RANGED_HEIRLOOM_BY_SKILL[int(r['skill'])]
    return None


# Ammo for an equipped bow/crossbow (arrows) or gun (bullets): the best common vendor ammo
# the level allows, two full stacks, in the matching quiver/ammo pouch in the first bag slot,
# and set as the character's equipped ammo (characters.ammoId).
AMMO_FOR_WEAPON_SUBCLASS = {2: 2, 18: 2, 3: 3}      # bow, crossbow -> arrows; gun -> bullets
CONTAINER_FOR_AMMO = {2: 2, 3: 3}                   # arrows -> quiver, bullets -> ammo pouch
BAG_SLOT_FIRST = 19                                 # INVENTORY_SLOT_BAG_START
_JUNK_NAME = "(name LIKE '%Deprecated%' OR name LIKE '%Depricated%' OR name LIKE 'Test %' " \
             "OR name LIKE 'Monster%' OR name LIKE 'Crafted%' OR name IN ('Smooth Pebble', 'Flash Pellet'))"


def _ammo_kit(weapon_subclass: int, level: int) -> Optional[Tuple[dict, dict]]:
    ammo_sub = AMMO_FOR_WEAPON_SUBCLASS.get(weapon_subclass)
    if ammo_sub is None:
        return None
    ammo = _q(_run_world_query,
              "SELECT entry, name, stackable FROM item_template WHERE class = 6 AND subclass = "
              f"{ammo_sub} AND Quality = 1 AND BuyPrice > 0 AND entry < 56900 AND RequiredLevel <= {level} "
              f"AND NOT {_JUNK_NAME} ORDER BY RequiredLevel DESC, ItemLevel DESC LIMIT 1")
    bag = _q(_run_world_query,
             "SELECT entry, name, ContainerSlots, MaxDurability FROM item_template WHERE class = 11 AND subclass = "
             f"{CONTAINER_FOR_AMMO[ammo_sub]} AND Quality = 1 AND BuyPrice > 0 AND entry < 56900 "
             f"AND RequiredLevel <= {level} AND NOT {_JUNK_NAME} "
             "ORDER BY RequiredLevel DESC, ContainerSlots DESC LIMIT 1")
    return (ammo[0], bag[0]) if ammo and bag else None


# Weapon item subclass -> (weapon skill, proficiency spell that grants it).
WEAPON_SKILL = {0: (44, 196), 1: (172, 197), 2: (45, 264), 3: (46, 266), 4: (54, 198),
                5: (160, 199), 6: (229, 200), 7: (43, 201), 8: (55, 202), 10: (136, 227),
                13: (473, 15590), 15: (173, 1180), 16: (176, 2567), 18: (226, 5011), 19: (228, 5009)}
SKILL_CATEGORY_WEAPON = 6   # SkillLine.category: weapon skills, Defense and Unarmed


def _combat_skills(race: int, cls: int, weapon_subclasses) -> Tuple[Dict[int, int], List[str]]:
    """Weapon/Defense skills to max for the level: the class's starting ones
    (playercreateinfo_skills in SkillLine category 6) plus one per equipped weapon.
    Returns {skill: proficiency spell or 0} and warnings. The core relearns starting
    skills at value 1 on every load unless character_skills already has the row; a
    row it can't place in SkillRaceClassInfo is deleted, so those are skipped here."""
    race_bit, class_bit = 1 << (race - 1), 1 << (cls - 1)
    skills: Dict[int, int] = {}
    for r in _q(_run_world_query,
                "SELECT skill FROM playercreateinfo_skills "
                f"WHERE (raceMask = 0 OR raceMask & {race_bit}) AND (classMask = 0 OR classMask & {class_bit})"):
        skills[int(r['skill'])] = 0
    for sub in weapon_subclasses:
        if sub in WEAPON_SKILL:
            skill, spell = WEAPON_SKILL[sub]
            skills.setdefault(skill, spell)
    if not skills:
        return {}, []
    ids = ','.join(map(str, skills))
    weapon = {int(r['id']) for r in _dbc_rows(
        f"SELECT id FROM skillline WHERE id IN ({ids}) AND category = {SKILL_CATEGORY_WEAPON}")}
    allowed = {int(r['skill_id']) for r in _dbc_rows(
        f"SELECT skill_id FROM skillraceclassinfo WHERE skill_id IN ({ids}) "
        f"AND race_mask & {race_bit} AND class_mask & {class_bit}")}
    warnings = [f"weapon skill {s} not allowed for this race/class (SkillRaceClassInfo), skipped"
                for s in sorted(skills) if s in weapon and s not in allowed]
    return {s: sp for s, sp in skills.items() if s in weapon and s in allowed}, warnings


# InventoryType -> equipment slot (first free of the list)
INV_SLOTS = {1: [0], 2: [1], 3: [2], 4: [3], 5: [4], 20: [4], 6: [5], 7: [6], 8: [7],
             9: [8], 10: [9], 11: [10, 11], 12: [12, 13], 16: [14], 19: [18],
             13: [15, 16], 21: [15], 17: [15], 22: [16], 23: [16], 14: [16],
             15: [17], 25: [17], 26: [17], 28: [17]}
# Headroom over MAX(item_instance.guid) for items the worldserver creates in
# memory before the next restart (F-178). Kept small: guids are uint32 and
# every allocation raises MAX (the `mail` default of 50M would exhaust the
# range in ~60 runs from today's ~1.1e9).
ITEM_GUID_OFFSET = 1_000_000
SPELL_EFFECT_LEARN_SPELL = 36


def _dbc_rows(sql: str) -> List[dict]:
    from commands.dbc import get_dbc_config
    from lib.dbc_utils import run_sql
    config = get_dbc_config(click.get_current_context())
    ok, out = run_sql(sql, config, config.live)
    if not ok:
        raise click.ClickException(f"DBC query failed: {out}")
    return _rows(out)


def _resolve_learn(spell_ids) -> Dict[int, List[int]]:
    """Map each spell to what it actually teaches: a LEARN_SPELL (36) effect's
    trigger spell(s), else the spell itself (the trainer/quest-reward rule)."""
    ids = sorted(set(spell_ids))
    if not ids:
        return {}
    out = {i: [i] for i in ids}
    for r in _dbc_rows(
            "SELECT id, effect_1, effect_2, effect_3, effect_trigger_spell_1, "
            "effect_trigger_spell_2, effect_trigger_spell_3 FROM spell "
            f"WHERE id IN ({','.join(map(str, ids))})"):
        learned = [int(r[f'effect_trigger_spell_{n}']) for n in (1, 2, 3)
                   if int(r[f'effect_{n}']) == SPELL_EFFECT_LEARN_SPELL
                   and int(r[f'effect_trigger_spell_{n}'])]
        if learned:
            out[int(r['id'])] = learned
    return out


def _class_spells(race: int, cls: int, level: int) -> List[int]:
    """Everything this race/class's class trainers teach up to `level`."""
    rows = _q(_run_world_query,
              "SELECT DISTINCT ts.SpellId FROM trainer_spell ts JOIN trainer t ON t.Id = ts.TrainerId "
              f"WHERE t.Type = 0 AND t.Requirement = {cls} AND ts.ReqLevel <= {level} "
              "AND ts.ReqSkillLine = 0")
    spells = [int(r['SpellId']) for r in rows]
    if not spells:
        return []
    # Race-restricted class spells (faction variants): SkillLineAbility masks.
    race_bit = 1 << (race - 1)
    allowed, restricted = set(), set()
    for r in _dbc_rows(
            "SELECT spell_id, required_races, excluded_races FROM skilllineability "
            f"WHERE spell_id IN ({','.join(map(str, spells))})"):
        sid, req, exc = int(r['spell_id']), int(r['required_races']), int(r['excluded_races'])
        if (req and not req & race_bit) or (exc & race_bit):
            restricted.add(sid)
        else:
            allowed.add(sid)
    keep = [s for s in spells if s in allowed or s not in restricted]
    learned = set()
    for teach in _resolve_learn(keep).values():
        learned.update(teach)
    return sorted(learned)


def _quest_reward_spells(quests: List[int]) -> List[int]:
    if not quests:
        return []
    rows = _q(_run_world_query,
              f"SELECT RewardSpell FROM quest_template WHERE ID IN ({','.join(map(str, quests))}) "
              "AND RewardSpell > 0")
    learned = set()
    for teach in _resolve_learn(int(r['RewardSpell']) for r in rows).values():
        learned.update(teach)
    return sorted(learned)


@char.command('test-setup')
@click.argument('name')
@click.option('--race', '-r', required=True, help='Race name or ID')
@click.option('--class', '-c', 'cls', required=True, help='Class name or ID')
@click.option('--gender', '-g', default='female', show_default=True, help='male/m/0 or female/f/1')
@click.option('--level', '-l', type=int, default=1, show_default=True)
@click.option('--account', '-a', default='1', show_default=True,
              help='Account USERNAME (the GM test account is named "1")')
@click.option('--before', 'before', type=int, multiple=True,
              help='Quest to make available: its prerequisites are rewarded (repeatable)')
@click.option('--done', 'done', type=int, multiple=True,
              help='Quest rewarded, with all its prerequisites (repeatable)')
@click.option('--take', 'take', type=int, multiple=True,
              help='Quest in the log as incomplete, prerequisites rewarded (repeatable)')
@click.option('--pos', help='Login/hearth spot "X Y [Z [O]]" (Z omitted = heightmap)')
@click.option('--map', 'map_id', type=int, default=1, show_default=True, help='Map for --pos')
@click.option('--near-creature', type=int, help='Use this creature spawn guid\'s position')
@click.option('--money', type=int, default=10, show_default=True, help='Gold')
@click.option('--heirlooms/--no-heirlooms', default=True, show_default=True,
              help='Equip the class heirloom set (shoulders, chest, weapons, trinket)')
@click.option('--equip', 'equip', type=int, multiple=True,
              help='Extra item entry to equip (repeatable); overrides a heirloom in the same slot')
@click.option('--spells/--no-spells', default=True, show_default=True,
              help='Learn every class-trainer spell up to --level')
@click.option('--replace', is_flag=True, help='Rebuild an existing offline character of this name')
@click.option('--dry-run', is_flag=True, help='Print the SQL without executing')
def char_test_setup(name, race, cls, gender, level, account, before, done, take, pos,
                    map_id, near_creature, money, heirlooms, equip, spells, replace, dry_run):
    """Build a ready-to-test character directly in the database (F-213).

    The character logs in at the chosen spot with its starting abilities
    (the core relearns default skills/spells on load, plus spells from its
    rewarded quests) and the quest state needed to test a piece of content.

    Examples:
        zep world char test-setup Orbtest -r goblin -c warlock -l 10 \\
            --done 25110 --pos "1252 -10795 219.8 5.5"
        zep world char test-setup Hunttest -r goblin -c hunter -l 10 --before 24671
        zep world char test-setup Orbtest -r goblin -c warlock --replace --dry-run
    """
    name = name.strip().capitalize()
    if not name.isalpha() or not 2 <= len(name) <= 12:
        raise click.ClickException("Name must be 2-12 letters")
    race_id, class_id, gender_id = _parse_race(race), _parse_class(cls), _parse_gender(gender)
    if not 1 <= level <= 80:
        raise click.ClickException("--level must be 1-80")

    # Account by USERNAME
    acc = _q(_run_auth_query,
             f"SELECT id, username FROM account WHERE username = '{_sql_escape(account)}'")
    if not acc:
        raise click.ClickException(f"Account '{account}' not found")
    account_id = int(acc[0]['id'])

    pci = _q(_run_world_query,
             f"SELECT map, zone, position_x, position_y, position_z, orientation "
             f"FROM playercreateinfo WHERE race = {race_id} AND class = {class_id}")
    if not pci:
        raise click.ClickException(
            f"{RACE_NAMES[race_id].title()} {CLASS_NAMES[class_id]} has no playercreateinfo row")

    # Position
    if near_creature:
        c = _q(_run_world_query,
               "SELECT map, position_x, position_y, position_z, orientation "
               f"FROM creature WHERE guid = {near_creature}")
        if not c:
            raise click.ClickException(f"Creature spawn {near_creature} not found")
        c = c[0]
        map_id, x, y, z, o = int(c['map']), float(c['position_x']), float(c['position_y']), \
            float(c['position_z']), float(c['orientation'])
        zone = 0
    elif pos:
        parts = [float(p) for p in pos.replace(',', ' ').split()]
        if len(parts) < 2:
            raise click.ClickException('--pos needs at least "X Y"')
        x, y = parts[0], parts[1]
        o = parts[3] if len(parts) > 3 else 0.0
        z = parts[2] if len(parts) > 2 else None
        zone = 0
    else:
        p = pci[0]
        map_id, x, y, z, o = int(p['map']), float(p['position_x']), float(p['position_y']), \
            float(p['position_z']), float(p['orientation'])
        zone = int(p['zone'])
    if not zone or z is None:
        from lib.terrain_reader import MapHeightReader
        reader = MapHeightReader(Path(__file__).resolve().parents[3] / 'data' / 'maps')
        if z is None:
            ground = reader.get_height(map_id, x, y)
            if ground < -50000:
                raise click.ClickException(f"No heightmap at map {map_id} ({x}, {y}); give Z")
            z = round(ground + 0.5, 2)
        if not zone:
            zone = max(reader.get_area(map_id, x, y), 0)   # core corrects it on login

    # Existing character
    existing = _q(_run_query,
                  f"SELECT guid, account, online FROM characters WHERE name = '{_sql_escape(name)}'")
    if existing:
        e = existing[0]
        if not replace:
            raise click.ClickException(f"{name} already exists (guid {e['guid']}); use --replace")
        if int(e['account']) != account_id:
            raise click.ClickException(f"{name} belongs to account id {e['account']}, not '{account}'")
        if int(e['online']):
            raise click.ClickException(f"{name} is online — log out first")
        guid = int(e['guid'])
    else:
        guid = _alloc_id('characters', 'guid', TEST_CHAR_GUID_OFFSET)

    # Structural template row: same race+gender first (valid appearance)
    tmpl = _q(_run_query,
              "SELECT guid, race, gender FROM characters WHERE deleteDate IS NULL "
              f"ORDER BY (race = {race_id} AND gender = {gender_id}) DESC, guid LIMIT 1")
    if not tmpl:
        raise click.ClickException("No existing character to use as a row template")
    tmpl_guid = int(tmpl[0]['guid'])
    same_look = int(tmpl[0]['race']) == race_id and int(tmpl[0]['gender']) == gender_id

    zeroed = "REGEXP_REPLACE(`{c}`, '[0-9]+', '0')"
    overrides = {
        'guid': str(guid), 'account': str(account_id), 'name': f"'{name}'",
        'race': str(race_id), 'class': str(class_id), 'gender': str(gender_id),
        'level': str(level), 'xp': '0', 'money': str(money * 10000),
        'bankSlots': '0', 'restState': '0', 'playerFlags': '0',
        'position_x': str(x), 'position_y': str(y), 'position_z': str(z), 'orientation': str(o),
        'map': str(map_id), 'zone': str(zone), 'instance_id': '0', 'instance_mode_mask': '0',
        'online': '0', 'cinematic': '1', 'totaltime': '0', 'leveltime': '0',
        'logout_time': 'UNIX_TIMESTAMP()', 'is_logout_resting': '0', 'rest_bonus': '0',
        'resettalents_cost': '0', 'resettalents_time': '0',
        'trans_x': '0', 'trans_y': '0', 'trans_z': '0', 'trans_o': '0', 'transguid': '0',
        'extra_flags': '0', 'stable_slots': '0', 'at_login': '0' if spells else str(AT_LOGIN_RESET_SPELLS),
        'death_expire_time': '0', 'taxi_path': "''", 'arenaPoints': '0',
        'totalHonorPoints': '0', 'todayHonorPoints': '0', 'yesterdayHonorPoints': '0',
        'totalKills': '0', 'todayKills': '0', 'yesterdayKills': '0', 'chosenTitle': '0',
        'knownCurrencies': '0', 'watchedFaction': '4294967295', 'drunk': '0',
        'health': '999999', 'power1': '999999', 'power2': '0', 'power3': '0',
        'power4': '100', 'power5': '0', 'power6': '0', 'power7': '0', 'latency': '0',
        'talentGroupsCount': '1', 'activeTalentGroup': '0', 'ammoId': '0',
        'actionBars': '0', 'grantableLevels': '0', 'order': 'NULL',
        'creation_date': 'NOW()', 'deleteInfos_Account': 'NULL', 'deleteInfos_Name': 'NULL',
        'deleteDate': 'NULL', 'innTriggerId': '0', 'extraBonusTalentCount': '0',
    }
    for c in ('taximask', 'exploredZones', 'equipmentCache', 'knownTitles'):
        overrides[c] = zeroed.format(c=c)
    if not same_look:
        for c in ('skin', 'face', 'hairStyle', 'hairColor', 'facialStyle'):
            overrides[c] = '0'

    cols = [r['Field'] for r in _q(_run_query, "SHOW COLUMNS FROM characters")]
    passthrough = [c for c in cols if c not in overrides]
    select = ', '.join(overrides.get(c, f'`{c}`') for c in cols)

    # Quest state
    targets = sorted(set(before) | set(done) | set(take))
    needed, skipped, negative = _quest_prereqs(targets, race_id, class_id) if targets else ([], [], [])
    rewarded = sorted(set(needed) | set(done))
    taken = sorted(set(take) - set(rewarded))

    stmts = ['START TRANSACTION;']
    if existing:
        stmts += _wipe_statements(guid)
    stmts.append(f"INSERT INTO characters ({', '.join(f'`{c}`' for c in cols)}) "
                 f"SELECT {select} FROM characters WHERE guid = {tmpl_guid};")
    stmts.append("INSERT INTO character_homebind (guid, mapId, zoneId, posX, posY, posZ) "
                 f"VALUES ({guid}, {map_id}, {zone}, {x}, {y}, {z});")
    if rewarded:
        stmts.append("INSERT INTO character_queststatus_rewarded (guid, quest, active) VALUES "
                     + ', '.join(f"({guid}, {q}, 1)" for q in rewarded) + ';')
    for q in taken:
        stmts.append("INSERT INTO character_queststatus (guid, quest, status) "
                     f"VALUES ({guid}, {q}, {QUEST_STATUS_INCOMPLETE});")

    # Spells. Default skills/spells are relearned by the core on every load;
    # trainer + quest-reward spells are written here (at_login RESET_SPELLS
    # would remove them, so it is only used with --no-spells).
    learned: List[int] = []
    if spells:
        learned = sorted(set(_class_spells(race_id, class_id, level)) |
                         set(_quest_reward_spells(rewarded)))
        if learned:
            stmts.append("INSERT INTO character_spell (guid, spell, specMask) VALUES "
                         + ', '.join(f"({guid}, {sp}, 255)" for sp in learned) + ';')

    # Heirlooms, equipped (bag 0, equipment slots)
    equipped: List[Tuple[int, str, int]] = []   # (entry, name, slot)
    kit = list(HEIRLOOMS.get(class_id, [])) if heirlooms else []
    ranged = _ranged_heirloom(race_id, class_id) if kit else None
    if ranged:   # swap whichever ranged heirloom the kit lists for the one this race can use
        kit = [ranged if e in RANGED_HEIRLOOM_BY_SKILL.values() else e for e in kit]
    if kit and (insignia := _insignia(race_id)):
        kit.append(insignia)
    ids = list(equip) + kit
    if ids:
        items = {int(r['entry']): r for r in _q(_run_world_query,
                 "SELECT entry, name, class, subclass, InventoryType, MaxDurability FROM item_template "
                 f"WHERE entry IN ({','.join(map(str, ids))})")}
        used = set()
        item_guid = _alloc_id('item_instance', 'guid', ITEM_GUID_OFFSET)
        for entry in ids:
            it = items.get(entry)
            if not it:
                click.echo(f"  warning: item {entry} not in item_template, skipped")
                continue
            slot = next((sl for sl in INV_SLOTS.get(int(it['InventoryType']), []) if sl not in used), None)
            if slot is None:
                click.echo(f"  warning: no free slot for {it['name']} ({entry}), skipped")
                continue
            used.add(slot)
            stmts.append(
                "INSERT INTO item_instance (guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, "
                "count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text) "
                f"VALUES ({item_guid}, {entry}, {guid}, 0, 0, 1, 0, '0 0 0 0 0 ', 1, "
                f"'{ENCHANTMENTS_BLANK}', 0, {int(it['MaxDurability'])}, 0, NULL);")
            stmts.append(f"INSERT INTO character_inventory (guid, bag, slot, item) "
                         f"VALUES ({guid}, 0, {slot}, {item_guid});")
            equipped.append((entry, it['name'], slot))
            item_guid += 1

        # Ammo for the equipped ranged weapon (slot 17)
        ranged_item = next((items[e] for e, _n, sl in equipped if sl == 17), None)
        kit_ammo = _ammo_kit(int(ranged_item['subclass']), level) \
            if ranged_item and int(ranged_item['class']) == 2 else None
        if kit_ammo:
            ammo, bag = kit_ammo
            bag_guid = item_guid
            stmts.append(
                "INSERT INTO item_instance (guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, "
                "count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text) "
                f"VALUES ({bag_guid}, {bag['entry']}, {guid}, 0, 0, 1, 0, '0 0 0 0 0 ', 0, "
                f"'{ENCHANTMENTS_BLANK}', 0, {int(bag['MaxDurability'])}, 0, NULL);")
            stmts.append(f"INSERT INTO character_inventory (guid, bag, slot, item) "
                         f"VALUES ({guid}, 0, {BAG_SLOT_FIRST}, {bag_guid});")
            item_guid += 1
            for stack_slot in range(min(2, int(bag['ContainerSlots']))):
                stmts.append(
                    "INSERT INTO item_instance (guid, itemEntry, owner_guid, creatorGuid, giftCreatorGuid, "
                    "count, duration, charges, flags, enchantments, randomPropertyId, durability, playedTime, text) "
                    f"VALUES ({item_guid}, {ammo['entry']}, {guid}, 0, 0, {int(ammo['stackable'])}, 0, "
                    f"'0 0 0 0 0 ', 0, '{ENCHANTMENTS_BLANK}', 0, 0, 0, NULL);")
                stmts.append(f"INSERT INTO character_inventory (guid, bag, slot, item) "
                             f"VALUES ({guid}, {bag_guid}, {stack_slot}, {item_guid});")
                item_guid += 1
            stmts.append(f"UPDATE characters SET ammoId = {ammo['entry']} WHERE guid = {guid};")
            equipped.append((ammo['entry'], f"{bag['name']} with {2 * int(ammo['stackable'])} {ammo['name']}", BAG_SLOT_FIRST))

    # Weapon skills + Defense at the level cap (level x 5), with the proficiency
    # spell for any equipped weapon the class doesn't start with.
    weapon_subs = [int(items[e]['subclass']) for e, _n, sl in equipped
                   if sl in (15, 16, 17) and e in items and int(items[e]['class']) == 2] if ids else []
    combat, skill_warnings = _combat_skills(race_id, class_id, weapon_subs)
    skill_value = 5 * level
    if combat:
        stmts.append("INSERT INTO character_skills (guid, skill, value, max) VALUES "
                     + ', '.join(f"({guid}, {sk}, {skill_value}, {skill_value})" for sk in sorted(combat)) + ';')
        prof = sorted({sp for sp in combat.values() if sp} - set(learned))
        if prof:
            stmts.append("INSERT IGNORE INTO character_spell (guid, spell, specMask) VALUES "
                         + ', '.join(f"({guid}, {sp}, 255)" for sp in prof) + ';')
    stmts.append('COMMIT;')
    sql_block = '\n'.join(stmts)

    click.echo(f"  {name}: level {level} {RACE_NAMES[race_id].title()} "
               f"{GENDER_NAMES[gender_id]} {CLASS_NAMES[class_id]} on account '{account}' "
               f"(id {account_id}), guid {guid}{' (replacing)' if existing else ''}")
    click.echo(f"  at map {map_id} ({x}, {y}, {z}) o={o} zone/area {zone}; hearth bound there")
    click.echo(f"  row template: guid {tmpl_guid}"
               f"{'' if same_look else ' (different race/gender - appearance reset to 0)'}")
    if targets:
        click.echo(f"  quests rewarded: {len(rewarded)}; in log: {taken or '-'}; "
                   f"available: {sorted(set(before) - set(rewarded) - set(taken)) or '-'}")
    if spells:
        click.echo(f"  spells: {len(learned)} class-trainer (level <= {level}) + quest-reward spells")
    if equipped:
        click.echo(f"  equipped: {', '.join(n for _, n, _ in equipped)}")
    if combat:
        click.echo(f"  combat skills at {skill_value}/{skill_value}: {', '.join(map(str, sorted(combat)))}")
    for w in skill_warnings:
        click.echo(f"  warning: {w}")
    if skipped:
        click.echo(f"  skipped (race/class can't take): {skipped}")
    if negative:
        click.echo(f"  warning: reached via a negative PrevQuestID (must be ACTIVE, marked rewarded): {negative}")
    if passthrough and dry_run:
        click.echo(f"  columns copied from template: {', '.join(passthrough)}")

    if dry_run:
        click.echo(sql_block)
        return

    ok, out = _run_query(sql_block)
    if not ok:
        raise click.ClickException(f"Insert failed: {out}")
    ok, out = _run_auth_query(
        "UPDATE realmcharacters SET numchars = "
        f"(SELECT COUNT(*) FROM acore_characters.characters WHERE account = {account_id} "
        f"AND deleteDate IS NULL) WHERE acctid = {account_id};")
    if not ok:
        click.echo(f"  warning: realmcharacters not updated: {out}")
    click.echo(f"  done — log in as '{account}'.")


@char.command('delete')
@click.argument('name')
@click.option('--account', '-a', default='1', show_default=True,
              help='Account USERNAME the character must be on (guard against deleting a real character)')
@click.option('--dry-run', is_flag=True, help='Print the SQL without executing')
def char_delete(name, account, dry_run):
    """Delete an offline test character and everything it owns (F-213).

    Clears the same tables as Player::DeleteFromDB (characters, per-guid
    character_* tables, items by owner, mail by receiver, pets by owner).
    Refuses unless the character is on --account (default the GM test
    account '1').

    Examples:
        zep world char delete Orbtest
        zep world char delete Orbtest --dry-run
    """
    acc = _q(_run_auth_query,
             f"SELECT id FROM account WHERE username = '{_sql_escape(account)}'")
    if not acc:
        raise click.ClickException(f"Account '{account}' not found")
    account_id = int(acc[0]['id'])
    rows = _q(_run_query,
              f"SELECT guid, account, online, name FROM characters WHERE name = '{_sql_escape(name)}'")
    if not rows:
        raise click.ClickException(f"Character '{name}' not found")
    c = rows[0]
    guid = int(c['guid'])
    if int(c['account']) != account_id:
        raise click.ClickException(f"{c['name']} is on account id {c['account']}, not '{account}' - refusing")
    if int(c['online']):
        raise click.ClickException(f"{c['name']} is online — log out first")

    stmts = ['START TRANSACTION;']
    stmts += _wipe_statements(guid)
    stmts.append('COMMIT;')
    sql_block = '\n'.join(stmts)
    if dry_run:
        click.echo(sql_block)
        return
    ok, out = _run_query(sql_block)
    if not ok:
        raise click.ClickException(f"Delete failed: {out}")
    ok, out = _run_auth_query(
        "UPDATE realmcharacters SET numchars = "
        f"(SELECT COUNT(*) FROM acore_characters.characters WHERE account = {account_id} "
        f"AND deleteDate IS NULL) WHERE acctid = {account_id};")
    if not ok:
        click.echo(f"  warning: realmcharacters not updated: {out}")
    click.echo(f"  {c['name']} (guid {guid}) deleted from account '{account}'")
