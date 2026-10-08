"""F-216 curate from the LAYERED choices (choices/layers.json): mesh -> texture -> bake.

  files  base = today's winners of the pure HD packs (PATCH-Q); then
         - every mesh asset ships its picked option (explicit, migrated, or today's winner)
         - every texture with options ships its pick (explicit, else largest compatible)
         - every character display ships the largest COMPATIBLE NPC bake among the
           sources' own CreatureDisplayInfoExtra rows, and that row's look/texture
         - a Retail mesh ships its converted files; its displays wear the retail skins,
           placed beside the model as retail_<fdid>.blp
  dbc    rows those picks depend on, emitted stock -> curated (lib/hd_curate_dbc.py):
         the picked bake's CDX row, the picked character mesh's race tables
         (hair/facial geosets, CharSections), retail display skins (CDI)
"""
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from lib import asset_index as ai
from lib import hd_curate as hc
from lib import hd_curate_dbc as hd
from lib import model_sources as ms
from lib.viewer_v2 import Picks

RACE_DIRS = {'human': 1, 'orc': 2, 'dwarf': 3, 'nightelf': 4, 'scourge': 5, 'tauren': 6, 'gnome': 7,
             'troll': 8, 'goblin': 9, 'bloodelf': 10, 'draenei': 11}


def _race_of(path: str) -> Optional[Tuple[int, int]]:
    """character/<race>/<male|female>/... -> (race id, gender)."""
    parts = path.split('/')
    if len(parts) < 4 or parts[0] != 'character':
        return None
    race = RACE_DIRS.get(parts[1])
    gender = {'male': 0, 'female': 1}.get(parts[2])
    return (race, gender) if race and gender is not None else None


