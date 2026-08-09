-- ===================================================================
-- F-086 City Teleport Scrolls — reagent vendor flags
-- ===================================================================
-- Stock TDB data ships these three NPCs with npcflag 128 (VENDOR) but
-- without 2048 (UNIT_NPC_FLAG_VENDOR_REAGENT), unlike every other
-- reagent vendor in the game:
--
--   16611  Zalle     <Reagents>              Silvermoon City
--   16757  Bildine   <Reagents>              The Exodar
--   30727  Lelorian  <Inscription Supplies>  Silvermoon City
--
-- Counterparts for comparison: Musal (16706), Velanni (16612) and
-- Sessoh (30732) are all 2176 = 128 | 2048.
--
-- Stock rows, so UPDATE (not DELETE+INSERT) to keep the diff reviewable.
-- ===================================================================

UPDATE `creature_template` SET `npcflag` = 2176 WHERE `entry` IN (16611, 16757, 30727);
