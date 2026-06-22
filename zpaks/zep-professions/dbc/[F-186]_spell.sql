-- F-186: Improved Lifeblood (Herbalism).
-- Scope is more than the tooltip: R5 (55502) is buffed (usable earlier + bigger
-- heal), and the description/tooltip are reworked to show the real heal including
-- the max-health scaling added by the spell_gen_lifeblood Core AuraScript.
--
-- SINGLE-FILE OWNERSHIP: this file is the SOLE owner of all six Lifeblood rank
-- spell rows. It sets the full description + tooltip directly (absolute, not
-- REPLACE), so it no longer depends on the worgoblin base text or on apply order.
-- The desc uses $<heal>/$<healtick> from description variable 200 (defined in
-- [F-186]_spelldescriptionvariables.sql).
--
-- Consolidated here (was previously split across two base imports, now removed
-- from both with breadcrumbs):
--   * desc text for R3-R6 lived in mod-worgoblin/[BASE,F-030]_spell.sql
--   * R5 (55502) heal buff (stock lvl 40 / base 239 -> lvl 25 / base 359) lived in
--     zep-legacy/[BASE,F-044]_spell.sql
-- Lifeblood rows exist in stock (original_dbc), so only the customized columns are
-- set here. Stock per-rank base heal (R1 59, R2 95, R3 143, R4 179, R6 719) and
-- target-level lines are unchanged; only R5 differs from stock.

SET @lb_desc = 'Uses your skill in Herbalism to absorb energy and nutrients from the earth, healing you for $<heal> (scales with your maximum health) over $d.  Can be used while stealthed or invisible.';
SET @lb_tip  = 'Healing $<healtick> every $t1 sec.';

UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = @lb_desc, `spell_tooltip_enus` = @lb_tip WHERE `id` = 55428;  -- Rank 1
UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = @lb_desc, `spell_tooltip_enus` = @lb_tip WHERE `id` = 55480;  -- Rank 2
UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = CONCAT(@lb_desc, 'Target must be level 10 or higher.'), `spell_tooltip_enus` = @lb_tip WHERE `id` = 55500;  -- Rank 3
UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = CONCAT(@lb_desc, 'Target must be level 25 or higher.'), `spell_tooltip_enus` = @lb_tip WHERE `id` = 55501;  -- Rank 4
-- Rank 5 also carries the heal buff: stock is level 40 / base 239 (heal 240); we
-- make it usable earlier and hit harder at level 25 / base 359 (heal 360).
UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = CONCAT(@lb_desc, 'Target must be level 40 or higher.'), `spell_tooltip_enus` = @lb_tip, `spell_level` = 25, `effect_base_points_1` = 359 WHERE `id` = 55502;  -- Rank 5
UPDATE `spell` SET `spell_desc_variable_id` = 200, `spell_desc_enus` = CONCAT(@lb_desc, 'Target must be level 55 or higher.'), `spell_tooltip_enus` = @lb_tip WHERE `id` = 55503;  -- Rank 6