def resolve(result: dict, ix: ai.AssetIndex, choices: dict, zpaks: List[dict], layers: hd.Layers,
            log=print) -> dict:
    picks = Picks(ix, result, choices)
    srcs = {s.name: s for s in ix.sources}
    win = hc.winners(zpaks)
    base = hc.base_manifest(win)
    rest = hc.winners_excluding(zpaks, hc.COMMUNITY)
    want: Dict[str, Optional[Path]] = {}
    wanted_rows: Dict[Tuple[str, tuple], Optional[dict]] = {}
    report = {'meshes': 0, 'retail_meshes': 0, 'textures': 0, 'textures_unresolved': [], 'bakes': 0,
              'bakes_changed': 0, 'bake_no_compatible': []}

    # ---- layer 1: meshes ------------------------------------------------------------
    chosen_mesh: Dict[str, ai.Option] = {}
    for p, a in ix.meshes.items():
        if len(a.options) < 2:
            continue
        o = picks.mesh(p)
        if o is None:
            continue
        chosen_mesh[p] = o
        for x in a.options:
            for k in x.files:
                want.setdefault(k, None)                  # paths only another option has: drop
        for k, f in o.files.items():
            want[k] = f
        report['meshes'] += 1
        if 'retail' in o.sources:
            report['retail_meshes'] += 1

    # ---- layer 2: textures ------------------------------------------------------------
    for t, a in ix.textures.items():
        if len(a.options) < 2:
            continue
        o, why = picks.texture(t, {})
        if o is None:
            report['textures_unresolved'].append(t)
            continue
        want[t] = o.files[t]
        report['textures'] += 1

    # ---- NPC bakes: per character display, the largest compatible bake ----------------
    cdi_eff, cmd_eff = result['effective_dbc']
    char_sources = ['stock'] + [s.name for s in ix.sources if s.cdx]
    for did, row in cdi_eff.items():
        ext = int(row.get('extended_display_info_id') or 0)
        mrow = cmd_eff.get(int(row.get('model_id') or 0))
        if not ext or not mrow:
            continue
        mesh = ms.norm(str(mrow.get('model_path') or ''))
        if not mesh.startswith('character/'):
            continue
        mo = chosen_mesh.get(mesh) or picks.mesh(mesh)
        explicit = ((choices.get('custom') or {}).get(str(did)) or {}).get('bake')
        cands = []
        for src in char_sources:
            cdx = result['stock_char_dbc'][0] if src == 'stock' else srcs[src].cdx
            x = cdx.get(ext)
            if not x or not x.get('texture'):
                continue
            bp = 'textures/bakednpctextures/' + str(x['texture']).lower()
            f = (ix.stock if src == 'stock' else srcs[src].assets).get(bp)
            if f is None:
                continue
            topt = ai.Option('b', [src], {bp: f}, f.stat().st_size)
            if mo is not None and not ix.compatible(bp, topt, mesh, mo):
                continue
            cands.append((f.stat().st_size, src, bp, f))
        if not cands:
            report['bake_no_compatible'].append(did)
            continue
        if explicit:
            cands = [c for c in cands if c[1] == explicit] or cands
        size, src, bp, f = max(cands)
        want[bp] = f
        row_src = layers.state('creaturedisplayinfoextra', src).get((ext,))
        if row_src is not None:
            wanted_rows[('creaturedisplayinfoextra', (ext,))] = row_src
        report['bakes'] += 1
        cur_x = result['effective_char_dbc'][0].get(ext) or {}
        if str(cur_x.get('texture') or '').lower() != str(row_src.get('texture') if row_src else '').lower():
            report['bakes_changed'] += 1

    # ---- race tables follow the picked character mesh ----------------------------------
    for mesh, o in chosen_mesh.items():
        rg = _race_of(mesh)
        if not rg:
            continue
        src = next((s for s in o.sources if s != 'stock'), 'stock')
        for t in ('characterfacialhairstyles', 'charhairgeosets', 'charsections'):
            st = layers.state(t, src)
            keys = {k for k, r in st.items() if (r.get('race'), r.get('gender')) == rg}
            keys |= {k for k, r in layers.state(t, 'base').items() if (r.get('race'), r.get('gender')) == rg}
            for k in keys:
                wanted_rows[(t, k)] = st.get(k)

    # ---- displays wear the skins of their mesh option's own source ----------------------
    # Packs rename skins in their display rows (697 displays) to textures painted for their
    # mesh; with another option picked, the row's skins come back from that option's source.
    cdi_e, cmd_e = result['effective_dbc']
    by_mesh: Dict[str, List[int]] = {}
    for did, row in cdi_e.items():
        mrow = cmd_e.get(int(row.get('model_id') or 0))
        if mrow:
            by_mesh.setdefault(ms.norm(str(mrow.get('model_path') or '')), []).append(did)
    report.setdefault('skins_restored', 0)
    for mesh, o in chosen_mesh.items():
        if 'retail' in o.sources:
            continue
        for did in by_mesh.get(mesh, []):
            base = layers.state('creaturedisplayinfo', 'base').get((did,))
            if not base:
                continue
            # the first of the option's packs whose row names skins that exist (a broken row is skipped)
            fold = mesh.rsplit('/', 1)[0] + '/'
            fls = [ix._src_files(x) for x in o.sources] + [ix.stock]
            ok_row = lambda r_: all(any(f'{fold}{str(r_.get(k) or "").strip().lower()}.blp' in f_ for f_ in fls)
                                    for k in ('texture_variation_1', 'texture_variation_2', 'texture_variation_3')
                                    if str(r_.get(k) or '').strip())
            cands = [x for x in o.sources if x != 'stock' and srcs.get(x) is not None and srcs[x].cdi.get(did)]
            own = next((x for x in cands if ok_row(srcs[x].cdi[did])), cands[0] if cands else None)
            orow = srcs[own].cdi.get(did) if own else result['stock_dbc'][0].get(did)
            # same model FILE (packs book their own CreatureModelData ids, so compare paths)
            ocmd = srcs[own].cmd if own else result['stock_dbc'][1]
            om = ocmd.get(int(orow.get('model_id') or 0)) or cmd_e.get(int(orow.get('model_id') or 0)) if orow else None
            if not om or ms.norm(str(om.get('model_path') or '')) != mesh:
                continue
            # skins AND geosets (wendigo2: patch-hd-everything's 801 hides Spaceslam's face parts)
            ks = [f'texture_variation_{i}' for i in (1, 2, 3)]
            if [str(orow.get(k) or '').lower() for k in ks] == [str(base.get(k) or '').lower() for k in ks] and \
                    int(orow.get('creature_geoset_data') or 0) == int(base.get('creature_geoset_data') or 0):
                continue
            new = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or base)
            for k in ks:
                new[k] = orow.get(k) or ''
            new['creature_geoset_data'] = int(orow.get('creature_geoset_data') or 0)
            wanted_rows[('creaturedisplayinfo', (did,))] = new
            report['skins_restored'] += 1

    # ---- recorded fixes for pack files we ship (zep-hd-curated/curate_transforms.json) ----
    from lib import hd_curate_fixes as hcf
    report.setdefault('fixed', [])
    fixed_src: Dict[str, str] = {}
    fixed_dir = Path('/workspace/project/logs/curate_fixed')
    for fpath in list(hcf.recipes()):
        f = want.get(fpath)
        if f is None:
            continue
        fx = hcf.fixed(fpath, f.read_bytes(), log)
        if not fx:
            continue
        out_f = fixed_dir / fpath
        out_f.parent.mkdir(parents=True, exist_ok=True)
        out_f.write_bytes(fx[0])
        want[fpath] = out_f
        o = chosen_mesh.get(fpath)
        for t in fx[1].get('ship') or []:
            src = next((x for x in (o.sources if o else []) if t in ix._src_files(x)), None)
            if src and want.get(t) is None:
                want[t] = ix._src_files(src)[t]
        report['fixed'].append(fpath)
        fixed_src[fpath] = fx[1].get('source', '?')

    # ---- displays a pack left without skins on a model that needs them (lib/skin_fill) ---
    from lib import skin_fill as sf
    report.setdefault('skins_filled', 0)
    for mesh, o in chosen_mesh.items():
        f = o.files.get(mesh)
        if 'retail' in o.sources or f is None or not mesh.endswith('.m2'):
            continue
        table = sf.texture_table(f.read_bytes())
        need = sf.needed(table)
        if not need:
            continue
        dids = by_mesh.get(mesh, [])
        rows = {d: dict(wanted_rows.get(('creaturedisplayinfo', (d,))) or layers.state('creaturedisplayinfo', 'base').get((d,)) or {})
                for d in dids}
        names = lambda r: tuple(str(r.get(f'texture_variation_{i}') or '') for i in (1, 2, 3))
        blank = [d for d, r in rows.items() if r and sf.is_blank(names(r), need)]
        if not blank:
            continue
        st = ix.stock.get(mesh)
        files = [ix._src_files(x) for x in o.sources] + [ix.stock]
        got = sf.fill(mesh, table, sf.texture_table(st.read_bytes()) if st else [],
                      lambda h: any(h in fs for fs in files), [names(r) for r in rows.values() if r])
        if not got:
            continue
        for d in blank:
            r = rows[d]
            for i, n in enumerate(got):
                r[f'texture_variation_{i + 1}'] = n
            wanted_rows[('creaturedisplayinfo', (d,))] = r
            report['skins_filled'] += 1

    # ---- Retail meshes: their displays wear the retail skins -----------------------------
    for mesh, o in chosen_mesh.items():
        if 'retail' not in o.sources:
            continue
        from lib import retail
        mdir = mesh.rsplit('/', 1)[0]
        rfd = retail.remasters(cdi_eff, cmd_eff, [mesh]).get(mesh, 0)
        for did, row in cdi_eff.items():
            mrow = cmd_eff.get(int(row.get('model_id') or 0))
            if not mrow or ms.norm(str(mrow.get('model_path') or '')) != mesh:
                continue
            mesh_dids = by_mesh.get(mesh, [])
            fds = retail.sibling_textures(did, rfd, mesh_dids, lambda d: tuple(
                str((cdi_eff.get(int(d)) or {}).get(f'texture_variation_{k}') or '').lower() for k in (1, 2, 3)))
            if not any(fds):
                continue
            new = dict(layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            if not new:
                continue
            for i, fd in enumerate(fds):
                f = retail.texture_file(fd)
                if f is None:
                    continue
                name = f'retail_{fd}'
                want[f'{mdir}/{name}.blp'] = f
                new[f'texture_variation_{i + 1}'] = name
            wanted_rows[('creaturedisplayinfo', (did,))] = new

    # ---- layer 3: per-display customisation --------------------------------------------
    outfits = {}
    for did_s, cu in (choices.get('custom') or {}).items():
        if not did_s.isdigit() or not cu:
            continue
        did = int(did_s)
        if cu.get('geosets'):
            row = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or
                       layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            if row:
                row['creature_geoset_data'] = sum((int(v) & 0xF) << (4 * k) for k, v in enumerate(cu['geosets'][:8]))
                wanted_rows[('creaturedisplayinfo', (did,))] = row
        if cu.get('skins') and cu.get('path'):
            # display skin slots picked in Customise (texture stems in the model's folder)
            row = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or
                       layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            if row:
                folder = ms.norm(cu['path']).rsplit('/', 1)[0]
                o_c = chosen_mesh.get(ms.norm(cu['path']))
                for k, stem in enumerate(cu['skins'][:3]):
                    if stem is None:
                        continue
                    row[f'texture_variation_{k + 1}'] = stem
                    tp = f'{folder}/{str(stem).lower()}.blp'
                    if stem and want.get(tp) is None and tp not in ix.stock:
                        f = next((ix._src_files(x)[tp] for x in (o_c.sources if o_c else []) if tp in ix._src_files(x)), None)
                        if f is not None:
                            want[tp] = f              # a pack texture nothing else ships
                wanted_rows[('creaturedisplayinfo', (did,))] = row
        if 'hair_style' in cu or 'facial_hair' in cu:
            ext = int((cdi_eff.get(did) or {}).get('extended_display_info_id') or 0)
            row = dict(wanted_rows.get(('creaturedisplayinfoextra', (ext,))) or
                       layers.state('creaturedisplayinfoextra', 'base').get((ext,)) or {}) if ext else {}
            if row:
                for k in ('hair_style', 'facial_hair'):
                    if k in cu:
                        row[k] = int(cu[k])
                wanted_rows[('creaturedisplayinfoextra', (ext,))] = row
        if cu.get('outfit'):
            outfits[did] = cu['outfit']
    report['customised'] = len(choices.get('custom') or {})
    report['outfits'] = {str(k): v for k, v in outfits.items()}

    # ---- display-level picks: the chosen pack's display rows + its model files -------------
    # model-level picks decide every display of their model; explicit display picks override
    display_picks: Dict[str, dict] = {}
    for mc in (choices.get('mesh') or {}).values():
        for did_s, dp in ((mc or {}).get('displays') or {}).items():
            display_picks[str(did_s)] = dp
    display_picks.update({k: v for k, v in (choices.get('display') or {}).items() if v})
    report['display_picks'] = len(display_picks)
    from lib import repoint_complete as rc
    comp = rc.completions(result)
    for did_s, dp in display_picks.items():
        if not did_s.isdigit() or not dp:
            continue
        did, src = int(did_s), (dp.get('sources') or ['stock'])[0]
        row = layers.state('creaturedisplayinfo', src).get((did,))
        # a display the pack stranded on the old model: its completed row (lib/repoint_complete)
        over = next((comp[x][did] for x in (dp.get('sources') or []) if did in comp.get(x, {})), None)
        if over:
            src = next(x for x in dp['sources'] if did in comp.get(x, {}))
            row = dict(row or layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            row.update(over)
        if not row:
            continue
        wanted_rows[('creaturedisplayinfo', (did,))] = row
        mid = int(row.get('model_id') or 0)
        mrow = layers.state('creaturemodeldata', src).get((mid,))
        if mrow:
            wanted_rows[('creaturemodeldata', (mid,))] = mrow
            mp = ms.norm(str(mrow.get('model_path') or '')).replace('.mdx', '.m2')
            a = ix.meshes.get(mp)
            o = a.option_of(src) if a else None
            if o is None and src != 'stock' and src in srcs and mp in srcs[src].assets:
                o = ai.Option('d', [src], {k: v for k, v in srcs[src].assets.items()
                                          if k == mp or (k.startswith(mp[:-3]) and k.endswith(('.skin', '.anim')))})
            if o is not None:
                for k, f in o.files.items():
                    want[k] = f
            # the pack left this display's skins blank on a model that needs them (lib/skin_fill;
            # zombie2/zombiesword: display 21434) - the picker's pane fills it the same way
            mf = want.get(mp)
            if mf is not None and mp.endswith('.m2') and src in srcs:
                table = sf.texture_table(mf.read_bytes())
                need = sf.needed(table)
                names = lambda r: tuple(str(r.get(f'texture_variation_{i}') or '') for i in (1, 2, 3))
                if sf.is_blank(names(row), need):
                    cdi_s, cmd_s = srcs[src].cdi, srcs[src].cmd
                    sibs = [names(r) for r in cdi_s.values()
                            if ms.norm(str((cmd_s.get(int(r.get('model_id') or 0)) or {}).get('model_path') or '')) == mp]
                    st = ix.stock.get(mp)
                    fls = [ix._src_files(src), ix.stock]
                    got = sf.fill(mp, table, sf.texture_table(st.read_bytes()) if st else [],
                                  lambda h: any(h in fs for fs in fls), sibs)
                    if got:
                        row = dict(row)
                        for i, n in enumerate(got):
                            row[f'texture_variation_{i + 1}'] = n
                        wanted_rows[('creaturedisplayinfo', (did,))] = row
                        report['skins_filled'] = report.get('skins_filled', 0) + 1
        ext = int(row.get('extended_display_info_id') or 0)
        if ext:
            x = layers.state('creaturedisplayinfoextra', src).get((ext,))
            if x:
                wanted_rows[('creaturedisplayinfoextra', (ext,))] = x
        report['display_picks'] = report.get('display_picks', 0) + 1

    # ---- geoset data naming geosets the shipped mesh lacks (lib/geoset_fix) -------------
    from lib import geoset_fix as gf
    report['geosets_fixed'] = 0
    base_cdi = layers.state('creaturedisplayinfo', 'base')
    base_cmd = layers.state('creaturemodeldata', 'base')
    gs_cache: Dict[str, set] = {}
    for key in set(base_cdi) | {k for t, k in wanted_rows if t == 'creaturedisplayinfo'}:
        row = wanted_rows.get(('creaturedisplayinfo', key)) or base_cdi.get(key)
        cg = int((row or {}).get('creature_geoset_data') or 0)
        if not cg:
            continue
        mid = (int(row.get('model_id') or 0),)
        mrow = wanted_rows.get(('creaturemodeldata', mid)) or base_cmd.get(mid)
        mp = ms.norm(str((mrow or {}).get('model_path') or '')).replace('.mdx', '.m2')
        sk = want.get(mp[:-3] + '00.skin') if mp.endswith('.m2') else None
        if sk is None:
            continue
        if mp not in gs_cache:
            gs_cache[mp] = gf.mesh_geosets(sk.read_bytes())
        fx = gf.fixed(cg, gs_cache[mp])
        if fx is None:
            continue
        new = dict(row)
        new['creature_geoset_data'] = fx
        wanted_rows[('creaturedisplayinfo', key)] = new
        report['geosets_fixed'] += 1

    # ---- the manifest ------------------------------------------------------------------
    manifest = dict(base)
    dropped = stock_copies = 0
    for p, f in want.items():
        under = rest.get(p)
        if f is None or (under is not None and hc._same(under.file, f)) or (under is None and hc._is_stock(f)):
            if manifest.pop(p, None) is not None:
                dropped += 1
            continue
        owner = ('stock' if hc._is_stock(f) else 'retail' if '/retail_cache/' in str(f)
                 else f"{fixed_src.get(p, '?')}+fixed" if '/curate_fixed/' in str(f) else ai_owner(f))
        manifest[p] = hc.Entry(owner, 'Q', 0, f)
        if owner == 'stock':
            stock_copies += 1
    # ---- item fits (F-165 transform; borrow = another race's model for this variant) ---------
    fits_done, fits_skipped = 0, []
    fit_dir = Path('/workspace/project/logs/fit_cache')
    for path, fit in (choices.get('fit') or {}).items():
        a = ix.meshes.get(path)
        cur = picks.mesh(path) if a else None
        if a is not None and cur is not None and fit.get('option') and fit['option'] != cur.key:
            fits_skipped.append(f'{path}: fit made for option {fit["option"]}, shipping {cur.key}')
            continue
        src_path = fit.get('borrow') or path
        base_opt = (ix.meshes.get(src_path).option_of(cur.sources[0]) if cur and ix.meshes.get(src_path) else None)
        f = (base_opt.files.get(src_path) if base_opt else None) or (manifest.get(src_path).file if manifest.get(src_path) else None) \
            or ms.stock_asset(src_path)
        sk = (base_opt.files.get(src_path[:-3] + '00.skin') if base_opt else None) or ms.stock_asset(src_path[:-3] + '00.skin')
        if f is None:
            fits_skipped.append(f'{path}: no file for {src_path}')
            continue
        import hashlib
        data = f.read_bytes()
        key = hashlib.sha1(data + repr(sorted((k, v) for k, v in fit.items() if k in ('dx', 'dy', 'dz', 'scale'))).encode()).hexdigest()[:16]
        fit_dir.mkdir(parents=True, exist_ok=True)
        out_m2 = fit_dir / f'{key}.m2'
        skin_out = None
        if not out_m2.exists():
            from lib import m2_vertex_shifter as shifter
            if 256 <= int.from_bytes(data[4:8], 'little') < 264:
                from lib import m2_tbc
                m2b, skins, _ = m2_tbc.convert(data)            # the shifter reads v264 headers
                tmp = fit_dir / f'{key}.v264.m2'
                tmp.write_bytes(m2b)
                (fit_dir / f'{key}00.skin').write_bytes(skins[0])
                shifter.transform_vertices(tmp, fit.get('dx', 0), fit.get('dy', 0), fit.get('dz', 0), fit.get('scale', 1),
                                           backup=False, output_path=out_m2)
                tmp.unlink()
            else:
                shifter.transform_vertices(f, fit.get('dx', 0), fit.get('dy', 0), fit.get('dz', 0), fit.get('scale', 1),
                                           backup=False, output_path=out_m2)
        if (fit_dir / f'{key}00.skin').exists():
            skin_out = fit_dir / f'{key}00.skin'
        manifest[path] = hc.Entry('fit', 'Q', 0, out_m2)
        sk_final = skin_out or sk
        if sk_final is not None:
            manifest[path[:-3] + '00.skin'] = hc.Entry('fit', 'Q', 0, sk_final)
        fits_done += 1
    report['fits'] = fits_done
    report['fits_skipped'] = fits_skipped
    report.update({'files': len(manifest), 'dropped': dropped, 'stock_copies': stock_copies,
                   'rows': len(wanted_rows)})
    return {'manifest': manifest, 'wanted_rows': wanted_rows, 'report': report}


def ai_owner(f: Path) -> str:
    sp = str(f)
    if '/zpaks/' in sp:
        return sp.split('/zpaks/', 1)[1].split('/', 1)[0]
    if '/Asset Library/COMMUNITY/' in sp:
        import json as _j
        d = sp.split('/Asset Library/COMMUNITY/', 1)[1].split('/', 1)[0]
        try:
            return _j.loads((ms.COMMUNITY_LIBRARY / d / 'source.json').read_text()).get('name', d)
        except (OSError, ValueError):
            return d
    return 'unknown'
