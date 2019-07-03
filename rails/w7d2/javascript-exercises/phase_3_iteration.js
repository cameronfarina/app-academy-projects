Array.prototype.bubbleSort = function() {
    let isSorted = false;
    
    while(!isSorted) {
      isSorted = true;

      for(let i = 0; i < (this.length - 1); i++) {
        if (this[i] > this[i + 1]) {
          [this[i], this[i + 1]] = [this[i + 1], this[i]];
          isSorted = false;
        }
      }
    }
    return this
}

let array = [-3, 3, 6, 4, 2]
console.log(array.bubbleSort());


String.prototype.substrings = function () {
  let substrings = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = (i + 1); j <= this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }
  return substrings;
}

console.log("help".substrings());