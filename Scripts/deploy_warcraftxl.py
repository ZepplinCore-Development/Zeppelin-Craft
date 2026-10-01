#!/usr/bin/env python3
"""
F-195: stage + register the WarcraftXL client framework (v1.1) for launcher distribution.

Ships, as ONE launcher bundle ("WarcraftXL"), everything next to Wow.exe that v1.1 loads:
  - d3d9.dll                              the proxy load vector (client loads it ahead of system32)
  - WarcraftXL.dll                        the framework itself (bootstrapped by the proxy)
  - Extensions/<Name>/<Name>.dll          every extension build.sh produced (auto-discovered by the core)
v1.1 has no 64-bit asset host and no wxl-assets marker; neither is shipped any more (copies left on a
player's disk are inert). wxl-patcher.exe is a build-time tool and is NOT shipped.

Extensions are staged under BOTH WXL/ and MPQ/. The current launcher routes any "Extensions/..." member
through WXL/ (staged while WoW runs); a launcher built before v1.1 does not know that prefix and fetches
unknown members from MPQ/ to <app>/<name>, which is the same install path -- so players on the old
launcher still get a working install.

STAGING (default) copies the files and prints the register entry it WOULD write.
ACTIVATION (--activate) writes the entry into patch_register.json — this makes the live launcher push
the framework to every player, so it is a deliberate rollout step.
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

# Core members, in launcher order; extensions follow, discovered from build-output/Extensions/.
CORE = ["d3d9.dll", "WarcraftXL.dll"]
EXTENSIONS_DIR = "Extensions"

# Members of the pre-1.1 bundle that v1.1 no longer ships (also retired as legacy per-file keys).
RETIRED = ["WarcraftXLHost.exe", "wxl-assets"]


def members() -> list:
    """Bundle member names (slash-separated, relative to Wow.exe's folder)."""
    ext_root = BUILD_OUTPUT / EXTENSIONS_DIR
    exts = sorted(f"{EXTENSIONS_DIR}/{d.name}/{d.name}.dll"
                  for d in ext_root.iterdir() if (d / f"{d.name}.dll").is_file()) if ext_root.is_dir() else []
    if not exts:
        raise SystemExit(f"ERROR: no extensions under {ext_root} — run Zeppelin-Tools/WarcraftXL/build.sh first")
    return CORE + exts


def md5(path: Path) -> str:
    h = hashlib.md5()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 16), b""):
            h.update(chunk)
    return h.hexdigest()


def stage(names: list) -> dict:
    """Copy members into nginx/wow/WXL/ (extensions also into MPQ/); return {name: (checksum, size_mb)}."""
    meta = {}
    for name in names:
        src = BUILD_OUTPUT / name
        if not src.exists():
            raise SystemExit(f"ERROR: {src} missing — run Zeppelin-Tools/WarcraftXL/build.sh first")
        roots = ["WXL", "MPQ"] if name.startswith(EXTENSIONS_DIR + "/") else ["WXL"]
        for root in roots:
            dst = NGINX_WOW / root / name
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(src, dst)
        size = src.stat().st_size
        meta[name] = (md5(src), round(size / (1024 * 1024), 2))
        print(f"  staged {'+'.join(roots)}/{name}  {size} bytes  md5={meta[name][0]}")
    return meta


# Single launcher line for the whole framework. The member files download together; the bundle version
# bumps whenever any member's checksum changes (tracked via a combined checksum over the members).
BUNDLE_KEY = "WarcraftXL"


def build_bundle(meta: dict) -> dict:
    now = datetime.now(timezone.utc).isoformat()
    files = [{"name": n, "checksum": meta[n][0], "size_mb": meta[n][1]} for n in meta]
    combined = hashlib.md5("".join(f["checksum"] for f in files).encode()).hexdigest()
    return {
        "name": "WarcraftXL Framework",
        "description": "WarcraftXL v1.1 client framework — d3d9 proxy load vector, framework, and extensions",
        "requires": [],
        "required_for": [],
        "build_source": "static",
        # Version derived from the content hash (not a counter), so it is stateless — a lost register
        # entry can't reset it. 4 hex digits = at most 65535, which fits the launcher's Version column
        # (the field stays an int: deployed launchers parse it as one). activate() resolves the rare
        # collision where changed content hashes to the previous short version.
        "version": int(combined[:4], 16) or 1,
        "size_mb": round(sum(f["size_mb"] for f in files), 2),
        "checksum": combined,
        "last_modified": now,
        "files": files,
    }


def activate(bundle: dict):
    reg = json.loads(REGISTER.read_text())
    patches = reg.setdefault("patches", {})
    # Retire any earlier per-file entries — the bundle replaces them.
    for legacy in CORE + RETIRED:
        if legacy in patches:
            del patches[legacy]
            print(f"  removed legacy per-file entry {legacy}")
    prev = patches.get(BUNDLE_KEY)
    if prev and prev.get("checksum") != bundle["checksum"] and prev.get("version") == bundle["version"]:
        # The launcher re-downloads only when the version differs; a short hash can collide.
        bundle["version"] = bundle["version"] % 0xFFFF + 1
        print(f"  {BUNDLE_KEY}: short-version collision, bumped to v{bundle['version']}")
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
    args = ap.parse_args()

    print("== staging WarcraftXL binaries to nginx/wow/WXL/ (+ MPQ/ for extensions) ==")
    meta = stage(members())
    bundle = build_bundle(meta)

    if args.activate:
        print("== ACTIVATING (registering WarcraftXL bundle in patch_register.json) ==")
        activate(bundle)
        print("Done. The launcher shows a single WarcraftXL line and distributes all members together.")
    else:
        print("== WarcraftXL bundle entry that --activate WOULD write (dry run) ==")
        print(json.dumps({BUNDLE_KEY: bundle}, indent=2))
        print("\nStaged only. Files are served at WXL/ but not registered — no player is pushed the")
        print("framework yet. Re-run with --activate to go live.")


if __name__ == "__main__":
    main()
