"""F-230 facial graft: preview what facial_pieces.py + facial_split.py would write, without writing zep-skin-expansion
or the DBC. Runs facial_pieces.auto_race for every AUTO race into a state JSON, compares it with the shipped
facial_pieces.json (migration must stay the same; existing choices' paint looks must stay a prefix), then runs
facial_split.py against that state into a CharCustomizations.txt + migration SQL in OUTDIR (the piece-row check is
skipped: the new piece rows are not in the DBC until facial_pieces.py is run for real).

  python3 "Scripts/Character Skins/facial_graft_preview.py" OUTDIR [MODELS_ROOT [RACE_SEX,...]]  (RACE_SEX: treat as landed)
MODELS_ROOT: a CHARACTER/<FOLDER>/<SEX>/ tree of grafted models (facial_graft.py preview) used instead of the
curated parsed-assets wherever it has the race's files (scripts-only proofs before a race is landed).
"""
import sys, json, importlib.util
sys.path.insert(0, str(__import__('pathlib').Path(__file__).resolve().parent))
from pathlib import Path
SC = Path(__file__).resolve().parent
out = Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
MODELS = Path(sys.argv[2]) if len(sys.argv) > 2 else None


from facial_graft import load_pieces
fp, _split_src = load_pieces(MODELS, sys.argv[3].split(',') if len(sys.argv) > 3 else ())
files = fp._load('skin_preview').files_resolver(); q = fp._dbc_query_fn('live')
old = json.loads((SC / 'facial_pieces.json').read_text())
new, bad = {}, 0
for race, sex in fp.AUTO:
    pieces, lab, st, fpr = fp.auto_race(race, sex, q, files)
    k = f'{race}_{sex}'; new[k] = st
    o = old.get(k)
    same = bool(o) and o['migration'] == st['migration']
    bad += not same
    print(k, 'migration same' if same else 'MIGRATION DIFFERS')
    for sl, v in st['slots'].items():
        ov = (o or {}).get('slots', {}).get(sl)
        n = len(ov['looks']) if ov else 0
        ok = bool(ov) and v['looks'][:n] == ov['looks']
        bad += bool(ov) and not ok
        print('  slot', sl, 'looks', v['looks'], '(old', ov['looks'] if ov else None, ')', '' if ok or not ov else 'EXISTING PAINT CHANGED')
state = out / 'facial_pieces.json'
state.write_text(json.dumps(new, indent=1, sort_keys=True) + '\n')
src = _split_src
src = src.replace("PIECES_STATE = Path(__file__).with_name('facial_pieces.json')", f"PIECES_STATE = Path({str(state)!r})")
src = src.replace("                    if piece not in pieces[k]:", "                    if False:")
sys.argv = ['facial_split.py', '--out', str(out / 'CharCustomizations.txt'), '--migration', str(out / 'facial_split_migration.sql')]
exec(compile(src, str(SC / 'facial_split.py'), 'exec'), {'__name__': '__main__', '__file__': str(SC / 'facial_split.py')})
sys.exit(1 if bad else 0)
