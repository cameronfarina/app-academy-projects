const View = require('./ttt-view')// require appropriate file
const Game = require('../../node-solution/game')// require appropriate file

  $(() => {
    // Your code here
    const containerEl = $('.ttt');
    const newGame = new Game();
    new View(newGame, containerEl);
  });
