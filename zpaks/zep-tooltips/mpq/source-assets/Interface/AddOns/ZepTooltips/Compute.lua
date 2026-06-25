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

-- The `via` field is a hint; check both so talents (knows) AND glyphs/equip/buffs
-- (hasAura) are detected regardless of how the source was classified.
local function playerHas(ctx, m)
    return ctx.knows(m.src) or ctx.hasAura(m.src)
end

-- Applied modifier value: base + die_sides (die=1 -> the classic +1; die=0 -> exact base).
local function modValue(m)
    return m.b + (m.d or 0)
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
                        local f = modValue(m)
                        v.lo = v.lo + f; v.hi = v.hi + f
                    else
                        local mul = 1 + modValue(m) / 100
                        v.lo = v.lo * mul; v.hi = v.hi * mul
                    end
                end
            end
        end
    end

    if rec.sp then
        -- apply SP/AP to the DISPLAYED (primary) effect, not the first effect — which may
        -- be an aura (e.g. Earth Shock's damage is effect 2). DoT effects use the dot coeffs.
        local pe = ZepCompute.primaryEffect(rec)
        local v = pe and out[pe.i]
        if v then
            local isDot = (pe.a == 3 or pe.a == 8)
            local spc = isDot and (rec.sp.o or 0) or (rec.sp.d or 0)
            local apc = isDot and (rec.sp.apo or 0) or (rec.sp.ap or 0)
            local bonus = (ctx.sp or 0) * spc + (ctx.ap or 0) * apc
            v.lo = v.lo + bonus; v.hi = v.hi + bonus
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

-- Apply the player's matched mods of one SpellModOp to a base value (flat = +base+1,
-- pct = *(1 + (base+1)/100); cost/cooldown reductions encode as negative bases).
local function applyOp(rec, ctx, op, base)
    for _, m in ipairs(rec.mods or {}) do
        if m.op == op and playerHas(ctx, m) then
            if m.k == "flat" then base = base + modValue(m)
            else base = base * (1 + modValue(m) / 100) end
        end
    end
    return base
end

-- Mana cost (flat + % of base mana) after SPELLMOD_COST (op 14). Returns (value, modified).
function ZepCompute.cost(rec, ctx)
    if not rec or not rec.cost then return 0, false end
    local base = (rec.cost.f or 0) + (rec.cost.p or 0) / 100 * (ctx.baseMana or 0)
    local v = math.max(0, applyOp(rec, ctx, 14, base))
    return v, math.abs(v - base) >= 1
end

-- Cooldown in seconds after SPELLMOD_COOLDOWN (op 11). Returns (seconds, modified).
function ZepCompute.cooldown(rec, ctx)
    if not rec or not rec.cost then return 0, false end
    local base = math.max(rec.cost.cd or 0, rec.cost.cdc or 0)
    local v = math.max(0, applyOp(rec, ctx, 11, base))
    return v / 1000, math.abs(v - base) >= 1
end

-- Crit chance %: base crit from the stat matching the spell's damage_class (melee /
-- ranged / spell), plus SPELLMOD_CRIT_CHANCE (op 7) talent bonuses for this spell.
function ZepCompute.crit(rec, ctx)
    local dc = rec.dc or 0
    local c = (dc == 2 and ctx.meleeCrit) or (dc == 3 and ctx.rangedCrit) or ctx.spellCrit or 0
    for _, m in ipairs(rec.mods or {}) do
        if m.op == 7 and m.k == "flat" and playerHas(ctx, m) then c = c + modValue(m) end
    end
    return c
end

-- Crit damage multiplier: spell crits 1.5x, melee/ranged crits 2.0x; the bonus portion
-- is increased by SPELLMOD_CRIT_DAMAGE_BONUS (op 15) talents (e.g. Ruin-style).
function ZepCompute.critMult(rec, ctx)
    local dc = rec.dc or 0
    local bonus = (dc == 2 or dc == 3) and 1.0 or 0.5
    local extra = 0
    for _, m in ipairs(rec.mods or {}) do
        if m.op == 15 and playerHas(ctx, m) then extra = extra + modValue(m) end
    end
    return 1 + bonus * (1 + extra / 100)
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
