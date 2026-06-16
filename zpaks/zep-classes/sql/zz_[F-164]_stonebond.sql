-- [F-164] Stonebond - server-side support
-- The standalone custom totem (creature 900100, summon 900224, formerly named
-- "Bloodstone"/"Stoneguard") is RETIRED. Stonebond (talent 900225) re-flavors
-- the STOCK Stoneclaw / Earth Elemental totems into damage soakers instead of
-- adding a fourth earth-slot totem. This file removes the old custom totem and
-- applies the stock-totem support the soak needs.

-- Retire the custom totem creature, its model, and its trainer entry.
DELETE FROM `creature_template_model` WHERE `CreatureID` = 900100;
DELETE FROM `creature_template` WHERE `entry` = 900100;
DELETE FROM `trainer_spell` WHERE `SpellId` = 900224;

-- Stock Stoneclaw totem (31122) must NOT regenerate health: the Stonebond split
-- (900222) redirects 20% of the shaman's damage into the totem, and that damage
-- only "sticks" (making the totem's HP its longevity) if it does not regen.
-- Regen is irrelevant for non-Stonebond Stoneclaw use, so this is safe globally.
UPDATE `creature_template` SET `RegenHealth` = 0 WHERE `entry` = 31122;
