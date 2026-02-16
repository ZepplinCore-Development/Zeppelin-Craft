-- =============================================================================
-- SpellBookFrame.lua (Modified for Zeppelin Professions Tab - F-160)
-- Base: Stock WotLK 3.3.5a SpellBookFrame.lua
-- Changes: BOOKTYPE_PROFESSION, custom render pipeline, profession tab
-- =============================================================================

MAX_SPELLS = 1024;
MAX_SKILLLINE_TABS = 8;
SPELLS_PER_PAGE = 12;
MAX_SPELL_PAGES = ceil(MAX_SPELLS / SPELLS_PER_PAGE);
BOOKTYPE_SPELL = "spell";
BOOKTYPE_PET = "pet";
BOOKTYPE_PROFESSION = "professions";
SPELLBOOK_PAGENUMBERS = {};

local ceil = ceil;
local strlen = strlen;
local tinsert = tinsert;
local tremove = tremove;
local wipe = wipe;

-- =============================================================================
-- Profession spell IDs to move from General tab to Professions tab
-- Key = spellID, Value = true
-- =============================================================================
local spellbookCustomHiddenSpell = {
	-- Alchemy (ranks)
	[2259] = true, [3101] = true, [3464] = true, [11611] = true, [28596] = true, [51304] = true,
	-- Alchemy specializations
	[28672] = true, [28674] = true, -- Transmutation Master
	[28675] = true, [28676] = true, -- Potion Master
	[28677] = true, [28678] = true, -- Elixir Master

	-- Blacksmithing (ranks)
	[2018] = true, [3100] = true, [3538] = true, [9785] = true, [29844] = true, [51300] = true,
	-- Blacksmithing specializations
	[9787] = true, [9789] = true,   -- Weaponsmith
	[9788] = true, [9790] = true,   -- Armorsmith
	[17039] = true, [39097] = true, -- Master Swordsmith
	[17040] = true, [39099] = true, -- Master Hammersmith
	[17041] = true, [39098] = true, -- Master Axesmith

	-- Enchanting (ranks)
	[7411] = true, [7412] = true, [7413] = true, [13920] = true, [28029] = true, [51313] = true,
	-- Disenchant
	[13262] = true,

	-- Engineering (ranks)
	[4036] = true, [4037] = true, [4038] = true, [12656] = true, [30350] = true, [49383] = true, [51306] = true,
	-- Engineering specializations
	[20219] = true, [20220] = true, -- Gnomish Engineer
	[20221] = true, [20222] = true, -- Goblin Engineer

	-- Inscription (ranks)
	[45357] = true, [45358] = true, [45359] = true, [45360] = true, [45361] = true, [45363] = true,
	-- Milling
	[51005] = true,

	-- Jewelcrafting (ranks)
	[25229] = true, [25230] = true, [28894] = true, [28895] = true, [28897] = true, [51311] = true,
	-- Prospecting
	[31252] = true,

	-- Leatherworking (ranks)
	[2108] = true, [3104] = true, [3811] = true, [10662] = true, [32549] = true, [51302] = true,
	-- Leatherworking specializations
	[10656] = true, [10657] = true, -- Dragonscale
	[10658] = true, [10659] = true, -- Elemental
	[10660] = true, [10661] = true, -- Tribal

	-- Tailoring (ranks)
	[3908] = true, [3909] = true, [3910] = true, [12180] = true, [26790] = true, [51309] = true,
	-- Tailoring specializations
	[26796] = true, [26797] = true, -- Spellfire
	[26798] = true, [26799] = true, -- Mooncloth
	[26800] = true, [26801] = true, -- Shadoweave

	-- Herbalism
	[9134] = true, [13614] = true,
	-- Find Herbs
	[2383] = true, [8387] = true,
	-- Lifeblood (Herbalism active)
	[55428] = true, [55480] = true, [55500] = true, [55501] = true, [55502] = true, [55503] = true,

	-- Mining (ranks)
	[2575] = true, [2576] = true, [3564] = true, [10248] = true, [29354] = true, [50310] = true,
	-- Smelting
	[2656] = true, [61422] = true,
	-- Find Minerals
	[2580] = true, [8388] = true,
	-- Toughness (Mining passive)
	[53040] = true, [53120] = true, [53121] = true, [53122] = true, [53123] = true, [53124] = true,

	-- Skinning (ranks)
	[8613] = true, [8617] = true, [8618] = true, [10768] = true, [32678] = true, [50305] = true,
	-- Master of Anatomy (Skinning passive)
	[53125] = true, [53662] = true, [53663] = true, [53664] = true, [53665] = true, [53666] = true,

	-- Cooking (ranks)
	[2550] = true, [3102] = true, [3413] = true, [18260] = true, [33359] = true, [43744] = true, [51296] = true,

	-- First Aid (profession ranks only)
	[3273] = true, [3274] = true, [7924] = true, [10846] = true, [27028] = true, [45542] = true,

	-- Fishing (ranks)
	[7620] = true, [7731] = true, [7732] = true, [18248] = true, [33095] = true, [51294] = true,
	-- Find Fish
	[43308] = true,
};

