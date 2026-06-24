--[[ ZepTooltips Compute — F-190 forked combine-engine (Layer 2)

  Consumes the Phase-1d generated record (base/die/per-level, SP/AP coeffs, weapon,
  stat, auto-discovered modifier list) + live player state -> real per-effect value,
  including the SP/AP and modifiers stock 3.3.5a never folds into the tooltip.

  Driven entirely by OUR generated coefficients (never retail constants) and OUR
  auto-discovered modifiers (a new talent that boosts a spell just works on regen).

  Pure: all player state comes through `ctx` (real WoW API in-game, mocks in test):
    ctx.level, ctx.sp, ctx.ap, ctx.weaponAvg
    ctx.knows(id) -> bool   (passive talents)        ctx.hasAura(id) -> bool   (equip/buff)
    ctx.stat(statId) -> number   (F-189 stat readers)

  Staged op coverage: value ops (EFFECT1/2/3, ALL_EFFECTS, DAMAGE, DOT) applied;
  cast-time/cost/cooldown/crit recognised but don't change the damage number yet.
]]

ZepCompute = ZepCompute or {}

local OP_EFFECT = { [3] = 1, [12] = 2, [23] = 3 }       -- EFFECT1/2/3
local OP_ALL = { [0] = true, [8] = true, [22] = true }  -- DAMAGE/ALL_EFFECTS/DOT

-- effects we display a computed number for (excludes weapon types — handled separately)
local VALUE_TYPE = { [2] = true, [10] = true }          -- SCHOOL_DAMAGE / HEAL
local SPEED_AURA = { [31] = true, [32] = true, [129] = true }
local PERIODIC_AURA = { [3] = true, [8] = true }        -- periodic damage / heal

local function playerHas(ctx, m)
    if m.v == "known" then return ctx.knows(m.src) end
    return ctx.hasAura(m.src)
end

-- Per-effect {lo,hi}: base(+1) .. base+die, + per-level (capped at max_level), then the
-- player's matched modifiers (flat / pct), then SP/AP via OUR coefficients.
function ZepCompute.effectValues(rec, ctx)
    local out = {}
    if not rec or not rec.eff then return out end

    for _, e in ipairs(rec.eff) do
        local lo = e.b + ((e.d and e.d > 0) and 1 or 0)
        local hi = e.b + (e.d or 0)
        if e.p and e.p ~= 0 then
            local cap = (rec.ml and rec.ml > 0) and math.min(ctx.level, rec.ml) or ctx.level
            if cap > (rec.bl or 0) then
                local add = e.p * (cap - rec.bl)
                lo = lo + add; hi = hi + add
            end
        end
        out[e.i] = { lo = lo, hi = hi }
    end

    for _, m in ipairs(rec.mods or {}) do
        if playerHas(ctx, m) then
            local targets = {}
            local te = OP_EFFECT[m.op]
            if te then targets[1] = te
            elseif OP_ALL[m.op] then for i in pairs(out) do targets[#targets + 1] = i end end
            for _, i in ipairs(targets) do
                local v = out[i]
                if v then
                    if m.k == "flat" then
                        local f = m.b + 1
                        v.lo = v.lo + f; v.hi = v.hi + f
                    else
                        local mul = 1 + (m.b + 1) / 100
                        v.lo = v.lo * mul; v.hi = v.hi * mul
                    end
                end
            end
        end
    end

    if rec.sp then
        for _, e in ipairs(rec.eff) do
            local v = out[e.i]
            if v then
                local bonus = (ctx.sp or 0) * (rec.sp.d or 0) + (ctx.ap or 0) * (rec.sp.ap or 0)
                v.lo = v.lo + bonus; v.hi = v.hi + bonus
                break  -- direct coeff on the first value effect; DoT refinement later
            end
        end
    end
    return out
end

-- Weapon-damage spells (effects 17/31/58/121): use the player's weapon, not base points.
function ZepCompute.weapon(rec, ctx)
    if not rec or not rec.weapon then return 0 end
    local pct, flat, uses = nil, 0, false
    for _, e in ipairs(rec.weapon) do
        if e.t == 31 then pct = (pct or 0) + e.b; uses = true
        else uses = true; flat = flat + e.b end
    end
    if not uses then return 0 end
    local w = ctx.weaponAvg or 0
    if pct then return w * (pct / 100) + flat end
    return w + flat
end

-- F-189 stat scaling: sum stat * coeff (armor/stamina/...) from the player's stats.
function ZepCompute.stat(rec, ctx)
    if not rec or not rec.stat then return 0 end
    local total = 0
    for _, s in ipairs(rec.stat) do
        if s.c then total = total + (ctx.stat and ctx.stat(s.s) or 0) * s.c end
    end
    return total
end

-- First effect worth displaying a number for; nil if none. (weapon handled separately)
function ZepCompute.primaryEffect(rec)
    if not rec or not rec.eff then return nil end
    for _, e in ipairs(rec.eff) do
        if VALUE_TYPE[e.t] or SPEED_AURA[e.a] or PERIODIC_AURA[e.a] then return e end
    end
    return nil
end

function ZepCompute.isSpeed(e) return e and SPEED_AURA[e.a] or false end
