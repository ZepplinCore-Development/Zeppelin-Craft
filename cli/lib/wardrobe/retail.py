"""
Retail (modern client) item data for the wardrobe pipeline.

Item -> ItemModifiedAppearance -> ItemAppearance -> ItemDisplayInfo, then
ItemDisplayInfoMaterialRes / ModelFileData -> TextureFileData, with
ComponentModelFileData / ComponentTextureFileData for race, gender and side.
Tables come from wago.tools DB2 CSV exports and files from wago.tools CASC,
both cached on disk per build.
"""

import csv
import subprocess
from collections import defaultdict
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional

TABLES = ['ItemModifiedAppearance', 'ItemAppearance', 'ItemDisplayInfo', 'ItemDisplayInfoMaterialRes',
          'TextureFileData', 'ModelFileData', 'ComponentModelFileData', 'ComponentTextureFileData',
          'ItemSearchName', 'Item']

# ItemDisplayInfoMaterialRes.ComponentSection -> 3.3.5 region
SECTION_REGION = {0: 'ArmUpper', 1: 'ArmLower', 2: 'Hand', 3: 'TorsoUpper', 4: 'TorsoLower',
                  5: 'LegUpper', 6: 'LegLower', 7: 'Foot'}

# retail InventoryType -> wardrobe slot
INVTYPE_SLOT = {1: 'helm', 3: 'shoulders', 4: 'shirt', 5: 'chest', 20: 'chest', 6: 'belt', 7: 'legs',
                8: 'boots', 9: 'wrists', 10: 'gloves', 16: 'cape', 19: 'tabard',
                13: 'weapon', 17: 'weapon', 21: 'weapon', 22: 'weapon', 14: 'weapon', 15: 'weapon',
                23: 'weapon', 25: 'weapon', 26: 'weapon'}


@dataclass
class ModelFile:
    fdid: int
    path: Optional[str]
    race: int = 0
    gender: int = 2           # 0 male, 1 female, 2/3 any
    position: int = -1        # shoulders: 0 left, 1 right


@dataclass
class TextureFile:
    fdid: int
    path: Optional[str]
    region: str
    race: int = 0
    gender: int = 3           # 0 male, 1 female, 3 unisex


@dataclass
class RetailItem:
    item_id: int
    name: str
    inventory_type: int
    appearance_mod: int
    display_id: int
    slot: str
    geosets: List[int]
    models: List[ModelFile] = field(default_factory=list)        # ModelResourcesID_0
    model_textures: List[int] = field(default_factory=list)      # ModelMaterialResourcesID_0 FDIDs
    models2: List[ModelFile] = field(default_factory=list)       # ModelResourcesID_1
    model_textures2: List[int] = field(default_factory=list)
    textures: List[TextureFile] = field(default_factory=list)


