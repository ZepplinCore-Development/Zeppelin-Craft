"""Shared: enUS text recovery for the Project Neltharion port (I-302).

The Neltharion 4.3.4 dump is a **partly French-localised** fork. Two separate
defects ride along with every string it hands us:

1. **Localised rows.** ~173 `gossip_menu_option` rows plus a handful of
   `npc_text` / `creature_text` rows carry fr_FR strings. Some were later
   machine-translated back into English, which is worse than leaving them French
   because it reads as plausible-but-wrong Blizzard dialogue ("Bubble" for the
   pet named Fizz, "merchant prince" for Trade Prince).
2. **Double encoding.** The dump's UTF-8 bytes were read as cp1252 before being
   written, so `é` arrives as `Ã©` and the French narrow no-break space before
   `!`/`?` arrives as `Â\xa0`. This hits English rows too, wherever a French
   editor touched them -- `$NÂ !` instead of `$N!`.

`demojibake()` fixes (2) and is safe to run over EVERY ported string: a string
that is not double-encoded round-trips unchanged. Localised rows additionally
need (1), which means fetching the authentic Blizzard string from elsewhere.

## Which enUS source is keyable

`tdb434` (the TrinityCore 4.3.4 reference dump already wired up as
`ctx.tdb_q`) is the enUS twin of the same client build:

| table                | key                            | aligned? |
|----------------------|--------------------------------|----------|
| `gossip_menu_option` | (MenuId, OptionIndex)          | YES -- menu ids match the source dump |
| `npc_text`           | (ID)                           | YES -- text ids match the source dump |
| `broadcast_text`     | (ID)                           | YES |
| `creature_text`      | (CreatureID, GroupID, ID)      | **NO** |

`creature_text` is the trap: Neltharion renumbered GroupIDs (39582 Gallywix
group 2 is TDB's group 9, group 4 is TDB's 11, ...) and the ported SmartAI
`SMART_ACTION_TALK` rows reference *Neltharion's* numbering, so a lookup keyed
on GroupID silently swaps one NPC line for another. creature_text therefore gets
`demojibake()` plus the hand-verified `text_overrides` fixture only -- never an
automatic tdb434 substitution.

Both lookups are lazy and cached; a gen run with no localised rows never opens
the tdb434 connection.
"""
import os
import re

# French keeps a (no-break) space before ! and ? ; English never does. Only these
# two marks are stripped -- NOT ':' or ';', which appear space-padded inside
# perfectly good English gender tokens ("$g Mr. : Ms.;"). Some rows lost the
# no-break-ness somewhere upstream and carry a plain space, so both are matched --
# which also makes this the detector for rows whose mojibake has already been
# flattened away (`_FR_SPACE`).
_FR_PUNCT = re.compile(r"[ \xa0]+([!?])")
_FR_SPACE = _FR_PUNCT

# Latin-1 supplement / Latin Extended-A + the cp1252 punctuation block that a
# double-encoded string decays into. Plain ASCII English never matches.
_NON_ASCII = re.compile(r"[À-ɏ‘-‟€ŒœŠšŸŽž]")

# Function words that are unambiguously French (no English homographs among them
# -- 'mon' is deliberately absent: troll dialogue is full of "mon!").
_FR_WORDS = re.compile(
    r"\b(je|vous|votre|dans|pour|une|des|est|mes|les|nous|avec|cette|auberge|faites"
    r"|besoin|regarder|foyer|puis-je|comme|travail|banque|acheter|aimerais"
    r"|connaissances|metier|métier|accéder|entraînez|intéressé)\b",
    re.I)


def demojibake(s, max_rounds=12):
    """Undo cp1252-over-UTF-8 double encoding and French punctuation spacing.

    Iterates because the dump contains rows that were re-encoded several times
    over (35201 Kezan Partygoer is ~6 rounds deep and only partly recoverable).
    A clean string is returned unchanged.
    """
    if not s:
        return s
    cur = s
    for _ in range(max_rounds):
        try:
            nxt = cur.encode("cp1252").decode("utf-8")
        except (UnicodeEncodeError, UnicodeDecodeError):
            break
        if nxt == cur:
            break
        cur = nxt
    return _FR_PUNCT.sub(r"\1", cur).replace("\xa0", " ")


