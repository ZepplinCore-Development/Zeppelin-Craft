-- ZepTerrain.lua  (F-196 terrain-swap driver) ------------------------------------------------
-- Server-pushed WarcraftXL terrain-phase swap, synced to the player's Lost Isles phase.
--
-- WHY server-side: 3.3.5a clients have NO "is quest completed" Lua API, so a client addon
-- cannot know the terrain state. The server does: F-194's PhaseMgr sets m_phaseMask from quest
-- state. We read it (GetPhaseMask) and push the matching child-map dir to the client, which
-- drives WarcraftXL_SetTerrainPhase via the ZepTerrainRecv addon (PATCH-A).
--
-- DEPLOY (Unraid worldserver):
--   copy this file to   <ALE.ScriptPath>/ZepTerrain/ZepTerrain.lua
--     (ALE.ScriptPath = /azerothcore/bin/lua_scripts, per Configs/modules/mod_ale.conf)
--   then:  .reload ALE      (or restart the worldserver)
-----------------------------------------------------------------------------------------------

local LOST_ISLES_ZONE = 4720
local CLEAR    = "-"      -- sentinel: restore base (avoids an empty-body addon message)
local POLL_MS  = 2000     -- safety net; see "WHY POLL" below
local RELOGIN_POLLS = 4   -- forced re-push ~8s after login; see "LOGIN RACE" below
local DEBUG    = true     -- log every swap to Server.log. Set false once the driver is proven.

-- ---------------------------------------------------------------------------------------------
-- GENERATED BLOCK - do not hand-edit. Produced by zpaks/zep-terrain/gen_terrain_map.py from
-- acore_world.phase_definitions (zone 4720), which carries the donor terrainswapmap values.
-- Regenerate after any change to the phase rows:  python3 zpaks/zep-terrain/gen_terrain_map.py
--
-- Exact-match on the whole phasemask is correct here, NOT a bitwise test: every Lost Isles
-- phase_definitions row has flags = 1 (PHASE_FLAG_OVERWRITE_EXISTING), so PhaseMgr does
-- `phasemask = def.phasemask` (replace, not OR) and the last matching definition wins. The
-- player's mask is therefore always exactly one definition's value.
-- ---------------------------------------------------------------------------------------------
-- >>> BEGIN GENERATED TERRAIN MAP
local TERRAIN = {
    [1024  ] = "LostIslesPhase1",
    [2048  ] = "LostIslesPhase2",
    [4096  ] = "LostIslesPhase2",
    [8192  ] = "LostIslesPhase2",
    [16384 ] = "LostIslesPhase1",
    [16392 ] = "LostIslesPhase1",
    [32768 ] = "LostIslesPhase1",
    [32776 ] = "LostIslesPhase1",
    [32808 ] = "LostIslesPhase1",
}
-- <<< END GENERATED TERRAIN MAP

local last    = {}   -- guidLow -> last dir sent. Each swap re-streams the map, so never resend.
local recheck = {}   -- guidLow -> polls remaining before a forced re-push (login race, below)

local function terrainFor(player)
    if player:GetZoneId() ~= LOST_ISLES_ZONE then return CLEAR end
    return TERRAIN[player:GetPhaseMask()] or CLEAR
end

