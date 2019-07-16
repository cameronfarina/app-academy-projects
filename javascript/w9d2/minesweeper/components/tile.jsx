import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    if (e.altKey) {
      let flagged = true;
    } else {
      let flagged = false;
    }

    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    // \u1f4a3 bomb
    // \u1f6a9 flag
    let tile = this;
    let tileClass;
    // debugger
    if (tile.explored) {
      if (tile.bombed) {
        tileClass = "bomb";
      } else {
        tileClass = "exploredTile";
        let counter = tile.adjacentBombCount();
      }
    } else if (tile.flagged) {
      tileClass = "flaggedTile";
    } else {
      tileClass = "tileNotExplored";
    }

    return (
      <div className={tileClass} onClick={this.handleClick}>
        some tile
      </div>
    );
  }
}