-- Custom render data (rebuilt by SpellBookFrame_UpdateSpellRender)
local spellbookCustomRender = {};      -- [tabIndex] = array of {spellID, slot}
local spellbookProfessionRender = {};  -- flat array of {spellID, slot}

-- =============================================================================
-- Helper functions
-- =============================================================================

local function ExtractSpellID(link)
	if ( not link ) then return nil; end
	return tonumber(link:match("Hspell:(%d+)"));
end

local function IsSpellHiddenProfession(spellID)
	return spellbookCustomHiddenSpell[spellID];
end

-- Build/rebuild the custom render arrays from current spellbook data
function SpellBookFrame_UpdateSpellRender()
	wipe(spellbookProfessionRender);

	local showAllRanks = GetCVarBool("ShowAllSpellRanks");
	local numTabs = GetNumSpellTabs();

	for tab = 1, numTabs do
		if ( not spellbookCustomRender[tab] ) then
			spellbookCustomRender[tab] = {};
		else
			wipe(spellbookCustomRender[tab]);
		end

		local name, texture, offset, numSpells, hrOffset, hrNumSpells = GetSpellTabInfo(tab);

		if ( showAllRanks or not hrOffset or hrNumSpells == 0 ) then
			-- Show all ranks: iterate the regular range directly
			for i = 1, numSpells do
				local slot = offset + i;
				local link = GetSpellLink(slot, "spell");
				local spellID = ExtractSpellID(link);

				if ( spellID and IsSpellHiddenProfession(spellID) ) then
					tinsert(spellbookProfessionRender, {spellID = spellID, slot = slot});
				else
					tinsert(spellbookCustomRender[tab], {spellID = spellID, slot = slot});
				end
			end
		else
			-- Highest rank only: iterate hr range but resolve to regular slots
			for i = 1, hrNumSpells do
				local hrSlot = hrOffset + i;
				local knownSlot = GetKnownSlotFromHighestRankSlot(hrSlot);

				if ( not knownSlot ) then
					-- GetKnownSlotFromHighestRankSlot returned nil — find the
					-- matching spell in the regular range by spell ID
					local hrLink = GetSpellLink(hrSlot, "spell");
					local hrID = ExtractSpellID(hrLink);
					if ( hrID ) then
						for j = numSpells, 1, -1 do
							local regSlot = offset + j;
							local regLink = GetSpellLink(regSlot, "spell");
							local regID = ExtractSpellID(regLink);
							if ( regID == hrID ) then
								knownSlot = regSlot;
								break;
							end
						end
					end
				end

				local slot = knownSlot or (hrOffset + i);
				local link = GetSpellLink(slot, "spell");
				local spellID = ExtractSpellID(link);

				if ( spellID and IsSpellHiddenProfession(spellID) ) then
					tinsert(spellbookProfessionRender, {spellID = spellID, slot = slot});
				else
					tinsert(spellbookCustomRender[tab], {spellID = spellID, slot = slot});
				end
			end
		end
	end
end

-- Update all 12 spell buttons from current render data
function SpellButton_UpdateButton_All()
	for i = 1, SPELLS_PER_PAGE do
		local btn = _G["SpellButton"..i];
		if ( btn and btn:IsShown() ) then
			SpellButton_UpdateButton(btn);
		end
	end
end

