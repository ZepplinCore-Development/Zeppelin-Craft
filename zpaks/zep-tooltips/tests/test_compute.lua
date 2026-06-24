-- F-190 engine math validation (lua5.1, mocked WoW API). Runs in dev env.
dofile("/workspace/project/Zeppelin-Craft/zpaks/zep-tooltips/mpq/source-assets/Interface/AddOns/ZepTooltips/Compute.lua")
dofile("/tmp/zeptt_data.lua")  -- ZepTooltipData

local function ctx(o)
    o = o or {}
    return {
        level = o.level or 80, sp = o.sp or 0, ap = o.ap or 0, weaponAvg = o.weaponAvg or 0,
        knows = function(id) return o.known and o.known[id] or false end,
        hasAura = function(id) return o.auras and o.auras[id] or false end,
        stat = function(id) return o.stats and o.stats[id] or 0 end,
    }
end

local pass, fail = 0, 0
local function check(label, got, want)
    if math.abs(got - want) < 0.5 then pass = pass + 1; print(string.format("  PASS  %-44s = %.1f", label, got))
    else fail = fail + 1; print(string.format("  FAIL  %-44s = %.1f (want %.1f)", label, got, want)) end
end

local gw, fb, ll = ZepTooltipData[2645], ZepTooltipData[133], ZepTooltipData[60103]

print("=== GW: primaryEffect picks the speed aura (eff 2), not shapeshift ===")
check("GW primaryEffect index", ZepCompute.primaryEffect(gw).i, 2)
local function gwspeed(c) return ZepCompute.effectValues(gw, c)[2].lo end
check("L80 no crop", gwspeed(ctx{}), 100)
check("L80 + Artisan crop", gwspeed(ctx{auras={[100013]=true}}), 116)
check("L40 no crop", gwspeed(ctx{level=40}), 60)
check("L80 + Grand Master crop", gwspeed(ctx{auras={[100015]=true}}), 124)

print("=== Fireball: die-range (min..max), SP-inclusive ===")
check("Fireball primaryEffect index", ZepCompute.primaryEffect(fb).i, 1)
local f0 = ZepCompute.effectValues(fb, ctx{})[1]
check("Fireball min (base+1=14 + 2.4 perlevel)", f0.lo, 16.4)
check("Fireball max (base+die=22 + 2.4 perlevel)", f0.hi, 24.4)
local f1 = ZepCompute.effectValues(fb, ctx{sp=1000})[1]
check("Fireball min + 1000 SP*0.123", f1.lo, 16.4 + 123)

print("=== Lava Lash: weapon path (~99% of weapon avg) ===")
check("Lava Lash, 500 weapon avg", ZepCompute.weapon(ll, ctx{weaponAvg=500}), 495)

print(string.format("\n%d passed, %d failed", pass, fail))
os.exit(fail == 0 and 0 or 1)
