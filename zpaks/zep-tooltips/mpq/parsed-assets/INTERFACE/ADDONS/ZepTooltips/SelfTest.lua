--[[ ZepTooltips SelfTest — F-190
  Runs the compute engine over a fixed synthetic record (mocked ctx) at login and reports
  any FAILs to chat, and probes the client APIs the addon depends on (catches wrong-API
  bugs like GetShieldBlockValue→GetShieldBlock that the mock-based dev tests miss).
  Silent on success unless verbose; `/zeptt test` runs it loud.
]]

ZepSelfTest = {}

local function mockCtx(o)
    o = o or {}
    return {
        level = o.level or 80, sp = o.sp or 0, ap = o.ap or 0, weaponAvg = o.weaponAvg or 0,
        baseMana = o.baseMana or 0,
        spellCrit = o.spellCrit or 0, meleeCrit = o.meleeCrit or 0, rangedCrit = o.rangedCrit or 0,
        knows = function(id) return o.known and o.known[id] or false end,
        hasAura = function(id) return o.auras and o.auras[id] or false end,
        stat = function(id) return o.stats and o.stats[id] or 0 end,
    }
end

-- Client APIs the StatReader / ctx rely on. A nil here is a wrong-name bug.
local REQUIRED_APIS = {
    "GetShieldBlock", "UnitArmor", "UnitAttackPower", "GetSpellBonusDamage", "GetCritChance",
    "GetSpellCritChance", "GetRangedCritChance", "UnitStat", "UnitHealthMax", "UnitPowerMax",
    "UnitLevel", "UnitDamage", "UnitAura", "IsSpellKnown",
}

function ZepSelfTest.run(verbose)
    if not ZepCompute then return end
    local pass, fails = 0, {}
    local function check(label, got, want)
        if type(got) == "number" and math.abs(got - want) < 0.5 then pass = pass + 1
        else fails[#fails + 1] = string.format("%s = %s (want %.1f)", label, tostring(got), want) end
    end

    -- One synthetic record exercising: base+die, flat EFFECT1 mod, pct DAMAGE mod, SP+AP,
    -- stat scaling, crit (base + op7), cost (op14), cooldown (op11). Expecteds are fixed,
    -- independent of shipped data — so this catches engine-logic regressions.
    local synth = {
        cd = true, bl = 0, ml = 0,
        eff = { { i = 1, t = 2, a = 0, b = 99, d = 1, p = 0 } },     -- base 100
        sp = { d = 0.5, o = 0, ap = 0.2, apo = 0 },
        stat = { { e = 1, s = "BLOCK_VALUE", c = 1 } },
        cost = { f = 100, p = 0, cd = 10000, cdc = 0 },
        mods = {
            { src = 1, op = 3,  k = "flat", b = 9,   d = 1, v = "known" }, -- EFFECT1 +10 flat
            { src = 2, op = 0,  k = "pct",  b = 19,  d = 1, v = "aura"  }, -- DAMAGE +20%
            { src = 3, op = 7,  k = "flat", b = 4,   d = 1, v = "known" }, -- +5% crit
            { src = 4, op = 14, k = "flat", b = -21, d = 1, v = "known" }, -- -20 mana
            { src = 5, op = 11, k = "pct",  b = -51, d = 1, v = "known" }, -- -50% cooldown
        },
    }
    local c = mockCtx{ sp = 100, ap = 50, stats = { BLOCK_VALUE = 30 }, spellCrit = 10,
                       known = { [1] = true, [3] = true, [4] = true, [5] = true }, auras = { [2] = true } }

    -- (100 +10 flat) *1.2 pct = 132; + SP 100*0.5 + AP 50*0.2 = 60 -> 192; + block 30*1 = 222
    local v = ZepCompute.effectValues(synth, c)[1]
    check("value", v and v.lo, 222)
    check("crit", ZepCompute.crit(synth, c), 15)
    check("cost", (ZepCompute.cost(synth, c)), 80)
    check("cooldown", (ZepCompute.cooldown(synth, c)), 5)

    local missing = {}
    for _, a in ipairs(REQUIRED_APIS) do
        if type(_G[a]) ~= "function" then missing[#missing + 1] = a end
    end

    if #fails > 0 or #missing > 0 then
        DEFAULT_CHAT_FRAME:AddMessage(string.format("|cffff4040ZepTooltips self-test FAILED|r (%d math ok):", pass))
        for _, f in ipairs(fails) do DEFAULT_CHAT_FRAME:AddMessage("  math: " .. f) end
        for _, a in ipairs(missing) do DEFAULT_CHAT_FRAME:AddMessage("  client API missing: " .. a .. "()") end
    elseif verbose then
        DEFAULT_CHAT_FRAME:AddMessage(string.format("|cff66ccffZepTooltips|r self-test: %d passed, %d APIs ok.", pass, #REQUIRED_APIS))
    end
    return #fails, #missing
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function() ZepSelfTest.run(false) end)
