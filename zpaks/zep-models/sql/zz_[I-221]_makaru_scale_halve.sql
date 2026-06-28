-- I-221 Makaru (Markaru) Model Scale Halve
-- Makaru (creature_template 20775) renders far too large; halve its size.
-- Size = DisplayScale(server) x creature_model_scale(DBC) x model_scale(DBC).
-- Single model (display 19776); DisplayScale 1.0 -> 0.5 halves the rendered size.
-- World DB only; no PATCH-Z. Idempotent.

UPDATE `creature_template_model` SET `DisplayScale` = 0.5 WHERE `CreatureID` = 20775 AND `CreatureDisplayID` = 19776;  -- 1.0 -> 0.5 = half size
