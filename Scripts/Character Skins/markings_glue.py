"""F-230: write the creator's marking gates (CHAR_CREATE_MARK_GATES in CharacterCreate.lua) from
markings_regroup.json "proposed_gates" (exclusive sub-race sets plus a race-wide common pool; user approved
2026-10-30). Rewrites only the block between the BEGIN / END markers, so re-run it after markings_regroup.py.

  python3 "Scripts/Character Skins/markings_glue.py"
"""
import json
import re
from pathlib import Path

CRAFT = Path(__file__).resolve().parents[2]
GLUE = CRAFT / 'zpaks' / 'patch-modern-login' / 'mpq' / 'source-assets' / 'Interface' / 'GlueXML' / 'CharacterCreate.lua'
REPORT = Path(__file__).with_name('markings_regroup.json')
BEGIN = '-- BEGIN GENERATED marking gates (Scripts/Character Skins/markings_glue.py) - do not edit by hand'
END = '-- END GENERATED marking gates'
RACES = {'Human': 'HUMAN', 'Orc': 'ORC', 'Dwarf': 'DWARF', 'NightElf': 'NIGHTELF', 'Scourge': 'SCOURGE',
         'Tauren': 'TAUREN', 'Troll': 'TROLL', 'BloodElf': 'BLOODELF', 'Draenei': 'DRAENEI'}
SEXES = {'Male': 'MALE', 'Female': 'FEMALE'}


def block(gates):
    """race -> sub-race -> sex -> customization index -> values (0 = none first)."""
    tree = {}
    for key, entry in gates.items():
        folder, sex = key.split()
        for sub, filters in entry.items():
            if sub == 'assign':
                continue
            for name, values in filters.items():
                index = int(re.match(r'filter (\d+)', name).group(1))
                tree.setdefault(RACES[folder], {}).setdefault(sub, {}).setdefault(SEXES[sex], {})[index] = values
    lines = [BEGIN,
             '-- customization 7 = face markings, 8 = body markings, 9 = scars: the values a sub-race may pick (its',
             '-- exclusive set plus the race\'s common pool); a row with no list here offers every value',
             'CHAR_CREATE_MARK_GATES = {']
    for race in sorted(tree):
        lines.append(f'\t["{race}"] = {{')
        for sub in sorted(tree[race]):
            lines.append(f'\t\t["{sub}"] = {{')
            for sex in ('MALE', 'FEMALE'):
                rows = tree[race][sub].get(sex)
                if rows:
                    body = ', '.join(f'[{i}] = {{{", ".join(map(str, v))}}}' for i, v in sorted(rows.items()))
                    lines.append(f'\t\t\t{sex} = {{ {body} }},')
            lines.append('\t\t},')
        lines.append('\t},')
    lines += ['};',
              'for race, subs in pairs(CHAR_CREATE_MARK_GATES) do',
              '\tfor _, subRace in ipairs(CHAR_CREATE_SUBRACES[race]) do',
              '\t\tsubRace.marks = subs[subRace.name];',
              '\tend',
              'end',
              END]
    return '\n'.join(lines)


def main():
    gates = json.loads(REPORT.read_text())['proposed_gates']
    text = GLUE.read_text(encoding='utf-8')
    new = block(gates)
    if BEGIN in text:
        start, stop = text.index(BEGIN), text.index(END) + len(END)
        text = text[:start] + new + text[stop:]
    else:
        anchor = text.index('CHAR_CREATE_SUBRACES = {')
        close = text.index('\n};\n', anchor) + 4
        text = text[:close] + new + '\n' + text[close:]
    GLUE.write_text(text, encoding='utf-8')
    print(f'{GLUE.name}: {sum(1 for _ in gates)} race/sex gate sets written')


if __name__ == '__main__':
    main()
