-- ============================================================================
-- I-376 Lost Isles hunter class quests - Taming the Beast (F-011)
-- ============================================================================
-- 3.3.5a grants Tame Beast / Call Pet / Beast Training only through the stock
-- Taming the Beast chain, whose givers are in Durotar/Mulgore. Goblin hunters
-- now do it on the Lost Isles: Bamm Megabomb (38122, at the Sky Falls camp in
-- the level-10 phase) hands out three Taming Rods, then Training the Beast.
--
--   91212 Taming the Beast - Teraptor Bull       (hillside E of the lumber yard)
--   91213 Taming the Beast - Jungle Panther      (higher up the same hillside)
--   91214 Taming the Beast - Contaminated Turtle (beach by the KTC Oil Platform)
--         -> rewards Tame Beast (1579 -> 1515)
--   91215 Training the Beast -> rewards Beast Training (5300)
--
-- Mechanism = stock 6062/6083/6082: rod spell (900912-900914) channels on the
-- beast; when it ends the core casts the final spell (900915-900917, named in
-- the rod's effect 2 trigger spell - Zeppelin-Core I-376 fallback), which
-- charms the beast as a temporary pet and completes the quest. Spells in
-- dbc/[I-376]_spell.sql.
--
-- The level-10 phases (Sky Falls camp 32768, mine 16384 and later) have no
-- tameable beasts but Jungle Panthers at 10-11 (and the rod refuses a beast above
-- the hunter's level), so the chain brings its own level-10 beasts, spawned in
-- phase 50176 (32768 + 16384 + 1024, also covering 16392/32776/32808).
-- Positions sampled from the client tile KALIMDOR_52_28: >= 10 yd apart, ground
-- under 30 deg; turtles on the sand flat (z >= 0.1) around the user's .gps point.
-- ============================================================================

SET @BAMM      := 38122;
SET @Q_RAPTOR  := 91212;
SET @Q_PANTHER := 91213;
SET @Q_TURTLE  := 91214;
SET @Q_TRAIN   := 91215;
SET @RAPTOR    := 900912;  -- Teraptor Bull
SET @PANTHER   := 900913;  -- Jungle Panther (level 10 copy of 40064)
SET @TURTLE    := 900914;  -- Contaminated Turtle
SET @ROD_R     := 84516;
SET @ROD_P     := 84517;
SET @ROD_T     := 84518;

-- Teraptor Bull: copy of Spiny Raptor 38187, Teraptor Matriarch model
DELETE FROM creature_template WHERE entry = @RAPTOR;
INSERT INTO creature_template SET
  entry = @RAPTOR,
  name = 'Teraptor Bull',
  minlevel = 10,
  maxlevel = 10,
  faction = 14,
  speed_walk = 1,
  speed_run = 0.8571,
  speed_swim = 1,
  speed_flight = 1,
  detection_range = 18,
  DamageModifier = 0.75,
  BaseAttackTime = 2000,
  BaseVariance = 1,
  RangeVariance = 1,
  unit_class = 1,
  unit_flags = 32768,
  dynamicflags = 2048,
  family = 11,
  type = 1,
  type_flags = 1,
  lootid = 38187,
  skinloot = 38187,
  MovementType = 1,
  HoverHeight = 1,
  HealthModifier = 1,
  ManaModifier = 1,
  ArmorModifier = 1,
  ExperienceModifier = 1,
  RegenHealth = 1;

DELETE FROM creature_template_model WHERE CreatureID = @RAPTOR;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
  (@RAPTOR, 0, 30303, 1, 1, 0);

-- Jungle Panther: copy of Jungle Panther 40064, level fixed at 10
DELETE FROM creature_template WHERE entry = @PANTHER;
INSERT INTO creature_template SET
  entry = @PANTHER,
  name = 'Jungle Panther',
  minlevel = 10,
  maxlevel = 10,
  faction = 2200,
  speed_walk = 1,
  speed_run = 0.8571,
  speed_swim = 1,
  speed_flight = 1,
  detection_range = 18,
  DamageModifier = 0.75,
  BaseAttackTime = 2000,
  BaseVariance = 1,
  RangeVariance = 1,
  unit_class = 1,
  unit_flags = 32768,
  dynamicflags = 2048,
  family = 2,
  type = 1,
  type_flags = 1,
  lootid = 40064,
  skinloot = 40064,
  MovementType = 1,
  HoverHeight = 1,
  HealthModifier = 1,
  ManaModifier = 1,
  ArmorModifier = 1,
  ExperienceModifier = 1,
  RegenHealth = 1;

DELETE FROM creature_template_model WHERE CreatureID = @PANTHER;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
  (@PANTHER, 0, 599, 1, 1, 0);

-- Contaminated Turtle: copy of Ancient Island Turtle 36732
DELETE FROM creature_template WHERE entry = @TURTLE;
INSERT INTO creature_template SET
  entry = @TURTLE,
  name = 'Contaminated Turtle',
  minlevel = 10,
  maxlevel = 10,
  faction = 189,
  speed_walk = 1,
  speed_run = 0.8571,
  speed_swim = 2,
  speed_flight = 1,
  detection_range = 18,
  DamageModifier = 0.75,
  BaseAttackTime = 2000,
  BaseVariance = 1,
  RangeVariance = 1,
  unit_class = 1,
  unit_flags = 32768,
  dynamicflags = 2048,
  family = 21,
  type = 1,
  type_flags = 1,
  lootid = 36732,
  skinloot = 38845,
  MovementType = 1,
  HoverHeight = 1,
  HealthModifier = 1,
  ManaModifier = 1,
  ArmorModifier = 1,
  ExperienceModifier = 1,
  RegenHealth = 1;

DELETE FROM creature_template_model WHERE CreatureID = @TURTLE;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability, VerifiedBuild) VALUES
  (@TURTLE, 0, 17654, 1, 1, 0);

-- Spawns: guids 3110902-3110921 (explicit 3110xxx guids, see the auto-increment wipe trap)
DELETE FROM creature WHERE guid BETWEEN 3110902 AND 3110921;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, spawntimesecs, wander_distance, MovementType, Comment) VALUES
  (3110902, @RAPTOR, 1, 1, 50176, 1763.87, -11055.98, 79.32, 2.961, 60, 6, 1, '[I-376] raptor spawn'),
  (3110903, @RAPTOR, 1, 1, 50176, 1715.42, -11070.91, 106.43, 2.675, 60, 6, 1, '[I-376] raptor spawn'),
  (3110904, @RAPTOR, 1, 1, 50176, 1731.13, -11087.38, 103.8, 3.855, 60, 6, 1, '[I-376] raptor spawn'),
  (3110905, @RAPTOR, 1, 1, 50176, 1742.7, -11103.55, 102.68, 3.159, 60, 6, 1, '[I-376] raptor spawn'),
  (3110906, @RAPTOR, 1, 1, 50176, 1716.93, -11050.0, 100.93, 5.058, 60, 6, 1, '[I-376] raptor spawn'),
  (3110907, @RAPTOR, 1, 1, 50176, 1748.16, -11043.7, 84.88, 4.798, 60, 6, 1, '[I-376] raptor spawn'),
  (3110908, @RAPTOR, 1, 1, 50176, 1779.63, -11066.73, 74.15, 3.194, 60, 6, 1, '[I-376] raptor spawn'),
  (3110909, @PANTHER, 1, 1, 50176, 1646.08, -11114.92, 148.25, 2.088, 60, 6, 1, '[I-376] panther spawn'),
  (3110910, @PANTHER, 1, 1, 50176, 1663.81, -11148.64, 150.82, 5.515, 60, 6, 1, '[I-376] panther spawn'),
  (3110911, @PANTHER, 1, 1, 50176, 1689.76, -11154.99, 142.97, 2.668, 60, 6, 1, '[I-376] panther spawn'),
  (3110912, @PANTHER, 1, 1, 50176, 1671.92, -11094.41, 135.08, 1.215, 60, 6, 1, '[I-376] panther spawn'),
  (3110913, @PANTHER, 1, 1, 50176, 1662.7, -11121.31, 145.31, 0.38, 60, 6, 1, '[I-376] panther spawn'),
  (3110914, @PANTHER, 1, 1, 50176, 1703.83, -11155.91, 135.53, 6.155, 60, 6, 1, '[I-376] panther spawn'),
  (3110915, @TURTLE, 1, 1, 50176, 1918.83, -10986.6, 0.26, 1.898, 60, 6, 1, '[I-376] turtle spawn'),
  (3110916, @TURTLE, 1, 1, 50176, 1916.21, -10961.19, 0.27, 2.26, 60, 6, 1, '[I-376] turtle spawn'),
  (3110917, @TURTLE, 1, 1, 50176, 1907.87, -10989.52, 0.27, 0.872, 60, 6, 1, '[I-376] turtle spawn'),
  (3110918, @TURTLE, 1, 1, 50176, 1952.74, -10971.47, 0.21, 1.689, 60, 6, 1, '[I-376] turtle spawn'),
  (3110919, @TURTLE, 1, 1, 50176, 1893.13, -10995.58, 0.27, 5.797, 60, 6, 1, '[I-376] turtle spawn'),
  (3110920, @TURTLE, 1, 1, 50176, 1913.2, -11001.0, 0.2, 5.812, 60, 6, 1, '[I-376] turtle spawn'),
  (3110921, @TURTLE, 1, 1, 50176, 1929.67, -10974.48, 0.27, 0.911, 60, 6, 1, '[I-376] turtle spawn');

