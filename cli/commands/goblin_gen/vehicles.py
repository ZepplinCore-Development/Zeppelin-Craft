"""gen domain: vehicles (I-242).

Cata vehicles referenced by collected creatures -> 3.3.5a Vehicle/VehicleSeat DBC
rows + creature_template_spell action bars.

The zone ships several drivable vehicles (Hot Rod 34840/35999, Strangle Vine,
B.C. Eliminator, KTC Waitress...) whose creature_template.VehicleId is a
Cata-only Vehicle.dbc id — absent from stock 3.3.5a, so the server can't build
the vehicle kit and the client has no seat data. This overlay runs after the
base wave, reads every collected creature_template row with VehicleId != 0 and,
for ids missing from STOCK 3.3.5a (original_dbc, deterministic):

  dbc/  vehicle      (Vehicle.dbc row, 40 fields, identical layout both builds)
        vehicleseat  (VehicleSeat.dbc rows: Cata is the WotLK 58-field layout
                      plus 8 appended fields, all zero for these seats -> the
                      first 58 fields map 1:1 onto the 3.3.5a schema)
  sql/  creature_template_spell  (vehicle action bar: source spell1-8, filtered
                      to spells the 3.3.5a client will actually have — stock or
                      in the missing_spells ported set — like trainers/spellclick)

Column order/typing for both DBC tables is derived from the live dbc schema at
run time (decimal -> float reinterpret, text -> string block, unsigned int ->
wrap negatives), so the emitter never hardcodes a field map.

Per-zone dedup: rows are emitted for creatures whose collected base zone matches
the current pass (col.pks(zone=...)), plus zone-less rows (summon-only creatures,
added on the Lost Isles pass) — each creature is processed exactly once per run.
"""
import os
import struct
import importlib.util

NAME = "vehicles"
TABLES = ["vehicle", "vehicleseat", "creature_template_spell"]
TIER = "overlay"


