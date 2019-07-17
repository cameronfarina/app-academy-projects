import React from "react";
import Board from "./board";
import * as Minesweeper from "../minesweeper";

export default class Game extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      board: new Minesweeper.Board(9, 10)
    };

    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  render() {
    let modal;
    if (this.state.board.lost() || this.state.board.won()) {
      let content = this.state.board.lost() ? "You Lose!" : "You Win!";
      modal = (
        <div className="screen">
          <div className="modal">
            <h2>{content}</h2>
            <button onClick={this.restartGame}>Play Again</button>
          </div>
        </div>
      );
    }

    return (
      <div className="gameBoard">
        {modal}
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    );
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({ board: this.state.board });
  }

  restartGame() {
    this.setState({ board: new Minesweeper.Board(9, 10)});
  }
}
