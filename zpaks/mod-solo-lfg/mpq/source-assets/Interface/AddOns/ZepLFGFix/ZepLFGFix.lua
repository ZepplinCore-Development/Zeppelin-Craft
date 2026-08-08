-- ZepLFGFix: Fixes for LFD/LFG UI issues
--   1. Null texture in LFD reward display for custom items
--   2. Unknown role error from SoloLFG testing mode

-------------------------------------------------------------------------------
-- Fix 1: LFD Ready Dialog reward display
-------------------------------------------------------------------------------
-- Two stock bugs:
-- a) CreateFrame(..., LFDDungeonReadyRewardTemplate) passes the template name
--    as a nil variable instead of a string. Frames 3+ lack .texture child.
-- b) Dialog is too narrow for 4+ reward icons (gold + 3 items). Skip the
--    gold/XP icon when item rewards are present to prevent overlap.

local function ensureRewardButton(button)
    if not button.texture then
        button:SetSize(40, 40)
        local bname = button:GetName()
        button.texture = button:CreateTexture(bname and (bname .. "Texture") or nil, "ARTWORK")
        button.texture:SetSize(30, 30)
        button.texture:SetPoint("CENTER", -3, 3)
        local border = button:CreateTexture(bname and (bname .. "Border") or nil, "OVERLAY")
        border:SetAllPoints()
        border:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
        border:SetTexCoord(0, 0.675, 0, 0.675)
        button:SetScript("OnEnter", LFDDungeonReadyDialogReward_OnEnter)
        button:SetScript("OnLeave", GameTooltip_Hide)
    end
end

function LFDDungeonReadyDialogReward_SetReward(button, dungeonID, rewardIndex)
    local name, texturePath, quantity = GetLFGDungeonRewardInfo(dungeonID, rewardIndex)
    ensureRewardButton(button)

    if texturePath then
        SetPortraitToTexture(button.texture, texturePath)
    end

    button.rewardID = rewardIndex
    button:Show()
end

function LFDDungeonReadyDialog_UpdateRewards(dungeonID)
    local doneToday, moneyBase, moneyVar, experienceBase, experienceVar, numRewards = GetLFGDungeonRewards(dungeonID)
    local numRandoms = 4 - GetNumPartyMembers()
    local moneyAmount = moneyBase + moneyVar * numRandoms
    local experienceGained = experienceBase + experienceVar * numRandoms

    -- Skip gold icon when there are item rewards to avoid overlap
    local rewardsOffset = 0
    if numRewards == 0 and (moneyAmount > 0 or experienceGained > 0) then
        LFDDungeonReadyDialogReward_SetMisc(LFDDungeonReadyDialogRewardsFrameReward1)
        rewardsOffset = 1
    end

    if moneyAmount == 0 and experienceGained == 0 and numRewards == 0 then
        LFDDungeonReadyDialogRewardsFrameLabel:Hide()
    else
        LFDDungeonReadyDialogRewardsFrameLabel:Show()
    end

    for i = 1, numRewards do
        local frameID = i + rewardsOffset
        local frame = _G["LFDDungeonReadyDialogRewardsFrameReward" .. frameID]
        if not frame then
            frame = CreateFrame("Frame", "LFDDungeonReadyDialogRewardsFrameReward" .. frameID, LFDDungeonReadyDialogRewardsFrame, "LFDDungeonReadyRewardTemplate")
            frame:SetID(frameID)
            LFD_MAX_REWARDS = frameID
        end
        LFDDungeonReadyDialogReward_SetReward(frame, dungeonID, i)
    end

    local usedButtons = numRewards + rewardsOffset
    for i = usedButtons + 1, LFD_MAX_REWARDS do
        _G["LFDDungeonReadyDialogRewardsFrameReward" .. i]:Hide()
    end

    if usedButtons > 0 then
        local iconWidth = LFDDungeonReadyDialogRewardsFrameReward1:GetWidth()
        local gap = 2
        local totalWidth = usedButtons * iconWidth + (usedButtons - 1) * gap
        local startX = (LFDDungeonReadyDialogRewardsFrame:GetWidth() - totalWidth) / 2 + iconWidth / 2

        LFDDungeonReadyDialogRewardsFrameReward1:SetPoint("CENTER", LFDDungeonReadyDialogRewardsFrame, "LEFT", startX, 5)
        for i = 2, usedButtons do
            _G["LFDDungeonReadyDialogRewardsFrameReward" .. i]:SetPoint("LEFT", "LFDDungeonReadyDialogRewardsFrameReward" .. (i - 1), "RIGHT", gap, 0)
        end
    end
