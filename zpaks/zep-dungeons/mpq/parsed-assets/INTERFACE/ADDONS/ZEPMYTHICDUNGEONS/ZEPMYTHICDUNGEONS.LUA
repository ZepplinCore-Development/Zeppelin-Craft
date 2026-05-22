-- ZepMythicDungeons
-- Adds mythic (difficulty 3) option to the dungeon difficulty dropdown
-- and defines the ITEM_HEROIC_EPIC_CUSTOM string for mythic item tooltips.

-- GlobalString overrides
DUNGEON_DIFFICULTY3 = "5 Player (Mythic)"
ITEM_HEROIC_EPIC_CUSTOM = "Mythic"

-- Register the DUNGEON_DIFFICULTY3 button in UnitPopup
UnitPopupButtons["DUNGEON_DIFFICULTY3"] = { text = DUNGEON_DIFFICULTY3, dist = 0 }

-- Add mythic to the dungeon difficulty submenu
UnitPopupMenus["DUNGEON_DIFFICULTY"] = {
    "DUNGEON_DIFFICULTY1",
    "DUNGEON_DIFFICULTY2",
    "DUNGEON_DIFFICULTY3",
}

-- Hook UnitPopup_HideButtons to lower the dungeon difficulty level requirement
-- Stock requires level 65 to see the submenu; we lower it to 60.
hooksecurefunc("UnitPopup_HideButtons", function()
    if UnitLevel("player") >= 60 and UnitLevel("player") < 65 then
        local dropdownMenu = UIDROPDOWNMENU_INIT_MENU
        local level = UIDROPDOWNMENU_MENU_LEVEL
        for index, value in ipairs(UnitPopupMenus[dropdownMenu.which] or {}) do
            if value == "DUNGEON_DIFFICULTY" then
                -- Re-show the difficulty submenu that stock code hid
                UnitPopupShown[level][index] = 1
                break
            end
        end
    end
end)
