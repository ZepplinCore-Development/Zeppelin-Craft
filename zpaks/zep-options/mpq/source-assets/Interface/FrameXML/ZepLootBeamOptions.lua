-- F-238: "Loot Beam" page in Video Options for the x64 client's loot beam (lootBeam* CVars, a port of
-- wxl-loot-beam by manatactical, GPL-3.0). Built-in UI loaded from ZepFrameXML.toc, like ZepHDOptions.lua.
-- A client without the loot beam (an older exe) has no lootBeam CVar and gets no page.

if ( not GetCVar("lootBeam") ) then
	return;
end

local STATUS_INTERVAL = 0.5;
local SLIDER_X = 200;
local SLIDER_WIDTH = 170;
local SLIDER_SPACING = 36;
local CHECK_SPACING = 26;

local MIN_QUALITY = { [-1] = "All", [0] = "Poor", "Common", "Uncommon", "Rare", "Epic" };

local DEF = {
	checks = {
		{ cvar = "lootBeam", text = "Loot Beam",
		  tooltip = "A beam of light rises over every corpse you can still loot." },
		{ cvar = "lootBeamLootColor", text = "Colour by Loot", sub = true, parent = "lootBeam",
		  tooltip = "Colour the beam by the rarest item in the corpse's loot. Until the loot is known the beam is gold." },
		{ cvar = "lootBeamServerColor", text = "Colour Before Opening", sub = true, parent = "lootBeamLootColor",
		  tooltip = "Use the server's view of the loot, so the beam has its colour as soon as the creature dies, before you open the corpse." },
		{ cvar = "lootBeamThroughWalls", text = "Show Through Walls", sub = true, parent = "lootBeam",
		  tooltip = "Draw the beam through terrain and walls. Off, hills and buildings hide it like any other light." },
	},
	sliders = {
		{ cvar = "lootBeamHeight", parent = "lootBeam", text = "Height", minValue = 5, maxValue = 60, valueStep = 1,
		  tooltip = "How far the beam rises above the corpse, in yards." },
		{ cvar = "lootBeamWidth", parent = "lootBeam", text = "Width", minValue = 0.1, maxValue = 2, valueStep = 0.05,
		  tooltip = "Half-width of the beam at its base, in yards." },
		{ cvar = "lootBeamAlpha", parent = "lootBeam", text = "Brightness", minValue = 0.1, maxValue = 1, valueStep = 0.05,
		  tooltip = "How bright the beam is." },
		{ cvar = "lootBeamPulse", parent = "lootBeam", text = "Pulse", minValue = 0, maxValue = 1, valueStep = 0.05,
		  tooltip = "How deeply the beam slowly breathes. 0 is steady." },
		{ cvar = "lootBeamSparkles", parent = "lootBeam", text = "Sparkles", minValue = 0, maxValue = 32, valueStep = 1,
		  tooltip = "Drifting motes of light in each beam. 0 turns them off." },
		{ cvar = "lootBeamMinQuality", parent = "lootBeam", text = "Minimum Quality", minValue = -1, maxValue = 4, valueStep = 1, names = MIN_QUALITY,
		  tooltip = "Hide the beam over corpses whose best item is below this quality. A corpse whose loot is not known yet always shows." },
		{ cvar = "lootBeamMaxDistance", parent = "lootBeam", text = "Range", minValue = 0, maxValue = 300, valueStep = 10, zeroText = "Any",
		  tooltip = "Only show beams within this many yards. 0 shows them at any range." },
	},
};

local function FormatValue (entry, value)
	if ( entry.names ) then
		return entry.names[floor(value + 0.5)] or format("%d", value);
	elseif ( entry.zeroText and value < entry.valueStep / 2 ) then
		return entry.zeroText;
	elseif ( entry.valueStep < 0.1 ) then
		return format("%.2f", value);
	elseif ( entry.valueStep < 1 ) then
		return format("%.1f", value);
	end
	return format("%d", value);
end

local function Slider_UpdateText (self, value)
	_G[self:GetName().."Text"]:SetText(self.zepEntry.text..": "..FormatValue(self.zepEntry, value));
end

local function Slider_OnValueChanged (self, value)
	self.newValue = value;
	Slider_UpdateText(self, value);
	if ( self:GetParent():IsVisible() ) then
		VideoOptionsFrameApply:Enable();
	end
end

local function AddCheck (panel, entry, y, depth)
	local check = CreateFrame("CheckButton", panel:GetName().."Check"..(#panel.controls + 1), panel, "VideoOptionsSmallCheckButtonTemplate");
	check:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", depth * 16, y);
	check.type = CONTROLTYPE_CHECKBOX;
	check.cvar = entry.cvar;
	panel.options[entry.cvar] = entry;
	BlizzardOptionsPanel_RegisterControl(check, panel);
	return check;
end

local function AddSlider (panel, entry, y)
	local slider = CreateFrame("Slider", panel:GetName().."Slider"..(#panel.controls + 1), panel, "OptionsSliderTemplate");
	slider:SetWidth(SLIDER_WIDTH);
	slider:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", SLIDER_X, y);
	slider.type = CONTROLTYPE_SLIDER;
	slider.cvar = entry.cvar;
	slider.zepEntry = entry;
	slider.SetDisplayValue = slider.SetValue;
	slider.SetValue = function (self, value)
		self:SetDisplayValue(value);
		BlizzardOptionsPanel_SetCVarSafe(self.cvar, value);
	end
	slider:SetScript("OnValueChanged", Slider_OnValueChanged);
	panel.options[entry.cvar] = entry;
	BlizzardOptionsPanel_RegisterControl(slider, panel);
	return slider;
end

local function BuildControls (panel)
	local byCvar = {};
	local depth = {};
	local y = -12;
	for _, entry in ipairs(DEF.checks) do
		if ( GetCVar(entry.cvar) and (not entry.parent or byCvar[entry.parent]) ) then
			depth[entry.cvar] = entry.parent and (depth[entry.parent] + 1) or 0;
			local check = AddCheck(panel, entry, y, depth[entry.cvar]);
			byCvar[entry.cvar] = check;
			if ( entry.parent ) then
				BlizzardOptionsPanel_SetupDependentControl(byCvar[entry.parent], check);
			end
			y = y - CHECK_SPACING;
		end
	end
	y = -16;
	for _, entry in ipairs(DEF.sliders) do
		if ( GetCVar(entry.cvar) and byCvar[entry.parent] ) then
			BlizzardOptionsPanel_SetupDependentControl(byCvar[entry.parent], AddSlider(panel, entry, y));
			y = y - SLIDER_SPACING;
		end
	end

	-- The same set-up the stock panels get on PLAYER_ENTERING_WORLD (labels, tooltips, ranges, values).
	BlizzardOptionsPanel_OnEvent(panel, "PLAYER_ENTERING_WORLD");
	for _, control in ipairs(panel.controls) do
		local entry = control.zepEntry;
		if ( entry ) then
			local minValue, maxValue = control:GetMinMaxValues();
			_G[control:GetName().."Low"]:SetText(FormatValue(entry, minValue));
			_G[control:GetName().."High"]:SetText(FormatValue(entry, maxValue));
			Slider_UpdateText(control, control:GetValue());
		end
	end
	BlizzardOptionsPanel_Refresh(panel);
end

local panel = CreateFrame("Frame", "ZepLootBeamPanel", VideoOptionsFramePanelContainer);
panel.name = "Loot Beam";
panel.options = {};
panel.controls = {};
panel:Hide();

local titleText = panel:CreateFontString("ZepLootBeamPanelTitle", "ARTWORK", "GameFontNormalLarge");
titleText:SetPoint("TOPLEFT", 16, -16);
titleText:SetText("Loot Beam");

panel.subText = panel:CreateFontString("ZepLootBeamPanelSubText", "ARTWORK", "GameFontHighlightSmall");
panel.subText:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -8);
panel.subText:SetPoint("RIGHT", -32, 0);
panel.subText:SetJustifyH("LEFT");
panel.subText:SetText("A pillar of light over every corpse you can loot.");

local credit = panel:CreateFontString("ZepLootBeamPanelCredit", "ARTWORK", "GameFontDisableSmall");
credit:SetPoint("BOTTOMLEFT", 16, 16);
credit:SetText("Based on wxl-loot-beam by manatactical (GPL-3.0).");

local status = panel:CreateFontString("ZepLootBeamPanelStatus", "ARTWORK", "GameFontHighlightSmall");
status:SetPoint("BOTTOMLEFT", credit, "TOPLEFT", 0, 4);
status:SetPoint("RIGHT", -16, 0);
status:SetJustifyH("LEFT");
local wait = 0;
panel:SetScript("OnUpdate", function (self, elapsed)
	wait = wait - elapsed;
	if ( wait > 0 ) then
		return;
	end
	wait = STATUS_INTERVAL;
	status:SetText("Status: "..(GetCVar("lootBeamInfo") or "not started"));
end);

panel:SetScript("OnShow", function (self)
	if ( not self.zepBuilt ) then
		self.zepBuilt = true;
		BuildControls(self);
	end
end);

VideoOptionsPanel_OnLoad(panel);