-- =============================================================================
-- Custom render path for SpellButton_UpdateButton (SPELL + PROFESSION modes)
-- =============================================================================
local function SpellButton_UpdateButton_Custom(self)
	if ( not SpellBookFrame.selectedSkillLine ) then
		SpellBookFrame.selectedSkillLine = 1;
	end

	local buttonID = self:GetID();
	local page, renderData;

	if ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		page = SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] or 1;
		renderData = spellbookProfessionRender;
	else
		page = SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] or 1;
		renderData = spellbookCustomRender[SpellBookFrame.selectedSkillLine];
	end

	local index = buttonID + SPELLS_PER_PAGE * (page - 1);
	local data = renderData and renderData[index];
	self.customData = data;

	local name = self:GetName();
	local iconTexture = _G[name.."IconTexture"];
	local spellString = _G[name.."SpellName"];
	local subSpellString = _G[name.."SubSpellName"];
	local cooldown = _G[name.."Cooldown"];
	local autoCastableTexture = _G[name.."AutoCastable"];
	local highlightTexture = _G[name.."Highlight"];
	local normalTexture = _G[name.."NormalTexture"];

	-- Empty slot
	if ( not data or not data.slot ) then
		self:Disable();
		iconTexture:Hide();
		spellString:Hide();
		subSpellString:Hide();
		cooldown:Hide();
		autoCastableTexture:Hide();
		SpellBook_ReleaseAutoCastShine(self.shine);
		self.shine = nil;
		self:SetChecked(0);
		normalTexture:SetVertexColor(1.0, 1.0, 1.0);
		return;
	end

	self:Enable();

	local texture = GetSpellTexture(data.slot, "spell");
	-- If no texture, hide everything
	if ( not texture or (strlen(texture) == 0) ) then
		iconTexture:Hide();
		spellString:Hide();
		subSpellString:Hide();
		cooldown:Hide();
		autoCastableTexture:Hide();
		SpellBook_ReleaseAutoCastShine(self.shine);
		self.shine = nil;
		highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
		self:SetChecked(0);
		normalTexture:SetVertexColor(1.0, 1.0, 1.0);
		return;
	end

	-- Cooldown
	local start, duration, enable = GetSpellCooldown(data.slot, "spell");
	CooldownFrame_SetTimer(cooldown, start, duration, enable);
	if ( enable == 1 ) then
		iconTexture:SetVertexColor(1.0, 1.0, 1.0);
	else
		iconTexture:SetVertexColor(0.4, 0.4, 0.4);
	end

	-- No autocast for non-pet spells
	autoCastableTexture:Hide();
	SpellBook_ReleaseAutoCastShine(self.shine);
	self.shine = nil;

	-- Spell name and passive display
	local spellName, subSpellName = GetSpellName(data.slot, "spell");
	local isPassive = IsPassiveSpell(data.slot, "spell");
	if ( isPassive ) then
		normalTexture:SetVertexColor(0, 0, 0);
		highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
		spellString:SetTextColor(PASSIVE_SPELL_FONT_COLOR.r, PASSIVE_SPELL_FONT_COLOR.g, PASSIVE_SPELL_FONT_COLOR.b);
	else
		normalTexture:SetVertexColor(1.0, 1.0, 1.0);
		highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
		spellString:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
	end

	iconTexture:SetTexture(texture);
	spellString:SetText(spellName);
	subSpellString:SetText(subSpellName);
	if ( subSpellName and subSpellName ~= "" ) then
		spellString:SetPoint("LEFT", self, "RIGHT", 4, 4);
	else
		spellString:SetPoint("LEFT", self, "RIGHT", 4, 2);
	end

	iconTexture:Show();
	spellString:Show();
	subSpellString:Show();
	SpellButton_UpdateSelection(self);
end

-- =============================================================================
-- Main functions
-- =============================================================================

function ToggleSpellBook(bookType)
	if ( not HasPetSpells() and bookType == BOOKTYPE_PET ) then
		return;
	end

	local isShown = SpellBookFrame:IsShown();
	if ( isShown and (SpellBookFrame.bookType ~= bookType) ) then
		SpellBookFrame.suppressCloseSound = true;
	end

	HideUIPanel(SpellBookFrame);
	if ( (not isShown or (SpellBookFrame.bookType ~= bookType)) ) then
		SpellBookFrame.bookType = bookType;
		ShowUIPanel(SpellBookFrame);
	end
	SpellBookFrame_UpdatePages();

	SpellBookFrame.suppressCloseSound = nil;
end

function SpellBookFrame_OnLoad(self)
	self:RegisterEvent("SPELLS_CHANGED");
	self:RegisterEvent("LEARNED_SPELL_IN_TAB");
	self:RegisterEvent("SKILL_LINES_CHANGED");

	SpellBookFrame.bookType = BOOKTYPE_SPELL;
	-- Init page nums
	SPELLBOOK_PAGENUMBERS[1] = 1;
	SPELLBOOK_PAGENUMBERS[2] = 1;
	SPELLBOOK_PAGENUMBERS[3] = 1;
	SPELLBOOK_PAGENUMBERS[4] = 1;
	SPELLBOOK_PAGENUMBERS[5] = 1;
	SPELLBOOK_PAGENUMBERS[6] = 1;
	SPELLBOOK_PAGENUMBERS[7] = 1;
	SPELLBOOK_PAGENUMBERS[8] = 1;
	SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] = 1;
	SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] = 1;

	-- Build initial render data
	SpellBookFrame_UpdateSpellRender();

	-- Set to the first tab by default
	SpellBookSkillLineTab_OnClick(nil, 1);

	-- Initialize tab flashing
	SpellBookFrame.flashTabs = nil;
end

function SpellBookFrame_OnEvent(self, event, ...)
	if ( event == "SPELLS_CHANGED" or event == "SKILL_LINES_CHANGED" ) then
		if ( SpellBookFrame:IsVisible() ) then
			SpellBookFrame_UpdateSpellRender();
			SpellBookFrame_Update();
		end
	elseif ( event == "LEARNED_SPELL_IN_TAB" ) then
		local arg1 = ...;
		local flashFrame = _G["SpellBookSkillLineTab"..arg1.."Flash"];
		if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
			return;
		else
			if ( flashFrame ) then
				flashFrame:Show();
				SpellBookFrame.flashTabs = 1;
			end
		end
	end
end

function SpellBookFrame_OnShow(self)
	SpellBookFrame_UpdateSpellRender();
	SpellBookFrame_Update(1);

	-- If there are tabs waiting to flash, then flash them
	if ( self.flashTabs ) then
		UIFrameFlash(SpellBookTabFlashFrame, 0.5, 0.5, 30, nil);
	end

	-- Show multibar slots
	MultiActionBar_ShowAllGrids();
	UpdateMicroButtons();

	SpellBookFrame_PlayOpenSound();
