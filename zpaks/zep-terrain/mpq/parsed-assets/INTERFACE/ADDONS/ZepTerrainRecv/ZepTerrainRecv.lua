-- ZepTerrainRecv (F-196): apply server-pushed Lost Isles terrain-phase swaps.
-- The server ALE script "ZepTerrain" sends an addon message: prefix "ZTP", body = the child-map
-- directory to overlay (e.g. "LostIslesPhase1"), or "-" to clear back to the base map.
-- We drive the WarcraftXL bridge globals, which exist only when the 'wxl-assets' marker is
-- present next to Wow.exe. Client-authoritative movement means you can walk on whatever this
-- renders even though the server has no matching collision yet (that's the mmaps test).
local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_ADDON")
f:SetScript("OnEvent", function(self, event, prefix, message, channel, sender)
    if prefix ~= "ZTP" then return end
    if sender ~= UnitName("player") then return end
    if type(WarcraftXL_SetTerrainPhase) ~= "function" then return end
    if message == nil or message == "" or message == "-" then
        WarcraftXL_ClearTerrainPhase()
    else
        WarcraftXL_SetTerrainPhase(message)
    end
end)
