"""Talent point-distribution audit (custom spec vs stock 3.3.5a).

Compares a talent tree's points-per-row and total against the stock average,
computed live from ``original_dbc`` (the 30 player class trees) so the talent
extract can print a "report card" that flags anomalies — a row that is much
heavier/lighter than stock, or a tree that is over/under the stock point budget.

A row's "points" = the number of ranks available in that tier (sum over its
talents of how many of rank_1..rank_9 are populated). COALESCE guards against a
NULL rank column voiding the whole row (a real gotcha in the custom data).
"""

from typing import Dict, List, Tuple, Iterable, Optional

from lib.dbc_utils import DBCConfig, DBCConnection

# Per-row points expression. COALESCE so a NULL rank col doesn't NULL the sum.
_PTS = "+".join(f"(COALESCE(rank_{i},0)>0)" for i in range(1, 10))

# How far a single row may drift from the stock average before we flag it.
ROW_TOL = 3.0


def _stock_reference(cur, original_db: str) -> Tuple[Dict[int, float], Tuple[float, float, float]]:
    """(per-tier avg points across class trees, (total_min, total_avg, total_max))."""
    cur.execute(
        f"""
        SELECT t.tier_id AS tier,
               SUM({_PTS}) AS pts,
               COUNT(DISTINCT t.spec_id) AS trees
        FROM `{original_db}`.talent t
        JOIN `{original_db}`.talenttab tt ON tt.id = t.spec_id
        WHERE tt.class_mask <> 0
        GROUP BY t.tier_id ORDER BY t.tier_id
        """
    )
    per_row = {int(r["tier"]): float(r["pts"]) / float(r["trees"]) for r in cur.fetchall()}

    cur.execute(
        f"""
        SELECT MIN(s) AS mn, AVG(s) AS av, MAX(s) AS mx FROM (
            SELECT SUM({_PTS}) AS s
            FROM `{original_db}`.talent t
            JOIN `{original_db}`.talenttab tt ON tt.id = t.spec_id
            WHERE tt.class_mask <> 0
            GROUP BY t.spec_id
        ) x
        """
    )
    r = cur.fetchone()
    return per_row, (float(r["mn"]), float(r["av"]), float(r["mx"]))


def _spec_rows(cur, live_db: str, spec_id: int) -> Dict[int, int]:
    cur.execute(
        f"SELECT tier_id AS tier, SUM({_PTS}) AS pts "
        f"FROM `{live_db}`.talent WHERE spec_id = %s GROUP BY tier_id",
        (spec_id,),
    )
    return {int(r["tier"]): int(r["pts"]) for r in cur.fetchall()}


def _spec_name(cur, live_db: str, spec_id: int) -> str:
    cur.execute(f"SELECT name_enus AS n FROM `{live_db}`.talenttab WHERE id = %s", (spec_id,))
    r = cur.fetchone()
    return (r and r["n"]) or f"spec {spec_id}"


def specs_for_talent_ids(config: DBCConfig, talent_ids: Iterable[int]) -> List[int]:
    """Resolve the distinct (player-class) spec_ids that own the given talent ids."""
    ids = [int(t) for t in talent_ids if t is not None]
    if not ids:
        return []
    placeholders = ",".join(["%s"] * len(ids))
    with DBCConnection(config) as dbc:
        cur = dbc.get_connection(config.live).cursor(dictionary=True)
        cur.execute(
            f"""
            SELECT DISTINCT t.spec_id AS s
            FROM `{config.live}`.talent t
            JOIN `{config.live}`.talenttab tt ON tt.id = t.spec_id
            WHERE t.id IN ({placeholders}) AND tt.class_mask <> 0
            ORDER BY t.spec_id
            """,
            ids,
        )
        return [int(r["s"]) for r in cur.fetchall()]


def audit_specs(config: DBCConfig, spec_ids: Iterable[int]) -> str:
    """Return a formatted report card comparing each spec to the stock average."""
    spec_ids = [int(s) for s in spec_ids]
    if not spec_ids:
        return ""

    out: List[str] = []
    with DBCConnection(config) as dbc:
        cur = dbc.get_connection(config.live).cursor(dictionary=True)
        per_row_stock, (mn, av, mx) = _stock_reference(cur, config.original)

        for spec_id in spec_ids:
            rows = _spec_rows(cur, config.live, spec_id)
            name = _spec_name(cur, config.live, spec_id)
            total = sum(rows.values())
            max_tier = max(list(rows.keys()) + list(per_row_stock.keys()))

            out.append(f"Talent point audit — {name} (spec {spec_id})")
            out.append(f"  {'row':>3} {'tier':>4} {'spec':>5} {'stock':>6}  flag")
            for tier in range(0, max_tier + 1):
                pts = rows.get(tier, 0)
                stock = per_row_stock.get(tier, 0.0)
                dev = pts - stock
                flag = ""
                if abs(dev) > ROW_TOL:
                    flag = f"{'HIGH' if dev > 0 else 'LOW '} ({dev:+.1f})"
                out.append(f"  {tier + 1:>3} {tier:>4} {pts:>5} {stock:>6.1f}  {flag}")

            if total > mx:
                verdict = f"HEAVY — over stock max ({mx:.0f})"
            elif total < mn:
                verdict = f"LIGHT — under stock min ({mn:.0f})"
            elif total > av:
                verdict = f"heavy-ish — above stock avg ({av:.1f})"
            else:
                verdict = "ok"
            out.append(f"  TOTAL {total} pts  (stock {mn:.0f}–{mx:.0f}, avg {av:.1f})  ->  {verdict}")
            out.append("")

    return "\n".join(out)
