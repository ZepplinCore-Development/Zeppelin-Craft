# F-011 goblin pipeline fixtures

Curated input data for the `zep goblin gen` translation layer. These encode
**human scoping/curation decisions** made during the Lost Isles / Kezan port that
cannot be re-derived mechanically from the Neltharion source alone. They were
previously produced ad-hoc in a scratch dir (now committed here so `gen` is
reproducible and the curation is not lost).

`_K` suffix = Kezan variant; no suffix = Lost Isles.

## Curation / scope (hand-maintained — no generator; must live as fixtures)
| Fixture | Purpose |
|---|---|
| `item_scope[.|_K].json` | Which quests / creatures / items are in F-011 scope |
| `go_scope[.|_K].json` | Gameobjects in scope |
| `go_disp_paths[.|_K].json` | Gameobject display → client model path |
| `trainer_scope[.|_K].json` | Trainer NPCs in scope |
| `vendor_scope[.|_K].json` | Vendor NPCs in scope |
| `vendor_new_items.json` | New vendor items to create |
| `smartai_scope.json` | Creatures / GOs whose SmartAI is ported |
| `smartai_castflags.json` | `smart_scripts` rows whose `action_param2` (castFlags) is wrong **in the donor source** — repaired at emit so a verbatim import stops reproducing the donor's bug (I-316) |
| `missing_items.json` | Item ids referenced but absent from the Neltharion source — recover from Whitemane Item-sparse |
| `missing_spells.json` | Spell ids to recover |
| `npc_equip_missing.json` | NPCs needing equipment recovery |
| `my_baked_extras.json` | Extra baked-NPC texture entries |
| `fb_plan.json` | Fallback creature-model plan (which displays get retroported fallbacks) |
| `text_overrides.json` | I-302 enUS strings for rows tdb434 cannot key (see `goblin_gen/_entext.py`) |
| `item_spell_wm.json` | Item → on-use spell mapping sourced from Whitemane |

## Derived (a generator exists — snapshotted here; `gen` will regenerate)
| Fixture | Produced by | Note |
|---|---|---|
| `item_remap.json` | migrate_items / migrate_vendors / append_items | Cata item id → F-011 84300–84799 block. Snapshot; regenerated once those emitters are ported into `gen`. |
| `go_scope*` | scope_zone | (also scope curation) |

Source of record for the `zep goblin` pipeline (the predecessor
`Scripts/Goblin Zone Port/` scripts are retired and deleted). See the
`zep goblin` reference note for the pipeline overview.
