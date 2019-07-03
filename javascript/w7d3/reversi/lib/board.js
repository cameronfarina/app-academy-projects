let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
    const grid = [];

  for (let i = 0; i < 8; i++) {
    newRow = new Array(8);
    grid.push(newRow);
  }

  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  grid[4][3] = new Piece('black');
  grid[3][4] = new Piece('black');
  
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error('Not valid pos!');
  }
  
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) {
    return true;
  } else {
    return false;
  }
}; 

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
    const piece = this.getPiece(pos);
    if (piece && piece.color === color) {
      return true;
    } else {
      return false;
    }
    
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos)) {
    return true;
  } else {
    return false;
  }
};
 

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if ((this.validMoves('black').length === 0) && (this.validMoves('white').length === 0)) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x  = pos[0];
  let y = pos[1];

  if ((x >= 0 && x < 8) && (y >= 0 && y < 8)){
    return true;
  } else {
    return false;
  }

};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {
    // create new move based on the direction given
    let move = [pos[0] + dir[0], pos[1] + dir[1]];

    if (!piecesToFlip){
      piecesToFlip = [];
    } else {
      piecesToFlip.push(pos);
    }
 
    if (!board.isValidPos(move)) {
      // if this spot is empty, return null
      return null;
    } else if (!board.isOccupied(move)) {
      // if this move is not valid (off the board), return null
      return null;
    } else if (board.isMine(move, color)) {
      // if we find a piece that is of a different color, what should we do?
      return piecesToFlip.length === 0 ? null : piecesToFlip;
    } else {
      // else we continue on the recursive call
      return _positionsToFlip(board, move, color, dir, piecesToFlip);
    }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('Invalid Move');
  } else {
    this.grid[pos[0]][pos[1]] = new Piece(color);
  }

  for (let i = 0; i < Board.DIRS.length; i++) {
    const flips = _positionsToFlip(this, pos, color, Board.DIRS[i]);

    if(flips){
      for(let j = 0; j < flips.length; j++){
        let pos_two = flips[j];
        this.getPiece(pos_two).flip();
      }
    }
  }

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  console.log('   0  1  2  3  4  5  6  7');

  for(let i = 0; i < 8; i++) {

    let rowString = (i + ' ');
    for (let j = 0; j < 8; j++) {
      
      let gamePiece = this.grid[i][j];
      if (gamePiece instanceof Piece) {
        rowString += (' ' + gamePiece.toString() + ' ');
      } else {
        rowString += (' ' + '_' + ' ');
      }
    } 

    console.log(rowString);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  } 

  for (let i = 0; i < Board.DIRS.length; i++) {

    let positionsToPotentiallyFlip = _positionsToFlip(this, pos, color, Board.DIRS[i]);
    
    if (positionsToPotentiallyFlip) {
      return true;
    }
  }
  
  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const allValidMoves = [];

  for(let i = 0; i < 8; i++) {
    for(let j = 0; j < 8; j++) {

      const pos = [i, j];

      if (this.validMove(pos, color)) {
        allValidMoves.push(pos);
      } 
    }
  }
  
  return allValidMoves;
};

module.exports = Board;
