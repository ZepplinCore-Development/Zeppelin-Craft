-- ZepTerrainRecv (F-196): apply server-pushed Lost Isles terrain-phase swaps.
--
-- The ALE script "ZepTerrain" whispers us an addon message: prefix "ZTP", body = the child-map
-- directory to overlay (e.g. "LostIslesPhase2"), or "-" to clear back to the base map. We drive
-- the WarcraftXL bridge globals, which the framework registers into every fresh FrameScript Lua
-- state (so they survive glue <-> world transitions).

local PREFIX = "ZTP"
local CLEAR  = "-"

local applied = nil   -- last dir actually handed to the bridge
local pending = nil   -- dir received before the bridge was available

-- Dedupe on the CLIENT as well as the server. A terrain swap re-streams the map, so applying
-- the same dir twice is expensive, and the server deliberately re-pushes after login (its first
-- push can land before this addon has loaded). Filtering here makes that retry free.
local function apply(dir)
    if type(WarcraftXL_SetTerrainPhase) ~= "function" then
        pending = dir       -- framework not up yet; retry on PLAYER_ENTERING_WORLD
        return
    end
    pending = nil
    if applied == dir then return end
    applied = dir
    if dir == CLEAR then
        WarcraftXL_ClearTerrainPhase()
    else
        WarcraftXL_SetTerrainPhase(dir)
    end
end

-- World map (I-382): overlay art for the active terrain phase.
--
-- A terrain swap only re-streams ADTs; the world map kept drawing the pre-destruction island.
-- Cataclysm swaps the whole WorldMapArea (544 -> 681/682). Its detail tiles are byte-identical
-- to the base set, and only the explored-area OVERLAYS carry the phase art (lava, Town-In-A-Box).
-- So we redirect overlay textures only: "Interface\WorldMap\TheLostIsles\<Overlay><n>" becomes
-- "Interface\WorldMap\<PhaseDir>\<PhaseDir>_<Overlay><n>" (unique stems, shipped in PATCH-Z
-- by zep-goblin-start).
--
-- Every overlay consumer - FrameXML WorldMapFrame_Update, ElvUI_Enhanced FogClear, the
-- Blizzard_BattlefieldMinimap zone map - creates its textures on WorldMapDetailFrame /
-- BattlefieldMinimap and paints them with SetTexture. We secure-hook CreateTexture on those
-- frames and SetTexture on each texture, so no global API is replaced and nothing is tainted.

-- phase dir (WarcraftXL_GetTerrainPhase) -> the base world-map folder it re-arts
local WORLDMAP_BASE = {
    LostIslesPhase1 = "TheLostIsles",   -- map 659, destruction  (Cata TheLostIsles_terrain2 art)
    LostIslesPhase2 = "TheLostIsles",   -- map 661, Town-In-A-Box (Cata TheLostIsles_terrain1 art)
}

local basePrefixes = {}
for _, base in pairs(WORLDMAP_BASE) do
    basePrefixes["interface\\worldmap\\" .. base:lower() .. "\\"] = true
end

local function phaseDir()
    if type(WarcraftXL_GetTerrainPhase) ~= "function" then return nil end
    return WarcraftXL_GetTerrainPhase()
end

-- The base-folder suffix of a world-map path ("ScorchedGully3"), or nil if it is not one.
local function baseSuffix(path)
    if type(path) ~= "string" then return nil end
    local lower = path:lower()
    for prefix in pairs(basePrefixes) do
        if lower:sub(1, #prefix) == prefix then return path:sub(#prefix + 1), prefix end
    end
end

local function phasedPath(path)
    local dir = phaseDir()
    local base = dir and WORLDMAP_BASE[dir]
    if not base then return nil end
    local suffix, prefix = baseSuffix(path)
    if not suffix or prefix ~= "interface\\worldmap\\" .. base:lower() .. "\\" then return nil end
    return "Interface\\WorldMap\\" .. dir .. "\\" .. dir .. "_" .. suffix
end

local basePath = {}   -- texture -> the base-folder path its owner last asked for
local busy = false

local function onSetTexture(tex, path)
    if busy then return end
    if not baseSuffix(path) then basePath[tex] = nil; return end
    basePath[tex] = path
    local swapped = phasedPath(path)
    if swapped then
        busy = true
        tex:SetTexture(swapped)
        busy = false
    end
end

local hooked = {}
local function hookTexture(tex)
    if not tex or hooked[tex] or type(tex.SetTexture) ~= "function" then return end
    hooked[tex] = true
    hooksecurefunc(tex, "SetTexture", onSetTexture)
end

local function hookFrame(frame, overlayPrefix)
    if not frame or hooked[frame] then return end
    hooked[frame] = true
    hooksecurefunc(frame, "CreateTexture", function(_, name)
        if name then hookTexture(_G[name]) end
    end)
    -- textures that already exist (created before we hooked)
    local i = 1
    while _G[overlayPrefix .. i] do
        hookTexture(_G[overlayPrefix .. i])
        i = i + 1
    end
end

-- Re-paint every overlay currently showing base/phase art for the new phase state.
local function repaint()
    for tex, path in pairs(basePath) do
        tex:SetTexture(path)   -- re-enters onSetTexture, which applies (or drops) the swap
    end
end

local function hookMaps()
    hookFrame(WorldMapDetailFrame, "WorldMapOverlay")
    -- load-on-demand, possibly loaded by another addon before us: hook whenever it exists
    hookFrame(BattlefieldMinimap, "BattlefieldMinimapOverlay")
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("CHAT_MSG_ADDON")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
    hookMaps()
    if event == "ADDON_LOADED" then return end
    if event == "PLAYER_ENTERING_WORLD" then
        -- A world transition destroys and rebuilds the Lua state, so whatever we applied last
        -- session is gone from our bookkeeping's point of view; let the next push re-apply.
        applied = nil
        if pending then apply(pending) end
        return
    end
    if prefix ~= PREFIX then return end
    if sender ~= UnitName("player") then return end
    if message == nil or message == "" then return end
    apply(message)
end)

-- The bridge is also driven directly by /terrain (ZepTerrainTest), so watch the bridge itself
-- rather than apply(): one C call every half second, repaint the map overlays on a change.
local lastDir
local elapsed = 0
f:SetScript("OnUpdate", function(_, dt)
    elapsed = elapsed + dt
    if elapsed < 0.5 then return end
    elapsed = 0
    local dir = phaseDir()
    if dir ~= lastDir then
        lastDir = dir
        repaint()
    end
end)
