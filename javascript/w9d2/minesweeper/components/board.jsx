import React from "react";
import Tile from "./tile";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let board = this.props.board;

    return (
      <ul className="grid">
        {board.grid.map((row, idx) => {
          return (
            <div className="row" key={idx}>
              {row.map((tile, j) => (
                <Tile key={idx * 3 + j} tile={tile} updateGame={this.props.updateGame} />
              ))}
            </div>
          );
        })}
      </ul>
    );
  }
}

/* <ul>
{board.grid.map((row, i) => {
  <div key={i}>
    <h1>oeisjfioesf</h1>
  </div>
})}
</ul> */

//   <Tile key={i * 3 + j} />

/* row.map((col, j) => {col}) */
