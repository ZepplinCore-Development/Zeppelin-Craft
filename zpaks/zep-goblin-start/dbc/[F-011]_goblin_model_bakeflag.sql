-- F-011 fix green goblin NPCs: worgoblin's goblin character CreatureModelData (831/832)
-- has flags=0x4, missing the 0x800 "playable-race / NPC-bakeable" bit that all 10 stock
-- playable races carry (0x804). Without it the client skips the CreatureDisplayInfoExtra
-- bake for goblin NPCs -> green skin+face (players are unaffected; player path ignores it).
UPDATE creaturemodeldata SET flags = 2052 WHERE id IN (831, 832);
