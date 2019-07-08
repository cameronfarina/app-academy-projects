const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");

const SHIP_VALUES = {
    RADIUS: 15,
    COLOR: "#ff0000"
}

const Ship = function (options) {
  options.radius = SHIP_VALUES.RADIUS;
  options.color = SHIP_VALUES.COLOR;
  options.vel = [0,0]; 
};

Util.inherits(Ship, MovingObject);

module.exports = Ship;