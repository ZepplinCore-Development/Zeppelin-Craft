-- [F-031] zep-professions: lock
-- Tiered practice lock entries, cloned from stock lock 5 (Practice Lock,
-- lockpicking skill 1) with higher required skill. Referenced by
-- item_template.lockid on items 57220-57222.

-- Journeyman's Practice Lock: lockpicking 50
DELETE FROM `lock` WHERE `id` = 2000;
INSERT INTO `lock` SET
  `id` = 2000,
  `type_2` = 2,
  `type_3` = 2,
  `type_4` = 2,
  `index_2` = 1,
  `index_3` = 5,
  `index_4` = 6,
  `skill_2` = 50,
  `action_2` = 1;

-- Expert's Practice Lock: lockpicking 100
DELETE FROM `lock` WHERE `id` = 2001;
INSERT INTO `lock` SET
  `id` = 2001,
  `type_2` = 2,
  `type_3` = 2,
  `type_4` = 2,
  `index_2` = 1,
  `index_3` = 5,
  `index_4` = 6,
  `skill_2` = 100,
  `action_2` = 1;

-- Eternium Lockbox: lockpicking 275 (stock item 5760 shares lock 62 = 225 with
-- Reinforced Steel/Mithril/Thorium Lockboxes; this dedicated clone lets Eternium
-- sit between them and Khorium in the lockbox progression. item_template 5760
-- repointed in sql/zz_[F-031]_eternium_lockbox.sql.)
DELETE FROM `lock` WHERE `id` = 2003;
INSERT INTO `lock` SET
  `id` = 2003,
  `type_2` = 2,
  `type_3` = 2,
  `type_4` = 2,
  `index_2` = 1,
  `index_3` = 5,
  `index_4` = 6,
  `skill_2` = 275,
  `action_2` = 1;

-- Artisan's Practice Lock: lockpicking 150
DELETE FROM `lock` WHERE `id` = 2002;
INSERT INTO `lock` SET
  `id` = 2002,
  `type_2` = 2,
  `type_3` = 2,
  `type_4` = 2,
  `index_2` = 1,
  `index_3` = 5,
  `index_4` = 6,
  `skill_2` = 150,
  `action_2` = 1;
