class DOMNodeCollection {
  constructor(array) {
    this.array = array;
  }

  each(cb) {
    this.array.forEach(cb);
  }

  html(string) {
    if (string instanceof String) {
      this.each(node => {
        node.innerHTML = string;
      });
    } else {
      return this.array[0].innerHTML;
    }
  }

  empty() {
    this.html("");
  }

  append(arg) {
    if (arg instanceof HTMLElement) {
      arg = $l(arg);
    }

    if (typeof arg === "string") {
      this.each(ele => (ele.innerHTML += arg));
    }

    if (arg instanceof DOMNodeCollection) {
      this.each(node => {
        arg.each(child => {
          node.appendChild(child.cloneNode(true));
        });
      });
    }
  }

  attr(attribute, value) {
    if (value) {
      this.each(node => node.setAttribute(attribute, value));
    } else {
      return this.array[0].getAttribute(attribute);
    }
  }

  addClass(myClass) {
    this.each(node => node.classList.add(myClass));
  }

  removeClass(myclass) {
    this.each(node => node.classList.remove(myClass));
  }

  children() {
    let newChildren = [];
    this.each(node => {
      newChildren = newChildren.concat(Array.from(node.children));
    });

    return new DOMNodeCollection(newChildren);
  }

  parent() {
    let newParent = [];
    this.each(node => {
      debugger;
      if (!newParent.includes(node.parentNode)) {
        newParent.push(node.parentNode);
      }
    });

    return new DOMNodeCollection(newParent);
  }

  find(selector) {
    let nodes = [];
    this.each(node => {
      const nodeList = node.querySelectorAll(selector);
      nodes = nodes.concat(Array.from(nodeList));
    });

    return new DOMNodeCollection(nodes);
  }

  remove() {
    this.each(node => node.parentNode.removeChild(node));
  }

  on(event, callback) {
    this.each(node => {
      node.addEventListener(eventName, callback);
      
    });
  }
}

module.exports = DOMNodeCollection;
