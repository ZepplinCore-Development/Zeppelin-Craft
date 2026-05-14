-- [F-052] zep-legacy: dungeonencounter
-- Classic instance boss encounter order fixes

-- dungeonencounter: 5 updates
UPDATE `dungeonencounter` SET `order_index` = 1000 WHERE `id` = 431;
UPDATE `dungeonencounter` SET `order_index` = 3000, `bit` = 3 WHERE `id` = 432;
UPDATE `dungeonencounter` SET `order_index` = 2000, `bit` = 2 WHERE `id` = 433;
UPDATE `dungeonencounter` SET `order_index` = 7000, `bit` = 7 WHERE `id` = 591;
UPDATE `dungeonencounter` SET `order_index` = 6000, `bit` = 6 WHERE `id` = 592;