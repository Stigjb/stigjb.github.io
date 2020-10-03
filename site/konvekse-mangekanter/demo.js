const canvas = document.getElementById("canvas");
const goButton = document.getElementById("go");
const resetButton = document.getElementById("reset");
const ctx = canvas.getContext("2d");

const ADD_POINTS = 0;
const ANIMATE = 1;
const FINISHED = 2;

const state = {
  bounds: { l: 0, r: canvas.width, t: 0, b: canvas.height },
  edges: [],
  state: ADD_POINTS,
};

canvas.onclick = (event) => {
  if (state.state !== ADD_POINTS) {
    return;
  }
  addPoint(event);
  draw();
};

function reset() {
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = "white";
  ctx.strokeStyle = "black";
  state.bounds = { l: 0, r: canvas.width, t: 0, b: canvas.height };
  state.edges = [];
  state.state = ADD_POINTS;
  goButton.disabled = true;
  draw();
}

resetButton.onclick = reset;
window.onresize = reset;
reset();

goButton.onclick = () => {
  if (state.edges.length < 3) {
    return;
  }
  state.state = ANIMATE;
  goButton.disabled = true;
  resetButton.disabled = true;
  calculateTarget();
  animateToTarget();
};

function addPoint(event) {
  const { edges } = state;
  const rect = canvas.getBoundingClientRect();
  const x = Math.floor(event.x - rect.x);
  const y = Math.floor(event.y - rect.y);
  const e = { x, y, dX: null, dY: null, x1: null, x2: null };

  if (edges.length === 0) {
    edges.push(e);
  } else if (edges.length === 1) {
    const e0 = edges.pop();
    Object.assign(e0, { dX: e.x - e0.x, dY: e.y - e0.y });
    edges.push(e0, e);
  } else if (edges.length > 1) {
    goButton.disabled = false;
    const e0 = edges[0];
    const e1 = edges.pop();
    Object.assign(e1, { dX: e.x - e1.x, dY: e.y - e1.y });
    Object.assign(e, { dX: e0.x - e.x, dY: e0.y - e.y });
    edges.push(e1, e);
  }
}

function draw() {
  const { edges } = state;

  ctx.fillRect(0, 0, canvas.width, canvas.height);
  if (edges.length < 3) {
    drawSeparate();
  } else {
    drawPoly(edges);
  }
}

function drawSeparate() {
  state.edges.forEach(p => {
    ctx.beginPath();
    ctx.ellipse(p.x, p.y, 2, 2, 0, 0, 2 * Math.PI);
    ctx.stroke();
  });
}

function drawPoly(edges) {
  const p0 = edges[0];

  ctx.beginPath();
  ctx.moveTo(p0.x, p0.y);
  edges.slice(1).forEach(p => ctx.lineTo(p.x, p.y));
  ctx.closePath();
  ctx.stroke();
}

const ang = edge => Math.atan2(edge.dY, edge.dX);

function calculateTarget() {
  const { edges, bounds } = state;
  edges.sort((e1, e2) => ang(e2) - ang(e1));

  let point = null;
  edges.forEach(edge => {
    if (point === null) {
      point = { x: edge.x, y: edge.y };
      Object.assign(bounds, { l: edge.x, r: edge.x, t: edge.y, b: edge.y });
    }
    edge.x1 = point.x;
    edge.y1 = point.y;

    point.x = point.x + edge.dX;
    point.y = point.y + edge.dY;

    bounds.l = Math.min(bounds.l, point.x);
    bounds.r = Math.max(bounds.r, point.x);
    bounds.t = Math.min(bounds.t, point.y);
    bounds.b = Math.max(bounds.b, point.y);
  });
  bounds.l = bounds.l - 0.05 * (bounds.r - bounds.l);
  bounds.r = bounds.r + 0.05 * (bounds.r - bounds.l);
  bounds.t = bounds.t - 0.05 * (bounds.b - bounds.t);
  bounds.b = bounds.b + 0.05 * (bounds.b - bounds.t);
}

function lerp(a, b, t) {
  return a + t * (b - a);
}

function animateToTarget() {
  let t0 = null;
  const duration = 2000;

  const { edges, bounds } = state;
  bounds.w = bounds.r - bounds.l;
  bounds.h = bounds.b - bounds.t;
  const scale = Math.min(
    canvas.width / bounds.w,
    canvas.height / bounds.h,
  );

  const targetPos = {
    l: -bounds.l + ((canvas.width / scale - bounds.w) / 2 * 1),
    t: -bounds.t + ((canvas.height / scale - bounds.h) / 2 * 1),
  };

  function step(t) {
    if (t0 === null) {
      t0 = t;
    }
    ctx.setTransform(1, 0, 0, 1, 0, 0);
    const ratio = Math.min(1, (t - t0) / duration);
    const tf = -(Math.cos(Math.PI * ratio) - 1) / 2;
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    ctx.scale(
      lerp(1, scale, tf),
      lerp(1, scale, tf),
    );
    ctx.translate(
      lerp(0, targetPos.l, tf),
      lerp(0, targetPos.t, tf),
    );

    edges.forEach(e => {
      const x = lerp(e.x, e.x1, tf);
      const y = lerp(e.y, e.y1, tf);
      ctx.beginPath();
      ctx.moveTo(x, y);
      ctx.lineTo(x + e.dX, y + e.dY);
      ctx.closePath();
      ctx.stroke();
    });
    if (ratio < 1) {
      window.requestAnimationFrame(step);
    } else {
      ctx.save();
      ctx.setTransform(1, 0, 0, 1, 0, 0);
      ctx.fillRect(0, 0, canvas.width, canvas.height);
      ctx.restore();
      drawPoly(edges.map(e => { return { x: e.x1, y: e.y1 }; }));
      state.state = FINISHED;
      resetButton.disabled = false;
    }
  }

  window.requestAnimationFrame(step);
}
