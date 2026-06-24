--[[ ZepTooltips Compute — F-190 forked combine-engine (Layer 2)

  Consumes the Phase-1d generated record (base/die/per-level, SP/AP coeffs, weapon,
  stat, and the auto-discovered modifier list) + live player state, and produces the
  real per-effect value — the SP/AP-inclusive number stock 3.3.5a never shows.

  Modelled on DrDamage's combine math but driven entirely by OUR generated coefficients
  (never retail constants) and OUR auto-discovered modifiers (so a new talent that
  boosts a spell just works once the data regenerates).

  ctx is injected (real WoW API in-game, mocks in test) so the math is unit-testable:
    ctx.level, ctx.sp, ctx.ap, ctx.weaponAvg
    ctx.knows(spellId)  -> bool   (passive talents — IsSpellKnown)
    ctx.hasAura(spellId)-> bool   (equip/buff auras — UnitAura scan)

  Op coverage is staged: value ops (EFFECT1/2/3, ALL_EFFECTS, DAMAGE, DOT) are applied;
  cast-time/cost/cooldown/crit ops are recognised but don't change the damage number.
  Refinement (die>1 ranges, rank SP penalty, crit) tracked by the Phase-5 parity harness.
]]

ZepCompute = ZepCompute or {}

-- SpellModOp -> target effect index for "modify this effect's value" ops.
local OP_EFFECT = { [3] = 1, [12] = 2, [23] = 3 }   -- EFFECT1 / EFFECT2 / EFFECT3
-- ops that scale a damage/heal value as a whole (apply to every value effect)
local OP_ALL = { [0] = true, [8] = true, [22] = true }  -- DAMAGE / ALL_EFFECTS / DOT

-- +1 (die_sides) convention: a point-value effect/mod applies base + die (die==1 -> +1).
local function pointValue(base, die)
    return base + (die or 0)
end

local function playerHas(ctx, m)
    if m.v == "known" then return ctx.knows(m.src) end
    return ctx.hasAura(m.src)
end

-- Compute per-effect values for a record. Returns a table {effIndex = value}.
function ZepCompute.effectValues(rec, ctx)
    local val = {}
    if not rec or not rec.eff then return val end

    -- 1. base (+die) + per-level, capped at max_level
    for _, e in ipairs(rec.eff) do
        local v = pointValue(e.b, e.d)
        if e.p and e.p ~= 0 then
            local cap = (rec.ml and rec.ml > 0) and math.min(ctx.level, rec.ml) or ctx.level
            if cap > (rec.bl or 0) then
                v = v + e.p * (cap - rec.bl)
            end
        end
        val[e.i] = v
    end

    -- 2. apply the modifiers the player actually has
    for _, m in ipairs(rec.mods or {}) do
        if playerHas(ctx, m) then
            local te = OP_EFFECT[m.op]
            local applyTo = {}
            if te then
                applyTo[#applyTo + 1] = te
            elseif OP_ALL[m.op] then
                for idx in pairs(val) do applyTo[#applyTo + 1] = idx end
            end
            for _, idx in ipairs(applyTo) do
                if val[idx] then
                    if m.k == "flat" then
                        val[idx] = val[idx] + pointValue(m.b, 1)        -- flat mods: +1 convention
                    else -- pct
                        val[idx] = val[idx] * (1 + pointValue(m.b, 1) / 100)
                    end
                end
            end
            -- non-value ops (CASTING_TIME 10, COOLDOWN 11, COST 14, CRIT 7, 15...) don't
            -- change the damage number; handled by other tooltip lines later.
        end
    end

    -- 3. SP/AP scaling (our coefficients). Applied to the primary value effect.
    if rec.sp then
        for _, e in ipairs(rec.eff) do
            if val[e.i] then
                if rec.sp.d and rec.sp.d ~= 0 then val[e.i] = val[e.i] + ctx.sp * rec.sp.d end
                if rec.sp.ap and rec.sp.ap ~= 0 then val[e.i] = val[e.i] + ctx.ap * rec.sp.ap end
                break -- direct coeff applies to the first value effect; DoT refinement later
            end
        end
    end

    return val
end
