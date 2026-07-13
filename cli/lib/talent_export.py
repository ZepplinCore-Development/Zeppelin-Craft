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
import shutil
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from .dbc_utils import DBCConfig, DBCConnection
from .tooltip_gen import miscvalue_stat_scaling

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


# Single-token references. Optional $/N; divide prefix, optional cross-spell id,
# then one of: indexed value/radius/tick/chain (letter + effect index 1-3),
# duration $d/$D, or scalar $h/$n/$i/$u. Examples:
#   $s1 $m1 $M1 $o1   effect value      $/1000;s1   value / 1000 (decimal)
#   $a1               radius (yards)    $t1 $T1     periodic tick (seconds)
#   $x1               chain targets     $d $D       duration
#   $h $n $i $u       chance/charges/max-targets/stacks   $12721s1  cross-spell
_TOKEN_RE = re.compile(
    r"\$(?:/(\d+);)?(\d*)(?:([sSmMoOaAtTxXb])([123])|([dD])|([hniu]))"
)
# Tokens still left raw and flagged for follow-up: ${...} stat scaling we can't
# name, $<descvar> we can't evaluate, gender $g/$G, pluralization $l, etc.
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
# token letters -> readable label for stat-scaling terms. Several spell-power
# variants (sp/SP/SPH) and weapon-damage variants (mw/MW) collapse to one label.
_STATS = {
    "AP": "Attack Power",
    "RAP": "Ranged Attack Power",
    "sp": "Spell Power", "SP": "Spell Power", "SPH": "Spell Power",
    "mw": "weapon damage", "MW": "weapon damage",
    "blockvalue": "Block Value", "armor": "Armor",
    "strength": "Strength", "agility": "Agility", "stamina": "Stamina",
    "intellect": "Intellect", "spirit": "Spirit", "maxhealth": "max Health",
}

# F-188 ZepStatScalingStat name -> _STATS linear-form key. SCHOOL_DAMAGE effects
# with MiscValueB carry stat scaling on the spell itself (single source of truth);
# we inject it into the $s/$m value so the rendered damage shows "(+ X% of <stat>)"
# even when the description has no $AP/$sp token (mirrors the F-190 addon).
_ZEPSTAT_TO_LF = {
    "ATTACK_POWER": "AP", "SPELL_POWER": "sp", "BLOCK_VALUE": "blockvalue",
    "ARMOR": "armor", "STRENGTH": "strength", "AGILITY": "agility",
    "STAMINA": "stamina", "INTELLECT": "intellect", "SPIRIT": "spirit",
    "MAX_HEALTH": "maxhealth",
}


class _Unresolvable(Exception):
    pass


def _fmt_num(x: float, prec: Optional[int] = None) -> str:
    if prec is not None:                               # WoW ${...}.N precision
        s = f"{x:.{prec}f}"
        return s.rstrip("0").rstrip(".") if "." in s else s
    return str(int(round(x))) if abs(x - round(x)) < 1e-9 else f"{x:g}"


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


# Indexed numeric tokens that read a value off the spell context (effect index
# 1-3). s/S/m/o/O -> effect min value; M -> effect max; a -> radius (yards);
# t/T -> periodic tick (seconds); x/X -> chain targets.
def _perlevel(ctx: Dict[str, Any], idx: int) -> float:
    """Per-level scaling at the level cap: real_points_per_level * (80 - base_level).
    Spells without per-level scaling (most auras) contribute 0, unchanged."""
    ppl = ctx.get("ppl", {}).get(idx, 0.0)
    if not ppl:
        return 0.0
    return float(ppl) * max(0, LEVEL_CAP - int(ctx.get("base_level", 0) or 0))


def _scale_suffix(ctx: Dict[str, Any], idx: int) -> str:
    """' (+ A% of X + B% of Y)' for an effect carrying stat scaling -- stock
    spell_bonus_data and/or F-188 MiscValue -- else ''. Mirrors the F-190 addon:
    the coefficient lives on the spell, so descriptions use plain $s/$m tokens."""
    terms = ctx.get("scale", {}).get(idx)
    if not terms:
        return ""
    parts = [f"{_fmt_num(c * 100)}% of {_STATS.get(k, k)}" for k, c in terms if k and c]
    return f" (+ {' + '.join(parts)})" if parts else ""


