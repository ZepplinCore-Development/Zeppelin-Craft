"""gen domain: spellvisuals (I-318).

Cata `SpellVisual` / `SpellVisualKit` / `SpellVisualKitModelAttach` rows referenced
by the ported spells but absent from stock 3.3.5a -> the 3.3.5a DBC tables.

WHY THIS EXISTS
---------------
`spells.py` copies `spell_visual_1` VERBATIM from the Cata row (it is the only
sane choice — the value is an opaque id, not something to re-derive). Nothing
ever emitted the table it points INTO, so a ported spell whose visual id
postdates 3.3.5a plays **nothing at all**: no error, no log line, just a flat
quest. The client resolves the id, misses, and draws nothing.

The gap was found one quest at a time (I-268 Kaja'Cola, then I-318 Cluster
Cluck, where the rocket that should be strapped to a Wild Clucker was simply
absent) and the audit behind those fixes was growing with every port wave:
14 dangling visuals on 2026-07-25, **99** on 2026-08-06. That is the signature
of a missing emitter, not of 99 individual bugs — so this closes it at the
source, the way summonproperties.py (I-285) closed the summon gap.

Detect the class (returns 0 when this domain has run):

    SELECT COUNT(*) FROM spell s
    LEFT JOIN spellvisual v ON v.id = s.spell_visual_1
    WHERE s.spell_visual_1 > 0 AND v.id IS NULL;

WHAT IT SHIPS
-------------
Rows only, and only into GAPS — a shared id is never touched. The chain is
walked breadth-first from each dangling visual: visual -> its 12 kit slots ->
each kit's effect-name / sound / shake payloads, plus the model-attach rows that
hang off a ported kit. Ids are preserved at their Cata values so the already
ported spell rows resolve with zero spell-row edits and the next port wave
reuses what this one landed (the I-309 SpellIcon precedent).

**Assets are never shipped from here.** M2 meshes are v264 vs v272 and are a
curated retroport step (see ctx.ship_asset, BLP-only by contract). When a
payload cannot be resolved to something 3.3.5a already has, the slot is zeroed
and the id is NAMED in the return string — a silent drop would read as coverage.

ID STABILITY — measured, not assumed (2026-08-06, 4.3.4 build 15595 vs stock)
----------------------------------------------------------------------------
Shared ids overwhelmingly mean the same thing, but NOT always:

    SpellVisualEffectName   3970 shared,  16 disagree on file path  (0.4%)
    SpellVisualKit          8671 shared, 318 disagree on payload    (3.7%)
    SpellVisual             9411 shared, 180 disagree on kit refs   (1.9%)

Two consequences, both encoded below:

* **Effect names are resolved by ASSET PATH, not by id.** Cata 6507
  `spells\\jetpack.mdx` looks Cata-only but the same asset is stock 3.3.5a
  **6127** — Cata added a duplicate row for a model the client already had, so
  what looked like a missing asset needed nothing packed. Trusting the id alone
  would have pointed 0.4% of slots at an unrelated model (Cata 4803
  `whack_a_gnoll_burst` is `arcaneexplosion_base` in 3.3.5a). Sounds resolve the
  same way, by filename.
* **Kit references that land on a stock id are left alone and COUNTED.** Where
  3.3.5a's kit N differs from Cata's, N is stock content and the WotLK version
  is what a WotLK client should play; the divergence is Blizzard tweaking a
  stock kit between expansions (a sound id dropped, an effect slot moved), not
  something to fork. The count is reported so drift stays visible.

Scope is DERIVED from the spell rows spells.py actually collected, so the two
cannot drift: a spell can no longer ship with a visual id pointing at nothing.
Emitted on the LAST (_K) pass, like spells.py and summonproperties.py, because
the derived scope needs both zones walked.
"""
import struct

NAME = "spellvisuals"
TABLES = ["spellvisual", "spellvisualkit", "spellvisualkitmodelattach"]
# Collector tables this domain READS but does not write -- the contributor
# closure must pull their producers into any partial `gen` run or the read
# comes back empty and this file ships under-populated (see I-267).
# reads the collected spell rows to find the visuals they reference
READS = ['spell']
TIER = "base"

