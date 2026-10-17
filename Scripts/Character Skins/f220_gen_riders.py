# Run from Zeppelin-Craft/cli: python3 '../Scripts/Character Skins/f220_gen_riders.py'
# Inputs: zpaks/zep-npc-wardrobe/f220_riders.json (fused rider skins -> displays).
# Then: zep wardrobe build; zep dbc db apply --changed; zep model viewer.
# F-220: two wardrobe manifests per fused rider skin - "fake" (its own skin as the bake) and "look" (look-alike items)
import sys, pickle, json, re, subprocess, numpy as np
sys.path.insert(0, '.')
from pathlib import Path
from PIL import Image
from lib.npc_outfit import Outfits, _lab
from lib import skin_fill as sf
ix = pickle.loads(Path('../../logs/asset_index.pkl').read_bytes())
o = Outfits(ix.stock, ix._meta_cache(), lambda *a: None)
RACE = {'human': 1, 'orc': 2, 'dwarf': 3, 'nightelf': 4, 'scourge': 5, 'tauren': 6, 'gnome': 7, 'troll': 8}
HD = {p.name.lower() for p in Path('../zpaks/patch-hd-everything/mpq/source-assets/Textures/BakedNPCTextures').glob('*')}
from commands.dbc import ENV_PATH
from lib.dbc_utils import DBCConfig, DBCConnection
_cfg = DBCConfig.from_env(ENV_PATH)
_conn = DBCConnection(_cfg).get_connection(_cfg.live)
_oconn = DBCConnection(_cfg).get_connection(_cfg.original)
def qo(sql):
    cur = _oconn.cursor(dictionary=True); cur.execute(sql); r = cur.fetchall(); cur.close(); return r
_qc = {}
def q(sql):
    if sql not in _qc:
        cur = _conn.cursor(dictionary=True); cur.execute(sql)
        _qc[sql] = [{k: ('' if v is None else str(v)) for k, v in r.items()} for r in cur.fetchall()]; cur.close()
    return _qc[sql]
import csv as _csv
IMA = {}   # the wardrobe build's own copy (the build its item import resolves against)
for _r in _csv.DictReader(open('/workspace/project/Zeppelin-Tools/wago-retail-cache/12.1.0.69875/db2/ItemModifiedAppearance.csv', encoding='utf-8', errors='replace')):
    try: IMA[(int(_r['ItemID']), int(_r['ItemAppearanceID']))] = int(_r['ItemAppearanceModifierID'])
    except (KeyError, ValueError): pass
IMA_ITEMS = {(k[0],) for k in IMA}
IMA_ITEMS = {(i,) for i in {k[0] for k in IMA}}

CHAR_M2 = {'troll': 'character/troll/male/trollmale', 'dwarf': 'character/dwarf/male/dwarfmale', 'orc': 'character/orc/male/orcmale',
           'gnome': 'character/gnome/male/gnomemale', 'human': 'character/human/male/humanmale', 'tauren': 'character/tauren/male/taurenmale'}
def _verts(d):
    import struct as _st
    n, o = _st.unpack_from('<II', d, 0x3C); return np.array([_st.unpack_from('<3f', d, o + 48 * i) for i in range(n)])
def _subs(d, s_):
    import struct as _st
    t = sf.texture_table(d); tl_n, tl_o = _st.unpack_from('<II', d, 0x80); tl = _st.unpack_from(f'<{tl_n}H', d, tl_o)
    svn, svo = _st.unpack_from('<II', s_, 4); sv = np.array(_st.unpack_from(f'<{svn}H', s_, svo))
    sm_n, sm_o = _st.unpack_from('<II', s_, 0x1C); b_n, b_o = _st.unpack_from('<II', s_, 0x24)
    S = [_st.unpack_from('<HHHH', s_, sm_o + 48 * i) for i in range(sm_n)]
    tex = {}
    for i in range(b_n):
        f = _st.unpack_from('<BbHHHhHHHHH', s_, b_o + 24 * i); tex.setdefault(f[3], set()).add(t[tl[f[9]]][1])
    return [(S[i][0], sv[S[i][2]:S[i][2] + S[i][3]], tex.get(i, set())) for i in range(sm_n)]
