-- [F-164] Earthwarden skillline
-- Creates the Earthwarden class skill so talent-granted active spells
-- appear in a dedicated spellbook tab instead of General.
-- Flags must match other class skilllines (Enhancement 373 as reference).

DELETE FROM `skillline` WHERE `id` = 9001;

INSERT INTO `skillline` (
    `id`, `category`, `cost`,
    `name_enus`,
    `name_kokr`, `name_frfr`, `name_dede`, `name_zhcn`, `name_zhtw`,
    `name_eses`, `name_esmx`, `name_ruru`, `name_jajp`, `name_ptpt`,
    `name_itit`, `name_unused_1`, `name_unused_2`, `name_unused_3`, `name_unused_4`,
    `name_flags`,
    `desc_enus`,
    `desc_kokr`, `desc_frfr`, `desc_dede`, `desc_zhcn`, `desc_zhtw`,
    `desc_eses`, `desc_esmx`, `desc_ruru`, `desc_jajp`, `desc_ptpt`,
    `desc_itit`, `desc_unused_1`, `desc_unused_2`, `desc_unused_3`, `desc_unused_4`,
    `desc_flags`,
    `icon_id`,
    `verb_enus`,
    `verb_kokr`, `verb_frfr`, `verb_dede`, `verb_zhcn`, `verb_zhtw`,
    `verb_eses`, `verb_esmx`, `verb_ruru`, `verb_jajp`, `verb_ptpt`,
    `verb_itit`, `verb_unused_1`, `verb_unused_2`, `verb_unused_3`, `verb_unused_4`,
    `verb_flags`
) VALUES (
    9001, 7, 0,
    'Earthwarden',
    '', '', '', '', '',
    '', '', '', '', '',
    '', '', '', '', '',
    16712190,
    '',
    '', '', '', '', '',
    '', '', '', '', '',
    '', '', '', '', '',
    16712188,
    4610,
    '',
    '', '', '', '', '',
    '', '', '', '', '',
    '', '', '', '', '',
    16712172
);
