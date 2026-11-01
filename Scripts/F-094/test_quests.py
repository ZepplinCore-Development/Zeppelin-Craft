#!/usr/bin/env python3
"""F-219 Track A runner for hand-written F-094 quests (any level; start_area.py stops at 13).

Plays the given quests end to end with a running `agent-wow char play <char>` session and
reads everything else from the world DB: accept at the giver -> kill / loot the objectives
(hunting the objective's spawn points) -> turn in at the ender (choice reward 0). A deliver
quest (StartItem) is complete on accept. A quest whose giver or ender is not within --reach of
where the character stands is left for a later run from another hub.

  python3 Scripts/F-094/test_quests.py 91235 91236 91233 91234 [--reach 900] [--minutes 90]

Prints a PASS/FAIL line per step plus each quest_reward event (XP, money) and ends with a
RESULT line. Run from Zeppelin-Craft.
"""
import argparse
import math
import os
import subprocess
import sys
import time

TESTS = "/workspace/project/Zeppelin-Tools/agent-wow/zeppelin/tests"
sys.path.insert(0, TESTS)
from rpc import StepFailed, call  # noqa: E402

CRAFT = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# orc warrior rotation, all ranks; only the ones the character knows are used
WARRIOR = [
    ([6673, 5242, 6192, 11549], dict(every_ms=3000, min_power=100, on_self=True, buff=True)),   # Battle Shout
    ([6343, 8198, 8204, 8205], dict(every_ms=6000, min_power=200, min_attackers=2)),           # Thunder Clap
    ([772, 6546, 6547, 6548, 11572], dict(every_ms=15000, min_power=100, per_target=True)),    # Rend
    ([78, 284, 285, 1608, 11564], dict(every_ms=3000, min_power=150)),                         # Heroic Strike
]


def sql(q, db="world"):
    out = subprocess.run([sys.executable, "-m", "cli.zep", "world", "sql", "query", q, "-d", db],
                         capture_output=True, text=True, cwd=CRAFT, check=True).stdout
    lines = [l for l in out.splitlines() if l.strip()]
    if not lines or lines[0].startswith(("Query completed", "Error")):
        return []
    head = lines[0].split("\t")
    return [dict(zip(head, l.split("\t"))) for l in lines[1:]]


def log(ok, name, detail=""):
    print(f"[{'PASS' if ok else 'FAIL'}] {name}" + (f" - {detail}" if detail else ""), flush=True)
    return ok


