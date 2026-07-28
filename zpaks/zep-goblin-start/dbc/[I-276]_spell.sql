-- ============================================================
-- I-276  Custom spells: the Shipwreck Shore arrival scene (F-011)
--
-- Retail stages the "wash up unconscious on a plank" arrival from C++. The whole
-- spell chain exists in the 4.3.4 DBC (69283 Master -> 69040 placement -> 69018
-- summon Doc -> 69085 force cast -> 69022 Jumper Cables -> 69013 quest complete
-- -> 69043 despawn), but every step that DOES anything is a SCRIPT_EFFECT or a
-- DUMMY whose behaviour lives in a script TrinityCore never wrote. There is no
-- aura anywhere in the 4.3.4 DBC that lays the player out, so nothing here is a
-- port -- the two spells below are authored.
-- ============================================================


-- ---- 900841 Shipwrecked -------------------------------------------------
-- The prone lock. Cast on the player by spell_linked_spell off 74100 (the Life
-- Savings teleport), so it lands the instant they arrive.
--
-- FEIGN_DEATH is aura **66** in 3.3.5a, not 51 -- checked against the handler
-- table in SpellAuraEffects.cpp:131. It sets UNIT_FLAG2_FEIGN_DEATH and the dead
-- dynamic flag, which is what makes the character model lie down. MOD_ROOT (26)
-- stops them crawling out of the scene. MOD_STUN (12) on effect 3 stops them
-- TURNING as well -- root pins the position but leaves facing free, which is why
-- the player could still spin on the spot while unconscious.
--
-- attributes_ex_1 0x10000000 hides it from the buff bar (I-259), which also
-- means the player cannot right-click it off and break the lock early.
--
-- Implicit target 25 TARGET_UNIT_TARGET_ANY, NOT 1 TARGET_UNIT_CASTER. Doc casts
-- this on the player from his actionlist, so a caster-target would have proned
-- DOC instead. It still works on the spell_linked_spell path off 74100, where
-- caster and target are both the player.
--
-- range_index 13 'Anywhere', NOT 1. spellrange id 1 is "Self Only" (min 0 / max
-- 0), so Doc's cast at the player 2y away failed the range check outright and
-- the player was never proned -- the bug behind the second failed test. The
-- spell is only ever cast on a target the script has already chosen, so an
-- unrestricted range costs nothing.
--
-- duration_index 21 = PERMANENT. The lifecycle is owned by `spell_area`, which
-- applies this on entering Shipwreck Shore with Life Savings done and removes it
-- the moment 14239 is handed in -- so a timer would serve no purpose except to
-- expire mid-scene and replay the collapse animation on re-application.
--
-- attributes carries SPELL_ATTR0_NO_AURA_CANCEL (0x80000000) on top of the
-- existing 0x80. The player could still WALK after talking to Doc even with the
-- root applied and the stand state forced, which means the aura itself was
-- going away on gossip. Nothing server-side removes it -- NPCHandler.cpp:165
-- only strips AURA_INTERRUPT_FLAG_TALK auras (ours has none) and its
-- feign-death removal is commented out -- so the remaining path is the CLIENT
-- sending CMSG_CANCEL_AURA. WorldSession::HandleCancelAuraOpcode
-- (SpellHandler.cpp:576) refuses exactly that when this attribute is set.
--
-- Escape hatch if a run ever wedges: `.unaura 900841`.
DELETE FROM `spell` WHERE `id` = 900841;
INSERT INTO `spell` SET
  `id` = 900841,
  `spell_name_enus` = 'Shipwrecked',
  `spell_desc_enus` = 'Washed up on the shore of the Lost Isles, barely breathing.',
  `attributes` = 0x80000080,
  `attributes_ex_1` = 0x10000000,
  `duration_index` = 21,
  `range_index` = 13,
  `cast_time_index` = 1,
  `school_mask` = 1,
  `proc_chance` = 101,
  `equipped_item_class` = -1,
  `damage_class` = 0,
  `spell_level` = 0,
  `base_level` = 0,
  `max_level` = 0,
  `spell_icon_id` = 1,
  `effect_1` = 6,
  `effect_apply_aura_name_1` = 66,
  `effect_implicit_target_a_1` = 25,
  `effect_die_sides_1` = 1,
  `effect_base_points_1` = 0,
  `effect_2` = 6,
  `effect_apply_aura_name_2` = 26,
  `effect_implicit_target_a_2` = 25,
  `effect_die_sides_2` = 1,
  `effect_base_points_2` = 0,
  `effect_3` = 6,
  `effect_apply_aura_name_3` = 12,
  `effect_implicit_target_a_3` = 25,
  `effect_die_sides_3` = 1,
  `effect_base_points_3` = 0;