DELETE FROM item_template WHERE entry = @ROD_R;
INSERT INTO item_template SET
  entry = @ROD_R,
  class = 12,
  subclass = 0,
  name = 'Taming Rod',
  displayid = 26595,
  Quality = 1,
  Flags = 64,
  BuyCount = 1,
  ItemLevel = 1,
  maxcount = 1,
  stackable = 1,
  spellid_1 = 900912,
  spelltrigger_1 = 0,
  spellcharges_1 = 3,
  spellcooldown_1 = -1,
  spellcategorycooldown_1 = -1,
  bonding = 4,
  description = 'Use on a Teraptor Bull.',
  Material = -1;

DELETE FROM item_template WHERE entry = @ROD_P;
INSERT INTO item_template SET
  entry = @ROD_P,
  class = 12,
  subclass = 0,
  name = 'Taming Rod',
  displayid = 26595,
  Quality = 1,
  Flags = 64,
  BuyCount = 1,
  ItemLevel = 1,
  maxcount = 1,
  stackable = 1,
  spellid_1 = 900913,
  spelltrigger_1 = 0,
  spellcharges_1 = 3,
  spellcooldown_1 = -1,
  spellcategorycooldown_1 = -1,
  bonding = 4,
  description = 'Use on a Jungle Panther.',
  Material = -1;

