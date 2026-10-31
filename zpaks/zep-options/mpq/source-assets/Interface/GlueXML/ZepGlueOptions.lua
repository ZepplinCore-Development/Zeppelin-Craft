-- F-234: a "Renderer" page in the login screen's Video Options, so the renderer can be chosen before entering the
-- world (the in-game HD Effects page has the same switch). Built-in glue UI loaded from ZepGlueXML.toc.
-- The renderer has no 0/1 CVar: the check box writes gxApi (vulkan / d3d9), and the stock restart alert follows.
-- An exe without the Vulkan renderer (no hdCataViewDistance) gets no page.
if ( not GetCVar("hdCataViewDistance") ) then
	return;
end

local VULKAN_KEY = "zepVulkanRenderer";

local panel = CreateFrame("Frame", "ZepGlueRendererPanel", VideoOptionsFramePanelContainer);
panel.name = "Renderer";
panel.options = {
	[VULKAN_KEY] = { text = "Vulkan Renderer", default = "0", gameRestart = 1,
		tooltip = "Draw the game with Vulkan instead of Direct3D 9. If Vulkan cannot start, the game falls back to Direct3D 9.",
		tooltipRequirement = OPTION_RESTART_REQUIREMENT },
};
panel:Hide();

local title = panel:CreateFontString("ZepGlueRendererPanelTitle", "ARTWORK", "OptionsFontLarge");
title:SetPoint("TOPLEFT", 16, -16);
title:SetText("Renderer");

local subText = panel:CreateFontString("ZepGlueRendererPanelSubText", "ARTWORK", "GlueFontHighlightSmall");
subText:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8);
subText:SetPoint("RIGHT", -32, 0);
subText:SetJustifyH("LEFT");
subText:SetJustifyV("TOP");
subText:SetHeight(32);
subText:SetText("Which graphics API draws the game. The HD effects are set in game, under Video Options.");

local check = CreateFrame("CheckButton", "ZepGlueRendererPanelVulkan", panel, "OptionsSmallCheckButtonTemplate");
check:SetPoint("TOPLEFT", subText, "BOTTOMLEFT", 0, -16);
check.type = CONTROLTYPE_CHECKBOX;
check.label = VULKAN_KEY;
check.GetValue = function ()
	return strlower(GetCVar("gxApi") or "") == "vulkan" and "1" or "0";
end
BlizzardOptionsPanel_RegisterControl(check, panel);

VideoOptionsPanel_OnLoad(panel);

-- After the stock set-up (labels, tooltips, values): the check box writes gxApi instead of a CVar of its own.
panel:HookScript("OnEvent", function (self, event)
	if ( event ~= "SET_GLUE_SCREEN" ) then
		return;
	end
	check.SetValue = function (self, value)
		self.value = value;
		SetCVar("gxApi", value == "1" and "vulkan" or "d3d9");
	end
	BlizzardOptionsPanel_Refresh(self);
end);
