"""zep wxl — WarcraftXL modern-asset pipeline for zpaks (F-197).

`acquire` pulls a modern (Legion+) M2 and its full sub-file closure (skins/anims/
textures) from wago.tools by FileDataID, resolves every reference to its native path
via the community listfile, and lays the files out at those paths under a zpak's
`mpq/wxl-assets/` folder. The model stays modern MD21 — WarcraftXL downports it at
load time; we only resolve *references* to paths at build time (never a downport).

Skins land at `<model>00.skin` and anims at `<model><animId>-<sub>.anim` — exactly the
paths the 3.3.5a client derives — so they load by convention with no runtime FDID
resolution. Textures (the M2 `TXID`) are the one FDID touchpoint, shipped at their
sibling path. See F-197.
"""
import os
import struct
import subprocess
import urllib.request

import click

# Default wago build (wow_classic/retail 'wowt'); override with --build. Latest ids:
# https://wago.tools/api/builds
DEFAULT_BUILD = "12.1.0.68629"
_TOOLS = os.getenv("ZEP_TOOLS", "/workspace/project/Zeppelin-Tools")
DEFAULT_LISTFILE = os.getenv(
    "WXL_LISTFILE",
    os.path.join(_TOOLS, "Retroport", "retroport_tools", "MultiConverter2", "listfile.csv"))
_CRAFT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ZPAKS_DIR = os.path.join(_CRAFT, "zpaks")


def _load_listfile(path):
    """Community listfile -> {fdid: path} and {path_lower: fdid}."""
    fwd, rev = {}, {}
    with open(path, encoding="utf-8", errors="ignore") as f:
        for line in f:
            if ";" not in line:
                continue
            a, b = line.rstrip("\n").split(";", 1)
            if a.isdigit():
                fid = int(a)
                fwd[fid] = b
                rev[b.lower()] = fid
    return fwd, rev


def _wago_url(fdid, build):
    return "https://wago.tools/api/casc/%d?version=%s" % (fdid, build)


