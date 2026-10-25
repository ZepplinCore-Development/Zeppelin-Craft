-- [F-030] mod-worgoblin: chrraces overrides on top of [BASE,F-030]_chrraces.sql
-- ChrRaces 12 is stock's unused "Fel Orc" row repurposed as the Worgen; the module import kept its name, which the
-- character creator shows on the race button (user report 2026-10-25).
UPDATE chrraces SET name_neutral_enus = 'Worgen' WHERE id = 12;