class Tester:
    def __init__(self, quests, reach):
        self.order = quests
        self.reach = reach
        ids = ",".join(map(str, quests))
        self.q = {int(r["ID"]): r for r in sql(
            "SELECT q.*, a.PrevQuestID FROM quest_template q JOIN quest_template_addon a ON a.ID=q.ID "
            f"WHERE q.ID IN ({ids})")}
        # prerequisites: PrevQuestID plus every quest whose NextQuestID points here (all required -
        # true for the negative ExclusiveGroup pairs we use, e.g. 91224 + 91225 -> 91226)
        self.prereq = {q: ({int(r["PrevQuestID"])} if int(r["PrevQuestID"]) > 0 else set()) for q, r in self.q.items()}
        for r in sql(f"SELECT ID, NextQuestID FROM quest_template_addon WHERE NextQuestID IN ({ids})"):
            self.prereq[int(r["NextQuestID"])].add(int(r["ID"]))
        self.giver = {int(r["quest"]): int(r["id"]) for r in sql(f"SELECT * FROM creature_queststarter WHERE quest IN ({ids})")}
        self.ender = {int(r["quest"]): int(r["id"]) for r in sql(f"SELECT * FROM creature_questender WHERE quest IN ({ids})")}
        npcs = ",".join(map(str, set(self.giver.values()) | set(self.ender.values())))
        self.npc_pos = {}
        for r in sql(f"SELECT id, position_x x, position_y y, position_z z FROM creature WHERE map=1 AND id IN ({npcs}) AND phaseMask & 1"):
            self.npc_pos.setdefault(int(r["id"]), (float(r["x"]), float(r["y"]), float(r["z"])))
        self.guid = int(call("interact.self")["guid"]) & 0xFFFFFFFF
        known = set(call("interact.spells").get("spells", []))
        self.abilities = []
        for ranks, opts in WARRIOR:
            have = [s for s in ranks if s in known]
            if have:
                self.abilities.append(dict(opts, spell_id=have[-1]))
        self.ev_since = call("interact.events").get("last", 0)
        self.results = {}

    # -- state -------------------------------------------------------------------------------
    def rewarded(self):
        return {int(r["quest"]) for r in sql(
            f"SELECT quest FROM character_queststatus_rewarded WHERE guid={self.guid}", "characters")}

    def qlog(self):
        return {e["questId"]: e for e in call("interact.quest_log").get("entries", [])}

    def bag(self, entry):
        return sum(i.get("count", 1) for i in call("interact.inventory").get("items", []) if i.get("entry") == entry)

    def me(self):
        return call("move.position")

    def dist(self, p):
        m = self.me()
        return math.dist((m["x"], m["y"]), p[:2])

    # -- movement / combat -------------------------------------------------------------------
    def walk(self, x, y, z, within=4.0, calls=30):
        for _ in range(calls):
            self.defend()
            try:
                r = call("move.path_to", x=x, y=y, z=z, stop_on_attack=True)
            except StepFailed as e:
                print(f"    walk error: {e}", flush=True)
                return False
            mv = r.get("move", {})
            if mv.get("arrived") or r.get("remaining", 99) <= within:
                return True
            if mv.get("reason") not in ("budget", "attacked"):
                print(f"    walk stopped: {mv.get('reason')} remaining {r.get('remaining')}", flush=True)
                return False
        return False

    def defend(self):
        st = call("combat.state")
        if st.get("dead") or st.get("ghost"):
            self.revive()
            return
        for g in st.get("attackers", [])[:4]:
            self.fight(guid=int(g))

    def revive(self):
        self.deaths = getattr(self, "deaths", 0) + 1
        print("    died - reviving", flush=True)
        for _ in range(40):
            r = call("combat.revive")
            if r.get("alive"):
                call("combat.rest", until_pct=90)
                return
            time.sleep(2)
        raise StepFailed("could not revive")

    def fight(self, guid=0, entry=0):
        args = dict(abilities=self.abilities, loot=True, budget_ms=25000)
        args.update(guid=guid) if guid else args.update(entry=entry)
        r = {}
        for _ in range(8):
            r = call("combat.kill", **args)
            if r.get("reason") != "budget":
                break
            args = dict(args, guid=int(r.get("guid", guid) or guid))
        self.clear_bags()
        if r.get("reason") == "we died":
            self.revive()
        else:
            st = call("interact.self")
            if st.get("maxHealth") and st.get("health", 0) < 0.55 * st["maxHealth"]:
                call("combat.rest", until_pct=85)
        return r

    def clear_bags(self, keep_free=6):
        """Test chars carry no bags: a full 16-slot backpack silently refuses quest drops
        (SMSG_INVENTORY_CHANGE_FAILURE). Destroy vendor loot, never custom items (>= 56900)."""
        items = [i for i in call("interact.inventory").get("items", []) if i.get("bag") == 255]
        if 16 - len(items) >= keep_free:
            return
        for i in items:
            if i.get("entry", 0) < 56900:
                call("interact.destroy", bag=255, slot=i.get("slot", 0), count=0)

    def hunt(self, entries, done, label, minutes=25):
        """Kill/loot `entries` until done() is true, walking between their spawn points."""
        spawns = [(float(r["x"]), float(r["y"]), float(r["z"])) for r in sql(
            f"SELECT position_x x, position_y y, position_z z FROM creature WHERE map=1 AND phaseMask & 1 "
            f"AND id IN ({','.join(map(str, entries))})")]
        visited, kills, t0 = [], 0, time.time()
        while not done():
            if time.time() - t0 > minutes * 60:
                return log(False, f"{label}", f"timeout after {kills} kills")
            near = []
            for e in entries:
                for o in call("interact.find", entry=e, radius=70, limit=8).get("objects", []):
                    if o.get("health", 0) > 0 and not (o.get("dynFlags", 0) & 1):
                        near.append(o)
            if near:
                o = min(near, key=lambda o: o.get("distance", 999))
                r = self.fight(guid=int(o["guid"]))
                if r.get("killed"):
                    kills += 1
                continue
            m = self.me()
            todo = [s for s in spawns if all(math.dist(s[:2], v) > 40 for v in visited)]
            if not todo:
                visited, todo = [], spawns
            s = min(todo, key=lambda s: math.dist(s[:2], (m["x"], m["y"])))
            visited.append(s[:2])
            self.walk(*s, within=15, calls=12)
        return log(True, label, f"{kills} kills, {time.time() - t0:.0f} s")

    # -- quest steps -------------------------------------------------------------------------
    def goto_npc(self, entry):
        p = self.npc_pos[entry]
        self.walk(p[0], p[1], p[2], within=3.5)
        return self.dist(p) < 8

    def accept(self, qid):
        g = self.giver[qid]
        if not self.goto_npc(g):
            return log(False, f"walk to giver {g} for {qid}")
        r = call("interact.quest_accept", target={"entry": g}, quest_id=qid)
        return log(r.get("ok", False), f"accept {qid} {self.q[qid]['LogTitle']}", r.get("detail", ""))

    def objectives(self, qid):
        q, out = self.q[qid], []
        for i in range(1, 5):
            npc, n = int(q[f"RequiredNpcOrGo{i}"]), int(q[f"RequiredNpcOrGoCount{i}"])
            if npc > 0 and n:
                out.append(("kill", i - 1, [npc], n))
        start = int(q["StartItem"])
        for i in range(1, 7):
            item, n = int(q[f"RequiredItemId{i}"]), int(q[f"RequiredItemCount{i}"])
            if item and n and item != start:
                srcs = [int(r["Entry"]) for r in sql(f"SELECT Entry FROM creature_loot_template WHERE Item={item}")]
                out.append(("item", item, srcs, n))
        return out

    def work(self, qid):
        for kind, key, entries, n in self.objectives(qid):
            if kind == "kill":
                def done(k=key, n=n):
                    e = self.qlog().get(qid, {})
                    c = (e.get("counts") or [0, 0, 0, 0]) + [0, 0, 0, 0]
                    return c[k] >= n or e.get("state") == 1
                if not self.hunt(entries, done, f"{qid} kill {n} x {entries}"):
                    return False
            else:
                if not self.hunt(entries, lambda it=key, n=n: self.bag(it) >= n, f"{qid} loot {n} x item {key} from {entries}"):
                    return False
                log(True, f"{qid} item {key} in bags", f"{self.bag(key)}/{n}")
        return True

    def turn_in(self, qid):
        e = self.ender[qid]
        if not self.goto_npc(e):
            return log(False, f"walk to ender {e} for {qid}")
        money0 = call("interact.self").get("money", 0)
        r = call("interact.quest_complete", target={"entry": e}, quest_id=qid, reward=0)
        ok = log(r.get("ok", False), f"turn in {qid} {self.q[qid]['LogTitle']}",
                 f"{r.get('detail', '')} choices {r.get('choiceItems', [])}")
        time.sleep(1)
        evs = call("interact.events", since=self.ev_since)
        self.ev_since = evs.get("last", self.ev_since)
        xp = [x.get("count") for x in evs.get("events", []) if x.get("kind") == "quest_reward" and x.get("questId") == qid]
        money = call("interact.self").get("money", 0) - money0
        log(bool(xp), f"quest_reward {qid}", f"{xp[0] if xp else '?'} XP, money +{money}")
        for i in range(1, 7):
            item = int(self.q[qid][f"RequiredItemId{i}"])
            if item:
                log(self.bag(item) == 0, f"{qid} item {item} taken on turn-in", f"{self.bag(item)} left")
        return ok

    def near(self, entry):
        return entry in self.npc_pos and self.dist(self.npc_pos[entry]) <= self.reach

    def run(self, minutes):
        t0 = time.time()
        while time.time() - t0 < minutes * 60:
            done, inlog = self.rewarded(), self.qlog()
            progress = False
            for qid in self.order:     # accept what this hub offers
                if qid in done or qid in inlog or not self.prereq[qid] <= done:
                    continue
                if self.near(self.giver[qid]) and self.accept(qid):
                    progress = True
            inlog = self.qlog()
            for qid in self.order:     # objectives, then turn in
                if qid not in inlog:
                    continue
                if inlog[qid].get("state") != 1 and not self.work(qid):
                    continue
                if self.near(self.ender[qid]) and self.turn_in(qid):
                    progress = True
            if not progress:
                break
        done = self.rewarded()
        left = [q for q in self.order if q not in done]
        print(f"\nrewarded: {[q for q in self.order if q in done]}  left: {left}  deaths: {getattr(self, 'deaths', 0)}")
        print("RESULT: PASS" if not left else "RESULT: INCOMPLETE")
        return 0 if not left else 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("quests", type=int, nargs="+")
    ap.add_argument("--reach", type=float, default=900, help="yd: givers/enders farther than this are left for later")
    ap.add_argument("--minutes", type=float, default=90)
    a = ap.parse_args()
    return Tester(a.quests, a.reach).run(a.minutes)


if __name__ == "__main__":
    sys.exit(main())
