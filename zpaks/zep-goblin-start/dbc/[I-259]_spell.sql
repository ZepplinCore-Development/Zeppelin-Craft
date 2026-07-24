-- I-259: Kaja'Cola (70478) — show the buff in the aura bar.
-- Cata ships the spell with attributes_ex_1 = 0x10000000 (don't display in
-- aura bar), so the 5s cola aura applies invisibly. Deliberate deviation from
-- retail: clear the flag so the drink gives visible feedback (icon 2902 +
-- "Kaja'Cola! It gives you IDEAS! (TM)" tooltip). 70478 is owned by
-- [AUTO,F-011]_spell.sql; this file sorts after it and overrides this column.

UPDATE spell SET attributes_ex_1 = 0 WHERE id = 70478;
