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
    local active = zepSelected
    if not active and (GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0) then
        local current = GetLootMethod()
        for _, mode in ipairs(ZEP_LOOT_MODES) do
            if mode.method == current then
                active = mode
            end
        end
    end
    UnitPopupButtons[ZEP_LOOT_ROOT].text = active and active.text or LOOT_METHOD

    -- Mark the live mode inside our own submenu. Stock's checkmark is driven by
    -- GetLootMethod(), which is stale forever in a solo group, so colouring our
    -- entry is the only indicator that can be trusted here.
    for _, mode in ipairs(ZEP_LOOT_MODES) do
        UnitPopupButtons[mode.key].text =
            (mode == active) and ("|cff4CFF00" .. mode.text .. "|r") or mode.text
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

-------------------------------------------------------------------------------
-- Fix 4: report the real loot method to the rest of the UI (F-204)
-------------------------------------------------------------------------------
-- Every loot-method indicator in the client -- stock frames, our own menu, and
-- third-party addons like ElvUI -- reads GetLootMethod(). For a 1-member group
-- that value is permanently wrong: Group::BuildUpdate only writes the loot
-- method when GetMembersCount() - 1 is non-zero, so the server never gets a
-- chance to correct whatever the client happened to be holding (typically
-- "group" from the last real party). The result is an indicator welded to Group
-- Loot no matter what the group is actually using.
--
-- We cannot make the server send it, but GetLootMethod is a plain Lua global, so
-- we can answer for it in exactly the case the server cannot: no visible party,
-- and a mode the server has positively acknowledged. Everything else defers to
-- the real function, so grouped play and the master-looter indices are untouched.
local zep_orig_GetLootMethod = GetLootMethod

function GetLootMethod()
    local method, partyIndex, raidIndex = zep_orig_GetLootMethod()

    if zepConfirmed and GetNumPartyMembers() == 0 and GetNumRaidMembers() == 0 then
        -- partyIndex 0 is how the client marks "you are the master looter"
        -- (UnitPopup's LOOT_PROMOTE check for the SELF menu).
        if zepConfirmed.method == "master" then
            return zepConfirmed.method, 0, nil
        end
        return zepConfirmed.method, nil, nil
    end

    return method, partyIndex, raidIndex
end
