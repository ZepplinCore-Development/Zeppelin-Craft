"""Cross-zone output collector for the F-011 gen pipeline.

Leading underscore -> skipped by the domain discovery loop (not a gen domain).

The generator runs `for sfx in ["", "_K"]` (Lost Isles, Kezan) and, historically,
every domain wrote its own file *immediately* -- split by zone (`%s`) and by
category, plus separate UPDATE-overlay files that patched a table another domain
INSERTed. Because emitted SQL is applied in plain lexicographic filename order
(cli/commands/sql.py), those overlay files frequently sorted *before* the owning
DELETE+INSERT and were clobbered (root cause of I-241 missing item icons).

This collector replaces that model: domains feed rows into a single object that
survives *both* zone passes, and `flush()` writes exactly ONE file per DB table,
each row a single fully-formed statement carrying final state.

Two properties make output independent of domain run order:
  * overlay-wins column merge -- each PK holds a `base` and an `overlay` column
    dict; the emitted row is {**base, **overlay}.
  * two-wave execution (driver runs all tier="base" domains, then all
    tier="overlay" domains) so an overlay may read already-collected base rows
    via get()/pks().

Three table *kinds* (declared in TABLES):
  * "A" merged wide rows   -> put(table, pk, cols, tier, zone)  [+ patch()]
  * "B" grouped rows       -> delete(table, where) + add(table, cols, sort_key)
  * "C" DDL + grouped rows -> ddl(table, create_sql) then Kind-B ops
"""


class Raw:
    """Pre-rendered SQL literal — emitted verbatim by _esc (no quoting/formatting).
    Use when a domain has already rendered the exact literal (e.g. source-string
    passthrough values) and byte-stable output matters."""
    __slots__ = ("s",)

    def __init__(self, s):
        self.s = str(s)


def _esc(v):
    if v is None:
        return "NULL"
    if isinstance(v, Raw):
        return v.s
    if isinstance(v, str):
        return "'" + v.replace("\\", "\\\\").replace("'", "''") + "'"
    if isinstance(v, float):
        return ("%.4f" % v).rstrip("0").rstrip(".") or "0"
    return str(v)


# Per-table config: name -> dict(order, kind, pk, dest, tag)
#   order : zero-padded prefix controlling cross-table apply order (sql only)
#   kind  : "A" merged wide rows | "B" grouped rows | "C" ddl+grouped
#   pk    : primary-key column (Kind A) used in the per-row DELETE
#   dest  : "sql" (world DB) or "dbc" (client DB, applied by id -- order irrelevant)
#   tag   : feature tag in the filename (default "AUTO,F-011")
TABLES = {
    # ---- world SQL, Kind A (merged wide rows) ----
    "item_template":          dict(order=5,  kind="A", pk="entry", dest="sql"),
    "creature_template":      dict(order=10, kind="A", pk="entry", dest="sql"),
    "gameobject_template":    dict(order=20, kind="A", pk="entry", dest="sql"),
    # ---- world SQL, Kind A single-owner (still merged-by-pk, no overlay) ----
    "creature_template_addon":    dict(order=11, kind="A", pk="entry", dest="sql"),
    "creature_template_model":    dict(order=12, kind="A", pk="CreatureID", dest="sql"),
    "creature_model_info":        dict(order=13, kind="A", pk="DisplayID", dest="sql"),
    "creature_template_movement": dict(order=14, kind="A", pk="CreatureId", dest="sql"),
    "creature_immunities":        dict(order=15, kind="A", pk="ID", dest="sql"),
    # ---- world SQL, Kind B (grouped: range/scope/owner DELETE + rows) ----
    "creature_equip_template":    dict(order=16, kind="B", dest="sql"),
    "creature_text":              dict(order=17, kind="B", dest="sql"),
    "npc_text":                   dict(order=25, kind="B", dest="sql"),
    "gossip_menu":                dict(order=26, kind="B", dest="sql"),
    "gossip_menu_option":         dict(order=27, kind="B", dest="sql"),
    "quest_template":             dict(order=30, kind="A", pk="ID", dest="sql"),
    "quest_template_addon":       dict(order=31, kind="A", pk="ID", dest="sql"),
    "quest_offer_reward":         dict(order=32, kind="A", pk="ID", dest="sql"),
    "quest_request_items":        dict(order=33, kind="A", pk="ID", dest="sql"),
    "quest_poi":                  dict(order=34, kind="B", dest="sql"),
    "quest_poi_points":           dict(order=35, kind="B", dest="sql"),
    "creature":                   dict(order=40, kind="B", dest="sql"),
    "gameobject":                 dict(order=41, kind="B", dest="sql"),
    "creature_queststarter":      dict(order=45, kind="B", dest="sql"),
    "creature_questender":        dict(order=46, kind="B", dest="sql"),
    "creature_loot_template":     dict(order=50, kind="B", dest="sql"),
    "skinning_loot_template":     dict(order=51, kind="B", dest="sql"),
    "pickpocketing_loot_template": dict(order=52, kind="B", dest="sql"),
    "gameobject_loot_template":   dict(order=53, kind="B", dest="sql"),
    "npc_vendor":                 dict(order=55, kind="B", dest="sql"),
    "npc_spellclick_spells":      dict(order=56, kind="B", dest="sql"),
    "creature_default_trainer":   dict(order=57, kind="B", dest="sql"),
    "trainer":                    dict(order=58, kind="B", dest="sql"),
    "trainer_spell":              dict(order=59, kind="B", dest="sql"),
    "spell_script_names":         dict(order=60, kind="B", dest="sql"),
    "smart_scripts":              dict(order=65, kind="B", dest="sql"),
    "conditions":                 dict(order=70, kind="B", dest="sql"),
    "phase_definitions":          dict(order=90, kind="C", dest="sql", tag="AUTO,F-194"),
    # ---- DBC (client data; applied by id, cross-file order can't clobber) ----
    "creaturemodeldata":          dict(order=0, kind="A", pk="id", dest="dbc"),
    "creaturedisplayinfo":        dict(order=0, kind="A", pk="id", dest="dbc"),
    "creaturedisplayinfoextra":   dict(order=0, kind="A", pk="id", dest="dbc"),
    "gameobjectdisplayinfo":      dict(order=0, kind="A", pk="id", dest="dbc"),
    "itemdisplayinfo":            dict(order=0, kind="A", pk="id", dest="dbc"),
    "spell":                      dict(order=0, kind="A", pk="id", dest="dbc"),
}


