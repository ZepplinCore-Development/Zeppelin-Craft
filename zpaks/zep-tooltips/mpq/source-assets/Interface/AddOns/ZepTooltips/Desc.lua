--[[ ZepTooltips Desc — F-190 Phase 6
  Interprets a spell's raw desc template (stock Blizzard tokens) against the live ctx +
  compute engine, producing a copy with REAL numbers. Rendered BELOW the native desc
  (Blizzard's line keeps its base/"garbage" numbers; ours sits under it).

  Supported tokens (the set our custom content uses):
    $sN $SN      self effect N value (min / max)         -> ZepCompute.effectValues(rec)[N]
    $oN          self effect N periodic value
    $<id>sN ...  cross-spell: spell <id>'s effect N       -> effectValues(Data[id])[N]
    $?sN[A][B]   if the player KNOWS spell N -> A else B  (nested tokens interpreted)
    $?aN[A][B]   if the player HAS aura N    -> A else B
    $d           duration (seconds) from the record
  Unknown tokens ($<var>, $g, $l, ...) pass through unchanged so the line stays readable.
]]

ZepDesc = {}

local floor, abs = math.floor, math.abs
local function round(x) return floor(x + 0.5) end

-- Computed value of a record's effect N (1-based). useMax -> the high end of a die range.
local function effectValue(ctx, rec, n, useMax)
    if not rec then return nil end
    local v = ZepCompute.effectValues(rec, ctx)[n]
    if not v then return nil end
    return useMax and v.hi or v.lo
end

-- Display string for a record's effect N. mode "range" ($s/$o) shows "lo to hi" for a die
-- spread (matches the client) and a single number when there's none; "lo" ($m) / "hi" ($S/$M).
local function effectRange(ctx, rec, n, mode)
    if not rec then return nil end
    local v = ZepCompute.effectValues(rec, ctx)[n]
    if not v then return nil end
    local lo, hi = round(abs(v.lo)), round(abs(v.hi))
    if mode == "hi" then return tostring(hi) end
    if mode == "lo" then return tostring(lo) end
    if lo ~= hi then return lo .. " to " .. hi end
    return tostring(lo)
end

-- Read a balanced [...] block; s:sub(i,i) must be '['. Returns inner, position-after-']'.
local function readBlock(s, i)
    local depth = 0
    for j = i, #s do
        local c = s:sub(j, j)
        if c == '[' then depth = depth + 1
        elseif c == ']' then
            depth = depth - 1
            if depth == 0 then return s:sub(i + 1, j - 1), j + 1 end
        end
    end
    return s:sub(i + 1), #s + 1   -- unbalanced: take the remainder
end

local interpret   -- forward declaration (conditionals recurse)

-- Duration seconds -> "N min" / "N sec" (matches the client's unit choice).
local function durfmt(d)
    if d >= 60 and d % 60 == 0 then return (d / 60) .. " min" end
    return d .. " sec"
end

-- Read a balanced {...} block; s:sub(i,i) must be '{'. Returns inner, position-after-'}'.
local function readBrace(s, i)
    local depth = 0
    for j = i, #s do
        local c = s:sub(j, j)
        if c == '{' then depth = depth + 1
        elseif c == '}' then
            depth = depth - 1
            if depth == 0 then return s:sub(i + 1, j - 1), j + 1 end
        end
    end
    return s:sub(i + 1), #s + 1
end

-- Resolve a $-token NAME (no leading $) to a number, for arithmetic inside ${...}.
-- Handles $sN/$mN/$oN (self + cross-spell $<id>sN) and the scaling operands $pl/$AP/$sp/$bv.
local function tokenNum(name, rec, ctx, getRec)
    local id, k, n = name:match("^(%d+)([sSmMoO])(%d)$")   -- cross-spell $<id>sN
    if id then return effectValue(ctx, getRec and getRec(tonumber(id)), tonumber(n), k == "S" or k == "M" or k == "O") end
    local sk, sn = name:match("^([sSmMoO])(%d)$")           -- self $sN/$mN/$oN
    if sk then return effectValue(ctx, rec, tonumber(sn), sk == "S" or sk == "M") end
    if name == "pl" then return ctx.level end
    if name == "AP" then return ctx.ap end
    if name == "sp" then return ctx.sp end
    if name == "bv" then return ctx.stat and ctx.stat("BLOCK_VALUE") end
    return nil
end

-- Evaluate ${expr}: substitute $-tokens with numbers, then evaluate the arithmetic.
-- Returns a number, or nil if a token/operator is unsupported (caller passes the literal through).
local function evalExpr(expr, rec, ctx, getRec)
    local resolved = true
    local sub = expr:gsub("%$(%w+)", function(name)
        local v = tokenNum(name, rec, ctx, getRec)
        if v then return string.format("%.6g", v) else resolved = false; return "0" end
    end)
    if not resolved then return nil end
    if sub:find("[^%d%.%+%-%*/%%%(%) ]") then return nil end   -- numeric arithmetic only
    local f = loadstring and loadstring("return " .. sub)
    if not f then return nil end
    local good, res = pcall(f)
    if good and type(res) == "number" then return res end
    return nil
end

-- Resolve the $token at position i (s:sub(i,i) == '$'). Returns replacement, nextPos, bad
-- (bad=true => unresolved; the literal text passes through. The flag is kept for debug.)
local function token(s, i, rec, ctx, getRec)
    local r = s:sub(i)

    -- conditional: $?sN[A][B] (knows spell) / $?aN[A][B] (has aura)
    local kind, id = r:match("^%$%?([sa])(%d+)%[")
    if kind then
        local p = i + 3 + #id                 -- first '['
        local a, p2 = readBlock(s, p)
        local b = ""
        if s:sub(p2, p2) == '[' then b, p2 = readBlock(s, p2) end
        local on = (kind == "s") and (ctx.knows(tonumber(id)) and true or false)
                                  or ((ctx.hasAura(tonumber(id)) or 0) > 0)
        local bs, bok = interpret(on and a or b, rec, ctx, getRec)
        return bs, p2, not bok
    end

    -- arithmetic ${expr}
    if r:sub(1, 2) == "${" then
        local expr, p2 = readBrace(s, i + 1)
        local v = evalExpr(expr, rec, ctx, getRec)
        if v then return tostring(round(v)), p2 end
        return s:sub(i, p2 - 1), p2, true
    end

    -- divide $/N;sX -> $sX / N  (e.g. $/1000;s1)
    local div, dk, dn = r:match("^%$/(%d+);([sSmMoO])(%d)")
    if div then
        local nextp = i + 3 + #div + 2        -- $ / digits ; letter digit
        local v = effectValue(ctx, rec, tonumber(dn), dk == "S" or dk == "M")
        if v then return tostring(round(v / tonumber(div))), nextp end
        return s:sub(i, nextp - 1), nextp, true
    end

    -- cross-spell: $<id>aN radius, $<id>d duration, $<id>[sSoOmM]N value
    local xid = r:match("^%$(%d+)")
    if xid then
        local rec2 = getRec and getRec(tonumber(xid))
        local rest = r:sub(2 + #xid)          -- chars after "$<id>"
        local an = rest:match("^a(%d)")
        if an then
            local nextp = i + 1 + #xid + 2
            local rad = rec2 and rec2.rad and rec2.rad[tonumber(an)]
            if rad then return tostring(round(rad)), nextp end
            return s:sub(i, nextp - 1), nextp, true
        end
        if rest:match("^d") then
            local nextp = i + 1 + #xid + 1
            if rec2 and rec2.dur then return durfmt(rec2.dur), nextp end
            return s:sub(i, nextp - 1), nextp, true
        end
        local vk, vn = rest:match("^([sSoOmM])(%d)")
        if vk then
            local nextp = i + 1 + #xid + 2
            local mode = (vk == "s" or vk == "o") and "range" or (vk == "m" and "lo" or "hi")
            local txt = effectRange(ctx, rec2, tonumber(vn), mode)
            if txt then return txt, nextp end
            return s:sub(i, nextp - 1), nextp, true
        end
    end

    -- self radius $aN
    local an = r:match("^%$a(%d)")
    if an then
        local rad = rec and rec.rad and rec.rad[tonumber(an)]
        if rad then return tostring(round(rad)), i + 3 end
        return s:sub(i, i + 2), i + 3, true
    end

    -- self value: $sN / $SN / $oN / $mN / $MN
    local sk, sn = r:match("^%$([sSoOmM])(%d)")
    if sk then
        local mode = (sk == "s" or sk == "o") and "range" or (sk == "m" and "lo" or "hi")
        local txt = effectRange(ctx, rec, tonumber(sn), mode)
        if txt then return txt, i + 3 end
        return s:sub(i, i + 2), i + 3, true
    end

    -- self duration $d
    if r:match("^%$d") and rec and rec.dur then
        return durfmt(rec.dur), i + 2
    end

    -- unhandled ($<var>, $g, $l, $d-without-dur, ...): pass through as a literal (spottable)
    return "$", i + 1, true
end

interpret = function(template, rec, ctx, getRec)
    if not template or template == "" then return "", true end
    local out, i, n, ok = {}, 1, #template, true
    while i <= n do
        if template:sub(i, i) == '$' then
            local rep, nextp, bad = token(template, i, rec, ctx, getRec)
            out[#out + 1] = rep
            if bad then ok = false end
            i = nextp
        else
            out[#out + 1] = template:sub(i, i)
            i = i + 1
        end
    end
    return table.concat(out), ok
end

-- Public: the recomputed desc string, or nil if the template has tokens we can't resolve
-- (caller then falls back to the native desc + the computed value line). No template -> nil.
-- useTt -> recompute the active-aura tooltip (spell_tooltip_enus); else the spellbook desc.
function ZepDesc.render(rec, ctx, getRec, useTt)
    if not rec then return nil end
    local template = (useTt and rec.tt) or rec.desc
    if not template then return nil end
    -- returns (text, ok). ok=false if a token couldn't resolve (it passes through as a literal,
    -- e.g. a client-side SpellDescriptionVariable like $<flyingspeed> the engine doesn't
    -- implement). The caller can then prefer the structured lines over a literal-bearing recompute.
    return interpret(template, rec, ctx, getRec)
end

-- Exposed for tests.
ZepDesc._interpret = interpret
