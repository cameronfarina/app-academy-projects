// const MovingObject = require("./moving_object.js");
// const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");


  // window.Asteroid = Asteroid;
  window.Game = Game;
  window.GameView = GameView;
  // window.MovingObject = MovingObject;


window.addEventListener('DOMContentLoaded', function() {
  width = Game.DIM_X;
  height = Game.DIM_Y;
  const newGame = new Game();
  canvas = document.getElementById('game-canvas');
  ctx = canvas.getContext("2d");
  console.log(Game);
  newGameView = new GameView(newGame, ctx);
  newGameView.start();
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