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

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n  constructor() {\n    const date = new Date();\n    this.time = {\n      hours: date.getHours(),\n      minutes: date.getMinutes(),\n      seconds: date.getSeconds()\n    };\n    this.printTime();\n    // 4. Schedule the tick at 1 second intervals.\n    setInterval(this._tick.bind(this), 1000);\n  }\n\n  printTime() {\n    const measuredTime = `${this.time[\"hours\"]\n      .toString()\n      .padStart(2, \"0\")}:${this.time[\"minutes\"]\n      .toString()\n      .padStart(2, \"0\")}:${this.time[\"seconds\"].toString().padStart(2, \"0\")}`;\n    let clock1 = document.getElementById(\"clock\");\n    // console.log(\"clk1: \", clock1);\n    // console.log(\"measuredTime: \", measuredTime.toString());\n    Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(measuredTime.toString(), clock1);\n  }\n\n  _tick() {\n    // 1. Increment the time by one second.\n    this.time[\"seconds\"] += 1;\n    if (this.time[\"seconds\"] === 60) {\n      this.time[\"seconds\"] = 0;\n      this.time[\"minutes\"] += 1;\n      if (this.time[\"minutes\"] === 60) {\n        this.time[\"minutes\"] = 0;\n        this.time[\"hours\"] += 1;\n      }\n      this.time[\"hours\"] % 24;\n    }\n    // 2. Call printTime.\n    this.printTime();\n  }\n}\n\nconst clock = new Clock();\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const dogs = {\n  Corgi: \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  Affenpinscher: \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\":\n    \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  Tosa: \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\"\n};\n\nfunction dogLinkCreator() {\n  const dogLinks = [];\n\n  Object.keys(dogs).forEach((dog, ind) => {\n    const atag = document.createElement(\"a\");\n    atag.innerHTML = dog;\n    atag.href = Object.values(dogs)[ind];\n    let li = document.createElement(\"li\");\n    li.classList = \"dog-link\";\n    li.appendChild(atag);\n    dogLinks.push(li);\n  });\n  return dogLinks;\n}\n// Now write a second function called attachDogLinks.In this function invoke the dogLinkCreator and assign the result to a variable named dogLinks.Now that you have your dogLinks array iterate through it and attach each li to the ul element with the class of .drop - down - dog - list.Then call your function at the bottom of your file and you will see your dogs appear!\n\n// Nice\n\nfunction attachDogLinks() {\n  const dogLinks = dogLinkCreator();\n  let ul = document.querySelector(\".drop-down-dog-list\");\n  console.log(ul);\n  dogLinks.forEach(link => {\n    ul.append(link);\n  });\n  // handleLeave();\n  handleEnter();\n}\n\nattachDogLinks();\n\n// Here is where the dog - link class you added to all your li links will come in handy.By default use css to hide all of your lis when the page is loaded.Then write two functions handleEnter and handleLeave to make your dogs links appear and disappear.Remember you can add and remove css classes using javascript!\n\n// Next you'll add your two new eventHandlers to an element on the page so that on mouseenter the dog's links will appear and on mouseleave the links will disappear.Think carefully on where you want to attach your two event listeners.Keep in mind event delegation - you want to be able to hover on and click the dogs links without the dropdown disappearing.\n\nfunction handleEnter() {\n  let ul = document.querySelector(\".drop-down-dog-list\");\n  const mouseTarget = document.querySelector(\".drop-down-dog-nav\");\n  mouseTarget.addEventListener(\"mouseenter\", e => {\n    ul.classList.remove(\"mouse-leave\");\n    ul.classList.add(\"mouse-enter\");\n  });\n}\n\nfunction handleLeave() {\n  let ul = document.querySelector(\".drop-down-dog-list\");\n  const mouseTarget = document.querySelector(\".drop-down-dog-nav\");\n  mouseTarget.addEventListener(\"mouseleave\", e => {\n    ul.classList.remove(\"mouse-enter\");\n    ul.classList.add(\"mouse-leave\");\n  });\n}\n\nhandleEnter();\nhandleLeave();\n// const navBar = document.querySelector(\".drop-down-dog-nav\");\n// navBar.addEventListener(\"mouseenter\", handleEnter);\n// navBar.addEventListener(\"mouseleave\", handleLeave());\n\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("// Create a function called addTodo that will be in charge of listening for the submit event on the form.\n//The addTodo function will:\n\n//     Find the input with the name add - todo and set's it's value to a variable\n// Create a new todo object with the value from add - todo and a done key set to false\n// Push the todo object into the todos array.\n// Reset the add - todo input to be empty so that the user can easily enter another todo\nconst todos = [];\nconst newTodos = document.querySelector(\".todos\");\nconst todoForms = document.querySelector(\".add-todo-form\");\nfunction addTodo() {\n  todoForms.addEventListener(\"submit\", e => {\n    const addTodo = ddocument.querySelector(\"[name=add-todo]\").value;\n    const todo = {\n      task: addToDo,\n      done: false\n    };\n    todos.push(todo);\n    document.document.querySelector(\"[name=add-todo]\").value = \"\";\n  });\n}\n\naddTodo();\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\nconst partyHeader = document.getElementById(\"party\");\n//const partyPlanning = document.getElementById(\"cake\")\nconst htmlGenerator = (string, htmlElement) => {\n  if (htmlElement.children) {\n      let kids = Array.from(htmlElement.children);\n    kids.forEach(child => htmlElement.removeChild(child));\n  }\n\n  let HTMLstring = document.createElement(\"p\");\n  HTMLstring.textContent = string;\n  htmlElement = htmlElement.appendChild(HTMLstring);\n};\n\nhtmlGenerator(\"Party Time.\", partyHeader);\n\n// module.exports = htmlGenerator();\n// export default htmlGenerator\n\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });