-- ===================================================================
-- F-017 City Teleport Scrolls — reagent vendor flags
-- ===================================================================
-- Stock data ships these NPCs without 2048 (UNIT_NPC_FLAG_VENDOR_REAGENT),
-- unlike every other reagent vendor in the game:
--
--   16611   Zalle                    <Reagents>              Silvermoon City   128 -> 2176
--   16757   Bildine                  <Reagents>              The Exodar        128 -> 2176
--   30727   Lelorian                 <Inscription Supplies>  Silvermoon City   128 -> 2176
--   112795  First Sergeant Hola'mahi <Reagent Vendor>        Orgrimmar         130 -> 2178
--
-- Counterparts for comparison: Musal (16706), Velanni (16612) and
-- Sessoh (30732) are all 2176 = 128 | 2048.
--
-- Stock rows, so UPDATE (not DELETE+INSERT) to keep the diff reviewable.
-- ===================================================================

UPDATE `creature_template` SET `npcflag` = 2176 WHERE `entry` IN (16611, 16757, 30727);
UPDATE `creature_template` SET `npcflag` = 2178 WHERE `entry` = 112795;
