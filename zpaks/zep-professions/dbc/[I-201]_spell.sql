-- I-201: Remove cooldown from Minor Inscription Research
-- Stock spell 61288 shipped with recovery_time 72000000 (20h daily cooldown).
-- Set to 0 so minor glyph research can be performed without the daily lockout,
-- matching the server's no-research-cooldown intent (cf. FAST QA VERSION 61756).
UPDATE `spell` SET `recovery_time` = 0 WHERE `id` = 61288;
