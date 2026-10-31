#!/usr/bin/env python3
"""F-234: translate the HD materials' prebuilt bytecode (hd-blobs/) for the Vulkan device and merge it into the
staged manifest.

The client loads Vulkan\\hd-blobs\\<Material>-<vs|ps>-<a>-<b>-<key>.bin from the MPQs before compiling a material's
HLSL (HD::ShaderPrebuilt, key = FNV-1a of the source), so every machine draws these exact bytes and the manifest can
know them. Write new blobs with hdShaderDump 1 in a client whose d3dcompiler_47 is Microsoft's (F-219: the Wow Model
Viewer's DLL beside the exe, WINEDLLOVERRIDES=d3dcompiler_47=n,b); a material's blobs must be regenerated when its
HLSL changes, or the client compiles it again and Vulkan keeps Blizzard's shader.

wxl-vulkan-api's translate.py does the translation, with one addition: the device uploads pixel c0..c12 only and
the client mirrors c13..c204 into vertex rows 64..255 (HdGxShader.cpp, HD::PixelConstantsSet), so an HD pixel
constant from c13 up reads that row and its module declares the 256-row vertex window. A VPOS input reads gl_FragCoord; rep/endrep become a counted for loop, break/breakc a break. No G-buffer or sun-receiver variants are made: grass has none
on Vulkan either way (the stock DetailDoodad records have none), and the HdTerrain / HdMapObj receiver generator is
lost, so those families are not shipped here.

Usage: hd_blobs.py <staged Vulkan\\shaders\\translated dir> [--blobs hd-blobs] [--wxl .../wxl-vulkan-api]
"""
import argparse
import hashlib
import os
import re
import shutil
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
NAME = re.compile(r'^(\w+)-(vs|ps)-(\d+)-(\d+)-([0-9a-f]{8})\.bin$')
PIXEL_HIGH_FIRST, PIXEL_HIGH_ROW, PIXEL_HIGH_LAST = 13, 64, 204