def rider_hair_geoset(mp, race, sex):
    """(hair geoset, beard geoset or None) the fused rider wears, matched by SHAPE: the fused mesh's
    hair-textured submeshes (scalp hair AND beard) against each classic hair geoset alone and with each
    facial-hair geoset (group 1, 101-199) - the wyvern rider's black top-knot + beard came out a bare
    mohawk when only the scalp was tried. None = no hair mesh (helmeted or bald)."""
    if sex != 'male' or race not in CHAR_M2:
        return None
    d = ix.stock[mp].read_bytes(); s_ = ix.stock[mp[:-3] + '00.skin'].read_bytes(); V = _verts(d)
    parts = [V[idx] for gid, idx, tx in _subs(d, s_) if any('hair' in x.rsplit('/', 1)[-1] for x in tx)]
    if not parts:
        return None
    hv = np.concatenate(parts)
    cd = ix.stock[CHAR_M2[race] + '.m2'].read_bytes(); cs = ix.stock[CHAR_M2[race] + '00.skin'].read_bytes(); CV = _verts(cd)
    subs = [(gid, CV[idx]) for gid, idx, tx in _subs(cd, cs)]
    hair = [(g, v) for g, v in subs if 1 <= g < 100]
    beards = [(None, None)] + [(g, v) for g, v in subs if 101 < g < 200]     # 101 = the bare chin
    def score(g_):
        t_ = hv.mean(0) - g_.mean(0)
        for _ in range(5):                     # translation-only nearest-point refinement
            dd = np.sqrt(((hv[:, None, :] - (g_ + t_)[None]) ** 2).sum(-1))
            t_ = t_ + (hv - (g_ + t_)[dd.argmin(1)]).mean(0)
        dd = np.sqrt(((hv[:, None, :] - (g_ + t_)[None]) ** 2).sum(-1))
        return (dd.min(1).mean() + dd.min(0).mean()) / 2 + 0.05 * abs(np.log(len(hv) / max(1, len(g_))))
    best = None
    for gid, hvv in hair:
        for bg, bv in beards:
            sc = score(hvv if bv is None else np.concatenate([hvv, bv]))
            if best is None or sc < best[0]:
                best = (sc, gid, bg)
    print('   hair: fused hair matches classic geoset', best[1], 'beard', best[2], 'score', round(float(best[0]), 3))
    return best[1], best[2]


def hair_colour(hair_tex, race, g):
    """The stock hair colour whose texture is closest (median Lab) to the fused model's own hair texture
    (orcmalehairskin.blp names no colour)."""
    f = ix.stock.get(hair_tex)
    if f is None:
        return None
    t = _lab(np.asarray(Image.open(f).convert('RGB').resize((32, 32), Image.BOX), dtype=np.float32)).reshape(-1, 3)
    best = None
    for r in q(f"SELECT DISTINCT color_index, texture_1 FROM charsections WHERE race = {RACE[race]} AND gender = {g} AND base_section = 3 AND texture_1 <> ''"):
        cf = ix.stock.get(re.sub(r'[\\\\/]+', '/', r['texture_1']).lower())
        if cf is None:
            continue
        c = _lab(np.asarray(Image.open(cf).convert('RGB').resize((32, 32), Image.BOX), dtype=np.float32)).reshape(-1, 3)
        dlt = float(np.linalg.norm(np.median(t, 0) - np.median(c, 0)))
        if best is None or dlt < best[0]:
            best = (dlt, int(r['color_index']))
    return best[1] if best else None

RACE_CODE = {'human': 'hu', 'orc': 'or', 'dwarf': 'dw', 'nightelf': 'ni', 'scourge': 'sc', 'tauren': 'ta', 'gnome': 'gn',
             'troll': 'tr', 'goblin': 'go', 'bloodelf': 'be', 'draenei': 'dr'}


def _tex_subs(m2p, word):
    """Vertices of the submeshes of m2p drawn with a texture whose file name contains word."""
    d = ix.stock[m2p].read_bytes(); sk = ix.stock[m2p[:-3] + '00.skin'].read_bytes(); V = _verts(d)
    pts = [V[idx] for gid, idx, tx in _subs(d, sk) if any(word in x.rsplit('/', 1)[-1] for x in tx)]
    return np.concatenate(pts) if pts else None


def _shape_score(P, Q):
    """Scale- and translation-free chamfer of two point sets (best of four yaw turns) + a size term."""
    def norm(X):
        c = X - X.mean(0); r = np.sqrt((c ** 2).sum(1).mean()); return c / r, r
    Pn, pr = norm(P); Qn, qr = norm(Q)
    best = 9.0
    for a in (0, np.pi / 2, np.pi, -np.pi / 2):
        c_, s_ = np.cos(a), np.sin(a)
        R = Qn @ np.array([[c_, -s_, 0], [s_, c_, 0], [0, 0, 1]]).T
        dd = np.sqrt(((Pn[:, None] - R[None]) ** 2).sum(-1))
        best = min(best, (dd.min(1).mean() + dd.min(0).mean()) / 2)
    return best + 0.3 * abs(np.log(qr / pr))


