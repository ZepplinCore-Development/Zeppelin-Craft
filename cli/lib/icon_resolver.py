"""
Resolve a modern (Cata/BFA) IconFileDataID to a 3.3.5a ItemDisplayInfo displayid by
pulling icon names straight from the client data -- never hand-picked.

Chain:
    IconFileDataID  --(client listfile)-->  icon basename  --(ItemDisplayInfo.icon_1)-->  displayid

- The client listfile (FileDataID -> path) is the only source that knows modern icon
  FDIDs; the 3.3.5a `filedata` DBC table uses WotLK FDIDs and cannot resolve them.
- ItemDisplayInfo.icon_1 holds the inventory-icon basename; many display rows share one
  icon, so we take the lowest id deterministically. For non-equippable items only the
  icon renders, so any row with the matching icon is correct.

resolve() returns 0 when the icon cannot be resolved (caller defers, same as a missing
icon) and records the reason in `.unresolved` so the migrator can report coverage.
"""
import csv
import os
from pathlib import Path

# cli/lib/icon_resolver.py -> Craft root is parents[2]
CRAFT_ROOT = Path(__file__).resolve().parents[2]
# Client asset listfile (modern FileDataID -> path). Zeppelin-Tools is not git-tracked,
# so allow an override via ZEP_LISTFILE for other environments.
DEFAULT_LISTFILE = (CRAFT_ROOT.parent / "Zeppelin-Tools" / "Retroport"
                    / "retroport_tools" / "MultiConverter2" / "listfile.csv")
DEFAULT_ENV = CRAFT_ROOT / "cli" / ".env"   # holds DBC_HOST/PORT/USER/PASS


class IconResolver:
    def __init__(self, listfile_path=None, dbc_config=None, env_path=None):
        self.listfile_path = Path(listfile_path or os.getenv("ZEP_LISTFILE", DEFAULT_LISTFILE))
        self.env_path = Path(env_path or DEFAULT_ENV)
        self._dbc_config = dbc_config
        self._fdid_to_icon = None      # {fdid: icon_basename_lower}
        self._icon_to_display = None   # {icon_basename_lower: displayid}
        self.unresolved = []           # [(fdid, reason)]

    # --- client listfile: FileDataID -> icon basename ---
    def _load_listfile(self):
        m = {}
        if not self.listfile_path.exists():
            raise FileNotFoundError(
                "Client listfile not found: %s (set ZEP_LISTFILE)" % self.listfile_path)
        with open(self.listfile_path, encoding="utf-8", errors="replace") as f:
            for line in f:
                parts = line.rstrip("\n").split(";", 1)
                if len(parts) != 2:
                    continue
                try:
                    fdid = int(parts[0])
                except ValueError:
                    continue
                path = parts[1].strip().lower()
                if "/icons/" not in path:      # only inventory icons
                    continue
                m[fdid] = os.path.splitext(os.path.basename(path))[0]
        return m

    # --- client ItemDisplayInfo DBC: icon basename -> displayid ---
    def _load_displays(self):
        from lib.dbc_utils import DBCConfig, DBCConnection
        cfg = self._dbc_config or DBCConfig.from_env(self.env_path)
        m = {}
        with DBCConnection(cfg) as db:
            cur = db.get_connection(cfg.live).cursor()
            # ORDER BY id so the first-seen (lowest) id wins deterministically
            cur.execute("SELECT id, icon_1 FROM itemdisplayinfo "
                        "WHERE icon_1 IS NOT NULL AND icon_1 <> '' ORDER BY id")
            for did, icon in cur.fetchall():
                key = (icon or "").strip().lower()
                if key and key not in m:
                    m[key] = did
            cur.close()
        return m

    def resolve(self, icon_fdid):
        """Return a 3.3.5a displayid for the given modern IconFileDataID, or 0."""
        try:
            icon_fdid = int(icon_fdid)
        except (TypeError, ValueError):
            return 0
        if not icon_fdid:
            return 0
        if self._fdid_to_icon is None:
            self._fdid_to_icon = self._load_listfile()
        base = self._fdid_to_icon.get(icon_fdid)
        if not base:
            self.unresolved.append((icon_fdid, "FDID not in client listfile"))
            return 0
        if self._icon_to_display is None:
            self._icon_to_display = self._load_displays()
        did = self._icon_to_display.get(base)
        if not did:
            self.unresolved.append((icon_fdid, "icon '%s' has no ItemDisplayInfo row" % base))
            return 0
        return did
