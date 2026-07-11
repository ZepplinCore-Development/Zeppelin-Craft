#!/usr/bin/env python3
"""
Wire every F-011 custom item to its on-use spell (item_template.spellid_N/spelltrigger_N).
Only wires spells that now EXIST (stock 3.3.5a OR newly ported in [F-011]_spell.sql).
"""
import json, os, re
import _autogen; _autogen.install()  # stamp generated .sql files with a DO-NOT-EDIT banner
SCRATCH = "/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad"
ZPAK = "/workspace/project/Zeppelin-Craft/zpaks/zep-goblin-start"
item_spell = json.load(open(os.path.join(SCRATCH, "item_spell_wm.json")))  # newid -> [(spell,trigger)]
present = set(int(x) for x in open(os.path.join(SCRATCH, "spells_present.txt")) if x.strip().isdigit())
ported = set()
for line in open(ZPAK + "/dbc/[F-011]_spell.sql"):
    m = re.match(r"-- (\d+) ", line)
    if m: ported.add(int(m.group(1)))
usable = present | ported

rows = []
for newid, pairs in item_spell.items():
    sets = []
    for i, (sp, tr) in enumerate(pairs[:5], 1):
        if sp in usable:
            sets.append("spellid_%d=%d, spelltrigger_%d=%d" % (i, sp, i, tr))
    if sets:
        rows.append((int(newid), sets))
rows.sort()
with open(ZPAK + "/sql/zz_[F-011]_item_spells.sql", "w") as f:
    f.write("-- F-011 wire custom items to on-use spells (stock + ported Whitemane 4.3.4 spells)\n")
    f.write("-- %d items wired.\n\n" % len(rows))
    for newid, sets in rows:
        f.write("UPDATE item_template SET %s WHERE entry=%d;\n" % (", ".join(sets), newid))
print("items wired: %d (usable spells: %d present + %d ported)" % (len(rows), len(present), len(ported)))
