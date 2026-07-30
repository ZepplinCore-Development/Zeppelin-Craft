-- I-284 quest crates stay interactable after the objective is full.
--
-- The Cata source ships these pickups as type-3 CHESTS whose loot is a single
-- quest-required item. AC never gates chest INTERACTION on quest status:
-- chest.questId is dead in the core ("not used currently", GameObjectData.h:92) and
-- only feeds the sparkle through ActivateToQuest, while opening runs
-- client lock cast -> Spell::EffectOpenLock -> Player::SendLoot, which never reads
-- the quest. So at 8/8 the crate was still clickable — the loot did come out empty
-- (AllowedForPlayer -> false once HasQuestForItem stops matching), but the click
-- still landed, and with consumable=1 the loot release sets GO_JUST_DEACTIVATED
-- (LootHandler.cpp:313) and DESPAWNED the crate for its full 120s respawn. A player
-- who had finished the quest could walk the beach deleting the crates the players
-- behind them still needed.
--
-- 3.3.5a models this shape as a type-10 GOOBER (stock ships 168 of them):
-- GameObject::Use (GameObject.cpp:1646-1652) breaks out of the entire switch when
-- goober.questId is not QUEST_STATUS_INCOMPLETE, so a finished player's click does
-- nothing at all — no cast, no item, no loot window, no state change, no despawn —
-- and ActivateToQuest goes false so the activate/sparkle dynflag drops too. The
-- item now comes from goober.spellId (dbc/[I-284]_spell.sql), the same way stock
-- 190510 "Captured Jormungar Spawn" hands over its 3x 36772 for quest 12078.
--
-- These rows are owned by zz_[AUTO,F-011]_20_gameobject_template.sql, so this file
-- carries ONE consolidated UPDATE per entry (the diff from the ported row) and
-- applies after it. The conversion also lives in the emitter — gameobjects.py
-- QUEST_ITEM_GOOBER — so the next `zep goblin gen` emits it directly and these
-- UPDATEs become no-ops writing the same values.
--
-- Data field remap, chest -> goober (every index means something different, so the
-- whole block is rewritten rather than patched):
--   Data0  lockId       1690/1818 -> 0     goober Use() ignores locks; stock uses 0
--   Data1  lootId       <entry>   -> questId   THE gate
--   Data3  consumable   1         -> autoCloseTime 1000ms (AC gates the goober
--                                    state change on it, GameObject.cpp:1615 — at 0
--                                    a consumable goober never despawns)
--   Data5  -                      -> consumable 1
--   Data8  questId      <quest>   -> 0 (goober.language)
--   Data10 -                      -> spellId (CREATE_ITEM)
--   Data14 openTextID             -> unchanged, same index in both layouts
--
-- NOT converted: 202552 Kaja'Cola Zero-One (two loot items, one on a 7.3% roll, and
-- its quest 25122 "Morale Boost" is NPC credit 38441, not an item count) and 195492
-- Kaja'mite Chunk (owned by kajamite.py, SUMMON_GO'd onto a bombed deposit).

-- 195201 Crate of Tools -> 84300 x8, quest 14014 "Get Our Stuff Back!"
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 14014, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900409,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 195201;

-- 201603 Replacement Parts -> 84472 x6, quest 24488 "The Replacements"
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 24488, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900410,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 201603;

-- 202351 Rockin' Powder -> 84321 x5, quest 24946 "Rockin' Powder"
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 24946, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900411,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 202351;

-- 202553 Kaja'Cola Zero-One -> 84331 x1, quest 25110 "Kaja'Cola Gives You IDEAS! (TM)"
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 25110, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900412,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 202553;

-- 202554 Kaja'Cola Zero-One (second dispenser entry, same quest + item)
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 25110, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900412,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 202554;

-- 202607 Spare Shredder Parts -> 84333 x8, quest 25201 "The Ultimate Footbomb Uniform"
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 25201, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900413,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 202607;

-- 202608 Spare Shredder Parts (second parts-pile entry, same quest + item)
UPDATE gameobject_template SET
  `type` = 10, `Data0` = 0, `Data1` = 25201, `Data2` = 0, `Data3` = 1000, `Data4` = 0,
  `Data5` = 1, `Data6` = 0, `Data7` = 0, `Data8` = 0, `Data9` = 0, `Data10` = 900413,
  `Data11` = 0, `Data12` = 0, `Data13` = 0, `Data15` = 0, `Data16` = 0, `Data17` = 0,
  `Data18` = 0, `Data19` = 0, `Data20` = 0, `Data21` = 0, `Data22` = 0, `Data23` = 0
  WHERE entry = 202608;

-- Converted crates have no loot table any more (a goober never reads one). Clearing
-- the orphaned rows so the old chest loot can't be reached by anything else; the
-- emitter now claims these ids for its DELETE without emitting rows for them.
DELETE FROM gameobject_loot_template WHERE Entry IN (195201, 201603, 202351, 202553, 202554, 202607, 202608);
