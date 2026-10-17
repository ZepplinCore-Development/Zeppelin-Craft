# F-220: run from Zeppelin-Craft/cli. Rebuilds the riderless mount models (gitignored mpq files).
# Stock fused models -> zep-mounted-npcs (with 'write'); prints what each cut removes.
import sys, pickle, json
sys.path.insert(0, '.')
from pathlib import Path
from lib import strip_rider as sr
ix = pickle.loads(Path('../../logs/asset_index.pkl').read_bytes())
OUT = Path('../zpaks/zep-mounted-npcs/mpq/source-assets')
# display: (fused model, new client path, rider texture stems, rider display-skin texture types)
JOBS = {
    17202: ('creature/alliancerider/alliancerider.m2', 'Creature/AllianceRider/AllianceRider_Gryphon.m2', {'wildhammerheavy', 'dwarfmalehairskin', 'shoulder_leather_horde_b_03red', 'hammer_2h_pvpalliance_a_01'}, set()),
    17203: ('creature/horderider/horderider.m2', 'Creature/HordeRider/HordeRider_Mount.m2', {'leather_horde_a_02', 'orcmalehairskin', 'axe_2h_blackwing_a_01', 'shoulder_mail_b_02green'}, set()),
    18813: ('creature/felorcnetherdrake/felorcnetherdrakemounted.m2', 'Creature/FelOrcNetherdrake/FelOrcNetherDrake_Mount.m2', {'felorcmaledrakeriderskin', 'felorcmaledrakeridernakedskin', 'shoulder_mail_pvphorde_c_01green', 'polearm_2h_hellfire_d_01', 'hellfire', 'polearm_2h_hellfire_d_01_glow', 'polearm_2h_hellfire_d_01_alpha', 'felorceye'}, set()),
    # 9723 Rend's drake: the stock Drake.m2 (571) instead, no cut
    # 9723: ('creature/drake/orcdrakerider.m2', 'Creature/Drake/OrcDrakeRider_Mount.m2', {'orcdrakeriderskin', 'blackrockleaderbits'}, set()),
    21602: ('creature/tauren_mountedcanoe/tauren_mountedcanoe.m2', 'Creature/Tauren_MountedCanoe/Tauren_Canoe.m2', {'taurenmaleskin'}, set()),
    2490: ('creature/gnomerocketcar/gnomerocketcar.m2', 'Creature/GnomeRocketCar/GnomeRocketCar_Empty.m2', {'gnomepounderpilotskin_yellow_01'}, set()),
    5926: ('creature/gnomespidertank/gnomespidertank.m2', 'Creature/GnomeSpidertank/GnomeSpiderTank_Empty.m2', set(), {12}),
    15649: ('creature/mounteddemonknight/mounteddemonknight.m2', 'Creature/MountedDemonKnight/MountedDemonKnight_Horse.m2', set(), {12}),
    1545: ('creature/mountedknight/mountedknight.m2', 'Creature/MountedKnight/MountedKnight_Horse.m2', set(), {12}),
}
for did, (src, out, tex, slots) in JOBS.items():
    f = ix.stock.get(src)
    try:
        m2 = f.read_bytes()
        skins = sorted(p for p in f.parent.iterdir() if p.name.lower().startswith(f.stem.lower()) and p.suffix.lower() == '.skin')
        new, nsk, rep = sr.strip(m2, [p.read_bytes() for p in skins], tex, slots)
        if len(sys.argv) > 1 and sys.argv[1] == 'write':
            o = OUT / out; o.parent.mkdir(parents=True, exist_ok=True); o.write_bytes(new)
            for p, data in zip(skins, nsk):
                (o.parent / (o.stem + p.name[-7:].lower())).write_bytes(data)
        print('   ', {k: v for k, v in rep.items() if k != 'seat'}, 'seat', [round(x, 2) for x in rep['seat']])
    except Exception as ex:
        print(did, src, 'FAILED', ex)
# regression: Teron as shipped
f = ix.stock['creature/terongorefiend_mounted/terongorefiend_mounted.m2']; m2 = f.read_bytes()
skins = sorted(p for p in f.parent.iterdir() if p.name.lower().startswith(f.stem.lower()) and p.suffix.lower() == '.skin')
new, nsk, rep = sr.strip(m2, [p.read_bytes() for p in skins], {'terongorefiend1'})
old = Path('../zpaks/zep-mounted-npcs/mpq/source-assets/Creature/TeronGorefiend_Mounted/TeronGorefiend_Horse.m2').read_bytes()
print('TERON same m2 as shipped:', new == old, rep['removed'])
