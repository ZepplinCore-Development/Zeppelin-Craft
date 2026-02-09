-- F-058: Outland Dungeon Tuning
-- Grievous Wound (Normal) - Fixed 6 second duration
UPDATE `spell` SET `duration_index` = 32, `spell_subtext_flags` = 16712190, `spell_desc_enus` = 'A vicious attack that causes the target to bleed profusely.  Deals $o1 damage over $d.
' WHERE `id` = 31956;
