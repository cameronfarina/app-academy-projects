class View {
  constructor(game, $el) { 
    this.game = game;
    this.$el = $el;
    this.setupBoard();
  }
  

  bindEvents() { 
    this.$el.on("click", "li", ( e => {
      const $grid = $(e.this);
      
      this.game.playMove();
    }));
  }

  makeMove($square) { }

  setupBoard() { 
    const $ul = $('<ul>');
    $('body').append($ul);

    $ul.addClass('tic-tac-toe-board');
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        let $li = $('<li>');
        $li.addClass('tic-tac-toe-grid');
        $ul.append($li);
      }
    }
  }
}

module.exports = View;
