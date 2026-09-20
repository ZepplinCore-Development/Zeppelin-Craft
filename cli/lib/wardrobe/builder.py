"""
Wardrobe builder (F-198): manifests -> assets, bakes and SQL.

Every manifest in <zpak>/outfits/*.json is built on each run and all outputs are
regenerated, so the emitted `[AUTO,<task>]` files always reflect the manifests.

Manifest kinds:
  unique   one appearance, one display (a named one-off NPC)
  uniform  up to MAX_VARIANTS appearances of one outfit (a guard force); appearances
           are explicit or drawn from the stock NPC appearances that ship an HD bake
"""

import hashlib
import json
import shutil
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from . import m2 as m2lib
from .blp import write_blp_dxt
from .compositor import FileResolver, compose
from .retail import RetailData, RetailItem
from ..m2_vertex_shifter import transform_vertices

MAX_VARIANTS = 10
MAX_MODELS_PER_CREATURE = 4   # AC schema: CHECK creature_template_model_chk_1 (Idx <= 3)
ITEM_DISPLAY_BASE = 210000
BODY_SLOTS = ('shirt', 'chest', 'tabard', 'legs', 'belt', 'boots', 'wrists', 'gloves')
MODEL_SLOTS = ('helm', 'shoulders')
EXTRA_SLOT_COLS = {'helm': 'helm_id', 'shoulders': 'shoulders_id', 'shirt': 'shirt_id', 'chest': 'chest_id',
                   'belt': 'belt_id', 'legs': 'legs_id', 'boots': 'boots_id', 'wrists': 'wrists_id',
                   'gloves': 'gloves_id', 'tabard': 'tabard_id', 'cape': 'cape_id'}
IDI_REGION_COLS = {'ArmUpper': 'upper_arm_texture', 'ArmLower': 'lower_arm_texture', 'Hand': 'hands_texture',
                   'TorsoUpper': 'upper_torso_texture', 'TorsoLower': 'lower_torso_texture',
                   'LegUpper': 'upper_leg_texture', 'LegLower': 'lower_leg_texture', 'Foot': 'foot_texture'}
IDI_COLS = ['left_model', 'right_model', 'left_model_texture', 'right_model_texture', 'icon_1', 'icon_2',
            'geoset_group_1', 'geoset_group_2', 'geoset_group_3', 'flags', 'spell_visual_id', 'group_sound_index',
            'helmet_geoset_male', 'helmet_geoset_female'] + list(IDI_REGION_COLS.values()) + ['item_visual', 'particle_colour_id']
# ChrRaces.client_prefix for helm file suffixes (<name>_<Prefix><M|F>.m2)
RACE_PREFIX = {1: 'Hu', 2: 'Or', 3: 'Dw', 4: 'Ni', 5: 'Sc', 6: 'Ta', 7: 'Gn', 8: 'Tr', 10: 'Be', 11: 'Dr'}
OBJ_FOLDER = {'shoulders': 'Shoulder', 'helm': 'Head', 'weapon': 'Weapon', 'belt': 'Waist'}
# WXL equip extension (Morfium-G, F-195): a collection M2 is shared by several slots and filtered
# by geoset. Geoset groups a slot may show, matched against the collection's own geosets.
COLLECTION_GROUPS = {'chest': (22, 27), 'gloves': (4, 23), 'boots': (5, 20), 'legs': (13,), 'shirt': (), 'tabard': ()}
ICON2_COLLECTION = '19::64'   # attach 19 Ground_Base, flag 0x40 retail Race_Gender file naming
ICON2_NO_SUFFIX = '::6'       # flags 0x2|0x4: file name takes neither race nor gender suffix
ITEM_TEMPLATE_COLS = ['class', 'subclass', 'SoundOverrideSubclass', 'Quality', 'Flags', 'BuyCount', 'BuyPrice',
                      'SellPrice', 'InventoryType', 'AllowableClass', 'AllowableRace', 'ItemLevel', 'RequiredLevel',
                      'maxcount', 'stackable', 'Material', 'sheath', 'delay', 'bonding', 'dmg_min1', 'dmg_max1']


