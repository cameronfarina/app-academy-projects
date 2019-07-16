import React from "react";

export default class Tile extends React.Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(e) {
    let flagged;
    if (e.altKey) {
      flagged = true;
    } else {
      flagged = false;
    }
    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    // \u1f4a3 bomb
    // \u1f6a9 flag
    let tile = this.props.tile;
    let tileClass;
    let counter;
    let text;
    // debugger
    if (tile.explored) {
      if (tile.bombed) {
        tileClass = "bomb tile";
        text = "💣";
      } else {
        tileClass = "exploredTile tile";
        counter = tile.adjacentBombCount();
        text = counter > 0 ? `${counter}` : "  ";
      }
    } else if (tile.flagged) {
      tileClass = "flaggedTile tile";
      text = "⚑";
    } else {
      tileClass = "tileNotExplored tile";
      text = "  ";
    }

    return (
      <div className={tileClass} onClick={this.handleClick}>
        {text}
      </div>
    );
  }
} 
