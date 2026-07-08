#!/usr/bin/env python3
"""Render map-1 (Kalimdor) tile grid from data/maps and find connected clusters."""
import os, glob, re, sys
MAPS = "/workspace/project/data/maps"
S = 533.33333

present = set()
for p in glob.glob(os.path.join(MAPS, "001????.map")):
    b = os.path.basename(p)          # 001 XX YY .map  -> stem 7 digits
    m = re.match(r"001(\d\d)(\d\d)\.map$", b)
    if m:
        a, c = int(m.group(1)), int(m.group(2))
        present.add((a, c))

print("map1 tiles present: %d" % len(present))
amin=min(a for a,c in present); amax=max(a for a,c in present)
cmin=min(c for a,c in present); cmax=max(c for a,c in present)
print("idxA range %d..%d   idxB range %d..%d" % (amin,amax,cmin,cmax))

# connected components (4-neighbour)
seen=set(); comps=[]
for cell in present:
    if cell in seen: continue
    stack=[cell]; comp=[]
    while stack:
        x=stack.pop()
        if x in seen: continue
        seen.add(x); comp.append(x)
        a,c=x
        for n in [(a+1,c),(a-1,c),(a,c+1),(a,c-1)]:
            if n in present and n not in seen: stack.append(n)
    comps.append(comp)
comps.sort(key=len, reverse=True)
print("\nconnected components: %d" % len(comps))
for i,comp in enumerate(comps):
    aa=[a for a,c in comp]; cc=[c for a,c in comp]
    wda=(max(aa)-min(aa)+1); wdc=(max(cc)-min(cc)+1)
    print("  #%2d size=%4d  idxA %d..%d (%d)  idxB %d..%d (%d)"%(
        i,len(comp),min(aa),max(aa),wda,min(cc),max(cc),wdc))

# ASCII map of the grid (idxA vertical, idxB horizontal), only small components highlighted
print("\nGrid (rows=idxA 0..63 top-down, cols=idxB 0..63). '#'=big landmass, digit=component index")
big = set(comps[0]) | (set(comps[1]) if len(comps)>1 else set())
compid = {}
for i,comp in enumerate(comps):
    for cell in comp: compid[cell]=i
# limit print to populated window
for a in range(amin, amax+1):
    line=[]
    for c in range(cmin, cmax+1):
        if (a,c) in present:
            i=compid[(a,c)]
            line.append('#' if i==0 else (str(i) if i<10 else '+'))
        else:
            line.append('.')
    print("%2d %s"%(a,"".join(line)))
