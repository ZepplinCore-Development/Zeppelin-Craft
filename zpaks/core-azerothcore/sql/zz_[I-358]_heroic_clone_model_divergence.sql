-- I-358 - Heroic difficulty clones diverge from their normal-mode creature models
--
-- creature_template_model rows for the normal entries were re-verified against a modern
-- sniff (VerifiedBuild 51831) and the bogus leftover model slots had their Probability
-- zeroed. The difficulty_entry_1 clones were never re-sniffed (still VerifiedBuild 12340
-- / 9767) and kept the original weights, so heroic randomly rolls models the normal
-- version never shows. Not fixed upstream: data/sql/base/db_world/creature_template_model.sql
-- still carries the divergence and no update file touches these entries.
--
-- Note: CreatureTemplate::GetRandomValidModel() ignores Probability when an entry has
-- exactly ONE model row, so single-row 0-vs-1 probability differences are cosmetic and
-- are deliberately left alone. Only entries whose *effective* model set differs are fixed.


-- ---------------------------------------------------------------------------
-- The Underbog (map 546)
-- ---------------------------------------------------------------------------

-- Lykul Wasp (1) 20175 - heroic clone of Lykul Wasp 17732.
-- Normal is always 18722 (FireFlyGreen). Heroic rolled 19401 (NetherRay) plus three
-- silithid leftovers (SilithidTank / SilithidWasp / Silithid) at equal weight.
UPDATE `creature_template_model` SET `CreatureDisplayID` = 18722 WHERE `CreatureID` = 20175 AND `Idx` = 0;
UPDATE `creature_template_model` SET `Probability` = 0 WHERE `CreatureID` = 20175 AND `Idx` IN (1, 2, 3);

-- Lykul Stinger (1) 20174 - heroic clone of Lykul Stinger 19632.
-- Base model 19367 (FireFlyBlue) already matches; only the silithid leftovers roll.
UPDATE `creature_template_model` SET `Probability` = 0 WHERE `CreatureID` = 20174 AND `Idx` IN (1, 2, 3);

-- Underbog Lord (1) 20187 - heroic clone of Underbog Lord 17734.
-- Normal is always 17758 (FungalGiant). Heroic had a 50/50 chance of 12293
-- (MountainGiantNorthrend) - a Northrend mountain giant in an Outland swamp.
UPDATE `creature_template_model` SET `Probability` = 0 WHERE `CreatureID` = 20187 AND `Idx` = 1;


-- ---------------------------------------------------------------------------
-- Gundrak (Spirit Fount) and Ulduar (Nature Bomb, Freya)
-- ---------------------------------------------------------------------------

-- Spirit Fount (1) 30808 - heroic clone of Spirit Fount 27339.
-- Normal is the invisible stalker 11686. Heroic had a 50/50 chance of display 169
-- (Infernal2/infernalH) - a visible infernal standing in for an invisible trigger.
UPDATE `creature_template_model` SET `Probability` = 0 WHERE `CreatureID` = 30808 AND `Idx` = 0;

-- Nature Bomb (1) 34153 - heroic clone of Nature Bomb 34129.
-- Same defect: normal is invisible stalker 23258, heroic rolled infernal 169.
UPDATE `creature_template_model` SET `Probability` = 0 WHERE `CreatureID` = 34153 AND `Idx` = 0;


-- ---------------------------------------------------------------------------
-- Ulduar - Thorim (Captured Mercenary Captain)
-- ---------------------------------------------------------------------------
-- boss_thorim.cpp: 32907 = HORDE captain, 32908 = ALLIANCE captain.
-- Normal: 32907 -> 21314 (OrcFemale) / 21313 (TaurenMale)
--         32908 -> 21308 (DraeneiMale) / 21311 (DwarfFemale)
-- The 25-man clones were assigned crossed, so Ulduar 25 showed Alliance models on the
-- Horde captain and vice versa. Swap them back.

-- Captured Mercenary Captain (1) 33150 - clone of 32907 (Horde)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 21314 WHERE `CreatureID` = 33150 AND `Idx` = 0;
UPDATE `creature_template_model` SET `CreatureDisplayID` = 21313 WHERE `CreatureID` = 33150 AND `Idx` = 1;

-- Captured Mercenary Captain (1) 33151 - clone of 32908 (Alliance)
UPDATE `creature_template_model` SET `CreatureDisplayID` = 21308 WHERE `CreatureID` = 33151 AND `Idx` = 0;
UPDATE `creature_template_model` SET `CreatureDisplayID` = 21311 WHERE `CreatureID` = 33151 AND `Idx` = 1;