end

function SpellBookFrame_Update(showing)
	-- Hide all tabs
	SpellBookFrameTabButton1:Hide();
	SpellBookFrameTabButton2:Hide();
	SpellBookFrameTabButton3:Hide();
	SpellBookFrameTabButton4:Hide();

	-- Setup skillline tabs
	if ( showing ) then
		SpellBookSkillLineTab_OnClick(nil, SpellBookFrame.selectedSkillLine);
		UpdateSpells();
	end

	local numSkillLineTabs = GetNumSpellTabs();
	local name, texture, offset, numSpells;
	local skillLineTab;
	for i=1, MAX_SKILLLINE_TABS do
		skillLineTab = _G["SpellBookSkillLineTab"..i];
		if ( i <= numSkillLineTabs and SpellBookFrame.bookType == BOOKTYPE_SPELL ) then
			name, texture = GetSpellTabInfo(i);
			skillLineTab:SetNormalTexture(texture);
			skillLineTab.tooltip = name;
			skillLineTab:Show();

			-- Set the selected tab
			if ( SpellBookFrame.selectedSkillLine == i ) then
				skillLineTab:SetChecked(1);
			else
				skillLineTab:SetChecked(nil);
			end
		else
			_G["SpellBookSkillLineTab"..i.."Flash"]:Hide();
			skillLineTab:Hide();
		end
	end

	-- Setup bottom tabs: Tab1=Spell, Tab2=Profession, Tab3=Pet(if available)
	local hasPetSpells, petToken = HasPetSpells();
	SpellBookFrame.petTitle = nil;

	SpellBookFrame_SetTabType(SpellBookFrameTabButton1, BOOKTYPE_SPELL);
	SpellBookFrame_SetTabType(SpellBookFrameTabButton2, BOOKTYPE_PROFESSION);

	if ( hasPetSpells ) then
		SpellBookFrame_SetTabType(SpellBookFrameTabButton3, BOOKTYPE_PET, petToken);
	else
		if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
			-- No pet spells but trying to show pet book - close
			HideUIPanel(SpellBookFrame);
			SpellBookFrame.bookType = BOOKTYPE_SPELL;
		end
	end

	if ( SpellBookFrame.bookType == BOOKTYPE_SPELL ) then
		SpellBookTitleText:SetText(SPELLBOOK);
		SpellBookFrame_ShowSpells();
		SpellBookFrame_UpdatePages();
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		SpellBookTitleText:SetText(TRADE_SKILLS);
		SpellBookFrame_ShowSpells();
		SpellBookFrame_UpdatePages();
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		SpellBookTitleText:SetText(SpellBookFrame.petTitle);
		SpellBookFrame_ShowSpells();
		SpellBookFrame_UpdatePages();
	end
end

function SpellBookFrame_HideSpells ()
	for i = 1, SPELLS_PER_PAGE do
		_G["SpellButton" .. i]:Hide();
	end

	for i = 1, MAX_SKILLLINE_TABS do
		_G["SpellBookSkillLineTab" .. i]:Hide();
	end

	SpellBookPrevPageButton:Hide();
	SpellBookNextPageButton:Hide();
	SpellBookPageText:Hide();
end

function SpellBookFrame_ShowSpells ()
	for i = 1, SPELLS_PER_PAGE do
		_G["SpellButton" .. i]:Show();
	end

	SpellBookPrevPageButton:Show();
	SpellBookNextPageButton:Show();
	SpellBookPageText:Show();
end

function SpellBookFrame_UpdatePages()
	local currentPage, maxPages = SpellBook_GetCurrentPage();
	if ( maxPages == 0 ) then
		SpellBookPrevPageButton:Disable();
		SpellBookNextPageButton:Disable();
		SpellBookPageText:SetFormattedText(PAGE_NUMBER, 1);
		-- Show spell rank checkbox only on spell tab
		local _, class = UnitClass("player");
		local showSpellRanks = true;
		if ( class == "ROGUE" or class == "WARRIOR" ) then
			showSpellRanks = false;
		end
		if ( SpellBookFrame.bookType == BOOKTYPE_SPELL and showSpellRanks ) then
			ShowAllSpellRanksCheckBox:Show();
		else
			ShowAllSpellRanksCheckBox:Hide();
		end
		return;
	end
	if ( currentPage > maxPages ) then
		if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
			SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] = maxPages;
		elseif ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
			SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] = maxPages;
		else
			SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] = maxPages;
		end
		currentPage = maxPages;
		if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
			UpdateSpells();
		else
			SpellButton_UpdateButton_All();
		end
		if ( currentPage == 1 ) then
			SpellBookPrevPageButton:Disable();
		else
			SpellBookPrevPageButton:Enable();
		end
		if ( currentPage == maxPages ) then
			SpellBookNextPageButton:Disable();
		else
			SpellBookNextPageButton:Enable();
		end
	end
	if ( currentPage == 1 ) then
		SpellBookPrevPageButton:Disable();
	else
		SpellBookPrevPageButton:Enable();
	end
	if ( currentPage == maxPages ) then
		SpellBookNextPageButton:Disable();
	else
		SpellBookNextPageButton:Enable();
	end
	SpellBookPageText:SetFormattedText(PAGE_NUMBER, currentPage);
	-- Show spell rank checkbox only on spell tab (not profession or pet)
	local _, class = UnitClass("player");
	local showSpellRanks = true;
	if ( class == "ROGUE" or class == "WARRIOR" ) then
		showSpellRanks = false;
	end
	if ( SpellBookFrame.bookType == BOOKTYPE_SPELL and showSpellRanks ) then
		ShowAllSpellRanksCheckBox:Show();
	else
		ShowAllSpellRanksCheckBox:Hide();
	end
