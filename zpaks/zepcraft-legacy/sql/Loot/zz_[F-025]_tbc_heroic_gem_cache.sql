-- =============================================================================
-- TBC Heroic Gem Cache System (F-025 Phase 7c)
-- =============================================================================
-- Consolidates TBC heroic dungeon epic gems into a single class-appropriate cache
-- Replaces individual gem drops on heroic end bosses with "Ornate Gem Cache"
-- Cache contains gems suited to the opening player's class/role
-- =============================================================================

-- =============================================================================
-- ITEM TEMPLATE: Ornate Gem Cache (59338)
-- =============================================================================
-- DisplayID 18721 = Ornately Jeweled Box icon
DELETE FROM `item_template` WHERE `entry` = 59338;

INSERT INTO `item_template` SET
    `entry` = 59338,
    `class` = 15,
    `name` = 'Ornate Gem Cache',
    `displayid` = 18721,
    `Quality` = 3,
    `Flags` = 4,
    `ItemLevel` = 70,
    `RequiredLevel` = 70,
    `bonding` = 1,
    `maxcount` = 1,
    `stackable` = 1,
    `SellPrice` = 10000,
    `description` = 'Contains a gem suited to your class.';

-- =============================================================================
-- ITEM LOOT TEMPLATE: Class-specific gem references
-- =============================================================================
-- GroupId must match the reference_loot_template GroupId for conditions to work
-- Each class gets their own reference table with appropriate gems

DELETE FROM `item_loot_template` WHERE `Entry` = 59338;
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Reference to class-specific gem tables
(59338, 1, 59592, 100, 0, 1, 1, 1, 1, 'Warrior gems'),
(59338, 2, 59593, 100, 0, 1, 2, 1, 1, 'Paladin gems'),
(59338, 3, 59594, 100, 0, 1, 3, 1, 1, 'Hunter gems'),
(59338, 4, 59595, 100, 0, 1, 4, 1, 1, 'Rogue gems'),
(59338, 5, 59596, 100, 0, 1, 5, 1, 1, 'Priest gems'),
(59338, 6, 59597, 100, 0, 1, 6, 1, 1, 'Death Knight gems'),
(59338, 7, 59598, 100, 0, 1, 7, 1, 1, 'Shaman gems'),
(59338, 8, 59599, 100, 0, 1, 8, 1, 1, 'Mage gems'),
(59338, 9, 59600, 100, 0, 1, 9, 1, 1, 'Warlock gems'),
(59338, 10, 59601, 100, 0, 1, 10, 1, 1, 'Druid gems');

-- =============================================================================
-- REFERENCE LOOT TEMPLATE: Class-specific gems
-- =============================================================================
-- Each class gets gems appropriate to their roles/specs
-- GroupId must match parent item_loot_template GroupId

DELETE FROM `reference_loot_template` WHERE `Entry` BETWEEN 59592 AND 59601;

