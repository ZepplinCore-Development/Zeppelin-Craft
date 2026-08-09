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

-- `method` is the SetLootMethod() token, `token` the .lootmethod command argument.
-- Both paths exist because the client API is unusable solo -- see zepApply below.
local ZEP_LOOT_MODES = {
    { key = "ZEPLM_FREE_FOR_ALL",      method = "freeforall",      token = "ffa",        text = LOOT_FREE_FOR_ALL },
    { key = "ZEPLM_ROUND_ROBIN",       method = "roundrobin",      token = "roundrobin", text = LOOT_ROUND_ROBIN },
    { key = "ZEPLM_MASTER_LOOTER",     method = "master",          token = "master",     text = LOOT_MASTER_LOOTER },
    { key = "ZEPLM_GROUP_LOOT",        method = "group",           token = "group",      text = LOOT_GROUP_LOOT },
    { key = "ZEPLM_NEED_BEFORE_GREED", method = "needbeforegreed", token = "nbg",        text = LOOT_NEED_BEFORE_GREED },
}

local ZEP_LOOT_ROOT = "ZEPLM_LOOT_METHOD"
local zepModeByKey = {}
local zepSelected = nil   -- what we asked for (optimistic, drives our own menu label)
local zepConfirmed = nil  -- what the server acknowledged with an 'o' reply

-- `dist = 0` is mandatory: UnitPopup_OnUpdate reads UnitPopupButtons[value].dist
-- unconditionally and would error on a button without it.
UnitPopupButtons[ZEP_LOOT_ROOT] = { text = LOOT_METHOD, dist = 0, nested = 1 }

-- `checkable` clears info.notCheckable in UnitPopup_ShowMenu, which is what makes
-- the button's own Check texture reachable at all: UIDropDownMenu_AddButton only
-- reaches Check:Show() inside `if not info.notCheckable` (UIDropDownMenu.lua:479,
-- 509). Without it the check slot is inert -- and under ElvUI it still renders an
-- empty box, which is why drawing our own marker produced two boxes per row.
local zepSubMenu = {}
for _, mode in ipairs(ZEP_LOOT_MODES) do
    UnitPopupButtons[mode.key] = { text = mode.text, dist = 0, checkable = 1 }
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
        zepConfirmed = nil
    end

    -- ShowMenu only rewrites UnitPopupButtons["LOOT_METHOD"].text after this
    -- hook returns, so our own label is safe to set here.
    -- GetLootMethod() is only trustworthy with a visible party: Group::BuildUpdate
    -- omits the loot method for a 1-man group, so solo we show what the server
    -- acknowledged, falling back to what we asked for while a reply is in flight
    -- and to the generic label before the first pick.
    local active = zepConfirmed or zepSelected
    if not active and (GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0) then
        local current = GetLootMethod()
        for _, mode in ipairs(ZEP_LOOT_MODES) do
            if mode.method == current then
                active = mode
            end
        end
    end
    UnitPopupButtons[ZEP_LOOT_ROOT].text = active and active.text or LOOT_METHOD

    -- Tick the live mode using the button's real check texture rather than a
    -- marker of our own.
    --
    -- UnitPopup_ShowMenu hard-sets info.checked = nil for everything that is not
    -- a RAID_TARGET_* value, so we cannot pass it through UnitPopupButtons. The
    -- one remaining hook is inside UIDropDownMenu_AddButton itself
    -- (UIDropDownMenu.lua:461-478), which re-checks a button when the dropdown's
    -- selection matches -- and that block runs after ShowMenu has cleared it.
    --
    -- Match on selectedValue, not selectedName: our root button's text is also the
    -- active mode's name, so a name match would tick the parent row as well.
    -- selectedName/selectedID are cleared because the lookup is an if/elseif chain
    -- and either would shadow selectedValue. UnitPopup never uses these fields.
    if offer then
        local frame = UIDROPDOWNMENU_OPEN_MENU or UIDROPDOWNMENU_INIT_MENU
        if frame then
            frame.selectedName = nil
            frame.selectedID = nil
            frame.selectedValue = active and active.key or nil
        end
    end

    for _, mode in ipairs(ZEP_LOOT_MODES) do
        UnitPopupButtons[mode.key].text = mode.text
    end

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