# ---- field layouts ---------------------------------------------------------
# SpellVisual.dbc: Cata 33 fields vs WotLK 32 — the extra one is APPENDED, so
# indices 0..31 transfer straight across.
VISUAL_FIELDS = (
    "id", "precast_kit", "cast_kit", "impact_kit", "state_kit", "state_done_kit",
    "channel_kit", "has_missile", "missile_model", "missile_path_type",
    "missile_dest_attachment", "missile_sound", "anim_event_sound_id", "flags",
    "caster_impact_kit", "target_impact_kid", "missile_attachment",
    "missile_follow_ground_height", "missile_follow_drop_speed",
    "missile_follow_approach", "missile_follow_ground_flags", "missile_motion",
    "missile_targeting_kit", "instant_area_kit", "impact_area_kit",
    "persistent_area_kit", "missile_cast_offset_x", "missile_cast_offset_y",
    "missile_cast_offset_z", "missile_impact_offset_x", "missile_impact_offset_y",
    "missile_impact_offset_z")
VISUAL_KIT_COLS = ("precast_kit", "cast_kit", "impact_kit", "state_kit",
                   "state_done_kit", "channel_kit", "caster_impact_kit",
                   "target_impact_kid", "missile_targeting_kit",
                   "instant_area_kit", "impact_area_kit", "persistent_area_kit")
VISUAL_EFFECT_COLS = ("missile_model",)
VISUAL_SOUND_COLS = ("missile_sound", "anim_event_sound_id")
VISUAL_FLOAT_COLS = frozenset(VISUAL_FIELDS[26:])

# SpellVisualKit.dbc: Cata 39 vs WotLK 38 — 4.0 inserted AnimKitID at index 3,
# so every WotLK index >= 3 reads Cata index + 1 (the AnimKit has no 3.3.5a
# equivalent and is dropped).
KIT_FIELDS = (
    "id", "start_anim_id", "anim_id", "head_effect", "chest_effect",
    "base_effect", "left_hand_effect", "right_hand_effect", "breath_effect",
    "left_weapon_effect", "right_weapon_effect", "special_effect_1",
    "special_effect_2", "special_effect_3", "world_effect", "sound_id",
    "shake_id", "char_proc_1", "char_proc_2", "char_proc_3", "char_proc_4",
    "char_param_0_1", "char_param_0_2", "char_param_0_3", "char_param_0_4",
    "char_param_1_1", "char_param_1_2", "char_param_1_3", "char_param_1_4",
    "char_param_2_1", "char_param_2_2", "char_param_2_3", "char_param_2_4",
    "char_param_3_1", "char_param_3_2", "char_param_3_3", "char_param_3_4",
    "flags")
KIT_EFFECT_COLS = KIT_FIELDS[3:15]           # head..world_effect
KIT_ANIM_COLS = ("start_anim_id", "anim_id")
KIT_PROC_COLS = ("char_proc_1", "char_proc_2", "char_proc_3", "char_proc_4")
KIT_FLOAT_COLS = frozenset(KIT_FIELDS[21:37])

# SpellVisualKitModelAttach.dbc: Cata 14 vs WotLK 10 — the 4 Cata extras are
# appended and dropped.
ATTACH_FIELDS = ("id", "parent_spell_vis_kit_id", "spell_vis_effect_name_id",
                 "attachment_id", "offset_x", "offset_y", "offset_z",
                 "yaw", "pitch", "roll")
ATTACH_FLOAT_COLS = frozenset(ATTACH_FIELDS[4:])

NEG1 = 0xFFFFFFFF
# Hand-authored custom visuals/kits live in the 90xxx block by convention
# (F-164R, I-248, I-268). Those ids are absent from stock by design and belong to
# their `[I-xxx]` file — deriving them here would fight it on apply and report
# them as broken source references. One file owns one row id.
CUSTOM_BLOCK = 90000
# Attach ids are referenced by NOTHING, so they are ours to allocate rather than
# carry over (Cata 4151/4152/8349 are live stock rows here). Whole-block DELETE
# + re-INSERT, so a shrinking scope cannot leave orphans behind.
ATTACH_BLOCK = (90001, 90999)


def _f(u):
    """Reinterpret one uint32 DBC field as the float it actually holds."""
    return struct.unpack("<f", struct.pack("<I", u & 0xFFFFFFFF))[0]


def _norm_model(p):
    """Model paths compare case-insensitively, with .mdl/.mdx and leading-slash
    noise folded out (3.3.5a still carries a handful of .mdl spellings and one
    absolute build path that gained a slash in Cata)."""
    p = (p or "").strip().lower().replace("\\", "/").lstrip("/")
    if p.endswith(".mdl"):
        p = p[:-4] + ".mdx"
    return p


