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
  }

  render() {
    // let board = this.state.board.gridSize;

    return (
      <div>
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

    this.setState({ board: this.state.board })
  }
}
