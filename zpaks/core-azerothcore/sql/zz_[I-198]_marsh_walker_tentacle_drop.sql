-- I-198: Fen Strider Tentacle (24427) missing from Marsh Walker loot
-- Stock AC only has the drop on Fen Strider (18134) at 20%, matching TBC-era data.
-- In 3.3.5 retail Marsh Walker (18135) also dropped it (Wowhead WotLK: 166/9392 raw,
-- diluted by quest gating). Add at 20% QuestRequired to match Fen Strider, making
-- all 75 strider-type Zangarmarsh spawns viable for quest 9801 (Gathering the Reagents).

DELETE FROM creature_loot_template WHERE entry = 18135 AND item = 24427;
INSERT INTO creature_loot_template (entry, item, Reference, Chance, QuestRequired, LootMode, GroupId, MinCount, MaxCount, Comment) VALUES
(18135, 24427, 0, 20, 1, 1, 0, 1, 1, 'Marsh Walker - Fen Strider Tentacle');
