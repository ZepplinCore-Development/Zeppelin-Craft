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

local OP_EFFECT = { [3] = 1, [12] = 2, [23] = 3 }   -- EFFECT1/2/3 — modify one effect's base points
local OP_ALL_EFFECTS = 8                            -- modify ALL effects' base points
-- DAMAGE (0) / DOT (22) are TOTAL multipliers: AC applies them in SpellDamageBonusDone,
-- AFTER the SP/AP coefficient, so they scale the SP/AP-inclusive hit (e.g. Rocksteady).
local OP_TOTAL = { [0] = true, [22] = true }

-- effects we display a computed number for (excludes weapon types — handled separately)
local VALUE_TYPE = { [2] = true, [10] = true }          -- SCHOOL_DAMAGE / HEAL
-- Movement-speed auras -> the kind of speed they grant (membership also = "is a speed aura").
-- A mount can carry several (a flying mount = Flight + Ground; a turtle = Ground + Swim), so we
-- render one labelled line per speed effect rather than a single "Speed". Ground: 31 run, 32
-- mounted, 129/130 always. Swim: 58. Flight: 206 flight, 207 mounted-flight, 208-211 stacking
-- / non-stacking variants. Without these a mount's flight/swim speed never renders on the TT
-- (primaryEffect/isSpeed didn't recognise the effect); the spellbook desc shows it via $s.
local SPEED_LABEL = {
    [31] = "Ground", [32] = "Ground", [129] = "Ground", [130] = "Ground",
    [58] = "Swim",
    [206] = "Flight", [207] = "Flight", [208] = "Flight",
    [209] = "Flight", [210] = "Flight", [211] = "Flight",
}
local PERIODIC_AURA = { [3] = true, [8] = true }        -- periodic damage / heal

-- Stack-aware presence -> the multiplier to apply this mod by. A known talent applies
-- once (1); an aura applies once per stack (its UnitAura count). AC scales every aura's
-- spellmod amount by GetStackAmount() (SpellAuraEffects.cpp:580), so e.g. Rocksteady
-- scales Rocksurge per stack. Returns 0 when the mod's source isn't present.
-- (`via` is a hint; we check both knows and aura.)
local function modStacks(ctx, m)
    if ctx.excl == m then return 0 end   -- exclude THIS mod (identity) for the debug per-mod
    if ctx.knows(m.src) then return 1 end -- delta — not the whole source, else a multi-effect
    return ctx.hasAura(m.src) or 0        -- source (e.g. a riding crop) credits every line its total
end

-- Applied modifier value: base + die_sides (die=1 -> the classic +1; die=0 -> exact base).
local function modValue(m)
    return m.b + (m.d or 0)
end

-- Apply one mod (* stack count) to an effect's {lo,hi}: flat adds, pct multiplies.
local function applyMod(v, m, stacks)
    if m.k == "flat" then
        local f = modValue(m) * stacks
        v.lo = v.lo + f; v.hi = v.hi + f
    else
        local mul = 1 + modValue(m) * stacks / 100
        v.lo = v.lo * mul; v.hi = v.hi * mul
    end
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

    -- base-point modifiers (EFFECT1/2/3, ALL_EFFECTS) — applied to base BEFORE SP/AP.
    -- AC accumulates non-DAMAGE pct mods ADDITIVELY (totalmul += value/100), so e.g. Mixology
    -- +10% and Alchemist's Stone +40% give +50% (not *1.1*1.4). Flats add, then *(1+Σpct).
    local flatAdd, pctSum = {}, {}
    for _, m in ipairs(rec.mods or {}) do
        local stacks = modStacks(ctx, m)
        if stacks > 0 then
            local targets
            local te = OP_EFFECT[m.op]
            if te then targets = { te }
            elseif m.op == OP_ALL_EFFECTS then targets = {}; for i in pairs(out) do targets[#targets + 1] = i end end
            if targets then
                for _, i in ipairs(targets) do
                    if out[i] then
                        if m.k == "flat" then flatAdd[i] = (flatAdd[i] or 0) + modValue(m) * stacks
                        else pctSum[i] = (pctSum[i] or 0) + modValue(m) * stacks end
                    end
                end
            end
        end
    end
    for i, v in pairs(out) do
        local mul = 1 + (pctSum[i] or 0) / 100
        v.lo = (v.lo + (flatAdd[i] or 0)) * mul
        v.hi = (v.hi + (flatAdd[i] or 0)) * mul
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

    -- F-189 stat scaling: fold stat*coeff into its effect's value (e.g. Rockslam + block
    -- value). Goes into the displayed number, not a separate line.
    if rec.stat then
        for _, s in ipairs(rec.stat) do
            local v = out[s.e]
            if v and s.c then
                local add = (ctx.stat and ctx.stat(s.s) or 0) * s.c
                v.lo = v.lo + add; v.hi = v.hi + add
            end
        end
    end

    -- total-damage modifiers (DAMAGE/DOT) — multiply the done total LAST, like AC's
    -- SpellDamageBonusDone, so they scale the SP/AP- and stat-inclusive hit (e.g. the
    -- Rocksteady buff scaling Rocksurge per stack).
    for _, m in ipairs(rec.mods or {}) do
        if OP_TOTAL[m.op] then
            local stacks = modStacks(ctx, m)
            if stacks > 0 then
                for _, v in pairs(out) do applyMod(v, m, stacks) end
            end
        end
    end

    return out
end

-- Human-readable label per F-189 stat id (for the scaling-source line).
local STAT_LABEL = {
    BLOCK_VALUE = "block value", ARMOR = "armor", ATTACK_POWER = "Attack Power",
    SPELL_POWER = "Spell Power", STAMINA = "Stamina", STRENGTH = "Strength",
    AGILITY = "Agility", INTELLECT = "Intellect", SPIRIT = "Spirit", MAX_HEALTH = "maximum health",
}

-- What a spell scales with, as an ordered de-duped label list (Attack Power, Spell Power,
-- block value, armor, ...). The DBC desc no longer states the source; the addon does.
-- Follows cross-spell $<id>sN refs in the desc so a proc/trigger spell reports the source
-- that lives on the spell it points at (e.g. VS -> the armor-scaled eruption).
function ZepCompute.scalingSources(rec, getRec)
    local seen, order = {}, {}
    local function add(label)
        if label and not seen[label] then seen[label] = true; order[#order + 1] = label end
    end
    local function collect(r)
        if not r then return end
        if r.sp then
            if (r.sp.ap or 0) ~= 0 or (r.sp.apo or 0) ~= 0 then add("Attack Power") end
            if (r.sp.d or 0) ~= 0 or (r.sp.o or 0) ~= 0 then add("Spell Power") end
        end
        for _, s in ipairs(r.stat or {}) do add(STAT_LABEL[s.s] or s.s) end
    end
    collect(rec)
    if rec.desc and getRec then
        for id in rec.desc:gmatch("%$(%d+)[sSoOmM]%d") do collect(getRec(tonumber(id))) end
    end
    return order
end

-- Active modifiers on a spell (debug breakdown): each spellmod the player actually has
-- (talent/glyph/aura), with its op, applied magnitude (* stacks), and the DELTA it adds to
-- the primary effect (re-run effectValues with that source excluded). delta is nil for mods
-- that don't touch the primary value (crit/cost/cooldown).
function ZepCompute.activeMods(rec, ctx)
    local out = {}
    local pe = ZepCompute.primaryEffect(rec)
    local full = pe and ZepCompute.effectValues(rec, ctx)[pe.i] or nil
    for _, m in ipairs(rec.mods or {}) do
        local stacks = modStacks(ctx, m)
        if stacks > 0 then
            local delta
            if full then
                local ctx2 = setmetatable({ excl = m }, { __index = ctx })
                local without = ZepCompute.effectValues(rec, ctx2)[pe.i]
                if without then delta = full.lo - without.lo end
            end
            out[#out + 1] = { src = m.src, op = m.op, kind = m.k, value = modValue(m) * stacks, delta = delta }
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
        if m.op == op then
            local stacks = modStacks(ctx, m)
            if stacks > 0 then
                if m.k == "flat" then base = base + modValue(m) * stacks
                else base = base * (1 + modValue(m) * stacks / 100) end
            end
        end
    end
    return base
end

-- Mana cost (flat + % of base mana) after SPELLMOD_COST (op 14). Returns (value, modified).
-- The server TRUNCATES (CalculatePct floors the %-of-base-mana part to an int before talent
-- cost mods, and the final cost is an int) — so we floor to match, not round, else we over-
-- report by 1 on a fractional cost (e.g. 221.6 -> client 221, naive round 222).
function ZepCompute.cost(rec, ctx)
    if not rec or not rec.cost then return 0, false end
    local base = (rec.cost.f or 0) + math.floor((rec.cost.p or 0) / 100 * (ctx.baseMana or 0))
    local v = math.floor(math.max(0, applyOp(rec, ctx, 14, base)))
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
        if m.op == 7 and m.k == "flat" then
            local stacks = modStacks(ctx, m)
            if stacks > 0 then c = c + modValue(m) * stacks end
        end
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
        if m.op == 15 then
            local stacks = modStacks(ctx, m)
            if stacks > 0 then extra = extra + modValue(m) * stacks end
        end
    end
    return 1 + bonus * (1 + extra / 100)
end

-- First effect worth displaying a number for; nil if none. (weapon handled separately)
function ZepCompute.primaryEffect(rec)
    if not rec or not rec.eff then return nil end
    for _, e in ipairs(rec.eff) do
        if VALUE_TYPE[e.t] or SPEED_LABEL[e.a] or PERIODIC_AURA[e.a] then return e end
    end
    return nil
end

function ZepCompute.isSpeed(e) return e and SPEED_LABEL[e.a] ~= nil or false end

-- Every movement-speed effect on the spell, in order, with its kind label (Ground / Flight /
-- Swim) — a hybrid mount has more than one (flight + ground, or ground + swim), each shown as
-- its own line. Empty for non-speed spells.
function ZepCompute.speedEffects(rec)
    local out = {}
    if not rec or not rec.eff then return out end
    for _, e in ipairs(rec.eff) do
        local label = SPEED_LABEL[e.a]
        if label then out[#out + 1] = { i = e.i, label = label } end
    end
    return out
end
