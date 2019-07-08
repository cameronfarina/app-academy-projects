const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;


window.addEventListener('DOMContentLoaded', function() {
  newMovingObject = new MovingObject({ 
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "#00FF00"
  });
  const canvas = document.getElementById('game-canvas');
  ctx = canvas.getContext("2d");
  newMovingObject.draw(ctx);
});




// document.addEventListener("DOMContentLoaded", function () {
//   const canvasEl = document.getElementById("game-canvas");
//   canvasEl.width = 500;
//   canvasEl.height = 500;

//   const ctx = canvasEl.getContext("2d");
//   ctx.fillStyle = "purple";
//   ctx.fillRect(0, 0, 500, 500);

//   ctx.beginPath();
//   ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
//   ctx.strokeStyle = "green";
//   ctx.lineWidth = 5;
//   ctx.stroke();
//   ctx.fillStyle = "blue";
//   ctx.fill();
// });