def _download(fdid, build):
    req = urllib.request.Request(_wago_url(fdid, build), headers={"User-Agent": "zep-wxl/1.0"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return r.read()


def _chunks(data):
    """Walk top-level M2 (MD21) chunks -> {magic: (data_offset, size)}."""
    out, i = {}, 0
    while i + 8 <= len(data):
        mag = data[i:i + 4].decode("ascii", "replace")
        sz = struct.unpack_from("<I", data, i + 4)[0]
        out[mag] = (i + 8, sz)
        i += 8 + sz
        if sz == 0 or sz > len(data):
            break
    return out


def _closure_fdids(m2):
    """FileDataIDs the M2 references: SFID/TXID/BFID/SKID/PFID (u32 arrays) + AFID
    ({u16 animId, u16 subId, u32 fileId})."""
    ch = _chunks(m2)
    fdids = set()

    def u32(mag):
        if mag not in ch:
            return []
        o, s = ch[mag]
        return list(struct.unpack_from("<%dI" % (s // 4), m2, o))

    for mag in ("SFID", "TXID", "BFID", "SKID", "PFID", "RPID"):
        fdids |= {x for x in u32(mag) if x}
    af = u32("AFID")
    fdids |= {af[k] for k in range(1, len(af), 2) if af[k]}   # every 2nd word is the file id
    return fdids


@click.group()
def wxl():
    """WarcraftXL modern-asset pipeline (F-197)."""


@wxl.command("acquire")
@click.argument("target")
@click.option("--zpak", "zpak", required=True, help="Destination zpak name.")
@click.option("--build", default=DEFAULT_BUILD, show_default=True, help="wago build id.")
@click.option("--listfile", default=DEFAULT_LISTFILE, show_default=True)
@click.option("--force", is_flag=True, help="Re-download files that already exist.")
def acquire(target, zpak, build, listfile, force):
    """Pull a modern M2 + its sub-file closure into <zpak>/mpq/wxl-assets/ at native paths.

    TARGET is a FileDataID or a listfile path (e.g. character/foresttroll/male/foresttrollmale.m2).
    """
    fwd, rev = _load_listfile(listfile)
    if target.isdigit():
        root = int(target)
    else:
        root = rev.get(target.lower().replace("\\", "/"))
        if not root:
            raise click.ClickException("path not in listfile: %s" % target)
    root_path = fwd.get(root)
    if not root_path or not root_path.lower().endswith(".m2"):
        raise click.ClickException("FDID %d is not an .m2 in the listfile (%s)" % (root, root_path))

    out_root = os.path.join(ZPAKS_DIR, zpak, "mpq", "wxl-assets")
    if not os.path.isdir(os.path.join(ZPAKS_DIR, zpak)):
        raise click.ClickException("zpak not found: %s" % zpak)

    click.echo("Root M2: FDID %d -> %s" % (root, root_path))
    m2 = _download(root, build)
    if m2[:4] not in (b"MD21", b"MD20"):
        raise click.ClickException("downloaded FDID %d is not an M2 (magic %r)" % (root, m2[:4]))

    fdids = {root} | _closure_fdids(m2)
    click.echo("Sub-file closure: %d files (skins/anims/textures/bones)" % (len(fdids) - 1))

    unresolved, written, skipped, cached = [], 0, 0, {root: m2}
    for fid in sorted(fdids):
        path = fwd.get(fid)
        if not path:
            unresolved.append(fid)
            continue
        dst = os.path.join(out_root, path.replace("/", os.sep))
        if os.path.exists(dst) and not force:
            skipped += 1
            continue
        data = cached.get(fid) or _download(fid, build)
        os.makedirs(os.path.dirname(dst), exist_ok=True)
        with open(dst, "wb") as f:
            f.write(data)
        written += 1
        if written % 10 == 0:
            click.echo("  ... %d/%d" % (written + skipped, len(fdids)))

    click.echo("\nWrote %d, skipped %d (existing) into %s" % (written, skipped, os.path.relpath(out_root, _CRAFT)))
    if unresolved:
        click.echo("WARNING %d FDIDs not in the listfile (bespoke assets — would need the DB2 fallback): %s"
                   % (len(unresolved), unresolved[:10]), err=True)
    click.echo("\nDisplay repoint: set creaturemodeldata.model_path = '%s'"
               % root_path.replace("/", "\\"))


# WarcraftXL framework binaries (F-195): cross-compiled from Linux (llvm-mingw, no wine) and shipped to
# the launcher's WXL/ endpoint. These wrap the canonical scripts so the register/version logic stays in
# one place: build.sh (compile) and Scripts/deploy_warcraftxl.py (stage + activate).
_WXL_BUILD_SH = os.path.join(_TOOLS, "WarcraftXL", "build.sh")
_WXL_BUILD_OUT = os.path.join(_TOOLS, "WarcraftXL", "build-output")
_WXL_DEPLOY_PY = os.path.join(_CRAFT, "Scripts", "deploy_warcraftxl.py")


@wxl.command("build")
@click.option("--ship", "ship_after", is_flag=True,
              help="After a successful build, stage to the launcher (equivalent to `zep wxl ship`).")
@click.option("--activate", is_flag=True,
              help="With --ship: register the bundle (pushes to players via the launcher).")
def build(ship_after, activate):
    """Cross-compile the WarcraftXL client binaries (F-195).

    Runs Zeppelin-Tools/WarcraftXL/build.sh (llvm-mingw cross-compile, no wine) on WarcraftXL v1.1 to
    produce WarcraftXL.dll, d3d9.dll, wxl-patcher.exe and Extensions/<Name>/<Name>.dll in build-output/.
    """
    if not os.path.isfile(_WXL_BUILD_SH):
        raise click.ClickException("build.sh not found: %s" % _WXL_BUILD_SH)
    click.echo("Building WarcraftXL binaries (llvm-mingw cross-compile)...")
    rc = subprocess.call(["bash", _WXL_BUILD_SH])
    if rc != 0:
        raise click.ClickException("build.sh failed (exit %d)" % rc)
    click.echo("Build complete: %s" % _WXL_BUILD_OUT)
    if ship_after:
        _run_ship(activate=activate)


@wxl.command("ship")
@click.option("--activate", is_flag=True,
              help="Register the bundle in patch_register.json — the launcher then pushes it to players. "
                   "Default: stage only (copy to WXL/, print the entry, no push).")
def ship(activate):
    """Stage the built WarcraftXL binaries to the launcher; --activate to push to players.

    Wraps Scripts/deploy_warcraftxl.py. Staging copies build-output/ into nginx/wow/WXL/ (extensions
    also into MPQ/, for launchers built before v1.1) and prints the register entry it WOULD write.
    WXL/ is what the live register points at, so staging a new build changes what a fresh download
    gets even before --activate. --activate writes it (5-hex-digit content-hash version), which makes the
    live launcher distribute the framework — a deliberate rollout step.
    """
    _run_ship(activate=activate)


def _run_ship(activate: bool):
    if not os.path.isfile(_WXL_DEPLOY_PY):
        raise click.ClickException("deploy script not found: %s" % _WXL_DEPLOY_PY)
    cmd = ["python3", _WXL_DEPLOY_PY]
    if activate:
        cmd.append("--activate")
    rc = subprocess.call(cmd)
    if rc != 0:
        raise click.ClickException("deploy_warcraftxl.py failed (exit %d)" % rc)

    from commands.client import refresh_if_present
    refresh_if_present()   # F-219: staging rewrote nginx/wow/WXL; keep the test client on it


# FileDataID -> path table for the source-built client (F-223 ZepModernM2). A modern MD21 model names
# its hardcoded textures by FileDataID (TXID chunk); ZepModernM2 resolves them through
# Zeppelin\FileDataPaths.txt ("fdid;path" lines) read from the archive set. The table is generated
# from what the patches actually ship, so it never names a texture the client cannot open.
FDID_TABLE_ZPAK = "zep-models"
FDID_TABLE_PATH = ("Zeppelin", "FileDataPaths.txt")


def _shipped_assets():
    """Enabled mpq/hybrid zpaks -> ({normalised path: file}, [(zpak, file) of every .m2])."""
    import json
    from pathlib import Path
    from lib import model_sources as ms

    assets, models = {}, []
    for d in sorted(Path(ZPAKS_DIR).iterdir()):
        man_path = d / "zpak.json"
        if not man_path.is_file():
            continue
        try:
            man = json.loads(man_path.read_text())
        except ValueError:
            continue
        if not man.get("enabled", True) or man.get("type") not in ("mpq", "hybrid"):
            continue
        for sub in ("parsed-assets", "wxl-assets"):
            for k, f in ms.list_files(d / "mpq" / sub).items():
                assets.setdefault(k, f)
                if k.endswith(".m2"):
                    models.append((d.name, f))
    return assets, models


def _txid(path):
    with open(path, "rb") as fh:
        head = fh.read(8)
        if head[:4] != b"MD21":
            return None
        data = head + fh.read()
    ch = _chunks(data)
    if "TXID" not in ch:
        return []
    o, s = ch["TXID"]
    return [x for x in struct.unpack_from("<%dI" % (s // 4), data, o) if x]


@wxl.command("fdid-table")
@click.option("--check", is_flag=True, help="Report only; exit non-zero when the table is stale or a texture is missing.")
def fdid_table(check):
    """Generate Zeppelin\\FileDataPaths.txt for the source-built client (F-223).

    Scans every enabled mpq/hybrid zpak (parsed-assets and wxl-assets) for MD21 models, resolves each
    TXID texture FileDataID through the community listfile, checks the texture ships (a zpak or the
    stock client), and writes the sorted table into zep-models (PATCH-Z) source- and parsed-assets.
    """
    from pathlib import Path
    from lib import model_sources as ms
    from lib import retail

    assets, models = _shipped_assets()
    _, by_id = retail.listfile()
    rows, missing, unresolved, md21 = {}, [], [], 0

    for zpak, f in models:
        fdids = _txid(f)
        if fdids is None:
            continue
        md21 += 1
        for fdid in fdids:
            path = by_id.get(fdid)
            if not path:
                unresolved.append((zpak, f.name, fdid))
                continue
            key = ms.norm(path)
            if key not in assets and not ms.stock_asset(key):
                missing.append((zpak, f.name, fdid, path))
                continue
            rows[fdid] = path.replace("/", "\\")

    text = "# F-223: FileDataID -> path for ZepModernM2. Generated by `zep wxl fdid-table`; do not edit.\n"
    text += "".join("%d;%s\n" % (k, rows[k]) for k in sorted(rows))

    click.echo("%d MD21 model(s) shipped, %d texture FileDataID(s) resolved" % (md21, len(rows)))
    for zpak, name, fdid in unresolved:
        click.echo("  UNRESOLVED %s %s: TXID %d is not in the listfile" % (zpak, name, fdid), err=True)
    for zpak, name, fdid, path in missing:
        click.echo("  MISSING %s %s: TXID %d -> %s does not ship" % (zpak, name, fdid, path), err=True)

    zp = Path(ZPAKS_DIR) / FDID_TABLE_ZPAK / "mpq"
    targets = [zp / "source-assets" / Path(*FDID_TABLE_PATH),
               zp / "parsed-assets" / Path(*(p.upper() for p in FDID_TABLE_PATH))]
    stale = [t for t in targets if not t.is_file() or t.read_text() != text]

    if check:
        if stale:
            click.echo("STALE: %s" % ", ".join(str(t.relative_to(_CRAFT)) for t in stale), err=True)
        if stale or missing or unresolved:
            raise SystemExit(1)
        click.echo("up to date")
        return

    for t in stale:
        t.parent.mkdir(parents=True, exist_ok=True)
        t.write_text(text)
        click.echo("wrote %s" % t.relative_to(_CRAFT))
    if not stale:
        click.echo("table unchanged")
