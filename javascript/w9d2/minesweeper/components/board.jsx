import React from "react";
import Tile from "./tile";
import { cpus } from "os";

export default class Board extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let board = this.props.board;

    return <ul>{board.grid.map((row, idx) => {
      return <div>{row.map((tile, j) => <Tile/>)}</div>
    })}</ul>;
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
