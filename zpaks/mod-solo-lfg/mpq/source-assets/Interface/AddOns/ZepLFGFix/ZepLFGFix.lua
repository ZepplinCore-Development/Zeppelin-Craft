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
