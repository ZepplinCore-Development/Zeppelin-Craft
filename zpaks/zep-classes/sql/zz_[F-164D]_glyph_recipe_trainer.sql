-- [F-164D] Glyph of Volcanic Shield - Inscription trainer wiring (split from F-164
-- zz_[F-164]_glyph_recipes_trainer.sql).
--
-- Adds the recipe (spell 900294, defined in [F-164D]_spell.sql) to npc_trainer template
-- 201021 — the UNIVERSAL Inscription trainer list (leveling/city trainers, skill 15-315;
-- Northrend master trainers also reference it), so the glyph is learnable at every
-- Inscription trainer once the scribe has the skill.
--
-- ReqSkillRank 130 gated to the ability's actual acquisition level (talent tier 5 ~= L34)
-- and the Lion's Ink (43116) make-skill. Idempotent: DELETE our recipe spell from ANY
-- template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` = 900294;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900294, 5000, 773, 130, 0, 0);  -- Glyph of Volcanic Shield (L34)
