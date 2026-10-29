#!/usr/bin/env python3
"""F-234: stage the Vulkan renderer's shaders into this zpak's source-assets as Vulkan\\shaders\\...

The x64 client (HD::VulkanData::Read) reads them from the MPQs by that path. Inputs are a
wxl-vulkan-api checkout: its committed base modules (shaders/*.spv) and the stock-shader translation
(shaders/translated/, made by tools/translate_shaders.py from the stock MPQs). Only the manifest and
the .spv files it names are staged; the translator's .glsl/.spvasm side files are left behind.

Usage: stage_shaders.py [--wxl /workspace/project/Zeppelin-Tools/wxl-vulkan-api]
"""
import argparse
import re
import shutil
from pathlib import Path

HERE = Path(__file__).resolve().parent
DEFAULT_WXL = Path('/workspace/project/Zeppelin-Tools/wxl-vulkan-api')
SPV_IN_MANIFEST = re.compile(r'(?:vertex|pixel)/[0-9a-f]{32}[A-Za-z0-9_.]*\.spv')


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('--wxl', type=Path, default=DEFAULT_WXL)
    args = ap.parse_args()

    src = args.wxl / 'shaders'
    manifest = src / 'translated' / 'manifest.txt'
    if not manifest.is_file():
        raise SystemExit(f'{manifest} missing: run tools/translate_shaders.py in {args.wxl} first')

    out = HERE / 'mpq' / 'source-assets' / 'Vulkan' / 'shaders'
    if out.exists():
        shutil.rmtree(out)
    (out / 'translated').mkdir(parents=True)

    base = sorted(src.glob('*.spv'))
    for f in base:
        shutil.copy2(f, out / f.name)

    shutil.copy2(manifest, out / 'translated' / 'manifest.txt')
    named = sorted(set(SPV_IN_MANIFEST.findall(manifest.read_text())))
    missing = [n for n in named if not (src / 'translated' / n).is_file()]
    if missing:
        raise SystemExit(f'manifest names {len(missing)} missing modules, e.g. {missing[0]}')
    size = 0
    for n in named:
        dst = out / 'translated' / n
        dst.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(src / 'translated' / n, dst)
        size += dst.stat().st_size

    print(f'staged {len(base)} base modules, manifest, {len(named)} translated modules '
          f'({size / 1048576:.1f} MB) into {out}')


if __name__ == '__main__':
    main()