def q(v) -> str:
    return "'" + str(v).replace("'", "''") + "'" if isinstance(v, str) else str(v)


def insert_set(table: str, key: str, row: Dict, comment: str = '', backtick: bool = True) -> str:
    t = (lambda c: f'`{c}`') if backtick else (lambda c: c)
    head = f'-- {comment}\n' if comment else ''
    body = ',\n'.join(f'  {t(k)} = {q(v)}' for k, v in row.items())
    return f'{head}DELETE FROM {t(table)} WHERE {t(key)} = {row[key]};\nINSERT INTO {t(table)} SET\n{body};\n'


@dataclass
class ImportedItem:
    retail: RetailItem
    display_id: int
    idi: Dict = field(default_factory=dict)                       # ItemDisplayInfo row
    layers: Dict[int, List[Tuple[str, str]]] = field(default_factory=dict)  # gender -> [(region, client path)]
    notes: List[str] = field(default_factory=list)


class WardrobeBuilder:
    def __init__(self, zpak: Path, retail: RetailData, external_roots: List[Path], dbc_query, stock_dbc_query,
                 world_query, harness: Path, echo=print):
        self.zpak = Path(zpak)
        self.assets = self.zpak / 'mpq' / 'source-assets'
        self.parsed = self.zpak / 'mpq' / 'parsed-assets'
        self.retail = retail
        # external = the client without this zpak (what already ships); resolver = what the bake sees
        self.external = FileResolver(external_roots)
        self.resolver = FileResolver([self.assets] + list(external_roots))
        self.dbc = dbc_query
        self.stock_dbc = stock_dbc_query
        self.world = world_query
        self.harness = harness
        self.echo = echo
        self.ids_path = self.zpak / 'wardrobe_ids.json'
        self.ids = json.loads(self.ids_path.read_text()) if self.ids_path.exists() else {'item_displays': {}}
        self.prov_path = self.zpak / 'asset_provenance.json'
        self.produced: Dict[str, Dict] = {}
        self._case: Dict[str, str] = {}
        self.items: Dict[Tuple[int, int], ImportedItem] = {}
        self.char_model: Dict[int, str] = {}   # gender -> our character model path, per manifest
        self._helm_shift_cache: Dict[int, Tuple[float, float, float]] = {}

    # -- files ----------------------------------------------------------------------
    def _write(self, client_path: str, data: bytes, prov: Dict) -> None:
        # MPQ paths are case-insensitive: reuse a path already produced with different casing
        # (a model's inlined hardcoded texture often names the same file as its ItemDisplayInfo row)
        client_path = self._case.setdefault(client_path.lower(), client_path)
        dst = self.assets / client_path
        dst.parent.mkdir(parents=True, exist_ok=True)
        if not dst.exists() or dst.read_bytes() != data:
            dst.write_bytes(data)
            self._drop_parsed(client_path)
            self.resolver.invalidate(self.assets)
        prov['sha256'] = hashlib.sha256(data).hexdigest()
        self.produced[client_path] = dict(path=client_path, **prov)

    def _drop_parsed(self, client_path: str) -> None:
        p = self.parsed / client_path.upper()
        if p.exists():
            p.unlink()

    def _client_file(self, client_path: str) -> Optional[str]:
        """A client path that already ships outside this zpak (stock / HD pack) - case-insensitive."""
        return self.external.find(client_path)

    # -- items ----------------------------------------------------------------------
    def _alloc_display(self, retail_display: int) -> int:
        reg = self.ids['item_displays']
        if str(retail_display) not in reg:
            reg[str(retail_display)] = max([ITEM_DISPLAY_BASE - 1] + list(reg.values())) + 1
        return reg[str(retail_display)]

    def import_item(self, item_id: int, mod: Optional[int], races: List[int]) -> ImportedItem:
        key = (int(item_id), -1 if mod is None else int(mod))
        if key in self.items:
            return self.items[key]
        it = self.retail.resolve_item(item_id, mod)
        imp = ImportedItem(retail=it, display_id=self._alloc_display(it.display_id))
        row = {c: ('' if c in ('left_model', 'right_model', 'left_model_texture', 'right_model_texture', 'icon_1', 'icon_2')
                   or c in IDI_REGION_COLS.values() else 0) for c in IDI_COLS}
        for i, g in enumerate(it.geosets[:3]):
            row[f'geoset_group_{i + 1}'] = max(0, g)
        # body texture components
        by_region = defaultdict(list)
        for t in it.textures:
            if t.race not in (0, *races):
                continue
            by_region[t.region].append(t)
        for region, texs in by_region.items():
            bases = set()
            for t in texs:
                name = t.path.split('/')[-1]
                client = f'Item\\TextureComponents\\{region}Texture\\{name}'
                self._write(client.replace('\\', '/'), self.retail.fetch(t.fdid).read_bytes(),
                            dict(fdid=t.fdid, build=self.retail.build, kind='copy'))
                bases.add(name.rsplit('_', 1)[0])
                for g in (0, 1):
                    if t.gender in (g, 3) and (t.race == 0 or t.race in races):
                        imp.layers.setdefault(g, []).append((region, client))
            if len(bases) != 1:
                raise ValueError(f'{it.name}: region {region} has several texture bases {bases}')
            row[IDI_REGION_COLS[region]] = bases.pop()
        # 3D parts
        if it.models:
            self._import_models(it, row, races, imp)
        if it.slot == 'cape':
            raise ValueError(f'{it.name}: capes are not supported yet')
        imp.idi = row
        self.items[key] = imp
        return imp

    def _import_models(self, it: RetailItem, row: Dict, races: List[int], imp: ImportedItem) -> None:
        folders = {(m.path or '?/?/?').split('/')[2].lower() for m in it.models if m.path}
        if 'collections' in folders:
            self._import_collection(it, row, races, imp)
            return
        if it.slot not in OBJ_FOLDER:
            imp.notes.append(f'3D part(s) not supported in 3.3.5, texture only: {", ".join(sorted(folders))}')
            return
        folder = OBJ_FOLDER[it.slot]
        tex = it.model_textures[0] if it.model_textures else None
        if tex:
            row['left_model_texture'] = self._ship_model_texture(tex, folder)
        if it.slot == 'shoulders':
            sides = {m.position: m for m in it.models}
            for pos, col in ((0, 'left_model'), (1, 'right_model')):
                if pos in sides:
                    name = self._convert(sides[pos], folder, sides[pos].path.split('/')[-1])
                    row[col] = name.rsplit('.', 1)[0] + '.mdx'
            # the right pad usually has its own texture (ModelMaterialResourcesID_1)
            right_tex = it.model_textures2[0] if it.model_textures2 else tex
            if right_tex:
                row['right_model_texture'] = self._ship_model_texture(right_tex, folder)
        elif it.slot in ('weapon', 'belt'):
            m = it.models[0]
            name = self._convert(m, folder, m.path.split('/')[-1])
            row['left_model'] = name.rsplit('.', 1)[0] + '.mdx'
            if it.slot == 'belt':
                # 3D belt buckle: needs the WXL equip extension (stock 3.3.5 has no waist model
                # slot). Default attach is 53 BeltBuckle; the file carries no race/gender suffix.
                row['icon_2'] = ICON2_NO_SUFFIX
                imp.notes.append('3D belt buckle: needs the WXL equip extension')
        elif it.slot == 'helm':
            base = None
            for m in it.models:
                if m.race in races and m.race in RACE_PREFIX and m.gender in (0, 1):
                    stem = m.path.split('/')[-1].rsplit('.', 1)[0]
                    base = stem.rsplit('_', 2)[0]
                    shift = self._helm_shift(m.gender)
                    self._convert(m, folder, f'{base}_{RACE_PREFIX[m.race]}{"MF"[m.gender]}.m2', shift=shift)
                    if shift:
                        imp.notes.append(f'helm {"MF"[m.gender]}: mesh shifted {tuple(round(v, 3) for v in shift)} '
                                         f'(our helmet attachment sits higher/further forward than retail\'s)')
            if not base:
                raise ValueError(f'{it.name}: no helm model for races {races}')
            row['left_model'] = base + '.mdx'
            imp.notes.append('helm: helmet geoset visibility left at 0 (hair shows) - check clipping')

    def _ship_model_texture(self, fdid: int, folder: str) -> str:
        name = self.retail.paths([fdid])[fdid].split('/')[-1]
        self._write(f'Item/ObjectComponents/{folder}/{name}', self.retail.fetch(fdid).read_bytes(),
                    dict(fdid=fdid, build=self.retail.build, kind='copy'))
        return name.rsplit('.', 1)[0]

    def _helm_shift(self, gender: int):
        """Retail authors a helm against retail's helmet attachment; ours sits elsewhere.

        Shift the mesh by (retail attachment - ours) so it lands on the head the same way.
        """
        if gender in self._helm_shift_cache:
            return self._helm_shift_cache[gender]
        shift = None
        path = self.char_model.get(gender)
        if path:
            ours_file = self._client_file(path.rsplit('.', 1)[0] + '.m2')
            fd = self.retail.fdid_for_path(path.replace('\\', '/').lower().rsplit('.', 1)[0] + '.m2')
            if ours_file and fd:
                ours = m2lib.attachment_pos(Path(ours_file), 11)
                theirs = m2lib.attachment_pos(self.retail.fetch(fd), 11)
                if ours and theirs:
                    delta = tuple(theirs[i] - ours[i] for i in range(3))
                    shift = delta if max(abs(v) for v in delta) > 0.005 else None
        self._helm_shift_cache[gender] = shift
        return shift

    def _import_collection(self, it: RetailItem, row: Dict, races: List[int], imp: ImportedItem) -> None:
        """Ship a retail collection M2 (per race/sex) and filter it to this slot's geosets."""
        groups = COLLECTION_GROUPS.get(it.slot)
        if not groups:
            imp.notes.append(f'collection mesh not mapped for slot {it.slot}, texture only')
            return
        base, geosets = None, set()
        for m in it.models:
            if m.race not in races or m.gender not in (0, 1) or not m.path or '/collections/' not in m.path:
                continue
            name = m.path.split('/')[-1]
            stem = name.rsplit('.', 1)[0]
            base = stem.rsplit('_', 2)[0]          # collections_..._or_m -> collections_...
            self._convert(m, 'Collections', name)
            skin = self.assets / f'Item/ObjectComponents/Collections/{stem}00.skin'
            geosets |= {g for g in m2lib.skin_geosets(skin) if g // 100 in groups}
        if not base:
            imp.notes.append(f'no collection model for races {races}, texture only')
            return
        if not geosets:
            imp.notes.append(f'collection has no geoset in groups {groups} for {it.slot}, texture only')
            return
        row['left_model'] = f'{base}.mdx:' + ','.join(str(g) for g in sorted(geosets))
        row['icon_2'] = ICON2_COLLECTION
        tex = it.model_textures[0] if it.model_textures else None
        if tex:
            tname = self.retail.paths([tex])[tex].split('/')[-1]
            self._write(f'Item/ObjectComponents/Collections/{tname}', self.retail.fetch(tex).read_bytes(),
                        dict(fdid=tex, build=self.retail.build, kind='copy'))
            row['left_model_texture'] = tname.rsplit('.', 1)[0]
        imp.notes.append(f'collection mesh geosets {sorted(geosets)}: needs the WXL equip extension')

    def _convert(self, m, folder: str, out_name: str, shift=None) -> str:
        src = self.retail.fetch(m.fdid)
        skins, txids = m2lib.modern_refs(src)
        fmap = {}
        for fd, path in self.retail.paths(txids).items():
            if not path:
                raise ValueError(f'{m.path}: hardcoded texture FDID {fd} not in listfile')
            client = path.replace('/', '\\')
            if not self._client_file(client):
                hit = self.external.find_basename(path.split('/')[-1], 'item\\objectcomponents')
                if hit:
                    client = hit
                else:
                    self._write(path, self.retail.fetch(fd).read_bytes(),
                                dict(fdid=fd, build=self.retail.build, kind='copy'))
            fmap[fd] = client.upper()
        stem = out_name.rsplit('.', 1)[0]
        work = self.retail.dir / 'out'
        work.mkdir(exist_ok=True)
        m2_tmp, skin_tmp = work / f'{stem}.m2', work / f'{stem}00.skin'
        m2lib.downport(self.harness, src, m2_tmp, fmap)
        shutil.copyfile(self.retail.fetch(skins[0]), skin_tmp)
        how = m2lib.classic_env_batches(m2_tmp, skin_tmp)
        kind = f'downport+{how}'
        if shift:
            transform_vertices(m2_tmp, *shift, backup=False)
            kind += f'+shift{tuple(round(v, 3) for v in shift)}'
        self._write(f'Item/ObjectComponents/{folder}/{stem}.m2', m2_tmp.read_bytes(),
                    dict(fdid=m.fdid, build=self.retail.build, kind=kind))
        self._write(f'Item/ObjectComponents/{folder}/{stem}00.skin', skin_tmp.read_bytes(),
                    dict(fdid=skins[0], build=self.retail.build, kind=kind))
        return out_name

    # -- appearances ------------------------------------------------------------------
    def appearance_pool(self, race: int, gender: int) -> List[Dict]:
        """Stock NPC appearances of this race/sex whose HD bake ships (known-good combos)."""
        rows = self.stock_dbc(f'SELECT id, skin_color, face_type, hair_style, hair_color, facial_hair '
                              f'FROM creaturedisplayinfoextra WHERE race = {race} AND gender = {gender} ORDER BY id')
        seen, pool = set(), []
        for r in rows:
            if not self._client_file(f'Textures\\BakedNpcTextures\\CreatureDisplayExtra-{int(r["id"]):05d}_HD.blp'):
                continue
            combo = tuple(int(r[k]) for k in ('skin_color', 'face_type', 'hair_style', 'hair_color', 'facial_hair'))
            if combo in seen:
                continue
            seen.add(combo)
            pool.append(dict(zip(('skin_color', 'face_type', 'hair_style', 'hair_color', 'facial_hair'), combo),
                             source_extra=int(r['id'])))
        return pool

    def _charsection(self, race, gender):
        cache = {}

        def get(base, typ, color):
            k = (base, typ, color)
            if k not in cache:
                rows = self.dbc(f'SELECT texture_1, texture_2, texture_3 FROM charsections WHERE race = {race} '
                                f'AND gender = {gender} AND base_section = {base} AND type = {typ} AND color_index = {color}')
                cache[k] = rows[0] if rows else None
            return cache[k]
        return get

    # -- manifests --------------------------------------------------------------------
    def build(self, manifests: List[Path]) -> Dict[str, Dict[str, str]]:
        """Build all manifests; returns {task: {relative file: content}} of SQL to write."""
        out = defaultdict(lambda: defaultdict(list))
        claimed, deferred = {}, []
        for mp in sorted(manifests):
            m = json.loads(mp.read_text())
            task, name, kind, race = m['task'], m['name'], m['kind'], int(m['race'])
            self.echo(f'\n== {name} ({kind}, {task})')
            outfit = m['outfit']
            self.char_model = {}
            for g, disp in m['base_display'].items():
                mid = self.dbc(f'SELECT model_id FROM creaturedisplayinfo WHERE id = {int(disp)}')[0]['model_id']
                self.char_model[int(g)] = self.dbc(f'SELECT model_path FROM creaturemodeldata WHERE id = {int(mid)}')[0]['model_path']
            self._helm_shift_cache = {}
            items = {}
            for slot, spec in outfit['items'].items():
                spec = spec if isinstance(spec, dict) else {'item': spec}
                imp = self.import_item(spec['item'], spec.get('mod'), [race])
                if imp.retail.slot != slot:
                    raise ValueError(f'{name}: item {spec["item"]} ({imp.retail.name}) is a {imp.retail.slot}, listed as {slot}')
                items[slot] = imp
                self.echo(f'   {slot:<10} {imp.retail.item_id} {imp.retail.name} -> ItemDisplayInfo {imp.display_id}'
                          + ''.join(f'\n              ! {n}' for n in imp.notes))
            variants = self._variants(m, race)
            ids = m['display_ids']
            if len(ids) < len(variants):
                raise ValueError(f'{name}: {len(variants)} variants but only {len(ids)} display_ids reserved')
            base = {int(k): int(v) for k, v in m['base_display'].items()}
            for idx, (did, v) in enumerate(zip(ids, variants)):
                if did in claimed:
                    raise ValueError(f'display {did} claimed by both {claimed[did]} and {name}')
                claimed[did] = name
                worn = {s: i for s, i in items.items() if s not in v.get('omit', [])}
                self._emit_variant(out[task], did, race, v, worn, base[v['gender']], name)
            self._emit_weapons(out[task], m)
            deferred.append((task, m, ids[:len(variants)]))
            for s, i in items.items():
                out[task]['idi'].append(i)
        for task, m, ids in deferred:
            self._emit_creatures(out[task], m, ids, claimed)
        return self._render(out)

    def _variants(self, m: Dict, race: int) -> List[Dict]:
        kind = m['kind']
        if kind == 'unique':
            if 'appearance' not in m:
                raise ValueError(f'{m["name"]}: unique manifests need "appearance"')
            return [dict(m['appearance'])]
        if kind != 'uniform':
            raise ValueError(f'{m["name"]}: kind must be unique or uniform')
        spec = m['variants']
        if isinstance(spec, list):
            vs = [dict(v) for v in spec]
        else:
            vs = []
            for g, n in sorted((int(k), int(v)) for k, v in spec['genders'].items()):
                pool = self.appearance_pool(race, g)
                if spec.get('skin_colors') is not None:
                    pool = [p for p in pool if p['skin_color'] in spec['skin_colors']]
                if len(pool) < n:
                    raise ValueError(f'{m["name"]}: only {len(pool)} stock appearances for race {race} gender {g}')
                step = len(pool) / n
                for i in range(n):
                    vs.append(dict(pool[int(i * step + step / 2)], gender=g))
            for i, v in enumerate(vs):
                if i % 2 == 1:
                    v['omit'] = list(spec.get('alternate', []))
        if len(vs) > MAX_VARIANTS:
            raise ValueError(f'{m["name"]}: {len(vs)} variants exceeds the cap of {MAX_VARIANTS}')
        return vs

    def _emit_variant(self, out, did, race, v, worn, base_display, name) -> None:
        g = int(v['gender'])
        layers = {s: [(r, p) for (r, p) in i.layers.get(g, [])] for s, i in worn.items() if s in BODY_SLOTS}
        img, log = compose(v, self._charsection(race, g), layers, self.resolver)
        bake = f'CreatureDisplayExtra-{did}_HD.blp'
        tmp = self.retail.dir / 'out' / bake
        tmp.parent.mkdir(exist_ok=True)
        write_blp_dxt(img, tmp)
        self._write(f'Textures/BakedNpcTextures/{bake}', tmp.read_bytes(), dict(kind='bake', display=did))
        extra = dict(id=did, race=race, gender=g, skin_color=v['skin_color'], face_type=v['face_type'],
                     hair_style=v['hair_style'], hair_color=v['hair_color'], facial_hair=v['facial_hair'])
        for slot, col in EXTRA_SLOT_COLS.items():
            extra[col] = worn[slot].display_id if slot in worn else 0
        extra.update(can_equip=0, texture=bake)
        src = f' from stock extra {v["source_extra"]}' if 'source_extra' in v else ''
        omit = f', without {"/".join(v["omit"])}' if v.get('omit') else ''
        out['extra'].append(insert_set('creaturedisplayinfoextra', 'id', extra,
                                       f'{name}: {"male" if g == 0 else "female"}{src}{omit}'))
        bd = self.dbc(f'SELECT * FROM creaturedisplayinfo WHERE id = {base_display}')[0]
        disp = dict(id=did, model_id=int(bd['model_id']), sound_id=int(bd['sound_id']), extended_display_info_id=did,
                    creature_model_scale=float(bd['creature_model_scale']), creature_model_alpha=int(bd['creature_model_alpha']),
                    texture_variation_1='', texture_variation_2='', texture_variation_3='', portrait_texture_name='',
                    blood_level=int(bd['blood_level']), blood_id=int(bd['blood_id']), npc_sound_id=int(bd['npc_sound_id']),
                    praticle_color_id=0, creature_geoset_data=0, obj_effect_package_id=0)
        out['display'].append(insert_set('creaturedisplayinfo', 'id', disp, f'{name}: model/sound of stock display {base_display}'))
        mi = self.world(f'SELECT BoundingRadius, CombatReach, Gender FROM creature_model_info WHERE DisplayID = {base_display}')
        if not mi:
            raise ValueError(f'stock display {base_display} has no creature_model_info')
        out['world_model_info'].append(insert_set('creature_model_info', 'DisplayID', dict(
            DisplayID=did, BoundingRadius=float(mi[0]['BoundingRadius']), CombatReach=float(mi[0]['CombatReach']),
            Gender=int(mi[0]['Gender']), DisplayID_Other_Gender=0, VerifiedBuild=0), backtick=False))
        geos = self._missing_geosets(int(bd['model_id']), worn)
        self.echo(f'   display {did}: {"M" if g == 0 else "F"} skin {v["skin_color"]} face {v["face_type"]} '
                  f'hair {v["hair_style"]}/{v["hair_color"]} fh {v["facial_hair"]}{omit}'
                  + (f'\n              ! model lacks geosets {geos}' if geos else ''))

    def _missing_geosets(self, model_id: int, worn) -> List[int]:
        path = self.dbc(f'SELECT model_path FROM creaturemodeldata WHERE id = {model_id}')[0]['model_path']
        skin = self._client_file(path.rsplit('.', 1)[0] + '00.skin')
        if not skin:
            return []
        have = set(m2lib.skin_geosets(Path(skin)))
        group = {'gloves': 4, 'boots': 5, 'chest': 8, 'legs': 9, 'tabard': 12, 'belt': 18}
        need = [group[s] * 100 + 1 + i.idi['geoset_group_1'] for s, i in worn.items()
                if s in group and i.idi['geoset_group_1'] > 0]
        return [n for n in need if n not in have]

    def _emit_weapons(self, out, m) -> None:
        for key, w in m.get('weapons', {}).items():
            imp = self.import_item(w['item'], w.get('mod'), [int(m['race'])])
            if imp.retail.slot != 'weapon':
                raise ValueError(f'weapon {key}: item {w["item"]} is a {imp.retail.slot}')
            if w.get('icon'):
                imp.idi['icon_1'] = w['icon']
            if 'sound_group' in w:
                imp.idi['group_sound_index'] = int(w['sound_group'])
            out['idi'].append(imp)
            tmpl = self.world(f'SELECT {", ".join(ITEM_TEMPLATE_COLS)} FROM item_template WHERE entry = {int(w["template_from"])}')
            if not tmpl:
                raise ValueError(f'weapon {key}: template_from {w["template_from"]} not in item_template')
            row = dict(entry=int(w['entry']), name=w['name'], displayid=imp.display_id)
            row.update({c: (float(tmpl[0][c]) if '.' in tmpl[0][c] else int(tmpl[0][c])) for c in ITEM_TEMPLATE_COLS})
            row['VerifiedBuild'] = 0
            out['world_items'].append(insert_set('item_template', 'entry', row,
                                                 f'{w["name"]}: retail {w["item"]}, stats of {w["template_from"]}', backtick=False))
            it = self.dbc(f'SELECT * FROM item WHERE id = {int(w["template_from"])}')[0]
            out['item'].append(insert_set('item', 'id', dict(
                id=int(w['entry']), **{'class': int(it['class'])}, subclass=int(it['subclass']),
                sound_override_subclass=int(it['sound_override_subclass']), material=int(it['material']),
                display_id=imp.display_id, inventory_type=int(it['inventory_type']), sheath=int(it['sheath'])),
                f'{w["name"]} (creature virtual items take their display from the client Item.dbc)'))
            self.echo(f'   weapon     {w["item"]} {imp.retail.name} -> item {w["entry"]}, ItemDisplayInfo {imp.display_id}')

    def _emit_creatures(self, out, m, displays, claimed) -> None:
        for c in m.get('creatures', []):
            e = int(c['entry'])
            if 'displays' in c:
                # explicit display ids, so one creature can mix outfits from several manifests
                chosen = [int(d) for d in c['displays']]
                unknown = [d for d in chosen if d not in claimed]
                if unknown:
                    raise ValueError(f'creature {e}: display(s) {unknown} are not built by any manifest')
            else:
                picks = c.get('variants', list(range(len(displays))))
                chosen = [displays[i] for i in picks]
            if len(chosen) > MAX_MODELS_PER_CREATURE:
                raise ValueError(f'creature {e}: {len(chosen)} displays, but a creature takes at most '
                                 f'{MAX_MODELS_PER_CREATURE} models (AC CHECK Idx <= 3)')
            sql = [f'-- creature {e}: whole model list owned by manifest {m["name"]} (stock rows replaced)',
                   f'DELETE FROM creature_template_model WHERE CreatureID = {e};']
            for i, d in enumerate(chosen):
                sql.append(f'INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) '
                           f'VALUES ({e}, {i}, {d}, 1, 1, 0);')
            eq = c.get('equip')
            if eq:
                weapons = {k: int(w['entry']) for k, w in m.get('weapons', {}).items()}
                cols = []
                for slot, col in (('main', 'ItemID1'), ('off', 'ItemID2'), ('ranged', 'ItemID3')):
                    if slot in eq:
                        v = eq[slot]
                        cols.append(f'{col} = {weapons[v] if isinstance(v, str) else int(v)}')
                have = self.world(f'SELECT ID FROM creature_equip_template WHERE CreatureID = {e} AND ID = {int(eq.get("id", 1))}')
                if not have:
                    raise ValueError(f'creature {e} has no creature_equip_template ID {eq.get("id", 1)}')
                sql.append(f'UPDATE creature_equip_template SET {", ".join(cols)} WHERE CreatureID = {e} AND ID = {int(eq.get("id", 1))};')
            out['world_creatures'].append('\n'.join(sql) + '\n')
            self.echo(f'   creature {e}: displays {chosen}' + (f', equip {eq}' if eq else ''))

    # -- render -----------------------------------------------------------------------
    def _render(self, out) -> Dict[str, Dict[str, str]]:
        files = {}
        hdr = '-- AUTO-GENERATED by `zep wardrobe build` from zpaks/{zp}/outfits/*.json - DO NOT EDIT\n\n'
        for task, parts in out.items():
            tag = f'[AUTO,{task}]'
            seen, idi = set(), []
            for imp in parts['idi']:
                if imp.display_id not in seen:
                    seen.add(imp.display_id)
                    idi.append(insert_set('itemdisplayinfo', 'id', dict(id=imp.display_id, **imp.idi),
                                          f'{imp.retail.name} (retail item {imp.retail.item_id}, display {imp.retail.display_id})'))
            h = hdr.format(zp=self.zpak.name)
            fs = {f'dbc/{tag}_itemdisplayinfo.sql': idi, f'dbc/{tag}_item.sql': parts['item'],
                  f'dbc/{tag}_creaturedisplayinfoextra.sql': parts['extra'], f'dbc/{tag}_creaturedisplayinfo.sql': parts['display'],
                  f'sql/zz_{tag}_wardrobe.sql': parts['world_items'] + parts['world_model_info'] + parts['world_creatures']}
            files[task] = {k: h + '\n'.join(v) for k, v in fs.items() if v}
        return files

    def finish(self) -> List[str]:
        """Persist id registry + provenance, remove files a previous build produced but this one did not."""
        removed = []
        if self.prov_path.exists():
            for a in json.loads(self.prov_path.read_text()).get('assets', []):
                if a['path'] not in self.produced:
                    p = self.assets / a['path']
                    if p.exists():
                        p.unlink()
                    self._drop_parsed(a['path'])
                    removed.append(a['path'])
        self.ids_path.write_text(json.dumps(self.ids, indent=1, sort_keys=True) + '\n')
        self.prov_path.write_text(json.dumps({
            'generator': 'zep wardrobe build (F-198)',
            'source': 'wago.tools CASC by FDID (https://wago.tools/api/casc/<fdid>?version=<build>)',
            'downport': 'cli/lib/wardrobe/downport_harness.cpp + m2.classic_env_batches',
            'assets': [self.produced[k] for k in sorted(self.produced)]}, indent=1) + '\n')
        return removed
