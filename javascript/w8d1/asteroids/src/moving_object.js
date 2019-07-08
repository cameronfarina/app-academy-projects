const MovingObject = function(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
};


MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0, 
        2 * Math.PI,
        true
    );

    ctx.fill();
};

MovingObject.prototype.move = function () {
    const new_x = this.pos[0] += this.vel[0];
    const new_y = this.pos[1] += this.vel[1];
  if ((new_x > 500) || (new_x < 0)) {
    this.game.wrap(this.pos);
  } else if ((new_y > 500) || (new_y < 0)){
    this.game.wrap(this.pos);
  } 
};
// this is math, not JavaScript
// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
MovingObject.prototype.isCollidedWith = function(otherObject) {
  const dist = Math.sqrt(
  Math.pow(this.pos[0] - otherObject.pos[0], 2) + Math.pow(this.pos[1] - otherObject.pos[1], 2)
  );
  return (dist < (this.radius + otherObject.radius));

}

MovingObject.prototype.collideWith = function(otherObject) {
  this.game.remove(otherObject);
  this.game.remove(this);
};


module.exports = MovingObject;