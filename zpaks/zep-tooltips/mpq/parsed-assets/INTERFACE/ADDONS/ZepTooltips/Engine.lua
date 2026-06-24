--[[ ZepTooltips Engine — F-190 Layer 2 (addon-driven tooltip/description engine)

  Renders player-perspective spell values the stock client can't, by reading the
  build-generated classification table (Generated.lua -> ZepTooltipData) and the
  LOCAL player's stats. The data is generated from DBC by `zep build tooltip-data`
  so the inputs can't drift from the server (F-190 "DBC = data, not algorithm").

  This engine only computes LOCAL-derivable values (additive-linear deltas:
  base + stat * coeff). Values that depend on another unit's hidden state
  (casterDependent && not self-cast) are routed to Layer 3 (the ALE server module)
  — stubbed here, implemented in Phase 4.

  UNTESTED in dev env (no WoW client) — verify in-game. Items flagged VERIFY below.
]]

local Data = rawget(_G, "ZepTooltipData") or {}

ZepTooltipsDB = ZepTooltipsDB or {}
local function cfg()
    if ZepTooltipsDB.color == nil then ZepTooltipsDB.color = { 0.40, 0.80, 1.00 } end
    return ZepTooltipsDB
end

-- ---------------------------------------------------------------------------
-- F-189 stat contract: stat_id (string, shared with the server's spell_stat_scaling
-- table) -> reader returning the local player's effective value. Adding a new
-- scalable stat = one entry here + the matching server getter.
-- ---------------------------------------------------------------------------
local StatReader = {
    ARMOR      = function() return (select(2, UnitArmor("player"))) or 0 end,   -- effective armor
    STAMINA    = function() return (select(2, UnitStat("player", 3))) or 0 end, -- 3 = Stamina
    SPIRIT     = function() return (select(2, UnitStat("player", 5))) or 0 end, -- 5 = Spirit
    STRENGTH   = function() return (select(2, UnitStat("player", 1))) or 0 end,
    AGILITY    = function() return (select(2, UnitStat("player", 2))) or 0 end,
    INTELLECT  = function() return (select(2, UnitStat("player", 4))) or 0 end,
    MAX_HEALTH = function() return UnitHealthMax("player") or 0 end,
    SPELL_POWER = function() return GetSpellBonusDamage and GetSpellBonusDamage(2) or 0 end, -- 2 = Holy/general
    ATTACK_POWER = function() local b, p, n = UnitAttackPower("player"); return (b or 0) + (p or 0) + (n or 0) end,
    -- BLOCK_VALUE: no native Lua getter on stock 3.3.5a; resolved server-side (ALE)
    -- or via the F-183 $bv exe token in native text. Left unmapped on purpose.
}