def rider_helm(mp, race, sex):
    """The stock ItemDisplayInfo for the helm a fused rider wears as its own mesh (a texture named
    *helm*, the mechastrider pilot's pilothelm_yellow_01): the head model closest in SHAPE among the
    race / sex helm files, then of its displays the one whose texture is closest in colour (and that
    hides the hair, on a tie). None when the rider has no helm mesh or nothing is clearly close."""
    if mp is None or race not in RACE_CODE:
        return None
    H = _tex_subs(mp, 'helm')
    if H is None or len(H) < 20:
        return None
    sfx = f'_{RACE_CODE[race]}{sex[0]}.m2'
    res = []
    for k, f in ix.stock.items():
        if k.startswith('item/objectcomponents/head/') and k.endswith(sfx):
            try:
                V = _verts(f.read_bytes())
            except Exception:
                continue
            if len(V) >= 10:
                res.append((_shape_score(H, V), k))
    res.sort()
    if not res or res[0][0] > HELM_MAX:
        print('   helm: no head model close enough', res[:1])
        return None
    stem = res[0][1].rsplit('/', 1)[-1][:-len(sfx)]
    d = ix.stock[mp].read_bytes()
    htex = next((n for _, n in sf.texture_table(d) if 'helm' in n.rsplit('/', 1)[-1]), None)
    t = _lab(np.asarray(Image.open(ix.stock[htex]).convert('RGB').resize((32, 32), Image.BOX), dtype=np.float32)).reshape(-1, 3)
    best = None
    for r in q(f"SELECT id, left_model_texture, helmet_geoset_male, helmet_geoset_female FROM itemdisplayinfo WHERE left_model = '{stem}.mdx' AND id < 200000"):
        cf = ix.stock.get(f"item/objectcomponents/head/{r['left_model_texture'].lower()}.blp")
        if cf is None:
            continue
        c = _lab(np.asarray(Image.open(cf).convert('RGB').resize((32, 32), Image.BOX), dtype=np.float32)).reshape(-1, 3)
        key = (round(float(np.linalg.norm(np.median(t, 0) - np.median(c, 0))), 1),
               int(r['helmet_geoset_male' if sex == 'male' else 'helmet_geoset_female'] or 0) == 0, int(r['id']))
        if best is None or key < best[0]:
            best = (key, int(r['id']))
    print('   helm:', stem, 'shape', round(res[0][0], 3), '(next', round(res[1][0], 3) if len(res) > 1 else '-', ') display', best)
    return best[1] if best else None


HELM_MAX = 0.2      # shape score: the diver helm matched the mechastrider pilot's at 0.175, unrelated helms 0.21+