-- ---- 900842 Jumper Cables Jolt ------------------------------------------
-- The zap Doc lands on the player every few seconds. Pure DUMMY -- it exists for
-- the visual and nothing else, so it cannot damage, interrupt or break the prone
-- aura.
--
-- spell_visual_1 = 173 is STOCK Lightning Bolt's visual (spells 403/529/548 all
-- share it), so Doc visibly shoots the player with a lightning bolt. The two
-- earlier attempts produced no visible effect at all:
--   * visual 2641, borrowed from the jumper-cables item spell 9273, rendered
--     nothing from a creature caster;
--   * and casting with SMARTCAST_TRIGGERED suppresses the cast animation
--     entirely, so even a good visual would not have shown.
-- cast_time_index 16 = 1500ms gives a real cast to animate, and school_mask 8
-- (Nature) matches a lightning bolt. The jolt rows drop castFlags back to 0 so
-- the cast is not triggered -- 900842 is a pure DUMMY with no negative aura, so
-- unlike the prone spell it is castable at a friendly target normally.
--
-- Implicit target 25 = TARGET_UNIT_TARGET_ANY (SpellInfo.cpp:238), which is what
-- the Cata 69022 uses too, so SmartAI's cast at SMART_TARGET_ACTION_INVOKER
-- resolves onto the prone player.
DELETE FROM `spell` WHERE `id` = 900842;
INSERT INTO `spell` SET
  `id` = 900842,
  `spell_name_enus` = 'Jumper Cables Jolt',
  `spell_desc_enus` = 'CLEAR!',
  `attributes` = 0x00000080,
  `attributes_ex_1` = 0x10000000,
  `duration_index` = 0,
  `range_index` = 6,
  `cast_time_index` = 16,
  `school_mask` = 8,
  `proc_chance` = 101,
  `equipped_item_class` = -1,
  `damage_class` = 0,
  `spell_visual_1` = 173,
  `spell_icon_id` = 1,
  `effect_1` = 3,
  `effect_implicit_target_a_1` = 25,
  `effect_die_sides_1` = 1,
  `effect_base_points_1` = 0;


-- ---- 900843 Revived ------------------------------------------------------
-- A marker, nothing more: hidden, permanent, no gameplay effect. Doc applies it
-- at the end of the RP and `spell_area` uses it as the release signal for the
-- prone lock (aura_spell = -900843, i.e. "only while the player does NOT have
-- this"). SpellMgr.cpp:1084 implements that negative form.
--
-- This replaces an earlier attempt that gave quest 14239 a kill-credit objective
-- on Doc so the RP could "complete" it. That worked mechanically but modelled
-- being resuscitated as killing the medic, which is wrong on its face and would
-- have shown Doc as a kill target in the quest log.
DELETE FROM `spell` WHERE `id` = 900843;
INSERT INTO `spell` SET
  `id` = 900843,
  `spell_name_enus` = 'Revived',
  `spell_desc_enus` = 'Back among the living, thanks to a pair of wet jumper cables.',
  `attributes` = 0x80000080,
  `attributes_ex_1` = 0x10000000,
  `duration_index` = 21,
  `range_index` = 13,
  `cast_time_index` = 1,
  `school_mask` = 1,
  `proc_chance` = 101,
  `equipped_item_class` = -1,
  `damage_class` = 0,
  `spell_icon_id` = 1,
  `effect_1` = 6,
  `effect_apply_aura_name_1` = 4,
  `effect_implicit_target_a_1` = 25,
  `effect_die_sides_1` = 1,
  `effect_base_points_1` = 0;
