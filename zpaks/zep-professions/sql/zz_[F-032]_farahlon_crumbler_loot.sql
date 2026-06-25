-- [F-032] Farahlon Crumbler (21077) vendor-trash loot
-- Purpose: give the mob a guaranteed normal drop so its corpse does not despawn
--   immediately, keeping the mining loot (skinloot 100027) reachable.
-- Items copied from Farahlon Giant (18885) grey "Crystalized Stone" vendor trash.
-- creature_template.lootid = 21077 is set in zz_mobs_mineable_[F-032].sql.

DELETE FROM `creature_loot_template` WHERE `Entry` = 21077;
INSERT INTO `creature_loot_template`
  (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
  (21077, 29579, 0, 100,     0, 1, 0, 2, 4, 'Farahlon Crumbler - Crystalized Stone Chips'),
  (21077, 29578, 0, 17.3551, 0, 1, 0, 2, 4, 'Farahlon Crumbler - Crystalized Stone'),
  (21077, 29580, 0, 1.3537,  0, 1, 0, 1, 1, 'Farahlon Crumbler - Crystal Fragments'),
  (21077, 29581, 0, 0.2083,  0, 1, 0, 1, 1, 'Farahlon Crumbler - Strange Crystal');
