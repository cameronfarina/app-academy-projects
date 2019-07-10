class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", e => {
      let $square = $(e.currentTarget);
      this.makeMove($square);
    });
  }

  makeMove($square) {
    const currentPosition = $square.data("pos");

    try {
      this.game.playMove(currentPosition);
    } catch (error) {
      alert(error.msg);
      return;
    }

    $square.addClass(this.game.currentPlayer);
    $square.text(this.game.currentPlayer);

    if (this.game.isOver()) {
      if (this.game.winner()) {
        alert(`Congrats ${this.game.currentPlayer}, you won!`);
        this.$el.off("click");
      } else {
        alert("the game is a draw");
      }
    }
  }

  setupBoard() {
    const $ul = $("<ul>");

    $ul.addClass("tic-tac-toe-board");
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $li = $("<li>");
        let pos = [row, col];

        $li.data("pos", pos);
        $li.addClass("tic-tac-toe-grid");
        $ul.append($li);
      }
    }

    this.$el.append($ul);
  }
}

module.exports = View;
