"""
Pre-apply lint for zpak/module SQL.

Unscoped DELETEs on shared tables: a statement like
    DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17;
removes every row of that kind server-wide - stock AzerothCore rows, module rows
and every other zpak's - and `zep world sql changed` re-runs it on each cascade.
F-052's mind-control scroll file did exactly this and wiped all 870 stock spell
target conditions (found by I-376). A DELETE on one of these tables must name
the rows its file owns.
"""

import re
from typing import List

# table -> columns, any one of which in the WHERE scopes the DELETE to owned rows
SHARED_DELETE_KEYS = {
    'conditions': ('sourceentry', 'sourcegroup', 'conditionvalue1', 'comment'),
    'smart_scripts': ('entryorguid',),
    'spell_script_names': ('spell_id', 'scriptname'),
    'creature_queststarter': ('quest', 'id'),
    'creature_questender': ('quest', 'id'),
    'gameobject_queststarter': ('quest', 'id'),
    'gameobject_questender': ('quest', 'id'),
    'creature_text': ('creatureid', 'broadcasttextid'),
    'spell_linked_spell': ('spell_trigger', 'spell_effect'),
    'spell_area': ('spell', 'area', 'quest_start', 'quest_end'),
}
for _kind in ('creature', 'gameobject', 'item', 'reference', 'skinning', 'pickpocketing',
              'disenchant', 'prospecting', 'milling', 'fishing', 'spell', 'mail'):
    SHARED_DELETE_KEYS[f'{_kind}_loot_template'] = ('entry', 'item', 'reference')

_COMMENTS = re.compile(r'--[^\n]*|/\*.*?\*/', re.S)
_DELETE = re.compile(r'DELETE\s+(?:\w+\s+)?FROM\s+`?(\w+)`?\s*(?:WHERE\s+(.*?))?;', re.I | re.S)
# A negative SourceTypeOrReferenceId is a condition reference template's own id.
_COND_REFERENCE = re.compile(r'sourcetypeorreferenceid`?\s*=\s*-\d')


def unscoped_shared_deletes(sql_text: str) -> List[str]:
    """Return each DELETE on a shared table whose WHERE names none of its owning keys."""
    text = _COMMENTS.sub('', sql_text)
    found = []
    for m in _DELETE.finditer(text):
        table = m.group(1).lower()
        keys = SHARED_DELETE_KEYS.get(table)
        if not keys:
            continue
        where = (m.group(2) or '').lower()
        if table == 'conditions' and _COND_REFERENCE.search(where):
            continue
        if not any(k in where for k in keys):
            found.append(' '.join(m.group(0).split()))
    return found
