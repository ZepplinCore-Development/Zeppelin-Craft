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
    -- 3.3.5 client API is GetShieldBlock(); GetShieldBlockValue() is the SERVER method name
    -- (the bug that made Rockslam show base-only). Try the real one first, fall back defensively.
    BLOCK_VALUE  = function() return (GetShieldBlock and GetShieldBlock())
                                  or (GetShieldBlockValue and GetShieldBlockValue()) or 0 end,
}

-- The aura's stack count on the player (>=1 if present, 0 if absent). Drives per-stack
-- spellmod scaling — AC multiplies a spellmod's amount by the aura's stack count, so e.g.
-- Rocksteady scales Rocksurge per stack.
local function auraStacks(unit, id)
    for _, filter in ipairs({ "HELPFUL", "HARMFUL" }) do
        for i = 1, 40 do
            local _, _, _, cnt, _, _, _, _, _, _, sid = UnitAura(unit, i, filter)
            if not sid then break end
            if sid == id then return (cnt and cnt > 0) and cnt or 1 end
        end
    end
    return 0
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
        hasAura = function(id) return auraStacks("player", id) end,
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

-- Whole number with thousands separators: 15234 -> "15,234".
local function num(n)
    n = math.floor(n + 0.5)
    local neg = n < 0
    local s = tostring(math.abs(n)):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "")
    return (neg and "-" or "") .. s
end

-- A value (point or lo-hi range) with an optional suffix (e.g. "%").
local function fmt(v, suffix)
    suffix = suffix or ""
    if math.abs(v.hi - v.lo) < 0.5 then
        return num(v.lo) .. suffix
    end
    return num(v.lo) .. "-" .. num(v.hi) .. suffix
end

-- Label for the primary value line by effect kind.
local function primaryLabel(pe, isSpeed)
    if isSpeed then return "Speed" end
    if pe and pe.t == 10 then return "Heal" end
    return "Hit"
end

-- Shared render: look up the record, compute, add lines.
local function renderTooltip(tooltip, spellId)
    if not spellId or ZepTooltipsDB.enabled == false then return end
    local rec = Data[spellId]
    if not rec then return end
    local ctx = buildCtx()
    local shown = false
    local function addLine(text)
        tooltip:AddLine(colorize(text), nil, nil, nil, true)
        shown = true
    end

    -- Phase 6: recomputed desc (stock tokens -> real numbers) directly below the native
    -- desc. When shown it conveys the hit/heal value, so the terse primary line is dropped.
    local descShown = false
    if rec.desc and ZepDesc then
        local computed = ZepDesc.render(rec, ctx, function(id) return Data[id] end)
        if computed and computed ~= "" then
            addLine(computed)
            descShown = true
        end
    end

    local pe = ZepCompute.primaryEffect(rec)
    local isSpeed = pe and ZepCompute.isSpeed(pe)
    local pv = pe and ZepCompute.effectValues(rec, ctx)[pe.i] or nil
    if pv and not descShown then
        addLine(primaryLabel(pe, isSpeed) .. ": " .. fmt(pv, isSpeed and "%" or ""))
    end

    -- scaling-source line: the DBC desc no longer states it, so the addon names the
    -- stat(s) the value scales with (following cross-spell desc refs, e.g. VS -> armor).
    if not isSpeed and ZepCompute.scalingSources then
        local sources = ZepCompute.scalingSources(rec, function(id) return Data[id] end)
        if #sources > 0 then addLine("Scales with " .. table.concat(sources, ", ")) end
    end

    local w = ZepCompute.weapon(rec, ctx)
    if w and w > 0 then addLine("Weapon: ~" .. num(w)) end
    -- F-189 stat scaling (e.g. block value) is folded into the primary value above, not
    -- shown as a separate line.

    -- crit: a stock gap (no native line). Chance + the crit hit value. Damage/heal only.
    if pe and not isSpeed then
        local crit = ZepCompute.crit(rec, ctx)
        if crit and crit > 0 then
            if pv then
                local mult = ZepCompute.critMult(rec, ctx)
                addLine(string.format("Crit: ~%.0f%% (%s)", crit,
                    fmt({ lo = pv.lo * mult, hi = pv.hi * mult })))
            else
                addLine(string.format("Crit: ~%.0f%%", crit))
            end
        end
    end

    -- cost / cooldown: only when a talent the player has actually changes them (the
    -- value-add over native, which already shows the base).
    local cost, costMod = ZepCompute.cost(rec, ctx)
    if costMod then addLine("Mana: " .. num(cost) .. " (talents)") end
    local cdSec, cdMod = ZepCompute.cooldown(rec, ctx)
    if cdMod then addLine(string.format("Cooldown: %.1fs (talents)", cdSec)) end

    if ZepTooltipsDB.debug then
        addLine(string.format("Zep #%d: %s [%s], %d mods", spellId,
            rec.cd and "casterDependent" or "self-only",
            table.concat(rec.reasons or {}, ","), rec.nmods or (rec.mods and #rec.mods) or 0))
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
    if a == "on" or a == "off" then
        ZepTooltipsDB.enabled = (a == "on")
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: " .. a)
    elseif a == "debug" then
        ZepTooltipsDB.debug = not ZepTooltipsDB.debug
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips debug: " .. tostring(ZepTooltipsDB.debug))
    elseif a == "color" and b ~= "" then
        ZepTooltipsDB.color = { tonumber(b) or 0.4, tonumber(c) or 0.8, tonumber(d) or 1.0 }
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips color set.")
    elseif a == "test" then
        if ZepSelfTest then ZepSelfTest.run(true) else DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: self-test unavailable") end
    else
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: /zeptt on|off | debug | test | color r g b")
    end
end
