-- ZepTerrain.lua  (F-196 test driver) --------------------------------------------------------
-- Server-pushed WarcraftXL terrain-phase swap, synced to the player's Lost Isles phase.
--
-- WHY server-side: WoW 3.3.5a clients have NO "is quest completed" Lua API, so a client addon
-- cannot know the terrain state. The server already does: F-194's PhaseMgr sets the player's
-- m_phaseMask from quest state. We read it (GetPhaseMask) and push the matching child-map dir to
-- the client, which drives WarcraftXL_SetTerrainPhase (via the ZepTerrainRecv addon, PATCH-A).
--
-- DEPLOY (Unraid worldserver):
--   copy this file to   <ALE.ScriptPath>/ZepTerrain/ZepTerrain.lua
--     (ALE.ScriptPath = /azerothcore/bin/lua_scripts, per Configs/modules/mod_ale.conf)
--   then in-game/console:  .reload ALE      (or restart the worldserver)
-----------------------------------------------------------------------------------------------

local LOST_ISLES_ZONE = 4720

-- phasemask (F-194 PhaseMgr) -> terrain state.
-- Mapping taken from Neltharion phase_definitions.terrainswapmap for zone 4720:
--   terrainswapmap 0   = intact (base map 648)  -> clear overlay (client shows the baked island)
--   terrainswapmap 661 = LostIslesPhase1         (mid destruction)  [swaps 12 volcano-core tiles]
--   terrainswapmap 659 = LostIslesPhase2         (late destruction) [ships only 1 tile - see NOTE]
local MID  = { [2048]=true, [4096]=true, [8192]=true }
local LATE = { [32768]=true, [16384]=true, [16392]=true, [32776]=true, [32808]=true, [1024]=true }

local DIR_MID  = "LostIslesPhase1"
local DIR_LATE = "LostIslesPhase2"
local CLEAR    = "-"   -- sentinel: restore base (avoids sending an empty-body addon message)

local last = {}        -- guidLow -> last dir sent (skip redundant swaps; each swap re-streams the map)

local function terrainFor(player)
    if player:GetZoneId() ~= LOST_ISLES_ZONE then return CLEAR end
    local m = player:GetPhaseMask()
    if LATE[m] then return DIR_LATE end
    if MID[m]  then return DIR_MID  end
    return CLEAR   -- intact / default / unmapped -> baked island
end

local function push(player)
    if not player then return end
    local dir  = terrainFor(player)
    local guid = player:GetGUIDLow()
    if last[guid] == dir then return end
    last[guid] = dir
    player:SendAddonMessage("ZTP", dir, 7, player)   -- 7 = CHAT_MSG_WHISPER, sent to self
end

-- Event IDs (mod-ale Hooks.h): 3=ON_LOGIN, 27=ON_UPDATE_ZONE, 54=ON_COMPLETE_QUEST, 63=ON_QUEST_ACCEPT.
-- NOTE on timing: if GetPhaseMask lags a quest turn-in (hook order), moving between subareas fires
-- event 27 and re-syncs; a /reload or re-zone also corrects it. Fine for testing.
RegisterPlayerEvent(3,  function(_, p) last[p:GetGUIDLow()] = nil; push(p) end)
RegisterPlayerEvent(27, function(_, p) push(p) end)
RegisterPlayerEvent(54, function(_, p) push(p) end)
RegisterPlayerEvent(63, function(_, p) push(p) end)
