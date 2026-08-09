-- I-328 "A Goblin in Shark's Clothing" (quest 24817) — Mechashark X-Steam (38318).
--
-- Symptom: clicking the Mechashark X-Steam Controller (GO 202108) spawns the shark
-- next to the player and nothing else happens — no vehicle entry, no objective credit.
--
-- Chain: GO 202108 Data10 -> spell 71662 (FORCE_CAST) -> 71648 (SUMMON 38318,
-- SummonProperties 827 = SUMMON_CATEGORY_VEHICLE) -> AC casts the CONTROL_VEHICLE
-- spell 71661 on the summon. That last step is guarded (SpellEffects.cpp:2554):
--
--     if (!summon || !summon->IsVehicle())
--         return;
--
-- and 38318 shipped with VehicleId 0, so the function returns right after summoning.
--
-- Why VehicleId was lost: 38318 has no spawn row anywhere (summon-only), so it reaches
-- creature_template either from creatures.py via the port's summon closure (full row,
-- carries VehicleId) or from quest_npcs.py as a RequiredNpcOrGo objective proxy (a
-- reduced column set with no VehicleId / speed_swim / unit_flags2). The proxy won,
-- because the summon closure never contained it: _spellscope.GO_SPELL_FIELDS looks up
-- "Data10" while the Neltharion donor's gameobject_template columns are lowercase
-- (data0..data23) — SQL is case-insensitive, the connector's dict keys are not, so
-- row.get("Data10") is None and the whole GO data-field walk vanished from
-- presweep_required(), the only scope _summons.py reads. Fixed in the emitter; this
-- file carries the live state so the zone works without a full regen.
--
-- Companion DBC files: [I-328]_vehicle.sql (Vehicle 628), [I-328]_vehicleseat.sql
-- (seat 7527), [I-328]_spell.sql (71648 ride-spell value).
--
-- Not touched here: zz_[F-011]_invalid_factions.sql sets 38318 faction 14. Harmless
-- once the ride works — SpellEffects.cpp:2577 overwrites a vehicle summon's faction
-- with the summoner's — and it is the correct guard while the shark is unridable.

-- AUTO-owned row (zz_[AUTO,F-011]_10_creature_template.sql) -> one consolidated UPDATE.
-- Donor values: VehicleId 628, speed_swim 2.0, unit_flags2 2048 (REGENERATE_POWER).
UPDATE creature_template SET
  `VehicleId` = 628,
  `speed_swim` = 2,
  `unit_flags2` = 2048
WHERE entry = 38318;

-- Vehicle action bar (donor creature_template.spell1-3). All three are already ported
-- by [AUTO,F-011]_spell.sql; vehicles.py never emitted the bar because it iterates
-- collected creatures with VehicleId != 0.
--   71658 Egg-splosive Barrage / 71659 Freakin' Laser Beam / 71660 Repair
DELETE FROM creature_template_spell WHERE CreatureID = 38318;
INSERT INTO creature_template_spell (CreatureID, `Index`, Spell, VerifiedBuild) VALUES
  (38318, 0, 71658, 0),
  (38318, 1, 71659, 0),
  (38318, 2, 71660, 0);

-- Re-board path after a voluntary exit. Dropped because spellclick.py is spawn-scoped
-- (TRIM(zone) on the source `creature` table) and this creature never spawns — the same
-- summon-only hole _summons documents for templates (I-242) and creature_addon for
-- addons (I-277). cast_flags 1 = NPC_CLICK_CAST_CASTER_CLICKER: the clicker casts 71661
-- on the shark. Ungated in the source (no SourceType-18 condition) — the shark only
-- exists as the clicker's own summon.
DELETE FROM npc_spellclick_spells WHERE npc_entry = 38318;
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, cast_flags, user_type) VALUES
  (38318, 71661, 1, 0);