DELETE FROM item_template WHERE entry = @ROD_T;
INSERT INTO item_template SET
  entry = @ROD_T,
  class = 12,
  subclass = 0,
  name = 'Taming Rod',
  displayid = 26595,
  Quality = 1,
  Flags = 64,
  BuyCount = 1,
  ItemLevel = 1,
  maxcount = 1,
  stackable = 1,
  spellid_1 = 900914,
  spelltrigger_1 = 0,
  spellcharges_1 = 3,
  spellcooldown_1 = -1,
  spellcategorycooldown_1 = -1,
  bonding = 4,
  description = 'Use on a Contaminated Turtle.',
  Material = -1;

-- ---------------------------------------------------------------------------
-- Quests (fields follow stock 6062/6083/6082/6081)
-- ---------------------------------------------------------------------------
DELETE FROM quest_template WHERE ID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_template SET
  ID = @Q_RAPTOR,
  QuestType = 2,
  QuestLevel = 10,
  MinLevel = 10,
  QuestSortID = -261,
  RewardNextQuest = @Q_PANTHER,
  RewardXPDifficulty = 5,
  StartItem = @ROD_R,
  Flags = 2,
  AllowableRaces = 256,
  RequiredItemId1 = @ROD_R,
  RequiredItemCount1 = 1,
  LogTitle = 'Taming the Beast',
  LogDescription = 'Use the Taming Rod to tame a Teraptor Bull on the hillside east of the Bilgewater Lumber Yard, then return the rod to Bamm Megabomb.',
  QuestDescription = 'So you want a pet, $N? Every $c worth the gold has one. I''m your personal trainer, so let''s get you started.$B$BHere''s a Taming Rod. On the hillside east of the Bilgewater Lumber Yard, the Teraptor Bulls have been running wild ever since this island started coming apart. Use the rod on one and keep its attention until it''s yours.$B$BThen bring the rod back. They don''t grow on trees, you know.',
  QuestCompletionLog = 'Return the Taming Rod to Bamm Megabomb.';

INSERT INTO quest_template SET
  ID = @Q_PANTHER,
  QuestType = 2,
  QuestLevel = 10,
  MinLevel = 10,
  QuestSortID = -261,
  RewardNextQuest = @Q_TURTLE,
  RewardXPDifficulty = 5,
  StartItem = @ROD_P,
  Flags = 2,
  AllowableRaces = 256,
  RequiredItemId1 = @ROD_P,
  RequiredItemCount1 = 1,
  LogTitle = 'Taming the Beast',
  LogDescription = 'Use the Taming Rod to tame a Jungle Panther higher up the hillside east of the Bilgewater Lumber Yard, then return the rod to Bamm Megabomb.',
  QuestDescription = 'Teraptors are all charge and no brains. Panthers are a different deal: smart, quiet, and they bite back.$B$BHigher up that same hillside you''ll find Jungle Panthers prowling. Take this rod and make one of them yours. Keep your eyes on it the whole time, or it''ll be your face it''s eating instead of my profits.',
  QuestCompletionLog = 'Return the Taming Rod to Bamm Megabomb.';

