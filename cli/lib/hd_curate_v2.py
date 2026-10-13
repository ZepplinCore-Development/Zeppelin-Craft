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
        # the picker's choice of bake: a Displays-page pick 'bake:<source>' (character displays), or an edit's
        explicit = ((choices.get('custom') or {}).get(str(did)) or {}).get('bake')
        dpk = str(((choices.get('display') or {}).get(str(did)) or {}).get('option') or '')
        if dpk.startswith('bake:'):
            explicit = dpk[5:]
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
            # brow, not base: `base` is today's winner manifest, which the manifest step below starts from
            brow = layers.state('creaturedisplayinfo', 'base').get((did,))
            if not brow:
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
            if [str(orow.get(k) or '').lower() for k in ks] == [str(brow.get(k) or '').lower() for k in ks] and \
                    int(orow.get('creature_geoset_data') or 0) == int(brow.get('creature_geoset_data') or 0):
                continue
            new = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or brow)
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
            # the classic row's geoset data means nothing on the retail mesh: use retail's for this skin set
            new['creature_geoset_data'] = retail.pack_nibbles(retail.set_nibbles(rfd, fds))
            wanted_rows[('creaturedisplayinfo', (did,))] = new

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
    rem = rc.remaster_options(result)                  # remaster options picked per display (+ modular)
    report.setdefault('retail_displays', [])
    report.setdefault('retail_display_failed', [])
    customs = choices.get('custom') or {}
    custom_geo: set = set()          # displays whose geoset data is an edit (incl. "none (hidden)" groups)
    for did_s, dp in display_picks.items():
        if not did_s.isdigit() or not dp:
            continue
        if str(dp.get('option') or '').startswith('bake:'):
            continue                                   # a character display's bake pick: the NPC bakes pass above
        if dp.get('option') == 'custom' and (customs.get(did_s) or {}).get('new'):
            continue                                   # a display we created: layer 3 builds its row
        if dp.get('option') == 'custom':
            # our own option: ship the panel it was built on; layer 3 below applies the edits to it
            b_ = (customs.get(did_s) or {}).get('base') or {}
            dp = {'option': b_.get('option'), 'sources': b_.get('sources') or ['stock']}
            if 'retail' in dp['sources']:
                # a retail remaster (by name) picked in the Display editor: the per-display retail path
                dp.update({'fdid': b_.get('fdid'), 'skins': b_.get('skins'), 'remaster_of': b_.get('remaster_of')})
        did, src = int(did_s), (dp.get('sources') or ['stock'])[0]
        if src == 'retail' and not dp.get('fdid'):
            # the picker's option-key collision (before 2026-10-10): a pack card on the same path as a
            # retail remaster was saved as ['retail']. A real retail pick carries its fdid; without one,
            # the pick is the pack that ships that path
            tp_ = ms.norm(str(dp.get('option') or ''))
            own = next((n for n in srcs if tp_ in ix._src_files(n)), None)
            if own:
                dp = {**dp, 'sources': [own]}
                src = own
                report.setdefault('retail_collision_repaired', []).append(did)
        if src == 'retail':
            # a retail remaster found BY NAME, picked for this display (picker: model card panel)
            why = _retail_display(did, dp, layers, result, srcs, want, wanted_rows, log)
            (report['retail_display_failed'] if why else report['retail_displays']).append(
                f'{did}: {why}' if why else did)
            continue
        row = layers.state('creaturedisplayinfo', src).get((did,))
        # a display the pack stranded on the old model: its completed row (lib/repoint_complete)
        over = next((comp[x][did] for x in (dp.get('sources') or []) if did in comp.get(x, {})), None)
        if over:
            src = next(x for x in dp['sources'] if did in comp.get(x, {}))
            row = dict(row or layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            row.update(over)
        else:
            # a community remaster offered to a display its pack did not move (picker: "remaster")
            ro = next(((x, rem[x][did][ms.norm(str(dp.get('option') or ''))]) for x in (dp.get('sources') or [])
                       if ms.norm(str(dp.get('option') or '')) in (rem.get(x, {}).get(did) or {})), None)
            if ro:
                src = ro[0]
                row = dict(row or layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
                row.update({k: v for k, v in ro[1].items() if not k.startswith('_')})
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

    # ---- layer 3: per-display customisation --------------------------------------------
    # AFTER the display picks: a customisation edits the row its display ships (the picked option's)
    outfits = {}
    for did_s, cu in sorted((choices.get('custom') or {}).items(), key=lambda kv: int(kv[0]) if kv[0].isdigit() else 0):
        if not did_s.isdigit() or not cu:
            continue
        did = int(did_s)
        if cu.get('new'):
            # a display the picker CREATED (Display editor's "New display"): no stock option to pick
            # against, it always ships - its row is a copy of the row the model was shown with
            why = _new_display(did, cu, layers, result, srcs, want, wanted_rows, ix, log)
            report.setdefault('new_displays' if not why else 'new_display_failed', []).append(f'{did}: {why}' if why else did)
            if why:
                continue
            custom_geo.add(did)
        # a customisation is its own option on the display: it ships only once the display's pick is it
        elif (display_picks.get(did_s) or {}).get('option') != 'custom':
            continue
        else:
            # an edit on ANOTHER model (Display editor "Search all models": a stock / pack model the display
            # never wore): the display is repointed to that model's CreatureModelData row, its files shipped
            why = _repoint_model(did, cu, layers, srcs, want, wanted_rows, ix)
            if why is not None:
                report.setdefault('repointed' if not why else 'repoint_failed', []).append(f'{did}: {why}' if why else did)
                if why:
                    continue
        if cu.get('geosets'):
            row = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or
                       layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            if row:
                row['creature_geoset_data'] = sum((int(v) & 0xF) << (4 * k) for k, v in enumerate(cu['geosets'][:8]))
                custom_geo.add(did)                    # deliberate: the geoset fix below leaves it alone
                wanted_rows[('creaturedisplayinfo', (did,))] = row
        if cu.get('skins') and cu.get('path'):
            # display skin slots picked in Customise (texture stems in the model's folder)
            row = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or
                       layers.state('creaturedisplayinfo', 'base').get((did,)) or {})
            if row:
                folder = ms.norm(cu['path']).rsplit('/', 1)[0]
                o_c = chosen_mesh.get(ms.norm(cu['path']))
                src_l = list(o_c.sources) if o_c else list(((cu.get('base') or {}).get('sources')) or [])
                for k, stem in enumerate(cu['skins'][:3]):
                    if stem is None:
                        continue
                    row[f'texture_variation_{k + 1}'] = stem
                    tp = f'{folder}/{str(stem).lower()}.blp'
                    if stem and want.get(tp) is None and tp not in ix.stock:
                        f = next((ix._src_files(x)[tp] for x in src_l if x not in ('stock', 'retail') and tp in ix._src_files(x)), None)
                        if f is not None:
                            want[tp] = f              # a pack texture nothing else ships
                wanted_rows[('creaturedisplayinfo', (did,))] = row
        if 'hair_style' in cu or 'facial_hair' in cu:
            ext = int((wanted_rows.get(('creaturedisplayinfo', (did,))) or cdi_eff.get(did) or {}).get('extended_display_info_id') or 0)
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

    # ---- geoset data naming geosets the shipped mesh lacks (lib/geoset_fix) -------------
    from lib import geoset_fix as gf
    report['geosets_fixed'] = 0
    base_cdi = layers.state('creaturedisplayinfo', 'base')
    base_cmd = layers.state('creaturemodeldata', 'base')
    gs_cache: Dict[str, set] = {}
    for key in set(base_cdi) | {k for t, k in wanted_rows if t == 'creaturedisplayinfo'}:
        if key[0] in custom_geo:
            continue                                   # an edit may hide a group on purpose (an absent variant)
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
    # ---- retroports: a pack model that is retail's downported ships OUR conversion of retail's ----------
    stock_dbc = ({k[0]: v for k, v in layers.state('creaturedisplayinfo', 'stock').items()},
                 {k[0]: v for k, v in layers.state('creaturemodeldata', 'stock').items()})
    _retroport_swap(manifest, wanted_rows, base_cdi, base_cmd, ix, report, log, stock_dbc)
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


def _repoint_model(did: int, cu: dict, layers: 'hd.Layers', srcs: dict, want: dict, wanted_rows: dict, ix):
    """An existing display's edit made on a model at another path (cu['path']): repoint the row the display
    ships to a CreatureModelData row naming that path (base / stock first, else the edit's source pack, whose
    row and files then ship too). None when the edit keeps the display's own model (or is a retail edit,
    which _retail_display handles), '' when repointed, else why not."""
    path = ms.norm(str(cu.get('path') or '')).replace('.mdx', '.m2')
    b = cu.get('base') or {}
    if not path or 'retail' in (b.get('sources') or []):
        return None
    row = wanted_rows.get(('creaturedisplayinfo', (did,))) or layers.state('creaturedisplayinfo', 'base').get((did,))
    if not row:
        return None
    mid = int(row.get('model_id') or 0)
    cur = next((r_ for r_ in [wanted_rows.get(('creaturemodeldata', (mid,)))] +
                [layers.state('creaturemodeldata', x).get((mid,)) for x in ['base', 'stock'] + list(srcs)] if r_), None)
    if cur and ms.norm(str(cur.get('model_path') or '')).replace('.mdx', '.m2') == path:
        return None
    sources = [x for x in (b.get('sources') or ['stock']) if x != 'retail'] or ['stock']
    mrow, msrc = None, None
    for x in ['base', 'stock'] + sources:
        mrow = next((r_ for r_ in layers.state('creaturemodeldata', x).values()
                     if ms.norm(str(r_.get('model_path') or '')).replace('.mdx', '.m2') == path), None)
        if mrow:
            msrc = x
            break
    if mrow is None:
        return f'no CreatureModelData row names {path}'
    if msrc not in ('base', 'stock'):
        wanted_rows[('creaturemodeldata', (int(mrow['id']),))] = dict(mrow)
    if path not in ix.stock and want.get(path) is None:
        files = next((ix._src_files(x) for x in sources if x != 'stock' and path in ix._src_files(x)), None)
        if files is None:
            return f'no source ships {path}'
        stem = path[:-3]
        for k, f in files.items():
            if k == path or (k.startswith(stem) and k.endswith(('.skin', '.anim'))):
                want.setdefault(k, f)
    row = dict(row)
    row['model_id'] = int(mrow['id'])
    wanted_rows[('creaturedisplayinfo', (did,))] = row
    return ''


def _new_display(did: int, cu: dict, layers: 'hd.Layers', result: dict, srcs: dict, want: dict,
                 wanted_rows: dict, ix, log) -> str:
    """A new CreatureDisplayInfo row for a display the picker created: a copy of the row its model was
    shown with (cu['base']['display'] - size, sound, scale, blood), on the new id, wearing the edit's
    skins / geosets (layer 3 applies those). A pack-only model brings its CreatureModelData row and
    files. '' when done, else why not."""
    path = ms.norm(str(cu.get('path') or ''))
    b = cu.get('base') or {}
    sources = [x for x in (b.get('sources') or ['stock']) if x != 'retail'] or ['stock']
    for name, rows in [('stock', layers.state('creaturedisplayinfo', 'stock')), ('base', layers.state('creaturedisplayinfo', 'base')),
                       ('live', result['effective_dbc'][0])] + [(n, s.cdi) for n, s in srcs.items()]:
        if (rows.get((did,)) if name in ('stock', 'base') else rows.get(did)):
            return f'display id {did} is already used by {name}'
    tpl_id = int(b.get('display') or 0)
    tpl, src = None, None
    for x in sources + ['base', 'stock']:
        r_ = layers.state('creaturedisplayinfo', x).get((tpl_id,)) if tpl_id else None
        if r_:
            tpl, src = r_, x
            break
    def model_row(rows_, mid_):
        r_ = rows_.get((mid_,))
        return r_ if r_ and ms.norm(str(r_.get('model_path') or '')).replace('.mdx', '.m2') == path else None
    mrow, msrc = None, None
    if tpl:
        mid = int(tpl.get('model_id') or 0)
        for x in ['base', src, 'stock']:
            mrow = model_row(layers.state('creaturemodeldata', x), mid)
            if mrow:
                msrc = x
                break
    if mrow is None:                                   # any row naming the model path
        for x in ['base', 'stock'] + sources:
            mrow = next((r_ for r_ in layers.state('creaturemodeldata', x).values()
                         if ms.norm(str(r_.get('model_path') or '')).replace('.mdx', '.m2') == path), None)
            if mrow:
                msrc = x
                break
    if mrow is None:
        return f'no CreatureModelData row names {path}'
    if tpl is None:
        tpl = next(iter(layers.state('creaturedisplayinfo', 'stock').values()))
        tpl = {k: (0 if isinstance(v, (int, float)) else '') for k, v in tpl.items()}
        tpl.update({'creature_model_scale': 1.0, 'creature_model_alpha': 255})
    if msrc not in ('base', 'stock'):
        wanted_rows[('creaturemodeldata', (int(mrow['id']),))] = dict(mrow)
    if path not in ix.stock and want.get(path) is None:
        files = next((ix._src_files(x) for x in sources if x != 'stock' and path in ix._src_files(x)), None)
        if files is None:
            return f'no source ships {path}'
        stem = path[:-3]
        for k, f in files.items():
            if k == path or (k.startswith(stem) and k.endswith(('.skin', '.anim'))):
                want.setdefault(k, f)
    row = dict(tpl)
    row['id'] = did
    row['model_id'] = int(mrow['id'])
    ext = int(tpl.get('extended_display_info_id') or 0)
    row['extended_display_info_id'] = 0
    if ext:
        # a character model draws its bake row: the clone gets its OWN copy (a later edit to the original's
        # hair / outfit must not reach it), on the highest CreatureDisplayInfoExtra id + 1
        x = None
        for name in [src, 'base', 'stock']:
            x = layers.state('creaturedisplayinfoextra', name).get((ext,)) if name else None
            if x:
                break
        if x is None:
            return f'display {tpl_id} names bake row {ext}, which no source has'
        used = set()
        for name in ['stock', 'base']:
            used |= {k[0] for k in layers.state('creaturedisplayinfoextra', name)}
        used |= set(result.get('effective_char_dbc', ({},))[0])
        used |= {k[1][0] for k in wanted_rows if k[0] == 'creaturedisplayinfoextra'}
        for s_ in srcs.values():
            used |= set(getattr(s_, 'cdx', None) or {})
        nx = max(used) + 1
        x = dict(x)
        x['id'] = nx
        wanted_rows[('creaturedisplayinfoextra', (nx,))] = x
        row['extended_display_info_id'] = nx
    wanted_rows[('creaturedisplayinfo', (did,))] = row
    return ''


def _retroport_swap(manifest: dict, wanted_rows: dict, base_cdi: dict, base_cmd: dict, ix, report: dict,
                    log=print, stock_dbc=None) -> None:
    """lib/retroport: where the shipped .m2 is a pack's RETROPORT of the current retail model (same vertices,
    no added animations), ship our WXL conversion of retail's model instead (.m2 / .skin / .anim at the
    same path: retail's particle blends and gravity, every LOD) and keep the pack's skins and display rows.
    Each display on that model gets geosets that draw on retail's full mesh what the pack's trimmed mesh
    drew (retroport.retroport_nibbles)."""
    from lib import retroport as rp, retail
    rps = rp.retroports(ix.sources, log, stock_dbc=stock_dbc)
    report['retroports'], report['retroport_failed'] = [], {}
    for path, info in sorted(rps.items()):
        e = manifest.get(path)
        if e is None or e.zpak.split('+')[0] not in info['sources']:      # '<pack>+fixed': a particle recipe's output
            continue                                   # the shipped file is stock / another pack / ours
        stem = path[:-3]
        old_skin = manifest.get(stem + '00.skin')
        try:
            files = retail.convert(path, log=lambda *a: None, fdid=info['fdid'] if info.get('retail_path') else None)
        except Exception as ex:                        # never lose the pack's working file over it
            files, why = None, str(ex)[:120]
        if not files or path not in files:
            report['retroport_failed'][path] = 'convert failed' if files is None else 'no model in conversion'
            continue
        for k in [k for k in manifest if k.startswith(stem) and k.endswith(('.skin', '.anim'))
                  and k[len(stem):len(stem) + 1].isdigit() and k not in files]:
            manifest.pop(k)                            # the pack's LOD / anim files retail's conversion replaces
        for k, f in files.items():
            if k.endswith(('.m2', '.skin', '.anim')):
                manifest[k] = hc.Entry('retail-retroport', 'Q', 0, f)
        # geosets: the pack's rows were written for its trimmed mesh
        pmesh = rp.mesh_variants(old_skin.file.read_bytes()) if old_skin is not None else {}
        rmesh = retail.mesh_geosets(info['fdid'])
        mids = {k for k, r in base_cmd.items() if ms.norm(str(r.get('model_path') or '')).replace('.mdx', '.m2') == path}
        mids |= {k for (t, k), r in wanted_rows.items() if t == 'creaturemodeldata' and r and
                 ms.norm(str(r.get('model_path') or '')).replace('.mdx', '.m2') == path}
        nfix = 0
        if rmesh:
            for key in set(base_cdi) | {k for t, k in wanted_rows if t == 'creaturedisplayinfo'}:
                row = wanted_rows.get(('creaturedisplayinfo', key)) or base_cdi.get(key)
                if not row or (int(row.get('model_id') or 0),) not in mids:
                    continue
                cg = int(row.get('creature_geoset_data') or 0)
                new_cg = retail.pack_nibbles(rp.retroport_nibbles(cg, pmesh, rmesh))
                if new_cg != cg:
                    r2 = dict(row)
                    r2['creature_geoset_data'] = new_cg
                    wanted_rows[('creaturedisplayinfo', key)] = r2
                    nfix += 1
        src = e.zpak.split('+')[0]
        report['retroports'].append([path, src, nfix, info.get('extra_verts', {}).get(src, 0),
                                     info.get('added_anims', {}).get(src, [])])
    log(f"  retroports: {len(report['retroports']):,} pack models ship retail's conversion "
        f"({sum(x[2] for x in report['retroports']):,} display geosets translated, "
        f"{len(report['retroport_failed']):,} kept the pack file)")


def _retail_display(did: int, dp: dict, layers: hd.Layers, result: dict, srcs: dict,
                    want: Dict[str, Optional[Path]], wanted_rows: dict, log=print) -> str:
    """Display `did` -> the retail model dp['option'] (converted the WXL way at its OWN path) as
    a new CreatureModelData row on the retail id (a copy of the display's stock model row: a
    remaster keeps the classic size and collision), wearing the picked retail skins dp['skins']
    as retail_<fdid>.blp beside the model. '' when done, else why not."""
    from lib import retail
    tp = ms.norm(str(dp.get('option') or ''))
    by_path, _ = retail.listfile()
    fd = by_path.get(tp, 0)
    if not fd or (dp.get('fdid') and int(dp['fdid']) != fd):
        return f'{tp} is not a retail model file (fdid {dp.get("fdid")})'
    srow = layers.state('creaturedisplayinfo', 'stock').get((did,))
    if not srow:
        return 'not a stock display'
    smodel = layers.state('creaturemodeldata', 'stock').get((int(srow.get('model_id') or 0),))
    if not smodel:
        return 'stock display has no model row'
    mid = retail.model_data_id(fd)
    if not mid:
        return f'retail has no CreatureModelData row for {fd}'
    # the retail id must be free: any row already there must be this same model
    for name, rows in [('stock', layers.state('creaturemodeldata', 'stock')), ('base', layers.state('creaturemodeldata', 'base')),
                       ('live', result['effective_dbc'][1])] + [(n, s.cmd) for n, s in srcs.items()]:
        r_ = rows.get((mid,)) if name in ('stock', 'base') else rows.get(mid)
        if r_ and ms.norm(str(r_.get('model_path') or '')).replace('.mdx', '.m2') != tp:
            return f'CreatureModelData {mid} is taken by {name} ({r_.get("model_path")})'
    files = retail.convert(tp, log)
    if not files or tp not in files:
        return f'convert failed for {tp}'
    for k, f in files.items():
        want[k] = f
    mrow = dict(wanted_rows.get(('creaturemodeldata', (mid,))) or smodel)
    mrow['id'] = mid
    mrow['model_path'] = tp[:-3].replace('/', '\\') + '.mdx'
    wanted_rows[('creaturemodeldata', (mid,))] = mrow
    row = dict(wanted_rows.get(('creaturedisplayinfo', (did,))) or layers.state('creaturedisplayinfo', 'base').get((did,)) or srow)
    row['model_id'] = mid
    mdir = tp.rsplit('/', 1)[0]
    raw = list(dp.get('skins') or [])[:3] + [0, 0, 0]
    # a retroport pack's skin ('pack:<source>:<path>', lib/retroport): it fits retail's model as it is and
    # ships under its own name beside the converted model
    skins = [0 if isinstance(x, str) else int(x or 0) for x in raw]
    for i in range(3):
        name = ''
        if isinstance(raw[i], str) and raw[i].startswith('pack:'):
            _, src, ppath = raw[i].split(':', 2)
            f = srcs[src].assets.get(ppath) if src in srcs else None
            if f is None:
                return f'pack skin {raw[i]} not available'
            name = ppath.rsplit('/', 1)[-1][:-4]
            want[f'{mdir}/{name}.blp'] = f
            row[f'texture_variation_{i + 1}'] = name
            continue
        if skins[i]:
            f = retail.texture_file(skins[i])
            if f is None:
                return f'retail skin {skins[i]} not available'
            name = f'retail_{skins[i]}'
            want[f'{mdir}/{name}.blp'] = f
        row[f'texture_variation_{i + 1}'] = name
    # no explicit geosets: what retail's displays wearing this skin set draw (retail hides an unset group,
    # 3.3.5 would draw every variant - retail.to_335_nibbles)
    row['creature_geoset_data'] = int(dp.get('geosets') or 0) or retail.pack_nibbles(retail.set_nibbles(fd, skins[:3]))
    if dp.get('scale'):
        row['creature_model_scale'] = float(dp['scale'])
    wanted_rows[('creaturedisplayinfo', (did,))] = row
    return ''


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
