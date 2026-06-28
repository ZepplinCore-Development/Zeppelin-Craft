-- [F-164A] Glyph of Tectonic Blast - Inscription trainer wiring (split from F-164
-- zz_[F-164]_glyph_recipes_trainer.sql).
--
-- Adds the recipe (spell 900292, defined in [F-164A]_spell.sql) to npc_trainer template
-- 201021 — the UNIVERSAL Inscription trainer list (leveling/city trainers, skill 15-315;
-- Northrend master trainers also reference it), so the glyph is learnable at every
-- Inscription trainer once the scribe has the skill.
--
-- ReqSkillRank 145 gated to the ability's actual acquisition level (talent tier 6 ~= L39)
-- and the Lion's Ink (43116) make-skill. Idempotent: DELETE our recipe spell from ANY
-- template, then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` = 900292;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900292, 5000, 773, 145, 0, 0);  -- Glyph of Tectonic Blast (L39)
