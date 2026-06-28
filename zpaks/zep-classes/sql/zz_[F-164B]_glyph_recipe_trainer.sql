-- [F-164B] Glyph of Crag Strike - Inscription trainer wiring (split from F-164
-- zz_[F-164]_glyph_recipes_trainer.sql).
--
-- Adds the recipe (spell 900293, defined in [F-164B]_spell.sql) to npc_trainer template
-- 201021 - the UNIVERSAL Inscription trainer list (leveling/city trainers, skill 15-315;
-- Northrend masters also reference it), so the glyph is learnable at every Inscription
-- trainer once the scribe has the skill. Gated to Crag Strike's actual acquisition level
-- (talent tier 2 ~= L19) via Midnight ink's make-skill 80.
-- Idempotent + migrates off any earlier wiring: DELETE the recipe spell from ANY template,
-- then re-INSERT on 201021.
DELETE FROM `npc_trainer` WHERE `SpellID` = 900293;
INSERT INTO `npc_trainer` (`ID`, `SpellID`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqLevel`, `ReqSpell`) VALUES
(201021, 900293, 1000, 773, 80, 0, 0);  -- Glyph of Crag Strike (L19, Midnight)