def _build_scale(s: Dict[str, Any], bonus: Optional[Dict]) -> Dict[int, list]:
    """Per-effect stat scaling {eff_idx: [(lf_key, coeff), ...]} from two sources:
      - F-188 MiscValue (custom stats: block value, armor, AP, ...), per effect.
      - stock spell_bonus_data (acore_world): direct_bonus->SP / ap_bonus->AP on the
        direct SCHOOL_DAMAGE effect; dot_bonus / ap_dot_bonus on the periodic effect.
    The F-188 migration removes the spell_bonus_data row, so a spell normally has one
    source; both are merged here defensively."""
    scale: Dict[int, list] = {}
    for e in miscvalue_stat_scaling(s):
        key = _ZEPSTAT_TO_LF.get(e["stat"])
        if key:
            scale.setdefault(e["eff"], []).append((key, e["coeff"]))
    if bonus:
        direct = next((i for i in (1, 2, 3) if s.get(f"effect_{i}") == 2), None)
        dot = next((i for i in (1, 2, 3)
                    if s.get(f"effect_{i}") == 6
                    and s.get(f"effect_apply_aura_name_{i}") == 3), None)
        if direct:
            for key, col in (("AP", "ap_bonus"), ("sp", "direct_bonus")):
                c = float(bonus.get(col) or 0)
                if c:
                    scale.setdefault(direct, []).append((key, c))
        if dot:
            for key, col in (("AP", "ap_dot_bonus"), ("sp", "dot_bonus")):
                c = float(bonus.get(col) or 0)
                if c:
                    scale.setdefault(dot, []).append((key, c))
    return scale


def _world_conn():
    """pymysql connection to acore_world, or None on any failure. The world DB is
    optional for the browser -- MiscValue + desc tokens still render without it."""
    try:
        import os
        import pymysql
        from dotenv import load_dotenv
        load_dotenv(Path(__file__).resolve().parents[1] / ".env")
        return pymysql.connect(
            host=os.getenv("DB_HOST", "192.168.0.55"),
            port=int(os.getenv("DB_PORT", "3306")),
            user=os.getenv("DB_USER", "acore"),
            passwd=os.getenv("DB_PASS", "acore"),
            db="acore_world",
            cursorclass=pymysql.cursors.DictCursor,
        )
    except Exception:
        return None


def _world_bonus_data(spell_ids) -> Dict[int, Dict]:
    """Stock spell_bonus_data (acore_world) SP/AP coefficients for the given spells."""
    if not spell_ids:
        return {}
    conn = _world_conn()
    if conn is None:
        return {}
    try:
        out: Dict[int, Dict] = {}
        with conn.cursor() as cur:
            ids = ",".join(str(int(i)) for i in spell_ids)
            cur.execute(
                "SELECT entry, direct_bonus, ap_bonus, dot_bonus, ap_dot_bonus "
                f"FROM spell_bonus_data WHERE entry IN ({ids})"
            )
            for r in cur.fetchall():
                out[r["entry"]] = r
        conn.close()
        return out
    except Exception:
        return {}


def _resolve_top_ranks(spell_ids) -> Dict[int, int]:
    """Follow the stock spell_ranks chain (acore_world) to the highest-rank spell in
    each input spell's chain. Returns {spell_id: top_spell_id} only where a higher
    rank exists -- so an ability-granting talent (which grants rank 1) is displayed
    at its endgame trained rank. {} if no chain / world DB unreachable."""
    if not spell_ids:
        return {}
    conn = _world_conn()
    if conn is None:
        return {}
    try:
        out: Dict[int, int] = {}
        with conn.cursor() as cur:
            ids = ",".join(str(int(i)) for i in spell_ids)
            cur.execute(
                f"SELECT spell_id, first_spell_id FROM spell_ranks WHERE spell_id IN ({ids})"
            )
            firsts = {r["spell_id"]: r["first_spell_id"] for r in cur.fetchall()}
            if firsts:
                chains = ",".join(str(int(c)) for c in set(firsts.values()))
                cur.execute(
                    "SELECT first_spell_id, spell_id, `rank` FROM spell_ranks "
                    f"WHERE first_spell_id IN ({chains})"
                )
                top: Dict[int, tuple] = {}
                for r in cur.fetchall():
                    fs = r["first_spell_id"]
                    if fs not in top or r["rank"] > top[fs][0]:
                        top[fs] = (r["rank"], r["spell_id"])
                for sid, fs in firsts.items():
                    tid = top.get(fs, (0, sid))[1]
                    if tid != sid:
                        out[sid] = tid
        conn.close()
        return out
    except Exception:
        return {}