end

function SpellBookFrame_SetTabType(tabButton, bookType, token)
	if ( bookType == BOOKTYPE_SPELL ) then
		tabButton.bookType = BOOKTYPE_SPELL;
		tabButton:SetText(SPELLBOOK);
		tabButton:SetFrameLevel(SpellBookFrame:GetFrameLevel() + 1);
		tabButton.binding = "TOGGLESPELLBOOK";
	elseif ( bookType == BOOKTYPE_PET ) then
		tabButton.bookType = BOOKTYPE_PET;
		tabButton:SetText(_G["PET_TYPE_"..token]);
		tabButton:SetFrameLevel(SpellBookFrame:GetFrameLevel() + 1);
		tabButton.binding = "TOGGLEPETBOOK";
		SpellBookFrame.petTitle = _G["PET_TYPE_"..token];
	elseif ( bookType == BOOKTYPE_PROFESSION ) then
		tabButton.bookType = BOOKTYPE_PROFESSION;
		tabButton:SetText(TRADE_SKILLS);
		tabButton:SetFrameLevel(SpellBookFrame:GetFrameLevel() + 1);
		tabButton.binding = "TOGGLEPROFESSIONS";
	else
		tabButton.bookType = INSCRIPTION;
		tabButton:SetText(GLYPHS);
		tabButton:SetFrameLevel(SpellBookFrame:GetFrameLevel() + 2);
		tabButton.binding = "TOGGLEINSCRIPTION";
	end
	if ( SpellBookFrame.bookType == bookType ) then
		tabButton:Disable();
	else
		tabButton:Enable();
	end
	tabButton:Show();
end

