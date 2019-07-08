const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

const Asteroid = function (options) {
    this.color = '#000000';
    this.radius = 10;
    this.vel = Util.randomVec(5);
}

Util.inherits(Asteroid, MovingObject);