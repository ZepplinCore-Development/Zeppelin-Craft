--[[ ZepTooltips Engine — F-190 Layer 2 hooks + rendering

  Thin layer over ZepCompute (Compute.lua): hooks spell + aura tooltips, builds a ctx
  from the live WoW API, asks ZepCompute for the real value(s), and renders them.
  ZepCompute owns the math; this file owns the WoW API and presentation.

  UNTESTED in-game (no client here) — Compute's math is validated via tests/test_compute.lua.
]]

local Data = rawget(_G, "ZepTooltipData") or {}

ZepTooltipsDB = ZepTooltipsDB or {}
local function cfg()
    if ZepTooltipsDB.color == nil then ZepTooltipsDB.color = { 0.40, 0.80, 1.00 } end
    return ZepTooltipsDB
end

-- F-189 stat contract: stat_id (shared with the server's spell_stat_scaling table) ->
-- the local player's effective value. Adding a stat = one entry + the server getter.
local StatReader = {
    ARMOR        = function() return (select(2, UnitArmor("player"))) or 0 end,
    STAMINA      = function() return (select(2, UnitStat("player", 3))) or 0 end,
    SPIRIT       = function() return (select(2, UnitStat("player", 5))) or 0 end,
    STRENGTH     = function() return (select(2, UnitStat("player", 1))) or 0 end,
    AGILITY      = function() return (select(2, UnitStat("player", 2))) or 0 end,
    INTELLECT    = function() return (select(2, UnitStat("player", 4))) or 0 end,
    MAX_HEALTH   = function() return UnitHealthMax("player") or 0 end,
    SPELL_POWER  = function() return GetSpellBonusDamage and GetSpellBonusDamage(2) or 0 end,
    ATTACK_POWER = function() local b, p, n = UnitAttackPower("player"); return (b or 0) + (p or 0) + (n or 0) end,
}

local function hasAuraById(unit, id)
    for _, filter in ipairs({ "HELPFUL", "HARMFUL" }) do
        for i = 1, 40 do
            local _, _, _, _, _, _, _, _, _, _, sid = UnitAura(unit, i, filter)
            if not sid then break end
            if sid == id then return true end
        end
    end
    return false
end

local function buildCtx()
    local b, p, n = UnitAttackPower("player")
    local lo, hi = UnitDamage("player")
    return {
        level = UnitLevel("player"),
        sp = GetSpellBonusDamage and GetSpellBonusDamage(2) or 0,
        ap = (b or 0) + (p or 0) + (n or 0),
        weaponAvg = (lo and hi) and (lo + hi) * 0.5 or 0,
        knows = function(id) return IsSpellKnown and IsSpellKnown(id) or false end,
        hasAura = function(id) return hasAuraById("player", id) end,
        stat = function(sid) local r = StatReader[sid]; return r and r() or 0 end,
        baseMana = UnitPowerMax("player", 0) or 0,   -- approx (max mana ~ base for display)
        spellCrit = GetSpellCritChance and GetSpellCritChance(2) or 0,  -- representative school
        meleeCrit = GetCritChance and GetCritChance() or 0,
        rangedCrit = GetRangedCritChance and GetRangedCritChance() or 0,
    }
end

local function colorize(text)
    local c = cfg().color
    return string.format("|cff%02x%02x%02x%s|r",
        math.floor(c[1] * 255), math.floor(c[2] * 255), math.floor(c[3] * 255), text)
end

local function fmt(v, suffix)
    if math.abs(v.hi - v.lo) < 0.5 then
        return string.format("%d%s", math.floor(v.lo + 0.5), suffix)
    end
    return string.format("%d-%d%s", math.floor(v.lo + 0.5), math.floor(v.hi + 0.5), suffix)
end

-- Shared render: look up the record, compute, add lines.
local function renderTooltip(tooltip, spellId)
    if not spellId then return end
    local rec = Data[spellId]
    if not rec then return end
    local ctx = buildCtx()
    local shown = false

    local pe = ZepCompute.primaryEffect(rec)
    local isSpeed = pe and ZepCompute.isSpeed(pe)
    local pv = pe and ZepCompute.effectValues(rec, ctx)[pe.i] or nil
    if pv then
        tooltip:AddLine(colorize(fmt(pv, isSpeed and "%" or "")), nil, nil, nil, true)
        shown = true
    end

    local w = ZepCompute.weapon(rec, ctx)
    if w and w > 0 then
        tooltip:AddLine(colorize(string.format("~%d with your weapon", math.floor(w + 0.5))), nil, nil, nil, true)
        shown = true
    end

    local s = ZepCompute.stat(rec, ctx)
    if s and s > 0 then
        tooltip:AddLine(colorize(string.format("+%d from your stats", math.floor(s + 0.5))), nil, nil, nil, true)
        shown = true
    end

    -- crit: a stock gap (no native line). Chance + the crit hit value. Damage/heal only.
    if pe and not isSpeed then
        local crit = ZepCompute.crit(rec, ctx)
        if crit and crit > 0 then
            local line
            if pv then
                local mult = ZepCompute.critMult(rec, ctx)
                line = string.format("~%.0f%% crit for %s", crit,
                    fmt({ lo = pv.lo * mult, hi = pv.hi * mult }, ""))
            else
                line = string.format("~%.0f%% crit", crit)
            end
            tooltip:AddLine(colorize(line), nil, nil, nil, true)
            shown = true
        end
    end

    -- cost / cooldown: only when a talent the player has actually changes them (the
    -- value-add over native, which already shows the base).
    local cost, costMod = ZepCompute.cost(rec, ctx)
    if costMod then
        tooltip:AddLine(colorize(string.format("%d mana (your talents)", math.floor(cost + 0.5))), nil, nil, nil, true)
        shown = true
    end
    local cdSec, cdMod = ZepCompute.cooldown(rec, ctx)
    if cdMod then
        tooltip:AddLine(colorize(string.format("%.1fs cooldown (your talents)", cdSec)), nil, nil, nil, true)
        shown = true
    end

    if ZepTooltipsDB.debug then
        tooltip:AddLine(colorize(string.format("Zep #%d: %s [%s], %d mods", spellId,
            rec.cd and "casterDependent" or "self-only",
            table.concat(rec.reasons or {}, ","), rec.nmods or (rec.mods and #rec.mods) or 0)))
        shown = true
    end

    if shown then tooltip:Show() end
end

local function onSpellTooltip(tooltip)
    local _, _, spellId = tooltip:GetSpell()
    renderTooltip(tooltip, spellId)
end

-- Aura tooltips. Routing: a caster-dependent aura cast by someone else needs the live
-- server value (Layer 3 / ALE — deferred); otherwise compute locally.
local function handleAura(self, caster, spellId)
    if not spellId then return end
    local rec = Data[spellId]
    if not rec then return end
    local isSelf = caster and UnitIsUnit(caster, "player")
    if rec.cd and not isSelf then
        if ZepTooltipsDB.debug then
            self:AddLine(colorize("(server value — ALE pending: " .. table.concat(rec.reasons or {}, ",") .. ")"))
            self:Show()
        end
        return
    end
    renderTooltip(self, spellId)
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, event, name)
    if event == "ADDON_LOADED" and name == "ZepTooltips" then
        cfg()
        Data = rawget(_G, "ZepTooltipData") or Data
        GameTooltip:HookScript("OnTooltipSetSpell", onSpellTooltip)
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
        local n = 0; for _ in pairs(Data) do n = n + 1 end
        DEFAULT_CHAT_FRAME:AddMessage("|cff66ccffZepTooltips|r loaded (" .. n .. " spells).")
    end
end)

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