function SpellBookFrame_PlayOpenSound()
	if ( SpellBookFrame.bookType == BOOKTYPE_SPELL or SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		PlaySound("igSpellBookOpen");
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		PlaySound("igAbilityOpen");
	else
		PlaySound("igSpellBookOpen");
	end
end

function SpellBookFrame_PlayCloseSound()
	if ( not SpellBookFrame.suppressCloseSound ) then
		if ( SpellBookFrame.bookType == BOOKTYPE_SPELL or SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
			PlaySound("igSpellBookClose");
		else
			PlaySound("igAbilityClose");
		end
	end
end

function SpellBookFrame_OnHide(self)
	SpellBookFrame_PlayCloseSound();

	-- Stop the flash frame from flashing
	UIFrameFlashRemoveFrame(SpellBookTabFlashFrame);
	-- Hide all the flashing textures
	for i=1, MAX_SKILLLINE_TABS do
		_G["SpellBookSkillLineTab"..i.."Flash"]:Hide();
	end

	-- Hide multibar slots
	MultiActionBar_HideAllGrids();

	-- Do this last, it can cause taint.
	UpdateMicroButtons();
end

function SpellButton_OnLoad(self)
	self:RegisterForDrag("LeftButton");
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

function SpellButton_OnEvent(self, event, ...)
	if ( event == "SPELLS_CHANGED" or event == "SPELL_UPDATE_COOLDOWN" or event == "UPDATE_SHAPESHIFT_FORM" ) then
		SpellButton_UpdateButton(self);
	elseif ( event == "CURRENT_SPELL_CAST_CHANGED" ) then
		SpellButton_UpdateSelection(self);
	elseif ( event == "TRADE_SKILL_SHOW" or event == "TRADE_SKILL_CLOSE" ) then
		SpellButton_UpdateSelection(self);
	elseif ( event == "PET_BAR_UPDATE" ) then
		if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
			SpellButton_UpdateButton(self);
		end
	end
end

function SpellButton_OnShow(self)
	self:RegisterEvent("SPELLS_CHANGED");
	self:RegisterEvent("SPELL_UPDATE_COOLDOWN");
	self:RegisterEvent("UPDATE_SHAPESHIFT_FORM");
	self:RegisterEvent("CURRENT_SPELL_CAST_CHANGED");
	self:RegisterEvent("TRADE_SKILL_SHOW");
	self:RegisterEvent("TRADE_SKILL_CLOSE");
	self:RegisterEvent("PET_BAR_UPDATE");

	SpellButton_UpdateButton(self);
end

function SpellButton_OnHide(self)
	self:UnregisterEvent("SPELLS_CHANGED");
	self:UnregisterEvent("SPELL_UPDATE_COOLDOWN");
	self:UnregisterEvent("UPDATE_SHAPESHIFT_FORM");
	self:UnregisterEvent("CURRENT_SPELL_CAST_CHANGED");
	self:UnregisterEvent("TRADE_SKILL_SHOW");
	self:UnregisterEvent("TRADE_SKILL_CLOSE");
	self:UnregisterEvent("PET_BAR_UPDATE");
end

function SpellButton_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	if ( self.customData and self.customData.spellID ) then
		-- Custom render: use spell link for tooltip
		local link = GetSpellLink(self.customData.spellID);
		if ( link ) then
			GameTooltip:SetHyperlink(link);
		end
		self.UpdateTooltip = SpellButton_OnEnter;
	else
		-- Stock behavior (pet mode)
		local id = SpellBook_GetSpellID(self:GetID());
		if ( GameTooltip:SetSpell(id, SpellBookFrame.bookType) ) then
			self.UpdateTooltip = SpellButton_OnEnter;
		else
			self.UpdateTooltip = nil;
		end
	end
end

function SpellButton_OnClick(self, button)
	if ( self.customData and self.customData.slot ) then
		-- Custom render: cast via spellbook slot (trusted FrameXML context)
		CastSpell(self.customData.slot, BOOKTYPE_SPELL);
		SpellButton_UpdateSelection(self);
		return;
	end
	-- Stock behavior (pet mode)
	local id = SpellBook_GetSpellID(self:GetID());
	if ( id > MAX_SPELLS ) then
		return;
	end
	if ( button ~= "LeftButton" and SpellBookFrame.bookType == BOOKTYPE_PET ) then
		ToggleSpellAutocast(id, SpellBookFrame.bookType);
	else
		CastSpell(id, SpellBookFrame.bookType);
		SpellButton_UpdateSelection(self);
	end
end

function SpellButton_OnModifiedClick(self, button)
	if ( self.customData and self.customData.spellID ) then
		-- Custom render path
		if ( IsModifiedClick("CHATLINK") ) then
			if ( MacroFrame and MacroFrame:IsShown() ) then
				local spellName = GetSpellInfo(self.customData.spellID);
				if ( spellName and not IsPassiveSpell(self.customData.slot, "spell") ) then
					ChatEdit_InsertLink(spellName);
				end
			else
				local spellLink = GetSpellLink(self.customData.spellID);
				if ( spellLink ) then
					ChatEdit_InsertLink(spellLink);
				end
			end
			return;
		end
		if ( IsModifiedClick("PICKUPACTION") ) then
			if ( self.customData.slot ) then
				PickupSpell(self.customData.slot, "spell");
			end
			return;
		end
		return;
	end
	-- Stock behavior (pet mode)
	local id = SpellBook_GetSpellID(self:GetID());
	if ( id > MAX_SPELLS ) then
		return;
	end
	if ( IsModifiedClick("CHATLINK") ) then
		if ( MacroFrame and MacroFrame:IsShown() ) then
			local spellName, subSpellName = GetSpellName(id, SpellBookFrame.bookType);
			if ( spellName and not IsPassiveSpell(id, SpellBookFrame.bookType) ) then
				if ( subSpellName and (strlen(subSpellName) > 0) ) then
					ChatEdit_InsertLink(spellName.."("..subSpellName..")");
				else
					ChatEdit_InsertLink(spellName);
				end
			end
			return;
		else
			local spellLink, tradeSkillLink = GetSpellLink(id, SpellBookFrame.bookType);
			if ( tradeSkillLink ) then
				ChatEdit_InsertLink(tradeSkillLink);
			elseif ( spellLink ) then
				ChatEdit_InsertLink(spellLink);
			end
			return;
		end
	end
	if ( IsModifiedClick("PICKUPACTION") ) then
		PickupSpell(id, SpellBookFrame.bookType);
		return;
	end
end

function SpellButton_OnDrag(self)
	if ( self.customData and self.customData.slot ) then
		-- Custom render: drag from original slot
		local name = self:GetName();
		if ( not _G[name.."IconTexture"]:IsShown() ) then
			return;
		end
		self:SetChecked(0);
		PickupSpell(self.customData.slot, "spell");
		return;
	end
	-- Stock behavior (pet mode)
	local id = SpellBook_GetSpellID(self:GetID());
	if ( id > MAX_SPELLS or not _G[self:GetName().."IconTexture"]:IsShown() ) then
		return;
	end
	self:SetChecked(0);
	PickupSpell(id, SpellBookFrame.bookType);
end

function SpellButton_UpdateSelection(self)
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		-- Stock pet behavior
		local temp, texture, offset, numSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
		local id, displayID = SpellBook_GetSpellID(self:GetID());
		if ( not displayID or displayID > (offset + numSpells) ) then
			self:SetChecked("false");
			return;
		end
		if ( IsSelectedSpell(id, SpellBookFrame.bookType) ) then
			self:SetChecked("true");
		else
			self:SetChecked("false");
		end
	elseif ( self.customData and self.customData.slot ) then
		-- Custom render: check selection by slot
		if ( IsSelectedSpell(self.customData.slot, "spell") ) then
			self:SetChecked("true");
		else
			self:SetChecked("false");
		end
	else
		self:SetChecked("false");
	end
end

function SpellButton_UpdateButton(self)
	-- Pet mode: stock behavior unchanged
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		self.customData = nil;

		if ( not SpellBookFrame.selectedSkillLine ) then
			SpellBookFrame.selectedSkillLine = 1;
		end
		local temp, texture, offset, numSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
		SpellBookFrame.selectedSkillLineOffset = offset;

		local id, displayID = SpellBook_GetSpellID(self:GetID());
		local name = self:GetName();
		local iconTexture = _G[name.."IconTexture"];
		local spellString = _G[name.."SpellName"];
		local subSpellString = _G[name.."SubSpellName"];
		local cooldown = _G[name.."Cooldown"];
		local autoCastableTexture = _G[name.."AutoCastable"];

		-- Pet doesn't do the boundary check the same way
		local texture = GetSpellTexture(id, SpellBookFrame.bookType);
		local highlightTexture = _G[name.."Highlight"];
		local normalTexture = _G[name.."NormalTexture"];
		-- If no spell, hide everything and return
		if ( not texture or (strlen(texture) == 0) ) then
			iconTexture:Hide();
			spellString:Hide();
			subSpellString:Hide();
			cooldown:Hide();
			autoCastableTexture:Hide();
			SpellBook_ReleaseAutoCastShine(self.shine);
			self.shine = nil;
			highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
			self:SetChecked(0);
			normalTexture:SetVertexColor(1.0, 1.0, 1.0);
			return;
		end

		self:Enable();

		local start, duration, enable = GetSpellCooldown(id, SpellBookFrame.bookType);
		CooldownFrame_SetTimer(cooldown, start, duration, enable);
		if ( enable == 1 ) then
			iconTexture:SetVertexColor(1.0, 1.0, 1.0);
		else
			iconTexture:SetVertexColor(0.4, 0.4, 0.4);
		end

		local autoCastAllowed, autoCastEnabled = GetSpellAutocast(id, SpellBookFrame.bookType);
		if ( autoCastAllowed ) then
			autoCastableTexture:Show();
		else
			autoCastableTexture:Hide();
		end
		if ( autoCastEnabled and not self.shine ) then
			self.shine = SpellBook_GetAutoCastShine();
			self.shine:Show();
			self.shine:SetParent(self);
			self.shine:SetPoint("CENTER", self, "CENTER");
			AutoCastShine_AutoCastStart(self.shine);
		elseif ( autoCastEnabled ) then
			self.shine:Show();
			self.shine:SetParent(self);
			self.shine:SetPoint("CENTER", self, "CENTER");
			AutoCastShine_AutoCastStart(self.shine);
		elseif ( not autoCastEnabled ) then
			SpellBook_ReleaseAutoCastShine(self.shine);
			self.shine = nil;
		end

		local spellName, subSpellName = GetSpellName(id, SpellBookFrame.bookType);
		local isPassive = IsPassiveSpell(id, SpellBookFrame.bookType);
		if ( isPassive ) then
			normalTexture:SetVertexColor(0, 0, 0);
			highlightTexture:SetTexture("Interface\\Buttons\\UI-PassiveHighlight");
			spellString:SetTextColor(PASSIVE_SPELL_FONT_COLOR.r, PASSIVE_SPELL_FONT_COLOR.g, PASSIVE_SPELL_FONT_COLOR.b);
		else
			normalTexture:SetVertexColor(1.0, 1.0, 1.0);
			highlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Square");
			spellString:SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b);
		end
		iconTexture:SetTexture(texture);
		spellString:SetText(spellName);
		subSpellString:SetText(subSpellName);
		if ( subSpellName ~= "" ) then
			spellString:SetPoint("LEFT", self, "RIGHT", 4, 4);
		else
			spellString:SetPoint("LEFT", self, "RIGHT", 4, 2);
		end

		iconTexture:Show();
		spellString:Show();
		subSpellString:Show();
		SpellButton_UpdateSelection(self);
		return;
	end

	-- Spell / Profession mode: use custom render pipeline
	SpellButton_UpdateButton_Custom(self);
end

function SpellBookPrevPageButton_OnClick()
	local pageNum = SpellBook_GetCurrentPage() - 1;
	if ( SpellBookFrame.bookType == BOOKTYPE_SPELL ) then
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] = pageNum;
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] = pageNum;
	else
		SpellBookTitleText:SetText(SpellBookFrame.petTitle);
		-- Need to change to pet book pageturn sound
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] = pageNum;
	end
	SpellBook_UpdatePageArrows();
	SpellBookPageText:SetFormattedText(PAGE_NUMBER, pageNum);
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		UpdateSpells();
	else
		SpellButton_UpdateButton_All();
	end
