const Asteroid = require("./asteroid.js");
const Ship = require("./ship.js");


const Game = function () {
    this.asteroids = [];
    this.ship = new Ship({ pos: this.randomPosition(), game: this });

    this.addAsteroids();
};

Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 4;

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    const r_pos = this.randomPosition();
    this.asteroids.push(new Asteroid({ game: this }));
  }
}

Game.prototype.randomPosition = function() {
  const x = Math.random() * Game.DIM_X;
  const y = Math.random() * Game.DIM_Y;
  return [x, y];
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  this.asteroids.forEach(function (asteroid) {
    asteroid.draw(ctx);
  });
};

Game.prototype.moveObjects = function () {
  this.asteroids.forEach(function (asteroid) {
    asteroid.move();
  });
}

Game.prototype.wrap = function (pos) {
  wrappedPosition = [];
  if (pos[0] > Game.DIM_X) {
      pos[0] = 0;
      wrappedPosition.push(pos[0]);
  } else if (pos[0] < 0) {
    pos[0] = Game.DIM_X;
    wrappedPosition.push(pos[0]);
  } else if (pos[1] > Game.DIM_Y) {
    pos[1] = 0;
    wrappedPosition.push(pos[1]);
  } else if (pos[1] < 0) {
    pos[1] = Game.DIM_Y;
    wrappedPosition.push(pos[1]);
  }

  return wrappedPosition;
};

Game.prototype.checkCollisions = function () {
  const allAsteroids = this.asteroids;
  for(let i = 0; i < allAsteroids.length; i++) {
    for (let j = 0; j < allAsteroids.length; j++) {
      if (i !== j) {
        const asteroid1 = allAsteroids[i];
        const asteroid2 = allAsteroids[j];

        if (asteroid1.isCollidedWith(asteroid2)) {
          asteroid1.collideWith(asteroid2);
        }
      }
    }
  }
};

Game.prototype.step = function () {
  this.moveObjects();
  this.checkCollisions();
};


Game.prototype.remove = function (asteroid) {
  this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);
};


Game.prototype.allObjects = function () {
  const allObj = this.asteroids.push(this.ship);
  return allObj;
};



module.exports = Game;