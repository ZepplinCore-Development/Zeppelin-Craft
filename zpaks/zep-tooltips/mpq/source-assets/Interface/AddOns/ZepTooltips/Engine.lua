--[[ ZepTooltips Engine — F-190 Layer 2 hooks + rendering

  Thin layer over ZepCompute (Compute.lua): hooks spell + aura tooltips, builds a ctx
  from the live WoW API, asks ZepCompute for the real value(s), and renders them.
  ZepCompute owns the math; this file owns the WoW API and presentation.

  UNTESTED in-game (no client here) — Compute's math is validated via tests/test_compute.lua.
]]

local Data = rawget(_G, "ZepTooltipData") or {}

-- The bulky desc/tt templates live in a LoadOnDemand sub-addon (ZepTooltipsDesc) so the big
-- string table never blocks the loading screen. Pull it in on first need (synchronous: the
-- merge into ZepTooltipData completes before we return, so the triggering tooltip recomputes).
local descLoaded = false
local function ensureDesc()
    if descLoaded then return end
    descLoaded = true
    if LoadAddOn and not IsAddOnLoaded("ZepTooltipsDesc") then
        local ok, reason = LoadAddOn("ZepTooltipsDesc")   -- LoadOnDemand: loads even if unchecked
        if not ok and ZepTooltipsDB and ZepTooltipsDB.debug then
            DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: desc data did not load (" .. tostring(reason) .. ")")
        end
    end
end

-- SpellModOp -> readable label, for the debug modifier breakdown.
local OP_LABEL = {
    [0] = "damage", [1] = "duration", [3] = "effect", [7] = "crit", [8] = "all effects",
    [10] = "cast time", [11] = "cooldown", [12] = "effect", [14] = "cost", [15] = "crit dmg",
    [22] = "DoT", [23] = "effect",
}

-- Class token (UnitClass 2nd return) -> class id used by player_class_stats / ZepBaseMana.
local CLASS_ID = {
    WARRIOR = 1, PALADIN = 2, HUNTER = 3, ROGUE = 4, PRIEST = 5, DEATHKNIGHT = 6,
    SHAMAN = 7, MAGE = 8, WARLOCK = 9, DRUID = 11,
}

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

-- Active glyph modifier spells. Glyphs apply a PASSIVE modifier (attr 0x40) that is neither
-- "known" (IsSpellKnown) nor a visible aura (UnitAura skips passives), so detect them via the
-- glyph sockets — GetGlyphSocketInfo's glyphSpell is our glyphproperties.spell_id (the
-- modifier, e.g. 900272 Glyph of Rocksurge / 900276 Glyph of Crag Strike).
local function activeGlyphs()
    local g = {}
    if GetNumGlyphSockets and GetGlyphSocketInfo then
        for i = 1, GetNumGlyphSockets() do
            -- glyphSpell's return position varies by client build, so collect ANY return that
            -- looks like a spell id (the only big numeric one) rather than a fixed position.
            local info = { GetGlyphSocketInfo(i) }
            if info[1] then  -- socket enabled
                for _, v in ipairs(info) do
                    if type(v) == "number" and v > 1000 then g[v] = true end
                end
            end
        end
    end
    return g
end

