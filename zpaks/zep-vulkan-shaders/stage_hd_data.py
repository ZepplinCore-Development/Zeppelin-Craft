#!/usr/bin/env python3
"""F-234: stage the HD renderer's data from the WoW-HD release pack into this zpak's source-assets.

The x64 client reads these from the MPQs first (loose files next to the exe second):
  Vulkan\\shaders\\...  base SPIR-V modules and the stock-shader translation with the sun-receiver
                       variants (manifest starts "# HD-SUN-RECEIVERS 4"; HD::VulkanData::Read)
  forever_data\\...     Forever lights, fog, sky, liquid, FFT and grading LUTs (HD::DataFile::Read)
  CataWater\\...        Cata water shaders.txt, bytecode, textures and its own LiquidType.dbc

The pack is the Azeroth-Remastered release of 2026-10-28, kept unpacked in Zeppelin-Tools. Its generators were
lost with the upstream repo, so it is the only source of this data. Left out: optim-cata\\ (nothing reads it),
Data\\patch-w.mpq (a global LiquidType.dbc change), the exe, the installer and the WaystoneHD addon.

Usage: stage_hd_data.py [--pack /workspace/project/Zeppelin-Tools/wow-hd-2026-10-28]
"""
import argparse
import shutil
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_PACK = Path('/workspace/project/Zeppelin-Tools/wow-hd-2026-10-28')
TREES = (('Vulkan/shaders', 'Vulkan/shaders'), ('forever_data', 'forever_data'), ('CataWater', 'CataWater'))


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('--pack', type=Path, default=DEFAULT_PACK)
    args = ap.parse_args()

    client = args.pack / 'client'
    manifest = client / 'Vulkan' / 'shaders' / 'translated' / 'manifest.txt'
    if not manifest.is_file():
        raise SystemExit(f'{manifest} missing: unpack WoW-HD-2026-10-28.zip into {args.pack}')
    if manifest.read_text(errors='replace').splitlines()[0].strip() != '# HD-SUN-RECEIVERS 4':
        raise SystemExit(f'{manifest} is not the sun-receiver manifest the client expects')

    assets = HERE / 'mpq' / 'source-assets'
    for src_rel, dst_rel in TREES:
        src, dst = client / src_rel, assets / dst_rel
        if not src.is_dir():
            raise SystemExit(f'{src} missing')
        if dst.exists():
            shutil.rmtree(dst)
        shutil.copytree(src, dst)
        files = [f for f in dst.rglob('*') if f.is_file()]
        size = sum(f.stat().st_size for f in files)
        print(f'staged {len(files):6d} files ({size / 1048576:6.1f} MB) {dst_rel}')


if __name__ == '__main__':
    main()
