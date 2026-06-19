"""Export talent-tree data from the DBC database to a single JSON document.

Powers the public Talent Tree Browser (F-185). The DBC tables involved:

    talenttab  - one row per talent tree (spec). class_mask groups trees into
                 a player class; order_index orders the tabs left-to-right.
    talent     - one cell in a tree's grid. spec_id -> talenttab.id, with
                 tier_id (row) + column_index (column). rank_1..rank_9 hold the
                 spell id for each rank (0 = no such rank). pre_req_talent_* /
                 pre_req_rank_* encode arrows between cells.
    spell      - per-rank spell rows: name, description, tooltip, icon id.
    spellicon  - icon id -> texture path (e.g. Interface\\Icons\\Spell_Foo).

A talent's display name + icon come from its rank-1 spell. Descriptions still
contain $s/$m tokens (resolved client-side by the live game); they are exported
verbatim here so the front-end / a later pass can resolve them.
"""

import json
import re
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from .dbc_utils import DBCConfig, DBCConnection

# class_mask bit -> player class name (3.3.5a). 512 is unused.
CLASS_NAMES = {
    1: "Warrior",
    2: "Paladin",
    4: "Hunter",
    8: "Rogue",
    16: "Priest",
    32: "Death Knight",
    64: "Shaman",
    128: "Mage",
    256: "Warlock",
    1024: "Druid",
}

# Standard Wrath tree dimensions (tier 0-10, column 0-3).
TREE_ROWS = 11
TREE_COLS = 4


def _icon_basename(path: Optional[str]) -> Optional[str]:
    """Reduce a DBC icon texture path to its bare file name.

    'Interface\\Icons\\Spell_Nature_StoneClawTotem' -> 'Spell_Nature_StoneClawTotem'
    The browser maps this to <basename>.png in the exported icon set.
    """
    if not path:
        return None
    # Paths use Windows backslashes; also tolerate forward slashes.
    name = path.replace("\\", "/").rsplit("/", 1)[-1]
    return name or None


def _max_rank(ranks: List[int]) -> int:
    """Count leading non-zero rank spell ids (ranks are contiguous from 1)."""
    n = 0
    for spell_id in ranks:
        if not spell_id:
            break
        n += 1
    return n


# Common value/duration/chance tokens we resolve:
#   $s1 / $S1   effect value (signed)        $m1 min      $M1 max
#   $d          spell duration               $h          proc chance %
# An optional leading number ($12721s1, $54095d) is a cross-spell reference,
# resolved against that spell's data when we have it loaded. The trailing digit
# (effect index) is required for s/m/M and absent for d/h.
_TOKEN_RE = re.compile(r"\$(\d*)(?:([sSmM])([123])|([dh]))")
# Tokens we deliberately leave raw and flag for follow-up: $/1000 divide-math,
# ${...} AP/SP stat scaling, $<descvar>, radii $a, periodic $t/$o, charges $n,
# max-targets $i, etc.
_LEFTOVER_RE = re.compile(r"\$[\w/@<{]")


def _effect_value_range(base: int, die: int) -> Tuple[int, int]:
    """Return (min, max) displayed magnitude for one spell effect.

    3.3.5a convention (see F-164 notes): with die_sides==1 the value is a
    single number base+1; with die_sides>1 it is the inclusive range
    [base+1, base+die]; die_sides==0 degenerates to base. The client renders
    these as absolute values, so callers take abs().
    """
    if die > 1:
        return base + 1, base + die
    # die 0 or 1 -> single value (die 1 -> base+1, die 0 -> base)
    v = base + die
    return v, v


def _format_duration(ms: Optional[int]) -> Optional[str]:
    """Render a base_duration (milliseconds) as the client shows $d.

    Returns None for missing / sentinel (effectively-infinite) durations so the
    token is left raw rather than printing nonsense.
    """
    if not ms or ms <= 0 or ms > 100_000_000:
        return None
    sec = ms / 1000
    if sec >= 60 and sec % 60 == 0:
        return f"{int(sec // 60)} min"
    if sec == int(sec):
        return f"{int(sec)} sec"
    return f"{sec:g} sec"


