// -------- SURROGATE ----------- //
// Function.prototype.inherits = function (SuperClass) {
//     function Surrogate (){}
    
//     Surrogate.prototype = SuperClass.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// };

// ----- OBJECT CREATE -------- //

Function.prototype.inherits = function (SuperClass) {
    this.prototype = Object.create(SuperClass.prototype)
    this.prototype.constructor = this;
};


function MovingObject(speed, name) {
    this.name = name;
    this.speed = speed;
}

MovingObject.prototype.say_name = function () {
  console.log(this.name);
}

function Ship (speed, name) {
  MovingObject.call(this, speed, name);
}

Ship.inherits(MovingObject);

Ship.prototype.speedUp = function () {
  console.log(`${this.name} is speeding up`);
};


// function Asteroid (name) {
// }
// Asteroid.inherits(MovingObject);

// const newAst = new Asteroid('whatever');
const newShip = new Ship(45, 'destroyer');

newShip.speedUp();
console.log(newShip);
// newAst.speed();
