-- I-235: Kezan trolls should use self-textured NPC forest-troll models, not
-- Darkspear player models (and not the white bake-dependent char model 2613).
--
-- Hand fix (do NOT fold into the auto-generated creature model file). The
-- pipeline emits placeholder display 646 for these four trolls; this file loads
-- after zz_[F-011]_K_creatures_02_model.sql (alphabetical: [F-011] < [I-235])
-- and repoints them to display 298 (TrollSkinJungleForestMelee, creature model
-- 119) -- the green Amani/Shadowpine forest-troll look. Display 298 is stock
-- self-textured content with a valid creature_model_info row, so this is
-- server-side only: no client patch, no DBC edit, no new assets.
--
-- Supersedes the Darkspear displays chosen in I-232 (28703/4083).
-- See also I-232 (white-render root cause) and the character-model-needs-bake note.

DELETE FROM creature_template_model WHERE CreatureID IN (34830, 35294, 35239, 48984);
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES
  (34830,0,298,1,1,0),  -- Defiant Troll
  (35294,0,298,1,1,0),  -- Rebellious Troll
  (35239,0,298,1,1,0),  -- Troll Slave
  (48984,0,298,1,1,0);  -- Troll Worker
