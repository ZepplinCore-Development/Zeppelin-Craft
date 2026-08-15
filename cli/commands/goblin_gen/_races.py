"""Cata -> live-client race id mapping for imported CreatureDisplayInfoExtra rows.

`CreatureDisplayInfoExtra.race` is a ChrRaces id, and the 4.3.4 source and our
3.3.5a client only agree on ids 1-21. Cata added **Worgen at race 22**; our client
carries Worgen on the ChrRaces slot the worgoblin module took (12). Emitting the
Cata id verbatim is a hard client crash, not a cosmetic defect:

    CharacterComponent::Initialize (0x4F24D0) bounds-checks the incoming race
    against the ChrRaces max index and, on failure, returns without creating the
    M2 model -- but the component is still queued dirty. The next frame's geoset
    pass (0x4ED900 -> CM2Model::SetGeosetRange, 0x82C7C0) dereferences the null
    model at +0x10 -> #132 ACCESS_VIOLATION reading 0x00000010 (I-334).

So a race id our ChrRaces does not carry must never reach the client. Remap the
ones we know, and refuse to ship the rest.
"""
import os
import struct

# Our live 3.3.5a client DBC tree (same default as npc_appearance's LIVE_DBC).
LIVE_DBC = os.getenv("GOBLIN_LIVE_DBC", "/workspace/project/data/dbc")

# 4.3.4 ChrRaces id -> our ChrRaces id. Ids 1-21 are identical in both clients;
# only Cata's additions need moving.
CATA_TO_LIVE = {
    22: 12,     # Worgen: Cata 22 -> our worgoblin slot 12 (model 3141 WORGENMALE.M2)
}

_live_ids = None


def live_race_ids():
    """Set of ChrRaces ids our client actually ships."""
    global _live_ids
    if _live_ids is None:
        with open(os.path.join(LIVE_DBC, "ChrRaces.dbc"), "rb") as fh:
            d = fh.read()
        _magic, rc, fc, rs, _ss = struct.unpack_from("<4sIIII", d, 0)
        _live_ids = {struct.unpack_from("<I", d, 20 + i * rs)[0] for i in range(rc)}
    return _live_ids


def map_race(raw):
    """(mapped_race, ok) -- ok is False when the result is not a race our client has."""
    race = CATA_TO_LIVE.get(raw, raw)
    return race, race in live_race_ids()
