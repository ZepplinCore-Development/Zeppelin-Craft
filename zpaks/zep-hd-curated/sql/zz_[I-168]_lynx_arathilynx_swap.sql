-- I-168: Lynx creatures using DruidCat_Legacy meshed displays — swap to arathilynx
-- Stock displays 15592, 15593, 16245, 18167, 19705, 20808, 21793, 21907 use model_id=3143
-- (Creature\DRUIDCAT\DruidCat_Legacy.mdx) with LynxSkinYellow/Red textures. The HD pack
-- ships modern arathilynx (model_id=7213) which is the proper lynx mesh with five colour
-- variants: gold, red, brown, black, white.
--
-- This file overrides creature_template_model per-creature to point each lynx at an
-- arathilynx display matching its zone/role:
--   * Eversong Springpaw (15652/15653)   — gold/red       (existing displays 15507/15506)
--   * Ghostlands Ghostclaw line + rare   — black/brown/white mix for in-zone variation
--                                           (Starving → white, Ravager → brown, Lynx → black, Darkmaw Cub → black)
--   * Quel'Danas Sentinel (25045)        — red            (existing 15506)
--   * Bloodmyst Ripfang/Grovestalker     — red            (existing 15506)
--   * Bloodmyst rare Tethik              — brown          (new 900100)
--   * ZA Amani Lynx (24043)              — gold           (existing 15507)
--   * ZA Amani Elder Lynx (24530)        — brown          (new 900100)
--   * ZA boss Halazzi (28517/29022)      — gold           (existing 15507)
--   * ZA/raid spirit variants            — white          (new 900102)
DELETE FROM creature_template_model WHERE CreatureID IN (
  15652, 15653,
  16347, 16348, 16349, 20615,
  25045,
  20671, 21022, 22110,
  24043, 24530,
  28517, 29022,
  23812, 23877, 24143, 23914
) AND Idx = 0;
INSERT INTO creature_template_model (CreatureID, Idx, CreatureDisplayID, DisplayScale, Probability) VALUES
(15652, 0, 15507, 1, 1),    -- Elder Springpaw          → gold
(15653, 0, 15506, 1, 1),    -- Springpaw Matriarch      → red
(16347, 0, 900102, 1, 1),   -- Starving Ghostclaw       → white (gaunt/starved)
(16348, 0, 900101, 1, 1),   -- Ghostclaw Lynx           → black (common variant)
(16349, 0, 900100, 1, 1),   -- Ghostclaw Ravager        → brown (rougher variant)
(20615, 0, 900101, 1, 1),   -- Darkmaw Cub              → black (matches "Dark" name)
(25045, 0, 15506, 1, 1),    -- Sentinel (Quel'Danas)    → red
(20671, 0, 15506, 1, 1),    -- Ripfang Lynx             → red
(21022, 0, 15506, 1, 1),    -- Grovestalker Lynx        → red
(22110, 0, 900100, 1, 1),   -- Tethik (rare)            → brown
(24043, 0, 15507, 1, 1),    -- Amani Lynx               → gold
(24530, 0, 900100, 1, 1),   -- Amani Elder Lynx         → brown
(28517, 0, 15507, 1, 1),    -- Halazzi (normal)         → gold
(29022, 0, 15507, 1, 1),    -- Halazzi (heroic)         → gold
(23812, 0, 900102, 1, 1),   -- Lynx Spirit              → white
(23877, 0, 900102, 1, 1),   -- Amani Lynx Spirit        → white
(24143, 0, 900102, 1, 1),   -- Spirit of the Lynx       → white
(23914, 0, 900102, 1, 1);   -- Lynx Spirit Transform    → white

-- Custom displays need creature_model_info rows or the server can't spawn creatures using them.
-- Values copied from stock arathilynx_red display 15506 (BoundingRadius=0.2635, CombatReach=1.5).
DELETE FROM creature_model_info WHERE DisplayID IN (900100, 900101, 900102);
INSERT INTO creature_model_info (DisplayID, BoundingRadius, CombatReach, Gender) VALUES
(900100, 0.2635, 1.5, 2),
(900101, 0.2635, 1.5, 2),
(900102, 0.2635, 1.5, 2);