class RetailData:
    """Lazy DB2 tables + listfile + CASC download cache for one retail build."""

    def __init__(self, cache_root: Path, build: str, listfile: Path):
        self.build = build
        self.dir = Path(cache_root) / build
        (self.dir / 'db2').mkdir(parents=True, exist_ok=True)
        (self.dir / 'casc').mkdir(parents=True, exist_ok=True)
        self.listfile_path = listfile
        self._rows: Dict[str, list] = {}
        self._paths: Dict[int, str] = {}

    # -- tables -----------------------------------------------------------------
    def table(self, name: str) -> list:
        if name not in self._rows:
            p = self.dir / 'db2' / f'{name}.csv'
            if not p.exists() or p.stat().st_size == 0:
                url = f'https://wago.tools/db2/{name}/csv?build={self.build}'
                subprocess.run(['curl', '-s', '-f', '-m', '600', '-o', str(p), url], check=True)
            with open(p, newline='', encoding='utf-8') as f:
                self._rows[name] = list(csv.DictReader(f))
        return self._rows[name]

    def paths(self, fdids) -> Dict[int, str]:
        """FDID -> retail path via the community listfile (scanned once per call set)."""
        need = {int(f) for f in fdids} - set(self._paths)
        if need:
            with open(self.listfile_path, encoding='utf-8', errors='replace') as f:
                for line in f:
                    a, _, b = line.rstrip('\n').partition(';')
                    if a.isdigit() and int(a) in need:
                        self._paths[int(a)] = b
        return {int(f): self._paths.get(int(f)) for f in fdids}

    def fdid_for_path(self, path: str) -> Optional[int]:
        """Reverse listfile lookup (retail path -> FileDataID)."""
        want = path.replace('\\', '/').lower()
        if not hasattr(self, '_rev'):
            self._rev = {}
        if want not in self._rev:
            with open(self.listfile_path, encoding='utf-8', errors='replace') as f:
                for line in f:
                    a, _, b = line.rstrip('\n').partition(';')
                    if b.lower() == want and a.isdigit():
                        self._rev[want] = int(a)
                        break
                else:
                    self._rev[want] = None
        return self._rev[want]

    def fetch(self, fdid: int) -> Path:
        """Download one CASC file by FDID (cached)."""
        p = self.dir / 'casc' / str(fdid)
        if not p.exists() or p.stat().st_size == 0:
            url = f'https://wago.tools/api/casc/{fdid}?version={self.build}'
            subprocess.run(['curl', '-s', '-f', '-m', '300', '-o', str(p), url], check=True)
        return p

    # -- items ------------------------------------------------------------------
    def resolve_item(self, item_id: int, appearance_mod: Optional[int] = None) -> RetailItem:
        item_id = str(item_id)
        imas = [r for r in self.table('ItemModifiedAppearance') if r['ItemID'] == item_id]
        if not imas:
            raise ValueError(f'retail item {item_id} has no ItemModifiedAppearance')
        mods = sorted(int(r['ItemAppearanceModifierID']) for r in imas)
        want = mods[0] if appearance_mod is None else int(appearance_mod)
        ima = next((r for r in imas if int(r['ItemAppearanceModifierID']) == want), None)
        if ima is None:
            raise ValueError(f'retail item {item_id}: no appearance modifier {want} (has {mods})')
        ia = self._by_id('ItemAppearance')[ima['ItemAppearanceID']]
        d = self._by_id('ItemDisplayInfo')[ia['ItemDisplayInfoID']]
        inv = int(self._by_id('Item').get(item_id, {}).get('InventoryType', 0))
        name = self._by_id('ItemSearchName').get(item_id, {}).get('Display_lang', f'item {item_id}')
        slot = INVTYPE_SLOT.get(inv)
        if slot is None:
            raise ValueError(f'retail item {item_id} ({name}): unsupported inventory type {inv}')
        it = RetailItem(item_id=int(item_id), name=name, inventory_type=inv, appearance_mod=want,
                        display_id=int(d['ID']), slot=slot,
                        geosets=[int(d[f'GeosetGroup_{i}']) for i in range(6)])
        mfd, tfd = self._model_files(), self._texture_files()
        cm, ct = self._by_int('ComponentModelFileData'), self._by_int('ComponentTextureFileData')
        for k, (models, texs) in enumerate(((it.models, it.model_textures), (it.models2, it.model_textures2))):
            for f in mfd.get(d[f'ModelResourcesID_{k}'], []) if d[f'ModelResourcesID_{k}'] != '0' else []:
                c = cm.get(f, {})
                models.append(ModelFile(fdid=f, path=None, race=int(c.get('RaceID', 0)),
                                        gender=int(c.get('GenderIndex', 2)), position=int(c.get('PositionIndex', -1))))
            if d[f'ModelMaterialResourcesID_{k}'] != '0':
                texs.extend(tfd.get(d[f'ModelMaterialResourcesID_{k}'], []))
        for mr in self._matres().get(d['ID'], []):
            for f in tfd.get(mr['MaterialResourcesID'], []):
                c = ct.get(f, {})
                it.textures.append(TextureFile(fdid=f, path=None, region=SECTION_REGION[int(mr['ComponentSection'])],
                                               race=int(c.get('RaceID', 0)), gender=int(c.get('GenderIndex', 3))))
        names = self.paths([m.fdid for m in it.models + it.models2] + it.model_textures + it.model_textures2
                           + [t.fdid for t in it.textures])
        for m in it.models + it.models2:
            m.path = names[m.fdid]
        for t in it.textures:
            t.path = names[t.fdid]
        return it

    # -- indexes ----------------------------------------------------------------
    def _by_id(self, name):
        key = f'_idx_{name}'
        if not hasattr(self, key):
            setattr(self, key, {r['ID']: r for r in self.table(name)})
        return getattr(self, key)

    def _by_int(self, name):
        key = f'_int_{name}'
        if not hasattr(self, key):
            setattr(self, key, {int(r['ID']): r for r in self.table(name)})
        return getattr(self, key)

    def _model_files(self):
        if not hasattr(self, '_mfd'):
            self._mfd = defaultdict(list)
            for r in self.table('ModelFileData'):
                self._mfd[r['ModelResourcesID']].append(int(r['FileDataID']))
        return self._mfd

    def _texture_files(self):
        if not hasattr(self, '_tfd'):
            self._tfd = defaultdict(list)
            for r in self.table('TextureFileData'):
                self._tfd[r['MaterialResourcesID']].append(int(r['FileDataID']))
        return self._tfd

    def _matres(self):
        if not hasattr(self, '_mr'):
            self._mr = defaultdict(list)
            for r in self.table('ItemDisplayInfoMaterialRes'):
                self._mr[r['ItemDisplayInfoID']].append(r)
        return self._mr
