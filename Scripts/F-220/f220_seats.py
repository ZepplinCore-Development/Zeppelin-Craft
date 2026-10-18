# F-220: run from Zeppelin-Craft/cli AFTER f220_cut_mounts_stock.py / _packs.py write. Places the seat
# (attachment 0) of every riderless mount so its rider - placed by its ORIGIN in the Mount pose - overlays
# the fused rider (lib/strip_rider.body_seat), with the rider race's picked (HD) body. Also writes the seated
# copy of the empty Mechano-Tank (GnomeSpiderTank02_Pilot) for 5926 / 22700.
import sys, pickle, shutil
sys.path.insert(0, '.')
from pathlib import Path
from lib import strip_rider as sr
ix = pickle.loads(Path('../../logs/asset_index.pkl').read_bytes())
Z = Path('../zpaks/zep-mounted-npcs/mpq/source-assets')
ZP = Path('../zpaks/zep-mounted-npcs-packs/mpq/source-assets')


def body(race):
    k = f'character/{race}/male/{race}male.m2'
    opts = ix.meshes[k].options if k in ix.meshes else []
    o = next((x for x in opts if x.sources != ['stock']), None)          # the HD body the picker seats
    files = o.files if o else {k: ix.stock[k], k[:-3] + '00.skin': ix.stock[k[:-3] + '00.skin']}
    return files[k].read_bytes(), files[k[:-3] + '00.skin'].read_bytes()


def skin00(path):
    return ix.stock[path[:-3] + '00.skin'].read_bytes()      # stock files can sit in different folders


# riderless model (client path), fused stock model, rider textures, slots, rider race
SEATS = [
    ('Creature/GnomeRocketCar/GnomeRocketCar_Empty.m2', 'creature/gnomerocketcar/gnomerocketcar.m2', {'gnomepounderpilotskin_yellow_01', 'gnomemaleskin00new'}, set(), 'gnome'),
    ('Creature/HordeRider/HordeRider_Mount.m2', 'creature/horderider/horderider.m2', {'leather_horde_a_02'}, set(), 'orc'),
    ('Creature/FelOrcNetherdrake/FelOrcNetherDrake_Mount.m2', 'creature/felorcnetherdrake/felorcnetherdrakemounted.m2', {'felorcmaledrakeriderskin'}, set(), 'orc'),
    ('Creature/Tauren_MountedCanoe/Tauren_Canoe.m2', 'creature/tauren_mountedcanoe/tauren_mountedcanoe.m2', {'taurenmaleskin'}, set(), 'tauren'),
    ('Creature/MountedKnight/MountedKnight_Horse.m2', 'creature/mountedknight/mountedknight.m2', set(), {12}, 'human'),
    ('Creature/AllianceRider/AllianceRider_Gryphon.m2', 'creature/alliancerider/alliancerider.m2', {'wildhammerheavy'}, set(), 'dwarf'),
]
for out, fused, tex, slots, race in SEATS:
    pts = sr.rider_points(ix.stock[fused].read_bytes(), skin00(fused), tex, slots)
    seat = sr.body_seat(pts, *body(race))
    for root in (Z, ZP):
        f = root / out
        if f.exists():
            f.write_bytes(sr.place_seat(f.read_bytes(), seat))
            print(f'{root.parent.parent.name:24} {out}: seat {tuple(round(v, 3) for v in seat)}')

# the empty Mechano-Tank, seated for the gnome pilot of the fused tank (same model space)
src = ix.stock['creature/gnomespidertank/gnomespidertank02.m2']
pts = sr.rider_points(ix.stock['creature/gnomespidertank/gnomespidertank.m2'].read_bytes(), skin00('creature/gnomespidertank/gnomespidertank.m2'), set(), {12})
seat = sr.body_seat(pts, *body('gnome'))
d = Z / 'Creature/GnomeSpiderTank'; d.mkdir(parents=True, exist_ok=True)
(d / 'GnomeSpiderTank02_Pilot.m2').write_bytes(sr.place_seat(src.read_bytes(), seat))
for k, p in sorted(ix.stock.items()):
    n = k.rsplit('/', 1)[-1]
    if k.startswith('creature/gnomespidertank/gnomespidertank02') and n.endswith(('.skin', '.anim')):
        shutil.copyfile(p, d / ('GnomeSpiderTank02_Pilot' + n[len('gnomespidertank02'):]))
print(f'zep-mounted-npcs          GnomeSpiderTank02_Pilot.m2: seat {tuple(round(v, 3) for v in seat)}')