end

-------------------------------------------------------------------------------
-- Fix 2: Handle UNKNOWN role from SoloLFG testing mode
-------------------------------------------------------------------------------
-- SoloLFG testing mode may send role=0 (PLAYER_ROLE_NONE) in the proposal
-- packet, which the client maps to "UNKNOWN". Stock GetTexCoordsForRole
-- errors on unrecognized roles.

local orig_GetTexCoordsForRole = GetTexCoordsForRole
function GetTexCoordsForRole(role)
    if role == "UNKNOWN" then
        role = "DAMAGER"
    end
    return orig_GetTexCoordsForRole(role)
end

-------------------------------------------------------------------------------
-- Fix 3: Loot method selection inside Dungeon Finder groups (F-204)
-------------------------------------------------------------------------------
-- Stock 3.3.5 locks the loot method for LFG groups in three separate places:
--   a) UnitPopup_ShowMenu clears UnitPopupButtons["LOOT_METHOD"].nested when
--      HasLFGRestrictions() is true, so the submenu arrow disappears.
--   b) UnitPopup_HideButtons hides LOOT_METHOD outright when inParty == 0,
--      which is always true when soloing RDF -- Group::BuildUpdate sends
--      GetMembersCount() - 1 members, so a 1-man group reports no party at all.
--   c) UnitPopup_OnUpdate disables the button when HasLFGRestrictions().
--
-- Those gates are shared with vote-kick, dungeon difficulty and instance reset
-- handling, so faking HasLFGRestrictions() would unlock far more than loot.
-- Instead we register a parallel set of menu entries under our own keys. Stock's
-- if/elseif chains fall through on unrecognised values, leaving
-- UnitPopupShown[level][index] at its default 1 and `enable` at 1, so ours are
-- never hidden or disabled. UnitPopup_OnClick has no LFG gate at all and
-- SetLootMethod() is not protected, so the click path itself needs nothing.
--
-- Server side: GroupHandler.cpp only accepts this for an LFG group when
-- Group.AllowLootMethodChangeInLFG = 1 (F-204 core patch), and answers with a
-- chat confirmation, since a solo group can never be told its own loot method.

local ZEP_LOOT_MODES = {
    { key = "ZEPLM_FREE_FOR_ALL",      method = "freeforall",      text = LOOT_FREE_FOR_ALL },
    { key = "ZEPLM_ROUND_ROBIN",       method = "roundrobin",      text = LOOT_ROUND_ROBIN },
    { key = "ZEPLM_MASTER_LOOTER",     method = "master",          text = LOOT_MASTER_LOOTER },
    { key = "ZEPLM_GROUP_LOOT",        method = "group",           text = LOOT_GROUP_LOOT },
    { key = "ZEPLM_NEED_BEFORE_GREED", method = "needbeforegreed", text = LOOT_NEED_BEFORE_GREED },
}

local ZEP_LOOT_ROOT = "ZEPLM_LOOT_METHOD"
local zepModeByKey = {}
local zepSelected = nil

-- `dist = 0` is mandatory: UnitPopup_OnUpdate reads UnitPopupButtons[value].dist
-- unconditionally and would error on a button without it.
UnitPopupButtons[ZEP_LOOT_ROOT] = { text = LOOT_METHOD, dist = 0, nested = 1 }