def _sibling(modname):
    """Load a sibling gen module (domains are file-loaded, not a package)."""
    path = os.path.join(os.path.dirname(os.path.abspath(__file__)), modname + ".py")
    spec = importlib.util.spec_from_file_location("goblin_gen_" + modname, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod

WOTLK_SEAT_FIELDS = 58   # 3.3.5a VehicleSeat.dbc field count (Cata appends 8 more)


def _schema(ctx, table):
    """[(column, kind)] from the live dbc schema; kind in {'float','str','uint','int'}."""
    cols = []
    for r in ctx.dbc_query("SHOW COLUMNS FROM %s" % table):
        t = r["Type"].lower()
        if t.startswith("decimal") or t.startswith("float") or t.startswith("double"):
            kind = "float"
        elif "text" in t or "char" in t:
            kind = "str"
        elif "unsigned" in t:
            kind = "uint"
        else:
            kind = "int"
        cols.append((r["Field"], kind))
    return cols


def _typed_row(raw, schema, get_string):
    """Map raw uint32 DBC fields onto schema columns (positional, truncating)."""
    row = {}
    for i, (col, kind) in enumerate(schema):
        u = raw[i]
        if kind == "float":
            row[col] = struct.unpack("<f", struct.pack("<I", u))[0]
        elif kind == "str":
            row[col] = get_string(u)
        elif kind == "uint":
            row[col] = u
        else:
            row[col] = u - (1 << 32) if u >= (1 << 31) else u
    return row


def emit(ctx):
    sfx = ctx.sfx

    # creatures collected this pass (base zone == sfx); summon-only creatures were
    # added on the Lost Isles pass with zone="" so they land in the first pass too.
    # A dual-zone creature's collected zone flips to the later pass — the done-set
    # (kept on the run-scoped collector) guarantees once-per-run even then, since
    # Kind-B bar rows would otherwise duplicate and violate the table PK.
    done = getattr(ctx.col, "_vehicles_done", None)
    if done is None:
        done = ctx.col._vehicles_done = set()
    # owner filter: only rows creatures.py base-owns — an overlay-only row (some
    # other overlay touching a not-yet-swept other-zone creature) has no VehicleId
    # yet and must not be done-marked on this pass.
    entries = sorted(e for e in ctx.col.pks("creature_template", zone=sfx, owner="creatures")
                     if isinstance(e, int) and e not in done)
    done.update(entries)
    veh_by_entry = {}
    for e in entries:
        row = ctx.col.get("creature_template", e)
        vid = int(row.get("VehicleId") or 0)
        if vid:
            veh_by_entry[e] = vid
    if not veh_by_entry:
        return "no vehicles in this pass"

    stock_veh = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM vehicle")}
    stock_seat = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM vehicleseat")}

    veh_schema = _schema(ctx, "vehicle")
    seat_schema = _schema(ctx, "vehicleseat")
    seat_idx = [i for i, (c, _) in enumerate(veh_schema) if c.startswith("seat_id_")]

    vrecs, vstr = ctx.read_wdbc(ctx.whitemane_dbc("Vehicle.dbc"))
    srecs, sstr = ctx.read_wdbc(ctx.whitemane_dbc("VehicleSeat.dbc"))
    wm_veh = {r[0]: r for r in vrecs}
    wm_seat = {r[0]: r for r in srecs}

    n_veh = n_seat = 0
    for vid in sorted(set(veh_by_entry.values())):
        if vid in stock_veh:
            continue
        raw = wm_veh.get(vid)
        if raw is None:
            continue                      # not in the Cata client either — leave as-is
        vrow = _typed_row(raw, veh_schema, vstr)
        ctx.col.put("vehicle", vid, vrow, tier="base", zone=sfx, owner="vehicles")
        n_veh += 1
        for i in seat_idx:
            sid = raw[i]
            if not sid or sid in stock_seat:
                continue
            sraw = wm_seat.get(sid)
            if sraw is None:
                continue
            srow = _typed_row(sraw[:WOTLK_SEAT_FIELDS], seat_schema, sstr)
            ctx.col.put("vehicleseat", sid, srow, tier="base", zone=sfx, owner="vehicles")
            n_seat += 1

    # ---- vehicle action bars (creature_template_spell) ----
    # A spell only goes on the bar if 3.3.5a will actually have it: stock DBC or
    # the ported Cata set (deterministic — never the mutable live db). I-274: the
    # ported set is derived + validated by _spellscope rather than read from the
    # hand-curated missing_spells fixture, which it now folds in.
    present = {int(r["id"]) for r in ctx.stock_dbc_query("SELECT id FROM spell")}
    present |= _sibling("_spellscope").ported(ctx)

    bar_entries = sorted(veh_by_entry)
    ph = ",".join(["%s"] * len(bar_entries))
    src = {int(r["entry"]): r for r in ctx.q(
        "SELECT * FROM creature_template WHERE entry IN (%s)" % ph, bar_entries)}
    rows, skipped = [], 0
    for e in bar_entries:
        t = src.get(e)
        if not t:
            continue
        for i in range(8):
            spell = int(t["spell%d" % (i + 1)] or 0)
            if not spell:
                continue
            if spell not in present:
                skipped += 1
                continue
            rows.append((e, i, spell))
    if rows:
        ctx.col.delete("creature_template_spell",
                       "CreatureID IN (%s)" % ",".join(str(e) for e in sorted({r[0] for r in rows})))
        for e, i, spell in rows:
            ctx.col.add("creature_template_spell", {
                "CreatureID": e, "Index": i, "Spell": spell, "VerifiedBuild": 0,
            }, sort_key=(e, i))

    return ("vehicles=%d seats=%d bars=%d skipped_spells=%d (creatures w/ vehicle: %d)" %
            (n_veh, n_seat, len(rows), skipped, len(veh_by_entry)))
