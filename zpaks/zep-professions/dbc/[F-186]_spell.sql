-- F-186: Lifeblood (Herbalism) tooltip — show actual heal incl. max-health scaling.
--
-- Assigns description variable 200 (see [F-186]_spelldescriptionvariables.sql) to
-- all six Lifeblood ranks and swaps the base-only $o1/$s1 tokens for the computed
-- $<heal> / $<healtick>.
--
-- The Lifeblood description text is owned by mod-worgoblin [BASE,F-030]_spell.sql
-- (priority 20); zep-professions (priority 100) applies later, so these REPLACE
-- statements run on the worgoblin-set text and survive a full `dbc db rebuild`.
-- The shared heal phrase is identical across ranks (only the trailing
-- "Target must be level N or higher." differs), so REPLACE preserves each rank's
-- level line. REPLACE is idempotent: after the swap neither source token remains.

-- Point all ranks at variable 200 so $<heal>/$<healtick> resolve.
UPDATE `spell` SET `spell_desc_variable_id` = 200
WHERE `id` IN (55428, 55480, 55500, 55501, 55502, 55503);

-- Description: replace the base-only total + vague parenthetical with the real
-- number plus a "scales with your maximum health" hint. Two idempotent passes so
-- the final text is reached from either starting state:
--   pass 1 = fresh / `dbc db rebuild` (worgoblin sets the original
--            '$o1 (increased by maximum health)' token)
--   pass 2 = upgrade a DB that already received the earlier hint-less '$<heal>' swap
-- After either pass its search token is gone, so re-running is a no-op.
UPDATE `spell` SET
    `spell_desc_enus` = REPLACE(`spell_desc_enus`, '$o1 (increased by maximum health)', '$<heal> (scales with your maximum health)')
WHERE `id` IN (55428, 55480, 55500, 55501, 55502, 55503);

UPDATE `spell` SET
    `spell_desc_enus` = REPLACE(`spell_desc_enus`, '$<heal> over', '$<heal> (scales with your maximum health) over')
WHERE `id` IN (55428, 55480, 55500, 55501, 55502, 55503);

-- Tooltip: replace the base-only per-tick $s1 with the real per-tick amount.
UPDATE `spell` SET
    `spell_tooltip_enus` = REPLACE(`spell_tooltip_enus`, '$s1', '$<healtick>')
WHERE `id` IN (55428, 55480, 55500, 55501, 55502, 55503);
