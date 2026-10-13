-- Items for a new character to start with
DELETE FROM `playercreateinfo_item`;

INSERT INTO `playercreateinfo_item` SET
    `itemid` = 7005,
    `Note` = 'Skinning Knife';

INSERT INTO `playercreateinfo_item` SET
    `itemid` = 2901,
    `Note` = 'Mining Pick';

INSERT INTO `playercreateinfo_item` SET
    `itemid` = 3762,
    `Note` = 'Librarians Satchel';

INSERT INTO `playercreateinfo_item` SET
    `itemid` = 6219,
    `Note` = 'Arclight Spanner';


-- F-168: starting food and drink. Stock 3.3.5 start outfits carry none (only the death knight's
-- Black Mushrooms and the dwarf mage's bread/water), so every new character bought them with coin
-- it did not have. The food is what its starting area's vendors sell (Kezan's own hardtack and dew
-- for goblins); 10 food for every class but the death knight, 20 drinks for the mana classes only
-- (no drink for warriors or rogues).

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 1,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 2,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 2,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Human Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 4,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 5,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Human Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 8,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Human Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 9,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Human Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 1,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Human Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 1,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Orc Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 3,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Orc Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Orc Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 4,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Orc Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 7,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Orc Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 7,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Orc Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 9,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Orc Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 2,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Orc Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 1,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Dwarf Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 2,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Dwarf Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 2,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Dwarf Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 3,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Dwarf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Dwarf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 4,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Dwarf Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 5,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Dwarf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 3,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Dwarf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 1,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Night Elf Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 3,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Night Elf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Night Elf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 4,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Night Elf Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 5,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Night Elf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Night Elf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 11,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Night Elf Druid (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 4,
    `class` = 11,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Night Elf Druid (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 1,
    `itemid` = 4604,
    `amount` = 10,
    `Note` = 'Forest Mushroom Cap - Undead Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 4,
    `itemid` = 4604,
    `amount` = 10,
    `Note` = 'Forest Mushroom Cap - Undead Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 5,
    `itemid` = 4604,
    `amount` = 10,
    `Note` = 'Forest Mushroom Cap - Undead Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Undead Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 8,
    `itemid` = 4604,
    `amount` = 10,
    `Note` = 'Forest Mushroom Cap - Undead Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Undead Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 9,
    `itemid` = 4604,
    `amount` = 10,
    `Note` = 'Forest Mushroom Cap - Undead Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 5,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Undead Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 1,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Tauren Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 3,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Tauren Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Tauren Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 7,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Tauren Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 7,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Tauren Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 11,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Tauren Druid (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 6,
    `class` = 11,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Tauren Druid (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 1,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Gnome Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 4,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Gnome Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 8,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Gnome Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Gnome Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 9,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Gnome Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 7,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Gnome Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 1,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 3,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Troll Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 4,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 5,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Troll Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 7,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 7,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Troll Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 8,
    `itemid` = 117,
    `amount` = 10,
    `Note` = 'Tough Jerky - Troll Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 8,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Troll Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 1,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 3,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 3,
    `itemid` = 84437,
    `amount` = 20,
    `Note` = 'Tarp Collected Dew - Goblin Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 4,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 5,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 5,
    `itemid` = 84437,
    `amount` = 20,
    `Note` = 'Tarp Collected Dew - Goblin Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 7,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 7,
    `itemid` = 84437,
    `amount` = 20,
    `Note` = 'Tarp Collected Dew - Goblin Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 8,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 8,
    `itemid` = 84437,
    `amount` = 20,
    `Note` = 'Tarp Collected Dew - Goblin Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 9,
    `itemid` = 84436,
    `amount` = 10,
    `Note` = 'Slightly Worm-Eaten Hardtack - Goblin Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 9,
    `class` = 9,
    `itemid` = 84437,
    `amount` = 20,
    `Note` = 'Tarp Collected Dew - Goblin Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 2,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 2,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Blood Elf Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 3,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Blood Elf Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 4,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 5,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Blood Elf Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 8,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Blood Elf Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 9,
    `itemid` = 4540,
    `amount` = 10,
    `Note` = 'Tough Hunk of Bread - Blood Elf Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 10,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Blood Elf Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 1,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 2,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 2,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Draenei Paladin (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 3,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Draenei Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 5,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Draenei Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 7,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 7,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Draenei Shaman (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 8,
    `itemid` = 20857,
    `amount` = 10,
    `Note` = 'Honey Bread - Draenei Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 11,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Draenei Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 1,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Warrior (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 3,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 3,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Worgen Hunter (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 4,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Rogue (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 5,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 5,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Worgen Priest (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 8,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 8,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Worgen Mage (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 9,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 9,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Worgen Warlock (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 11,
    `itemid` = 44855,
    `amount` = 10,
    `Note` = 'Teldrassil Sweet Potato - Worgen Druid (F-168)';

INSERT INTO `playercreateinfo_item` SET
    `race` = 12,
    `class` = 11,
    `itemid` = 159,
    `amount` = 20,
    `Note` = 'Refreshing Spring Water - Worgen Druid (F-168)';
