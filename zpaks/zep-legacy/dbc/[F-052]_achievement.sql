-- [F-052] zep-legacy: achievement
-- Classic instance achievement description fixes (Ragefire Chasm, Wailing Caverns)

-- achievement: 2 updates + icon change
UPDATE `achievement` SET `desc_enus` = 'Defeat Jergosh the Invoker.' WHERE `id` = 629;
UPDATE `achievement` SET `desc_enus` = 'Defeat Verdan the Everliving.', `spell_icon` = 514645 WHERE `id` = 630;
