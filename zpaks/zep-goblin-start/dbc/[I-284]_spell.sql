-- I-284 quest-crate pickups: CREATE_ITEM spells for the chest -> goober conversion.
--
-- The Cata source ships these pickups as type-3 chests whose loot is one
-- quest-required item, and AC never gates chest INTERACTION on quest status
-- (chest.questId is dead in the core, GameObjectData.h:92 — it only feeds the
-- sparkle). Once the objective was full the crate was still clickable: empty loot
-- window, and with consumable=1 the release despawned the crate for its whole
-- respawn timer, so a finished player could delete crates other players needed.
--
-- 3.3.5a's own shape for this is a type-10 goober with goober.questId, which
-- GameObject::Use (GameObject.cpp:1646-1652) makes completely inert once the quest
-- is no longer INCOMPLETE. A goober hands over its item by casting
-- goober.spellId, so each converted crate needs one CREATE_ITEM spell — Cata has
-- no counterpart to port, because Cata used chest loot for these.
--
-- Shape follows stock 190510 "Captured Jormungar Spawn" -> 47451 and the port's
-- own 67041 (I-257): effect 24 CREATE_ITEM, base 0 + die 1 = exactly one item,
-- implicit target 25 with the goober passing the user as the explicit target.
--
-- THESE MUST STAY INSTANT (cast_time_index 1), like both stock spells.
-- The first cut gave them the chest's old ~1s bar (cast_time_index 4 + interrupt_flags
-- 31, copied off spell 3365 "Opening") and quest credit came out INTERMITTENT.
-- GameObject::Use commits the crate BEFORE the spell resolves: it sets GO_FLAG_IN_USE,
-- SetLootState(GO_ACTIVATED) and m_cooldownTime = now + autoCloseTime, and only then
-- casts goober.spellId. At m_cooldownTime the goober goes GO_JUST_DEACTIVATED
-- (GameObject.cpp:754-760) and, being consumable, despawns. So anything that stops a
-- non-instant cast — moving between crates, clicking a second crate while the first
-- cast runs (SPELL_FAILED_SPELL_IN_PROGRESS) — eats the crate and hands over nothing.
-- The old chest could not lose an item this way because loot arrived only on
-- successful cast completion (EffectOpenLock -> SendLoot); the goober's
-- commit-before-resolve order is what makes a cast time unsafe here.
--
-- spell_visual_1 = 180 is the visual spell 3365 "Opening" plays, so the player still
-- gets a reach-into-it cue on the instant cast. Names are kept from each crate's
-- castBarCaption ('Retrieving' / 'Collecting' / 'Grabbing' / 'Salvaging') for the
-- combat log and any future cast bar.
--
-- Ids: 900409-900413. 900400-900408 are in use, 900500-901958 belongs to F-074
-- (zep-dungeons cache spells), so this block sits in the gap between them.
--
-- Owner of the GO side: cli/commands/goblin_gen/gameobjects.py QUEST_ITEM_GOOBER
-- (spell ids are referenced there; keep the two in sync).

-- 195201 Crate of Tools -> 84300 x8, quest 14014 "Get Our Stuff Back!"
DELETE FROM spell WHERE id = 900409;
INSERT INTO spell SET
  id = 900409,
  spell_name_enus = 'Retrieving',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  spell_visual_1 = 180,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84300,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 1;

-- 201603 Replacement Parts -> 84472 x6, quest 24488 "The Replacements"
DELETE FROM spell WHERE id = 900410;
INSERT INTO spell SET
  id = 900410,
  spell_name_enus = 'Collecting',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  spell_visual_1 = 180,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84472,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 1;

-- 202351 Rockin' Powder -> 84321 x5, quest 24946 "Rockin' Powder"
DELETE FROM spell WHERE id = 900411;
INSERT INTO spell SET
  id = 900411,
  spell_name_enus = 'Collecting',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  spell_visual_1 = 180,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84321,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 1;

-- 202553 + 202554 Kaja'Cola Zero-One -> 84331 x1, quest 25110
-- "Kaja'Cola Gives You IDEAS! (TM)". 202552 is NOT converted (two loot items, one
-- on a 7.3% roll, and its quest 25122 is NPC credit) so it keeps chest loot.
DELETE FROM spell WHERE id = 900412;
INSERT INTO spell SET
  id = 900412,
  spell_name_enus = 'Grabbing',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  spell_visual_1 = 180,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84331,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 1;

-- 202607 + 202608 Spare Shredder Parts -> 84333 x8, quest 25201
-- "The Ultimate Footbomb Uniform"
DELETE FROM spell WHERE id = 900413;
INSERT INTO spell SET
  id = 900413,
  spell_name_enus = 'Salvaging',
  school_mask = 1,
  cast_time_index = 1,
  duration_index = 0,
  range_index = 6,
  spell_visual_1 = 180,
  proc_chance = 101,
  equipped_item_class = -1,
  effect_1 = 24,
  effect_base_points_1 = 0,
  effect_die_sides_1 = 1,
  effect_item_type_1 = 84333,
  effect_implicit_target_a_1 = 25,
  spell_icon_id = 1;
