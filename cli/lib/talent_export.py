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
            duration_index, proc_chance
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

        cur.close()

    # Token-resolution context for every spell we loaded (ranks + cross-refs).
    spell_ctx: Dict[int, Dict[str, Any]] = {}
    for sid, s in {**ref_spells, **spell_text}.items():
        di = s.get("duration_index")
        spell_ctx[sid] = {
            "eff": {
                idx: (s.get(f"effect_base_points_{idx}") or 0,
                      s.get(f"effect_die_sides_{idx}") or 0)
                for idx in (1, 2, 3)
            },
            "duration": dur_ms.get(di) if di else None,
            "proc": s.get("proc_chance"),
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
            desc = _resolve_tokens(raw_desc, sid, spell_ctx)
            tooltip = _resolve_tokens(raw_tip, sid, spell_ctx)

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
