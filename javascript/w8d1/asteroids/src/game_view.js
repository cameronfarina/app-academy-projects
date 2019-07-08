const GameView = function (game, ctx) {
  this.ctx = ctx;
  this.game = game;
};
// console.log(GameView);

GameView.prototype.start = function () {
    setInterval(() => {
      this.game.draw(this.ctx);
      this.game.step();
    }, 20)
};

module.exports = GameView;