def _token_value(ctx: Dict[str, Any], letter: str, idx: int) -> Optional[float]:
    if letter in ("s", "S", "m", "o", "O"):
        base, die = ctx.get("eff", {}).get(idx, (0, 0))
        return float(_effect_value_range(base, die)[0])
    if letter == "M":
        base, die = ctx.get("eff", {}).get(idx, (0, 0))
        return float(_effect_value_range(base, die)[1])
    if letter in ("a", "A"):
        r = ctx.get("radius", {}).get(idx)
        return float(r) if r is not None else None
    if letter in ("t", "T"):
        ms = ctx.get("amp", {}).get(idx)
        return ms / 1000.0 if ms else None
    if letter in ("x", "X"):
        return ctx.get("chain", {}).get(idx)
    if letter == "b":                                  # points per combo point
        return ctx.get("combo", {}).get(idx)
    return None


# Non-indexed scalar tokens. h -> proc chance %, n -> charges, i -> max
# affected targets, u -> max stacks.
def _token_scalar(ctx: Dict[str, Any], letter: str) -> Optional[float]:
    return {"h": ctx.get("proc"), "n": ctx.get("charges"),
            "i": ctx.get("max_targets"), "u": ctx.get("stacks")}.get(letter)


_EXPR_TOK = re.compile(
    r"\s*(\d+\.?\d*|\$<[A-Za-z]\w*>|\$\d+[A-Za-z]+\d*|\$[A-Za-z]+\d*|[()+\-*/])"
)


def _eval_expr(expr, ctx, spells, assigns, seen):
    """Evaluate an expression string to a linear form {_const, AP, sp, ...}.

    ``ctx`` is the spell's own resolution context; ``spells`` is the full
    {id: ctx} map so cross-spell refs ($900166m1) inside ${...} can resolve."""
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
        if tk in ("+", "-"):                           # unary sign
            v = atom()
            return v if tk == "+" else {k: -val for k, val in v.items()}
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
            return _eval_expr(assigns[name], ctx, spells, assigns, seen | {name})
        body = tk[1:]
        cross = re.match(r"(\d+)([A-Za-z]+)(\d*)$", body)  # $<id><letter><idx>
        if cross:
            ref = spells.get(int(cross.group(1)))
            v = _token_value(ref, cross.group(2), int(cross.group(3) or 0)) if ref else None
            if v is None:
                raise _Unresolvable()
            return {"_const": float(v)}
        # $token: $pl / $m1 / $s1 / $M1 / $a1 / $x1 / $i / $AP / $sp / ...
        mm = re.match(r"([A-Za-z]+)(\d*)$", body)
        if not mm:
            raise _Unresolvable()
        letters, digits = mm.group(1), mm.group(2)
        if letters == "pl":
            return {"_const": float(LEVEL_CAP)}
        if letters in _STATS:                          # stat-scaling term
            return {letters: 1.0}
        if digits and len(letters) == 1:               # indexed numeric token
            v = _token_value(ctx, letters, int(digits))
            if v is None:
                raise _Unresolvable()
            # NOTE: stat scaling (MiscValue / spell_bonus_data) is injected only in
            # the bare-token pass (_resolve_tokens), not here, so desc variables that
            # already express scaling via $AP / manual per-level don't double-count.
            return {"_const": float(v)}
        if not digits and letters in ("i", "n", "u", "h"):
            v = _token_scalar(ctx, letters)
            if v is None:
                raise _Unresolvable()
            return {"_const": float(v)}
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


def _render_lf(lf: Dict[str, float], prec: Optional[int] = None) -> str:
    const = lf.get("_const", 0.0)
    by_label: Dict[str, float] = {}                    # merge sp/SP/SPH, mw/MW
    for k, label in _STATS.items():
        c = lf.get(k)
        if c:
            by_label[label] = by_label.get(label, 0.0) + c
    stat_parts = [f"{_fmt_num(c * 100)}% of {label}" for label, c in by_label.items()]
    if stat_parts and abs(const) > 1e-9:
        return f"{_fmt_num(abs(const))} (+ {' + '.join(stat_parts)})"
    if stat_parts:
        return " + ".join(stat_parts)
    return _fmt_num(abs(const), prec)


