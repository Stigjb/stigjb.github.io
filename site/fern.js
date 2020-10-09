const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const speed = 5000; // Number of points drawn per frame
const col = "#4F7942"; // Fern green
const bg = "#101010"; // Dark grey
const p = { x: 0.0, y: 0.0 };

const transforms = [
  { p: 0.84, t: [0.85, 0.04, -0.04, 0.85, 0.0, 1.6] },
  { p: 0.07, t: [0.2, -0.26, 0.23, 0.22, 0.0, 1.6] },
  { p: 0.07, t: [-0.15, 0.28, 0.26, 0.24, 0.0, 0.44] },
  { p: 1.0, t: [0.0, 0.0, 0.0, 0.16, 0.0, 0.0] },
];

function start(t0) {
  function step(t) {
    if (t0 === undefined && t !== undefined) {
      t0 = t;
    }
    if (t > t0 + 2000) {
      return;
    }
    for (let i = 0; i < speed; i++) {
      let r = Math.random();
      let t = null;
      transforms.forEach(({ p, t: t_ }) => {
        r -= p;
        if (r < 0.0 && t === null) {
          t = t_;
        }
      });
      const p_ = {
        x: t[0] * p.x + t[1] * p.y + t[4],
        y: t[2] * p.x + t[3] * p.y + t[5],
      };
      Object.assign(p, p_);
      ctx.beginPath();
      ctx.ellipse(p.x, p.y, 0.01, 0.01, 0, 0, 2 * Math.PI);
      ctx.fill();
    }
    requestAnimationFrame(step);
  };
  requestAnimationFrame(step);
}

canvas.onclick = () => {
  reset();
  start();
};

function reset() {
  // canvas.width = canvas.clientWidth;
  // canvas.height = canvas.clientHeight;
  ctx.save();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = bg;
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.restore();
}

// resetButton.onclick = reset;
window.onresize = reset;
reset();

ctx.scale(canvas.width / 9, -canvas.height / 9);
ctx.translate(4.5, -9.5);
ctx.rotate(-Math.PI / 7);
ctx.translate(-3, -0.5);
ctx.fillStyle = col;
