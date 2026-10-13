"""F-216: a display's outfit as items - the model card's / Display editor's Outfit section.

Two sources:
  exact()  character-model displays: their CreatureDisplayInfoExtra row names an ItemDisplayInfo per
           slot (helm .. cape); each maps to the items that use it (item_template.displayid).
  guess()  Blizzard's character-model CLONES baked into a creature model (humanfemalewarriorheavy:
           the human female mesh, character geoset groups 4/5/7/13, one 256x256 skin in the classic
           character texture layout). Each layout region of the skin is matched against the
           same-region item textures (Item/TextureComponents/<region>/, stock files), comparing only
           where the item texture is opaque; a near-exact match names an ItemDisplayInfo. Regions
           that no single texture matches (layered chest + belt + tabard, retextured items) stay
           unmatched rather than guessed. Helmets baked into the mesh cannot be found this way.
  fused()  F-220 fused riders (batrider: the rider is one merged submesh of the mount model). The
           rider's skin is a hard-coded texture in the same classic layout, matched as guess();
           the model's other textures name 3D pieces exactly (ItemDisplayInfo left_model_texture:
           shoulders, weapons). Only items are listed.
"""
from typing import Callable, Dict, List, Optional, Tuple

SLOTS = [('helm_id', 'Helm', 1), ('shoulders_id', 'Shoulders', 3), ('shirt_id', 'Shirt', 4), ('chest_id', 'Chest', 5),
         ('belt_id', 'Belt', 6), ('legs_id', 'Legs', 7), ('boots_id', 'Boots', 8), ('wrists_id', 'Wrists', 9),
         ('gloves_id', 'Gloves', 10), ('tabard_id', 'Tabard', 19), ('cape_id', 'Cape', 16)]
# the classic 256x256 character texture layout: region -> (x, y, w, h), TextureComponents folder,
# ItemDisplayInfo field
REGIONS = {
    'armupper': ((0, 0, 128, 64), 'armuppertexture', 'upper_arm_texture'),
    'armlower': ((0, 64, 128, 64), 'armlowertexture', 'lower_arm_texture'),
    'hand': ((0, 128, 128, 32), 'handtexture', 'hands_texture'),
    'torsoupper': ((128, 0, 128, 64), 'torsouppertexture', 'upper_torso_texture'),
    'torsolower': ((128, 64, 128, 32), 'torsolowertexture', 'lower_torso_texture'),
    'legupper': ((128, 96, 128, 64), 'leguppertexture', 'upper_leg_texture'),
    'leglower': ((128, 160, 128, 64), 'leglowertexture', 'lower_leg_texture'),
    'foot': ((128, 224, 128, 32), 'foottexture', 'foot_texture'),
}
EXACT = 14.0        # mean RGB difference over the item's opaque pixels: <= this = the same texture
LOOSE = 30.0        # an item's OTHER regions must still be at least this close (layered regions blur)
CORR = 0.85         # and an exact region must share the pattern: dark textures differ little in colour
                    # even when unrelated (Calico Shoes "matched" a dark plate boot at 9.2)
CHAR_GROUPS = {4, 5, 7, 8, 9, 10, 11, 12, 13}   # character geoset groups (gloves .. robe)
# F-220 scope list (rider / driver baked into the mount mesh) - the same list as FUSED in layers.html
FUSED = {'batrider.m2', 'alliancerider.m2', 'alliancerider2.m2', 'horderider.m2', 'goblinrocketcar.m2',
         'gnomerocketcar.m2', 'headlesshorsemanmount.m2', 'mounteddeathknight.m2', 'mounteddeathknight_blaumeux.m2',
         'mounteddeathknight_korthazz.m2', 'mounteddeathknight_mograine.m2', 'mounteddeathknight_zeliek.m2',
         'mountedknight.m2', 'mounteddemonknight.m2', 'terongorefiend_mounted.m2', 'felorcnetherdrakemounted.m2',
         'orcdrakerider.m2', 'tauren_mountedcanoe.m2', 'orcdrakerider2.m2', 'gnomespidertank.m2', 'gnomepounder.m2'}
