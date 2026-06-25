-- F-190 Phase 6 desc-interpreter tests. Run: lua5.1 tests/test_desc.lua
-- resolve the addon dir whether run from repo root or from zep-tooltips/
local base = "mpq/source-assets/Interface/AddOns/ZepTooltips/"
if not io.open(base.."Compute.lua") then base = "zpaks/zep-tooltips/"..base end
dofile(base.."Compute.lua"); dofile(base.."Desc.lua")
local pass, fail = 0, 0
local function eq(label, got, want)
  if got == want then pass = pass + 1; print("  PASS  "..label)
  else fail = fail + 1; print("  FAIL  "..label.."\n        got:  "..tostring(got).."\n        want: "..tostring(want)) end
end
local Data = {
  [900122] = { cd=true, bl=0, ml=0, eff={{i=1,t=2,a=0,b=30,d=0,p=0}}, stat={{e=1,s="ARMOR",c=0.02}} },
  [900123] = { cd=true, bl=0, ml=0, eff={{i=1,t=107,a=107,b=3,d=1,p=0}} },
  [900124] = { cd=true, bl=0, ml=0, eff={{i=1,t=107,a=107,b=7,d=1,p=0}} },
  [900125] = { cd=true, bl=0, ml=0, eff={{i=1,t=107,a=107,b=11,d=1,p=0}} },
  [900116] = { dur=600, desc="When you block, erupts for $900122s1 Fire damage.$?s900125[ Restores $900125s1% mana.][$?s900124[ Restores $900124s1% mana.][$?s900123[ Restores $900123s1% mana.][]]] Lasts $d." },
}
local function getRec(id) return Data[id] end
local function ctx(o) return { level=80, sp=0, ap=0, weaponAvg=0, baseMana=0, spellCrit=0, meleeCrit=0, rangedCrit=0,
  knows=function(id) return o.known and o.known[id] or false end,
  hasAura=function(id) return o.auras and o.auras[id] or 0 end,
  stat=function(s) return s=="ARMOR" and (o.armor or 0) or 0 end } end

eq("R3 (15000 armor)", ZepDesc.render(Data[900116], ctx{armor=15000, known={[900125]=true}}, getRec),
   "When you block, erupts for 330 Fire damage. Restores 12% mana. Lasts 10 min.")
eq("R1 (10000 armor)", ZepDesc.render(Data[900116], ctx{armor=10000, known={[900123]=true}}, getRec),
   "When you block, erupts for 230 Fire damage. Restores 4% mana. Lasts 10 min.")
eq("no Imp VS (20000 armor)", ZepDesc.render(Data[900116], ctx{armor=20000}, getRec),
   "When you block, erupts for 430 Fire damage. Lasts 10 min.")
print(string.format("\n%d passed, %d failed", pass, fail))
