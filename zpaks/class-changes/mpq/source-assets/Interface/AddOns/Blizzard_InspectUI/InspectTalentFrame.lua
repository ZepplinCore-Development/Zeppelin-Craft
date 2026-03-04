-- InspectTalentFrame.lua
-- Stock 3.3.5a InspectTalentFrame with 4th talent tree support (I-147)
-- Changes from stock:
--   1. Dynamically creates InspectTalentFrameTab4 in OnLoad
--   2. Uses MAX_TALENT_TABS instead of hardcoded 3
--   3. Tab-width-squishing algorithm to fit 4 tabs

local talentTabWidthCache = {};

function InspectTalentFrame_OnLoad(self)
	self:RegisterEvent("INSPECT_TALENT_READY");

	self.inspect = true;
	self.pet = false;
	self.talentGroup = 1;
	self.updateFunction = InspectTalentFrame_Update;

	TalentFrame_Load(self);

	-- Create 4th tab dynamically (stock XML only defines 3)
	if ( not _G["InspectTalentFrameTab4"] ) then
		local tab4 = CreateFrame("Button", "InspectTalentFrameTab4", self, "CharacterFrameTabButtonTemplate");
		tab4:SetID(4);
		tab4:SetPoint("LEFT", _G["InspectTalentFrameTab3"], "RIGHT", -15, 0);
		tab4:SetFrameLevel(tab4:GetFrameLevel() + 2);
	end

	PanelTemplates_SetNumTabs(self, MAX_TALENT_TABS);
	PanelTemplates_SetTab(self, 1);

	-- Wire up tab scripts
	for i = 1, MAX_TALENT_TABS do
		local tab = _G["InspectTalentFrameTab"..i];
		if ( tab ) then
			tab:SetScript("OnClick", InspectTalentFrameTab_OnClick);
			tab:SetScript("OnEnter", InspectTalentFrameTab_OnEnter);
			tab:SetScript("OnLeave", function() GameTooltip:Hide(); end);
		end
	end
end

function InspectTalentFrame_OnEvent(self, event, ...)
	if ( event == "INSPECT_TALENT_READY" ) then
		InspectTalentFrame_Update();
	end
end

function InspectTalentFrame_Update()
	local talentFrame = InspectTalentFrame;
	if ( not talentFrame:IsShown() ) then
		return;
	end

	local selectedTab = PanelTemplates_GetSelectedTab(talentFrame);
	local numTabs = GetNumTalentTabs(talentFrame.inspect, talentFrame.pet);

	-- Update tabs
	local totalTabWidth = 0;
	local firstShownTab;
	for i = 1, MAX_TALENT_TABS do
		talentTabWidthCache[i] = 0;
		local tab = _G["InspectTalentFrameTab"..i];
		if ( tab ) then
			if ( i <= numTabs ) then
				local name, icon, pointsSpent, background, previewPointsSpent = GetTalentTabInfo(i, talentFrame.inspect, talentFrame.pet, talentFrame.talentGroup);
				if ( i == selectedTab ) then
					local displayPointsSpent = pointsSpent + previewPointsSpent;
					InspectTalentFrameSpentPointsText:SetFormattedText(MASTERY_POINTS_SPENT, name, HIGHLIGHT_FONT_COLOR_CODE..displayPointsSpent..FONT_COLOR_CODE_CLOSE);
					talentFrame.pointsSpent = pointsSpent;
					talentFrame.previewPointsSpent = previewPointsSpent;
				end
				tab:SetText(name);
				PanelTemplates_TabResize(tab, 0);
				tab.textWidth = tab:GetTextWidth();
				talentTabWidthCache[i] = PanelTemplates_GetTabWidth(tab);
				totalTabWidth = totalTabWidth + talentTabWidthCache[i];
				tab:Show();
				firstShownTab = firstShownTab or tab;
			else
				tab:Hide();
				tab.textWidth = 0;
			end
		end
	end

	-- Select the first shown tab if the current one is hidden
	local currentTab = _G["InspectTalentFrameTab"..selectedTab];
	if ( currentTab and not currentTab:IsShown() ) then
		if ( firstShownTab ) then
			InspectTalentFrameTab_OnClick(firstShownTab);
		end
		return;
	end

	-- Readjust tab sizes to fit within the frame width
	local maxTotalTabWidth = talentFrame:GetWidth();
	while ( totalTabWidth >= maxTotalTabWidth ) do
		local largestTab = 1;
		for i = 2, #talentTabWidthCache do
			if ( talentTabWidthCache[largestTab] < talentTabWidthCache[i] ) then
				largestTab = i;
			end
		end
		talentTabWidthCache[largestTab] = talentTabWidthCache[largestTab] - 10;
		local tab = _G["InspectTalentFrameTab"..largestTab];
		PanelTemplates_TabResize(tab, 0, talentTabWidthCache[largestTab]);
		totalTabWidth = totalTabWidth - 10;
	end

	PanelTemplates_SetNumTabs(talentFrame, numTabs);
	PanelTemplates_UpdateTabs(talentFrame);

	-- Update the talent tree display via shared TalentFrameBase code
	TalentFrame_Update(talentFrame);
end

function InspectTalentFrameTab_OnClick(self)
	local id = self:GetID();
	PanelTemplates_SetTab(InspectTalentFrame, id);
	InspectTalentFrame_Update();
	PlaySound("igCharacterInfoTab");
end

function InspectTalentFrameTab_OnEnter(self)
	if ( self.textWidth and self.textWidth > self:GetFontString():GetWidth() ) then
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOM");
		GameTooltip:SetText(self:GetText());
	end
end

-- Stock Blizzard_InspectUI.lua calls this from InspectFrame_UpdateTalentTab (line 127).
-- Our custom file merged tab logic into InspectTalentFrame_Update, so alias it.
InspectTalentFrame_UpdateTabs = InspectTalentFrame_Update;
