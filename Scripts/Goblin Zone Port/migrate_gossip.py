#!/usr/bin/env python3
"""
F-011 pipeline fix: gossip_menu + gossip_menu_option + npc_text (NPC gossip).

Never migrated -> 103 goblin NPCs opened blank gossip windows. Full remap to
fresh blocks (npc_text 500000+, gossip_menu 510000+) because 134/145 npc_text
IDs and 4 MenuIDs collide with stock. Ports npc_text (inline text carried,
BroadcastTextID*=0), gossip_menu (menu->text remapped), gossip_menu_option
(MenuID + ActionMenuID remapped, Option/Box BroadcastTextID=0), and repoints
creature_template.gossip_menu_id. Idempotent (DELETE the emitted blocks first).
"""
import sqlite3, os
os.chdir('/workspace/project/Zeppelin-Craft')
SRC="/tmp/claude-99/-workspace/1ae3daf4-1714-4a0c-9005-f289a71753fe/scratchpad/neltharion.sqlite"
c=sqlite3.connect(SRC)
def i(v,d=0):
  try:return int(str(v).strip())
  except:return d
def esc(v):
  s = '' if v is None else str(v)
  s = s.strip().replace("\\","\\\\").replace("'","''")
  return "'" + s + "'"
TXT_BASE=500000; MENU_BASE=510000
gob=set(i(r[0]) for r in c.execute("SELECT DISTINCT CAST(TRIM(id) AS INT) FROM creature WHERE TRIM(zone) IN ('4720','4737')"))
cre_menu={e:i(gm) for e,gm in ((i(r[0]),r[1]) for r in c.execute("SELECT CAST(TRIM(entry) AS INT), gossip_menu_id FROM creature_template")) if e in gob and i(gm)>0}
menus=sorted(set(cre_menu.values()))
mset=",".join(map(str,menus))
gm=c.execute(f"SELECT CAST(TRIM(entry) AS INT), CAST(TRIM(text_id) AS INT) FROM gossip_menu WHERE CAST(TRIM(entry) AS INT) IN ({mset})").fetchall()
textids=sorted(set(t for _,t in gm if t>0))
menu_remap={m:MENU_BASE+ix for ix,m in enumerate(menus)}
text_remap={t:TXT_BASE+ix for ix,t in enumerate(textids)}
src_cols=[r[1] for r in c.execute("PRAGMA table_info(npc_text)")]
ntrows=c.execute(f"SELECT * FROM npc_text WHERE CAST(TRIM(ID) AS INT) IN ({','.join(map(str,textids))})").fetchall()
ac_txt_cols=["ID"]
for n in range(8):
  ac_txt_cols += [f"text{n}_0",f"text{n}_1",f"BroadcastTextID{n}",f"lang{n}",f"Probability{n}"]+[f"em{n}_{k}" for k in range(6)]
ac_txt_cols.append("VerifiedBuild")
def npc_val(row, col):
  d=dict(zip(src_cols,row))
  if col=="ID": return str(text_remap[i(d['ID'])])
  if col=="VerifiedBuild": return "0"
  if col.startswith("BroadcastTextID"): return "0"
  if col.startswith("Probability"): return str(i(d.get("prob"+col[len('Probability'):]),100))
  if col.startswith("text"): return esc(d.get(col))
  return str(i(d.get(col)))
L=["-- [F-011] gossip_menu/option + npc_text (NPC gossip) remapped to fresh blocks. migrate_gossip.py.\n",
   f"DELETE FROM npc_text WHERE ID BETWEEN {TXT_BASE} AND {TXT_BASE+len(textids)};",
   "INSERT INTO npc_text ("+",".join(ac_txt_cols)+") VALUES",
   ",\n".join("  ("+",".join(npc_val(r,col) for col in ac_txt_cols)+")" for r in ntrows)+";\n",
   f"DELETE FROM gossip_menu WHERE MenuID BETWEEN {MENU_BASE} AND {MENU_BASE+len(menus)};",
   "INSERT INTO gossip_menu (MenuID,TextID) VALUES",
   ",\n".join(f"  ({menu_remap[m]},{text_remap.get(t,0)})" for m,t in gm)+";\n"]
opts=c.execute(f"SELECT menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,box_coded,box_money,box_text FROM gossip_menu_option WHERE CAST(TRIM(menu_id) AS INT) IN ({mset})").fetchall()
L.append(f"DELETE FROM gossip_menu_option WHERE MenuID BETWEEN {MENU_BASE} AND {MENU_BASE+len(menus)};")
L.append("INSERT INTO gossip_menu_option (MenuID,OptionID,OptionIcon,OptionText,OptionBroadcastTextID,OptionType,OptionNpcFlag,ActionMenuID,ActionPoiID,BoxCoded,BoxMoney,BoxText,BoxBroadcastTextID) VALUES")
ov=[]
for mid,oid,icon,otext,otype,onpc,amid,apoi,bcoded,bmoney,btext in opts:
    amid2 = menu_remap.get(i(amid),0) if i(amid)>0 else 0
    ov.append(f"  ({menu_remap[i(mid)]},{i(oid)},{i(icon)},{esc(otext)},0,{i(otype)},{i(onpc)},{amid2},{i(apoi)},{i(bcoded)},{i(bmoney)},{esc(btext)},0)")
L.append(",\n".join(ov)+";\n")
L += [f"UPDATE creature_template SET gossip_menu_id={menu_remap[m]} WHERE entry IN ({','.join(str(e) for e,mm in cre_menu.items() if mm==m)});" for m in menus]
open("zpaks/zep-goblin-start/sql/zz_[F-011]_gossip.sql","w").write("\n".join(L)+"\n")
print(f"gossip: {len(menus)} menus, {len(ntrows)} npc_text, {len(opts)} options, {len(cre_menu)} NPCs repointed")