-- Learned talent rank spells. A hidden passive talent (attr 0x80 DO_NOT_DISPLAY, e.g. Bulwark
-- cloned from Critical Block) is, like a glyph, neither "known" (IsSpellKnown) nor a visible
-- aura — so a talent that boosts a spell (Bulwark -> Rockslam crit) would silently not apply.
-- Resolve it from the talent API instead: for each talent with rank > 0, map its CURRENT rank
-- to the rank spell id via ZepTalentRanks (generated from Talent.dbc). GetTalentInfo gives the
-- rank; GetTalentLink gives the Talent.dbc id (the rank-spell ids aren't exposed directly).
local function activeTalents()
    local t = {}
    local ranks = rawget(_G, "ZepTalentRanks")
    if not ranks or not GetNumTalentTabs then return t end
    for tab = 1, (GetNumTalentTabs() or 0) do
        for i = 1, (GetNumTalents and GetNumTalents(tab) or 0) do
            local rank = select(5, GetTalentInfo(tab, i))   -- current rank (0 if untalented)
            if rank and rank > 0 then
                local link = GetTalentLink and GetTalentLink(tab, i)
                local tid = link and tonumber(link:match("talent:(%d+)"))
                local list = tid and ranks[tid]
                if list and list[rank] then t[list[rank]] = true end
            end
        end
    end
    return t
end

-- Equip-driven passives (relics/librams/idols/totems, equip auras): the modifier applies a
-- hidden aura WHILE THE ITEM IS EQUIPPED — neither "known" (IsSpellKnown) nor a visible aura
-- (UnitAura skips the hidden passive), same blind spot as glyphs/hidden talents. Detect by
-- scanning equipped gear against ZepEquipSources (modSpell -> granting item entries). I-218.
local function equippedSources()
    local active = {}
    local src = rawget(_G, "ZepEquipSources")
    if not src or not GetInventoryItemID then return active end
    local worn = {}
    for slot = 1, 19 do                         -- 18 = relic/ranged; scan all gear to stay general
        local id = GetInventoryItemID("player", slot)
        if id then worn[id] = true end
    end
    for spell, items in pairs(src) do
        for _, item in ipairs(items) do
            if worn[item] then active[spell] = true; break end
        end
    end
    return active
end

local function buildCtx()
    local b, p, n = UnitAttackPower("player")
    local lo, hi = UnitDamage("player")
    local glyphs = activeGlyphs()
    local talents = activeTalents()
    local equipped = equippedSources()
    -- A spell's %-mana cost is a percentage of BASE mana (a class/level constant), NOT the
    -- player's max mana (which Intellect/gear inflate). Look it up by class+level from the
    -- generated ZepBaseMana table so cost lines match the client; fall back to max mana.
    local lvl = UnitLevel("player")
    -- 3.3.5a UnitClass returns only (localizedName, TOKEN) — the numeric classId 3rd return is
    -- Cata+, so resolve the id from the token (matches player_class_stats / ZepBaseMana keys).
    local classId = CLASS_ID[select(2, UnitClass("player")) or ""]
    local bm = rawget(_G, "ZepBaseMana")
    local baseMana = (bm and classId and bm[classId] and bm[classId][lvl])
                     or UnitPowerMax("player", 0) or 0
    return {
        level = lvl,
        sp = GetSpellBonusDamage and GetSpellBonusDamage(2) or 0,
        ap = (b or 0) + (p or 0) + (n or 0),
        weaponAvg = (lo and hi) and (lo + hi) * 0.5 or 0,
        knows = function(id) return (IsSpellKnown and IsSpellKnown(id)) or glyphs[id] or talents[id] or equipped[id] or false end,
        hasAura = function(id) return auraStacks("player", id) end,
        stat = function(sid) local r = StatReader[sid]; return r and r() or 0 end,
        baseMana = baseMana,
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
local function renderTooltip(tooltip, spellId, isAura)
    if not spellId or ZepTooltipsDB.enabled == false then return end
    local rec = Data[spellId]
    if not rec then return end
    ensureDesc()   -- bring in the desc/tt templates if not yet loaded
    local ctx = buildCtx()
    local shown = false
    local function addLine(text)
        tooltip:AddLine(colorize(text), nil, nil, nil, true)
        shown = true
    end

    -- F-027/F-168 consumables: the restored amount. The Mixology/Alchemist's-Stone/cooking %s
    -- are ordinary ADD_PCT_MODIFIER spellmods the engine already folds in. Food/drink show
    -- per-second (the effect value is per 5s).
    -- gated on no active custom desc-var (dv==0) so it doesn't double up with a var-183/186
    -- desc that still shows the value; activates per-spell as those vars are retired.
    if rec.cons and (rec.dv or 0) == 0 then
        local v = ZepCompute.effectValues(rec, ctx)[rec.cons.eff]
        if v then
            local kind = rec.cons.kind == "mana" and "mana" or "health"
            if rec.cons.ps and rec.cons.dur and rec.cons.dur > 0 then
                -- food/drink: effect value is per-5s; per-second = /5, total = per-sec * duration
                local persec = v.lo / 5
                addLine(string.format("Restores %s %s over %ds (%s/sec)",
                    num(persec * rec.cons.dur), kind, rec.cons.dur, num(persec)))
            else
                addLine("Restores " .. fmt(v) .. " " .. kind)
            end
        end
        if shown then tooltip:Show() end
        return
    end

    -- Phase 6: recomputed text below the native line — the spellbook DESC for a spell tooltip,
    -- the TOOLTIP (spell_tooltip_enus) for an active aura. When shown it conveys the value, so
    -- the terse primary line is dropped.
    local descShown = false
    if ZepDesc then
        local computed = ZepDesc.render(rec, ctx, function(id) return Data[id] end, isAura)
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
        -- per-mod breakdown: each active talent/glyph/aura, its op, magnitude, and the
        -- amount it adds to the primary value
        if ZepCompute.activeMods then
            for _, m in ipairs(ZepCompute.activeMods(rec, ctx)) do
                local nm = (GetSpellInfo and GetSpellInfo(m.src)) or ("#" .. m.src)
                local mag = (m.kind == "pct") and string.format("%+d%%", m.value) or string.format("%+d", m.value)
                local d = (m.delta and math.abs(m.delta) >= 0.5) and string.format(" = %+d", math.floor(m.delta + 0.5)) or ""
                addLine(string.format("  %s %s <- %s%s", mag, OP_LABEL[m.op] or ("op" .. m.op), nm, d))
            end
        end
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
    renderTooltip(self, spellId, true)   -- active aura -> recompute the tooltip text, not the desc
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
        -- pre-load the desc templates ~1s after entering the world (off the loading screen),
        -- so the first tooltip hover doesn't pay the parse cost.
        local delay = 0
        f:SetScript("OnUpdate", function(self, e)
            delay = delay + e
            if delay > 1 then self:SetScript("OnUpdate", nil); ensureDesc() end
        end)
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
    elseif a == "glyphs" then
        -- diagnostic: dump every glyph socket's raw GetGlyphSocketInfo returns so we can see
        -- which position holds the modifier spell id (and whether it matches our $?s<id>).
        local n = (GetNumGlyphSockets and GetNumGlyphSockets()) or 0
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips glyph sockets: " .. n)
        for i = 1, n do
            local r1, r2, r3, r4, r5 = GetGlyphSocketInfo(i)
            DEFAULT_CHAT_FRAME:AddMessage(string.format("  %d: %s | %s | %s | %s | %s",
                i, tostring(r1), tostring(r2), tostring(r3), tostring(r4), tostring(r5)))
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("ZepTooltips: /zeptt on|off | debug | test | glyphs | color r g b")
    end
end
