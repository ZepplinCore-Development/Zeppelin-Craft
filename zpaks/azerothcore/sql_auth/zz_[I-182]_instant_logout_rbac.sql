-- I-182: Grant Instant logout RBAC perm to all accounts (Player role).
--
-- AzerothCore's worldserver.conf `InstantLogout` value is dead code — the
-- check in MiscHandler.cpp::HandleLogoutRequestOpcode uses RBAC only, and
-- stock RBAC only links Instant logout (1) to the Moderator role (194) and
-- up. Linking it to the Player role (195) gives every account instant
-- logout (still blocked in combat / falling / dueling by hardcoded checks).
--
-- Worldserver restart required after apply — RBAC is loaded at startup.

DELETE FROM `rbac_linked_permissions` WHERE `id` = 195 AND `linkedId` = 1;
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES (195, 1);
