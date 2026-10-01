-- [F-211] Retired wardrobe displays: built during a test, no longer produced by any manifest.
-- The generated [AUTO,F-211] files only own the ids they still emit, so retirements live here.
-- 900341/900342: heritage + Orgrimmar belt trial (2026-10-01). The belt won and moved into
-- maghar_heritage_grunt itself, so these two displays are no longer built.
DELETE FROM `creaturedisplayinfo` WHERE `id` IN (900341, 900342);
DELETE FROM `creaturedisplayinfoextra` WHERE `id` IN (900341, 900342);
