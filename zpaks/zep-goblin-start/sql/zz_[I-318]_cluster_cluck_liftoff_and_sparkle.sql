-- I-318 : Cluster Cluck (q24671) - captured cluckers do not lift off, and the
-- interact sparkle sticks to the player forever.
--
-- Both were invisible until the visual chain was ported (same issue): the sparkle
-- is `particles\lootfx.mdx`, carried by SpellVisual 15092, which rendered nothing
-- before spellvisuals.py started emitting it.

-- ---------------------------------------------------------------------------
-- 1. Cluster Cluck is item-only: no click interaction, no sparkle at all.
-- ---------------------------------------------------------------------------
-- The quest hands out an item ("Take these remote control fireworks and attach
-- them to the cluckers"), and the birds are ordinary selectable creatures, so the
-- spellclick path is redundant with the item path: both ended in the same place,
-- creature 38111 SPELLHIT 71170 -> actionlist 3811100. Dropping it removes the
-- whole sparkle apparatus rather than repairing it.
--
-- What the sparkle was and why it had to go:
--   * On the BIRDS it comes from `creature_template_addon` aura 66727 (plus 8
--     per-guid rows), permanent and identical for every observer. It cannot be
--     gated on quest state - a creature's ambient aura has no per-player variant -
--     so it kept shimmering long after turn-in. Retail hides them by phasing the
--     zone forward instead; all 65 spawns here sit in phaseMask 2048.
--   * On the PLAYER it was a real bug: `cast_flags` carried
--     NPC_CLICK_CAST_CASTER_CLICKER (0x1) from the donor, so AC resolved
--         Unit* caster = (castFlags & NPC_CLICK_CAST_CASTER_CLICKER) ? clicker : this;
--     and 66727 applies its aura to TARGET_UNIT_CASTER (1) - the permanent shimmer
--     landed on the clicking player and was SAVED to `character_aura`
--     (remainTime -1), surviving relogs. Existing victims need `.unaura 66727`;
--     SQL cannot reach an aura already on a character.
--
-- npcflag 16777216 (SPELLCLICK) is cleared too, so the client stops offering an
-- interact cursor for a click that no longer exists. Selectability is unaffected -
-- unit_flags 32768 is UNIT_FLAG_SWIMMING, not NOT_SELECTABLE (0x02000000) - so the
-- bird can still be targeted for the item.
--
-- Leaves creature 38111's two ON_SPELLCLICK SAI rows (ids 1 and 8) in place. With
-- no npcflag and no spellclick row, HandleSpellClick never runs and they are inert;
-- forking the whole 9-row block to delete two dead rows would freeze the escort
-- rows (which reference GO guid 106846) against future regens for no gain.
DELETE FROM npc_spellclick_spells WHERE npc_entry = 38111;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 18 AND SourceGroup = 38111;
UPDATE creature_template SET npcflag = 0 WHERE entry = 38111;
UPDATE creature_template_addon SET auras = '' WHERE entry = 38111;
UPDATE creature_addon SET auras = ''
 WHERE guid IN (11001802, 11001811, 11001812, 11001826,
                11001827, 11001845, 11001846, 11001854);

-- Irresistible Pool Pony (38412 + 44578-44580 / 83142) has the identical
-- caster-clicker defect but genuinely needs its click, so it is repaired rather
-- than removed. Unreported only because its visual (17188) had not been emitted
-- yet - fixed here rather than left as a landmine for the next PATCH-Z. The
-- generator-side rule lives in `goblin_gen/spellclick.py::_fix_clicker_selfcast`;
-- this makes it live without a regen.
--
-- Deliberately NOT touched: clicks whose spell the creature does not already carry
-- (37945/38430 -> 70766 Dream State, aura 261 phase) and stock 24418 Flying Machine
-- Controls. There the clicker really is meant to be the caster.
UPDATE npc_spellclick_spells SET cast_flags = 0
 WHERE npc_entry IN (38412, 44578, 44579, 44580) AND spell_id = 83142;

-- ---------------------------------------------------------------------------
-- 2. Captured cluckers walked off instead of rocketing up.
-- ---------------------------------------------------------------------------
-- Full re-definition of timed actionlist 3811100 (the imported one is otherwise
-- kept beat for beat). Two changes to the source ordering:
--
--   * Flight (57403) is cast BEFORE the bird is asked to move, not after. The
--     import cast it at entry 5, two steps after the movement call.
--   * a vertical MOVE_TO_POS replaces nothing and is inserted before WP_START, so
--     the rocket carries the bird ~8 yards straight up first; the 2s that already
--     preceded the escort now covers the climb, and only then does it turn for the
--     coop. Previously the bird idled on the spot for 2s and then ran the escort
--     path at ground level, which is what "the motion seems weird" was.
--
-- MOVE_TO_POS (69) with target_type 1 (SELF) uses target_x/y/z as an OFFSET from
-- the creature's own position (SmartScript.cpp, the `default:` branch of the
-- action), so target_z = 8 is "8 yards above wherever this bird was clicked" - it
-- works for all 65 spawns without per-spawn coordinates. action_param6 = 0 leaves
-- disableForceDestination unset, i.e. forceDestination TRUE, so the climb is not
-- re-clamped to the ground by pathfinding.
--
-- The escort path itself (`waypoints` entry 38111 -> the coop, then ESCORT_REACHED
-- rows 3-7 on creature 38111 activate GO 106846 and despawn) is unchanged.
DELETE FROM smart_scripts WHERE source_type = 9 AND entryorguid = 3811100;
INSERT INTO smart_scripts (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
  (3811100, 9, 0, 0, 0, 0, 100, 0, 0, 0, 0, 0, 81, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Clear NPC flags (no second click)'),
  (3811100, 9, 1, 0, 0, 0, 100, 0, 0, 0, 0, 0, 33, 38117, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Quest credit to the invoker'),
  (3811100, 9, 2, 0, 0, 0, 100, 0, 0, 0, 0, 0, 89, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Stop wandering (MoveIdle)'),
  (3811100, 9, 3, 0, 0, 0, 100, 0, 0, 0, 0, 0, 2, 35, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Set faction 35'),
  (3811100, 9, 4, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 57403, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast Flight BEFORE moving (I-318)'),
  (3811100, 9, 5, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 74177, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast the jetpack visual'),
  (3811100, 9, 6, 0, 0, 0, 100, 0, 0, 0, 0, 0, 11, 96840, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - Cast Rocket Trail'),
  (3811100, 9, 7, 0, 0, 0, 100, 0, 0, 0, 0, 0, 69, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 8, 0, 'Wild Clucker - Captured - Rocket 8y straight up (I-318)'),
  (3811100, 9, 8, 0, 0, 0, 100, 0, 2000, 2000, 0, 0, 53, 1, 38111, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Wild Clucker - Captured - After the climb, fly the escort path to the coop');
