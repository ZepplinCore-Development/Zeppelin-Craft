"""I-398: make DK-only skin colours reachable at character create.

Wow.exe's skin cycle (0x4EB150) only offers a colour when the face row for the
CURRENTLY selected face type exists at that colour and passes the class flag check
(0x4F39A0: a DK needs flags & 1, flags & 0x14, not flags & 8). A DK can only wear
the DK face types (flags 5) on the normal colours, but stock gives the DK colours
face rows on regular face types only (e.g. gnome female 0/3/5 vs DK faces 7-13),
so every DK colour is skipped. F-150 fixed orc male by hand; this does every race.

For each race/gender, every DK colour gets a face row (flags 5) for every DK face
type the normal colours offer, cycling that colour's existing face textures.
Existing rows are left alone (characters may already use them).

  python3 -m cli.zep dbc info query "SELECT id, race, gender, base_section, type, \
      color_index, flags, texture_1, texture_2, texture_3 FROM charsections \
      WHERE base_section IN (0,1,4)" > rows.tsv
  python3 "Scripts/Character Skins/dk_skin_faces.py" rows.tsv FIRST_ID > out.sql
"""
import csv
import sys
from collections import defaultdict


def dk_ok(flags):
    return bool(flags & 1) and bool(flags & 0x14) and not flags & 8


def main(tsv, first_id):
    rows = []
    with open(tsv, newline='') as f:
        for r in csv.DictReader((ln for ln in f if not ln.startswith('Running')), delimiter='\t'):
            for k in ('id', 'race', 'gender', 'base_section', 'type', 'color_index', 'flags'):
                r[k] = int(r[k])
            rows.append(r)
    by = defaultdict(list)
    for r in rows:
        by[(r['race'], r['gender'])].append(r)

    out, nid, missing_underwear = [], first_id, []
    for (race, sex), rs in sorted(by.items()):
        body = {r['color_index']: r['flags'] for r in rs if r['base_section'] == 0 and r['type'] == 0}
        dk_cols = sorted(c for c, f in body.items() if f & 4 and dk_ok(f))
        normal = sorted(c for c, f in body.items() if dk_ok(f) and not f & 4)
        if not dk_cols or not normal:
            continue
        faces = defaultdict(dict)
        for r in rs:
            if r['base_section'] == 1 and dk_ok(r['flags']):
                faces[r['color_index']][r['type']] = r
        dk_types = sorted(set.intersection(*[set(faces[c]) for c in normal]))
        block = []
        for c in dk_cols:
            if not any(r['base_section'] == 4 and r['color_index'] == c and dk_ok(r['flags']) for r in rs):
                missing_underwear.append((race, sex, c))
            have = [faces[c][t] for t in sorted(faces[c])]
            if not have:
                continue
            for k, t in enumerate(t for t in dk_types if t not in faces[c]):
                src = have[k % len(have)]
                block.append(
                    "DELETE FROM charsections WHERE id = %d;\n"
                    "INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) "
                    "VALUES (%d, %d, %d, 1, '%s', '%s', '%s', 5, %d, %d);"
                    % (nid, nid, race, sex, src['texture_1'], src['texture_2'], src['texture_3'] or '', t, c))
                nid += 1
        if block:
            out.append('-- race %d gender %d: DK colours %s get DK face types %s' % (race, sex, dk_cols, dk_types))
            out.extend(block)
            out.append('')
    if missing_underwear:
        out.append('-- WARNING no DK-valid underwear row for (race, gender, colour): %s' % missing_underwear)
    print('\n'.join(out))
    print('-- next free id %d' % nid, file=sys.stderr)


if __name__ == '__main__':
    main(sys.argv[1], int(sys.argv[2]))
