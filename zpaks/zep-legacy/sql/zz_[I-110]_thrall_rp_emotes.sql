-- I-110  Thrall, Warchief (4949) - interaction + quest RP emotes
--
-- Now that he stands (see zz_[I-110]_frozen_thrall_fix.sql) one-shot emotes
-- actually read on him. Every emote id below was verified to exist on the model
-- he is currently using -- Creature\ThrallShadowlands\thrallshadowlands.m2
-- (creaturedisplayinfo 4527 -> creaturemodeldata 5040) -- and, where the
-- sequence is external, its .anim file ships in patch-hd-everything:
--
--   1  ONESHOT_TALK        -> anim  60 EmoteTalk             (0060-00.anim)
--   2  ONESHOT_BOW         -> anim  66 EmoteBow              (0066-00.anim)
--   4  ONESHOT_CHEER       -> anim  68 EmoteCheer            (0068-00.anim)
--   5  ONESHOT_EXCLAMATION -> anim  64 EmoteTalkExclamation  (0064-00.anim)
--   6  ONESHOT_QUESTION    -> anim  65 EmoteTalkQuestion     (0065-00.anim)
--  11  ONESHOT_LAUGH       -> anim  70 EmoteLaugh            (0070-00.anim)
--  15  ONESHOT_ROAR        -> anim  74 EmoteRoar             (0074-00.anim)
--  21  ONESHOT_APPLAUD     -> anim  80 EmoteApplaud          (0080-00.anim)
--  25  ONESHOT_POINT       -> anim  84 EmotePoint            (0084-00.anim)
--  66  ONESHOT_SALUTE      -> anim 113 EmoteSalute           (0113-00.anim)
-- 274  ONESHOT_NO          -> anim 186 EmoteNo               (0186-00.anim)
--
-- The _NO_SHEATHE variants (113 / 396 / 397) are deliberately avoided: on this
-- model they are alias sequences (flag 0x40) with no primary 0x20 of their own.
-- Delays are milliseconds from panel open; beats are spaced wider than the
-- animation lengths above so they do not clip each other.


-- ---------------------------------------------------------------------------
-- A. Gossip greeting (menu 3664 -> npc_text 4477, Thrall only)
--    Emotes[0] here is also what AC sends as the greeting emote on the
--    multi-quest list panel (Player::SendPreparedQuest), so slot 0 is TALK.
-- ---------------------------------------------------------------------------
UPDATE `npc_text` SET
    `em0_0` = 0,    `em0_1` = 1,
    `em0_2` = 4000, `em0_3` = 5,
    `em0_4` = 9000, `em0_5` = 1
WHERE `ID` = 4477;


-- ---------------------------------------------------------------------------
-- B. Quest offer panel (quest_details) - all of these are Thrall-only quests
-- ---------------------------------------------------------------------------

-- Existing stock rows: consolidated UPDATE each
UPDATE `quest_details` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 6, `EmoteDelay2` = 3000,
    `Emote3` = 1, `EmoteDelay3` = 7000
WHERE `ID` = 6566;

UPDATE `quest_details` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 3500,
    `Emote3` = 5, `EmoteDelay3` = 7500
WHERE `ID` = 6567;

-- Rows stock never shipped: ours, so DELETE + INSERT
DELETE FROM `quest_details` WHERE `ID` IN (5726, 5727, 5728, 5729, 7491, 7784, 9441, 9627, 10212);

INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`) VALUES
-- Hidden Enemies chain
(5726,  1,  5, 1, 0, 0, 3500, 8000, 0),
(5727,  1,  6, 1, 0, 0, 3500, 8000, 0),
(5728,  1,  1, 5, 0, 0, 4000, 9000, 0),
(5729,  1, 25, 1, 0, 0, 3500, 8000, 0),
-- For All To See
(7491,  1,  1, 0, 0, 0, 4000,    0, 0),
-- The Lord of Blackrock
(7784,  1,  5, 25, 0, 0, 3500, 8000, 0),
-- Envoy to the Mag'har
(9441,  1, 25, 1, 0, 0, 3500, 8000, 0),
-- Allegiance to the Horde
(9627,  1,  1, 0, 0, 0, 4000,    0, 0),
-- Hero of the Mag'har
(10212, 1,  5, 1, 0, 0, 3500, 8000, 0);


-- ---------------------------------------------------------------------------
-- C. Quest completion panel (quest_request_items) - fill the silent ones
-- ---------------------------------------------------------------------------
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1 WHERE `ID` = 4974;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1 WHERE `ID` = 13189;
UPDATE `quest_request_items` SET `EmoteOnComplete` = 1 WHERE `ID` = 24612;


-- ---------------------------------------------------------------------------
-- D. Quest hand-in / reward panel (quest_offer_reward)
--    One consolidated UPDATE per quest id. Emotes chosen to match the
--    RewardText each quest actually prints.
-- ---------------------------------------------------------------------------

-- 4001 What Is Going On? - "Failure of this mission is not an option."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1,  `EmoteDelay1` = 0,
    `Emote2` = 25, `EmoteDelay2` = 3000,
    `Emote3` = 5,  `EmoteDelay3` = 7000,
    `Emote4` = 0,  `EmoteDelay4` = 0
WHERE `ID` = 4001;

-- 4002 The Eastern Kingdoms - "There is no going back beyond this point."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 5, `EmoteDelay2` = 2500,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 4002;

-- 4004 The Princess Saved? - "<Thrall is taken aback...>"
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 2500,
    `Emote3` = 1, `EmoteDelay3` = 7000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 4004;

-- 4941 Eitrigg Wisdom - "<Thrall appears dismayed by the news you bring.>"
UPDATE `quest_offer_reward` SET
    `Emote1` = 274, `EmoteDelay1` = 0,
    `Emote2` = 1,   `EmoteDelay2` = 2000,
    `Emote3` = 0,   `EmoteDelay3` = 0,
    `Emote4` = 0,   `EmoteDelay4` = 0
WHERE `ID` = 4941;

-- 4974 For The Horde! - npc_thrall_warchief then plays the roar / spike /
-- blessing scene on reward, so keep the panel itself restrained.
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 4000,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 4974;

-- 5726 Hidden Enemies - "Good, $N! The spirits be praised!"
UPDATE `quest_offer_reward` SET
    `Emote1` = 15, `EmoteDelay1` = 0,
    `Emote2` = 1,  `EmoteDelay2` = 3500,
    `Emote3` = 1,  `EmoteDelay3` = 8000,
    `Emote4` = 0,  `EmoteDelay4` = 0
WHERE `ID` = 5726;

-- 5727 Hidden Enemies - "Excellent! Most excellent, $c!"
UPDATE `quest_offer_reward` SET
    `Emote1` = 4, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 3500,
    `Emote3` = 1, `EmoteDelay3` = 8000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 5727;

-- 5728 Hidden Enemies - "I am glad you have returned, $N."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 4000,
    `Emote3` = 5, `EmoteDelay3` = 9000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 5728;

-- 5730 Hidden Enemies - "Ashenvale? Hmm, I had not heard..."
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 2500,
    `Emote3` = 1, `EmoteDelay3` = 7000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 5730;

-- 6566 What the Wind Carries - "Are you prepared to take on this task?"
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 2500,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 6566;

-- 7490 Victory for the Horde - "It is time for the Warchief to honor you."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1,  `EmoteDelay1` = 0,
    `Emote2` = 21, `EmoteDelay2` = 3000,
    `Emote3` = 2,  `EmoteDelay3` = 6500,
    `Emote4` = 0,  `EmoteDelay4` = 0
WHERE `ID` = 7490;

-- 7783 The Lord of Blackrock - "You have honored the Horde once more, $N."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1,  `EmoteDelay1` = 0,
    `Emote2` = 66, `EmoteDelay2` = 3000,
    `Emote3` = 5,  `EmoteDelay3` = 6000,
    `Emote4` = 0,  `EmoteDelay4` = 0
WHERE `ID` = 7783;

-- 8485 The Brokering of Peace - "Indeed, this is a most fortuitous turn..."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 3500,
    `Emote3` = 5, `EmoteDelay3` = 8000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 8485;

-- 9438 Messenger to Thrall - "We must reach Nagrand as soon as possible!"
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 5, `EmoteDelay2` = 3000,
    `Emote3` = 1, `EmoteDelay3` = 7000,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 9438;

-- 9626 Meeting the Warchief - "<Thrall begins to read the letter.>"
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 1, `EmoteDelay2` = 3000,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 9626;

-- 9813 Meeting the Warchief - the wry Forsaken/blood elf variant
UPDATE `quest_offer_reward` SET
    `Emote1` = 6,  `EmoteDelay1` = 0,
    `Emote2` = 1,  `EmoteDelay2` = 3000,
    `Emote3` = 11, `EmoteDelay3` = 7000,
    `Emote4` = 0,  `EmoteDelay4` = 0
WHERE `ID` = 9813;

-- 10175 Thrall, Son of Durotan - "I... I have a grandmother? She lives?"
UPDATE `quest_offer_reward` SET
    `Emote1` = 6, `EmoteDelay1` = 0,
    `Emote2` = 6, `EmoteDelay2` = 3000,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 10175;

-- 13189 Warchiefs Blessing - "Tirion Fordring, to have sacrificed everything
-- to save the life of an orc..."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 6, `EmoteDelay2` = 4000,
    `Emote3` = 2, `EmoteDelay3` = 8500,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 13189;

-- 24612 A Gift for the Warchief - "My thanks for this Lovely Charm Bracelet."
UPDATE `quest_offer_reward` SET
    `Emote1` = 1, `EmoteDelay1` = 0,
    `Emote2` = 2, `EmoteDelay2` = 2000,
    `Emote3` = 0, `EmoteDelay3` = 0,
    `Emote4` = 0, `EmoteDelay4` = 0
WHERE `ID` = 24612;
