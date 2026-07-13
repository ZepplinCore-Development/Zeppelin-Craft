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

    Runs Zeppelin-Tools/WarcraftXL/build.sh (llvm-mingw cross-compile, no wine) to produce
    WarcraftXL.dll, d3d9.dll, WarcraftXLHost.exe, wxl-patcher.exe in build-output/.
    """
    if not os.path.isfile(_WXL_BUILD_SH):
        raise click.ClickException("build.sh not found: %s" % _WXL_BUILD_SH)
    click.echo("Building WarcraftXL binaries (llvm-mingw cross-compile)...")
    rc = subprocess.call(["bash", _WXL_BUILD_SH])
    if rc != 0:
        raise click.ClickException("build.sh failed (exit %d)" % rc)
    click.echo("Build complete: %s" % _WXL_BUILD_OUT)
    if ship_after:
        _run_ship(activate=activate, mandatory=False)


@wxl.command("ship")
@click.option("--activate", is_flag=True,
              help="Register the bundle in patch_register.json — the launcher then pushes it to players. "
                   "Default: stage only (copy to WXL/, print the entry, no push).")
@click.option("--mandatory", is_flag=True,
              help="With --activate: mark the bundle mandatory + enabled-by-default (default: opt-in).")
def ship(activate, mandatory):
    """Stage the built WarcraftXL binaries to the launcher; --activate to push to players.

    Wraps Scripts/deploy_warcraftxl.py. Staging copies build-output/ into nginx/wow/WXL/ and prints the
    register entry it WOULD write. --activate writes it (content-derived version bump), which makes the
    live launcher distribute the framework — a deliberate rollout step.
    """
    _run_ship(activate=activate, mandatory=mandatory)


def _run_ship(activate: bool, mandatory: bool):
    if not os.path.isfile(_WXL_DEPLOY_PY):
        raise click.ClickException("deploy script not found: %s" % _WXL_DEPLOY_PY)
    cmd = ["python3", _WXL_DEPLOY_PY]
    if activate:
        cmd.append("--activate")
    if mandatory:
        cmd.append("--mandatory")
    rc = subprocess.call(cmd)
    if rc != 0:
        raise click.ClickException("deploy_warcraftxl.py failed (exit %d)" % rc)
