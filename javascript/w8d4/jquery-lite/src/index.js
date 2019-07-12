const DOMNodeCollection = require("./dom_node_collection");

window.$l = arg => {
  
  if (typeof arg === 'string') {
    const nodeList = document.querySelectorAll(arg);
    const nodeListArray = Array.prototype.slice.call(nodeList);
    return new DOMNodeCollection(nodeListArray);
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection([arg]);
  }
  //come back later
};
