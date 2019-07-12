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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(array) {\n    this.array = array;\n  }\n\n  each(cb) {\n    this.array.forEach(cb);\n  }\n\n  html(string) {\n    if (string instanceof String) {\n      this.each(node => {\n        node.innerHTML = string;\n      });\n    } else {\n      return this.array[0].innerHTML;\n    }\n  }\n\n  empty() {\n    this.html(\"\");\n  }\n\n  append(arg) {\n    if (arg instanceof HTMLElement) {\n      arg = $l(arg);\n    }\n\n    if (typeof arg === \"string\") {\n      this.each(ele => (ele.innerHTML += arg));\n    }\n\n    if (arg instanceof DOMNodeCollection) {\n      this.each(node => {\n        arg.each(child => {\n          node.appendChild(child.cloneNode(true));\n        });\n      });\n    }\n  }\n\n  attr(attribute, value) {\n    if (value) {\n      this.each(node => node.setAttribute(attribute, value));\n    } else {\n      return this.array[0].getAttribute(attribute);\n    }\n  }\n\n  addClass(myClass) {\n    this.each(node => node.classList.add(myClass));\n  }\n\n  removeClass(myclass) {\n    this.each(node => node.classList.remove(myClass));\n  }\n\n  children() {\n    let newChildren = [];\n    this.each(node => {\n      newChildren = newChildren.concat(Array.from(node.children));\n    });\n\n    return new DOMNodeCollection(newChildren);\n  }\n\n  parent() {\n    let newParent = [];\n    this.each(node => {\n      debugger;\n      if (!newParent.includes(node.parentNode)) {\n        newParent.push(node.parentNode);\n      }\n    });\n\n    return new DOMNodeCollection(newParent);\n  }\n\n  find(selector) {\n    let nodes = [];\n    this.each(node => {\n      const nodeList = node.querySelectorAll(selector);\n      nodes = nodes.concat(Array.from(nodeList));\n    });\n\n    return new DOMNodeCollection(nodes);\n  }\n\n  remove() {\n    this.each(node => node.parentNode.removeChild(node));\n  }\n\n  on(event, callback) {\n    this.each(node => {\n      node.addEventListener(eventName, callback);\n      \n    });\n  }\n}\n\nmodule.exports = DOMNodeCollection;\n\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nwindow.$l = arg => {\n  \n  if (typeof arg === 'string') {\n    const nodeList = document.querySelectorAll(arg);\n    const nodeListArray = Array.prototype.slice.call(nodeList);\n    return new DOMNodeCollection(nodeListArray);\n  } else if (arg instanceof HTMLElement) {\n    return new DOMNodeCollection([arg]);\n  }\n  //come back later\n};\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });