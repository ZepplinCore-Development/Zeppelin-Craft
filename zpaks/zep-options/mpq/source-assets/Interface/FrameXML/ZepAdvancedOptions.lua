-- F-232: an "Advanced" page in Video Options for CVars the stock menus never show. Built-in UI: the x64 client
-- loads it from Interface\FrameXML\ZepFrameXML.toc right after FrameXML.toc, so it is secure and not an addon.
-- Slider ranges come from GetCVarMin/GetCVarMax (the x64 client's F-232 range table), the same source the
-- stock sliders use, so a limit changes in one place. The ranges below are the fallback if the table has no row.

local PANEL_NAME = "ZepAdvancedOptionsPanel";

-- Video Options' own view distance slider: the x64 client reports the real 10000 yd cap, and the stock
-- step of a tenth of the range would leave only 11 stops.
local FARCLIP_STEP = 50;

local SLIDERS = {
	{ cvar = "horizonFarclipScale", text = "Horizon Distance", minValue = 3, maxValue = 12, valueStep = 0.5,
	  tooltip = "How far past the view distance the low-detail horizon terrain is drawn, as a multiple of the view distance." },
	{ cvar = "SkyCloudLOD", text = "Cloud Detail", minValue = 0, maxValue = 3, valueStep = 1,
	  tooltip = "Resolution of the sky's cloud layer (128 to 1024 pixels)." },
	{ cvar = "spellEffectLevel", text = "Spell Detail", minValue = 0, maxValue = 9, valueStep = 1,
	  tooltip = "How many particles spell effects emit. 9 is full detail." },
	{ cvar = "texLodBias", text = "Texture Sharpness", minValue = -1, maxValue = 1, valueStep = 0.1,
	  tooltip = "Texture mipmap bias. Negative values are sharper at a distance, positive values are blurrier and faster." },
	{ cvar = "maxFPS", text = "Max Frame Rate", minValue = 0, maxValue = 300, valueStep = 10, zeroText = "Unlimited",
	  tooltip = "Frame rate cap while the game window has focus. 0 means unlimited." },
	{ cvar = "maxFPSBk", text = "Max Background Frame Rate", minValue = 0, maxValue = 300, valueStep = 10, zeroText = "Unlimited",
	  tooltip = "Frame rate cap while the game window is in the background. 0 means unlimited." },
};

local CHECKBOXES = {
	{ cvar = "showfootprints", text = "Footprints",
	  tooltip = "Characters and creatures leave footprints on the ground." },
	{ cvar = "showfootprintparticles", text = "Footstep Dust",
	  tooltip = "Footsteps kick up dust and splash particles." },
	{ cvar = "ffxNetherWorld", text = "Invisibility Effect",
	  tooltip = "Tints the screen while you are invisible or in the spirit world." },
};

local function FormatValue (value, step)
	if ( step < 1 ) then
		return format("%.1f", value);
	end
	return format("%d", value);
end

local function Slider_UpdateText (self, value)
	local entry = self.zepEntry;
	local shown = (entry.zeroText and value == 0) and entry.zeroText or FormatValue(value, entry.valueStep);
	_G[self:GetName().."Text"]:SetText(entry.text..": "..shown);
end

local function Slider_OnValueChanged (self, value)
	self.newValue = value;
	Slider_UpdateText(self, value);
	if ( self:GetParent():IsVisible() ) then
		VideoOptionsFrameApply:Enable();
	end
end

local panel = CreateFrame("Frame", PANEL_NAME, VideoOptionsFramePanelContainer);
panel.name = "Advanced";
panel.options = {};
panel:Hide();

local title = panel:CreateFontString(PANEL_NAME.."Title", "ARTWORK", "GameFontNormalLarge");
title:SetPoint("TOPLEFT", 16, -16);
title:SetText("Advanced");

local subText = panel:CreateFontString(PANEL_NAME.."SubText", "ARTWORK", "GameFontHighlightSmall");
subText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8);
subText:SetPoint("RIGHT", -32, 0);
subText:SetJustifyH("LEFT");
subText:SetText("Settings the standard menus hide.");

local anchor = subText;
for i, entry in ipairs(SLIDERS) do
	local slider = CreateFrame("Slider", PANEL_NAME.."Slider"..i, panel, "OptionsSliderTemplate");
	slider:SetWidth(200);
	slider:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", (i == 1) and 4 or 0, (i == 1) and -32 or -38);
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
	anchor = slider;
end

anchor = nil;
for i, entry in ipairs(CHECKBOXES) do
	local check = CreateFrame("CheckButton", PANEL_NAME.."Check"..i, panel, "VideoOptionsSmallCheckButtonTemplate");
	if ( anchor ) then
		check:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -8);
	else
		check:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 240, -24);
	end
	check.type = CONTROLTYPE_CHECKBOX;
	check.cvar = entry.cvar;
	panel.options[entry.cvar] = entry;
	BlizzardOptionsPanel_RegisterControl(check, panel);
	anchor = check;
end

-- Registers PLAYER_ENTERING_WORLD; BlizzardOptionsPanel_OnEvent then reads each slider's range from
-- GetCVarMin/GetCVarMax (falling back to the entry), sets labels and tooltips, and loads the values.
VideoOptionsPanel_OnLoad(panel);

-- Low / High labels show the range the slider actually got.
panel:HookScript("OnEvent", function (self, event)
	if ( event ~= "PLAYER_ENTERING_WORLD" ) then
		return;
	end
	for _, control in ipairs(self.controls) do
		if ( control.zepEntry ) then
			local minValue, maxValue = control:GetMinMaxValues();
			_G[control:GetName().."Low"]:SetText(FormatValue(minValue, control.zepEntry.valueStep));
			_G[control:GetName().."High"]:SetText(FormatValue(maxValue, control.zepEntry.valueStep));
			Slider_UpdateText(control, control:GetValue());
		end
	end
end);

VideoOptionsEffectsPanel:HookScript("OnEvent", function (self, event)
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		VideoOptionsEffectsPanelViewDistance:SetValueStep(FARCLIP_STEP);
	end
end);