INSERT INTO quest_template SET
  ID = @Q_TURTLE,
  QuestType = 2,
  QuestLevel = 10,
  MinLevel = 10,
  QuestSortID = -261,
  RewardNextQuest = @Q_TRAIN,
  RewardXPDifficulty = 5,
  RewardDisplaySpell = 23356,
  RewardSpell = 1579,
  StartItem = @ROD_T,
  Flags = 2,
  AllowableRaces = 256,
  RequiredItemId1 = @ROD_T,
  RequiredItemCount1 = 1,
  LogTitle = 'Taming the Beast',
  LogDescription = 'Use the Taming Rod to tame a Contaminated Turtle on the beach by the KTC Oil Platform, then return the rod to Bamm Megabomb.',
  QuestDescription = 'Last one, $N. Down on the beach by the KTC Oil Platform, the turtles have been soaking in the Trade Prince''s runoff for weeks. They glow. They''re grumpy. They''re basically walking hazardous waste.$B$BTame one of those and you can tame anything on this island. Here''s your last rod.',
  QuestCompletionLog = 'Return the Taming Rod to Bamm Megabomb.';

INSERT INTO quest_template SET
  ID = @Q_TRAIN,
  QuestType = 2,
  QuestLevel = 10,
  MinLevel = 10,
  QuestSortID = -261,
  RewardXPDifficulty = 3,
  RewardDisplaySpell = 23357,
  RewardSpell = 5300,
  Flags = 8,
  AllowableRaces = 256,
  LogTitle = 'Training the Beast',
  LogDescription = 'Speak to Bamm Megabomb.',
  QuestDescription = 'Taming a pet is one thing. Keeping it fed, happy and doing what you tell it? That''s management, $N, and management is where the real money is.$B$BLet me show you how to train your new pet. Then go find one worth keeping.';

DELETE FROM quest_template_addon WHERE ID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_template_addon (ID, AllowableClasses, PrevQuestID, ProvidedItemCount, SpecialFlags) VALUES
  (@Q_RAPTOR,  4, 0,          1, 2),
  (@Q_PANTHER, 4, @Q_RAPTOR,  1, 2),
  (@Q_TURTLE,  4, @Q_PANTHER, 1, 2),
  (@Q_TRAIN,   4, @Q_TURTLE,  0, 0);

DELETE FROM quest_request_items WHERE ID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_request_items (ID, EmoteOnComplete, EmoteOnIncomplete, CompletionText) VALUES
  (@Q_RAPTOR,  1, 1, 'Got that teraptor eating out of your hand yet? Careful, it''ll eat the hand too.'),
  (@Q_PANTHER, 1, 1, 'Still got all your fingers? Good. Count them again just to be sure.'),
  (@Q_TURTLE,  1, 1, 'Did it glow at you? They glow at you.');

DELETE FROM quest_offer_reward WHERE ID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_offer_reward (ID, Emote1, RewardText) VALUES
  (@Q_RAPTOR,  273, 'Not bad, $N! You''re a natural. Now let''s see how you handle something with claws.'),
  (@Q_PANTHER, 273, 'Look at that, not a scratch on you. Well, not many. One more and you''re ready for the big leagues.'),
  (@Q_TURTLE,  273, 'Three for three! You''ve earned it, $N: from now on you can tame any beast you like, no rod required. Just don''t try it on the Trade Prince.'),
  (@Q_TRAIN,   1,   'There. Your pet can learn new tricks now, and you can feed it. Happy pets work harder, and harder work means better returns. Good luck out there, $N.');

DELETE FROM creature_queststarter WHERE quest BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO creature_queststarter (id, quest) VALUES
  (@BAMM, @Q_RAPTOR), (@BAMM, @Q_PANTHER), (@BAMM, @Q_TURTLE), (@BAMM, @Q_TRAIN);
DELETE FROM creature_questender WHERE quest BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO creature_questender (id, quest) VALUES
  (@BAMM, @Q_RAPTOR), (@BAMM, @Q_PANTHER), (@BAMM, @Q_TURTLE), (@BAMM, @Q_TRAIN);