class _RowA:
    __slots__ = ("base", "overlay", "zone", "note", "base_owner")

    def __init__(self):
        self.base = {}
        self.overlay = {}
        self.zone = ""
        self.note = None
        self.base_owner = None

    def final(self):
        row = dict(self.base)           # base defines column order
        for k, v in self.overlay.items():
            row[k] = v                  # override in place, or append overlay-only cols
        return row


class Collector:
    Raw = Raw   # so domains can wrap pre-rendered literals via ctx.col.Raw(...)

    def __init__(self):
        self._a = {}      # table -> {pk -> _RowA}
        self._b = {}      # table -> {"deletes": [where], "rows": [(sortkey, cols)], "patches": []}
        self._ddl = {}    # table -> [create_sql]
        self._touched = set()

    # ---- Kind A: merged wide rows ----------------------------------------
    def put(self, table, pk, cols, tier="base", zone="", owner=None, note=None):
        self._touched.add(table)
        rows = self._a.setdefault(table, {})
        rec = rows.get(pk)
        if rec is None:
            rec = rows[pk] = _RowA()
        if tier == "base":
            if rec.base_owner is not None and owner is not None and rec.base_owner != owner:
                raise ValueError(
                    "double base ownership of %s pk=%r: %s vs %s"
                    % (table, pk, rec.base_owner, owner))
            for k, v in cols.items():
                if k in rec.base and rec.base[k] != v:
                    raise ValueError(
                        "conflicting base value %s.%s pk=%r: %r vs %r"
                        % (table, k, pk, rec.base[k], v))
            rec.base.update(cols)
            if owner is not None:
                rec.base_owner = owner
            rec.zone = zone or rec.zone
            if note is not None:
                rec.note = note
        else:  # overlay
            for k, v in cols.items():
                if k in rec.overlay and rec.overlay[k] != v:
                    raise ValueError(
                        "conflicting overlay value %s.%s pk=%r: %r vs %r"
                        % (table, k, pk, rec.overlay[k], v))
            rec.overlay.update(cols)

    def get(self, table, pk):
        """Merged column dict for one collected row so far, or None."""
        rec = self._a.get(table, {}).get(pk)
        return rec.final() if rec else None

    def pks(self, table, zone=None, owner=None):
        """PKs contributed to a Kind-A table, optionally filtered to a base zone
        and/or the domain that owns the base row."""
        rows = self._a.get(table, {})
        return [pk for pk, rec in rows.items()
                if (zone is None or rec.zone == zone)
                and (owner is None or rec.base_owner == owner)]

    # ---- Kind B: grouped rows --------------------------------------------
    def delete(self, table, where_sql):
        self._touched.add(table)
        d = self._b.setdefault(table, {"deletes": [], "rows": [], "patches": []})
        if where_sql not in d["deletes"]:
            d["deletes"].append(where_sql)

    def add(self, table, cols, sort_key=None):
        self._touched.add(table)
        d = self._b.setdefault(table, {"deletes": [], "rows": [], "patches": []})
        d["rows"].append((sort_key, dict(cols)))

    def patch(self, table, match_col, match_vals, cols):
        """Apply `cols` to already-added Kind-B rows whose match_col is in match_vals."""
        self._touched.add(table)
        d = self._b.setdefault(table, {"deletes": [], "rows": [], "patches": []})
        d["patches"].append((match_col, set(match_vals), dict(cols)))

    # ---- Kind C: DDL ------------------------------------------------------
    def ddl(self, table, create_sql):
        self._touched.add(table)
        self._ddl.setdefault(table, [])
        if create_sql not in self._ddl[table]:
            self._ddl[table].append(create_sql)

    # ---- render + flush ---------------------------------------------------
    def _render_a(self, table, cfg):
        pk = cfg["pk"]
        out = []
        updates = 0
        for key in sorted(self._a[table].keys(), key=lambda x: (isinstance(x, str), x)):
            rec = self._a[table][key]
            if not rec.base:
                # overlay-only row (no base contributor): the row is not ours -> emit a
                # consolidated UPDATE of just the overlay columns (stock-row rule),
                # never a column-incomplete INSERT.
                if rec.overlay:
                    out.append("UPDATE %s SET %s WHERE %s = %s;\n" % (
                        table,
                        ", ".join("`%s` = %s" % (k, _esc(v)) for k, v in rec.overlay.items()),
                        pk, _esc(key)))
                    updates += 1
                continue
            row = rec.final()
            if not row:
                continue
            missing_pk = pk not in row
            if missing_pk:
                row = dict(row); row[pk] = key
            if rec.note:
                out.append("-- %s" % rec.note)
            out.append("DELETE FROM %s WHERE %s = %s;" % (table, pk, _esc(key)))
            out.append("INSERT INTO %s SET" % table)
            out.append(",\n".join("  `%s` = %s" % (k, _esc(v)) for k, v in row.items()) + ";\n")
        if updates:
            out.insert(0, "-- note: %d row(s) not owned here (no base contributor) -> consolidated UPDATE\n" % updates)
        return "\n".join(out) + "\n"

    def _render_b(self, table):
        d = self._b[table]
        out = []
        for w in d["deletes"]:
            out.append("DELETE FROM %s WHERE %s;" % (table, w))
        if d["deletes"]:
            out.append("")
        rows = [dict(c) for _, c in sorted(d["rows"], key=lambda r: (r[0] is None, r[0]))]
        for mcol, mvals, pcols in d["patches"]:
            for r in rows:
                if r.get(mcol) in mvals:
                    r.update(pcols)
        # group by identical column tuple -> one multi-row INSERT each
        groups = []
        for r in rows:
            cols = tuple(r.keys())
            if not groups or groups[-1][0] != cols:
                groups.append((cols, []))
            groups[-1][1].append(r)
        for cols, grp in groups:
            collist = ", ".join("`%s`" % c for c in cols)
            values = ",\n  ".join("(%s)" % ", ".join(_esc(r[c]) for c in cols) for r in grp)
            out.append("INSERT INTO %s (%s) VALUES\n  %s;\n" % (table, collist, values))
        return "\n".join(out) + "\n"

    def _dest(self, table, cfg):
        tag = cfg.get("tag", "AUTO,F-011")
        if cfg["dest"] == "dbc":
            return "dbc/[%s]_%s.sql" % (tag, table)
        return "sql/zz_[%s]_%02d_%s.sql" % (tag, cfg["order"], table)

    def flush(self, write):
        """Write one file per touched table. `write(rel_path, body)` does the I/O.
        Returns the list of relative paths written."""
        written = []
        for table in sorted(self._touched, key=lambda t: (TABLES[t]["dest"], TABLES[t]["order"], t)):
            cfg = TABLES[table]
            parts = []
            if table in self._ddl:
                parts.extend(self._ddl[table])
            if cfg["kind"] == "A":
                parts.append(self._render_a(table, cfg))
            else:
                parts.append(self._render_b(table))
            body = ("-- F-011 %s (one file per table; rows carry final state)\n\n" % table) + "\n".join(parts)
            rel = self._dest(table, cfg)
            write(rel, body)
            written.append(rel)
        return written
