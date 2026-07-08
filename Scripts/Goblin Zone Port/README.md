# F-011 Goblin Zone — Neltharion Extraction Pipeline

Isolated, reproducible pipeline to extract Cataclysm Lost Isles / Kezan content
from **Project Neltharion 4.3.4** and port it to WotLK 3.3.5a on **Open Azeroth
Kalimdor (map 1)**. Nothing here touches the production DB — everything loads
into a local ephemeral SQLite file.

## Source
- `world.zip` (83 MB) from `Cryptid-9527/Project-Neltharion-4.3.4` @ `main`
  → `source/sql/base/world.zip`. Unzips to `world.sql` (442 MB), a HeidiSQL
  dump (MariaDB 10.4, `REPLACE INTO (cols) VALUES`, CRLF, backslash escapes).
- Lineage: SkyFire/ArkCORE (note `creature_questrelation` /
  `creature_involvedrelation`, not AC's `creature_queststarter/ender`).

## Steps (run from this directory)
```bash
# 1. download + unzip world.sql next to these scripts, then:
python3 load_dump.py world.sql neltharion.sqlite      # 27 content tables -> SQLite (~45s)
python3 report_lost_isles.py > extract/lost_isles.txt # NPC roster / quest chain / GOs
python3 scan_adt_areas.py    > extract/adt_scan.txt   # MCNK AreaIDs of OA map-1 ADTs -> tiles.json
python3 fit_offset2.py                                # derive map648->map1 offset (area-constrained)
python3 landmarks.py                                  # translated map-1 landmark coords
```

## Derived coordinate transform (map 648 → map 1) — KEY RESULT
```
X_map1 = X_648 - 533.3333     (Δtile dj = 1)
Y_map1 = Y_648 - 12800.0      (Δtile di = 24)
Z_map1 = Z_648                (ADTs copied verbatim; heightmap unchanged)
O_map1 = O_648                (no rotation)
```
Fit confidence: **97.7%** of sub-area-constrained Lost Isles spawns land on the
map-1 ADT tile carrying their exact Cata sub-area id (next candidate 39.8%).
Cross-checked against `WorldMapArea.dbc` (zone 4720 box on map 1).

### Real WoW ADT tile ↔ world convention used here
`world_X = (32 - idxY)·533.333`, `world_Y = (32 - idxX)·533.333`
where the ADT/`.map` filename is `..._idxX_idxY`. (The codebase's
`adt_coordinates.adt_to_world_coords` uses a naive non-swapped formula — do NOT
use it for placement.)

## Footprints (OA map-1 filename tile indices)
- Lost Isles (zone 4720): idxX 47–56, idxY 25–34 (land: idxX 48–55, idxY 28–32;
  the outer ring is area 4785 "The Great Sea").
- Kezan (zone 4737): idxX 44–56, idxY 44–55.

## Scope notes
- Content on map 648, split by `zone`: Lost Isles 4720 (4235 cr / 868 go / 69 quests),
  Kezan 4737 (1200 cr / 425 go / 35 quests).
- Noise to strip when porting: ELM/Wondi's Bunny trigger NPCs, lvl-85 helper
  stalkers, French-named leaked-source junk.
- Phasing is heavy (composite Cata phaseMasks up to 65535) — flatten to
  quest-progression phasemasks on port.