# --------------------------------------------------------------------------
# SpellDescriptionVariables ($<name>) + inline math (${...}) resolution.
#
# Custom talents (e.g. Earthwarden's Crag Strike) define variables like
#   $perlevel=${($pl-20)*3.0}  $apbonus=${$AP*0.15}  $dmg=${$m1+$<perlevel>+$<apbonus>}
# and reference $<dmg> in the description. We evaluate these as LINEAR forms
# over named player stats: a value is a constant plus coefficients on $AP /
# $sp, so AP/SP-scaling renders as readable text ("211 (+ 15% of Attack
# Power)") rather than a fake fixed number. $pl is fixed at the level cap.
# Anything we can't evaluate (unknown stat, non-linear math) raises and the
# token is left raw.
# --------------------------------------------------------------------------

LEVEL_CAP = 80
_STATS = {"AP": "Attack Power", "sp": "Spell Power"}  # token letters -> label


class _Unresolvable(Exception):
    pass


def _fmt_num(x: float) -> str:
    return str(int(round(x))) if abs(x - round(x)) < 1e-9 else f"{x:.1f}"


def _is_const(lf: Dict[str, float]) -> bool:
    return all(k == "_const" or v == 0 for k, v in lf.items())


def _lf_mul(a, b):
    if _is_const(a):
        s = a.get("_const", 0.0); return {k: v * s for k, v in b.items()}
    if _is_const(b):
        s = b.get("_const", 0.0); return {k: v * s for k, v in a.items()}
    raise _Unresolvable()


def _lf_div(a, b):
    if not _is_const(b) or b.get("_const", 0.0) == 0:
        raise _Unresolvable()
    s = b["_const"]; return {k: v / s for k, v in a.items()}


def _lf_addsub(a, b, sign):
    r = dict(a)
    for k, v in b.items():
        r[k] = r.get(k, 0.0) + sign * v
    return r


_EXPR_TOK = re.compile(r"\s*(\d+\.?\d*|\$<[A-Za-z]\w*>|\$[A-Za-z]+\d*|[()+\-*/])")


def _eval_expr(expr, eff, assigns, seen):
    """Evaluate an expression string to a linear form {_const, AP, sp, ...}."""
    toks, pos = [], 0
    while pos < len(expr):
        m = _EXPR_TOK.match(expr, pos)
        if not m:
            if expr[pos:].strip() == "":
                break
            raise _Unresolvable()
        toks.append(m.group(1)); pos = m.end()

    i = 0

    def atom():
        nonlocal i
        if i >= len(toks):
            raise _Unresolvable()
        tk = toks[i]; i += 1
        if tk == "(":
            v = expr_p()
            if i >= len(toks) or toks[i] != ")":
                raise _Unresolvable()
            i += 1
            return v
        if tk[0].isdigit():
            return {"_const": float(tk)}
        if tk.startswith("$<"):                       # $<name> reference
            name = tk[2:-1]
            if name in seen or name not in assigns:
                raise _Unresolvable()
            return _eval_expr(assigns[name], eff, assigns, seen | {name})
        # $token: $pl / $m1 / $s1 / $M1 / $AP / $sp
        body = tk[1:]
        mm = re.match(r"([A-Za-z]+)(\d*)$", body)
        if not mm:
            raise _Unresolvable()
        letters, digits = mm.group(1), mm.group(2)
        if letters == "pl":
            return {"_const": float(LEVEL_CAP)}
        if letters in ("m", "s", "M") and digits:
            base, die = eff.get(int(digits), (0, 0))
            lo, hi = _effect_value_range(base, die)
            return {"_const": float(hi if letters == "M" else lo)}
        if letters in _STATS:
            return {letters: 1.0}
        raise _Unresolvable()

    def term():
        nonlocal i
        v = atom()
        while i < len(toks) and toks[i] in ("*", "/"):
            op = toks[i]; i += 1
            v = _lf_mul(v, atom()) if op == "*" else _lf_div(v, atom())
        return v

    def expr_p():
        nonlocal i
        v = term()
        while i < len(toks) and toks[i] in ("+", "-"):
            op = toks[i]; i += 1
            v = _lf_addsub(v, term(), 1 if op == "+" else -1)
        return v

    v = expr_p()
    if i != len(toks):
        raise _Unresolvable()
    return v