# their rider's skin (classic character layout): an M2 texture stem, or a display slot index
# (0..2 = texture_variation_1..3) when the display skins the rider; race (Character/ folder), sex
RIDERS = {'batrider.m2': ('trollbatriderskin', 'troll', 'male'),
          'alliancerider.m2': ('wildhammerheavy', 'dwarf', 'male'),
          'horderider.m2': ('leather_horde_a_02', 'orc', 'male'),
          'orcdrakerider.m2': ('orcdrakeriderskin', 'orc', 'male'),
          'felorcnetherdrakemounted.m2': ('felorcmaledrakeriderskin', 'orc', 'male'),
          'terongorefiend_mounted.m2': ('terongorefiend1', 'human', 'male'),
          'gnomerocketcar.m2': ('gnomepounderpilotskin_yellow_01', 'gnome', 'male'),
          'gnomespidertank.m2': (1, 'gnome', 'male'), 'gnomepounder.m2': (1, 'gnome', 'male'),
          'mountedknight.m2': (1, 'human', 'male'), 'mounteddemonknight.m2': (1, 'human', 'male'),
          'mounteddeathknight.m2': (2, 'human', 'male'), 'mounteddeathknight_korthazz.m2': (2, 'human', 'male'),
          'mounteddeathknight_mograine.m2': (2, 'human', 'male'), 'mounteddeathknight_zeliek.m2': (2, 'human', 'male'),
          'mounteddeathknight_blaumeux.m2': (2, 'human', 'female'),
          'tauren_mountedcanoe.m2': ('taurenmaleskin', 'tauren', 'male')}
# 3D pieces named by a fused model's textures: InventoryType -> slot
INV_3D = {1: 'Helm', 3: 'Shoulders', 13: 'Weapon', 17: 'Weapon', 21: 'Weapon', 22: 'Off hand', 14: 'Shield',
          23: 'Off hand', 15: 'Ranged', 26: 'Ranged', 25: 'Ranged', 16: 'Cape'}
RACES = ['bloodelf', 'draenei', 'dwarf', 'gnome', 'goblin', 'human', 'nightelf', 'orc', 'scourge', 'tauren', 'troll',
         'worgen', 'naga_', 'broken', 'skeleton', 'vrykul', 'tuskarr', 'foresttroll', 'taunka', 'northrendskeleton',
         'icetroll']
ORDER = ['Shirt', 'Chest', 'Legs', 'Belt', 'Boots', 'Wrists', 'Gloves', 'Tabard']   # bake order (belt after legs)


def race_sex(path: str) -> Optional[Tuple[str, str]]:
    """A character clone's race / sex from its file name (humanfemalewarriorheavy.m2 -> human, female)."""
    n = path.rsplit('/', 1)[-1].lower()
    for r in sorted(RACES, key=len, reverse=True):
        if n.startswith(r):
            rest = n[len(r):]
            return r, 'female' if rest.startswith('female') else 'male'
    return None


def _lab(rgb):
    """sRGB 0..255 -> CIE Lab (D65): distances in it follow what the eye sees."""
    import numpy as np
    c = rgb / 255.0
    c = np.where(c > 0.04045, ((c + 0.055) / 1.055) ** 2.4, c / 12.92)
    xyz = c @ np.array([[0.4124, 0.2126, 0.0193], [0.3576, 0.7152, 0.1192], [0.1805, 0.0722, 0.9505]])
    xyz = xyz / np.array([0.95047, 1.0, 1.08883])
    f = np.where(xyz > 0.008856, np.cbrt(xyz), 7.787 * xyz + 16 / 116)
    return np.stack([116 * f[..., 1] - 16, 500 * (f[..., 0] - f[..., 1]), 200 * (f[..., 1] - f[..., 2])], -1)


# retail items (data/v2/wardrobe/<slot>.json, lib/retail_wardrobe) in the look-alike pool: slot files and
# their region names. Textures come only from the local retail store (lib.retail.texture_file offline):
# items whose textures are not stored yet are left out until they are.
RETAIL_SLOTS = {'shirt': 'Shirt', 'chest': 'Chest', 'legs': 'Legs', 'belt': 'Belt', 'boots': 'Boots', 'gloves': 'Gloves',
                'tabard': 'Tabard'}
RETAIL_REGION = {'ArmUpper': 'upper_arm_texture', 'ArmLower': 'lower_arm_texture', 'Hand': 'hands_texture',
                 'TorsoUpper': 'upper_torso_texture', 'TorsoLower': 'lower_torso_texture', 'LegUpper': 'upper_leg_texture',
                 'LegLower': 'lower_leg_texture', 'Foot': 'foot_texture'}
RETAIL_THUMBS = '/workspace/project/logs/retail_cache/outfit_thumbs.pkl'


