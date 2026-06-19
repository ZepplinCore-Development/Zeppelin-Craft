/* Zeppelin Talent Calculator — vanilla JS, no build step.
 * Reads data/talents.json (produced by `zep dbc info export-talents`) and
 * renders an interactive, shareable talent calculator. */

'use strict';

const MAX_POINTS = 71;        // level-80 WotLK talent pool (1 pt/level from L10)
const CELL = 56, GAP = 16;    // must match --cell / --gap in style.css
// Touch devices have no hover and no right-click, so they get a tap-to-open
// bottom sheet with explicit +/- buttons instead of hover tooltips.
const IS_TOUCH = typeof window !== 'undefined' && window.matchMedia
  && window.matchMedia('(hover: none)').matches;

const CLASS_COLORS = {
  Warrior: '#C79C6E', Paladin: '#F58CBA', Hunter: '#ABD473', Rogue: '#FFF569',
  Priest: '#FFFFFF', 'Death Knight': '#C41F3B', Shaman: '#0070DE',
  Mage: '#69CCF0', Warlock: '#9482C9', Druid: '#FF7D0A',
};

/* ============================ pure calc core ============================ */
/* These functions never touch the DOM so they can be unit-tested in Node. */

function buildIndexes(data) {
  const talentById = {}, treeById = {}, treesByClass = {};
  for (const cls of data.classes) {
    treesByClass[cls.mask] = cls.trees;
    for (const tree of cls.trees) {
      treeById[tree.id] = tree;
      for (const t of tree.talents) {
        talentById[t.id] = { talent: t, treeId: tree.id, classMask: cls.mask };
      }
    }
  }
  return { talentById, treeById, treesByClass };
}

function totalPoints(points) {
  let n = 0;
  for (const k in points) n += points[k];
  return n;
}

function pointsInTree(idx, points, treeId) {
  let n = 0;
  for (const t of idx.treeById[treeId].talents) n += points[t.id] || 0;
  return n;
}

/* Why a point cannot be added — null if it can. Used for gating + tooltips. */
function addBlockReason(idx, points, talentId) {
  const info = idx.talentById[talentId];
  const t = info.talent;
  if ((points[talentId] || 0) >= t.max_rank) return 'maxed';
  if (totalPoints(points) >= MAX_POINTS) return 'No talent points left';
  const need = t.tier * 5;
  if (pointsInTree(idx, points, info.treeId) < need) {
    return `Requires ${need} points in ${idx.treeById[info.treeId].name}`;
  }
  for (const p of t.prereqs) {
    if ((points[p.talent_id] || 0) < p.rank) {
      const pre = idx.talentById[p.talent_id];
      const nm = pre ? pre.talent.name : `talent ${p.talent_id}`;
      return `Requires ${p.rank} point${p.rank > 1 ? 's' : ''} in ${nm}`;
    }
  }
  return null;
}

function canAdd(idx, points, talentId) {
  return addBlockReason(idx, points, talentId) === null;
}

/* A build is valid iff every learned talent still meets its tier + prereq
 * requirements. Used to reject removals that would orphan a dependent. */
function isValid(idx, points) {
  for (const id in points) {
    if (!points[id]) continue;
    const info = idx.talentById[id];
    if (!info) return false;
    const t = info.talent;
    if (pointsInTree(idx, points, info.treeId) < t.tier * 5) return false;
    for (const p of t.prereqs) {
      if ((points[p.talent_id] || 0) < p.rank) return false;
    }
  }
  return true;
}

function addPoint(idx, points, talentId) {
  if (!canAdd(idx, points, talentId)) return points;
  const np = Object.assign({}, points);
  np[talentId] = (np[talentId] || 0) + 1;
  return np;
}

function removePoint(idx, points, talentId) {
  const cur = points[talentId] || 0;
  if (!cur) return points;
  const np = Object.assign({}, points);
  if (cur - 1 <= 0) delete np[talentId]; else np[talentId] = cur - 1;
  return isValid(idx, np) ? np : points;   // refuse: remove dependents first
}

/* Greedily reconstruct a legal build from possibly-untrusted desired ranks
 * (e.g. a shared/tampered URL or data that changed since the link was made). */
