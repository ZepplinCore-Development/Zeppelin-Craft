-- I-224: Hero of Shattrath (achievement 1205) honored-tabard exploit fix
--
-- 1205 chains off two hidden Blizzard tracking achievements:
--   4788 "Exalted with the Aldor"  4789 "Exalted with the Scryers"
-- Each is an "any one criterion" achievement whose criteria are:
--   * type 46 GAIN_REPUTATION  (faction 932/934, qty 42000 = Exalted)  <-- intended path
--   * type 34/36 OWN_ITEM      (faction tabards + gear, e.g. 31779/31780) <-- shortcut
-- The tabards are obtainable at Honored, so owning a tabard completes the
-- "Exalted with X" achievement at Honored. With F-072 removing Aldor/Scryer
-- exclusivity, a player can own BOTH tabards and earn Hero of Shattrath without
-- ever reaching Exalted.
--
-- Fix: disable the OWN_ITEM shortcut criteria for 4788/4789 so only the
-- GAIN_REPUTATION (Exalted, 42000) criterion can complete them. Server-side
-- only (acore_world.disables); takes effect on worldserver restart/reload.
-- Criteria 13395 (Aldor rep) and 13409 (Scryers rep) are intentionally kept.
-- Related: F-072 Peacekeeping Diplomacy.

DELETE FROM `disables` WHERE `sourceType` = 4 AND `entry` IN (
  13397,13398,13399,13400,13401,13402,13403,13404,13405,13406,13407,13408, -- 4788 Aldor item criteria
  13410,13411,13412,13413,13414,13415,13416,13417,13418,13419,13420         -- 4789 Scryers item criteria
);

INSERT INTO `disables` (`sourceType`,`entry`,`flags`,`params_0`,`params_1`,`comment`) VALUES
(4,13397,0,'','','Hero of Shattrath: require Exalted not Aldor tabard (31779)'),
(4,13398,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13399,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13400,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13401,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13402,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13403,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13404,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13405,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13406,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13407,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13408,0,'','','Hero of Shattrath: require Exalted not Aldor item'),
(4,13410,0,'','','Hero of Shattrath: require Exalted not Scryer tabard (31780)'),
(4,13411,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13412,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13413,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13414,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13415,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13416,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13417,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13418,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13419,0,'','','Hero of Shattrath: require Exalted not Scryer item'),
(4,13420,0,'','','Hero of Shattrath: require Exalted not Scryer item');
