-- [F-011] Restore item_template.Flags for custom items (migrate_items.py zeroed them).
-- Source wago ItemSparse Flags_0 masked to WotLK-valid bits (0x7FFFFFFF; drops the Cata sign-bit).
-- Low bits (conjured/playercast/party-loot/millable/prospectable) are stable 3.3.5<->4.x. Idempotent.

UPDATE item_template SET Flags=64 WHERE entry=84301;
UPDATE item_template SET Flags=64 WHERE entry=84303;
UPDATE item_template SET Flags=2048 WHERE entry=84304;
UPDATE item_template SET Flags=64 WHERE entry=84305;
UPDATE item_template SET Flags=64 WHERE entry=84309;
UPDATE item_template SET Flags=2048 WHERE entry=84310;
UPDATE item_template SET Flags=64 WHERE entry=84311;
UPDATE item_template SET Flags=2048 WHERE entry=84313;
UPDATE item_template SET Flags=64 WHERE entry=84318;
UPDATE item_template SET Flags=8390720 WHERE entry=84319;
UPDATE item_template SET Flags=131136 WHERE entry=84320;
UPDATE item_template SET Flags=131136 WHERE entry=84322;
UPDATE item_template SET Flags=64 WHERE entry=84324;
UPDATE item_template SET Flags=64 WHERE entry=84326;
UPDATE item_template SET Flags=2048 WHERE entry=84327;
UPDATE item_template SET Flags=2048 WHERE entry=84328;
UPDATE item_template SET Flags=2048 WHERE entry=84329;
UPDATE item_template SET Flags=2112 WHERE entry=84330;
UPDATE item_template SET Flags=64 WHERE entry=84332;
UPDATE item_template SET Flags=2048 WHERE entry=84334;
UPDATE item_template SET Flags=2048 WHERE entry=84335;
UPDATE item_template SET Flags=131072 WHERE entry=84337;
UPDATE item_template SET Flags=64 WHERE entry=84340;
UPDATE item_template SET Flags=4194304 WHERE entry=84438;
UPDATE item_template SET Flags=4194304 WHERE entry=84439;
UPDATE item_template SET Flags=64 WHERE entry=84460;
UPDATE item_template SET Flags=131072 WHERE entry=84463;
UPDATE item_template SET Flags=131072 WHERE entry=84464;
UPDATE item_template SET Flags=131072 WHERE entry=84465;
UPDATE item_template SET Flags=64 WHERE entry=84468;
UPDATE item_template SET Flags=64 WHERE entry=84474;
UPDATE item_template SET Flags=64 WHERE entry=84495;