-- additive-linear delta: sum(stat * coeff) for the spell's stat_scaling rows.
-- Returns (total, parts) where parts is a per-stat breakdown for richer rendering.
local function ComputeStatDelta(rec)
    if not rec or not rec.stat_scaling then return 0, nil end
    local total, parts = 0, {}
    for _, s in ipairs(rec.stat_scaling) do
        local reader = StatReader[s.stat]
        if reader and s.coeff then
            local v = reader()
            local add = v * s.coeff
            total = total + add
            parts[#parts + 1] = { stat = s.stat, value = v, coeff = s.coeff, add = add }
        end
    end
    return total, parts
end

-- Weapon-damage scaling (effects 17/31/58/121). Weapon damage is local player state,
-- so this is self-computable (no ALE). Approx: main-hand average from UnitDamage
-- (already includes AP + buffs). WEAPON_PERCENT(31) base scales it; 17/58/121 add a
-- flat base. Offhand / true normalized speed refined later — VERIFY in-game.
local function weaponAvg()
    local lo, hi = UnitDamage("player")
    if lo and hi then return (lo + hi) * 0.5 end
    return 0
end

local function ComputeWeapon(rec)
    if not rec or not rec.weapon then return 0 end
    local pct, flat, usesWeapon = nil, 0, false
    for _, e in ipairs(rec.weapon) do
        if e.type == 31 then            -- WEAPON_PERCENT_DAMAGE: base is the percent
            pct = (pct or 0) + (e.base or 0)
            usesWeapon = true
        else                            -- 17 / 58 / 121: weapon damage + flat base
            usesWeapon = true
            flat = flat + (e.base or 0)
        end
    end
    if not usesWeapon then return 0 end
    local w = weaponAvg()
    if pct then return w * (pct / 100) + flat end
    return w + flat
end

local function colorize(text)
    local c = cfg().color
    return string.format("|cff%02x%02x%02x%s|r",
        math.floor(c[1] * 255), math.floor(c[2] * 255), math.floor(c[3] * 255), text)
end

-- ---------------------------------------------------------------------------
-- Spell tooltip / description (player-perspective: surfaces #1 desc + #2 spell tt).
-- Always local — never needs the server.
-- ---------------------------------------------------------------------------
local function onSpellTooltip(tooltip)
    -- VERIFY: GameTooltip:GetSpell() id semantics vary in 3.3.5a (spellbook slot
    -- vs spellID). `/zeptt debug` prints the raw result so we can see what each
    -- surface (spellbook, action bar, form bar) resolves to. If NO "getspell" line
    -- appears on a hover, the hook didn't fire (e.g. shapeshift-form buttons use
    -- SetShapeshift, not SetSpell) and we need a separate hook for that surface.
    local sname, _, spellId = tooltip:GetSpell()
    if ZepTooltipsDB.debug then
        local inTable = (spellId ~= nil) and (Data[spellId] ~= nil)
        tooltip:AddLine(colorize(string.format("Zep getspell: %s id=%s inTable=%s",
            tostring(sname), tostring(spellId), tostring(inTable))))
        tooltip:Show()
    end
    if not spellId then return end
    local rec = Data[spellId]
    if not rec then return end

    local delta = ComputeStatDelta(rec)
    if delta and delta > 0 then
        tooltip:AddLine(colorize(string.format("+%d from your stats", math.floor(delta + 0.5))), nil, nil, nil, true)
        tooltip:Show()
    end

    local wdmg = ComputeWeapon(rec)
    if wdmg and wdmg > 0 then
        tooltip:AddLine(colorize(string.format("~%d with your weapon", math.floor(wdmg + 0.5))), nil, nil, nil, true)
        tooltip:Show()
    end

    -- Phase-2 self-test: with no F-189 stat data yet, the engine no-ops on real
    -- tooltips. `/zeptt debug` surfaces the classification so you can confirm the
    -- hook fires, the generated table loaded, and GetSpell()'s id resolved.
    if ZepTooltipsDB.debug then
        local nmods = rec.nmods or 0
        local tag = rec.casterDependent
            and ("casterDependent [" .. table.concat(rec.reasons or {}, ",") .. "]") or "self-only"
        tooltip:AddLine(colorize(string.format("Zep #%d: %s, %d mods", spellId, tag, nmods)))
        tooltip:Show()
    end
end

-- ---------------------------------------------------------------------------
-- Applied-aura tooltip (surface #3). This is the ONLY surface that can need the
-- server. Routing rule (F-190): ALE iff casterDependent AND the caster is not us.
-- ---------------------------------------------------------------------------
-- Resolver returns (name, ..., caster[8], ..., spellId[11]) — same layout for
-- UnitAura / UnitBuff / UnitDebuff in 3.3.5a.
local function handleAura(self, caster, spellId)
    if not spellId then return end
    local rec = Data[spellId]
    if not rec then return end

    local isSelf = caster and UnitIsUnit(caster, "player")

    -- Phase-2 self-test: surface classification + caster side for any aura in data.
    if ZepTooltipsDB.debug then
        local tag = rec.casterDependent
            and ("casterDependent [" .. table.concat(rec.reasons or {}, ",") .. "]") or "self-only"
        self:AddLine(colorize(string.format("Zep aura #%d: %s (%s)", spellId, tag, isSelf and "self" or "other")))
        self:Show()
    end

    if rec.casterDependent and not isSelf then
        -- Layer 3 (ALE): value depends on the caster's hidden state (their
        -- talents/SP/AP/stats). Phase 4 fetches the live value over an addon-message
        -- channel and updates this line on reply. Stub for now.
        return
    end

    local delta = ComputeStatDelta(rec)
    if delta and delta > 0 then
        self:AddLine(colorize(string.format("+%d from your stats", math.floor(delta + 0.5))))
        self:Show()
    end
end

-- ---------------------------------------------------------------------------
-- Wire-up
-- ---------------------------------------------------------------------------
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == "ZepTooltips" then
        cfg()
        Data = rawget(_G, "ZepTooltipData") or Data
        GameTooltip:HookScript("OnTooltipSetSpell", onSpellTooltip)
        -- The default 3.3.5a UI sets aura tooltips via SetUnitBuff/SetUnitDebuff;
        -- SetUnitAura also exists. Hook whichever are present.
        local function hookAura(method, resolver)
            if type(GameTooltip[method]) == "function" then
                hooksecurefunc(GameTooltip, method, function(self, unit, index, filter)
                    local _, _, _, _, _, _, _, caster, _, _, spellId = resolver(unit, index, filter)
                    handleAura(self, caster, spellId)
                end)
            end
        end
        hookAura("SetUnitAura", UnitAura)
        hookAura("SetUnitBuff", UnitBuff)
        hookAura("SetUnitDebuff", UnitDebuff)
        -- ItemRefTooltip (chat links) could be hooked the same way later.
        local n = 0; for _ in pairs(Data) do n = n + 1 end
        DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffZepTooltips|r loaded (" .. n .. " spells).")
    end
end)

-- /zeptt debug   — toggle the ALE-routing debug line
-- /zeptt color r g b  — set the value color (0-1)
SLASH_ZEPTT1 = "/zeptt"
SlashCmdList["ZEPTT"] = function(msg)
    local a, b, c, d = msg:match("^(%S+)%s*(%S*)%s*(%S*)%s*(%S*)")
    if a == "debug" then
        ZepTooltipsDB.debug = not ZepTooltipsDB.debug
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips debug: " .. tostring(ZepTooltipsDB.debug))
    elseif a == "color" and b ~= "" then
        ZepTooltipsDB.color = { tonumber(b) or 0.4, tonumber(c) or 0.8, tonumber(d) or 1.0 }
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips color set.")
    else
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: /zeptt debug | /zeptt color r g b")
    end
end