-- ---------------------------------------------------------------------------
-- Spells: each rod only works on its own creature (source type 17 = spell,
-- target 1 = explicit target, type 31 = object entry: TypeID 3 unit + entry).
-- Stock quest rods have no such restriction here and would take any beast.
-- ---------------------------------------------------------------------------
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 17 AND SourceEntry IN (900912, 900913, 900914);
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) VALUES
  (17, 0, 900912, 0, 0, 31, 1, 3, @RAPTOR,  0, 0, 0, 0, '', 'I-376 Tame Teraptor Bull - only on a Teraptor Bull'),
  (17, 0, 900913, 0, 0, 31, 1, 3, @PANTHER, 0, 0, 0, 0, '', 'I-376 Tame Jungle Panther - only on the level-10 Jungle Panther'),
  (17, 0, 900914, 0, 0, 31, 1, 3, @TURTLE,  0, 0, 0, 0, '', 'I-376 Tame Contaminated Turtle - only on a Contaminated Turtle');

-- Same scripts as the stock rods (19694 etc.) and final tames (19681 etc.):
-- tame checks on the rod, despawn-on-dismiss on the temporary pet.
DELETE FROM spell_script_names WHERE spell_id BETWEEN 900912 AND 900917;
INSERT INTO spell_script_names (spell_id, ScriptName) VALUES
  (900912, 'spell_hun_tame_beast'),
  (900913, 'spell_hun_tame_beast'),
  (900914, 'spell_hun_tame_beast'),
  (900915, 'spell_hun_taming_the_beast'),
  (900916, 'spell_hun_taming_the_beast'),
  (900917, 'spell_hun_taming_the_beast');

-- ---------------------------------------------------------------------------
-- Quest POIs (area 544 = Lost Isles). Stock taming quests mark the hunting
-- ground on objective 16 (the event objective) and the turn-in on -1.
-- ---------------------------------------------------------------------------
DELETE FROM quest_poi WHERE QuestID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_poi (QuestID, id, ObjectiveIndex, MapID, WorldMapAreaId, Floor, Priority, Flags, VerifiedBuild) VALUES
  (@Q_RAPTOR,  0, -1, 1, 544, 0, 0, 1, 0),
  (@Q_RAPTOR,  1, 16, 1, 544, 0, 0, 1, 0),
  (@Q_PANTHER, 0, -1, 1, 544, 0, 0, 1, 0),
  (@Q_PANTHER, 1, 16, 1, 544, 0, 0, 1, 0),
  (@Q_TURTLE,  0, -1, 1, 544, 0, 0, 1, 0),
  (@Q_TURTLE,  1, 16, 1, 544, 0, 0, 1, 0),
  (@Q_TRAIN,   0, -1, 1, 544, 0, 0, 1, 0);

DELETE FROM quest_poi_points WHERE QuestID BETWEEN @Q_RAPTOR AND @Q_TRAIN;
INSERT INTO quest_poi_points (QuestID, Idx1, Idx2, X, Y, VerifiedBuild) VALUES
  (@Q_RAPTOR,  0, 0, 1268, -10843, 0),
  (@Q_RAPTOR,  1, 0, 1790, -11040, 0), (@Q_RAPTOR, 1, 1, 1790, -11110, 0),
  (@Q_RAPTOR,  1, 2, 1705, -11115, 0), (@Q_RAPTOR, 1, 3, 1705, -11040, 0),
  (@Q_PANTHER, 0, 0, 1268, -10843, 0),
  (@Q_PANTHER, 1, 0, 1715, -11085, 0), (@Q_PANTHER, 1, 1, 1715, -11165, 0),
  (@Q_PANTHER, 1, 2, 1635, -11165, 0), (@Q_PANTHER, 1, 3, 1635, -11085, 0),
  (@Q_TURTLE,  0, 0, 1268, -10843, 0),
  (@Q_TURTLE,  1, 0, 1965, -10960, 0), (@Q_TURTLE, 1, 1, 1960, -11005, 0),
  (@Q_TURTLE,  1, 2, 1890, -11010, 0), (@Q_TURTLE, 1, 3, 1885, -10955, 0),
  (@Q_TRAIN,   0, 0, 1268, -10843, 0);

-- ---------------------------------------------------------------------------
-- Goblins no longer take the stock taming chain or its breadcrumbs (386 -> 130).
-- ---------------------------------------------------------------------------
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6062;  -- Taming the Beast
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6083;  -- Taming the Beast
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6082;  -- Taming the Beast
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6081;  -- Training the Beast
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6068;  -- The Hunter's Path
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6069;  -- The Hunter's Path
UPDATE quest_template SET AllowableRaces = 130 WHERE ID = 6070;  -- The Hunter's Path
