-- F-190 engine math validation (lua5.1, mocked WoW API). Runs in dev env.
math = math or require("math")
dofile("/workspace/project/Zeppelin-Craft/zpaks/zep-tooltips/mpq/source-assets/Interface/AddOns/ZepTooltips/Compute.lua")
dofile("/tmp/zeptt_data.lua")  -- defines ZepTooltipData

local function ctx(level, sp, ap, known, auras)
    return {
        level = level, sp = sp or 0, ap = ap or 0, weaponAvg = 0,
        knows = function(id) return known and known[id] or false end,
        hasAura = function(id) return auras and auras[id] or false end,
    }
end

local function approx(a, b) return math.abs(a - b) < 0.5 end
local pass, fail = 0, 0
local function check(label, got, want)
    if approx(got, want) then pass = pass + 1; print(string.format("  PASS  %-46s = %.1f", label, got))
    else fail = fail + 1; print(string.format("  FAIL  %-46s = %.1f (want %.1f)", label, got, want)) end
end

local gw = ZepTooltipData[2645]
local fb = ZepTooltipData[133]

print("=== Ghost Wolf (2645) speed = effect 2 ===")
-- L80, no modifiers: base 20 + per-level capped at 60 -> 2*(60-20)=80 -> 100
check("L80, no crop/talent", ZepCompute.effectValues(gw, ctx(80))[2], 100)
-- L80 + Artisan crop (100013): +16 -> 116  (the user's in-game case)
check("L80 + Artisan crop (100013)", ZepCompute.effectValues(gw, ctx(80, 0, 0, nil, {[100013]=true}))[2], 116)
-- L40 (below cap): base 20 + 2*(40-20)=40 -> 60
check("L40, no crop", ZepCompute.effectValues(gw, ctx(40))[2], 60)
-- L80 + Grand Master crop (100015, base 23 -> +24) -> 124
check("L80 + Grand Master crop (100015)", ZepCompute.effectValues(gw, ctx(80, 0, 0, nil, {[100015]=true}))[2], 124)

print("=== Fireball rank 1 (133) direct damage = effect 1 (approx; SP-inclusive) ===")
-- base 13 + die 9 -> 22 (max-roll point); per-level p=0.6 capped at ml=5: 0.6*(5-1)=2.4 -> 24.4
-- + SP*0.123. With 1000 SP: +123 -> ~147.4
local v0 = ZepCompute.effectValues(fb, ctx(80, 0))[1]
local v1000 = ZepCompute.effectValues(fb, ctx(80, 1000))[1]
print(string.format("  Fireball base(no SP) eff1 = %.1f ; with 1000 SP = %.1f (delta %.1f = 1000*0.123)", v0, v1000, v1000 - v0))
check("Fireball SP delta = 1000 * 0.123", v1000 - v0, 123)

print(string.format("\n%d passed, %d failed", pass, fail))
os.exit(fail == 0 and 0 or 1)
