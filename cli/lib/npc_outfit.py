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
# (0..2 = texture_variation_1..3) when the display skins the rider; race, sex
RIDERS = {'batrider.m2': ('trollbatriderskin', 'Troll', 'male'),
          'alliancerider.m2': ('wildhammerheavy', 'Dwarf', 'male'),
          'horderider.m2': ('leather_horde_a_02', 'Orc', 'male'),
          'orcdrakerider.m2': ('orcdrakeriderskin', 'Orc', 'male'),
          'felorcnetherdrakemounted.m2': ('felorcmaledrakeriderskin', 'Fel orc', 'male'),
          'terongorefiend_mounted.m2': ('terongorefiend1', 'Teron Gorefiend (race not checked)', 'male'),
          'gnomerocketcar.m2': ('gnomepounderpilotskin_yellow_01', 'Gnome', 'male'),
          'gnomespidertank.m2': (1, 'Gnome', 'male'), 'gnomepounder.m2': (1, 'Gnome', 'male'),
          'mountedknight.m2': (1, 'Human', 'male'), 'mounteddemonknight.m2': (1, 'Human', 'male'),
          'mounteddeathknight.m2': (2, 'Human', 'male'), 'mounteddeathknight_korthazz.m2': (2, 'Human', 'male'),
          'mounteddeathknight_mograine.m2': (2, 'Human', 'male'), 'mounteddeathknight_zeliek.m2': (2, 'Human', 'male'),
          'mounteddeathknight_blaumeux.m2': (2, 'Human', 'female'),
          'tauren_mountedcanoe.m2': ('taurenmaleskin', 'Tauren', 'male')}
# 3D pieces named by a fused model's textures: InventoryType -> slot
INV_3D = {1: 'Helm', 3: 'Shoulders', 13: 'Weapon', 17: 'Weapon', 21: 'Weapon', 22: 'Off hand', 14: 'Shield',
          23: 'Off hand', 15: 'Ranged', 26: 'Ranged', 25: 'Ranged', 16: 'Cape'}
INV_SLOT = {1: 'Helm', 3: 'Shoulders', 4: 'Shirt', 5: 'Chest', 20: 'Chest', 6: 'Belt', 7: 'Legs', 8: 'Boots',
            9: 'Wrists', 10: 'Gloves', 19: 'Tabard', 16: 'Cape'}


class Outfits:
    def __init__(self, stock_files: Dict[str, object], meta, log: Callable = print):
        self.stock, self.meta, self.log = stock_files, meta, log
        self._idi = None
        self._items = None
        self._stacks: Dict[str, tuple] = {}
        self._guess: Dict[str, list] = {}

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
            for p, f in self.stock.items():
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
                out += [r for r in self.guess(f, sex[0]) if r[1]]
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