def _norm_sound(p):
    """Sound files compare on the STEM, because the two builds disagree on the
    container for the very same clip: 3.3.5a's SoundEntries says `CallLightning.wav`
    where 4.3.4 says `calllightning.ogg`. Matching the extension too would have
    declared ~45 stock clips missing and silently zeroed them — including
    ThrowNet, the Cluster Cluck cast sound (I-318)."""
    p = (p or "").strip().lower().replace("\\", "/").rsplit("/", 1)[-1]
    return p.rsplit(".", 1)[0]


class _Resolver:
    """Cata id -> 3.3.5a id for the payload tables, matching on ASSET IDENTITY.

    An id that exists in 3.3.5a with the SAME asset is used directly. Otherwise
    the asset is looked up by path/filename, which is what catches Cata's
    duplicate rows for models the client already ships. Anything genuinely
    absent is recorded in `.missing` and the caller zeroes the slot.
    """

    def __init__(self, stock_rows, cata_rows):
        # {id -> asset identity}; a falsy identity means "row carries no asset"
        self._stock_key = dict(stock_rows)
        self._by_key = {}
        for i in sorted(stock_rows):
            k = stock_rows[i]
            if k and k not in self._by_key:
                self._by_key[k] = i          # lowest stock id wins — stable output
        self._cata = cata_rows
        self.missing = {}                    # cata id -> asset identity
        self.missing_refs = {}               # cata id -> {referrer, ...}
        self.remapped = {}                   # cata id -> stock id (id changed)

    def resolve(self, cid, referrer):
        cid = int(cid)
        if cid in (0, NEG1):
            return cid
        want = self._cata.get(cid)
        if want is None:
            # Not in either build: a broken source reference, not a gap to close.
            self.missing.setdefault(cid, "<absent from the 4.3.4 client DBC>")
            self.missing_refs.setdefault(cid, set()).add(referrer)
            return 0
        if self._stock_key.get(cid) == want:
            return cid
        hit = self._by_key.get(want)
        if hit is not None:
            if hit != cid:
                self.remapped[cid] = hit
            return hit
        self.missing.setdefault(cid, want)
        self.missing_refs.setdefault(cid, set()).add(referrer)
        return 0