def looks_localized(raw):
    """True if the RAW source string did not come out of an enUS editor.

    Checked on the raw value, BEFORE `demojibake()`, because the encoding damage is
    the most reliable tell. A French editor leaves `Â\\xa0` (its no-break space
    before `!`/`?`) and `Ã©`-style sequences on every row it touched -- including
    rows whose words are English, because those are the dump's machine
    translations *out of* French, which read as plausible-but-wrong Blizzard
    dialogue and are exactly what we want to replace. Word matching alone misses
    them; encoding damage does not.

    Deliberately generous on accents: the port ships no legitimately accented
    string, so any non-ASCII letter means the row came through a French editor.
    """
    if not raw:
        return False
    return bool(_NON_ASCII.search(raw) or _FR_SPACE.search(raw) or _FR_WORDS.search(raw))


class EnglishText:
    """Lazy enUS lookups against tdb434 + the `text_overrides` fixture.

    `ctx` only needs `tdb_q()` and `fixture()`; one instance per gen pass.
    """

    def __init__(self, ctx):
        self.ctx = ctx
        self._gossip = None
        self._npctext = None
        self._over = None
        self.hits = []          # (kind, key, before, after) -- for the emit summary
        self.misses = []        # (kind, key, text) -- localised, no enUS source

    # -- fixture ----------------------------------------------------------
    @property
    def overrides(self):
        """text_overrides.json: hand-verified strings tdb434 cannot key.

        Shape: {"gossip_menu_option": {"<srcMenu>/<idx>": "..."},
                "npc_text":           {"<srcId>/<field>": "..."},
                "creature_text":      {"<creature>/<group>/<id>": {"Text": "...",
                                                                   "comment": "..."}}}
        """
        if self._over is None:
            try:
                self._over = self.ctx.fixture("text_overrides")
            except (FileNotFoundError, OSError):
                self._over = {}
        return self._over

    # -- tdb434 -----------------------------------------------------------
    def _load_gossip(self):
        if self._gossip is None:
            self._gossip = {
                (int(r["MenuId"]), int(r["OptionIndex"])): (r["OptionText"] or "").strip()
                for r in self.ctx.tdb_q(
                    "SELECT MenuId, OptionIndex, OptionText FROM gossip_menu_option")}
        return self._gossip

    def _load_npctext(self):
        if self._npctext is None:
            cols = ", ".join("text%d_%d" % (n, h) for n in range(8) for h in (0, 1))
            self._npctext = {int(r["ID"]): r for r in self.ctx.tdb_q(
                "SELECT ID, %s FROM npc_text" % cols)}
        return self._npctext

    # -- public -----------------------------------------------------------
    def gossip_option(self, src_menu, idx, text):
        """enUS text for one gossip option, keyed on the SOURCE menu id."""
        localized = looks_localized(text)
        text = demojibake(text)
        if not localized:
            return text
        key = "%d/%d" % (src_menu, idx)
        en = (self.overrides.get("gossip_menu_option", {}).get(key)
              or self._load_gossip().get((src_menu, idx)))
        if en:
            self.hits.append(("gossip_menu_option", key, text, en))
            return en
        self.misses.append(("gossip_menu_option", key, text))
        return text

    def npc_text_field(self, src_id, field, text):
        """enUS text for one npc_text field, keyed on the SOURCE npc_text id."""
        localized = looks_localized(text)
        text = demojibake(text)
        if not localized:
            return text
        key = "%d/%s" % (src_id, field)
        en = self.overrides.get("npc_text", {}).get(key)
        if en is None:
            row = self._load_npctext().get(src_id)
            en = (row.get(field) or "").strip() if row else None
        if en:
            self.hits.append(("npc_text", key, text, en))
            return en
        self.misses.append(("npc_text", key, text))
        return text

    def creature_line(self, creature, group, idx, text, comment):
        """demojibake + fixture ONLY -- tdb434 GroupIDs do not align (see header)."""
        localized = looks_localized(text)
        text, comment = demojibake(text), demojibake(comment)
        key = "%d/%d/%d" % (creature, group, idx)
        ov = self.overrides.get("creature_text", {}).get(key)
        if ov:
            if ov.get("Text") and ov["Text"] != text:
                self.hits.append(("creature_text", key, text, ov["Text"]))
                text = ov["Text"]
            if ov.get("comment"):
                comment = ov["comment"]
        elif localized and _NON_ASCII.search(text):
            # Only report what demojibake could not make ASCII-clean; a French
            # no-break space is repaired in place and needs no fixture entry.
            self.misses.append(("creature_text", key, text))
        return text, comment

    def summary(self):
        """One-line report for the domain's return string."""
        out = "enUS: %d repaired" % len(self.hits)
        if self.misses:
            out += ", %d STILL LOCALIZED (%s)" % (
                len(self.misses), ", ".join(k for _t, k, _s in self.misses[:6]))
        return out