def rgba_small(f, w: int, h: int):
    """A BLP2's smallest mip still >= w x h, decoded with numpy (PIL's DXT decoder is pure Python and
    takes seconds on a retail texture), resized to w x h RGBA uint8; None if it can't be read."""
    import struct
    import numpy as np
    from PIL import Image
    try:
        b = open(f, 'rb').read()
        if b[:4] != b'BLP2' or len(b) < 148:
            return np.asarray(Image.open(f).convert('RGBA').resize((w, h), Image.BOX), dtype=np.uint8)
        comp, atype, mips = b[8], b[10], b[11]
        W, H = struct.unpack_from('<II', b, 12)
        offs, sizes = struct.unpack_from('<16I', b, 20), struct.unpack_from('<16I', b, 84)
        lvl = 0
        while mips and lvl + 1 < 16 and offs[lvl + 1] and sizes[lvl + 1] and (W >> (lvl + 1)) >= w and (H >> (lvl + 1)) >= h:
            lvl += 1
        mw, mh = max(1, W >> lvl), max(1, H >> lvl)
        data = b[offs[lvl]:offs[lvl] + sizes[lvl]]
        if comp == 3:
            img = np.frombuffer(data[:mw * mh * 4], np.uint8).reshape(mh, mw, 4)[:, :, [2, 1, 0, 3]]
        elif comp == 2:
            bpb = 8 if atype == 0 else 16
            bw, bh = max(1, (mw + 3) // 4), max(1, (mh + 3) // 4)
            blk = np.frombuffer(data[:bw * bh * bpb], np.uint8).reshape(bw * bh, bpb)
            cb = blk[:, bpb - 8:]
            c = cb[:, :4].copy().view('<u2').astype(np.int32)
            bits = cb[:, 4:].copy().view('<u4')[:, 0]

            def rgb(v):
                return np.stack([((v >> 11) & 31) * 255 // 31, ((v >> 5) & 63) * 255 // 63, (v & 31) * 255 // 31], -1)
            c0, c1 = rgb(c[:, 0]), rgb(c[:, 1])
            four = (c[:, 0] > c[:, 1]) | (atype != 0)
            p2 = np.where(four[:, None], (2 * c0 + c1) // 3, (c0 + c1) // 2)
            p3 = np.where(four[:, None], (c0 + 2 * c1) // 3, 0)
            pal = np.stack([c0, c1, p2, p3], 1)
            ix = ((bits[:, None] >> (2 * np.arange(16, dtype=np.uint32))) & 3).astype(np.int64)
            px = np.take_along_axis(pal, ix[:, :, None].repeat(3, 2), 1)
            if atype == 0:                                  # DXT1: index 3 of a 3-colour block is clear
                al = np.where((~four[:, None]) & (ix == 3), 0, 255)
            elif atype == 1:                                # DXT3: 4-bit explicit alpha
                a4 = blk[:, :8].copy().view('<u8')[:, 0]
                al = ((a4[:, None] >> (4 * np.arange(16, dtype=np.uint64))) & 15).astype(np.int64) * 17
            else:                                           # DXT5: interpolated alpha
                a0, a1 = blk[:, 0].astype(np.int64), blk[:, 1].astype(np.int64)
                ab = np.zeros(len(blk), np.uint64)
                for k in range(6):
                    ab |= blk[:, 2 + k].astype(np.uint64) << np.uint64(8 * k)
                ai = ((ab[:, None] >> (3 * np.arange(16, dtype=np.uint64))) & 7).astype(np.int64)
                eight = a0 > a1
                tab = np.stack([a0, a1] + [np.where(eight, ((7 - k) * a0 + k * a1) // 7, ((5 - k) * a0 + k * a1) // 5)
                                           for k in range(1, 5)]
                               + [np.where(eight, (2 * a0 + 5 * a1) // 7, 0), np.where(eight, (a0 + 6 * a1) // 7, 255)], 1)
                al = np.take_along_axis(tab, ai, 1)
            px = np.concatenate([px, al[:, :, None]], 2)
            img = px.reshape(bh, bw, 4, 4, 4).transpose(0, 2, 1, 3, 4).reshape(bh * 4, bw * 4, 4)[:mh, :mw]
        elif comp == 1:
            pal = np.frombuffer(b[148:148 + 1024], np.uint8).reshape(256, 4)
            idx = np.frombuffer(data[:mw * mh], np.uint8)
            al = np.frombuffer(data[mw * mh:mw * mh + mw * mh], np.uint8) if b[9] == 8 else np.full(mw * mh, 255, np.uint8)
            img = np.concatenate([pal[idx][:, [2, 1, 0]], al[:, None]], 1).reshape(mh, mw, 4)
        else:
            return None
        return np.asarray(Image.fromarray(np.ascontiguousarray(img).astype(np.uint8), 'RGBA').resize((w, h), Image.BOX),
                          dtype=np.uint8)
    except Exception:
        return None


INV_SLOT = {1: 'Helm', 3: 'Shoulders', 4: 'Shirt', 5: 'Chest', 20: 'Chest', 6: 'Belt', 7: 'Legs', 8: 'Boots',
            9: 'Wrists', 10: 'Gloves', 19: 'Tabard', 16: 'Cape'}


class Outfits:
    def __init__(self, stock_files: Dict[str, object], meta, log: Callable = print,
                 extra_items: Optional[Dict[str, object]] = None):
        """extra_items: item texture files the zpaks / packs add (item/texturecomponents/...), searched
        with stock's"""
        self.stock, self.meta, self.log = stock_files, meta, log
        self.extra = extra_items or {}
        self._idi = None
        self._items = None
        self._stacks: Dict[str, tuple] = {}
        self._guess: Dict[str, list] = {}
        self.look_jobs = set()

    # ---- data ------------------------------------------------------------------------------
    def idi(self) -> Dict[int, dict]:
        """ItemDisplayInfo from the live DBC database (custom rows included)."""
        if self._idi is None:
            self._idi = {}
            try:
                from commands.dbc import ENV_PATH
                from lib.dbc_utils import DBCConfig, DBCConnection
                cfg = DBCConfig.from_env(ENV_PATH)
                with DBCConnection(cfg) as conn:
                    cur = conn.get_connection(cfg.live).cursor(dictionary=True)
                    cur.execute('SELECT id, left_model, left_model_texture, ' + ', '.join(f for _, _, f in REGIONS.values()) + ' FROM itemdisplayinfo')
                    for r in cur.fetchall():
                        self._idi[int(r['id'])] = r
            except Exception as ex:                        # optional: no outfit data without the DBC
                self.log(f'  outfit: ItemDisplayInfo unavailable ({ex})')
        return self._idi

    def items(self) -> Dict[int, List[Tuple[int, str, int]]]:
        """displayid -> [(item entry, name, InventoryType)] from the world database."""
        if self._items is None:
            self._items = {}
            from commands.sql import run_mysql_query
            ok, rows = run_mysql_query('SELECT displayid, entry, name, InventoryType FROM item_template WHERE displayid <> 0')
            if ok:
                for line in rows.splitlines()[1:]:
                    p = line.split('\t')
                    if len(p) == 4 and p[0].isdigit():
                        self._items.setdefault(int(p[0]), []).append((int(p[1]), p[2], int(p[3] or 0)))
        return self._items

    def _row(self, slot: str, idi: int, how: str, score: Optional[float] = None) -> list:
        its = sorted(self.items().get(idi, []))[:4]
        r = self.idi().get(idi) or {}
        tex = next((str(r.get(f)) for _, _, f in REGIONS.values() if r.get(f)), '')
        name = its[0][1] if its else (str(r.get('left_model') or '').rsplit('.', 1)[0] or tex or f'display {idi}')
        if not its and name != f'display {idi}':
            name += ' (no item uses it)'
        return [slot, idi, name, [e for e, _, _ in its], how] + ([round(score, 1)] if score is not None else [])

    # ---- exact: a character display's own outfit -------------------------------------------
    def exact(self, cdx_row: dict) -> List[list]:
        out = []
        for f, slot, _inv in SLOTS:
            v = int(cdx_row.get(f) or 0)
            if v:
                out.append(self._row(slot, v, 'bake'))
        return out

    # ---- guess: a character clone baked into a creature model ------------------------------
    @staticmethod
    def is_char_clone(geosets, tex_size) -> bool:
        groups = {g // 100 for g in geosets if g >= 100}
        return len(groups & CHAR_GROUPS) >= 2 and tex_size == (256, 256)

    def _stack(self, region: str, sex: str):
        """All same-region stock item textures, downsampled to the region's size: (stems, rgb, alpha)."""
        k = region + sex
        if k not in self._stacks:
            import numpy as np
            from PIL import Image
            (x, y, w, h), folder, _ = REGIONS[region]
            w, h = w // 2, h // 2                         # matched at half size: memory, not accuracy
            pre = f'item/texturecomponents/{folder}/'
            stems, rgb, alpha = [], [], []
            for p, f in list(self.stock.items()) + [(k, v) for k, v in self.extra.items() if k not in self.stock]:
                if not (p.startswith(pre) and p.endswith('.blp')):
                    continue
                base = p[len(pre):-4]
                if not (base.endswith('_u') or base.endswith('_' + sex)):
                    continue
                def thumb(fp, w=w, h=h):
                    try:
                        return np.asarray(Image.open(fp).convert('RGBA').resize((w, h), Image.BILINEAR), dtype=np.uint8)
                    except Exception:
                        return None
                a = self.meta.get(f'thumbreg{w}x{h}', f, thumb)
                if a is None:
                    continue
                stems.append(base.rsplit('_', 1)[0])
                rgb.append(a[..., :3]); alpha.append(a[..., 3] > 160)
            self._stacks[k] = (stems, np.asarray(rgb, dtype=np.uint8) if rgb else None, np.asarray(alpha) if alpha else None)
        return self._stacks[k]

    GUESS_VERSION = 3        # bump when the matching rules change: cached results are recomputed

    def guess(self, skin_file, sex: str = 'f') -> List[list]:
        """Outfit rows for a character-clone skin, cached per skin file (size + mtime) in the
        persistent MetaCache: a deploy only matches skins that are new or changed."""
        k = f'{skin_file}|{sex}'
        if k in self._guess:
            return self._guess[k]
        self._guess[k] = self.meta.get(f'outfitguess{self.GUESS_VERSION}{sex}', skin_file, lambda f: self._guess_now(f, sex))
        return self._guess[k]

    def _guess_now(self, skin_file, sex: str) -> List[list]:
        k = f'{skin_file}|{sex}|now'
        import numpy as np
        from PIL import Image
        try:
            bake = np.asarray(Image.open(skin_file).convert('RGB').resize((128, 128), Image.BILINEAR), dtype=np.float32)
        except Exception:
            return []
        matched: Dict[str, Tuple[str, float]] = {}
        dist: Dict[str, Dict[str, float]] = {}            # region field -> {stem: difference}
        for region, ((x, y, w, h), _, _) in REGIONS.items():
            stems, rgb, alpha = self._stack(region, sex)
            if rgb is None:
                continue
            x, y, w, h = x // 2, y // 2, w // 2, h // 2
            reg = bake[y:y + h, x:x + w]
            rl = reg.mean(-1).reshape(-1)
            ds, cs = [], []
            for a0 in range(0, len(stems), 512):          # chunks: bounded memory
                c_rgb = rgb[a0:a0 + 512].astype(np.float32); c_m = alpha[a0:a0 + 512].reshape(len(c_rgb), -1).astype(np.float32)
                n = np.maximum(1, c_m.sum(1))
                diff = np.abs(c_rgb - reg[None]).mean(-1).reshape(len(c_rgb), -1)
                dd = (diff * c_m).sum(1) / n
                dd[c_m.mean(1) < 0.08] = 1e9
                # pattern: correlation of brightness over the item's opaque pixels
                lum = c_rgb.mean(-1).reshape(len(c_rgb), -1)
                lc = lum - ((lum * c_m).sum(1) / n)[:, None]; rc = rl[None] - ((rl[None] * c_m).sum(1) / n)[:, None]
                cc = (lc * rc * c_m).sum(1) / np.sqrt(np.maximum(1e-6, (lc * lc * c_m).sum(1) * (rc * rc * c_m).sum(1)))
                ds.append(dd); cs.append(cc)
            d, corr = np.concatenate(ds), np.concatenate(cs)
            d = np.where(corr >= CORR, d, np.maximum(d, EXACT + 0.01))   # no pattern = never exact
            i = int(d.argmin())
            dist[REGIONS[region][2]] = {st.lower(): float(v) for st, v in zip(stems, d) if v <= LOOSE}
            if d[i] <= EXACT:
                matched[region] = (stems[i], float(d[i]))
        # matched textures -> the ItemDisplayInfo rows built from them (most regions agreeing first)
        best: Dict[str, Tuple[int, int, float]] = {}
        for idi, row in self.idi().items():
            regs = [(f, str(row.get(f) or '').lower()) for _, _, f in REGIONS.values() if row.get(f)]
            if not regs:
                continue
            ds = [dist.get(f, {}).get(v) for f, v in regs]
            if any(x is None for x in ds):
                continue                                    # a region it paints is not in the bake
            hit = sum(1 for x in ds if x <= EXACT)
            if not hit:
                continue
            score = sum(ds)
            invs = {inv for _, _, inv in self.items().get(idi, [])}
            slot = next((INV_SLOT[i] for i in sorted(invs) if i in INV_SLOT), None)
            if not slot or not self.items().get(idi):
                continue
            cand = (hit, -score / len(ds), idi)
            if slot not in best or cand > best[slot]:
                best[slot] = cand
        out = [self._row(slot, idi, 'matched', -neg) for slot, (hit, neg, idi) in
               sorted(best.items(), key=lambda kv: [s for _, s, _ in SLOTS].index(kv[0]) if kv[0] in [s for _, s, _ in SLOTS] else 99)]
        unmatched = [r for r in REGIONS if r not in matched]
        if unmatched:
            out.append(['(unmatched)', 0, ', '.join(unmatched), [], 'none'])
        return out

    # ---- fused: the rider baked into a mount model (F-220) ---------------------------------
    def fused(self, model: str, table: List[Tuple[int, str]], slots: List[str]) -> List[list]:
        """Outfit rows for a fused rider model. table = the M2 texture table [(type, path)], slots =
        the display's texture_variation_1..3 as model-folder paths. The rider's skin (RIDERS) is a
        classic-layout composite matched against item textures like guess(); only matched items
        are returned (these skins are mostly bespoke art no item uses)."""
        from PIL import Image
        rider = RIDERS.get(model.rsplit('/', 1)[-1])
        out: List[list] = []
        if rider:
            src, race, sex = rider
            path = slots[src] if isinstance(src, int) and src < len(slots) else \
                next((n for t, n in table if n.rsplit('/', 1)[-1] == f'{src}.blp'), '')
            f = self.stock.get(path) if path else None
            try:
                ok = f is not None and Image.open(f).size == (256, 256)
            except Exception:
                ok = False
            if ok:
                out += self.with_lookalike([r for r in self.guess(f, sex[0]) if r[1]], f, race, sex)
        # 3D pieces: a texture an item display names exactly. The mesh is merged, so among displays
        # sharing the texture the one whose model file is the texture's stem is preferred.
        by_tex: Dict[str, List[int]] = {}
        for idi, r in self.idi().items():
            t = str(r.get('left_model_texture') or '').lower()
            if t:
                by_tex.setdefault(t, []).append(idi)
        seen = set()
        for t, n in table:
            stem = n.rsplit('/', 1)[-1][:-4] if n.endswith('.blp') else ''
            if t != 0 or not stem:
                continue
            cands = [i for i in by_tex.get(stem, []) if self.items().get(i)]
            if not cands:
                continue

            def rank(i, low=stem.lower()):
                lm = str(self.idi()[i].get('left_model') or '').lower().rsplit('.', 1)[0]
                lm = lm[1:] if lm[:1] in ('l', 'r') and lm[1:9] == 'shoulder' else lm
                return (0 if lm and low.startswith(lm) else 1, i)
            idi = min(cands, key=rank)
            invs = {inv for _, _, inv in self.items()[idi]}
            slot = next((INV_3D[i] for i in sorted(invs) if i in INV_3D), None)
            if slot and slot not in seen:
                seen.add(slot)
                out.append(self._row(slot, idi, 'texture'))
        return out

    # ---- look-alike: the closest item outfit when nothing matches exactly ------------------
    def with_lookalike(self, rows: List[list], skin_file, race: str, sex: str) -> List[list]:
        """Exact rows + look-alike rows for the slots no exact row fills (the '(unmatched)' note
        goes: the look-alike covers those regions)."""
        have = {r[0] for r in rows if r[1]}
        look = [r for r in self.lookalike(skin_file, race, sex) if r[0] not in have]
        return [r for r in rows if r[1] or not look] + look

    LOOK_VERSION = 2         # bump when the rules change: cached results are recomputed

    def lookalike(self, skin_file, race: str, sex: str) -> List[list]:
        """The item outfit that looks most like a baked character skin (classic layout, any size):
        the race's closest bare skin, then per slot in bake order the item that brings the composite
        closest to the skin (CIE Lab, compared blurred: the colour and tone of each body part, not
        its pixels); an item is kept only if it clearly beats what is under it. Two passes, so a
        slot is re-chosen once the others are on. Rows [slot, idi, name, items, 'closest', gain %]."""
        nr = len(self.retail_pool(sex)[0]) // 1000          # the pool grows as the retail store fills
        k = f'look{self.LOOK_VERSION}{race}{sex}r{nr}'
        if getattr(self, 'collecting', False):
            from lib.asset_index import stat_of
            hit = self.meta.data.get((k, str(skin_file)))
            if hit and tuple(hit[:2]) == tuple(stat_of(skin_file)):
                return hit[2]
            self.look_jobs.add((str(skin_file), race, sex, k))
            return []
        return self.meta.get(k, skin_file, lambda f: self._look_now(f, race, sex))

    look_jobs: set = set()

    def prefetch_lookalikes(self, workers: int = 6, log: Callable = print) -> None:
        """Compute the look-alikes collected by a collecting pass, in parallel (fork: the search pools
        are built once here and shared copy-on-write), into the MetaCache."""
        import multiprocessing as mp
        from pathlib import Path
        from lib.asset_index import stat_of
        jobs = sorted(self.look_jobs)
        self.look_jobs = set()
        for sex in {j[2] for j in jobs}:
            self._look_pool(sex)
        global _LOOK_SELF
        _LOOK_SELF = self
        with mp.get_context('fork').Pool(workers) as pool:
            res = pool.map(_look_job, [(f, r, s) for f, r, s, _ in jobs], chunksize=1)
        for (f, r, s, k), rows in zip(jobs, res):
            size, mtime = stat_of(Path(f))
            self.meta.data[(k, f)] = (size, mtime, rows)
            self.meta.dirty = True
        log(f'    outfit: {len(jobs):,} look-alikes computed ({workers} workers)')

    def retail_pool(self, sex: str):
        """Retail armour usable as a look-alike: [(slot, item id, name, {field: fdid})] whose region
        textures are all in the local retail store, + their 64-scale RGBA thumbnails {(field, fdid): a}
        (persistent: RETAIL_THUMBS, so each texture is decoded once)."""
        if getattr(self, '_rpool', {}).get(sex) is not None:
            return self._rpool[sex]
        import json
        import pickle
        from pathlib import Path
        self._rpool = getattr(self, '_rpool', {})
        try:
            from lib import retail
            from lib.retail_wardrobe import WARDROBE_DIR
        except Exception:
            self._rpool[sex] = ([], {})
            return self._rpool[sex]
        gi = 1 if sex.startswith('f') else 0
        size = {fld: (w // 4, h // 4) for (_x, _y, w, h), _, fld in REGIONS.values()}
        tp = Path(RETAIL_THUMBS)
        if not hasattr(self, '_rthumbs'):
            try:
                self._rthumbs = pickle.loads(tp.read_bytes())
            except Exception:
                self._rthumbs = {}
        th, new = self._rthumbs, 0
        items = []
        for fn, slot in RETAIL_SLOTS.items():
            try:
                rows = json.loads((WARDROBE_DIR / f'{fn}.json').read_text()).get('items', [])
            except Exception:
                continue
            for it in rows:
                regs = {RETAIL_REGION[k]: int(v[gi] or v[1 - gi]) for k, v in (it[7] or {}).items()
                        if k in RETAIL_REGION and (v[gi] or v[1 - gi])}
                if not regs:
                    continue
                ok = True
                for fld, fd in regs.items():
                    key = (fld, fd)
                    if key not in th:
                        f = retail.texture_file(fd, offline=True)
                        if f is None:
                            ok = False
                            continue                       # not downloaded yet: scored once it is
                        th[key] = rgba_small(f, *size[fld])
                        new += 1
                    if th.get(key) is None:
                        ok = False
                if ok:                                     # it[4] = the retail ItemAppearance id
                    items.append((slot, int(it[0]), str(it[1]), regs, int(it[4])))
        if new:
            try:
                tmp = tp.with_suffix('.tmp')
                tmp.write_bytes(pickle.dumps(th))
                tmp.replace(tp)
            except Exception:
                pass
            self.log(f'    outfit: {new:,} retail item textures thumbnailed')
        self._rpool[sex] = (items, th)
        return self._rpool[sex]

    def _look_pool(self, sex: str):
        """The look-alike search pool for one sex, built once per run: {field: (box, {stem: i}, Lab,
        coverage)} at 64 scale (stock + zpak + stored retail textures) and {slot: [(key, [(field, i)])]}
        (key = ItemDisplayInfo id, or ('r', retail item id, name))."""
        if sex in getattr(self, '_lpool', {}):
            return self._lpool[sex]
        import numpy as np
        stk = {}
        for r, ((x, y, w, h), _, fld) in REGIONS.items():
            stems, rgb, al = self._stack(r, sex[0])
            if rgb is None:
                continue
            n = len(stems)
            lab = _lab(rgb.reshape(n, h // 4, 2, w // 4, 2, 3).astype(np.float32).mean((2, 4)))
            cov = al.reshape(n, h // 4, 2, w // 4, 2).astype(np.float32).mean((2, 4))
            stk[fld] = ((x // 4, y // 4, w // 4, h // 4), {st.lower(): i for i, st in enumerate(stems)}, lab, cov)
        by_slot: Dict[str, list] = {}
        for idi, row in self.idi().items():
            its = self.items().get(idi)
            if not its:
                continue
            slot = next((INV_SLOT[i] for _, _, i in its if i in INV_SLOT), None)
            regs = [(f, str(row.get(f) or '').lower()) for f in stk if row.get(f)]
            if slot in ORDER and regs and all(v in stk[f][1] for f, v in regs):
                by_slot.setdefault(slot, []).append((idi, [(f, stk[f][1][v]) for f, v in regs]))
        # retail armour from the local store: appended to the same stacks, keyed 'r<fdid>'
        ritems, rth = self.retail_pool(sex)
        add: Dict[str, list] = {}
        for _slot, _iid, _nm, regs, _app in ritems:
            for fld, fd in regs.items():
                if fld in stk and f'r{fd}' not in stk[fld][1]:
                    stk[fld][1][f'r{fd}'] = -1                # placeholder: indexed below
                    add.setdefault(fld, []).append(fd)
        for fld, fds in add.items():
            box, keys, lab, cov = stk[fld]
            a = np.asarray([rth[(fld, fd)] for fd in fds], dtype=np.float32)
            n0 = len(lab)
            for j, fd in enumerate(fds):
                keys[f'r{fd}'] = n0 + j
            stk[fld] = (box, keys, np.concatenate([lab, _lab(a[..., :3])]),
                        np.concatenate([cov, np.clip((a[..., 3] - 96) / 128, 0, 1)]))
        for slot, iid, nm, regs, app in ritems:
            if all(fld in stk for fld in regs):
                by_slot.setdefault(slot, []).append((('r', iid, nm, app), [(fld, stk[fld][1][f'r{fd}']) for fld, fd in regs.items()]))

        self._lpool = getattr(self, '_lpool', {})
        # per slot: the candidates as index arrays per region field (-1 = the item does not paint it),
        # so a slot's whole candidate list is scored with one gather per field
        arr = {}
        for slot, cands in by_slot.items():
            flds = sorted({f for _, regs in cands for f, _ in regs})
            idx = {f: np.full(len(cands), -1, dtype=np.int64) for f in flds}
            for j, (_, regs) in enumerate(cands):
                for f, i in regs:
                    idx[f][j] = i
            arr[slot] = idx
        self._lpool[sex] = (stk, by_slot, arr)
        return stk, by_slot, arr

    def _look_now(self, skin_file, race: str, sex: str) -> List[list]:
        import numpy as np
        from PIL import Image

        def lab64(a):                                  # 128-scale RGB(A) -> 64-scale Lab (2x2 average)
            a = a.reshape(a.shape[0] // 2, 2, a.shape[1] // 2, 2, -1).mean((1, 3))
            return _lab(a[..., :3])
        try:
            tgt = lab64(np.asarray(Image.open(skin_file).convert('RGB').resize((128, 128), Image.BOX), dtype=np.float32))
        except Exception:
            return []
        body = np.ones((64, 64), bool); body[40:64, 0:32] = False      # the face rectangles are never scored
        face = ~body
        # 1. bare skin: the race skin whose face colour is closest (the face is always bare skin)
        skins = []
        pre = f'character/{race}/{sex}/{race}{sex}skin00_'
        for p, f in self.stock.items():
            if p.startswith(pre) and p.endswith('.blp'):
                a = self.meta.get('lookskin128', f, lambda x: np.asarray(
                    Image.open(x).convert('RGB').resize((128, 128), Image.BOX), dtype=np.uint8))
                skins.append((p, lab64(a.astype(np.float32))))
        if not skins:
            return []
        tf = tgt[face].mean(0)
        cur = min(skins, key=lambda x: float(np.linalg.norm(x[1][face].mean(0) - tf)))[1].copy()
        # 2. the search pool (cached per sex)
        stk, by_slot, arr = self._look_pool(sex)
        def err(img):
            return float(np.linalg.norm(img - tgt, axis=-1)[body].sum())

        def paint(img, regs):
            img = img.copy()
            for f, i in regs:
                (x, y, w, h), _, lab, cov = stk[f]
                c = cov[i][..., None]
                img[y:y + h, x:x + w] = img[y:y + h, x:x + w] * (1 - c) + lab[i] * c
            return img
        bare = cur.copy()
        chosen: Dict[str, Tuple[int, list]] = {}
        for _pass in range(2):
            for slot in ORDER:
                base = bare
                for sl in ORDER:                       # everything else on, in bake order
                    if sl != slot and sl in chosen:
                        base = paint(base, chosen[sl][1])
                # error change of each region texture painted over base, vectorised per region
                cands = by_slot.get(slot, [])
                if not cands:
                    continue
                # only the region fields this slot's items paint
                d = np.zeros(len(cands), dtype=np.float64)
                for f, idx in arr[slot].items():
                    (x, y, w, h), _, lab, cov = stk[f]
                    use = np.unique(idx[idx >= 0])
                    t, b = tgt[y:y + h, x:x + w], base[y:y + h, x:x + w]
                    cv = cov[use][..., None]
                    new = np.linalg.norm(b[None] * (1 - cv) + lab[use] * cv - t[None], axis=-1)
                    m = body[y:y + h, x:x + w][None]
                    dl = np.zeros(len(lab), dtype=np.float64)
                    dl[use] = ((new - np.linalg.norm(b - t, axis=-1)[None]) * m).reshape(len(use), -1).sum(1)
                    d += np.where(idx >= 0, dl[np.maximum(idx, 0)], 0.0)
                j = int(d.argmin())
                # kept only if it removes at least 2% of the slot-free composite's error; a tabard
                # 10%: it covers the chest, so a near-tie would hide a chest piece under cloth
                if d[j] < -(0.10 if slot == 'Tabard' else 0.02) * err(base):
                    chosen[slot] = (cands[j][0], cands[j][1], float(-d[j]))
                else:
                    chosen.pop(slot, None)
        e0 = err(bare)
        out = []
        for sl in ORDER:
            if sl in chosen:
                key, _, gain = chosen[sl]
                if isinstance(key, tuple):                # retail: r:<item id>, as the Display editor takes it;
                    # 7th = the ItemAppearance scored (an item has several - the build must import this one)
                    out.append([sl, 0, key[2] + ' (retail)', [f'r:{key[1]}'], 'closest', round(100.0 * gain / e0, 1), key[3]])
                else:
                    out.append(self._row(sl, key, 'closest', 100.0 * gain / e0))
        return out


_LOOK_SELF = None


def _look_job(job):
    """A forked worker: one look-alike from the parent's Outfits (pools already built)."""
    from pathlib import Path
    f, race, sex = job
    try:
        return _LOOK_SELF._look_now(Path(f), race, sex)
    except Exception:
        return []