function sanitize(idx, classMask, desiredPoints) {
  const desired = {};
  for (const id in desiredPoints) {
    const info = idx.talentById[id];
    if (!info || info.classMask !== classMask) continue;
    desired[id] = Math.min(desiredPoints[id], info.talent.max_rank);
  }
  let built = {}, changed = true;
  while (changed) {
    changed = false;
    for (const id in desired) {
      while ((built[id] || 0) < desired[id] && canAdd(idx, built, id)) {
        built[id] = (built[id] || 0) + 1;
        changed = true;
      }
    }
  }
  return built;
}

/* ------- shareable build encoding:  <classMask>/<id.rank>_<id.rank>... ------- */
function encodeBuild(classMask, points) {
  const parts = [];
  for (const id in points) if (points[id]) parts.push(id + '.' + points[id]);
  return classMask + '/' + parts.join('_');
}

function decodeBuild(hash) {
  const [mask, rest] = String(hash).replace(/^#/, '').split('/');
  const points = {};
  if (rest) {
    for (const pair of rest.split('_')) {
      const [id, rank] = pair.split('.');
      if (id) points[id] = parseInt(rank || '0', 10) || 0;
    }
  }
  return { classMask: parseInt(mask, 10), points };
}

/* ============================ browser-only UI =========================== */

if (typeof document !== 'undefined') {
  const state = { data: null, idx: null, classMask: null, points: {} };
  let lastHash = null;

  const $ = (sel) => document.querySelector(sel);

  async function init() {
    const main = $('#trees');
    try {
      state.data = await fetch('data/talents.json').then((r) => {
        if (!r.ok) throw new Error(r.status);
        return r.json();
      });
    } catch (e) {
      main.innerHTML = `<div class="error">Failed to load talent data (${e.message}).</div>`;
      return;
    }
    state.idx = buildIndexes(state.data);
    renderClassBar();

    const fromHash = decodeBuild(location.hash);
    const masks = state.data.classes.map((c) => c.mask);
    state.classMask = masks.includes(fromHash.classMask) ? fromHash.classMask : masks[0];
    state.points = sanitize(state.idx, state.classMask, fromHash.points);

    $('#reset-btn').addEventListener('click', () => { state.points = {}; commit(); });
    $('#share-btn').addEventListener('click', copyLink);
    window.addEventListener('hashchange', onHashChange);
    if (IS_TOUCH) {
      // tap outside the sheet / a talent closes it
      document.addEventListener('click', (e) => {
        if (sheetTalent && !e.target.closest('#tooltip') && !e.target.closest('.talent')) {
          closeSheet();
        }
      });
    }

    render();
  }

  function onHashChange() {
    if (location.hash === lastHash) return;     // ignore our own writes
    const b = decodeBuild(location.hash);
    const masks = state.data.classes.map((c) => c.mask);
    state.classMask = masks.includes(b.classMask) ? b.classMask : state.classMask;
    state.points = sanitize(state.idx, state.classMask, b.points);
    render();
  }

  function selectClass(mask) {
    if (mask === state.classMask) return;
    state.classMask = mask;
    state.points = {};
    commit();
  }

  /* apply state -> full re-render + URL (render first so a failing
   * history update can never leave the UI stale) */
  function commit() {
    render();
    lastHash = '#' + encodeBuild(state.classMask, state.points);
    try { history.replaceState(null, '', lastHash); }
    catch (_) { /* file:// or sandboxed host - URL sync is best-effort */ }
  }

  function renderClassBar() {
    const bar = $('#class-bar');
    bar.innerHTML = '';
    for (const cls of state.data.classes) {
      const b = document.createElement('button');
      b.className = 'class-btn';
      b.textContent = cls.name;
      b.style.setProperty('--clr', CLASS_COLORS[cls.name] || '#888');
      b.addEventListener('click', () => selectClass(cls.mask));
      b.dataset.mask = cls.mask;
      bar.appendChild(b);
    }
  }

  function render() {
    // class bar active state
    document.querySelectorAll('.class-btn').forEach((b) => {
      b.classList.toggle('active', Number(b.dataset.mask) === state.classMask);
    });

    const cls = state.data.classes.find((c) => c.mask === state.classMask);
    $('#points-summary').textContent = `${totalPoints(state.points)} / ${MAX_POINTS}`;

    const main = $('#trees');
    main.innerHTML = '';
    for (const tree of cls.trees) main.appendChild(renderTree(tree));
  }

  function renderTree(tree) {
    const wrap = document.createElement('section');
    wrap.className = 'tree';

    const color = CLASS_COLORS[
      state.data.classes.find((c) => c.mask === state.classMask).name] || '#888';

    const head = document.createElement('div');
    head.className = 'tree-head';
    head.innerHTML =
      `<img src="data/icons/${tree.icon}.png" alt="" onerror="this.style.visibility='hidden'">` +
      `<span class="name" style="color:${color}">${esc(tree.name)}</span>` +
      `<span class="tree-points">${pointsInTree(state.idx, state.points, tree.id)}</span>`;
    wrap.appendChild(head);

    const gridWrap = document.createElement('div');
    gridWrap.className = 'grid-wrap';

    const grid = document.createElement('div');
    grid.className = 'grid';
    grid.style.setProperty('--cols', state.data.cols);

    // full rows x cols matrix so arrow geometry is deterministic
    const byPos = {};
    for (const t of tree.talents) byPos[t.tier + ',' + t.column] = t;
    for (let r = 0; r < state.data.rows; r++) {
      for (let c = 0; c < state.data.cols; c++) {
        const cell = document.createElement('div');
        cell.className = 'cell';
        const t = byPos[r + ',' + c];
        if (t) cell.appendChild(renderTalent(t, tree));
        grid.appendChild(cell);
      }
    }
    gridWrap.appendChild(grid);
    gridWrap.appendChild(renderArrows(tree));
    wrap.appendChild(gridWrap);
    return wrap;
  }

  function renderTalent(t, tree) {
    const cur = state.points[t.id] || 0;
    const el = document.createElement('div');
    el.className = 'talent';
    el.style.backgroundImage = `url("data/icons/${t.icon}.png")`;

    if (cur >= t.max_rank && cur > 0) el.classList.add('maxed');
    else if (cur > 0) el.classList.add('partial');
    else if (canAdd(state.idx, state.points, t.id)) el.classList.add('available');

    const badge = document.createElement('span');
    badge.className = 'rank-badge' + (cur >= t.max_rank ? ' maxed' : '');
    badge.textContent = `${cur}/${t.max_rank}`;
    el.appendChild(badge);

    if (IS_TOUCH) {
      // Tap browses (opens the sheet); spending happens via its +/- buttons.
      el.addEventListener('click', (e) => { e.preventDefault(); openSheet(t, tree); });
    } else {
      el.addEventListener('click', (e) => {
        e.preventDefault();
        state.points = addPoint(state.idx, state.points, t.id);
        commit();
      });
      el.addEventListener('contextmenu', (e) => {
        e.preventDefault();
        state.points = removePoint(state.idx, state.points, t.id);
        commit();
      });
      el.addEventListener('mouseenter', (e) => showTip(t, tree, e));
      el.addEventListener('mousemove', moveTip);
      el.addEventListener('mouseleave', hideTip);
    }
    return el;
  }

  const center = (tier, col) => ({
    x: col * (CELL + GAP) + CELL / 2,
    y: tier * (CELL + GAP) + CELL / 2,
  });

  function renderArrows(tree) {
    const w = state.data.cols * CELL + (state.data.cols - 1) * GAP;
    const h = state.data.rows * CELL + (state.data.rows - 1) * GAP;
    const svgNS = 'http://www.w3.org/2000/svg';
    const svg = document.createElementNS(svgNS, 'svg');
    svg.setAttribute('class', 'arrows');
    svg.setAttribute('viewBox', `0 0 ${w} ${h}`);
    svg.setAttribute('width', w);
    svg.setAttribute('height', h);

    for (const t of tree.talents) {
      for (const p of t.prereqs) {
        const pre = state.idx.talentById[p.talent_id];
        if (!pre || pre.treeId !== tree.id) continue;
        const a = center(pre.talent.tier, pre.talent.column);
        const b = center(t.tier, t.column);
        const satisfied = (state.points[p.talent_id] || 0) >= p.rank;
        const line = document.createElementNS(svgNS, 'line');
        line.setAttribute('x1', a.x); line.setAttribute('y1', a.y);
        line.setAttribute('x2', b.x); line.setAttribute('y2', b.y);
        line.setAttribute('stroke', satisfied ? '#f5c451' : '#5a6678');
        line.setAttribute('stroke-width', '3');
        line.setAttribute('opacity', satisfied ? '0.95' : '0.5');
        svg.appendChild(line);
      }
    }
    return svg;
  }

  /* ---- tooltip body (shared by hover tooltip + mobile sheet) ---- */
  function tipBody(t) {
    const cur = state.points[t.id] || 0;
    const shown = cur > 0 ? cur : 1;
    const rank = t.ranks[shown - 1] || t.ranks[0] || {};
    const color = CLASS_COLORS[
      state.data.classes.find((c) => c.mask === state.classMask).name] || '#fff';

    let html = `<div class="tt-name" style="color:${color}">${esc(t.name || 'Talent')}</div>`;
    html += `<div class="tt-rank">Rank ${cur}/${t.max_rank}</div>`;
    html += `<div class="tt-desc">${esc(rank.desc || '')}</div>`;
    if (cur > 0 && cur < t.max_rank) {
      const next = t.ranks[cur];
      if (next && next.desc) html += `<div class="tt-next"><b>Next rank:</b> ${esc(next.desc)}</div>`;
    }
    const reason = addBlockReason(state.idx, state.points, t.id);
    if (reason && reason !== 'maxed') html += `<div class="tt-req">${esc(reason)}</div>`;
    return html;
  }

  /* ---- desktop hover tooltip ---- */
  function showTip(t, tree, e) {
    const tip = $('#tooltip');
    tip.innerHTML = tipBody(t);
    tip.hidden = false;
    moveTip(e);
  }
  function moveTip(e) {
    const tip = $('#tooltip');
    if (tip.hidden) return;
    const pad = 16;
    let x = e.clientX + pad, y = e.clientY + pad;
    const r = tip.getBoundingClientRect();
    if (x + r.width > window.innerWidth) x = e.clientX - r.width - pad;
    if (y + r.height > window.innerHeight) y = e.clientY - r.height - pad;
    tip.style.left = Math.max(4, x) + 'px';
    tip.style.top = Math.max(4, y) + 'px';
  }
  function hideTip() { $('#tooltip').hidden = true; }

  /* ---- mobile bottom sheet (tap to open, +/- to spend) ---- */
  let sheetTalent = null;
  function openSheet(t, tree) {
    sheetTalent = t;
    renderSheet();
  }
  function renderSheet() {
    const t = sheetTalent;
    if (!t) return;
    const tip = $('#tooltip');
    const cur = state.points[t.id] || 0;
    const canMore = canAdd(state.idx, state.points, t.id);
    tip.className = 'tooltip sheet';
    tip.innerHTML = tipBody(t) +
      `<div class="tt-actions">
         <button class="tt-btn" data-act="rem"${cur === 0 ? ' disabled' : ''}>− Remove</button>
         <button class="tt-btn add" data-act="add"${canMore ? '' : ' disabled'}>+ Add point</button>
       </div>`;
    tip.hidden = false;
    tip.querySelector('[data-act=add]').addEventListener('click', (e) => {
      e.stopPropagation();
      state.points = addPoint(state.idx, state.points, t.id);
      commit();
      renderSheet();
    });
    tip.querySelector('[data-act=rem]').addEventListener('click', (e) => {
      e.stopPropagation();
      state.points = removePoint(state.idx, state.points, t.id);
      commit();
      renderSheet();
    });
  }
  function closeSheet() {
    sheetTalent = null;
    const tip = $('#tooltip');
    tip.hidden = true;
    tip.className = 'tooltip';
  }

  function copyLink() {
    const url = location.origin + location.pathname + lastHash;
    const done = () => toast('Build link copied!');
    if (navigator.clipboard) navigator.clipboard.writeText(url).then(done, () => toast(url));
    else toast(url);
  }
  let toastTimer = null;
  function toast(msg) {
    const el = $('#toast');
    el.textContent = msg;
    el.hidden = false;
    clearTimeout(toastTimer);
    toastTimer = setTimeout(() => { el.hidden = true; }, 2200);
  }

  function esc(s) {
    return String(s).replace(/[&<>"]/g, (c) =>
      ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
  }

  init();
}

/* node-only export for unit tests */
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {
    buildIndexes, totalPoints, pointsInTree, addBlockReason, canAdd, isValid,
    addPoint, removePoint, sanitize, encodeBuild, decodeBuild, MAX_POINTS,
  };
}