def _parse_descvars(var_text: Optional[str]) -> Dict[str, str]:
    """Parse a spelldescriptionvariables blob into {name: rhs-expression}."""
    assigns: Dict[str, str] = {}
    if not var_text:
        return assigns
    for line in re.split(r"\\n|\n", var_text):
        m = re.match(r"\s*\$([A-Za-z]\w*)\s*=\s*(.+?)\s*$", line)
        if not m:
            continue
        rhs = _resolve_conditionals(m.group(2))      # collapse $?a/$?s glyph/talent conds
        wrap = re.match(r"^\$\{(.*)\}$", rhs)        # strip ${...} wrapper
        assigns[m.group(1)] = wrap.group(1) if wrap else rhs
    return assigns


def _resolve_descvars(text, ctx, spells, assigns):
    """Resolve inline ${...} math and $<name> description-variable refs."""
    if not text:
        return text

    def brace(m):
        prec = int(m.group(2)) if m.group(2) else None
        try:
            return _render_lf(_eval_expr(m.group(1), ctx, spells, assigns, set()), prec)
        except _Unresolvable:
            return m.group(0)

    def ref(m):
        name = m.group(1)
        if name not in assigns:
            return m.group(0)
        try:
            return _render_lf(_eval_expr(assigns[name], ctx, spells, assigns, {name}))
        except _Unresolvable:
            return m.group(0)

    # ${...} optionally followed by WoW's .N decimal-precision suffix
    text = re.sub(r"\$\{([^{}]*)\}(?:\.(\d))?", brace, text)
    text = re.sub(r"\$<([A-Za-z]\w*)>", ref, text)
    return text


def _resolve_grammar(text: Optional[str]) -> Optional[str]:
    """Resolve grammatical tokens: $l<sing>:<plur>; and $g<male>:<female>;.

    Plurals pick by the preceding number (1 -> singular, else plural); gender
    defaults to the first (male) form since the viewer has no character.
    """
    if not text:
        return text

    def plural(m):
        num, gap, sing, plur = m.groups()
        return f"{num}{gap}{sing if num == '1' else plur}"

    text = re.sub(r"(\d+)(\s*)\$[lL]([^:;]*):([^;]*);", plural, text)
    text = re.sub(r"\$[lL]([^:;]*):([^;]*);", lambda m: m.group(2), text)   # bare -> plural
    text = re.sub(r"\$[gG]([^:;]*):([^;]*);", lambda m: m.group(1), text)   # gender -> male
    return text


# $?<cond>[A][B] conditional: has-aura ($?a<id>), knows-spell ($?s<id>), etc. The
# viewer has no character, so we render the FALSE branch B -- the base case shown
# in-game before any glyph/talent applies (e.g. Earth Shield's $<heal> picks $m1, not
# the Glyph-of-Earth-Shield $m1*1.2). A one-branch $?<cond>[A] yields '' when false.
# The condition part is matched as any non-bracket text so compound/negated forms
# ($?!s123, $?s1&s2) collapse too; iterated so nested conditionals resolve inside-out.
_COND_RE = re.compile(r"\$\?[^\[\]]+(\[[^\[\]]*\])(\[[^\[\]]*\])?")


def _resolve_conditionals(text: Optional[str]) -> Optional[str]:
    if not text:
        return text
    prev = None
    while prev != text:
        prev = text
        text = _COND_RE.sub(lambda m: m.group(2)[1:-1] if m.group(2) else "", text)
    return text