def emit(ctx):
    # Zone-independent set (like spells/summonproperties) -> emit once, on the
    # last pass, so the derived scope has seen both zones.
    if ctx.sfx != "_K":
        return "skipped (emits on the Kezan pass)"

    # Scope is derived from the COLLECTED spell rows. A run that skipped spells.py
    # would otherwise write a near-empty full-state file over a good one — fail
    # loudly rather than quietly regress the tables.
    spell_pks = ctx.col.pks("spell", owned=True)
    if not spell_pks:
        raise RuntimeError(
            "no spell rows collected — spellvisuals derives its scope from the "
            "ported spell set; run a full `zep goblin gen`")

    # visual id -> spells that reference it
    wanted = {}
    for sid in spell_pks:
        row = ctx.col.get("spell", sid) or {}
        for col in ("spell_visual_1", "spell_visual_2"):
            vid = int(row.get(col) or 0)
            if vid:
                wanted.setdefault(vid, set()).add(sid)
    if not wanted:
        return "0 rows (no ported spell carries a visual)"

    # STOCK, never live: what 3.3.5a already has must not depend on apply state
    # (reference_dbc_stock_determinism / I-274).
    stock_visual = {int(r["id"]) for r in
                    ctx.stock_dbc_query("SELECT id FROM spellvisual")}
    stock_anim = {int(r["id"]) for r in
                  ctx.stock_dbc_query("SELECT id FROM animationdata")}
    stock_shake = {int(r["id"]) for r in
                   ctx.stock_dbc_query("SELECT id FROM camerashakes")}
    stock_kit_rows = ctx.stock_dbc_query(
        "SELECT %s FROM spellvisualkit" % ", ".join(KIT_FIELDS))
    stock_kit = {int(r["id"]): r for r in stock_kit_rows}

    hand_authored = sorted(v for v in wanted
                           if v >= CUSTOM_BLOCK and v not in stock_visual)
    missing_visuals = sorted(v for v in wanted
                             if v not in stock_visual and v < CUSTOM_BLOCK)
    if not missing_visuals:
        return "0 rows (all %d referenced visuals are stock)" % len(wanted)

    # ---- Cata sources -----------------------------------------------------
    vrecs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SpellVisual.dbc"))
    cata_visual = {r[0]: r for r in vrecs}
    krecs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SpellVisualKit.dbc"))
    cata_kit = {r[0]: r for r in krecs}
    erecs, egs = ctx.read_wdbc(ctx.whitemane_dbc("SpellVisualEffectName.dbc"))
    srecs, sgs = ctx.read_wdbc(ctx.whitemane_dbc("SoundEntries.dbc"))
    arecs, _ = ctx.read_wdbc(ctx.whitemane_dbc("SpellVisualKitModelAttach.dbc"))
    cata_attach = {}
    for r in arecs:
        cata_attach.setdefault(r[1], []).append(r)

    effects = _Resolver(
        {int(r["id"]): _norm_model(r["file_name"]) for r in ctx.stock_dbc_query(
            "SELECT id, file_name FROM spellvisualeffectname")},
        {r[0]: _norm_model(egs(r[2])) for r in erecs})
    sounds = _Resolver(
        {int(r["id"]): _norm_sound(r["file_1"]) for r in ctx.stock_dbc_query(
            "SELECT id, file_1 FROM soundentries")},
        {r[0]: _norm_sound(sgs(r[3])) for r in srecs})

    # ---- walk the chain ---------------------------------------------------
    absent_visuals, absent_kits = [], []
    kit_queue, seen_kits, ported_kits = [], set(), []
    stock_kit_hits, stock_kit_diverged = 0, []
    dropped_anims, dropped_shakes = [], []

    def kit_ref(cid, referrer):
        """A kit reference on a row we are porting: stock ids stay as they are,
        gaps get queued for porting."""
        cid = int(cid)
        if cid in (0, NEG1):
            return cid
        if cid >= CUSTOM_BLOCK:
            return cid                       # hand-authored kit, not ours to derive
        if cid in stock_kit:
            nonlocal stock_kit_hits
            stock_kit_hits += 1
            cata = cata_kit.get(cid)
            if cata is not None and _kit_diverges(stock_kit[cid], cata):
                stock_kit_diverged.append(cid)
            return cid
        if cid not in seen_kits:
            seen_kits.add(cid)
            kit_queue.append((cid, referrer))
        return cid

    def _kit_diverges(stock_row, cata_row):
        for i, col in enumerate(KIT_FIELDS):
            if i == 0 or col in KIT_FLOAT_COLS or col in KIT_PROC_COLS:
                continue
            cata_i = i if i < 3 else i + 1
            if int(stock_row[col]) != cata_row[cata_i]:
                return True
        return False

    for vid in missing_visuals:
        src = cata_visual.get(vid)
        if src is None:
            absent_visuals.append(vid)
            continue
        cols = {}
        for i, col in enumerate(VISUAL_FIELDS):
            raw = src[i]
            if col in VISUAL_FLOAT_COLS:
                cols[col] = _f(raw)
            elif col in VISUAL_KIT_COLS:
                cols[col] = kit_ref(raw, "visual %d" % vid)
            elif col in VISUAL_EFFECT_COLS:
                cols[col] = effects.resolve(raw, "visual %d" % vid)
            elif col in VISUAL_SOUND_COLS:
                cols[col] = sounds.resolve(raw, "visual %d" % vid)
            else:
                cols[col] = int(raw)
        ctx.col.put("spellvisual", vid, cols, tier="base", owner=NAME,
                    note="%d <- spell %s" % (
                        vid, ", ".join(str(s) for s in sorted(wanted[vid]))))

    # Kits can reference further kits, so drain the queue rather than looping once.
    while kit_queue:
        kid, referrer = kit_queue.pop(0)
        src = cata_kit.get(kid)
        if src is None:
            absent_kits.append((kid, referrer))
            continue
        cols = {}
        for i, col in enumerate(KIT_FIELDS):
            raw = src[i if i < 3 else i + 1]
            where = "kit %d" % kid
            if col in KIT_FLOAT_COLS:
                cols[col] = _f(raw)
            elif col in KIT_PROC_COLS:
                # char_proc must stay -1 where Cata has -1; a 0 here is a real
                # "no proc" value in both builds.
                cols[col] = int(raw)
            elif col in KIT_EFFECT_COLS:
                cols[col] = effects.resolve(raw, where)
            elif col == "sound_id":
                cols[col] = sounds.resolve(raw, where)
            elif col == "shake_id":
                v = int(raw)
                if v not in (0, NEG1) and v not in stock_shake:
                    dropped_shakes.append((v, where))
                    v = 0
                cols[col] = v
            elif col in KIT_ANIM_COLS:
                v = int(raw)
                if v not in (0, NEG1) and v not in stock_anim:
                    # A Cata-only animation id: the client would index past
                    # AnimationData. -1 (play nothing) is the safe value, and
                    # what stock kits without an anim already carry.
                    dropped_anims.append((v, where))
                    v = NEG1
                cols[col] = v
            else:
                cols[col] = int(raw)
        ctx.col.put("spellvisualkit", kid, cols, tier="base", owner=NAME,
                    note="%d <- %s" % (kid, referrer))
        ported_kits.append(kid)

    # ---- model attachments (this is what puts a MODEL on a unit) ----------
    # SpellVisualKit only names anims/sounds/slot effects; a model bolted to an
    # attachment point lives here, so a correctly ported kit still renders
    # nothing without these rows (I-318: the rocket on the Wild Clucker).
    ctx.col.delete("spellvisualkitmodelattach",
                   "id BETWEEN %d AND %d" % ATTACH_BLOCK)
    next_id, attach_rows, attach_overflow = ATTACH_BLOCK[0], 0, 0
    for kid in sorted(ported_kits):
        for src in sorted(cata_attach.get(kid, []), key=lambda r: r[0]):
            if next_id > ATTACH_BLOCK[1]:
                attach_overflow += 1
                continue
            eff = effects.resolve(src[2], "kit %d attach" % kid)
            if not eff:
                continue                     # unresolved model: no row, reported below
            cols = {}
            for i, col in enumerate(ATTACH_FIELDS):
                if col == "id":
                    cols[col] = next_id
                elif col in ATTACH_FLOAT_COLS:
                    cols[col] = _f(src[i])
                elif col == "spell_vis_effect_name_id":
                    cols[col] = eff
                else:
                    cols[col] = int(src[i])
            ctx.col.add("spellvisualkitmodelattach", cols, sort_key=next_id)
            next_id += 1
            attach_rows += 1

    # ---- report -----------------------------------------------------------
    out = ["spellvisual=%d/%d referenced (%d stock)" % (
        len(missing_visuals) - len(absent_visuals), len(wanted),
        len(wanted) - len(missing_visuals))]
    out.append("spellvisualkit=%d" % len(ported_kits))
    out.append("modelattach=%d" % attach_rows)
    if stock_kit_hits:
        out.append("%d kit refs already stock (%d differ from 4.3.4 — WotLK "
                   "version kept)" % (stock_kit_hits, len(set(stock_kit_diverged))))
    if effects.remapped or sounds.remapped:
        out.append("remapped by asset: %d effectname, %d sound" % (
            len(effects.remapped), len(sounds.remapped)))

    def _name_gaps(label, res):
        if not res.missing:
            return
        items = sorted(res.missing.items())[:12]
        out.append("%s NOT resolvable in 3.3.5a (slot zeroed, asset is a curated "
                   "retroport step): %s%s" % (
                       label,
                       "; ".join("%d %s <- %s" % (
                           i, a, ", ".join(sorted(res.missing_refs.get(i, ()))))
                           for i, a in items),
                       "" if len(res.missing) <= 12 else
                       " (+%d more)" % (len(res.missing) - 12)))

    _name_gaps("effectname", effects)
    _name_gaps("sound", sounds)
    if hand_authored:
        out.append("%d custom-block visuals left to their [I-xxx] owner: %s" % (
            len(hand_authored), ", ".join(str(v) for v in hand_authored)))
    if absent_visuals:
        out.append("visual ids in NEITHER build: " +
                   ", ".join(str(v) for v in absent_visuals))
    if absent_kits:
        out.append("kit ids in NEITHER build: " +
                   ", ".join("%d (%s)" % (k, r) for k, r in absent_kits))
    if dropped_anims:
        out.append("Cata-only anim ids dropped to -1: " +
                   ", ".join("%d (%s)" % (a, w) for a, w in sorted(set(dropped_anims))))
    if dropped_shakes:
        out.append("Cata-only shake ids dropped to 0: " +
                   ", ".join("%d (%s)" % (a, w) for a, w in sorted(set(dropped_shakes))))
    if attach_overflow:
        out.append("WARNING: attach block %d-%d exhausted, %d rows dropped — "
                   "widen ATTACH_BLOCK" % (ATTACH_BLOCK[0], ATTACH_BLOCK[1],
                                           attach_overflow))
    return "; ".join(out)