-- The client's own SetLootMethod() refuses with "You aren't in a party." whenever
-- it cannot see a party, and a solo LFG group never presents one -- the opcode is
-- dropped before it leaves the client. So solo we issue the server command over
-- AzerothCore's built-in addon command channel (AddonChannelCommandHandler,
-- Chat.cpp:991). WorldSession::HandleMessagechatOpcode routes LANG_ADDON traffic
-- there (ChatHandler.cpp:302) *before* any target or party validation, so it is
-- immune to the restriction that blocks the API. Nothing is ever spoken aloud.
--
-- Body after the prefix is <opcode><4-char counter><command>, no leading dot:
--   'i' issue command   -> server answers 'a' ack, then 'o' ok or 'f' failed,
--                          plus 'm' for each message line, echoing our counter.
local ZEP_ADDON_PREFIX = "AzerothCore"
local zepSeq = 0
local zepPending = {}

local function zepSendCommand(mode)
    zepSeq = zepSeq % 9999 + 1
    local counter = string.format("%04d", zepSeq)
    zepPending[counter] = mode
    -- WHISPER carries a target field the server reads but never validates before
    -- the addon-command hand-off. GUILD is deliberately avoided: Warden claims
    -- CHAT_MSG_GUILD + LANG_ADDON for its Lua check responses.
    SendAddonMessage(ZEP_ADDON_PREFIX, "i" .. counter .. "lootmethod " .. mode.token,
        "WHISPER", UnitName("player"))
end

local zepListener = CreateFrame("Frame")
zepListener:RegisterEvent("CHAT_MSG_ADDON")
zepListener:SetScript("OnEvent", function(_, _, prefix, message)
    if prefix ~= ZEP_ADDON_PREFIX or not message then
        return
    end

    local opcode = string.sub(message, 1, 1)
    local counter = string.sub(message, 2, 5)
    local mode = zepPending[counter]
    if not mode then
        return
    end

    if opcode == "m" then
        -- The server's own wording. It never reaches normal chat on this path,
        -- so surface it locally rather than leaving the player without feedback.
        DEFAULT_CHAT_FRAME:AddMessage("|cff4CFF00Zeppelin|r: " .. string.sub(message, 6))
    elseif opcode == "o" then
        zepPending[counter] = nil
        zepSelected = mode
        zepConfirmed = mode
    elseif opcode == "f" then
        -- Refused: stop claiming a mode we do not actually have.
        zepPending[counter] = nil
        zepSelected = nil
        zepConfirmed = nil
    end
end)

local function zepApply(mode)
    if GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 then
        if mode.method == "master" then
            SetLootMethod(mode.method, UnitName("player"))
        else
            SetLootMethod(mode.method)
        end
    else
        zepSendCommand(mode)
    end
end

hooksecurefunc("UnitPopup_OnClick", function(self)
    local mode = zepModeByKey[self.value]
    if not mode then
        return
    end

    zepApply(mode)
    zepSelected = mode
    zepConfirmed = nil  -- re-earned by the server's 'o' reply
    UnitPopupButtons[ZEP_LOOT_ROOT].text = mode.text
    CloseDropDownMenus()
end)

-- Overriding the global GetLootMethod() was tried here and removed: across all of
-- FrameXML and ElvUI its only consumers are the master-looter icon
-- (PlayerFrame.lua:79, PartyMemberFrame.lua:125, oUF masterlooterindicator), and
-- every one of them additionally requires a visible party, which a solo group
-- never has. Nothing in the client displays the loot method by name outside the
-- menu below, so the override changed nothing and only risked taint.
