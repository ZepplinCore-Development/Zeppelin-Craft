-- Zep Terrain Test (F-196): manually drive WarcraftXL's terrain-phase swap for testing.
-- The framework registers these globals (only when the 'wxl-assets' marker is present next to Wow.exe):
--     WarcraftXL_SetTerrainPhase("<mapDir>")   -- overlay a phase-variant map directory
--     WarcraftXL_ClearTerrainPhase()           -- restore the base map
-- This addon is a thin front-end so you can test the visual swap without the server/ALE in the loop.

local PREFIX = "|cff33ff99ZepTerrain|r: "
local function msg(s) DEFAULT_CHAT_FRAME:AddMessage(PREFIX .. s) end

-- Convenience presets so you can type a short name instead of the full map dir.
-- Update these to whatever the map-1-aligned phase directories end up being named.
local PRESETS = {
    ["1"]  = "LostIslesPhase1",
    ["2"]  = "LostIslesPhase2",
    p1     = "LostIslesPhase1",
    p2     = "LostIslesPhase2",
}

local function framework()
    return type(WarcraftXL_SetTerrainPhase) == "function"
end

local function setPhase(dir)
    if not framework() then
        msg("|cffff5555framework not loaded|r — is d3d9.dll present and the 'wxl-assets' marker set next to Wow.exe?")
        return
    end
    WarcraftXL_SetTerrainPhase(dir)
    msg("terrain phase -> |cffffff00" .. dir .. "|r")
end

local function clearPhase()
    if not framework() then
        msg("|cffff5555framework not loaded|r")
        return
    end
    WarcraftXL_ClearTerrainPhase()
    msg("terrain phase |cffffff00cleared|r (base restored)")
end

SLASH_ZEPTERRAIN1 = "/terrain"
SLASH_ZEPTERRAIN2 = "/tp"
SlashCmdList["ZEPTERRAIN"] = function(input)
    local cmd, arg = (input or ""):match("^(%S*)%s*(.-)%s*$")
    cmd = (cmd or ""):lower()

    if cmd == "clear" or cmd == "off" then
        clearPhase()
    elseif cmd == "set" and arg ~= "" then
        setPhase(arg)
    elseif PRESETS[cmd] then
        setPhase(PRESETS[cmd])
    elseif cmd == "status" then
        msg(framework() and "framework |cff55ff55loaded|r (WarcraftXL_SetTerrainPhase available)"
                          or "framework |cffff5555NOT loaded|r")
    else
        msg("usage:")
        msg("  /terrain set <MapDir>   e.g. /terrain set LostIslesPhase1")
        msg("  /terrain 1  |  /terrain 2   (presets)")
        msg("  /terrain clear          restore base terrain")
        msg("  /terrain status         is the framework loaded?")
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    msg("loaded. /terrain for commands. Framework: " ..
        (framework() and "|cff55ff55present|r" or "|cffff5555absent|r"))
end)
