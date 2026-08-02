-- F-004 classless raid buffs — custom 79058 "Arcane Brilliance" is shadowed by the
-- stock TDB spell_dbc row "zzOldArcane Brilliance" (the world `spell_dbc` table
-- OVERRIDES Spell.dbc records at load, DBCDatabaseLoader.cpp:77 — trap discovered
-- in I-262). The stale stub silently replaces our definition server-side; nothing
-- references it (no SAI casts, no links, no creature spells). Delete so the server
-- uses our Spell.dbc record.

DELETE FROM `spell_dbc` WHERE `ID` = 79058;
