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

print("=== synthetic record: cost / cooldown / crit op math ===")
local synth = {
    cd = true, bl = 0, ml = 0,
    eff = { { i = 1, t = 2, a = 0, b = 99, d = 1, p = 0 } },  -- 100 damage
    sp = { d = 0, o = 0, ap = 0, apo = 0 },
    cost = { f = 100, p = 0, cd = 10000, cdc = 0 },           -- 100 mana, 10s cd
    mods = {
        { src = 1, op = 7,  k = "flat", b = 4,   d = 1, v = "known" }, -- +5% crit
        { src = 2, op = 14, k = "flat", b = -21, d = 1, v = "known" }, -- -20 mana
        { src = 3, op = 11, k = "pct",  b = -51, d = 1, v = "known" }, -- -50% cooldown
    },
}
local sc = ctx{ sp = 0, known = { [1] = true, [2] = true, [3] = true } }
sc.spellCrit = 10
check("crit = base 10 + op7 (+5)", ZepCompute.crit(synth, sc), 15)
local cost, costMod = ZepCompute.cost(synth, sc)
check("cost = 100 + op14(-20)", cost, 80)
check("cost modified flag", costMod and 1 or 0, 1)
local cd, cdMod = ZepCompute.cooldown(synth, sc)
check("cooldown = 10s * (1-50%) = 5s", cd, 5)
check("cooldown modified flag", cdMod and 1 or 0, 1)
-- with nothing known, base values and no modified flag
local sc0 = ctx{}; sc0.spellCrit = 10
local _, cm0 = ZepCompute.cost(synth, sc0)
check("cost not modified when no talent", cm0 and 1 or 0, 0)

print("=== real example: Rockslam (900119) cooldown with Glyph of Rockslam ===")
local rs = ZepTooltipData[900119]
-- 6000ms base; glyph 900270 op-11 flat -1500 (die=0) -> 4500ms = 4.5s exact (no +1)
local cdNo = select(1, ZepCompute.cooldown(rs, ctx{}))
local cdGlyph, gMod = ZepCompute.cooldown(rs, ctx{auras={[900270]=true}})
check("Rockslam base cooldown", cdNo, 6)
check("Rockslam cooldown w/ Glyph (6 - 1.5)", cdGlyph, 4.5)
check("Rockslam cooldown modified by glyph", gMod and 1 or 0, 1)

print("=== Rockslam crit: damage_class=2 -> MELEE crit + Bulwark (op7) talent ===")
local rsc = ctx{ known = { [900202] = true } }   -- Bulwark rank 3 talented
rsc.meleeCrit = 20; rsc.spellCrit = 99           -- spellCrit high to prove it's NOT used
check("Rockslam crit = melee 20 + Bulwark 15", ZepCompute.crit(rs, rsc), 35)
local rsc0 = ctx{}; rsc0.meleeCrit = 20; rsc0.spellCrit = 99
check("Rockslam crit no talent = melee 20", ZepCompute.crit(rs, rsc0), 20)

print("=== Rockslam damage folds in block value (F-189) ===")
-- L80: base 76 + per-level 6*(80-20)=360 + block value 802 = 1238
check("Rockslam dmg + 802 block value", ZepCompute.effectValues(rs, ctx{stats={BLOCK_VALUE=802}})[1].lo, 1238)

print("=== crit damage multiplier (melee 2.0x / spell 1.5x + op15) ===")
check("Rockslam critMult (melee 2.0x)", ZepCompute.critMult(rs, ctx{}), 2.0)
check("Fireball critMult (spell 1.5x)", ZepCompute.critMult(fb, ctx{}), 1.5)
-- op15 +100% crit-damage bonus on a spell: 0.5 * (1 + 100/100) = 1.0 -> mult 2.0
local synth15 = { dc = 1, mods = { { src = 9, op = 15, k = "flat", b = 99, d = 1, v = "known" } } }
check("op15 +100% bonus: spell 1.5x -> 2.0x", ZepCompute.critMult(synth15, ctx{ known = { [9] = true } }), 2.0)

print(string.format("\n%d passed, %d failed", pass, fail))
os.exit(fail == 0 and 0 or 1)
