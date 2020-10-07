const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const speed = 5; // Number of points drawn per frame
const col = "#4F7942"; // Fern green
const bg = "#101010"; // Dark grey

          
function step() {
  for (let i = 0; i < speed; i++) {
    const r = Math.random();
    if (r < 0.84) {
      ctx.transform(0.85, -0.04, 0.04, 0.85, 0.0, 1.6);
    } else if (r < 0.84 + 0.07) {
      ctx.transform(0.2, 0.23, -0.26, 0.22, 0.0, 1.6);
    } else if (r < 0.84 + 0.07 + 0.07) {
      ctx.transform(-0.15, 0.26, 0.28, 0.24, 0.0, 0.44);
    } else {
      ctx.transform(0.0, 0.0, 0.0, 0.16, 0.0, 0.0);
    }
    ctx.beginPath();
    ctx.ellipse(0.0, 0.0, 1, 1, 0, 0, 2 * Math.PI);
    ctx.fill();
  }
  console.log(ctx.getTransform());
}

canvas.onclick = (event) => {
  step();
};

function reset() {
  canvas.width = canvas.clientWidth;
  canvas.height = canvas.clientHeight;
  ctx.save();
  ctx.setTransform(1, 0, 0, 1, 0, 0);
  ctx.fillStyle = bg;
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.restore();
}

// resetButton.onclick = reset;
window.onresize = reset;
reset();

ctx.fillStyle = "red";

ctx.scale(canvas.width / 9, canvas.height / 9);
ctx.translate(4.5, -0.5);
//ctx.fillRect(-4, 1, 8, 8);
ctx.fillStyle = col;