end

function SpellBookNextPageButton_OnClick()
	local pageNum = SpellBook_GetCurrentPage() + 1;
	if ( SpellBookFrame.bookType == BOOKTYPE_SPELL ) then
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] = pageNum;
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] = pageNum;
	else
		SpellBookTitleText:SetText(SpellBookFrame.petTitle);
		-- Need to change to pet book pageturn sound
		PlaySound("igAbiliityPageTurn");
		SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] = pageNum;
	end
	SpellBook_UpdatePageArrows();
	SpellBookPageText:SetFormattedText(PAGE_NUMBER, pageNum);
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		UpdateSpells();
	else
		SpellButton_UpdateButton_All();
	end
end

function SpellBookSkillLineTab_OnClick(self, id)
	local update;
	if ( not id ) then
		update = 1;
		id = self:GetID();
	end
	if ( SpellBookFrame.selectedSkillLine ~= id ) then
		PlaySound("igAbiliityPageTurn");
	end
	SpellBookFrame.selectedSkillLine = id;
	local name, texture, offset, numSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
	SpellBookFrame.selectedSkillLineOffset = offset;
	SpellBookFrame.selectedSkillLineNumSpells = numSpells;
	SpellBook_UpdatePageArrows();
	SpellBookFrame_Update();
	SpellBookPageText:SetFormattedText(PAGE_NUMBER, SpellBook_GetCurrentPage());
	if ( update ) then
		UpdateSpells();
	end
	-- Stop tab flashing
	if ( self ) then
		local tabFlash = _G[self:GetName().."Flash"];
		if ( tabFlash ) then
			tabFlash:Hide();
		end
	end
