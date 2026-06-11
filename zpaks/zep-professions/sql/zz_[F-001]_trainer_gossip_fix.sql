-- =============================================================================
-- F-001: Trainer Gossip Flag Fix
-- =============================================================================
-- Profession trainers that serve as F-001 quest givers need BOTH:
--   - npcflag bit 1 (GOSSIP)  : opens gossip window so quests appear in dialogue
--   - npcflag bit 2 (QUESTGIVER) : already set by quest SQL files
--
-- CRITICAL: gossip_menu_id MUST be non-zero. Menu 0 contains "I wish to
-- unlearn my talents" and "Purchase a Dual Talent Specialization" options
-- (gossip_menu_option MenuID=0, OptionType 16/18). Because CanResetTalents()
-- returns true for ANY trainer valid for the player (including profession
-- trainers via IsTrainerValidForPlayer -> HasSpell), these options would
-- appear on profession trainers if gossip_menu_id = 0.
--
-- Safe profession trainer menus used:
--   7690 = Mining    ("I can instruct you in mining.")    + Train + Browse
--   7691 = Herbalism ("I can instruct you in herbalism.") + Train + Browse
--   7842 = Skinning  ("I can instruct you in skinning.")  + Train
--   7816 = Generic   ("Have you honed your skills...")    + Train + Browse
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Mining trainers (gossip_menu_id = 7690)
-- -----------------------------------------------------------------------------
UPDATE creature_template
SET npcflag = npcflag | 1, gossip_menu_id = 7690
WHERE entry IN (
    18747, -- Krugosh (Hellfire, Horde)
    28698  -- Jedidiah Handers (Dalaran)
) AND gossip_menu_id = 0;

-- -----------------------------------------------------------------------------
-- Herbalism trainers (gossip_menu_id = 7691)
-- -----------------------------------------------------------------------------
UPDATE creature_template
SET npcflag = npcflag | 1, gossip_menu_id = 7691
WHERE entry IN (
    4204,  -- Firodren Mooncaller (Darnassus)
    16736, -- Cemmorhan (Exodar)
    28704  -- Dorothy Egan (Dalaran)
) AND gossip_menu_id = 0;

-- -----------------------------------------------------------------------------
-- Skinning trainers (gossip_menu_id = 7842)
-- -----------------------------------------------------------------------------
UPDATE creature_template
SET npcflag = npcflag | 1, gossip_menu_id = 7842
WHERE entry IN (
    6291,  -- Balthus Stoneflayer (Ironforge)
    6292,  -- Eladriel (Darnassus)
    7087,  -- Killian Hagey (Undercity)
    7088,  -- Thuwd (Thunder Bluff)
    7089,  -- Mooranta (Orgrimmar)
    28696  -- Derik Marks (Dalaran)
) AND gossip_menu_id = 0;

-- [I-195] Mathreyn (16273) was wrongly used as the "Exodar" skinning/tailoring
-- quest giver - he is the EVERSONG WOODS skinning trainer (Silvermoon faction).
-- Quests re-pointed to Remere (16763, skinning) and Refik (16729, tailoring),
-- both of whom already have native gossip menus. Revert Mathreyn to stock.
UPDATE creature_template
SET npcflag = 80, gossip_menu_id = 0
WHERE entry = 16273 AND gossip_menu_id = 7842;

-- -----------------------------------------------------------------------------
-- Leatherworking trainers (gossip_menu_id = 7816 - generic trainer)
-- -----------------------------------------------------------------------------
UPDATE creature_template
SET npcflag = npcflag | 1, gossip_menu_id = 7816
WHERE entry IN (
    16728, -- Akham (Exodar)
    28700  -- Diane Cannings (Dalaran)
) AND gossip_menu_id = 0;

-- -----------------------------------------------------------------------------
-- Inscription trainers (gossip_menu_id = 7816 - generic trainer)
-- -----------------------------------------------------------------------------
-- NOTE: 30713 (Catarina Stanford) already has GOSSIP flag but gossip_menu_id=0,
-- which is a LIVE BUG causing unlearn talents/dual spec to appear. This update
-- fixes her gossip_menu_id without needing to touch the flag.
UPDATE creature_template
SET npcflag = npcflag | 1, gossip_menu_id = 7816
WHERE entry IN (
    28702, -- Professor Pallin (Dalaran)
    30706, -- Jo'mah (Orgrimmar)
    30709, -- Poshken Hardbinder (Thunder Bluff)
    30710, -- Zantasia (Silvermoon)
    30711, -- Margaux Parchley (Undercity)
    30713, -- Catarina Stanford (Stormwind) -- LIVE BUG: already had GOSSIP + menu 0
    30715, -- Feyden Darkin (Darnassus)
    30716, -- Thoth (Exodar)
    30717, -- Elise Brightletter (Ironforge)
    30721, -- Michael Schwan (Outland)
    30722  -- Neferatti (Outland)
) AND gossip_menu_id = 0;
