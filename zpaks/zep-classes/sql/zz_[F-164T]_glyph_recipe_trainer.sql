-- [F-164T] Glyph of Thunderborne Leap - Inscription trainer wiring (split from F-164
-- zz_[F-164]_glyph_recipes_trainer.sql).
--
-- Adds the recipe (spell 900296, defined in [F-164T]_spell.sql) to npc_trainer template
-- 201021 — the UNIVERSAL Inscription trainer list (leveling/city trainers, skill 15-315;
-- Northrend master trainers also reference it), so the glyph is learnable at every
-- Inscription trainer once the scribe has the skill.
--
-- ReqSkillRank 215 gated to the ability's actual acquisition level (talent tier 10 ~= L59)
-- and the Celestial Ink (43120) make-skill. Idempotent: DELETE our recipe spell from ANY
-- template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` = 900296;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900296, 10000, 773, 215, 0, 0);  -- Glyph of Thunderborne Leap (L59)