local function push(player)
    if not player then return end
    local guid = player:GetGUIDLow()
    local dir  = terrainFor(player)
    -- An unseeded guid means CLEAR, never "unknown". ON_UPDATE_ZONE (27) fires inside
    -- SendInitialPacketsAfterAddToMap (CharacterHandler.cpp:908), ~200 lines BEFORE
    -- OnPlayerLogin (:1114) seeds `last`, so on every login this ran with last[guid] = nil,
    -- read it as a CHANGE to CLEAR and whispered "-" to a player who was nowhere near the
    -- Lost Isles. The client had just reset `applied` on PLAYER_ENTERING_WORLD, so it was
    -- not deduped there either: WarcraftXL_ClearTerrainPhase() re-streamed the map the
    -- instant the player materialised and dropped them through the ground.
    if (last[guid] or CLEAR) == dir then last[guid] = dir; return end
    last[guid] = dir
    -- 7 = CHAT_MSG_WHISPER, sent to self. WHISPER is the safe distribution for addon messages;
    -- never GUILD (Warden claims CHAT_MSG_GUILD + LANG_ADDON and eats the message).
    player:SendAddonMessage("ZTP", dir, 7, player)
    if DEBUG then
        PrintInfo(string.format("ZepTerrain: %s zone=%d phasemask=%d -> %s",
            player:GetName(), player:GetZoneId(), player:GetPhaseMask(), dir))
    end
end

-- Event IDs (mod-ale Hooks.h): 3 ON_LOGIN, 4 ON_LOGOUT, 27 ON_UPDATE_ZONE,
-- 38 ON_QUEST_ABANDON, 54 ON_COMPLETE_QUEST, 63 ON_QUEST_ACCEPT.
RegisterPlayerEvent(3, function(_, p)
    local guid = p:GetGUIDLow()
    -- Seed as CLEAR, not nil. A fresh guid with `nil` makes the first push believe it is a
    -- CHANGE to CLEAR, so every player logging in ANYWHERE on the server got a spurious
    -- ClearTerrainPhase() (seen in Server.log as "Chat zone=6170 phasemask=1 -> -"). Seeding
    -- CLEAR means out-of-zone players send nothing at all, which is the correct baseline.
    last[guid] = CLEAR
    push(p)
    -- LOGIN RACE: ON_LOGIN can fire before ZepTerrainRecv has loaded, so this first push may be
    -- dropped with no way to notice. Schedule a forced re-push a few polls later. The addon
    -- dedupes on its side, so the retry is free when the first push did land.
    recheck[guid] = RELOGIN_POLLS
end)
RegisterPlayerEvent(4,  function(_, p) local g = p:GetGUIDLow(); last[g] = nil; recheck[g] = nil end)
RegisterPlayerEvent(27, function(_, p) push(p) end)
RegisterPlayerEvent(38, function(_, p) push(p) end)
RegisterPlayerEvent(54, function(_, p) push(p) end)
RegisterPlayerEvent(63, function(_, p) push(p) end)

-- WHY POLL: most Lost Isles phase conditions are type 8 QUEST_REWARDED, and mod-ale has NO
-- player-level quest-reward hook (only CREATURE_EVENT_ON_QUEST_REWARD = 34 and the gameobject
-- equivalent, which fire on the questgiver). So a turn-in can flip the phasemask with no player
-- event to observe it. PhaseMgr also recalculates on its own schedule, so an event can fire
-- before the mask has actually moved. The poll closes both gaps; `last` makes it a no-op unless
-- the mask really changed.
CreateLuaEvent(function()
    local players = GetPlayersInWorld()
    if not players then return end
    for _, p in pairs(players) do
        if p then
            local guid = p:GetGUIDLow()
            local n = recheck[guid]
            if n then
                if n <= 1 then
                    recheck[guid] = nil
                    last[guid] = CLEAR      -- force the re-push (CLEAR, not nil - see ON_LOGIN)
                else
                    recheck[guid] = n - 1
                end
            end
            if p:GetZoneId() == LOST_ISLES_ZONE then
                push(p)
            elseif last[guid] and last[guid] ~= CLEAR then
                push(p)                     -- left the zone: clear the overlay once
            end
        end
    end
end, POLL_MS, 0)   -- repeats 0 = infinite

do
    local n = 0
    for _ in pairs(TERRAIN) do n = n + 1 end
    PrintInfo(string.format(
        "ZepTerrain: loaded - %d phasemask->terrain mappings, poll %dms, debug=%s",
        n, POLL_MS, tostring(DEBUG)))
end