local zepSubMenu = {}
for _, mode in ipairs(ZEP_LOOT_MODES) do
    UnitPopupButtons[mode.key] = { text = mode.text, dist = 0 }
    zepModeByKey[mode.key] = mode
    table.insert(zepSubMenu, mode.key)
end
table.insert(zepSubMenu, "CANCEL")
UnitPopupMenus[ZEP_LOOT_ROOT] = zepSubMenu

-- Sit directly under the stock Loot Method entry in the self-portrait menu.
local function zepInsertRoot(menu)
    if not menu then
        return
    end
    for _, value in ipairs(menu) do
        if value == ZEP_LOOT_ROOT then
            return
        end
    end
    for index, value in ipairs(menu) do
        if value == "LOOT_METHOD" then
            table.insert(menu, index + 1, ZEP_LOOT_ROOT)
            return
        end
    end
    table.insert(menu, 1, ZEP_LOOT_ROOT)
end
zepInsertRoot(UnitPopupMenus["SELF"])

-- Only take over where the stock entry cannot work. Stock needs a visible party
-- AND leadership AND no LFG restrictions; the server only needs us to be the
-- group leader, which a solo LFG group's single member always is.
local function zepShouldOffer()
    local inInstance, instanceType = IsInInstance()
    if not inInstance or instanceType ~= "party" then
        return false
    end

    local partyMembers = GetNumPartyMembers()
    local raidMembers = GetNumRaidMembers()
    if partyMembers == 0 and raidMembers == 0 then
        -- Soloing a 5-man: the client sees no party, so there is no leader flag
        -- to test. Server-side we are the leader of our own 1-man LFG group.
        return true
    end

    if not IsPartyLeader() then
        return false
    end

    -- Grouped and leading: stock already handles a normal party correctly, so
    -- only step in when its own gate has locked us out.
    return HasLFGRestrictions() and true or false
end

hooksecurefunc("UnitPopup_HideButtons", function()
    local dropdownMenu = UIDROPDOWNMENU_INIT_MENU
    local level = UIDROPDOWNMENU_MENU_LEVEL
    local menu = UnitPopupMenus[UIDROPDOWNMENU_MENU_VALUE] or UnitPopupMenus[dropdownMenu.which]
    if not menu then
        return
    end

    local offer = zepShouldOffer()
    if not offer then
        -- Leaving RDF invalidates the remembered pick; the next group starts on
        -- whatever the server defaults to (stock Need Before Greed).
        zepSelected = nil
    end

    -- ShowMenu only rewrites UnitPopupButtons["LOOT_METHOD"].text after this
    -- hook returns, so our own label is safe to set here.
    -- GetLootMethod() is only trustworthy with a visible party: Group::BuildUpdate
    -- omits the loot method for a 1-man group, so solo we show what we last asked
    -- for and fall back to the generic label before the first pick.
    local label = LOOT_METHOD
    if zepSelected then
        label = zepSelected.text
    elseif GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 then
        local current = UnitLootMethod[GetLootMethod()]
        label = current and current.text or LOOT_METHOD
    end
    UnitPopupButtons[ZEP_LOOT_ROOT].text = label

    for index, value in ipairs(menu) do
        if value == ZEP_LOOT_ROOT then
            UnitPopupShown[level][index] = offer and 1 or 0
        elseif value == "LOOT_METHOD" and offer then
            -- Stock's entry survives HideButtons in a grouped LFG run but
            -- ShowMenu strips its .nested, leaving a dead duplicate label.
            UnitPopupShown[level][index] = 0
        end
    end
end)

hooksecurefunc("UnitPopup_OnClick", function(self)
    local mode = zepModeByKey[self.value]
    if not mode then
        return
    end

    if mode.method == "master" then
        SetLootMethod(mode.method, UnitName("player"))
    else
        SetLootMethod(mode.method)
    end

    zepSelected = mode
    UnitPopupButtons[ZEP_LOOT_ROOT].text = mode.text
    CloseDropDownMenus()
end)
