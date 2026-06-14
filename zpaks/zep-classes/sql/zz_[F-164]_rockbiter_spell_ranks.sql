-- [F-164] Rockbiter Weapon ranks 5-10: extend the spell_ranks chain.
-- The stock chain is 8017(r1) -> 8018(r2) -> 8019(r3) -> 10399(r4). The new
-- ranks (900230-900235) must be registered as ranks 5-10 of the same chain
-- (first_spell_id = 8017) so the server recognizes them as Rockbiter ranks.
-- Without this they are treated as standalone/unknown ranks and get dropped
-- from the spellbook (only R4 shows).
DELETE FROM `spell_ranks` WHERE `spell_id` IN (900230, 900231, 900232, 900233, 900234, 900235);
INSERT INTO `spell_ranks` (`first_spell_id`, `spell_id`, `rank`) VALUES
    (8017, 900230, 5),
    (8017, 900231, 6),
    (8017, 900232, 7),
    (8017, 900233, 8),
    (8017, 900234, 9),
    (8017, 900235, 10);