def _render_lf(lf: Dict[str, float]) -> str:
    const = lf.get("_const", 0.0)
    stat_parts = [f"{_fmt_num(lf[k] * 100)}% of {label}"
                  for k, label in _STATS.items() if lf.get(k)]
    if stat_parts and abs(const) > 1e-9:
        return f"{_fmt_num(abs(const))} (+ {' + '.join(stat_parts)})"
    if stat_parts:
        return " + ".join(stat_parts)
    return _fmt_num(abs(const))


def _parse_descvars(var_text: Optional[str]) -> Dict[str, str]:
    """Parse a spelldescriptionvariables blob into {name: rhs-expression}."""
    assigns: Dict[str, str] = {}
    if not var_text:
        return assigns
    for line in re.split(r"\\n|\n", var_text):
        m = re.match(r"\s*\$([A-Za-z]\w*)\s*=\s*(.+?)\s*$", line)
        if not m:
            continue
        rhs = m.group(2)
        wrap = re.match(r"^\$\{(.*)\}$", rhs)        # strip ${...} wrapper
        assigns[m.group(1)] = wrap.group(1) if wrap else rhs
    return assigns


def _resolve_descvars(text, eff, assigns):
    """Resolve inline ${...} math and $<name> description-variable refs."""
    if not text:
        return text

    def brace(m):
        try:
            return _render_lf(_eval_expr(m.group(1), eff, assigns, set()))
        except _Unresolvable:
            return m.group(0)

    def ref(m):
        name = m.group(1)
        if name not in assigns:
            return m.group(0)
        try:
            return _render_lf(_eval_expr(assigns[name], eff, assigns, {name}))
        except _Unresolvable:
            return m.group(0)

    text = re.sub(r"\$\{([^{}]*)\}", brace, text)
    text = re.sub(r"\$<([A-Za-z]\w*)>", ref, text)
    return text


def _resolve_tokens(text: Optional[str], self_id: int,
                    spells: Dict[int, Dict[str, Any]]) -> Optional[str]:
    """Resolve $s/$m/$M (value), $d (duration) and $h (proc chance) tokens.

    ``spells`` maps spell id -> {"eff": {idx: (base, die)}, "duration": ms,
    "proc": chance}. A token's leading number selects a referenced spell;
    otherwise ``self_id`` is used. Tokens for a spell/effect we don't have are
    left untouched.
    """
    if not text:
        return text

    def repl(m: re.Match) -> str:
        prefix, vkind, idx_str, dkind = m.group(1), m.group(2), m.group(3), m.group(4)
        sid = int(prefix) if prefix else self_id
        sp = spells.get(sid)
        if not sp:
            return m.group(0)

        if vkind:  # $s / $m / $M with effect index
            eff = sp["eff"].get(int(idx_str))
            if eff is None:
                return m.group(0)
            lo, hi = _effect_value_range(*eff)
            lo, hi = abs(lo), abs(hi)
            if vkind in ("s", "S"):
                return str(lo) if lo == hi else f"{lo} to {hi}"
            return str(lo) if vkind == "m" else str(hi)

        if dkind == "d":  # duration
            return _format_duration(sp.get("duration")) or m.group(0)

        # $h proc chance (leave raw when 0 / unset - chance lives elsewhere)
        proc = sp.get("proc")
        return f"{proc}" if proc else m.group(0)

    return _TOKEN_RE.sub(repl, text)


