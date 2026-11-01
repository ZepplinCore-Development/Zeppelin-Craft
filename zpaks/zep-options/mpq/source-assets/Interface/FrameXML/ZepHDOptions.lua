-- F-234: "HD Effects" and "HD Performance" pages in Video Options for the x64 client's HD renderer CVars
-- (absorbed from Azeroth-Remastered). Built-in UI loaded from ZepFrameXML.toc, like ZepAdvancedOptions.lua.
-- A client without the HD CVars (an older exe) gets neither page. Most effects register their CVars on the
-- first world frame, after this file loads, so each page builds its controls the first time it is shown;
-- a control whose CVar the running renderer never registered (hdAOQuality is Vulkan only) is left out.
-- Fog, Forever, grading, sun shadows and Cata water read the WoW-HD pack data in PATCH-V (zep-vulkan-shaders): pages
-- HD Lighting and HD Water. A control marked d3d9 / vulkan is left out under the other renderer, where it does nothing.

-- Without the HD renderer there is nothing to show. hdCataViewDistance is registered at start-up under
-- either renderer; hdAO is not registered under Direct3D 9 until the first world frame.
if ( not GetCVar("hdCataViewDistance") ) then
	return;
end

local STATUS_INTERVAL = 0.5;

local VULKAN_KEY = "zepVulkanRenderer";

local AO_QUALITY = { [0] = "Low", "Medium", "High", "Ultra" };
local VIEW_QUALITY = { [0] = "Low", "Fair", "Good", "High", "Ultra" };
local GRASS_SHADER = { [0] = "Blizzard", "HD", "HD Classic" };


local SLIDER_X = 200;
local SLIDER_WIDTH = 170;
local SLIDER_SPACING = 36;
local CHECK_SPACING = 26;

-- Check boxes down the left (sub = indented under the one before), sliders down the right; every
-- control with a parent greys out while the parent's check box is off.
local EFFECTS = {
	checks = {
		{ key = VULKAN_KEY, text = "Vulkan Renderer", default = "0", gameRestart = 1,
		  tooltip = "Draw the game with Vulkan instead of Direct3D 9. If Vulkan cannot start, the game falls back to Direct3D 9.",
		  tooltipRequirement = OPTION_RESTART_REQUIREMENT },
		{ cvar = "hdAO", text = "Ambient Occlusion",
		  tooltip = "Soft shadowing where objects meet and in creases and corners. Vulkan only." },
		{ cvar = "hdContactShadow", text = "Contact Shadows", d3d9 = true,
		  tooltip = "Fine shadows where small objects touch the ground. Direct3D 9 only." },
		{ cvar = "hdContactShadowUnits", text = "Characters Too", sub = true, parent = "hdContactShadow", d3d9 = true,
		  tooltip = "Characters and creatures cast contact shadows as well as receiving them." },
		{ cvar = "hdGI", text = "Global Illumination", d3d9 = true,
		  tooltip = "Light bounces once off nearby surfaces and picks up their colour. Direct3D 9 only." },
		{ cvar = "hdBloom", text = "Bloom",
		  tooltip = "A soft glow around the brightest parts of the world." },
		{ cvar = "hdRays", text = "Sun Rays",
		  tooltip = "Shafts of light from the sun. Only drawn while the sun is on screen." },
	},
	sliders = {
		{ cvar = "hdAOStrength", parent = "hdAO", text = "Occlusion", minValue = 0, maxValue = 2, valueStep = 0.05,
		  tooltip = "How dark the ambient occlusion is." },
		{ cvar = "hdAOQuality", parent = "hdAO", text = "Occlusion Quality", minValue = 0, maxValue = 3, valueStep = 1, names = AO_QUALITY,
		  tooltip = "Samples per pixel. Higher is smoother and slower. Vulkan only." },
		{ cvar = "hdAORadius", parent = "hdAO", text = "Occlusion Radius", minValue = 0.25, maxValue = 3, valueStep = 0.25, decimals = 2,
		  tooltip = "How far, in yards, things shade the surfaces around them. Vulkan only." },
		{ cvar = "hdAOThin", parent = "hdAO", text = "Ignore Grass", minValue = 0, maxValue = 4, valueStep = 0.25, decimals = 2,
		  tooltip = "How much grass, leaves and other thin things are left out of the occlusion, so the ground under them is not darkened. 0 is the old look. Vulkan only." },
		{ cvar = "hdContactShadowStrength", parent = "hdContactShadow", d3d9 = true, text = "Contact Shadow", minValue = 0, maxValue = 1, valueStep = 0.05,
		  tooltip = "1 is as dark as the game's own shadows, 0 is none." },
		{ cvar = "hdGIStrength", parent = "hdGI", d3d9 = true, text = "Bounce Light", minValue = 0, maxValue = 2, valueStep = 0.05,
		  tooltip = "How bright the bounced light is. 1 is normal." },
		{ cvar = "hdBloomStrength", parent = "hdBloom", text = "Bloom", minValue = 0, maxValue = 3, valueStep = 0.05,
		  tooltip = "How strong the glow is. 1 is normal." },
		{ cvar = "hdBloomThreshold", parent = "hdBloom", text = "Bloom Threshold", minValue = 0, maxValue = 1, valueStep = 0.01,
		  tooltip = "How bright a pixel must be before it glows. Lower values make more of the world glow." },
		{ cvar = "hdRaysStrength", parent = "hdRays", text = "Sun Rays", minValue = 0, maxValue = 3, valueStep = 0.05,
		  tooltip = "How strong the sun rays are. 1 is normal." },
	},
	status = {
		{ "Occlusion", "hdAOInfo" },
		{ "Contact Shadows", "hdContactShadowInfo" },
		{ "Global Illumination", "hdGIInfo" },
		{ "Bloom and Rays", "hdBloomInfo" },
	},
};

local PERFORMANCE = {
	checks = {
		{ cvar = "hdCataViewDistance", text = "Cataclysm View Distance",
		  tooltip = "Draw terrain, the horizon and large objects with Cataclysm's distance rules instead of the original ones. While it is on, View Quality sets the distance: the View Distance (Effects) and Horizon Distance (Advanced) sliders are greyed out." },
		{ cvar = "hdCataWmoStreaming", text = "Background Building Loading",
		  tooltip = "Load buildings in the background, as Cataclysm does, and wait only for those close to you." },
		{ cvar = "hdCataHorizonIndex", text = "Fast Horizon Culling",
		  tooltip = "Pick the distant buildings to draw from a spatial index built when the map loads, instead of testing each one." },
		{ cvar = "hdCataRenderPerf", text = "Performance Log",
		  tooltip = "Every 2 seconds, write the frame rate, frame times, CPU and GPU time and the settings in use to Logs\\CataRenderPerf.log, with the time of day, to compare renderers and settings." },
		{ cvar = "scriptProfile", text = "Addon CPU in Log", sub = true, parent = "hdCataRenderPerf",
		  tooltip = "Also write each addon's CPU time to the performance log. Takes effect after a /reload or relog. Costs a little CPU while on, so turn it off when you are done." },
	},
	sliders = {
		{ cvar = "hdCataViewQuality", parent = "hdCataViewDistance", text = "View Quality", minValue = 0, maxValue = 4, valueStep = 1, names = VIEW_QUALITY,
		  tooltip = "Cataclysm's view distance preset. Higher draws further." },
	},
	status = {
		{ "View Distance", "hdCataViewInfo" },
		{ "Horizon Culling", "hdCataHorizonInfo" },
		{ "Last Frame", "hdCataRenderPerfInfo" },
	},
};

-- Zeppelin F-234: WoW Forever's lighting, fog and grading, and the Vulkan sun shadows.
local LIGHTING = {
	checks = {
		{ cvar = "hdForever", text = "Forever Lighting",
		  tooltip = "Light, ambient and sky colours from WoW Forever wherever it has them, instead of the original ones." },
		{ cvar = "hdFog", text = "Volumetric Fog",
		  tooltip = "Fog that fills the air in layers, lit by the sun. Unverified under Direct3D 9." },
		{ cvar = "hdFogShadow", text = "Light Shafts", sub = true, parent = "hdFog",
		  tooltip = "The sun's shadows reach into the fog: beams of light through trees and windows." },
		{ cvar = "hdGrade", text = "Colour Grading",
		  tooltip = "WoW Forever's colour grading for each place." },
		{ cvar = "hdSunShadows", text = "Soft Sun Shadows", vulkan = true,
		  tooltip = "Sun shadows that soften with distance from what casts them, like real sunlight. Needs Shadow Quality High or above (Effects page). Vulkan only." },
		{ cvar = "hdSunContact", text = "Contact Detail", sub = true, parent = "hdSunShadows", vulkan = true,
		  tooltip = "Fine shadows where small things touch the ground, too small for the shadow maps." },
		{ cvar = "hdLights", text = "Per-Pixel Lamps", d3d9 = true,
		  tooltip = "Lamps and fires light the ground per pixel, as in WoW Forever, instead of per vertex. Direct3D 9 only." },
	},
	sliders = {
		{ cvar = "hdForeverLight", parent = "hdForever", text = "Forever Sun and Ambient", minValue = 0, maxValue = 1, valueStep = 0.05,
		  tooltip = "1 lights the world with Forever's sun and ambient, 0 with the original ones, between mixes them." },
		{ cvar = "hdFogDensity", parent = "hdFog", text = "Fog Density", minValue = 0, maxValue = 3, valueStep = 0.05,
		  tooltip = "How thick the fog is. 1 is Forever's." },
		{ cvar = "hdFogSun", parent = "hdFog", text = "Fog Sunlight", minValue = 0, maxValue = 3, valueStep = 0.05,
		  tooltip = "How much the sun lights the fog. 1 is Forever's." },
		{ cvar = "hdGradeStrength", parent = "hdGrade", text = "Grading Strength", minValue = 0, maxValue = 2, valueStep = 0.05,
		  tooltip = "How strong the colour grading is. 1 is Forever's." },
		{ cvar = "hdSunStrength", parent = "hdSunShadows", text = "Sun Shadow Strength", minValue = 0, maxValue = 1, valueStep = 0.05, vulkan = true,
		  tooltip = "How dark the soft sun shadows are. 1 is full." },
	},
	status = {
		{ "Forever", "hdForeverInfo" },
		{ "Fog", "hdFogInfo" },
		{ "Grading", "hdGradeInfo" },
		{ "Sun Shadows", "hdSunInfo" },
	},
};

-- Zeppelin F-234: water. Cataclysm water on Vulkan (its lava, hdCataMagma, registers only once the water runs and is on
-- by default, so it has no control); WoW Forever's water on Direct3D 9.
local WATER = {
	checks = {
		{ cvar = "hdCataWater", text = "Cataclysm Water", vulkan = true,
		  tooltip = "Cataclysm's water: reflections of the world and ripples. Vulkan only." },
		{ cvar = "hdWater", text = "HD Water", d3d9 = true,
		  tooltip = "WoW Forever's water: depth colour, reflections of the world and foam. Direct3D 9 only." },
		{ cvar = "hdWaterRipples", text = "Ripples", sub = true, parent = "hdWater", d3d9 = true,
		  tooltip = "Rings spread on the water around players and creatures in it." },
		{ cvar = "hdWaterWaves", text = "Waves", sub = true, parent = "hdWater", d3d9 = true,
		  tooltip = "Moving waves on the water instead of the original flat normal maps." },
	},
	sliders = {
		{ cvar = "hdWaterRippleStrength", parent = "hdWaterRipples", text = "Ripple Strength", minValue = 0, maxValue = 2, valueStep = 0.05, d3d9 = true,
		  tooltip = "How strong the ripples are. 1 is normal." },
		{ cvar = "hdWaterWaveScale", parent = "hdWaterWaves", text = "Wave Height", minValue = 0, maxValue = 4, valueStep = 0.05, d3d9 = true,
		  tooltip = "How high the waves are. 1 is the water's own." },
	},
	status = {
		{ "Cataclysm Water", "hdCataWaterInfo" },
		{ "HD Water", "hdWaterInfo" },
	},
};

