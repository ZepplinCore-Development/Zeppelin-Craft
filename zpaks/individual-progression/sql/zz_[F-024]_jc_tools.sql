-- ============================================================================
-- Zeppelin Override: Keep JC tools available without progression gating
-- ============================================================================
-- IPP gates Jeweler's Kit and Simple Grinder behind progression conditions.
-- We want these profession tools available from the start.
--
-- Item 20815 = Jeweler's Kit
-- Item 20824 = Simple Grinder
-- ============================================================================

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceEntry` IN (20815, 20824);
