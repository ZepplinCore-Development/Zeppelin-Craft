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

-- Resolve the $token at position i (s:sub(i,i) == '$'). Returns replacement, nextPos.
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
        return interpret(on and a or b, rec, ctx, getRec), p2
    end

    -- cross-spell value: $<id>sN / $<id>SN / $<id>oN / $<id>ON
    local xid, xk, xn = r:match("^%$(%d+)([sSoO])(%d)")
    if xid then
        local v = effectValue(ctx, getRec and getRec(tonumber(xid)), tonumber(xn), xk == "S" or xk == "O")
        local nextp = i + 1 + #xid + 2        -- $ + digits + letter + digit
        if v then return tostring(round(abs(v))), nextp end
        return s:sub(i, nextp - 1), nextp      -- no record -> leave the token text
    end

    -- self value: $sN / $SN / $oN / $mN / $MN
    local sk, sn = r:match("^%$([sSoOmM])(%d)")
    if sk then
        local v = effectValue(ctx, rec, tonumber(sn), sk == "S" or sk == "M")
        if v then return tostring(round(abs(v))), i + 3 end
    end

    -- duration $d -> "N min" / "N sec" (matches the client's unit choice)
    if r:match("^%$d") and rec and rec.dur then
        local d = rec.dur
        if d >= 60 and d % 60 == 0 then return (d / 60) .. " min", i + 2 end
        return d .. " sec", i + 2
    end

    -- unknown token: emit the '$' literally and keep scanning from the next char
    return "$", i + 1
end

interpret = function(template, rec, ctx, getRec)
    if not template or template == "" then return "" end
    local out, i, n = {}, 1, #template
    while i <= n do
        if template:sub(i, i) == '$' then
            local rep, nextp = token(template, i, rec, ctx, getRec)
            out[#out + 1] = rep
            i = nextp
        else
            out[#out + 1] = template:sub(i, i)
            i = i + 1
        end
    end
    return table.concat(out)
end

-- Public: the recomputed desc string for a record (nil if there's no template).
function ZepDesc.render(rec, ctx, getRec)
    if not rec or not rec.desc then return nil end
    return interpret(rec.desc, rec, ctx, getRec)
end

-- Exposed for tests.
ZepDesc._interpret = interpret
