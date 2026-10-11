"""F-216 / I-390: which creature displays can actually appear in game.

A display only needs a picker decision if something can put it on screen. A creature
template referencing it is not enough (display 13 Peasant Woman: two templates, no
spawn, nothing summons them). A spawn is not required either - a creature reaches the
world through many routes, so this collects them all and errs on the side of keeping:

  creature entries  spawns; summon/pet effects (28, 56) and transform/mount auras (56, 78)
                    in Spell.dbc and spell_dbc; SAI morph/summon/update-template/mount/
                    radial summon (3, 12, 36, 43, 228); creature_summon_groups; vehicle
                    accessories; TaxiNodes mounts; event/waypoint script summons (cmd 10);
                    C++/Lua NPC_ constants and literal summons; raw numeric literals in
                    battleground / outdoor-pvp / script sources (AV troops live in
                    number tables); heroic/raid difficulty copies of all of the above
  display ids       creature(_template)_addon mounts; SAI morph/mount by model (param2);
                    game_event_model_equip; player shapeshift forms (SpellShapeshiftForm.dbc
                    + player_shapeshift_model: druid cat/bear colours per race and hair)
                    and player totems (player_totem_model)

A false "unreachable" is cheap: the picker only drops the entry from Undecided (the
curated build keeps today's winner for anything undecided).
"""
import re
import subprocess
import sys
from pathlib import Path
from typing import Callable, List, Set

CRAFT = Path(__file__).resolve().parents[2]
CORE = CRAFT.parent / 'Zeppelin-Core'

_CONST = re.compile(r'\bNPC_\w+\s*=\s*(\d+)|#define\s+NPC_\w+\s+(\d+)|SummonCreature\(\s*(\d+)'
                    r'|SpawnCreature\(\s*(\d+)|PerformIngameSpawn\(\s*1\s*,\s*(\d+)')
_RAW = re.compile(r'(?<![\w.])(\d{3,6})(?![\w.])')


def _q(sql: str, dbc: bool = False) -> List[List[str]]:
    cmd = [sys.executable, '-m', 'cli.zep'] + (['dbc', 'info', 'query', sql] if dbc else ['world', 'sql', 'query', sql])
    out = subprocess.run(cmd, cwd=str(CRAFT), capture_output=True, text=True).stdout
    return [ln.split('\t') for ln in out.splitlines() if ln and ln.split('\t')[0].lstrip('-').isdigit()]


def _ints(rows, col: int = 0) -> Set[int]:
    return {int(r[col]) for r in rows if int(r[col]) > 0}


def _source_numbers():
    """NPC_ constants and literal summons anywhere in core + modules (C++ and Lua); and,
    separately, every raw 3-6 digit literal in battleground, outdoor-pvp and script sources."""
    out: Set[int] = set()
    for root in (CORE / 'src' / 'server' / 'scripts', CORE / 'modules'):
        for f in root.rglob('*'):
            if f.suffix in ('.cpp', '.h', '.lua') and f.is_file():
                out |= {int(next(g for g in m.groups() if g)) for m in _CONST.finditer(f.read_text(errors='ignore'))}
    raw: Set[int] = set()
    for root in (CORE / 'src' / 'server' / 'game' / 'Battlegrounds', CORE / 'src' / 'server' / 'game' / 'OutdoorPvP',
                 CORE / 'src' / 'server' / 'scripts'):
        for f in root.rglob('*'):
            if f.suffix in ('.cpp', '.h') and f.is_file():
                raw |= {int(x) for x in _RAW.findall(f.read_text(errors='ignore'))}
    return out, raw


def reachable_displays(log: Callable = print) -> Set[int]:
    entries: Set[int] = _ints(_q('SELECT DISTINCT id FROM creature'))
    for i in (1, 2, 3):
        entries |= _ints(_q(f'SELECT effect_misc_value_a_{i} FROM spell WHERE effect_{i} IN (28,56) '
                            f'OR effect_apply_aura_name_{i} IN (56,78)', dbc=True))
        entries |= _ints(_q(f'SELECT EffectMiscValue_{i} FROM spell_dbc WHERE Effect_{i} IN (28,56) '
                            f'OR EffectAura_{i} IN (56,78)'))
    entries |= _ints(_q('SELECT action_param1 FROM smart_scripts WHERE action_type IN (3,12,36,43,228)'))
    entries |= _ints(_q('SELECT entry FROM creature_summon_groups'))
    entries |= _ints(_q('SELECT accessory_entry FROM vehicle_template_accessory'))
    entries |= _ints(_q('SELECT accessory_entry FROM vehicle_accessory'))
    entries |= _ints(_q('SELECT mount_creature_id_1 FROM taxinodes', dbc=True))
    entries |= _ints(_q('SELECT mount_creature_id_2 FROM taxinodes', dbc=True))
    for t in ('event_scripts', 'waypoint_scripts'):
        entries |= _ints(_q(f'SELECT datalong FROM {t} WHERE command = 10'))
    templates = _ints(_q('SELECT entry FROM creature_template'))
    named, raw = _source_numbers()
    # a raw literal is only a guess: it does not keep a placeholder template ((PH) DEPRECATED 25366
    # matches a model id in a chapter1.cpp switch)
    placeholder = _ints(_q("SELECT entry FROM creature_template WHERE name LIKE '%DEPRECATED%' "
                           "OR name LIKE '%[UNUSED]%' OR name LIKE '(PH)%' OR name LIKE '%[PH]%'"))
    entries |= (named & templates) | ((raw & templates) - placeholder)
    for r in _q('SELECT entry, difficulty_entry_1, difficulty_entry_2, difficulty_entry_3 FROM creature_template '
                'WHERE difficulty_entry_1 > 0 OR difficulty_entry_2 > 0 OR difficulty_entry_3 > 0'):
        if int(r[0]) in entries:
            entries |= {int(x) for x in r[1:] if int(x) > 0}
    displays = {int(d) for d, c in _q('SELECT CreatureDisplayID, CreatureID FROM creature_template_model')
                if int(c) in entries}
    for sql in ('SELECT mount FROM creature_template_addon', 'SELECT mount FROM creature_addon',
                'SELECT action_param2 FROM smart_scripts WHERE action_type IN (3,43)',
                'SELECT modelid FROM game_event_model_equip', 'SELECT ModelID FROM player_shapeshift_model',
                'SELECT ModelID FROM player_totem_model'):
        displays |= _ints(_q(sql))
    for i in (1, 2, 3, 4):
        displays |= _ints(_q(f'SELECT display_{i} FROM spellshapeshiftform', dbc=True))
    log(f'  in game: {len(entries):,} reachable creature entries -> {len(displays):,} displays')
    return displays