def patch_translator(T, blobs):
    def records():
        out = []
        for f in sorted(os.listdir(blobs)):
            m = NAME.match(f)
            if not m:
                continue
            r = T.Record()
            r.kind = 'vertex' if m[2] == 'vs' else 'pixel'
            r.profile = 'vs_3_0' if m[2] == 'vs' else 'ps_3_0'
            r.name = '%s:%s:%s' % (m[1], m[2], m[3])
            r.perm = int(m[4])
            r.code = (Path(blobs) / f).read_bytes()
            r.md5 = hashlib.md5(r.code).hexdigest()
            r.hdr = (0, 0, 0, 0)
            r.sh = T.ir.decode(r.code)
            out.append(r)
        return out
    T.enumerate_records = records

    base_const = T.Emitter.const_expr

    def const_expr(self, o):
        if (not self.vs and o.rtype == T.ir.RT_CONST and not o.rel and o.index not in self.defs
                and PIXEL_HIGH_FIRST <= o.index <= PIXEL_HIGH_LAST):
            self.phigh = True
            return 'regs.v[%d]' % (PIXEL_HIGH_ROW + o.index - PIXEL_HIGH_FIRST)
        return base_const(self, o)
    T.Emitter.const_expr = const_expr

    def set_vconst(self, v):
        if not self.vs and self.__dict__.get('phigh'):
            v = T.VCONST_LARGE
        self.__dict__['_vconst'] = v
    T.Emitter.vconst = property(lambda self: self.__dict__.get('_vconst'), set_vconst)

    # VPOS (HdSky's dither): a pixel input with the position semantic, which is no varying. It reads gl_FragCoord,
    # less half a pixel: D3D9's VPOS is the pixel's corner, both count from the top left.
    base_dcl, base_text = T.Emitter.dcl, T.Emitter.text

    def dcl(self, ins):
        d = ins.dst
        if self.vs or d.rtype == T.ir.RT_SAMPLER or not ins.dcl_usage:
            return base_dcl(self, ins)
        u, ui = ins.dcl_usage
        if (not self.vs and self.major >= 3 and d.rtype == T.ir.RT_MISCTYPE and d.index == 0) or \
                (not self.vs and self.major >= 3 and T.ir.USAGE.get(u) == 'position' and ui == 0):
            nm = self.regname(d)
            self.inputs[nm] = 'position0'
            self.in_masks[nm] = d.mask
            self.__dict__['vpos'] = nm
            return
        return base_dcl(self, ins)

    def text(self):
        if self.__dict__.get('vpos') and 'position0' in getattr(self, 'reads', []):
            self.reads.remove('position0')   # no varying: the manifest's `reads` must not list it either
        out = base_text(self)
        nm = self.__dict__.get('vpos')
        if nm:
            out = out.replace('    vec4 %s = position0;' % nm, '    vec4 %s = vec4(gl_FragCoord.xy - 0.5, 0.0, 0.0);' % nm)
        return out
    base_expr = T.Emitter.base_expr

    def base_expr_vpos(self, o):
        if not self.vs and o.rtype == T.ir.RT_MISCTYPE and o.index == 0 and self.__dict__.get('vpos'):
            return self.regname(o)
        return base_expr(self, o)
    T.Emitter.dcl, T.Emitter.text, T.Emitter.base_expr = dcl, text, base_expr_vpos

    # rep i# / endrep: i#.x iterations (the HLSL compiler's form of a loop that does not index by aL, F-237's unit
    # loop in HdGrass).
    def r_rep(self, i):
        if len(i.srcs) != 1 or i.srcs[0].rtype != T.ir.RT_CONSTINT:
            raise T.Refused('rep operands')
        iv = self.base_expr(i.srcs[0])
        self.loopn += 1
        n = 'n%d' % self.loopn
        self.line('for (int %s = 0; %s < %s.x; ++%s) {' % (n, n, iv, n))
        self.depth += 1

    def r_endrep(self, i):
        self.depth -= 1
        self.line('}')
    T.RULES[T.ir.OP_REP] = r_rep
    T.RULES[T.ir.OP_ENDREP] = r_endrep

    def r_break(self, i):
        self.line('break;')

    def r_breakc(self, i):
        cmpop = {1: '>', 2: '==', 3: '>=', 4: '<', 5: '!=', 6: '<='}.get(i.ctrl & 7)
        if cmpop is None:
            raise T.Refused('breakc with comparison %d' % (i.ctrl & 7))
        self.line('if (%s %s %s) break;' % (self.comp(i.srcs[0], 0), cmpop, self.comp(i.srcs[1], 0)))
    T.RULES[T.ir.OP_BREAK] = r_break
    T.RULES[T.ir.OP_BREAKC] = r_breakc


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument('translated', type=Path)
    ap.add_argument('--blobs', type=Path, default=HERE / 'hd-blobs')
    ap.add_argument('--wxl', type=Path, default=Path('/workspace/project/Zeppelin-Tools/wxl-vulkan-api'))
    ap.add_argument('--glslang', default=os.environ.get('GLSLANG', os.path.expanduser('~/.local/glslang/bin/glslang')))
    args = ap.parse_args()

    sys.path.insert(0, str(args.wxl / 'tools' / 'bls_tools'))
    import translate as T
    patch_translator(T, str(args.blobs))

    scratch = Path(tempfile.mkdtemp(prefix='hd-blobs-'))
    try:
        if T.main(['--all', '--out', str(scratch), '--glslang', args.glslang]) not in (0, None):
            raise SystemExit('translate.py failed')
        manifest = args.translated / 'manifest.txt'
        text = manifest.read_text()
        known = set(re.findall(r'^record ([0-9a-f]{32}) ', text, re.M))
        # A block is its record line and what follows; the first one comes straight after the file's header comment.
        blocks = []
        for b in (scratch / 'manifest.txt').read_text().split('\n\n'):
            lines = b.strip('\n').splitlines()
            while lines and lines[0].startswith('#'):
                lines.pop(0)
            if lines and lines[0].startswith('record '):
                blocks.append('\n'.join(lines))
        added = 0
        for b in blocks:
            md5 = b.split()[1]
            if md5 in known:
                continue
            for spv in re.findall(r'(?:vertex|pixel)/[0-9a-f]{32}[A-Za-z0-9_.]*\.spv', b):
                dst = args.translated / spv
                dst.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(scratch / spv, dst)
            text = text.rstrip('\n') + '\n\n' + b + '\n'
            added += 1
        manifest.write_text(text)
        out = args.translated.parent.parent / 'hd-blobs'
        if out.exists():
            shutil.rmtree(out)
        shutil.copytree(args.blobs, out)
        print(f'hd-blobs: {len(blocks)} records translated, {added} added to {manifest}; blobs staged in {out}')
    finally:
        shutil.rmtree(scratch, ignore_errors=True)


if __name__ == '__main__':
    main()
