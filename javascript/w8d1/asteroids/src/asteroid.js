const Util = require("./utils.js");

const MovingObject = require("./moving_object.js");

const asteroidDEFAULTS = {
  COLOR: '#000000',
  RADIUS: 10
};

const Asteroid = function (options) { 
    options.color = asteroidDEFAULTS.COLOR;
    options.radius = asteroidDEFAULTS.RADIUS;
    options.vel = Util.randomVec(4);
    options.pos = options.game.randomPosition();
    

    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;