def build_talent_data(config: DBCConfig, database: str = "live") -> Dict[str, Any]:
    """Query the DBC database and return the full talent-browser document.

    Returns a dict shaped as:
        {
          "rows": 11, "cols": 4,
          "icons": ["Spell_Foo", ...],          # every distinct icon basename used
          "classes": [
            {"mask": 1, "name": "Warrior",
             "trees": [
               {"id": 161, "name": "Arms", "order": 0,
                "icon": "...", "background": "WarriorArms",
                "talents": [
                  {"id": 2255, "tier": 0, "column": 0, "max_rank": 3,
                   "name": "...", "icon": "...", "flags": 0,
                   "ranks": [{"rank": 1, "spell_id": 12281,
                              "desc": "...", "tooltip": "..."}, ...],
                   "prereqs": [{"talent_id": 2970, "rank": 4}]}
                ]}
             ]}
          ]
        }
    """
    db_name = getattr(config, database, None) or config.live

    with DBCConnection(config) as dbc:
        conn = dbc.get_connection(db_name)
        cur = conn.cursor(dictionary=True)

        # 1. Trees (player classes only; class_mask 0 = pet/hidden trees).
        cur.execute(
            """
            SELECT tt.id, tt.name_enus, tt.class_mask, tt.order_index,
                   tt.background_file, si.name AS icon_path
            FROM talenttab tt
            LEFT JOIN spellicon si ON si.id = tt.spell_icon
            WHERE tt.class_mask > 0
            ORDER BY tt.class_mask, tt.order_index, tt.id
            """
        )
        tree_rows = cur.fetchall()

        # 2. All talents, joined to their rank-1 spell for name+icon.
        cur.execute(
            """
            SELECT t.id, t.spec_id, t.tier_id, t.column_index, t.flags,
                   t.rank_1, t.rank_2, t.rank_3, t.rank_4, t.rank_5,
                   t.rank_6, t.rank_7, t.rank_8, t.rank_9,
                   t.pre_req_talent_1, t.pre_req_talent_2, t.pre_req_talent_3,
                   t.pre_req_rank_1, t.pre_req_rank_2, t.pre_req_rank_3,
                   s1.spell_name_enus AS name, si.name AS icon_path
            FROM talent t
            LEFT JOIN spell s1 ON s1.id = t.rank_1
            LEFT JOIN spellicon si ON si.id = s1.spell_icon_id
            ORDER BY t.spec_id, t.tier_id, t.column_index
            """
        )
        talent_rows = cur.fetchall()

        # 3. Per-rank spell text + the numeric data (effect points, duration
        #    index, proc chance) needed to resolve tokens.
        rank_spell_ids = set()
        for t in talent_rows:
            for i in range(1, 10):
                sid = t[f"rank_{i}"]
                if sid:
                    rank_spell_ids.add(sid)

        _NUMERIC_COLS = """
            effect_base_points_1, effect_base_points_2, effect_base_points_3,
            effect_die_sides_1, effect_die_sides_2, effect_die_sides_3,
            duration_index, proc_chance, spell_desc_variable_id
        """

        spell_text: Dict[int, Dict[str, Any]] = {}
        if rank_spell_ids:
            id_list = ",".join(str(i) for i in sorted(rank_spell_ids))
            cur.execute(
                f"""
                SELECT id, spell_name_enus, spell_desc_enus, spell_tooltip_enus,
                       {_NUMERIC_COLS}
                FROM spell WHERE id IN ({id_list})
                """
            )
            for s in cur.fetchall():
                spell_text[s["id"]] = s

        # 3b. Cross-spell references ($<id>s1, $<id>d, ...) in rank text: load
        #     numeric data for those spells too so the tokens resolve.
        ref_ids = set()
        for s in spell_text.values():
            for fld in ("spell_desc_enus", "spell_tooltip_enus"):
                for m in re.finditer(r"\$(\d+)[a-zA-Z]", s.get(fld) or ""):
                    ref_ids.add(int(m.group(1)))
        ref_ids -= set(spell_text)
        ref_spells: Dict[int, Dict[str, Any]] = {}
        if ref_ids:
            id_list = ",".join(str(i) for i in sorted(ref_ids))
            cur.execute(
                f"SELECT id, {_NUMERIC_COLS} FROM spell WHERE id IN ({id_list})"
            )
            for s in cur.fetchall():
                ref_spells[s["id"]] = s

        # 3c. Resolve duration_index -> base_duration (ms) for everything loaded.
        dur_indices = {
            s["duration_index"]
            for s in list(spell_text.values()) + list(ref_spells.values())
            if s.get("duration_index")
        }
        dur_ms: Dict[int, int] = {}
        if dur_indices:
            id_list = ",".join(str(i) for i in sorted(dur_indices))
            cur.execute(
                f"SELECT id, base_duration FROM spellduration WHERE id IN ({id_list})"
            )
            for d in cur.fetchall():
                dur_ms[d["id"]] = d["base_duration"]

        # 3d. SpellDescriptionVariables ($<name> blocks) for rank spells that
        #     reference them (e.g. custom Earthwarden talents).
        dv_ids = {
            s["spell_desc_variable_id"] for s in spell_text.values()
            if s.get("spell_desc_variable_id")
        }
        descvar_assigns: Dict[int, Dict[str, str]] = {}
        if dv_ids:
            id_list = ",".join(str(i) for i in sorted(dv_ids))
            cur.execute(
                f"SELECT id, `var` FROM spelldescriptionvariables WHERE id IN ({id_list})"
            )
            for d in cur.fetchall():
                descvar_assigns[d["id"]] = _parse_descvars(d["var"])

        cur.close()

    # Token-resolution context for every spell we loaded (ranks + cross-refs).
    spell_ctx: Dict[int, Dict[str, Any]] = {}
    for sid, s in {**ref_spells, **spell_text}.items():
        di = s.get("duration_index")
        dv = s.get("spell_desc_variable_id")
        spell_ctx[sid] = {
            "eff": {
                idx: (s.get(f"effect_base_points_{idx}") or 0,
                      s.get(f"effect_die_sides_{idx}") or 0)
                for idx in (1, 2, 3)
            },
            "duration": dur_ms.get(di) if di else None,
            "proc": s.get("proc_chance"),
            "assigns": descvar_assigns.get(dv, {}) if dv else {},
        }

    # Group talents by tree.
    talents_by_tree: Dict[int, List[dict]] = {}
    icons: set = set()
    n_with_tokens = 0      # ranks whose raw text had at least one $token
    n_unresolved = 0       # ranks still holding a $token after resolution
    for t in talent_rows:
        rank_ids = [t[f"rank_{i}"] for i in range(1, 10)]
        max_rank = _max_rank(rank_ids)

        ranks = []
        for i in range(max_rank):
            sid = rank_ids[i]
            txt = spell_text.get(sid, {})
            raw_desc = txt.get("spell_desc_enus")
            raw_tip = txt.get("spell_tooltip_enus")
            # descvar/inline-math pass first (handles $<name> + ${...}), then
            # the per-token pass ($s/$m/$M/$d/$h, incl. cross-spell refs).
            ctx = spell_ctx.get(sid, {})
            eff, assigns = ctx.get("eff", {}), ctx.get("assigns", {})
            desc = _resolve_tokens(_resolve_descvars(raw_desc, eff, assigns), sid, spell_ctx)
            tooltip = _resolve_tokens(_resolve_descvars(raw_tip, eff, assigns), sid, spell_ctx)

            for raw in (raw_desc, raw_tip):
                if raw and "$" in raw:
                    n_with_tokens += 1
                    break
            for resolved in (desc, tooltip):
                if resolved and _LEFTOVER_RE.search(resolved):
                    n_unresolved += 1
                    break

            ranks.append({
                "rank": i + 1,
                "spell_id": sid,
                "desc": desc,
                "tooltip": tooltip,
            })

        prereqs = []
        for i in range(1, 4):
            pre = t[f"pre_req_talent_{i}"]
            if pre:
                prereqs.append({"talent_id": pre, "rank": t[f"pre_req_rank_{i}"]})

        icon = _icon_basename(t["icon_path"])
        if icon:
            icons.add(icon)

        talents_by_tree.setdefault(t["spec_id"], []).append({
            "id": t["id"],
            "tier": t["tier_id"],
            "column": t["column_index"],
            "max_rank": max_rank,
            "name": t["name"],
            "icon": icon,
            "flags": t["flags"],
            "ranks": ranks,
            "prereqs": prereqs,
        })

    # Group trees by class.
    classes: Dict[int, dict] = {}
    for tr in tree_rows:
        mask = tr["class_mask"]
        cls = classes.get(mask)
        if cls is None:
            cls = {
                "mask": mask,
                "name": CLASS_NAMES.get(mask, f"Class {mask}"),
                "trees": [],
            }
            classes[mask] = cls

        tree_icon = _icon_basename(tr["icon_path"])
        if tree_icon:
            icons.add(tree_icon)

        cls["trees"].append({
            "id": tr["id"],
            "name": tr["name_enus"],
            "order": tr["order_index"],
            "icon": tree_icon,
            "background": tr["background_file"],
            "talents": talents_by_tree.get(tr["id"], []),
        })

    return {
        "rows": TREE_ROWS,
        "cols": TREE_COLS,
        "icons": sorted(icons),
        "classes": [classes[m] for m in sorted(classes)],
        "_tokens": {
            "ranks_with_tokens": n_with_tokens,
            "ranks_unresolved": n_unresolved,
        },
    }


