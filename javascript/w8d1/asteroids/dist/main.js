/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nconst asteroidDEFAULTS = {\n  COLOR: '#000000',\n  RADIUS: 10\n};\n\nconst Asteroid = function (options) { \n    options.color = asteroidDEFAULTS.COLOR;\n    options.radius = asteroidDEFAULTS.RADIUS;\n    options.vel = Util.randomVec(4);\n    options.pos = options.game.randomPosition();\n    \n\n    MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship.js */ \"./src/ship.js\");\n\n\nconst Game = function () {\n    this.asteroids = [];\n    this.ship = new Ship({ pos: this.randomPosition(), game: this });\n\n    this.addAsteroids();\n};\n\nGame.DIM_X = 500;\nGame.DIM_Y = 500;\nGame.NUM_ASTEROIDS = 4;\n\nGame.prototype.addAsteroids = function () {\n  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {\n    const r_pos = this.randomPosition();\n    this.asteroids.push(new Asteroid({ game: this }));\n  }\n}\n\nGame.prototype.randomPosition = function() {\n  const x = Math.random() * Game.DIM_X;\n  const y = Math.random() * Game.DIM_Y;\n  return [x, y];\n}\n\nGame.prototype.draw = function (ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  this.asteroids.forEach(function (asteroid) {\n    asteroid.draw(ctx);\n  });\n};\n\nGame.prototype.moveObjects = function () {\n  this.asteroids.forEach(function (asteroid) {\n    asteroid.move();\n  });\n}\n\nGame.prototype.wrap = function (pos) {\n  wrappedPosition = [];\n  if (pos[0] > Game.DIM_X) {\n      pos[0] = 0;\n      wrappedPosition.push(pos[0]);\n  } else if (pos[0] < 0) {\n    pos[0] = Game.DIM_X;\n    wrappedPosition.push(pos[0]);\n  } else if (pos[1] > Game.DIM_Y) {\n    pos[1] = 0;\n    wrappedPosition.push(pos[1]);\n  } else if (pos[1] < 0) {\n    pos[1] = Game.DIM_Y;\n    wrappedPosition.push(pos[1]);\n  }\n\n  return wrappedPosition;\n};\n\nGame.prototype.checkCollisions = function () {\n  const allAsteroids = this.asteroids;\n  for(let i = 0; i < allAsteroids.length; i++) {\n    for (let j = 0; j < allAsteroids.length; j++) {\n      if (i !== j) {\n        const asteroid1 = allAsteroids[i];\n        const asteroid2 = allAsteroids[j];\n\n        if (asteroid1.isCollidedWith(asteroid2)) {\n          asteroid1.collideWith(asteroid2);\n        }\n      }\n    }\n  }\n};\n\nGame.prototype.step = function () {\n  this.moveObjects();\n  this.checkCollisions();\n};\n\n\nGame.prototype.remove = function (asteroid) {\n  this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);\n};\n\n\nGame.prototype.allObjects = function () {\n  const allObj = this.asteroids.push(this.ship);\n  return allObj;\n};\n\n\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const GameView = function (game, ctx) {\n  this.ctx = ctx;\n  this.game = game;\n};\n// console.log(GameView);\n\nGameView.prototype.start = function () {\n    setInterval(() => {\n      this.game.draw(this.ctx);\n      this.game.step();\n    }, 20)\n};\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const MovingObject = require(\"./moving_object.js\");\n// const Asteroid = require(\"./asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\n\n\n  // window.Asteroid = Asteroid;\n  window.Game = Game;\n  window.GameView = GameView;\n  // window.MovingObject = MovingObject;\n\n\nwindow.addEventListener('DOMContentLoaded', function() {\n  width = Game.DIM_X;\n  height = Game.DIM_Y;\n  const newGame = new Game();\n  canvas = document.getElementById('game-canvas');\n  ctx = canvas.getContext(\"2d\");\n  console.log(Game);\n  newGameView = new GameView(newGame, ctx);\n  newGameView.start();\n});\n\n\n\n\n// document.addEventListener(\"DOMContentLoaded\", function () {\n//   const canvasEl = document.getElementById(\"game-canvas\");\n//   canvasEl.width = 500;\n//   canvasEl.height = 500;\n\n//   const ctx = canvasEl.getContext(\"2d\");\n//   ctx.fillStyle = \"purple\";\n//   ctx.fillRect(0, 0, 500, 500);\n\n//   ctx.beginPath();\n//   ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);\n//   ctx.strokeStyle = \"green\";\n//   ctx.lineWidth = 5;\n//   ctx.stroke();\n//   ctx.fillStyle = \"blue\";\n//   ctx.fill();\n// });\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const MovingObject = function(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n};\n\n\nMovingObject.prototype.draw = function (ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0, \n        2 * Math.PI,\n        true\n    );\n\n    ctx.fill();\n};\n\nMovingObject.prototype.move = function () {\n    const new_x = this.pos[0] += this.vel[0];\n    const new_y = this.pos[1] += this.vel[1];\n  if ((new_x > 500) || (new_x < 0)) {\n    this.game.wrap(this.pos);\n  } else if ((new_y > 500) || (new_y < 0)){\n    this.game.wrap(this.pos);\n  } \n};\n// this is math, not JavaScript\n// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  const dist = Math.sqrt(\n  Math.pow(this.pos[0] - otherObject.pos[0], 2) + Math.pow(this.pos[1] - otherObject.pos[1], 2)\n  );\n  return (dist < (this.radius + otherObject.radius));\n\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  this.game.remove(otherObject);\n  this.game.remove(this);\n};\n\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\n\nconst SHIP_VALUES = {\n    RADIUS: 15,\n    COLOR: \"#ff0000\"\n}\n\nconst Ship = function (options) {\n  options.radius = SHIP_VALUES.RADIUS;\n  options.color = SHIP_VALUES.COLOR;\n  options.vel = [0,0]; \n};\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate () {}\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n};\n\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ });