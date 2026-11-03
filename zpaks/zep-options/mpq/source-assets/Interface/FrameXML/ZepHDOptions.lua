-- F-234: Video Options as themed pages. Built-in UI loaded from ZepFrameXML.toc (F-232), not an addon.
--   Display             the stock Resolution page, renamed, plus the Renderer (Vulkan) check box
--   View Distance       Lighting   Shadows   Atmosphere   Terrain & Grass   Water   Textures & Effects   Performance
-- The stock Effects page and the F-232 Advanced page are absorbed: their controls are rebuilt here on the same CVars
-- (with the stock special cases: inverted texture resolution, terrain detail via Get/SetTerrainMip, restart and logout
-- prompts, player texture availability, the x64 far clip range and step) and their entries leave the category list.
-- farclip keeps F-232's step of 50 yd over the x64 range (177 to 10000 from GetCVarMin/Max): the stock tenth of the
-- range would leave 11 stops. The stock graphics quality preset slider is not carried over: its presets span several pages now.
-- Each themed page has a box at the bottom: the live hd*Info status lines, or, while the mouse is over a control, what
-- it does and its measured cost.
-- Many HD CVars register on the first world frame, after this file loads, so a page builds its controls the first time
-- it is shown; a control whose CVar the running renderer never registered is left out. A control marked d3d9 / vulkan
-- is shown greyed out under the other renderer (user, 2026-11-03), and only then does the box name the renderer it needs
-- (plus entry.other, the running renderer's counterpart).

local VULKAN_KEY = "zepVulkanRenderer";
local STATUS_INTERVAL = 0.5;

local COLUMN_X = { 0, 200 };
local SLIDER_WIDTH = 170;
local CHECK_HEIGHT = 26;
local SLIDER_HEIGHT = 40;
local SLIDER_LABEL = 14;
local INFO_HEIGHT = 106;
local STATUS_LINES = 5;

-- Measured costs come from the user's own performance logs on one machine.
local RIG = "RTX 3080 Ti, 3840x2160, Vulkan";
local NO_COST = "no measurable cost.";
-- Zeppelin F-223A: this session's measured costs (Performance page, Measure Costs), by CVar: { text = "..." }.
local benchResults = {};

local AO_QUALITY = { [0] = "Low", "Medium", "High", "Ultra" };
local VIEW_QUALITY = { [0] = "Low", "Fair", "Good", "High", "Ultra" };
local GRASS_SHADER = { [0] = "Blizzard", "HD", "HD Classic" };
local ALPHA_AA = { [0] = "Off", "Coverage", "Supersampled" };
-- Zeppelin F-223E: the shadows as independent controls; the stock Shadow Quality preset (extShadowQuality) has no control
-- any more (user, 2026-11-03): the client derives its shadow mode from these settings.
local SHADOW_MAP = { [0] = "Off", "1024", "2048" };
local SHADOW_CASTERS = { [0] = "Buildings", "Standard", "Everything" };
local WEATHER = { [-1] = "Server", [0] = "Clear", "Rain", "Snow", "Sandstorm" };
local TEXTURE_FILTER = { [0] = "Bilinear", "Trilinear", "2x", "4x", "8x", "16x" };
local LOW_HIGH = { [0] = LOW or "Low", HIGH or "High" };
local PLAYER_TEXTURE = { [8] = LOW or "Low", [9] = HIGH or "High" };

local function C (entry) entry.kind = CONTROLTYPE_CHECKBOX; return entry; end
local function S (entry) entry.kind = CONTROLTYPE_SLIDER; return entry; end

-- Stock controls that need more than "slider on a CVar".
local function BaseMipSetup (slider)
	-- Lower BaseMip is better quality, so the slider shows it upside down (as the stock one does).
	slider.SetValue = function (self, value)
		self:SetDisplayValue(value);
		local minValue, maxValue = self:GetMinMaxValues();
		BlizzardOptionsPanel_SetCVarSafe(self.cvar, maxValue - value + minValue);
	end
	slider.GetCurrentValue = function (self)
		local minValue, maxValue = self:GetMinMaxValues();
		return minValue - BlizzardOptionsPanel_GetCVarSafe(self.cvar) + maxValue;
	end
end

local function BaseMipAfter (slider)
	local minValue, maxValue = slider:GetMinMaxValues();
	slider.defaultValue = maxValue - (tonumber(GetCVarDefault("BaseMip")) or maxValue) + minValue;
end

local function TerrainMipSetup (slider)
	-- No CVar of its own: GetTerrainMip / SetTerrainMip read and write shadowLevel the other way round.
	slider.SetValue = function (self, value)
		self:SetDisplayValue(value);
		SetTerrainMip(value);
	end
	slider.GetCurrentValue = function () return GetTerrainMip(); end
	slider.defaultValue = 1 - (tonumber(GetCVarDefault("shadowLevel")) or 0);
end

local function PlayerTextureAfter (slider)
	if ( not IsPlayerResolutionAvailable() ) then
		slider:Disable();
	end
end

local PAGES = {
	{
		name = "ZepVideoViewPanel", title = "View Distance",
		subText = "How far the world is drawn, and how distant buildings load.",
		columns = {
			{
				S{ cvar = "farclip", text = "FARCLIP", minValue = 177, maxValue = 1277, valueStep = 50,
				   info = "How far away terrain and objects are drawn, in yards. Higher shows more of the world. Greyed out while Cataclysm View Distance is on." },
				S{ cvar = "horizonFarclipScale", text = "Horizon Distance", minValue = 3, maxValue = 12, valueStep = 0.5,
				   tooltip = "How far past the view distance the low-detail horizon terrain is drawn, as a multiple of the view distance.",
				   info = "How far past the view distance the low-detail horizon is drawn, as a multiple of it. Greyed out while Cataclysm View Distance is on." },
				C{ cvar = "hdCataViewDistance", text = "Cataclysm View Distance",
				   tooltip = "Draw terrain, the horizon and large objects with Cataclysm's distance rules instead of the original ones.",
				   info = "Cataclysm's distance rules for terrain, the horizon and large objects. While on, View Quality sets the distance and the sliders above grey out." },
				S{ cvar = "hdCataViewQuality", parent = "hdCataViewDistance", text = "View Quality", minValue = 0, maxValue = 4, valueStep = 1, names = VIEW_QUALITY,
				   tooltip = "Cataclysm's view distance preset. Higher draws further." },
			},
			{
				C{ cvar = "hdCataWmoStreaming", text = "Background Building Loading",
				   tooltip = "Load buildings in the background, as Cataclysm does, and wait only for those close to you." },
				C{ cvar = "hdCataHorizonIndex", text = "Fast Horizon Culling",
				   tooltip = "Pick the distant buildings to draw from a spatial index built when the map loads, instead of testing each one." },
			},
		},
		status = {
			{ "View Distance", "hdCataViewInfo" },
			{ "Horizon Culling", "hdCataHorizonInfo" },
		},
	},
	{
		-- Zeppelin F-223E: the shadows moved to their own page (the split shadow controls did not fit here).
		name = "ZepVideoLightingPanel", title = "Lighting",
		subText = "Ambient occlusion and the light in the world.",
		columns = {
			{
				C{ cvar = "hdForever", text = "Forever Lighting",
				   tooltip = "Light, ambient and sky colours from WoW Forever wherever it has them, instead of the original ones.",
				   cost = NO_COST },
				S{ cvar = "hdForeverLight", parent = "hdForever", text = "Forever Sun and Ambient", minValue = 0, maxValue = 1, valueStep = 0.05,
				   tooltip = "1 lights the world with Forever's sun and ambient, 0 with the original ones, between mixes them." },
				C{ cvar = "hdLights", text = "Per-Pixel Lamps", d3d9 = true,
				   other = "On Vulkan use Lamp Lighting.",
				   tooltip = "Lamps and fires light the ground per pixel, as in WoW Forever, instead of per vertex. Needs Forever Lighting." },
				C{ cvar = "hdLightPass", text = "Lamp Lighting (experimental)", vulkan = true,
				   other = "On Direct3D 9 use Per-Pixel Lamps.",
				   info = "Every lamp, fire and glowing object lights the world around it per pixel, with no limit of 4 lights per object. Replaces the game's own lamp lighting while on. Works with multisampling. Experimental: the gain depends on how many models carry lights (Project Reforged models carry many)." },
				S{ cvar = "hdLightPassStrength", parent = "hdLightPass", text = "Lamp Light Strength", minValue = 0, maxValue = 4, valueStep = 0.25, decimals = 2, vulkan = true,
				   info = "How bright the lamp light is. 1 is normal." },
				C{ cvar = "hdGI", text = "Global Illumination", d3d9 = true,
				   tooltip = "Light bounces once off nearby surfaces and picks up their colour." },
				S{ cvar = "hdGIStrength", parent = "hdGI", d3d9 = true, text = "Bounce Light", minValue = 0, maxValue = 2, valueStep = 0.05,
				   tooltip = "How bright the bounced light is. 1 is normal." },
				C{ cvar = "specular", text = "TERRAIN_HIGHLIGHTS", logout = 1, tooltipRequirement = OPTION_LOGOUT_REQUIREMENT,
				   info = "Shiny highlights on terrain and objects where the light catches them. Takes effect after you log out." },
			},
			{
				C{ cvar = "hdAO", text = "Ambient Occlusion", vulkan = true,
				   tooltip = "Soft shadowing where objects meet and in creases and corners." },
				S{ cvar = "hdAOStrength", parent = "hdAO", vulkan = true, text = "Occlusion", minValue = 0, maxValue = 2, valueStep = 0.05,
				   tooltip = "How dark the ambient occlusion is." },
				S{ cvar = "hdAOQuality", parent = "hdAO", text = "Occlusion Quality", minValue = 0, maxValue = 3, valueStep = 1, names = AO_QUALITY, vulkan = true,
				   tooltip = "Samples per pixel. Higher is smoother and slower.",
				   cost = "High or Ultra about +1 to 3 ms GPU per frame more than Medium." },
				S{ cvar = "hdAORadius", parent = "hdAO", vulkan = true, text = "Occlusion Radius", minValue = 0.25, maxValue = 3, valueStep = 0.25, decimals = 2,
				   tooltip = "How far, in yards, things shade the surfaces around them." },
				S{ cvar = "hdAOThin", parent = "hdAO", text = "Ignore Grass", minValue = 0, maxValue = 4, valueStep = 0.25, decimals = 2, vulkan = true,
				   tooltip = "How much grass, leaves and other thin things are left out of the occlusion, so the ground under them is not darkened. 0 is the old look." },
			},
		},
		status = {
			{ "Forever", "hdForeverInfo" },
			{ "Occlusion", "hdAOInfo", vulkan = true },
			{ "Global Illumination", "hdGIInfo", d3d9 = true },
			{ "Lamps", "hdLightsInfo", d3d9 = true },
			{ "Lamp Lighting", "hdLightPassInfo", vulkan = true },
		},
	},
	{
		-- Zeppelin F-223E: Shadows, split into character shadows, world (sun) shadows and the dimming of characters in
		-- baked shade, each on its own.
		name = "ZepVideoShadowPanel", title = "Shadows",
		subText = "Character and world shadows, each set on its own.",
		columns = {
			{
				S{ cvar = "hdShadowChar", text = "Character Shadows", minValue = 0, maxValue = 2, valueStep = 1, names = SHADOW_MAP,
				   info = "Live shadows of characters and creatures around you. 1024 or 2048 is the shadow map's resolution: sharper at 2048. Off: a round blob under each one instead." },
				S{ cvar = "hdShadowCharRadius", text = "Character Shadow Range", minValue = 10, maxValue = 40, valueStep = 5,
				   info = "How many yards around you characters cast live shadows. One map covers the whole range, so a longer range is blurrier. The original is 20." },
				C{ cvar = "hdShadowUnitDim", text = "Darken Characters in Shade",
				   info = "Characters standing in the terrain's baked shadow are drawn darker. The original does this at Lowest and Low, where nothing else shades them.",
				   cost = NO_COST },
				C{ cvar = "hdSunShadows", text = "Soft Sun Shadows", vulkan = true, noMsaa = true,
				   other = "On Direct3D 9 the world shadows stay hard.",
				   tooltip = "Sun shadows that soften with distance from what casts them, like real sunlight.",
				   info = "Sun shadows that soften with distance from what casts them. Turns World Shadows on (at least 1024).",
				   cost = "about +3 to 4 ms GPU per frame, the most expensive setting." },
				S{ cvar = "hdSunStrength", parent = "hdSunShadows", text = "Sun Shadow Strength", minValue = 0, maxValue = 1, valueStep = 0.05, vulkan = true, noMsaa = true,
				   tooltip = "How dark the soft sun shadows are. 1 is full." },
			},
			{
				S{ cvar = "hdShadowWorld", text = "World Shadows", minValue = 0, maxValue = 2, valueStep = 1, names = SHADOW_MAP,
				   info = "Sun shadows of buildings, trees and objects, in three maps out to about 640 yards. 1024 or 2048 is each map's resolution. Soft Sun Shadows, fog light shafts and Contact Shadows need it (Soft Sun Shadows turn it on).",
				   cost = "1.8 ms CPU per frame at High (2048, drawn in tiles)." },
				C{ cvar = "hdShadowWorldUpdate", text = "Redraw Every Frame",
				   info = "Redraws the world shadows every frame (the original Ultra). Off: each map is redrawn in tiles only after you move, so shadows of moving things can lag.",
				   cost = "Ultra (with Everything) 3.6 ms CPU per frame, against 1.8 ms at High." },
				S{ cvar = "hdShadowWorldCasters", text = "World Shadow Detail", minValue = 0, maxValue = 2, valueStep = 1, names = SHADOW_CASTERS,
				   info = "What casts world shadows. Buildings: buildings, solid objects and terrain. Standard (original High): plus trees and foliage near you. Everything (original Ultra): plus foliage at all distances, and far characters when redrawn every frame." },
				S{ cvar = "hdShadowWorldDistance", text = "World Shadow Distance", minValue = 0.5, maxValue = 2, valueStep = 0.25, decimals = 2,
				   info = "Scales how far the three world shadow maps reach (1 = the original 40, 160 and 640 yards). Further is blurrier, as the maps keep their resolution." },
				-- Zeppelin F-223E: one contact shadow control per concept; vulkanAs swaps in the Vulkan setting (hdSunContact,
				-- part of the soft sun shadows, or on its own under Multisampling) for the Direct3D 9 one.
				C{ cvar = "hdContactShadow", text = "Contact Shadows",
				   vulkanAs = { cvar = "hdSunContact", parent = "hdSunShadows", msaaAlone = true },
				   tooltip = "Fine shadows where small things touch the ground, too small for the shadow maps." },
				C{ cvar = "hdContactShadowUnits", text = "Characters Too", sub = true, parent = "hdContactShadow", d3d9 = true,
				   tooltip = "Characters and creatures cast contact shadows as well as receiving them." },
				S{ cvar = "hdContactShadowStrength", parent = "hdContactShadow", text = "Contact Strength", minValue = 0, maxValue = 1, valueStep = 0.05,
				   vulkanAs = { cvar = "hdSunContactStrength", parent = "hdSunContact" },
				   tooltip = "How dark the contact shadows are. 1 is full, 0 is none." },
			},
		},
		status = {
			{ "Sun Shadows", "hdSunInfo", vulkan = true },
			{ "Contact Shadows", "hdContactShadowInfo", d3d9 = true },
		},
	},
	{
		-- Zeppelin F-223E: look at an area at any hour and in any weather. Client-side only (hdTime, hdWeather).
		name = "ZepVideoTimeWeatherPanel", title = "Time & Weather",
		subText = "See an area at any hour and in any weather. Only your screen changes: the server and other players do not.",
		columns = {
			{
				S{ cvar = "hdTime", text = "Time of Day", minValue = -1, maxValue = 23.5, valueStep = 0.5, clock = true, live = true,
				   info = "Forces the hour on your screen, so you can see an area by day, at dusk or at night. Real Time follows the server's clock.",
				   cost = NO_COST },
			},
			{
				S{ cvar = "hdWeather", text = "Weather", minValue = -1, maxValue = 3, valueStep = 1, names = WEATHER, live = true,
				   info = "Forces rain, snow, a sandstorm or a clear sky on your screen. Server follows the zone's own weather. Stays through zone changes until set back to Server." },
				S{ cvar = "hdWeatherIntensity", text = "Weather Strength", minValue = 0, maxValue = 1, valueStep = 0.05, live = true,
				   info = "How heavy the forced rain, snow or sand is, and how thick its fog." },
			},
		},
		status = {},
	},
	{
		name = "ZepVideoAtmospherePanel", title = "Atmosphere",
		subText = "Fog, glow, sun rays, colour grading, weather and screen effects.",
		columns = {
			{
				C{ cvar = "hdFog", text = "Volumetric Fog",
				   tooltip = "Fog that fills the air in layers, lit by the sun.",
				   cost = "about +2 to 3 ms GPU per frame." },
				C{ cvar = "hdFogShadow", text = "Light Shafts", sub = true, parent = "hdFog",
				   tooltip = "The sun's shadows reach into the fog: beams of light through trees and windows." },
				S{ cvar = "hdFogDensity", parent = "hdFog", text = "Fog Density", minValue = 0, maxValue = 3, valueStep = 0.05,
				   tooltip = "How thick the fog is. 1 is Forever's.", cost = NO_COST },
				S{ cvar = "hdFogSun", parent = "hdFog", text = "Fog Sunlight", minValue = 0, maxValue = 3, valueStep = 0.05,
				   tooltip = "How much the sun lights the fog. 1 is Forever's.", cost = NO_COST },
				C{ cvar = "hdGrade", text = "Colour Grading",
				   tooltip = "WoW Forever's colour grading for each place.", cost = NO_COST },
				S{ cvar = "hdGradeStrength", parent = "hdGrade", text = "Grading Strength", minValue = 0, maxValue = 2, valueStep = 0.05,
				   tooltip = "How strong the colour grading is. 1 is Forever's." },
				C{ cvar = "ffxGlow", text = "FULL_SCREEN_GLOW",
				   info = "The original full-screen glow: a soft bloom over the whole picture." },
				C{ cvar = "ffxDeath", text = "DEATH_EFFECT",
				   info = "The grey, blurred screen while you are a ghost." },
			},
			{
				C{ cvar = "hdBloom", text = "Bloom",
				   tooltip = "A soft glow around the brightest parts of the world." },
				S{ cvar = "hdBloomStrength", parent = "hdBloom", text = "Bloom", minValue = 0, maxValue = 3, valueStep = 0.05,
				   tooltip = "How strong the glow is. 1 is normal." },
				S{ cvar = "hdBloomThreshold", parent = "hdBloom", text = "Bloom Threshold", minValue = 0, maxValue = 1, valueStep = 0.01,
				   tooltip = "How bright a pixel must be before it glows. Lower values make more of the world glow.", cost = NO_COST },
				C{ cvar = "hdRays", text = "Sun Rays",
				   tooltip = "Shafts of light from the sun. Only drawn while the sun is on screen." },
				S{ cvar = "hdRaysStrength", parent = "hdRays", text = "Sun Rays", minValue = 0, maxValue = 3, valueStep = 0.05,
				   tooltip = "How strong the sun rays are. 1 is normal." },
				S{ cvar = "weatherDensity", text = "WEATHER_DETAIL", minValue = 0, maxValue = 3, valueStep = 1,
				   info = "How much rain, snow and dust is drawn when the zone has weather." },
				C{ cvar = "ffxNetherWorld", text = "Invisibility Effect",
				   tooltip = "Tints the screen while you are invisible or in the spirit world." },
			},
		},
		status = {
			{ "Fog", "hdFogInfo" },
			{ "Bloom and Rays", "hdBloomInfo" },
			{ "Grading", "hdGradeInfo" },
		},
	},
	{
		name = "ZepVideoTerrainPanel", title = "Terrain & Grass",
		subText = "Ground detail, ground clutter and the grass.",
		columns = {
			{
				S{ cvar = "environmentDetail", text = "ENVIRONMENT_DETAIL", minValue = 0.5, maxValue = 1.5, valueStep = 0.25,
				   info = "How far trees, rocks and other objects in the world are drawn, as a share of the view distance." },
				S{ label = "TerrainMip", text = "TERRAIN_MIP", minValue = 0, maxValue = 1, valueStep = 1, names = LOW_HIGH,
				   logout = 1, tooltip = OPTION_TOOLTIP_TERRAIN_TEXTURE, tooltipRequirement = OPTION_LOGOUT_REQUIREMENT, setup = TerrainMipSetup,
				   info = "How detailed the blending of the ground textures is. Takes effect after you log out." },
				S{ cvar = "groundEffectDensity", text = "GROUND_DENSITY", minValue = 16, maxValue = 64, valueStep = 8,
				   info = "How much grass and small ground clutter grows." },
				S{ cvar = "groundEffectDist", text = "GROUND_RADIUS", minValue = 70, maxValue = 140, valueStep = 10,
				   info = "How far away grass and ground clutter are drawn, in yards." },
			},
			{
				S{ cvar = "hdAlphaAA", text = "Foliage Anti-Aliasing", minValue = 0, maxValue = 2, valueStep = 1, names = ALPHA_AA, vulkan = true,
				   info = "Smooths the cut-out edges of grass, leaves, ferns and fences, which multisampling alone leaves jagged. Supersampled keeps the leaves their real thickness; Coverage is cheaper but softer and fills small gaps. Needs Multisampling above 1 (Display page)." },
				S{ cvar = "hdGrassLight", text = "Grass Shader", minValue = 0, maxValue = 2, valueStep = 1, names = GRASS_SHADER,
				   tooltip = "Blizzard: the original grass. HD: grass lit like the HD terrain, with wind and parting. HD Classic: the HD grass with the original lighting." },
				C{ cvar = "hdGrassWind", text = "Grass Wind",
				   tooltip = "Grass sways with the zone's wind, gusts and weather, and lies still under roofs and behind walls. Needs the HD grass shader." },
				S{ cvar = "hdGrassWindStrength", parent = "hdGrassWind", text = "Wind Strength", minValue = 0, maxValue = 3, valueStep = 0.1,
				   tooltip = "How hard the wind bends the grass. 1 is the zone's wind as authored." },
				C{ cvar = "hdGrassReact", text = "Grass Parting",
				   tooltip = "Grass bends away from players, creatures and mounts moving through it. Needs the HD grass shader." },
				S{ cvar = "hdGrassReactRadius", parent = "hdGrassReact", text = "Parting Radius", minValue = 0.5, maxValue = 4, valueStep = 0.25, decimals = 2,
				   tooltip = "How wide the grass parts around a unit, as a multiple of its size. Doubled while mounted." },
			},
		},
		status = {
			{ "Grass Shaders", "hdGrassInfo" },
			{ "Wind", "hdGrassWindInfo" },
			{ "Foliage AA", "hdAlphaAAInfo", vulkan = true },
		},
	},
	{
		-- Cataclysm water on Vulkan (its lava, hdCataMagma, registers only once the water runs and is on by default, so it has
		-- no control); WoW Forever's water on Direct3D 9.
		name = "ZepVideoWaterPanel", title = "Water",
		subText = "Water, lava and slime.",
		columns = {
			{
				C{ cvar = "hdCataWater", text = "Cataclysm Water", vulkan = true,
				   other = "On Direct3D 9 use HD Water.",
				   tooltip = "Cataclysm's water: reflections of the world and ripples.",
				   cost = "about +1 ms GPU per frame." },
				C{ cvar = "hdWater", text = "HD Water", d3d9 = true,
				   other = "On Vulkan use Cataclysm Water.",
				   tooltip = "WoW Forever's water: depth colour, reflections of the world and foam." },
				-- Zeppelin F-234: both renderers; on Vulkan they hang under Cataclysm Water (parentVulkan).
				C{ cvar = "hdWaterRipples", text = "Ripples", sub = true, parent = "hdWater", parentVulkan = "hdCataWater",
				   tooltip = "Rings spread on the water around players and creatures in it." },
				C{ cvar = "hdWaterWaves", text = "Waves", sub = true, parent = "hdWater", parentVulkan = "hdCataWater",
				   tooltip = "Moving waves on the water instead of the original flat normal maps. On Vulkan they reach about 250 yards around you; water further away keeps Cataclysm's own small waves." },
			},
			{
				S{ cvar = "hdWaterRippleStrength", parent = "hdWaterRipples", text = "Ripple Strength", minValue = 0, maxValue = 2, valueStep = 0.05,
				   tooltip = "How strong the ripples are. 1 is normal." },
				S{ cvar = "hdWaterWaveScale", parent = "hdWaterWaves", text = "Wave Height", minValue = 0, maxValue = 4, valueStep = 0.05,
				   tooltip = "How high the waves are. 1 is the water's own." },
			},
		},
		status = {
			{ "Cataclysm Water", "hdCataWaterInfo", vulkan = true },
			{ "HD Water", "hdWaterInfo", d3d9 = true },
		},
	},
	{
		name = "ZepVideoTexturesPanel", title = "Textures & Effects",
		subText = "Texture detail and filtering, spell effects and particles.",
		columns = {
			{
				S{ cvar = "BaseMip", text = "TEXTURE_DETAIL", minValue = 0, maxValue = 1, valueStep = 1, names = LOW_HIGH,
				   setup = BaseMipSetup, after = BaseMipAfter,
				   info = "The resolution of world and model textures. Low halves it." },
				S{ cvar = "textureFilteringMode", text = "ANISOTROPIC", minValue = 0, maxValue = 5, valueStep = 1, names = TEXTURE_FILTER,
				   gameRestart = 1, tooltipRequirement = OPTION_RESTART_REQUIREMENT,
				   info = "How sharp textures stay when seen at an angle or far away: bilinear, trilinear, then 2x to 16x anisotropic. Takes effect after a restart." },
				S{ cvar = "texLodBias", text = "Texture Sharpness", minValue = -1, maxValue = 1, valueStep = 0.1,
				   tooltip = "Texture mipmap bias. Negative values are sharper at a distance, positive values are blurrier and faster." },
				S{ cvar = "componentTextureLevel", text = "PLAYER_DETAIL", minValue = 8, maxValue = 9, valueStep = 1, names = PLAYER_TEXTURE,
				   gameRestart = 1, tooltipRequirement = OPTION_RESTART_REQUIREMENT, after = PlayerTextureAfter,
				   info = "The resolution of character textures (skin, hair and armour). Takes effect after a restart." },
				S{ cvar = "SkyCloudLOD", text = "Cloud Detail", minValue = 0, maxValue = 3, valueStep = 1,
				   tooltip = "Resolution of the sky's cloud layer (128 to 1024 pixels)." },
			},
			{
				S{ cvar = "spellEffectLevel", text = "Spell Detail", minValue = 0, maxValue = 9, valueStep = 1,
				   tooltip = "How many particles spell effects emit. 9 is full detail." },
				S{ cvar = "particleDensity", text = "PARTICLE_DENSITY", minValue = 0.1, maxValue = 1, valueStep = 0.1,
				   info = "How many particles fires, smoke, sparks and other effects in the world emit." },
				C{ cvar = "projectedTextures", text = "PROJECTED_TEXTURES",
				   info = "Spell circles and other effects painted onto the ground under them." },
				C{ cvar = "showfootprints", text = "Footprints",
				   tooltip = "Characters and creatures leave footprints on the ground." },
				C{ cvar = "showfootprintparticles", text = "Footstep Dust",
				   tooltip = "Footsteps kick up dust and splash particles." },
			},
		},
		status = {},
	},
	{
		name = "ZepVideoPerformancePanel", title = "Performance",
		subText = "Frame rate limits, the performance log and grass buffering.",
		columns = {
			{
				C{ cvar = "hdCataRenderPerf", text = "Performance Log",
				   tooltip = "Every 2 seconds, write the frame rate, frame times, CPU and GPU time and the settings in use to Logs\\CataRenderPerf.log, with the time of day, to compare renderers and settings.",
				   info = "Every 2 seconds, writes frame rate, frame times, CPU and GPU time and the settings in use to Logs\\CataRenderPerf.log, to compare settings." },
				C{ cvar = "scriptProfile", text = "Addon CPU in Log", sub = true, parent = "hdCataRenderPerf",
				   tooltip = "Also write each addon's CPU time to the performance log. Takes effect after a /reload or relog. Costs a little CPU while on, so turn it off when you are done.",
				   info = "Also writes each addon's CPU time to the performance log, after a /reload or relog. Costs a little CPU while on: turn it off when done." },
				S{ cvar = "hdGrassBuffers", text = "Grass Kept Ready", minValue = 0, maxValue = 4096, valueStep = 256, zeroText = "Off",
				   tooltip = "How many patches of grass are kept loaded on the graphics card instead of being rebuilt every frame. Higher is faster when there is a lot of grass. Off rebuilds it every frame.",
				   info = "How many patches of grass stay loaded on the graphics card instead of being rebuilt every frame. Higher is faster in thick grass.",
				   cost = "Off about +0.5 to 0.9 ms CPU per frame (grass rebuilt every frame)." },
			},
			{
				S{ cvar = "maxFPS", text = "Max Frame Rate", minValue = 0, maxValue = 300, valueStep = 10, zeroText = "Unlimited",
				   tooltip = "Frame rate cap while the game window has focus. 0 means unlimited." },
				S{ cvar = "maxFPSBk", text = "Max Background Frame Rate", minValue = 0, maxValue = 300, valueStep = 10, zeroText = "Unlimited",
				   tooltip = "Frame rate cap while the game window is in the background. 0 means unlimited." },
			},
		},
		status = {
			{ "Last Frame", "hdCataRenderPerfInfo" },
		},
	},
};

-- The Vulkan effects register their CVars only when Vulkan runs (hdAOQuality is one of them).
local function VulkanRunning ()
	return GetCVar("hdAOQuality") ~= nil;
end

local function RendererName ()
	return strlower(GetCVar("gxApi") or "") == "vulkan" and "Vulkan" or "Direct3D 9";
end

local function ForRenderer (entry)
	return not ((entry.d3d9 and VulkanRunning()) or (entry.vulkan and not VulkanRunning()));
end

-- Zeppelin F-223A: the client reports it in hdSunInfo ("... MSAA is on ..."), so this is the running state, not a
-- Multisampling value still waiting for a restart.
local function MsaaRunning ()
	return VulkanRunning() and strfind(GetCVar("hdSunInfo") or "", "MSAA is on", 1, true) ~= nil;
end

-- Zeppelin F-223E: an entry with vulkanAs stands for another setting under Vulkan (same control, the Vulkan CVar).
local function Resolve (entry)
	if ( not entry.vulkanAs or not VulkanRunning() ) then
		return entry;
	end
	local resolved = { baseCvar = entry.cvar };
	for k, v in pairs(entry) do resolved[k] = v; end
	for k, v in pairs(entry.vulkanAs) do resolved[k] = v; end
	resolved.vulkanAs = nil;
	return resolved;
end

-- Usable now: the running renderer has it, and Multisampling does not switch it off (entry.noMsaa).
local function Usable (entry)
	return ForRenderer(entry) and not (entry.noMsaa and MsaaRunning());
end

local function Exists (entry)
	if ( not ForRenderer(entry) ) then
		return false;
	end
	return entry.label or entry.key or GetCVar(entry.cvar) ~= nil;
end

-- entry.text is either a stock global string name (FARCLIP) or the label itself.
local function Label (entry)
	local text = _G[entry.text];
	return type(text) == "string" and text or entry.text;
end

local function FormatValue (entry, value)
	if ( entry.clock ) then
		-- Zeppelin F-223E: hours as a clock; below 0 the client follows the server's time.
		if ( value < 0 ) then
			return "Real Time";
		end
		local minutes = floor(value * 60 + 0.5);
		return format("%02d:%02d", floor(minutes / 60), minutes % 60);
	elseif ( entry.zeroText and value < 0.5 ) then
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
	_G[self:GetName().."Text"]:SetText(Label(self.zepEntry)..": "..FormatValue(self.zepEntry, value));
end

local function Slider_OnValueChanged (self, value)
	self.newValue = value;
	Slider_UpdateText(self, value);
	-- Zeppelin F-223E: a preview control (time of day, weather) takes effect while it is dragged.
	if ( self.zepEntry.live and self:GetParent():IsVisible() ) then
		SetCVar(self.zepEntry.cvar, value);
	end
	if ( self:GetParent():IsVisible() ) then
		VideoOptionsFrameApply:Enable();
	end
end

-- [[ The explanation box ]] --

-- Only a greyed-out control (one for the other renderer, or one Multisampling switches off) gets this line.
local function Needs (entry)
	if ( Usable(entry) ) then
		return "";
	elseif ( ForRenderer(entry) ) then
		return "|cffff2020Needs Multisampling off|r (Display page).";
	end
	local text = "|cffff2020Needs "..(entry.vulkan and "Vulkan" or "Direct3D 9")..".|r";
	return entry.other and (text.." "..entry.other) or text;
end

local function Explain (entry)
	local text = entry.info or entry.tooltip or _G["OPTION_TOOLTIP_"..entry.text] or "";
	if ( entry.tooltipRequirement and not entry.info ) then
		text = text.." "..entry.tooltipRequirement;
	end
	return text;
end

local function ShowStatus (panel)
	local box = panel.zepBox;
	box.info:Hide();
	box.status:Show();
	box.wait = 0;
end

local function ShowInfo (panel, entry)
	local box = panel.zepBox;
	box.name:SetText(Label(entry));
	box.text:SetText(Explain(entry));
	box.works:SetText(Needs(entry));
	if ( entry.cvar and benchResults[entry.cvar] ) then
		box.cost:SetText("|cffffd100Measured on this PC:|r "..benchResults[entry.cvar].text);
	elseif ( entry.cost ) then
		box.cost:SetText("|cffffd100Cost|r ("..RIG.."): "..entry.cost);
	else
		box.cost:SetText("|cffffd100Cost:|r not measured yet.");
	end
	box.status:Hide();
	box.info:Show();
end

local function HookExplain (panel, control, entry)
	-- F-234: the explanation box replaces the hover tooltip on the themed pages (user, 2026-11-01): the stock template's
	-- OnEnter shows GameTooltip first, this hook runs after it and hides it again.
	control:HookScript("OnEnter", function () GameTooltip:Hide(); ShowInfo(panel, entry); end);
	control:HookScript("OnLeave", function () ShowStatus(panel); end);
end

local function BuildBox (panel)
	local name = panel:GetName();
	local box = CreateFrame("Frame", name.."Box", panel, "OptionsBoxTemplate");
	box:SetPoint("BOTTOMLEFT", 16, 8);
	box:SetPoint("BOTTOMRIGHT", -16, 8);
	box:SetHeight(INFO_HEIGHT);
	box:SetBackdropBorderColor(0.4, 0.4, 0.4);
	box:SetBackdropColor(0.15, 0.15, 0.15);
	_G[name.."BoxTitle"]:SetText("");
	panel.zepBox = box;

	-- What the control under the mouse does.
	local info = CreateFrame("Frame", nil, box);
	info:SetAllPoints();
	info:Hide();
	box.info = info;
	box.name = info:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	box.name:SetPoint("TOPLEFT", 10, -8);
	box.name:SetPoint("RIGHT", -10, 0);
	box.name:SetJustifyH("LEFT");
	box.text = info:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
	box.text:SetPoint("TOPLEFT", box.name, "BOTTOMLEFT", 0, -3);
	box.text:SetPoint("RIGHT", -10, 0);
	box.text:SetHeight(40);
	box.text:SetJustifyH("LEFT");
	box.text:SetJustifyV("TOP");
	box.works = info:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
	box.works:SetPoint("TOPLEFT", box.text, "BOTTOMLEFT", 0, -1);
	box.works:SetPoint("RIGHT", -10, 0);
	box.works:SetHeight(11);
	box.works:SetJustifyH("LEFT");
	box.cost = info:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
	box.cost:SetPoint("TOPLEFT", box.works, "BOTTOMLEFT", 0, 0);
	box.cost:SetPoint("RIGHT", -10, 0);
	box.cost:SetHeight(26);
	box.cost:SetJustifyH("LEFT");
	box.cost:SetJustifyV("TOP");

	-- Otherwise: what each effect on the page reports it is doing right now (its read-only ...Info CVar). One line
	-- each, cut short rather than wrapped, so a long report cannot push the others out of the box.
	local status = CreateFrame("Frame", nil, box);
	status:SetAllPoints();
	box.status = status;
	local header = status:CreateFontString(nil, "ARTWORK", "GameFontNormal");
	header:SetPoint("TOPLEFT", 10, -8);
	header:SetJustifyH("LEFT");
	box.header = header;
	local hint = status:CreateFontString(nil, "ARTWORK", "GameFontDisableSmall");
	hint:SetPoint("TOPRIGHT", -10, -9);
	hint:SetJustifyH("RIGHT");
	box.hint = hint;
	box.lines = {};
	for i = 1, STATUS_LINES do
		local line = status:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
		line:SetHeight(12);
		line:SetJustifyH("LEFT");
		line:SetPoint("TOPLEFT", (i == 1) and header or box.lines[i - 1], "BOTTOMLEFT", 0, (i == 1) and -3 or 0);
		line:SetPoint("RIGHT", -10, 0);
		box.lines[i] = line;
	end

	box.wait = 0;
	status:SetScript("OnUpdate", function (self, elapsed)
		box.wait = box.wait - elapsed;
		if ( box.wait > 0 ) then
			return;
		end
		box.wait = STATUS_INTERVAL;
		local rows = panel.zepStatus or {};
		if ( #rows > 0 ) then
			header:SetText("Status ("..RendererName()..")");
			hint:SetText("Point at a setting for details.");
		else
			header:SetText("Renderer: "..RendererName());
			hint:SetText("");
			box.lines[1]:SetText("Point at a setting to see what it does and what it costs.");
		end
		for i = (#rows > 0) and 1 or 2, STATUS_LINES do
			local row = rows[i];
			box.lines[i]:SetText(row and (row[1]..": "..(GetCVar(row[2]) or "not started")) or "");
		end
	end);
end

-- [[ Controls ]] --

local function AddCheck (panel, entry, x, y)
	local check = CreateFrame("CheckButton", panel:GetName().."Check"..(#panel.controls + 1), panel, "VideoOptionsSmallCheckButtonTemplate");
	local sub = entry.sub and not (entry.msaaAlone and MsaaRunning());
	check:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", x + (sub and 16 or 0), y);
	check.type = CONTROLTYPE_CHECKBOX;
	check.cvar = entry.cvar;
	check.label = entry.label;
	panel.options[entry.cvar or entry.label] = entry;
	BlizzardOptionsPanel_RegisterControl(check, panel);
	return check;
end

local function AddSlider (panel, entry, x, y)
	local slider = CreateFrame("Slider", panel:GetName().."Slider"..(#panel.controls + 1), panel, "OptionsSliderTemplate");
	slider:SetWidth(SLIDER_WIDTH);
	slider:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", x + 4, y - SLIDER_LABEL);
	slider.type = CONTROLTYPE_SLIDER;
	slider.cvar = entry.cvar;
	slider.label = entry.label;
	slider.zepEntry = entry;
	slider.SetDisplayValue = slider.SetValue;
	slider.SetValue = function (self, value)
		self:SetDisplayValue(value);
		BlizzardOptionsPanel_SetCVarSafe(self.cvar, value);
	end
	if ( entry.setup ) then
		entry.setup(slider);
	end
	slider:SetScript("OnValueChanged", Slider_OnValueChanged);
	panel.options[entry.cvar or entry.label] = entry;
	BlizzardOptionsPanel_RegisterControl(slider, panel);
	return slider;
end

-- A control for the other renderer: drawn greyed out, not registered with the panel (its CVar may not exist under this
-- renderer, so Okay, Cancel, Defaults and Apply must never touch it).
local function AddGreyed (panel, entry, x, y)
	panel.zepGreyed = (panel.zepGreyed or 0) + 1;
	local name = panel:GetName().."Greyed"..panel.zepGreyed;
	local control;
	if ( entry.kind == CONTROLTYPE_CHECKBOX ) then
		control = CreateFrame("CheckButton", name, panel, "VideoOptionsSmallCheckButtonTemplate");
		control:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", x + (entry.sub and 16 or 0), y);
		_G[name.."Text"]:SetText(Label(entry));
		control:SetChecked(false);
		BlizzardOptionsPanel_CheckButton_Disable(control);
	else
		control = CreateFrame("Slider", name, panel, "OptionsSliderTemplate");
		control:SetWidth(SLIDER_WIDTH);
		control:SetPoint("TOPLEFT", panel.subText, "BOTTOMLEFT", x + 4, y - SLIDER_LABEL);
		control:SetMinMaxValues(entry.minValue, entry.maxValue);
		control:SetValueStep(entry.valueStep);
		control:SetValue(entry.minValue);
		_G[name.."Text"]:SetText(Label(entry));
		_G[name.."Low"]:SetText(FormatValue(entry, entry.minValue));
		_G[name.."High"]:SetText(FormatValue(entry, entry.maxValue));
		BlizzardOptionsPanel_Slider_Disable(control);
	end
	return control;
end

local function BuildControls (panel)
	local def = panel.zepDef;
	-- Setting up the sliders runs their OnValueChanged while the page is visible, which would light up Apply.
	local applyWasEnabled = VideoOptionsFrameApply:IsEnabled() == 1 or VideoOptionsFrameApply:IsEnabled() == true;
	local byKey, greyed = {}, {};
	for column, entries in ipairs(def.columns) do
		local x, y = COLUMN_X[column], -10;
		-- The running renderer's controls first, then the other renderer's greyed out at the foot of the column, so a
		-- shared control never sits under the other renderer's parent (Ripples under HD Water on Vulkan).
		local ordered = {};
		for _, entry in ipairs(entries) do entry = Resolve(entry); if ( Usable(entry) ) then tinsert(ordered, entry); end end
		for _, entry in ipairs(entries) do entry = Resolve(entry); if ( not Usable(entry) ) then tinsert(ordered, entry); end end
		for _, entry in ipairs(ordered) do
			-- Zeppelin F-234: a control shared by both renderers can hang under a different parent on Vulkan.
			local parent = (entry.parentVulkan and VulkanRunning()) and entry.parentVulkan or entry.parent;
			if ( entry.msaaAlone and MsaaRunning() ) then
				parent = nil;
			end
			if ( not Usable(entry) and (not parent or greyed[parent] or byKey[parent]) ) then
				greyed[entry.cvar or entry.label] = AddGreyed(panel, entry, x, y);
				if ( entry.baseCvar ) then greyed[entry.baseCvar] = greyed[entry.cvar]; end
				y = y - (entry.kind == CONTROLTYPE_CHECKBOX and CHECK_HEIGHT or SLIDER_HEIGHT);
				HookExplain(panel, greyed[entry.cvar or entry.label], entry);
			elseif ( Exists(entry) and (not parent or byKey[parent]) ) then
				local control;
				if ( entry.kind == CONTROLTYPE_CHECKBOX ) then
					control = AddCheck(panel, entry, x, y);
					y = y - CHECK_HEIGHT;
				else
					control = AddSlider(panel, entry, x, y);
					y = y - SLIDER_HEIGHT;
				end
				byKey[entry.cvar or entry.label] = control;
				if ( entry.baseCvar ) then byKey[entry.baseCvar] = control; end -- children name the Direct3D 9 setting
				if ( parent ) then
					BlizzardOptionsPanel_SetupDependentControl(byKey[parent], control);
				end
				HookExplain(panel, control, entry);
			end
		end
	end
	panel.zepByKey = byKey;

	-- The same set-up the stock panels get on PLAYER_ENTERING_WORLD (labels, tooltips, ranges, values).
	BlizzardOptionsPanel_OnEvent(panel, "PLAYER_ENTERING_WORLD");
	for _, control in ipairs(panel.controls) do
		local entry = control.zepEntry;
		if ( entry ) then
			if ( entry.after ) then
				entry.after(control);
			end
			local minValue, maxValue = control:GetMinMaxValues();
			_G[control:GetName().."Low"]:SetText(FormatValue(entry, minValue));
			_G[control:GetName().."High"]:SetText(FormatValue(entry, maxValue));
			Slider_UpdateText(control, control:GetValue());
		end
	end
	panel.refresh(panel);
	if ( not applyWasEnabled ) then
		VideoOptionsFrameApply:Disable();
	end
end

local function BuildPage (def)
	local panel = CreateFrame("Frame", def.name, VideoOptionsFramePanelContainer);
	panel.name = def.title;
	panel.options = {};
	panel.controls = {};
	panel.zepDef = def;
	panel:Hide();

	local titleText = panel:CreateFontString(def.name.."Title", "ARTWORK", "GameFontNormalLarge");
	titleText:SetPoint("TOPLEFT", 16, -16);
	titleText:SetText(def.title);

	panel.subText = panel:CreateFontString(def.name.."SubText", "ARTWORK", "GameFontHighlightSmall");
	panel.subText:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -8);
	panel.subText:SetPoint("RIGHT", -32, 0);
	panel.subText:SetJustifyH("LEFT");
	panel.subText:SetText(def.subText);

	BuildBox(panel);

	panel:SetScript("OnShow", function (self)
		if ( not self.zepBuilt ) then
			self.zepBuilt = true;
			self.zepStatus = {};
			for _, row in ipairs(def.status) do
				if ( ForRenderer(row) ) then
					tinsert(self.zepStatus, row);
				end
			end
			BuildControls(self);
		end
		ShowStatus(self);
	end);

	VideoOptionsPanel_OnLoad(panel, nil, nil, nil, def.refresh);
	return panel;
end

-- [[ View distance lock ]] --
-- Cataclysm View Distance takes the far clip from its View Quality preset and the horizon from that, so View Distance
-- and Horizon Distance do nothing while it is on: greyed out then. The check box's unsaved state counts.
local function LockViewDistance (panel)
	local byKey = panel.zepByKey;
	if ( not byKey ) then
		return;
	end
	local cata = byKey.hdCataViewDistance;
	local locked = cata and cata:GetChecked() and true or false;
	for _, key in ipairs({ "farclip", "horizonFarclipScale" }) do
		local slider = byKey[key];
		if ( slider ) then
			if ( locked ) then
				BlizzardOptionsPanel_Slider_Disable(slider);
			else
				BlizzardOptionsPanel_Slider_Enable(slider);
			end
		end
	end
	if ( cata and not cata.zepLockHooked ) then
		cata.zepLockHooked = true;
		cata:HookScript("OnClick", function () LockViewDistance(panel); end);
	end
end

PAGES[1].refresh = function (self)
	BlizzardOptionsPanel_Refresh(self);
	LockViewDistance(self);
end

local built = {};
for _, def in ipairs(PAGES) do
	tinsert(built, BuildPage(def));
end

-- [[ Display: the stock Resolution page plus the renderer switch ]] --
-- The renderer has no 0/1 CVar of its own: the check box writes gxApi and the stock restart alert follows. It sits in
-- the free slot under Disable Resize, level with Fix Input Lag.
local display = VideoOptionsResolutionPanel;
display.name = "Display";
VideoOptionsResolutionPanelTitle:SetText("Display");
display.options[VULKAN_KEY] = { text = "Vulkan Renderer", default = "0", gameRestart = 1,
	tooltip = "Draw the game with Vulkan instead of Direct3D 9. If Vulkan cannot start, the game falls back to Direct3D 9. The HD effects on the other pages say which renderer they need.",
	tooltipRequirement = OPTION_RESTART_REQUIREMENT };
local vulkan = CreateFrame("CheckButton", "VideoOptionsResolutionPanelZepVulkan", display, "VideoOptionsSmallCheckButtonTemplate");
vulkan:SetPoint("TOPLEFT", VideoOptionsResolutionPanelDisableResize, "BOTTOMLEFT", -16, -4);
vulkan.type = CONTROLTYPE_CHECKBOX;
vulkan.label = VULKAN_KEY;
vulkan.GetValue = function ()
	return strlower(GetCVar("gxApi") or "") == "vulkan" and "1" or "0";
end
BlizzardOptionsPanel_RegisterControl(vulkan, display);
display:HookScript("OnEvent", function (self, event)
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		vulkan.SetValue = function (self, value)
			self.value = value;
			SetCVar("gxApi", value == "1" and "vulkan" or "d3d9");
		end
	end
end);

-- [[ Category list ]] --
-- Display, the themed pages, then whatever else registered (stereo, loot beam, ...). The stock Effects page leaves the
-- list, so its Okay / Cancel / Defaults never run on controls nobody can see.
local list = VideoOptionsFrame.categoryList;
local rest = {};
for _, panel in ipairs(list) do
	if ( panel ~= display and panel ~= VideoOptionsEffectsPanel ) then
		local ours = false;
		for _, page in ipairs(built) do
			if ( page == panel ) then
				ours = true;
			end
		end
		if ( not ours ) then
			tinsert(rest, panel);
		end
	end
end
wipe(list);
tinsert(list, display);
for _, page in ipairs(built) do
	tinsert(list, page);
end
for _, panel in ipairs(rest) do
	tinsert(list, panel);
end
VideoOptionsEffectsPanel:Hide();
VideoOptionsFrameCategoryFrame:update();

-- [[ Zeppelin F-223A: Measure Costs ]] --
-- Flips every setting on the themed pages between its lowest and highest value while the player stands still and
-- times the frames: the cost in frames per second on this PC. Two rounds, low-high then high-low, so a slow drift
-- in the scene cancels. Each setting goes back to its own value afterwards. Results show in each setting's box
-- ("Measured on this PC") and are written to Logs\Bench.log (hdBenchLog). Skipped: the Performance and Time &
-- Weather pages, settings that need a logout or reload textures, and children whose parent is off.
-- Each phase: BENCH_SETTLE seconds and BENCH_SKIP frames are thrown away (a setting's first frames can hitch:
-- shaders compiling, terrain loading), then at least BENCH_MEASURE seconds and BENCH_MIN frames are kept, and the
-- phase's figure is the median frame time, so one long frame cannot swing it.
local BENCH_SETTLE, BENCH_MEASURE, BENCH_SKIP, BENCH_MIN = 0.75, 2.5, 5, 5;
local bench = CreateFrame("Frame");
bench:Hide();
local benchText = UIParent:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge");
benchText:SetPoint("TOP", UIParent, "TOP", 0, -120);
benchText:Hide();

local function BenchLog (line)
	if ( GetCVar("hdBenchLog") ) then -- the client's Logs\Bench.log writer (HdCataRenderPerf.cpp)
		SetCVar("hdBenchLog", line);
	end
end

local function BenchCandidates ()
	local tests = {};
	for _, def in ipairs(PAGES) do
		if ( def.name ~= "ZepVideoPerformancePanel" and def.name ~= "ZepVideoTimeWeatherPanel" ) then
			for _, entries in ipairs(def.columns) do
				for _, raw in ipairs(entries) do
					local e = Resolve(raw);
					local parent = (e.parentVulkan and VulkanRunning()) and e.parentVulkan or e.parent;
					if ( e.msaaAlone and MsaaRunning() ) then
						parent = nil;
					end
					if ( e.cvar and not e.logout and not e.setup and not e.label and not e.key and not e.live
						and Usable(e) and Exists(e) and (not parent or GetCVar(parent) ~= "0") ) then
						local low, high = 0, 1;
						if ( e.kind == CONTROLTYPE_SLIDER ) then
							low, high = e.minValue, e.maxValue;
						end
						if ( low ~= high ) then
							tinsert(tests, { entry = e, low = low, high = high, original = GetCVar(e.cvar), ms = { {}, {} } });
						end
					end
				end
			end
		end
	end
	return tests;
end

local function BenchValueName (e, value)
	if ( e.kind == CONTROLTYPE_CHECKBOX ) then
		return value == 0 and "Off" or "On";
	end
	return FormatValue(e, value);
end

local function BenchFinish (cancelled)
	local run = bench.run;
	bench:Hide();
	benchText:Hide();
	if ( not run ) then
		return;
	end
	local test = run.tests[run.index];
	if ( test ) then
		SetCVar(test.entry.cvar, test.original);
	end
	SetCVar("maxFPS", run.maxFPS);
	bench.run = nil;
	if ( cancelled ) then
		DEFAULT_CHAT_FRAME:AddMessage("|cffffd100Measure Costs:|r cancelled; settings restored.");
		BenchLog("bench cancelled");
		return;
	end
	local ranked = {};
	for _, t in ipairs(run.tests) do
		if ( t.result ) then
			tinsert(ranked, t);
		end
	end
	sort(ranked, function (a, b) return a.result.costFps > b.result.costFps; end);
	DEFAULT_CHAT_FRAME:AddMessage(format("|cffffd100Measure Costs:|r done, %d settings. Most expensive (lowest to highest):", #ranked));
	for i = 1, min(10, #ranked) do
		local t = ranked[i];
		DEFAULT_CHAT_FRAME:AddMessage(format("  %s: %s", Label(t.entry), benchResults[t.entry.cvar].text));
	end
	DEFAULT_CHAT_FRAME:AddMessage("Point at a setting in Video Options to see its measured cost. All results: Logs\\Bench.log.");
	BenchLog("bench done");
end

local function BenchPhaseValue (run)
	local t = run.tests[run.index];
	-- Round 1 low then high, round 2 high then low.
	local high = (run.round == 1) == (run.phase == 2);
	return t, high and t.high or t.low, high and 2 or 1;
end

local function BenchStartPhase (run)
	local t, value = BenchPhaseValue(run);
	SetCVar(t.entry.cvar, value);
	run.elapsed, run.measured, run.seen = 0, 0, 0;
	run.samples = {};
	benchText:SetText(format("Measuring costs: %s (%d of %d)\nStand still and do not move the camera.  /zepbench stop to cancel",
		Label(t.entry), run.index, #run.tests));
end

local function BenchResult (run, t)
	local function Mean (list) local s = 0; for _, v in ipairs(list) do s = s + v; end return #list > 0 and s / #list or 0; end
	local msLow, msHigh = Mean(t.ms[1]), Mean(t.ms[2]);
	if ( msLow <= 0 or msHigh <= 0 ) then
		return;
	end
	local fpsLow, fpsHigh = 1000 / msLow, 1000 / msHigh;
	local costFps, costMs = fpsLow - fpsHigh, msHigh - msLow;
	local e = t.entry;
	local change = BenchValueName(e, t.low).." to "..BenchValueName(e, t.high);
	local text;
	if ( math.abs(costFps) < 0.5 and math.abs(costMs) < 0.05 ) then
		text = format("%s: no measurable cost (%.0f fps).", change, fpsLow);
	else
		text = format("%s: %s%.1f fps (%.0f to %.0f fps), %s%.2f ms a frame.", change, costFps >= 0 and "-" or "+",
			math.abs(costFps), fpsLow, fpsHigh, costMs >= 0 and "+" or "-", math.abs(costMs));
	end
	t.result = { costFps = costFps };
	benchResults[e.cvar] = { text = text };
	BenchLog(format("bench cvar=%s label=\"%s\" low=%s high=%s fps_low=%.1f fps_high=%.1f ms_low=%.3f ms_high=%.3f cost_fps=%.1f cost_ms=%.3f",
		e.cvar, Label(e), tostring(t.low), tostring(t.high), fpsLow, fpsHigh, msLow, msHigh, costFps, costMs));
end

bench:SetScript("OnUpdate", function (self, elapsed)
	local run = self.run;
	if ( not run ) then
		self:Hide();
		return;
	end
	run.elapsed = run.elapsed + elapsed;
	run.seen = run.seen + 1;
	if ( run.elapsed <= BENCH_SETTLE or run.seen <= BENCH_SKIP ) then
		return;
	end
	tinsert(run.samples, elapsed * 1000);
	run.measured = run.measured + elapsed;
	if ( run.measured < BENCH_MEASURE or #run.samples < BENCH_MIN ) then
		return;
	end
	local t, _, slot = BenchPhaseValue(run);
	sort(run.samples);
	tinsert(t.ms[slot], run.samples[floor((#run.samples + 1) / 2)]);
	run.phase = run.phase + 1;
	if ( run.phase > 2 ) then
		run.phase = 1;
		run.round = run.round + 1;
		if ( run.round > run.rounds ) then
			SetCVar(t.entry.cvar, t.original);
			BenchResult(run, t);
			run.round = 1;
			run.index = run.index + 1;
			if ( run.index > #run.tests ) then
				BenchFinish(false);
				return;
			end
		end
	end
	BenchStartPhase(run);
end);

bench:RegisterEvent("PLAYER_LEAVING_WORLD");
bench:SetScript("OnEvent", function () if ( bench.run ) then BenchFinish(true); end end);

local function BenchStart (rounds)
	if ( bench.run ) then
		return;
	end
	local tests = BenchCandidates();
	if ( #tests == 0 ) then
		DEFAULT_CHAT_FRAME:AddMessage("|cffffd100Measure Costs:|r nothing to measure (open Video Options once first).");
		return;
	end
	if ( VideoOptionsFrame:IsShown() ) then
		VideoOptionsFrame:Hide();
	end
	local run = { tests = tests, index = 1, round = 1, phase = 1, rounds = rounds, maxFPS = GetCVar("maxFPS") };
	SetCVar("maxFPS", "0");
	local seconds = #tests * rounds * 2 * (BENCH_SETTLE + BENCH_MEASURE);
	DEFAULT_CHAT_FRAME:AddMessage(format("|cffffd100Measure Costs:|r %d settings, about %d minutes. Stand still somewhere typical and do not touch the mouse.", #tests, ceil(seconds / 60)));
	if ( GetCVar("gxVSync") == "1" ) then
		DEFAULT_CHAT_FRAME:AddMessage("|cffff2020VSync is on:|r the frame rate cannot go above your screen's refresh, so costs below that are hidden. Turn VSync off (Display page, restart) for true figures.");
	end
	BenchLog(format("bench start renderer=%s resolution=%s msaa=%s vsync=%s zone=\"%s\" settings=%d rounds=%d", RendererName(),
		tostring(GetCVar("gxResolution")), tostring(GetCVar("gxMultisample")), tostring(GetCVar("gxVSync")),
		tostring(GetRealZoneText()), #tests, rounds));
	bench.run = run;
	benchText:Show();
	BenchStartPhase(run);
	bench:Show();
end

SLASH_ZEPBENCH1 = "/zepbench";
SlashCmdList.ZEPBENCH = function (msg)
	msg = strlower(strtrim(msg or ""));
	if ( msg == "stop" ) then
		BenchFinish(true);
	else
		BenchStart(msg == "quick" and 1 or 2);
	end
end

do
	local panel = ZepVideoPerformancePanel;
	local button = CreateFrame("Button", "ZepBenchButton", panel, "UIPanelButtonTemplate");
	button:SetWidth(170);
	button:SetHeight(22);
	button:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -16, INFO_HEIGHT + 16);
	button:SetText("Measure Costs");
	button:SetScript("OnClick", function ()
		if ( VideoOptionsFrameApply:IsEnabled() == 1 or VideoOptionsFrameApply:IsEnabled() == true ) then
			DEFAULT_CHAT_FRAME:AddMessage("|cffffd100Measure Costs:|r apply or cancel your changes first.");
			return;
		end
		BenchStart(2);
	end);
	local info = { text = "Measure Costs",
		info = "Measures what each setting on these pages costs in frames per second on this PC: each is switched between its lowest and highest value while you stand still. Takes several minutes; /zepbench quick halves it. Results show in each setting's box.",
		cost = "nothing afterwards: every setting goes back to its own value." };
	button:HookScript("OnEnter", function () ShowInfo(panel, info); end);
	button:HookScript("OnLeave", function () ShowStatus(panel); end);
end
