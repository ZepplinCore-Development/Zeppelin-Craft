-- I-373: Account-bound pets/mounts never reach goblin or worgen characters.
--
-- mod-accountbound gates its shares with `allowable_race & player->getRaceMask()`
-- (LearnCompanions / LearnMounts, both fired on OnPlayerLogin). Upstream's
-- "all races" value is 1791 = bits 0-10 MINUS bit 8, because race 9 was an
-- unused placeholder in stock 3.3.5a. On this server race 9 is the goblin
-- (racemask 256) and race 12 is the worgen (racemask 2048), so both fall
-- outside every shipped mask and learn nothing from the account pool.
--
--   1791 | 256 (goblin) | 2048 (worgen) = 4095  (races 1-12)
--
-- Saved rows are updated too: SaveCompanions / SaveMounts copy the template's
-- allowable_race into the per-account tables, so old rows still carry 1791.
--
-- NOT covered here: the faction-specific pools (690 Horde / 1101 Alliance,
-- 75+77 racial mounts plus Argent Squire/Gruntling). Those two constants are
-- hardcoded in the module - LoadFactionSpecific{Companions,Mounts} match
-- `allowable_race = 1101` exactly, and Save{Companions,Mounts} pick the twin
-- faction with `== 690 ? 1101 : 690` - so widening them from SQL silently
-- kills faction-change twin handling. That half needs a module patch.
--
-- Takes effect on the character's next login (LearnCompanions is login-only).

UPDATE `account_bound_companion_template` SET `allowable_race` = 4095 WHERE `allowable_race` = 1791;
UPDATE `account_bound_mount_template`     SET `allowable_race` = 4095 WHERE `allowable_race` = 1791;

UPDATE `account_bound_companions` SET `allowable_race` = 4095 WHERE `allowable_race` = 1791;
UPDATE `account_bound_mounts`     SET `allowable_race` = 4095 WHERE `allowable_race` = 1791;
