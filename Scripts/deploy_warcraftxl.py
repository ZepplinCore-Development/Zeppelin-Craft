#!/usr/bin/env python3
"""
F-195: stage + register the WarcraftXL client framework for launcher distribution.

Ships three binaries to the launcher's WXL/ endpoint (nginx/wow/WXL/), placed client-side next to
Wow.exe (the host under Utils/) by the launcher's WXL routing:
  - d3d9.dll            the D3D9On12 proxy + framework load vector (client loads it ahead of system32)
  - WarcraftXL.dll      the framework itself (bootstrapped by the proxy)
  - WarcraftXLHost.exe  the 64-bit asset host (Utils/)
wxl-patcher.exe is a build-time tool and is NOT shipped.

STAGING (default) copies the files to nginx/wow/WXL/ and prints the register entries it WOULD add.
ACTIVATION (--activate) writes those entries into patch_register.json — this makes the live launcher
push the framework (and the D3D9On12 proxy) to every player, so it is a deliberate rollout step.
"""
import argparse
import hashlib
import json
import shutil
from datetime import datetime, timezone
from pathlib import Path

BUILD_OUTPUT = Path("/workspace/project/Zeppelin-Tools/WarcraftXL/build-output")
NGINX_WOW = Path("/workspace/project/nginx/wow")
REGISTER = NGINX_WOW / "patch_register.json"

# filename -> register metadata (name/description). Order = launcher display order.
SHIP = {
    "d3d9.dll":           "WarcraftXL D3D9On12 proxy + framework load vector",
    "WarcraftXL.dll":     "WarcraftXL client modding framework (F-195)",
    "WarcraftXLHost.exe": "WarcraftXL 64-bit asset host (modern ADT/M2/WMO serving)",
}

# Asset-pipeline enable marker (F-195): a loose file next to Wow.exe whose presence turns on the
# modern-asset/terrain hooks + host. Shipped as a 4th bundle member. It routes via MPQ/ (not WXL/)
# because it is not in the launcher's wxlBinaries map, and the launcher drops non-WXL/non-.exe files in
# the app dir next to Wow.exe — exactly where the framework fopen-checks it. Dev deployment ships it so
# the pipeline is on for everyone; production would instead default the pipeline on in Main.cpp.
MARKER = "wxl-assets"
MARKER_BODY = (
    b"# WarcraftXL asset pipeline enable marker (F-195/F-196).\n"
    b"# Presence next to Wow.exe enables the modern-asset + terrain-phase hooks and the host.\n"
    b"# Managed by the launcher (WarcraftXL bundle member) - do not delete.\n"
)


def md5(path: Path) -> str:
    h = hashlib.md5()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def stage() -> dict:
    """Copy binaries into nginx/wow/WXL/ and return {filename: (checksum, size_mb)}."""
    wxl_dir = NGINX_WOW / "WXL"
    wxl_dir.mkdir(parents=True, exist_ok=True)
    meta = {}
    for name in SHIP:
        src = BUILD_OUTPUT / name
        if not src.exists():
            raise SystemExit(f"ERROR: {src} missing — run Zeppelin-Tools/WarcraftXL/build.sh first")
        dst = wxl_dir / name
        shutil.copy2(src, dst)
        size = dst.stat().st_size
        meta[name] = (md5(dst), round(size / (1024 * 1024), 2))
        print(f"  staged WXL/{name}  {size} bytes  md5={meta[name][0]}")
    # marker -> WXL/ (it's a wxlBinaries member now, routed like the other framework files, app dir)
    mdst = wxl_dir / MARKER
    mdst.write_bytes(MARKER_BODY)
    meta[MARKER] = (md5(mdst), round(mdst.stat().st_size / (1024 * 1024), 2))
    print(f"  staged WXL/{MARKER}  {mdst.stat().st_size} bytes  md5={meta[MARKER][0]}")
    return meta


# Single launcher line for the whole framework. The member files download together; the bundle version
# bumps whenever any member's checksum changes (tracked via a combined checksum over the members).
BUNDLE_KEY = "WarcraftXL"


def build_bundle(meta: dict, mandatory: bool) -> dict:
    now = datetime.now(timezone.utc).isoformat()
    files = [{"name": n, "checksum": meta[n][0], "size_mb": meta[n][1]} for n in list(SHIP) + [MARKER]]
    combined = hashlib.md5("".join(f["checksum"] for f in files).encode()).hexdigest()
    return {
        "name": "WarcraftXL Framework",
        "description": "WarcraftXL client framework — d3d9 proxy load vector, framework, and asset host",
        "is_mandatory": mandatory,
        "is_enabled_by_default": mandatory,
        "auto_update": True,
        "requires": [],
        "required_for": [],
        "build_source": "static",
        # Version derived from the content hash (not a counter): changes iff any member changes, and is
        # stateless — a lost register entry can't reset it, so the launcher always re-pulls on real change.
        "version": int(combined[:6], 16) or 1,
        "size_mb": round(sum(f["size_mb"] for f in files), 2),
        "checksum": combined,
        "last_modified": now,
        "files": files,
    }


def activate(bundle: dict):
    reg = json.loads(REGISTER.read_text())
    patches = reg.setdefault("patches", {})
    # Retire any earlier per-file entries — the bundle replaces them.
    for legacy in list(SHIP):
        if legacy in patches:
            del patches[legacy]
            print(f"  removed legacy per-file entry {legacy}")
    prev = patches.get(BUNDLE_KEY)
    patches[BUNDLE_KEY] = bundle   # version is content-derived, so just write the current state
    if prev and prev.get("checksum") == bundle["checksum"]:
        print(f"  {BUNDLE_KEY}: unchanged (v{bundle['version']})")
    else:
        print(f"  {BUNDLE_KEY}: registered v{bundle['version']} ({len(bundle['files'])} members)")
    reg["last_updated"] = datetime.now(timezone.utc).isoformat()
    REGISTER.write_text(json.dumps(reg, indent=2))
    print(f"  wrote {REGISTER}")


def main():
    ap = argparse.ArgumentParser(description="Stage/register WarcraftXL for the launcher (F-195)")
    ap.add_argument("--activate", action="store_true",
                    help="write the entries into patch_register.json (pushes to all players)")
    ap.add_argument("--mandatory", action="store_true",
                    help="with --activate: mark mandatory + enabled-by-default")
    args = ap.parse_args()

    print("== staging WarcraftXL binaries to nginx/wow/WXL/ ==")
    meta = stage()
    bundle = build_bundle(meta, mandatory=args.mandatory)

    if args.activate:
        print("== ACTIVATING (registering WarcraftXL bundle in patch_register.json) ==")
        activate(bundle)
        print("Done. The launcher shows a single WarcraftXL line and distributes all members together.")
    else:
        print("== WarcraftXL bundle entry that --activate WOULD write (dry run) ==")
        print(json.dumps({BUNDLE_KEY: bundle}, indent=2))
        print("\nStaged only. Files are served at WXL/ but not registered — no player is pushed the")
        print("framework yet. Re-run with --activate (optionally --mandatory) to go live.")


if __name__ == "__main__":
    main()
