# F-220: run from Zeppelin-Craft/cli. Rebuilds the riderless mount models (gitignored mpq files).
# Community-pack copies -> zep-mounted-npcs-packs (with 'write'), cut by the stock cut's rider bones.
import sys, pickle
sys.path.insert(0, '.')
from pathlib import Path
from lib import strip_rider as sr
ix = pickle.loads(Path('../../logs/asset_index.pkl').read_bytes())
# stock model, our cut's client path, rider textures, slots (as the stock cuts)
JOBS = [
    ('creature/gnomerocketcar/gnomerocketcar.m2', 'Creature/GnomeRocketCar/GnomeRocketCar_Empty.m2', {'gnomepounderpilotskin_yellow_01'}, set()),
    ('creature/horderider/horderider.m2', 'Creature/HordeRider/HordeRider_Mount.m2', {'leather_horde_a_02', 'orcmalehairskin', 'axe_2h_blackwing_a_01', 'shoulder_mail_b_02green'}, set()),
    ('creature/mountedknight/mountedknight.m2', 'Creature/MountedKnight/MountedKnight_Horse.m2', set(), {12}),
    ('creature/alliancerider/alliancerider.m2', 'Creature/AllianceRider/AllianceRider_Gryphon.m2', {'wildhammerheavy', 'dwarfmalehairskin', 'shoulder_leather_horde_b_03red', 'hammer_2h_pvpalliance_a_01'}, set()),
    ('creature/terongorefiend_mounted/terongorefiend_mounted.m2', 'Creature/TeronGorefiend_Mounted/TeronGorefiend_Horse.m2', {'terongorefiend1'}, set()),
]
PACK_TEX = {'creature/gnomerocketcar/gnomerocketcar.m2': {'gnome11', 'gnome13'}}
write = len(sys.argv) > 1 and sys.argv[1] == 'write'
OUT = Path('../zpaks/zep-mounted-npcs-packs/mpq/source-assets')
def skins_of(files, path):
    stem = path[:-3]
    return [files[k] for k in sorted(files) if k.startswith(stem) and k[len(stem):-5].isdigit() and k.endswith('.skin')]
for src, out, tex, slots in JOBS:
    sf_ = ix.stock[src]
    ssk = sorted(p for p in sf_.parent.iterdir() if p.name.lower().startswith(sf_.stem.lower()) and p.suffix.lower() == '.skin')
    _, _, ref = sr.strip(sf_.read_bytes(), [p.read_bytes() for p in ssk], tex, slots)
    for o in ix.meshes[src].options:
        if o.sources == ['stock']:
            continue
        sk = skins_of(o.files, src)
        try:
            if src in PACK_TEX:            # the pack rebuilt the skeleton: its own rider textures instead
                m2, nsk, rep = sr.strip(o.files[src].read_bytes(), [f.read_bytes() for f in sk], PACK_TEX[src], set())
            else:
                m2, nsk, rep = sr.strip_like(o.files[src].read_bytes(), [f.read_bytes() for f in sk], ref)
        except Exception as ex:
            print(src, o.sources, 'FAILED', ex); continue
        print(src.rsplit('/', 1)[-1], o.sources, 'removed', rep['removed'], 'of skins', [f.name for f in sk])
        if write:
            d = OUT / Path(out).parent; d.mkdir(parents=True, exist_ok=True)
            (d / Path(out).name).write_bytes(m2)
            for f, data in zip(sk, nsk):
                (d / (Path(out).stem + f.name[-7:].lower())).write_bytes(data)
            # the pack's own textures the cut uses (renamed / added ones stock lacks) ship with it: the pack
            # may not be picked or enabled, and the picker resolves this source's files + stock only
            from lib import skin_fill as sf_
            for t_, n_ in sf_.texture_table(m2):
                if n_ and n_ not in ix.stock:
                    srcf = next((ix._src_files(x).get(n_) for x in o.sources if ix._src_files(x).get(n_)), None)
                    if srcf is None:
                        print('   texture not found in the pack:', n_); continue
                    dst = OUT / srcf.relative_to(next(r for r in srcf.parents if r.name == 'source-assets'))
                    dst.parent.mkdir(parents=True, exist_ok=True); dst.write_bytes(srcf.read_bytes())
                    print('   texture', n_)