def _resolve_tokens(text: Optional[str], self_id: int,
                    spells: Dict[int, Dict[str, Any]]) -> Optional[str]:
    """Resolve single-token references against the spell context.

    Handles an optional ``$/N;`` divide prefix and optional cross-spell id, then:
    value $s/$S/$m/$M/$o (effect), radius $a, periodic $t/$T, chain $x,
    duration $d/$D, and scalars $h/$n/$i/$u. A token's leading number selects a
    referenced spell; otherwise ``self_id`` is used. Anything we lack is left raw.
    """
    if not text:
        return text

    def repl(m: re.Match) -> str:
        div = int(m.group(1)) if m.group(1) else None
        sid = int(m.group(2)) if m.group(2) else self_id
        sp = spells.get(sid)
        if not sp:
            return m.group(0)
        ind, idx_s, dur, scalar = m.group(3), m.group(4), m.group(5), m.group(6)

        if ind:                                        # indexed token
            idx = int(idx_s)
            # plain $s/$S renders a min..max range (when not divided)
            if ind in ("s", "S") and div is None:
                eff = sp.get("eff", {}).get(idx)
                if eff is None:
                    return m.group(0)
                lo, hi = _effect_value_range(*eff)
                pl = _perlevel(sp, idx)                 # per-level @ level cap (80)
                lo, hi = abs(lo) + pl, abs(hi) + pl
                out = _fmt_num(lo) if lo == hi else f"{_fmt_num(lo)} to {_fmt_num(hi)}"
                return out + _scale_suffix(sp, idx)
            v = _token_value(sp, ind, idx)
            if v is None:
                return m.group(0)
            if ind in ("s", "S", "m", "M", "o", "O") and not div:
                v += _perlevel(sp, idx)            # per-level @ level cap (80)
            if div:
                v /= div
            out = _fmt_num(abs(v) if ind in ("s", "S", "m", "M", "o", "O") else v)
            if ind in ("s", "S", "m", "M", "o", "O") and not div:
                out += _scale_suffix(sp, idx)
            return out

        if dur:                                        # $d / $D duration
            return _format_duration(sp.get("duration")) or m.group(0)

        v = _token_scalar(sp, scalar)                  # $h / $n / $i / $u
        if v is None:                                  # 0 is a real value (e.g. chargeless $n)
            return m.group(0)
        if div:
            v /= div
        return _fmt_num(v)

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

        # Follow the spell_ranks chain to the highest trained rank, so an ability-
        # granting talent shows its endgame value (e.g. Aimed Shot rank 1 -> rank 9),
        # not the rank-1 it grants. We fetch + render the top rank's text/values.
        top_rank = _resolve_top_ranks(rank_spell_ids)
        rank_spell_ids |= set(top_rank.values())

        _NUMERIC_COLS = """
            effect_base_points_1, effect_base_points_2, effect_base_points_3,
            effect_die_sides_1, effect_die_sides_2, effect_die_sides_3,
            effect_radius_index_1, effect_radius_index_2, effect_radius_index_3,
            effect_amplitude_1, effect_amplitude_2, effect_amplitude_3,
            effect_chain_target_1, effect_chain_target_2, effect_chain_target_3,
            effect_points_per_combo_point_1, effect_points_per_combo_point_2,
            effect_points_per_combo_point_3,
            max_affected_targets, proc_charges, stack_amount,
            duration_index, proc_chance, spell_desc_variable_id,
            effect_real_points_per_level_1, effect_real_points_per_level_2,
            effect_real_points_per_level_3, base_level,
            effect_1, effect_2, effect_3,
            effect_apply_aura_name_1, effect_apply_aura_name_2, effect_apply_aura_name_3,
            effect_misc_value_a_1, effect_misc_value_a_2, effect_misc_value_a_3,
            effect_misc_value_b_1, effect_misc_value_b_2, effect_misc_value_b_3
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

        # 3b. SpellDescriptionVariables ($<name> blocks) for rank spells that
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

        # 3c. Cross-spell references ($<id>X, $/N;<id>X) in rank text OR inside
        #     a descvar definition: load those spells' numeric data too.
        ref_re = re.compile(r"\$(?:/\d+;)?(\d+)[a-zA-Z]")
        ref_ids = set()
        for s in spell_text.values():
            for fld in ("spell_desc_enus", "spell_tooltip_enus"):
                ref_ids.update(int(x) for x in ref_re.findall(s.get(fld) or ""))
        for assigns in descvar_assigns.values():
            for expr in assigns.values():
                ref_ids.update(int(x) for x in ref_re.findall(expr))
        ref_ids -= set(spell_text)
        ref_spells: Dict[int, Dict[str, Any]] = {}
        if ref_ids:
            id_list = ",".join(str(i) for i in sorted(ref_ids))
            cur.execute(
                f"SELECT id, {_NUMERIC_COLS} FROM spell WHERE id IN ({id_list})"
            )
            for s in cur.fetchall():
                ref_spells[s["id"]] = s

        # 3d. Resolve duration_index -> base_duration (ms) for everything loaded.
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

        # 3e. Resolve effect_radius_index -> radius (yards) for $a tokens.
        rad_indices = {
            s[f"effect_radius_index_{i}"]
            for s in list(spell_text.values()) + list(ref_spells.values())
            for i in (1, 2, 3) if s.get(f"effect_radius_index_{i}")
        }
        radius_yd: Dict[int, float] = {}
        if rad_indices:
            id_list = ",".join(str(i) for i in sorted(rad_indices))
            cur.execute(
                f"SELECT id, radius FROM spellradius WHERE id IN ({id_list})"
            )
            for d in cur.fetchall():
                radius_yd[d["id"]] = float(d["radius"])

        cur.close()

    # Stock spell_bonus_data (acore_world) SP/AP coeffs for everything loaded.
    bonus_rows = _world_bonus_data(set(spell_text) | set(ref_spells))

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
            "ppl": {
                idx: (s.get(f"effect_real_points_per_level_{idx}") or 0.0)
                for idx in (1, 2, 3)
            },
            "base_level": s.get("base_level") or 0,
            "scale": _build_scale(s, bonus_rows.get(sid)),
            "radius": {
                idx: radius_yd[ri] for idx in (1, 2, 3)
                if (ri := s.get(f"effect_radius_index_{idx}")) in radius_yd
            },
            "amp": {
                idx: s[f"effect_amplitude_{idx}"] for idx in (1, 2, 3)
                if s.get(f"effect_amplitude_{idx}")
            },
            "chain": {
                idx: s[f"effect_chain_target_{idx}"] for idx in (1, 2, 3)
                if s.get(f"effect_chain_target_{idx}")
            },
            "combo": {
                idx: s[f"effect_points_per_combo_point_{idx}"] for idx in (1, 2, 3)
                if s.get(f"effect_points_per_combo_point_{idx}")
            },
            "max_targets": s.get("max_affected_targets"),
            "charges": s.get("proc_charges"),
            "stacks": s.get("stack_amount"),
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
            disp = top_rank.get(sid, sid)        # render the highest trained rank
            txt = spell_text.get(disp, {})
            raw_desc = txt.get("spell_desc_enus")
            raw_tip = txt.get("spell_tooltip_enus")
            # Per-token pass first ($s/$a/$t/$d/... incl. cross-spell refs) so
            # that refs nested inside ${...} math become plain numbers; then the
            # descvar/inline-math pass ($<name> + ${...}). $<name>/${...}/$AP are
            # untouched by the token pass, so order is safe.
            ctx = spell_ctx.get(disp, {})
            assigns = ctx.get("assigns", {})
            desc = _resolve_grammar(_resolve_descvars(
                _resolve_tokens(_resolve_conditionals(raw_desc), disp, spell_ctx), ctx, spell_ctx, assigns))
            tooltip = _resolve_grammar(_resolve_descvars(
                _resolve_tokens(_resolve_conditionals(raw_tip), disp, spell_ctx), ctx, spell_ctx, assigns))

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


def sync_editor_icons(config: DBCConfig, out_dir: Path,
                      database: str = "live",
                      overwrite: bool = False) -> Dict[str, List[str]]:
    """Sync the desktop TalentEditor's on-disk custom-icon overlay.

    The editor only ever renders icons referenced by talents, so this converts
    just that set (~hundreds) rather than the whole custom icon pack. Only icons
    found in the CUSTOM zpak dirs are written — stock icons are already embedded
    in the editor binary and come back as "missing" here (skipped, not an error).

    The editor reads this folder (``custom_icons/`` next to its binary) at runtime
    and overlays it on the embedded set, so new custom talent icons appear without
    rebuilding the editor. PNG names preserve the BLP stem casing; editor lookup
    is case-insensitive. Returns export_icons' {"converted","missing","failed"}.
    """
    data = build_talent_data(config, database=database)
    icon_names = data["icons"]                       # talent-referenced names only
    custom_dirs = [d for d in _default_icon_dirs() if "zpaks" in str(d)]
    return export_icons(icon_names, Path(out_dir), dirs=custom_dirs, overwrite=overwrite)


def deploy_site(src_dir: Path, dest_dir: Path, config: DBCConfig,
                database: str = "live", overwrite_icons: bool = False) -> Dict[str, Any]:
    """Deploy the full talent browser to dest_dir.

    Copies the static front-end (index.html + css/ + js/) from src_dir, then
    regenerates data/talents.json + data/icons from the DBC database. Returns
    {"data": <doc>, "icons": <export_icons result>} for caller reporting.
    """
    src_dir, dest_dir = Path(src_dir), Path(dest_dir)
    dest_dir.mkdir(parents=True, exist_ok=True)

    shutil.copy2(src_dir / "index.html", dest_dir / "index.html")
    for sub in ("css", "js"):
        d = dest_dir / sub
        if d.exists():
            shutil.rmtree(d)
        shutil.copytree(src_dir / sub, d)

    data_dir = dest_dir / "data"
    data = export_talents(config, data_dir / "talents.json", database=database)
    icons = export_icons(data["icons"], data_dir / "icons", overwrite=overwrite_icons)
    return {"data": data, "icons": icons}