-- Zeppelin F-237 / F-234: the HD grass. Its CVars register when the grass first draws, so the page builds on first show.
local GRASS = {
	checks = {
		{ cvar = "hdGrassWind", text = "Grass Wind",
		  tooltip = "Grass sways with the zone's wind, gusts and weather, and lies still under roofs and behind walls. Needs the HD grass shader." },
		{ cvar = "hdGrassReact", text = "Grass Parting",
		  tooltip = "Grass bends away from players, creatures and mounts moving through it. Needs the HD grass shader." },
	},
	sliders = {
		{ cvar = "hdGrassLight", text = "Grass Shader", minValue = 0, maxValue = 2, valueStep = 1, names = GRASS_SHADER,
		  tooltip = "Blizzard: the original grass. HD: grass lit like the HD terrain, with wind and parting. HD Classic: the HD grass with the original lighting." },
		{ cvar = "hdGrassWindStrength", parent = "hdGrassWind", text = "Wind Strength", minValue = 0, maxValue = 3, valueStep = 0.1,
		  tooltip = "How hard the wind bends the grass. 1 is the zone's wind as authored." },
		{ cvar = "hdGrassReactRadius", parent = "hdGrassReact", text = "Parting Radius", minValue = 0.5, maxValue = 4, valueStep = 0.25, decimals = 2,
		  tooltip = "How wide the grass parts around a unit, as a multiple of its size. Doubled while mounted." },
		{ cvar = "hdGrassBuffers", text = "Grass Kept Ready", minValue = 0, maxValue = 4096, valueStep = 256, zeroText = "Off",
		  tooltip = "How many patches of grass are kept loaded on the graphics card instead of being rebuilt every frame. Higher is faster when there is a lot of grass. Off rebuilds it every frame." },
	},
	status = {
		{ "Grass Shaders", "hdGrassInfo" },
		{ "Wind", "hdGrassWindInfo" },
	},
};

-- The Vulkan effects register their CVars only when Vulkan runs (hdAOQuality is one of them): a Direct3D 9 only control
-- (d3d9 = true) does nothing then and is left out, as the Vulkan-only ones are under Direct3D 9.
local function VulkanRunning ()
	return GetCVar("hdAOQuality") ~= nil;
end

local function Exists (entry)
	if ( (entry.d3d9 and VulkanRunning()) or (entry.vulkan and not VulkanRunning()) ) then
		return false;
	end
	return entry.key or GetCVar(entry.cvar) ~= nil;
end

local function FormatValue (entry, value)
	if ( entry.zeroText and value < 0.5 ) then
		return entry.zeroText;
	elseif ( entry.decimals ) then
		return format("%."..entry.decimals.."f", value);
	elseif ( entry.names ) then
		return entry.names[floor(value + 0.5)] or format("%d", value);
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

local function AddCheck (panel, entry, y)
	local check = CreateFrame("CheckButton", panel:GetName().."Check"..(#panel.controls + 1), panel, "VideoOptionsSmallCheckButtonTemplate");
	check:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", entry.sub and 16 or 0, y);
	check.type = CONTROLTYPE_CHECKBOX;
	check.cvar = entry.cvar;
	check.label = entry.key;
	if ( entry.key == VULKAN_KEY ) then
		check.GetValue = function ()
			return strlower(GetCVar("gxApi") or "") == "vulkan" and "1" or "0";
		end
	end
	panel.options[entry.cvar or entry.key] = entry;
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
	local def = panel.zepDef;
	local byCvar = {};
	local y = -12;
	for _, entry in ipairs(def.checks) do
		if ( Exists(entry) and (not entry.parent or byCvar[entry.parent]) ) then
			local check = AddCheck(panel, entry, y);
			byCvar[entry.cvar or entry.key] = check;
			if ( entry.parent ) then
				BlizzardOptionsPanel_SetupDependentControl(byCvar[entry.parent], check);
			end
			y = y - CHECK_SPACING;
		end
	end
	y = -16;
	for _, entry in ipairs(def.sliders) do
		if ( Exists(entry) and (not entry.parent or byCvar[entry.parent]) ) then
			local slider = AddSlider(panel, entry, y);
			if ( entry.parent ) then
				BlizzardOptionsPanel_SetupDependentControl(byCvar[entry.parent], slider);
			end
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
		elseif ( control.label == VULKAN_KEY ) then
			-- The renderer has no 0/1 CVar of its own: the check box writes gxApi.
			control.SetValue = function (self, value)
				self.value = value;
				SetCVar("gxApi", value == "1" and "vulkan" or "d3d9");
			end
		end
	end
	BlizzardOptionsPanel_Refresh(panel);
end

local function BuildPage (name, title, subTitle, def)
	local panel = CreateFrame("Frame", name, VideoOptionsFramePanelContainer);
	panel.name = title;
	panel.options = {};
	panel.controls = {};
	panel.zepDef = def;
	panel:Hide();

	local titleText = panel:CreateFontString(name.."Title", "ARTWORK", "GameFontNormalLarge");
	titleText:SetPoint("TOPLEFT", 16, -16);
	titleText:SetText(title);

	panel.subText = panel:CreateFontString(name.."SubText", "ARTWORK", "GameFontHighlightSmall");
	panel.subText:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -8);
	panel.subText:SetPoint("RIGHT", -32, 0);
	panel.subText:SetJustifyH("LEFT");
	panel.subText:SetText(subTitle);

	-- What each effect reports it is doing right now (its read-only ...Info CVar), refreshed while shown. One
	-- line each, cut short rather than wrapped, so a long report cannot push the others off the page.
	local rows = { { "Renderer" } };
	for _, line in ipairs(def.status) do
		tinsert(rows, line);
	end
	local lines = {};
	for i = #rows, 1, -1 do
		local line = panel:CreateFontString(name.."Status"..i, "ARTWORK", "GameFontHighlightSmall");
		line:SetHeight(12);
		line:SetJustifyH("LEFT");
		if ( i == #rows ) then
			line:SetPoint("BOTTOMLEFT", 16, 16);
		else
			line:SetPoint("BOTTOMLEFT", lines[i + 1], "TOPLEFT", 0, 0);
		end
		line:SetPoint("RIGHT", -16, 0);
		lines[i] = line;
	end
	local header = panel:CreateFontString(name.."StatusHeader", "ARTWORK", "GameFontNormal");
	header:SetPoint("BOTTOMLEFT", lines[1], "TOPLEFT", 0, 4);
	header:SetText("Status");
	local wait = 0;
	panel:SetScript("OnUpdate", function (self, elapsed)
		wait = wait - elapsed;
		if ( wait > 0 ) then
			return;
		end
		wait = STATUS_INTERVAL;
		lines[1]:SetText("Renderer: "..(strlower(GetCVar("gxApi") or "") == "vulkan" and "Vulkan" or "Direct3D 9"));
		for i = 2, #rows do
			lines[i]:SetText(rows[i][1]..": "..(GetCVar(rows[i][2]) or "not started"));
		end
	end);

	panel:SetScript("OnShow", function (self)
		if ( not self.zepBuilt ) then
			self.zepBuilt = true;
			BuildControls(self);
		end
	end);

	VideoOptionsPanel_OnLoad(panel);
end

BuildPage("ZepHDEffectsPanel", "HD Effects", "Lighting and post-processing.", EFFECTS);
BuildPage("ZepHDPerformancePanel", "HD Performance", "Cataclysm-era drawing and loading. Compare frame rates.", PERFORMANCE);
BuildPage("ZepHDLightingPanel", "HD Lighting", "WoW Forever lighting, fog and colour grading, and soft sun shadows.", LIGHTING);
BuildPage("ZepHDWaterPanel", "HD Water", "Water, lava and slime.", WATER);
BuildPage("ZepHDGrassPanel", "HD Grass", "Grass lighting, wind and parting.", GRASS);

-- Cataclysm View Distance takes the far clip from its View Quality preset and the horizon from that, so Effects' View
-- Distance and Advanced's Horizon Distance (ZepAdvancedOptions.lua, F-232) do nothing while it is on: greyed out then.
-- The checkbox's unsaved state counts once the page is built, the CVar before.
local function CataViewDistanceOn ()
	for _, control in ipairs(ZepHDPerformancePanel.controls or {}) do
		if ( control.cvar == "hdCataViewDistance" ) then
			return control:GetChecked() and true or false;
		end
	end
	return GetCVar("hdCataViewDistance") == "1";
end

local function LockViewDistance ()
	local sliders = { VideoOptionsEffectsPanelViewDistance };
	for _, control in ipairs(ZepAdvancedOptionsPanel and ZepAdvancedOptionsPanel.controls or {}) do
		if ( control.cvar == "horizonFarclipScale" ) then
			tinsert(sliders, control);
		end
	end
	local locked = CataViewDistanceOn();
	for _, slider in ipairs(sliders) do
		if ( locked ) then
			BlizzardOptionsPanel_Slider_Disable(slider);
		else
			BlizzardOptionsPanel_Slider_Enable(slider);
		end
	end
end

VideoOptionsEffectsPanel:HookScript("OnShow", LockViewDistance);
if ( ZepAdvancedOptionsPanel ) then
	ZepAdvancedOptionsPanel:HookScript("OnShow", LockViewDistance);
end
ZepHDPerformancePanel:HookScript("OnShow", function ()
	for _, control in ipairs(ZepHDPerformancePanel.controls) do
		if ( control.cvar == "hdCataViewDistance" and not control.zepLockHooked ) then
			control.zepLockHooked = true;
			control:HookScript("OnClick", LockViewDistance);
		end
	end
end);
