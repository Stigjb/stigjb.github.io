const canvas = document.getElementById("canvas");
const goButton = document.getElementById("go");
const resetButton = document.getElementById("reset");
const ctx = canvas.getContext("2d");

const ADD_POINTS = 0;
const ANIMATE = 1;
const FINISHED = 2;

const state = {
  bounds: { l: 0, r: 400, t: 0, b: 300 },
  points: [],
  newEdges: [],
  edges: [],
  state: ADD_POINTS,
};

reset();

canvas.onclick = (event) => {
  if (state.state !== ADD_POINTS) {
    return;
  }
  addPoint(event);
  draw();
};

function reset() {
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  state.bounds = { l: 0, r: 400, t: 0, b: 300 };
  state.points = [];
  state.newEdges = [];
  state.edges = [];
  state.state = ADD_POINTS;
  goButton.disabled = true;
  draw();
}

resetButton.onclick = reset;

goButton.onclick = () => {
  if (state.points.length < 3) {
    return;
  }
  state.state = ANIMATE;
  goButton.disabled = true;
  resetButton.disabled = true;
  calculateTarget();
  animateToTarget();
};

function addPoint(event) {
  const { points, edges } = state;
  const rect = canvas.getBoundingClientRect();
  const x = Math.floor(event.x - rect.x);
  const y = Math.floor(event.y - rect.y);
  const p2 = { x, y };

  if (points.length === 1) {
    const p1 = points[0];
    edges.push({ x: p2.x - p1.x, y: p2.y - p1.y });
    edges.push({ x: p1.x - p2.x, y: p1.y - p2.y });
  } else if (points.length > 1) {
    goButton.disabled = false;
    const p0 = points[0];
    const p1 = points[points.length - 1];
    const edge1 = { x: p2.x - p1.x, y: p2.y - p1.y };
    const edge2 = { x: p0.x - p2.x, y: p0.y - p2.y };
    edges[edges.length - 1] = edge1;
    edges.push(edge2);
  }
  points.push(p2);
}

function draw() {
  const { points } = state;

  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  if (points.length < 3) {
    drawSeparate();
  } else {
    drawPoly(points);
  }
}

function drawSeparate() {
  ctx.fillStyle = "black";
  state.points.forEach(p => {
    ctx.beginPath();
    ctx.ellipse(p.x, p.y, 2, 2, 0, 0, 2 * Math.PI);
    ctx.fill();
  });
}

function drawPoly(points) {
  const p0 = points[0];

  ctx.strokeStyle = "black";
  ctx.beginPath();
  ctx.moveTo(p0.x, p0.y);
  points.slice(1).forEach(p => ctx.lineTo(p.x, p.y));
  ctx.closePath();
  ctx.stroke();
}

function ang(vec) {
  let res = Math.atan2(vec.y, vec.x);

  if (res < 0) {
    res += 2 * Math.PI;
  }
  return res;
}

function argsort(a) {
  const indices = Array.from(a.keys());

  return indices.sort((i, j) => a[i] - a[j]);
}

function calculateTarget() {
  const { points, edges, newEdges, bounds } = state;
  const order = argsort(edges.map(e => ang(e)));
  let point = Object.assign({}, points[0]);

  newEdges.length = 0;
  Object.assign(bounds, { l: point.x, r: point.x, t: point.y, b: point.y });
  order.forEach(i => {
    let edge = edges[i];
    const x = point.x - edge.x;
    const y = point.y - edge.y;

    point = { x, y };
    edge = { oldX: points[i].x, oldY: points[i].y, newX: x, newY: y, x: edge.x, y: edge.y };
    newEdges.push(edge);
    bounds.l = Math.min(bounds.l, x);
    bounds.r = Math.max(bounds.r, x);
    bounds.t = Math.min(bounds.t, y);
    bounds.b = Math.max(bounds.t, y);
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

  const { newEdges, bounds } = state;
  const scale = Math.min(
    canvas.clientWidth / (bounds.r - bounds.l),
    canvas.clientHeight / (bounds.b - bounds.t),
  );

  ctx.fillStyle = "white";
  ctx.strokeStyle = "black";

  function step(t) {
    if (t0 === null) {
      t0 = t;
    }
    ctx.setTransform(1, 0, 0, 1, 0, 0);
    const ratio = Math.min(1, (t - t0) / duration);
    const tf = -(Math.cos(Math.PI * ratio) - 1) / 2;
    ctx.fillRect(0, 0, canvas.clientWidth, canvas.clientHeight);

    ctx.scale(
      lerp(1, scale, tf),
      lerp(1, scale, tf),
    );
    ctx.translate(
      lerp(0, -bounds.l, tf),
      lerp(0, -bounds.t, tf),
    );

    // ctx.strokeRect(bounds.l, bounds.t, bounds.r - bounds.l, bounds.b - bounds.t);

    newEdges.forEach(e => {
      const x = lerp(e.oldX, e.newX, tf);
      const y = lerp(e.oldY, e.newY, tf);
      ctx.beginPath();
      ctx.moveTo(x, y);
      ctx.lineTo(x + e.x, y + e.y);
      ctx.closePath();
      ctx.stroke();
    });
    if (ratio < 1) {
      window.requestAnimationFrame(step);
    } else {
      ctx.fillRect(0, 0, canvas.clientWidth, canvas.clientHeight);
      drawPoly(newEdges.map(e => { return { x: e.newX, y: e.newY }; }));
      state.state = FINISHED;
      resetButton.disabled = false;
    }
  }

  window.requestAnimationFrame(step);
}