def export_talents(config: DBCConfig, out_path: Path, database: str = "live",
                   indent: Optional[int] = None) -> Dict[str, Any]:
    """Build the talent document and write it to out_path as JSON.

    Returns the document (so callers can report counts).
    """
    data = build_talent_data(config, database=database)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=indent)
    return data


# =============================================================================
# Icon export (BLP -> PNG) for the Talent Tree Browser
# =============================================================================

def _default_icon_dirs() -> List[Path]:
    """Icon source directories, highest priority first.

    Custom zpak icons override the stock client set so reskinned/custom talent
    icons win. Stock icons come from the WoW Spell Editor tool's icon dump
    (the Asset Library's interface/icons does NOT carry the stock set).
    """
    craft_root = Path(__file__).resolve().parents[2]      # .../Zeppelin-Craft
    tools_root = craft_root.parent / "Zeppelin-Tools"
    return [
        craft_root / "zpaks/patch-custom-icons/mpq/source-assets/Interface/Icons",
        craft_root / "zpaks/mod-worgoblin/mpq/source-assets/Interface/Icons",
        tools_root / "WoW Spell Editor/Interface/Icons",
    ]


def build_icon_index(dirs: Optional[List[Path]] = None) -> Dict[str, Path]:
    """Map lowercased icon name -> BLP path. Earlier dirs win (custom first)."""
    dirs = dirs if dirs is not None else _default_icon_dirs()
    index: Dict[str, Path] = {}
    for d in dirs:
        if not d.is_dir():
            continue
        for f in d.iterdir():
            if f.suffix.lower() == ".blp":
                index.setdefault(f.stem.lower(), f)
    return index


def export_icons(icon_names: List[str], out_dir: Path,
                 dirs: Optional[List[Path]] = None,
                 overwrite: bool = False) -> Dict[str, List[str]]:
    """Convert each needed icon from BLP to PNG in out_dir.

    File names preserve the exact casing used in the talent JSON (e.g.
    ``Spell_Nature_StoneClawTotem.png``) so the front-end can request them
    verbatim on a case-sensitive web server.

    Returns {"converted": [...], "missing": [...], "failed": [...]} where
    missing = no source BLP found, failed = source found but decode/save error.
    """
    from PIL import Image  # Pillow ships a BLP decoder

    index = build_icon_index(dirs)
    out_dir = Path(out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    converted: List[str] = []
    missing: List[str] = []
    failed: List[str] = []

    for name in icon_names:
        src = index.get(name.lower())
        if src is None:
            missing.append(name)
            continue
        dst = out_dir / f"{name}.png"
        if dst.exists() and not overwrite:
            converted.append(name)
            continue
        try:
            with Image.open(src) as im:
                im.convert("RGBA").save(dst, "PNG")
            converted.append(name)
        except Exception:
            failed.append(name)

    return {"converted": converted, "missing": missing, "failed": failed}