from lib.npc_outfit import RIDER_CLASS as _RC
_mog = o.lookalike(ix.stock['creature/mounteddeathknight/mounteddeathknightgoldred_03.blp'], 'human', 'male', 4)
DK_SET = frozenset(int(str(r[3][0])[2:]) if str(r[3][0]).startswith('r:') else -int(r[1]) for r in _mog if r[3] or r[1])
print('DK set from Mograine:', [(r[0], r[2]) for r in _mog])
# the Risen Nightmare chest's colour variants: modifier -> ItemAppearance, and each appearance's TorsoUpper fdid
CHEST_VARIANTS = {0: 82957, 4: 82946, 1: 82924, 3: 82935}
CHEST_TU = {82957: 5343330, 82946: 5343329, 82924: 5343327, 82935: 5343328}
DK_HELM = {}
D02 = {3417: 'Shoulder_Plate_D_02', 13512: 'Shoulder_Plate_D_02Gold', 19724: 'Shoulder_Plate_D_02Silver', 21574: 'Shoulder_Plate_D_02Black', 22594: 'Shoulder_Plate_D_02Copper', 26797: 'Shoulder_Plate_D_02Bronze'}
WEAPONS = {}
riders = json.load(open('../zpaks/zep-npc-wardrobe/f220_riders.json'))
out_dir = Path('../zpaks/zep-npc-wardrobe/outfits'); did = 900500
names = {}
# riders kept FUSED (not split): the death knights' fused bodies match no character model (bespoke plate,
# helms and pauldrons no item reproduces), so the stock fused model stays (user, 2026-10-17). Their ids
# stay reserved so the riders after them keep theirs
KEEP_FUSED = ('creature/mounteddeathknight/',)
for path, race, sex, displays in riders:
    if path not in ix.stock: continue
    if path.startswith(KEEP_FUSED):
        did += 2
        continue
    g = 0 if sex == 'male' else 1
    stem = path.rsplit('/', 1)[-1][:-4]; folder = path.split('/')[1]
    name = re.sub(r'[^a-z0-9]+', '_', f'{folder}_{stem}_{sex}')
    # skin colour: the race skin whose face colour is closest to the rider's face
    tgt = np.asarray(Image.open(ix.stock[path]).convert('RGB').resize((128, 128), Image.BOX), dtype=np.float32)
    tf = _lab(tgt[80:128, 0:64]).mean((0, 1))
    pool = q(f'SELECT id, skin_color, face_type, hair_style, hair_color, facial_hair FROM creaturedisplayinfoextra WHERE race = {RACE[race]} AND gender = {g} ORDER BY id')
    pool = [p for p in pool if p.get('id', '').isdigit() and f'creaturedisplayextra-{int(p["id"]):05d}_hd.blp' in HD]
    from lib.wardrobe.compositor import FileResolver, read_blp
    from lib.env import ASSET_LIBRARY_PATH
    global RES
    try: RES
    except NameError:
        from commands.wardrobe import EXTERNAL_ROOTS
        RES = FileResolver([Path('../zpaks/zep-npc-wardrobe/mpq/source-assets')] + list(EXTERNAL_ROOTS))
    sk = {}
    for r in q(f'SELECT color_index, texture_1 FROM charsections WHERE race = {RACE[race]} AND gender = {g} AND base_section = 0 AND type = 0'):
        f = RES.find(r['texture_1']) if r.get('texture_1') else None
        if not f: continue
        a = np.asarray(read_blp(f).convert('RGB').resize((128, 128), Image.BOX), dtype=np.float32)
        sk[int(r['color_index'])] = float(np.median(np.linalg.norm(_lab(a[80:128, 0:64]) - _lab(tgt[80:128, 0:64]), axis=-1)))
    def faces(c):
        return [int(r['type']) for r in q(f"SELECT type FROM charsections WHERE race = {RACE[race]} AND gender = {g} AND base_section = 1 AND color_index = {c} ORDER BY type")]
    avail = sorted((c for c in sk if faces(c)), key=lambda c: sk[c])
    if not avail: print('no pool', name); continue
    col = avail[0]
    # hair colour from the fused model's own hair texture (hair00_07 -> 7), when it has one
    from lib.npc_outfit import RIDERS
    ms = [m for m in ix.stock if m.startswith('creature/' + folder + '/') and m.rsplit('/', 1)[-1] in RIDERS]
    mp = next((m for m in ms if any(n.endswith('/' + stem + '.blp') for _, n in sf.texture_table(ix.stock[m].read_bytes()))), ms[0] if ms else None)
    hc = hs = None
    beard_geo = None
    bald = True
    if mp:
        import struct as _st
        d_ = ix.stock[mp].read_bytes(); tt = sf.texture_table(d_)
        for t, n in tt:
            mm = re.search(r'character/.*/hair\d+_(\d+)\.blp$', n)
            if mm: hc = int(mm.group(1))
        if hc is None:                                   # a hair texture of its own: the closest stock colour
            ht = next((n for _, n in tt if 'hair' in n.rsplit('/', 1)[-1]), None)
            if ht:
                hc = hair_colour(ht, race, g)
                print('   hair colour from', ht, '->', hc)
        # the rider's hair = the fused mesh's hair-textured submeshes, matched by SHAPE against the
        # classic character model's hair geosets (translation-free, a few nearest-point steps)
        hb_ = rider_hair_geoset(mp, race, sex)
        hair_geo, beard_geo = hb_ if hb_ else (None, None)
        bald = hair_geo is None
        if hair_geo is not None:
            r_ = qo(f"SELECT variation FROM charhairgeosets WHERE race = {RACE[race]} AND gender = {g} AND geoset = {hair_geo} ORDER BY variation LIMIT 1")
            if r_: hs = int(r_[0]['variation'])
    def hair_ok(st, hcol):
        return bool(q(f"SELECT 1 FROM charsections WHERE race = {RACE[race]} AND gender = {g} AND base_section = 3 AND type = {st} AND color_index = {hcol}"))
    same = [p for p in pool if int(p['skin_color']) == col and int(p['face_type']) in faces(col)]
    best = sorted(same or pool, key=lambda p: (hc is not None and int(p['hair_color']) != hc, int(p['id'])))[0]
    app = {k: int(best[k]) for k in ('skin_color', 'face_type', 'hair_style', 'hair_color', 'facial_hair')}
    app['skin_color'] = col
    if app['face_type'] not in faces(col):
        app['face_type'] = faces(col)[0]
    if bald:                                         # no hair mesh on the rider: helmeted or bald
        app['hair_style'] = 0
        if not hair_ok(0, app['hair_color']):
            app['hair_color'] = 0
    elif hs is not None and hc is not None and hair_ok(hs, hc):
        app['hair_style'], app['hair_color'] = hs, hc
    elif hc is not None and hair_ok(app['hair_style'], hc):
        app['hair_color'] = hc
    if not hair_ok(app['hair_style'], app['hair_color']):
        app['hair_style'], app['hair_color'] = 0, 0
    # facial hair only where the race has it as a look (dwarves); a borrowed beard on a painted face
    # read as a dark patch (fel orc)
    # facial hair: the beard the fused mesh itself wears (matched by shape above), as the race's facial-hair
    # style whose group-1 geoset it is; none when the rider has no beard mesh (a borrowed beard on a
    # painted face read as a dark patch - fel orc)
    app['facial_hair'] = 0
    if mp and not bald and beard_geo:
        fh_ = qo(f"SELECT variation_id FROM characterfacialhairstyles WHERE race = {RACE[race]} AND gender = {g} AND geoset_1 = {beard_geo - 100} ORDER BY variation_id LIMIT 1")
        if fh_:
            app['facial_hair'] = int(fh_[0]['variation_id'])
        print('   beard geoset', beard_geo, '-> facial hair', app['facial_hair'])
    app['gender'] = g
    base = q(f'SELECT id FROM creaturedisplayinfo WHERE extended_display_info_id = {int(best["id"])} AND id < 900000 LIMIT 1')
    if not base:      # any stock display of this race / sex character model (model + sound only)
        base = q(f"SELECT d.id FROM creaturedisplayinfo d JOIN creaturedisplayinfoextra x ON x.id = d.extended_display_info_id "
                 f"WHERE x.race = {RACE[race]} AND x.gender = {g} AND d.id < 900000 ORDER BY d.id LIMIT 1")
    base_display = int(base[0]['id'])
    # look-alike items (body slots) + 3D pieces named by texture; stock items by their item entry
    from lib.npc_outfit import RIDER_CLASS
    klass_ = RIDER_CLASS.get(mp.rsplit('/', 1)[-1]) if mp else None
    if 'mounteddeathknight/' in path:
        # the death knights wear one plate set (the user: same plate art on all of them, Mograine
        # the closest): Mograine's look-alike items, each rider on the appearances nearest its colours
        rows = o.lookalike(ix.stock[path], race, sex, 4, DK_SET)
    else:
        rows = o.lookalike(ix.stock[path], race, sex, klass_)
    items = {}
    for r in rows:
        it = r[3][0] if r[3] else None
        if it is None: continue
        if str(it).startswith('r:'):
            iid = int(str(it)[2:]); app_id = r[6] if len(r) > 6 else None
            mod = IMA.get((iid, app_id)) if app_id else None
            items[r[0].lower()] = {'item': iid, 'mod': mod} if mod is not None else iid
        elif any(k[0] == int(it) for k in IMA_ITEMS):
            items[r[0].lower()] = int(it)
        elif r[1]:
            # a stock item retail no longer has (NPC-only pieces): wear its ItemDisplayInfo directly
            items[r[0].lower()] = {'display': int(r[1])}
        else:
            print('   skip (not in retail):', r[0], it, r[2])
    if 'mounteddeathknight/' in path:
        # the death knights: Mograine's set (the Risen Nightmare / Naxx DK plate) on every knight, its body
        # pieces RECOLOURED to the knight's own skin (lib/wardrobe/recolour.py), and the set's helm in the
        # colour variant whose chest is nearest the knight's torso
        items = {}
        for r in _mog:
            it = r[3][0] if r[3] else None
            if it is None: continue
            if str(it).startswith('r:'):
                iid = int(str(it)[2:]); mod = IMA.get((iid, r[6])) if len(r) > 6 else None
                spec = {'item': iid} if mod is None else {'item': iid, 'mod': mod}
            elif r[1]:
                spec = {'display': int(r[1])}
            else:
                continue
            if 'item' in spec:
                spec['recolour'] = path.replace('/', '\\')
            items[r[0].lower()] = spec
        # helm: the Wrath DK raid helm G_01 (retail's Risen Nightmare helm has no model files here),
        # its colour variant by the knight's scheme, worn as a stock ItemDisplayInfo
        sch = re.search(r'mounteddeathknight(goldred|greengold|white|darkblueblack|black)_', stem)
        hv_ = {'goldred': 58236, 'greengold': 58231, 'white': 50891, 'darkblueblack': 52982, 'black': 52982}.get(sch.group(1) if sch else '')
        if hv_:
            items['helm'] = {'display': hv_}
            DK_HELM[did] = hv_
            print('   helm: Helm_Plate_RaidDeathKnight_G_01 display', hv_)
    # 3D pieces the fused model names by texture (lib/npc_outfit fused(): 'texture' rows)
    pieces, weapon = {}, None
    if mp:
        dr = q(f"SELECT texture_variation_1, texture_variation_2, texture_variation_3 FROM creaturedisplayinfo WHERE id = {displays[0]}")
        fold = mp.rsplit('/', 1)[0] + '/'
        slots = [fold + str(dr[0].get(f'texture_variation_{k}') or '').lower() + '.blp' if dr and dr[0].get(f'texture_variation_{k}') else '' for k in (1, 2, 3)]
        for r in o.fused(mp, sf.texture_table(ix.stock[mp].read_bytes()), slots):
            if r[4] != 'texture' or not r[3]:
                continue
            if r[0] in ('Shoulders', 'Helm') and any(k[0] == int(r[3][0]) for k in IMA_ITEMS):
                pieces[r[0].lower()] = int(r[3][0])
            elif r[0] == 'Weapon':
                weapon = int(r[3][0])
    if 'mounteddeathknight/' in path:
        # the death knights' pauldrons are Shoulder_Plate_D_02 art (Mograine's GoldRed_04 = the Copper
        # texture exactly): each rider wears the D_02 colour variant nearest its own upper torso
        scheme = re.search(r'mounteddeathknight(goldred|greengold|white|darkblueblack|black)_', stem)
        v_ = {'goldred': 22594, 'greengold': 13512, 'white': 19724, 'darkblueblack': 21574, 'black': 21574}.get(scheme.group(1) if scheme else '')
        best_v = (0, v_, D02[v_]) if v_ else None
        if best_v:
            pieces['shoulders'] = {'display': best_v[1]}
            print('   shoulders: D_02 variant', best_v[2], best_v[1])
    # every fused model wearing this rider skin (the armoured pilot: the Mechano-Tank AND the mechastrider,
    # whose pilot wears a helm mesh)
    from lib.npc_outfit import RIDERS as _R
    hv_ = None
    for m_ in sorted(k for k in ix.stock if k.endswith('.m2') and k.rsplit('/', 1)[-1] in _R):
        if m_ == mp or any(n == path for _, n in sf.texture_table(ix.stock[m_].read_bytes())):
            hv_ = hv_ or rider_helm(m_, race, sex)
    if hv_:
        pieces['helm'] = {'display': hv_}             # the fake wears it too: compare like with like
    if did in DK_HELM:
        pieces['helm'] = {'display': DK_HELM[did]}          # the fake wears it too: compare like with like
    for k, v in pieces.items():
        items.setdefault(k, v)
    WEAPONS[did] = WEAPONS[did + 1] = weapon
    common = dict(task='F-220', kind='unique', race=RACE[race], base_display={str(g): base_display})
    fake = dict(common, name=f'f220_{name}_fake', _comment=f'F-220 fake rider: the fused rider skin {path} as the bake (displays {displays})',
                outfit={'items': dict(pieces)}, appearance=dict(app, skin_texture=path.replace('/', '\\')), option_of=did + 1, option='fake')
    look = dict(common, name=f'f220_{name}_look', _comment=f'F-220 look-alike rider for {path} (displays {displays}): closest items from lib/npc_outfit lookalike',
                outfit={'items': items}, appearance=app, option='look', display_ids=[did + 1])
    for m in (fake, look):
        (out_dir / f'{m["name"]}.json').write_text(json.dumps(m, indent=2) + '\n')
    print(did, did + 1, name, app, 'base', base_display, items)
    did += 2
json.dump(WEAPONS, open('../../logs/f220_rider_weapons.json', 'w'))