-- -----------------------------------------------------------------------------
-- Warrior (59592) - Tank + Physical DPS
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Tank gems
(59592, 30601, 0, 0, 0, 1, 1, 1, 1, 'Beaming Fire Opal - Dodge + Resilience'),
(59592, 30587, 0, 0, 0, 1, 1, 1, 1, 'Champion''s Fire Opal - Str + Defense'),
(59592, 30554, 0, 0, 0, 1, 1, 1, 1, 'Stalwart Fire Opal - Defense + Dodge'),
(59592, 30558, 0, 0, 0, 1, 1, 1, 1, 'Glimmering Fire Opal - Parry + Defense'),
(59592, 30575, 0, 0, 0, 1, 1, 1, 1, 'Nimble Fire Opal - Dodge + Hit'),
(59592, 30563, 0, 0, 0, 1, 1, 1, 1, 'Regal Tanzanite - Dodge + Stamina'),
(59592, 30566, 0, 0, 0, 1, 1, 1, 1, 'Defender''s Tanzanite - Parry + Stamina'),
(59592, 30590, 0, 0, 0, 1, 1, 1, 1, 'Enduring Chrysoprase - Stamina + Defense'),
-- Physical DPS gems
(59592, 30584, 0, 0, 0, 1, 1, 1, 1, 'Enscribed Fire Opal - Str + Crit'),
(59592, 30553, 0, 0, 0, 1, 1, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59592, 30559, 0, 0, 0, 1, 1, 1, 1, 'Etched Fire Opal - Str + Hit'),
(59592, 30582, 0, 0, 0, 1, 1, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59592, 30546, 0, 0, 0, 1, 1, 1, 1, 'Sovereign Tanzanite - Str + Stamina'),
(59592, 30574, 0, 0, 0, 1, 1, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
(59592, 30602, 0, 0, 0, 1, 1, 1, 1, 'Jagged Chrysoprase - Stamina + Crit');

-- -----------------------------------------------------------------------------
-- Paladin (59593) - Tank + Physical DPS + Healer (all three specs)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Tank gems (Protection)
(59593, 30601, 0, 0, 0, 1, 2, 1, 1, 'Beaming Fire Opal - Dodge + Resilience'),
(59593, 30587, 0, 0, 0, 1, 2, 1, 1, 'Champion''s Fire Opal - Str + Defense'),
(59593, 30554, 0, 0, 0, 1, 2, 1, 1, 'Stalwart Fire Opal - Defense + Dodge'),
(59593, 30558, 0, 0, 0, 1, 2, 1, 1, 'Glimmering Fire Opal - Parry + Defense'),
(59593, 30563, 0, 0, 0, 1, 2, 1, 1, 'Regal Tanzanite - Dodge + Stamina'),
(59593, 30566, 0, 0, 0, 1, 2, 1, 1, 'Defender''s Tanzanite - Parry + Stamina'),
(59593, 30590, 0, 0, 0, 1, 2, 1, 1, 'Enduring Chrysoprase - Stamina + Defense'),
-- Physical DPS gems (Retribution)
(59593, 30584, 0, 0, 0, 1, 2, 1, 1, 'Enscribed Fire Opal - Str + Crit'),
(59593, 30553, 0, 0, 0, 1, 2, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59593, 30559, 0, 0, 0, 1, 2, 1, 1, 'Etched Fire Opal - Str + Hit'),
(59593, 30582, 0, 0, 0, 1, 2, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59593, 30546, 0, 0, 0, 1, 2, 1, 1, 'Sovereign Tanzanite - Str + Stamina'),
-- Healer gems (Holy)
(59593, 30547, 0, 0, 0, 1, 2, 1, 1, 'Luminous Fire Opal - Healing + Int'),
(59593, 30581, 0, 0, 0, 1, 2, 1, 1, 'Durable Fire Opal - Healing + Resilience'),
(59593, 30603, 0, 0, 0, 1, 2, 1, 1, 'Royal Tanzanite - Healing + mp5'),
(59593, 30572, 0, 0, 0, 1, 2, 1, 1, 'Imperial Tanzanite - Spirit + Healing'),
(59593, 30552, 0, 0, 0, 1, 2, 1, 1, 'Blessed Tanzanite - Healing + Stamina'),
(59593, 30589, 0, 0, 0, 1, 2, 1, 1, 'Dazzling Chrysoprase - Int + mp5');

-- -----------------------------------------------------------------------------
-- Hunter (59594) - Physical DPS (Agility focus)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59594, 30553, 0, 0, 0, 1, 3, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59594, 30582, 0, 0, 0, 1, 3, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59594, 30556, 0, 0, 0, 1, 3, 1, 1, 'Glinting Fire Opal - Agi + Hit'),
(59594, 30565, 0, 0, 0, 1, 3, 1, 1, 'Assassin''s Fire Opal - Crit + Dodge'),
(59594, 30549, 0, 0, 0, 1, 3, 1, 1, 'Shifting Tanzanite - Agi + Stamina'),
(59594, 30574, 0, 0, 0, 1, 3, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
(59594, 30602, 0, 0, 0, 1, 3, 1, 1, 'Jagged Chrysoprase - Stamina + Crit'),
(59594, 30550, 0, 0, 0, 1, 3, 1, 1, 'Sundered Chrysoprase - Crit + mp5');

-- -----------------------------------------------------------------------------
-- Rogue (59595) - Physical DPS (Agility focus)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59595, 30553, 0, 0, 0, 1, 4, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59595, 30582, 0, 0, 0, 1, 4, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59595, 30556, 0, 0, 0, 1, 4, 1, 1, 'Glinting Fire Opal - Agi + Hit'),
(59595, 30565, 0, 0, 0, 1, 4, 1, 1, 'Assassin''s Fire Opal - Crit + Dodge'),
(59595, 30575, 0, 0, 0, 1, 4, 1, 1, 'Nimble Fire Opal - Dodge + Hit'),
(59595, 30549, 0, 0, 0, 1, 4, 1, 1, 'Shifting Tanzanite - Agi + Stamina'),
(59595, 30574, 0, 0, 0, 1, 4, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
(59595, 30602, 0, 0, 0, 1, 4, 1, 1, 'Jagged Chrysoprase - Stamina + Crit');

-- -----------------------------------------------------------------------------
-- Priest (59596) - Healer + Caster DPS
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Healer gems (Holy/Disc)
(59596, 30547, 0, 0, 0, 1, 5, 1, 1, 'Luminous Fire Opal - Healing + Int'),
(59596, 30581, 0, 0, 0, 1, 5, 1, 1, 'Durable Fire Opal - Healing + Resilience'),
(59596, 30603, 0, 0, 0, 1, 5, 1, 1, 'Royal Tanzanite - Healing + mp5'),
(59596, 30572, 0, 0, 0, 1, 5, 1, 1, 'Imperial Tanzanite - Spirit + Healing'),
(59596, 30552, 0, 0, 0, 1, 5, 1, 1, 'Blessed Tanzanite - Healing + Stamina'),
(59596, 30589, 0, 0, 0, 1, 5, 1, 1, 'Dazzling Chrysoprase - Int + mp5'),
(59596, 30586, 0, 0, 0, 1, 5, 1, 1, 'Seer''s Chrysoprase - Int + Spirit'),
-- Caster DPS gems (Shadow)
(59596, 30588, 0, 0, 0, 1, 5, 1, 1, 'Potent Fire Opal - Spell Dmg + Spell Crit'),
(59596, 30551, 0, 0, 0, 1, 5, 1, 1, 'Infused Fire Opal - Spell Dmg + Int'),
(59596, 30564, 0, 0, 0, 1, 5, 1, 1, 'Shining Fire Opal - Spell Dmg + Spell Hit'),
(59596, 30600, 0, 0, 0, 1, 5, 1, 1, 'Fluorescent Tanzanite - Spell Dmg + Spirit'),
(59596, 30555, 0, 0, 0, 1, 5, 1, 1, 'Glowing Tanzanite - Spell Dmg + Stamina'),
(59596, 30560, 0, 0, 0, 1, 5, 1, 1, 'Rune Covered Chrysoprase - Spell Crit + mp5'),
(59596, 30605, 0, 0, 0, 1, 5, 1, 1, 'Vivid Chrysoprase - Spell Hit + Stamina');

-- -----------------------------------------------------------------------------
-- Death Knight (59597) - Tank + Physical DPS (same as Warrior)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Tank gems
(59597, 30601, 0, 0, 0, 1, 6, 1, 1, 'Beaming Fire Opal - Dodge + Resilience'),
(59597, 30587, 0, 0, 0, 1, 6, 1, 1, 'Champion''s Fire Opal - Str + Defense'),
(59597, 30554, 0, 0, 0, 1, 6, 1, 1, 'Stalwart Fire Opal - Defense + Dodge'),
(59597, 30558, 0, 0, 0, 1, 6, 1, 1, 'Glimmering Fire Opal - Parry + Defense'),
(59597, 30575, 0, 0, 0, 1, 6, 1, 1, 'Nimble Fire Opal - Dodge + Hit'),
(59597, 30563, 0, 0, 0, 1, 6, 1, 1, 'Regal Tanzanite - Dodge + Stamina'),
(59597, 30566, 0, 0, 0, 1, 6, 1, 1, 'Defender''s Tanzanite - Parry + Stamina'),
(59597, 30590, 0, 0, 0, 1, 6, 1, 1, 'Enduring Chrysoprase - Stamina + Defense'),
-- Physical DPS gems
(59597, 30584, 0, 0, 0, 1, 6, 1, 1, 'Enscribed Fire Opal - Str + Crit'),
(59597, 30553, 0, 0, 0, 1, 6, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59597, 30559, 0, 0, 0, 1, 6, 1, 1, 'Etched Fire Opal - Str + Hit'),
(59597, 30582, 0, 0, 0, 1, 6, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59597, 30546, 0, 0, 0, 1, 6, 1, 1, 'Sovereign Tanzanite - Str + Stamina'),
(59597, 30574, 0, 0, 0, 1, 6, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
(59597, 30602, 0, 0, 0, 1, 6, 1, 1, 'Jagged Chrysoprase - Stamina + Crit');

-- -----------------------------------------------------------------------------
-- Shaman (59598) - Healer + Caster DPS + Physical DPS (all three specs)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Healer gems (Restoration)
(59598, 30547, 0, 0, 0, 1, 7, 1, 1, 'Luminous Fire Opal - Healing + Int'),
(59598, 30581, 0, 0, 0, 1, 7, 1, 1, 'Durable Fire Opal - Healing + Resilience'),
(59598, 30603, 0, 0, 0, 1, 7, 1, 1, 'Royal Tanzanite - Healing + mp5'),
(59598, 30552, 0, 0, 0, 1, 7, 1, 1, 'Blessed Tanzanite - Healing + Stamina'),
(59598, 30589, 0, 0, 0, 1, 7, 1, 1, 'Dazzling Chrysoprase - Int + mp5'),
-- Caster DPS gems (Elemental)
(59598, 30588, 0, 0, 0, 1, 7, 1, 1, 'Potent Fire Opal - Spell Dmg + Spell Crit'),
(59598, 30551, 0, 0, 0, 1, 7, 1, 1, 'Infused Fire Opal - Spell Dmg + Int'),
(59598, 30564, 0, 0, 0, 1, 7, 1, 1, 'Shining Fire Opal - Spell Dmg + Spell Hit'),
(59598, 30555, 0, 0, 0, 1, 7, 1, 1, 'Glowing Tanzanite - Spell Dmg + Stamina'),
(59598, 30560, 0, 0, 0, 1, 7, 1, 1, 'Rune Covered Chrysoprase - Spell Crit + mp5'),
(59598, 30605, 0, 0, 0, 1, 7, 1, 1, 'Vivid Chrysoprase - Spell Hit + Stamina'),
-- Physical DPS gems (Enhancement)
(59598, 30553, 0, 0, 0, 1, 7, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59598, 30582, 0, 0, 0, 1, 7, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59598, 30556, 0, 0, 0, 1, 7, 1, 1, 'Glinting Fire Opal - Agi + Hit'),
(59598, 30574, 0, 0, 0, 1, 7, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
(59598, 30550, 0, 0, 0, 1, 7, 1, 1, 'Sundered Chrysoprase - Crit + mp5');

-- -----------------------------------------------------------------------------
-- Mage (59599) - Caster DPS
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59599, 30588, 0, 0, 0, 1, 8, 1, 1, 'Potent Fire Opal - Spell Dmg + Spell Crit'),
(59599, 30551, 0, 0, 0, 1, 8, 1, 1, 'Infused Fire Opal - Spell Dmg + Int'),
(59599, 30564, 0, 0, 0, 1, 8, 1, 1, 'Shining Fire Opal - Spell Dmg + Spell Hit'),
(59599, 30573, 0, 0, 0, 1, 8, 1, 1, 'Mysterious Fire Opal - Spell Dmg + Spell Pen'),
(59599, 30600, 0, 0, 0, 1, 8, 1, 1, 'Fluorescent Tanzanite - Spell Dmg + Spirit'),
(59599, 30555, 0, 0, 0, 1, 8, 1, 1, 'Glowing Tanzanite - Spell Dmg + Stamina'),
(59599, 30548, 0, 0, 0, 1, 8, 1, 1, 'Polished Chrysoprase - Stamina + Spell Crit'),
(59599, 30583, 0, 0, 0, 1, 8, 1, 1, 'Timeless Chrysoprase - Int + Stamina'),
(59599, 30560, 0, 0, 0, 1, 8, 1, 1, 'Rune Covered Chrysoprase - Spell Crit + mp5'),
(59599, 30605, 0, 0, 0, 1, 8, 1, 1, 'Vivid Chrysoprase - Spell Hit + Stamina'),
(59599, 30606, 0, 0, 0, 1, 8, 1, 1, 'Lambent Chrysoprase - Spell Hit + mp5'),
(59599, 30608, 0, 0, 0, 1, 8, 1, 1, 'Radiant Chrysoprase - Spell Crit + Spell Pen');

-- -----------------------------------------------------------------------------
-- Warlock (59600) - Caster DPS (similar to Mage but with more Stamina focus)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(59600, 30588, 0, 0, 0, 1, 9, 1, 1, 'Potent Fire Opal - Spell Dmg + Spell Crit'),
(59600, 30551, 0, 0, 0, 1, 9, 1, 1, 'Infused Fire Opal - Spell Dmg + Int'),
(59600, 30564, 0, 0, 0, 1, 9, 1, 1, 'Shining Fire Opal - Spell Dmg + Spell Hit'),
(59600, 30573, 0, 0, 0, 1, 9, 1, 1, 'Mysterious Fire Opal - Spell Dmg + Spell Pen'),
(59600, 30600, 0, 0, 0, 1, 9, 1, 1, 'Fluorescent Tanzanite - Spell Dmg + Spirit'),
(59600, 30555, 0, 0, 0, 1, 9, 1, 1, 'Glowing Tanzanite - Spell Dmg + Stamina'),
(59600, 30548, 0, 0, 0, 1, 9, 1, 1, 'Polished Chrysoprase - Stamina + Spell Crit'),
(59600, 30583, 0, 0, 0, 1, 9, 1, 1, 'Timeless Chrysoprase - Int + Stamina'),
(59600, 30560, 0, 0, 0, 1, 9, 1, 1, 'Rune Covered Chrysoprase - Spell Crit + mp5'),
(59600, 30605, 0, 0, 0, 1, 9, 1, 1, 'Vivid Chrysoprase - Spell Hit + Stamina'),
(59600, 30606, 0, 0, 0, 1, 9, 1, 1, 'Lambent Chrysoprase - Spell Hit + mp5');

-- -----------------------------------------------------------------------------
-- Druid (59601) - All four roles (Tank, Melee DPS, Caster DPS, Healer)
-- -----------------------------------------------------------------------------
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Tank gems (Feral Bear)
(59601, 30601, 0, 0, 0, 1, 10, 1, 1, 'Beaming Fire Opal - Dodge + Resilience'),
(59601, 30554, 0, 0, 0, 1, 10, 1, 1, 'Stalwart Fire Opal - Defense + Dodge'),
(59601, 30585, 0, 0, 0, 1, 10, 1, 1, 'Glistening Fire Opal - Agi + Defense'),
(59601, 30563, 0, 0, 0, 1, 10, 1, 1, 'Regal Tanzanite - Dodge + Stamina'),
(59601, 30590, 0, 0, 0, 1, 10, 1, 1, 'Enduring Chrysoprase - Stamina + Defense'),
-- Melee DPS gems (Feral Cat)
(59601, 30553, 0, 0, 0, 1, 10, 1, 1, 'Pristine Fire Opal - AP + Hit'),
(59601, 30582, 0, 0, 0, 1, 10, 1, 1, 'Deadly Fire Opal - AP + Crit'),
(59601, 30556, 0, 0, 0, 1, 10, 1, 1, 'Glinting Fire Opal - Agi + Hit'),
(59601, 30565, 0, 0, 0, 1, 10, 1, 1, 'Assassin''s Fire Opal - Crit + Dodge'),
(59601, 30549, 0, 0, 0, 1, 10, 1, 1, 'Shifting Tanzanite - Agi + Stamina'),
(59601, 30574, 0, 0, 0, 1, 10, 1, 1, 'Brutal Tanzanite - AP + Stamina'),
-- Healer gems (Restoration)
(59601, 30547, 0, 0, 0, 1, 10, 1, 1, 'Luminous Fire Opal - Healing + Int'),
(59601, 30581, 0, 0, 0, 1, 10, 1, 1, 'Durable Fire Opal - Healing + Resilience'),
(59601, 30603, 0, 0, 0, 1, 10, 1, 1, 'Royal Tanzanite - Healing + mp5'),
(59601, 30572, 0, 0, 0, 1, 10, 1, 1, 'Imperial Tanzanite - Spirit + Healing'),
(59601, 30589, 0, 0, 0, 1, 10, 1, 1, 'Dazzling Chrysoprase - Int + mp5'),
-- Caster DPS gems (Balance)
(59601, 30588, 0, 0, 0, 1, 10, 1, 1, 'Potent Fire Opal - Spell Dmg + Spell Crit'),
(59601, 30551, 0, 0, 0, 1, 10, 1, 1, 'Infused Fire Opal - Spell Dmg + Int'),
(59601, 30564, 0, 0, 0, 1, 10, 1, 1, 'Shining Fire Opal - Spell Dmg + Spell Hit'),
(59601, 30555, 0, 0, 0, 1, 10, 1, 1, 'Glowing Tanzanite - Spell Dmg + Stamina'),
(59601, 30560, 0, 0, 0, 1, 10, 1, 1, 'Rune Covered Chrysoprase - Spell Crit + mp5');

-- =============================================================================
-- CONDITIONS: Class restrictions for gem drops
-- =============================================================================
-- SourceTypeOrReferenceId = 10 (Reference Loot Template)
-- ConditionTypeOrReference = 15 (CONDITION_CLASS)

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 10 AND `SourceGroup` BETWEEN 59592 AND 59601;

-- Warrior (class mask 1)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59592, Item, 0, 0, 15, 0, 1, 0, 0, 0, 0, 0, '', CONCAT('Warrior gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59592;

-- Paladin (class mask 2)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59593, Item, 0, 0, 15, 0, 2, 0, 0, 0, 0, 0, '', CONCAT('Paladin gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59593;

-- Hunter (class mask 4)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59594, Item, 0, 0, 15, 0, 4, 0, 0, 0, 0, 0, '', CONCAT('Hunter gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59594;

-- Rogue (class mask 8)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59595, Item, 0, 0, 15, 0, 8, 0, 0, 0, 0, 0, '', CONCAT('Rogue gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59595;

-- Priest (class mask 16)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59596, Item, 0, 0, 15, 0, 16, 0, 0, 0, 0, 0, '', CONCAT('Priest gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59596;

-- Death Knight (class mask 32)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59597, Item, 0, 0, 15, 0, 32, 0, 0, 0, 0, 0, '', CONCAT('Death Knight gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59597;

-- Shaman (class mask 64)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59598, Item, 0, 0, 15, 0, 64, 0, 0, 0, 0, 0, '', CONCAT('Shaman gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59598;

-- Mage (class mask 128)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59599, Item, 0, 0, 15, 0, 128, 0, 0, 0, 0, 0, '', CONCAT('Mage gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59599;

-- Warlock (class mask 256)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59600, Item, 0, 0, 15, 0, 256, 0, 0, 0, 0, 0, '', CONCAT('Warlock gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59600;

-- Druid (class mask 1024)
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT 10, 59601, Item, 0, 0, 15, 0, 1024, 0, 0, 0, 0, 0, '', CONCAT('Druid gem: ', Comment)
FROM `reference_loot_template` WHERE `Entry` = 59601;

-- =============================================================================
-- BOSS LOOT UPDATES: Replace gem reference drops with Ornate Gem Cache
-- =============================================================================
-- Remove gem reference tables (43002-43016) from heroic bosses
-- Replace with Ornate Gem Cache (59338) with same chance as end boss had

-- Remove all gem references from heroic bosses
DELETE FROM `creature_loot_template` WHERE `Entry` IN (
    -- Underbog (43002)
    20168, 20169, 20183, 20184,
    -- Arcatraz (43003)
    21590, 21601, 21624, 21626,
    -- Slave Pens (43004)
    19893, 19894, 19895,
    -- Hellfire Ramparts (43005)
    18433, 18436,
    -- Mana-Tombs (43006)
    20266, 20267, 20268, 22930,
    -- Sethekk Halls (43007)
    23035, 20690, 20706,
    -- Auchenai Crypts (43008)
    20306, 20318,
    -- Mechanar (43009)
    21533, 21536, 21537,
    -- Shadow Labyrinth (43010)
    20636, 20637, 20653, 20657,
    -- Old Hillsbrad (43011)
    20521, 20531, 20535,
    -- Steamvault (43012)
    20629, 20630, 20633,
    -- Blood Furnace (43013)
    18601, 18607, 18621,
    -- Black Morass (43014)
    20737, 20738, 20745,
    -- Shattered Halls (43015)
    20923, 20568, 20596, 20597,
    -- Botanica (43016)
    21551, 21558, 21559, 21581, 21582
) AND `Reference` BETWEEN 43002 AND 43016;

-- Add Ornate Gem Cache to END BOSSES ONLY (the ones with 40-46% gem drop rate)
-- Early/mid bosses don't drop cache - only end boss of each dungeon

-- First remove any existing Ornate Gem Cache entries (idempotency)
DELETE FROM `creature_loot_template` WHERE `Item` = 59338;

INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
-- Underbog - The Black Stalker (1)
(20184, 59338, 0, 40, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Arcatraz - Harbinger Skyriss (1)
(21601, 59338, 0, 100, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Slave Pens - Quagmirran (1)
(19894, 59338, 0, 40, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Hellfire Ramparts - Nazan & Vazruden uses different system, skip for now
-- Mana-Tombs - Nexus-Prince Shaffar (1)
(20266, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Sethekk Halls - Talon King Ikiss (1)
(20706, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Sethekk Halls - Anzu (bonus boss)
(23035, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Auchenai Crypts - Exarch Maladaar (1)
(20306, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Mechanar - Pathaleon the Calculator (1)
(21537, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Shadow Labyrinth - Murmur (1)
(20657, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Old Hillsbrad - Epoch Hunter (1)
(20531, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Steamvault - Warlord Kalithresh (1)
(20633, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Blood Furnace - Keli'dan the Breaker (1)
(18607, 59338, 0, 40, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Black Morass - Aeonus (1)
(20737, 59338, 0, 40, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Shattered Halls - Warchief Kargath Bladefist (1)
(20597, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache'),
-- Botanica - Warp Splinter (1)
(21582, 59338, 0, 46, 0, 1, 0, 1, 1, 'Ornate Gem Cache');

-- Note: Magister's Terrace uses a different gem system (epic gems not Fire Opal/etc)

-- =============================================================================
-- GAMEOBJECT LOOT: Hellfire Ramparts chest (Vazruden & Nazan)
-- =============================================================================
-- The Ramparts end boss drops loot via Reinforced Fel Iron Chest (GO 185169)
-- Loot template ID: 21764, gem reference: 35094

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 21764 AND `Reference` = 35094;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 21764 AND `Item` = 59338;

INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(21764, 59338, 0, 30, 0, 1, 0, 1, 1, 'Ornate Gem Cache');