end

function SpellBookFrameTabButton_OnClick(self)
	-- suppress the hiding sound so we don't play a hide and show sound simultaneously
	SpellBookFrame.suppressCloseSound = true;
	ToggleSpellBook(self.bookType, true);
	SpellBookFrame.suppressCloseSound = false;
end

function SpellBook_GetSpellID(id)
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		return id + (SPELLS_PER_PAGE * (SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET] - 1));
	else
		local slot = id + SpellBookFrame.selectedSkillLineOffset + ( SPELLS_PER_PAGE * (SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine] - 1));
		if ( not GetCVarBool("ShowAllSpellRanks") ) then
			return GetKnownSlotFromHighestRankSlot(slot), slot;
		end
		return slot, slot;
	end
end

function SpellBook_UpdatePageArrows()
	local currentPage, maxPages = SpellBook_GetCurrentPage();
	if ( currentPage == 1 ) then
		SpellBookPrevPageButton:Disable();
	else
		SpellBookPrevPageButton:Enable();
	end
	if ( currentPage == maxPages ) then
		SpellBookNextPageButton:Disable();
	else
		SpellBookNextPageButton:Enable();
	end
end

function SpellBook_GetCurrentPage()
	local currentPage, maxPages;
	local numPetSpells = HasPetSpells();
	if ( SpellBookFrame.bookType == BOOKTYPE_PET ) then
		currentPage = SPELLBOOK_PAGENUMBERS[BOOKTYPE_PET];
		maxPages = ceil(numPetSpells/SPELLS_PER_PAGE);
	elseif ( SpellBookFrame.bookType == BOOKTYPE_PROFESSION ) then
		currentPage = SPELLBOOK_PAGENUMBERS[BOOKTYPE_PROFESSION] or 1;
		maxPages = ceil(#spellbookProfessionRender / SPELLS_PER_PAGE);
	else
		currentPage = SPELLBOOK_PAGENUMBERS[SpellBookFrame.selectedSkillLine];
		local renderData = spellbookCustomRender[SpellBookFrame.selectedSkillLine];
		if ( renderData ) then
			maxPages = ceil(#renderData / SPELLS_PER_PAGE);
		else
			-- Fallback to stock calculation
			local name, texture, offset, numSpells = SpellBook_GetTabInfo(SpellBookFrame.selectedSkillLine);
			maxPages = ceil(numSpells/SPELLS_PER_PAGE);
		end
	end
	return currentPage, maxPages;
end

local maxShines = 1;
shineGet = {}
function SpellBook_GetAutoCastShine ()
	local shine = shineGet[1];

	if ( shine ) then
		tremove(shineGet, 1);
	else
		shine = CreateFrame("FRAME", "AutocastShine" .. maxShines, SpellBookFrame, "SpellBookShineTemplate");
		maxShines = maxShines + 1;
	end

	return shine;
end

function SpellBook_ReleaseAutoCastShine (shine)
	if ( not shine ) then
		return;
	end

	shine:Hide();
	AutoCastShine_AutoCastStop(shine);
	tinsert(shineGet, shine);
end

function SpellBook_GetTabInfo(skillLine)
	local name, texture, offset, numSpells, highestRankOffset, highestRankNumSpells = GetSpellTabInfo(skillLine);
	if ( not GetCVarBool("ShowAllSpellRanks")) then
		offset = highestRankOffset;
		numSpells = highestRankNumSpells;
	end
	return name, texture, offset, numSpells;
end
