Array.prototype.myUniq = function () {
  const arr = [];
  for (let i = 0; i < this.length; i++) {
    if (!arr.includes(this[i])) {
      arr.push(this[i]);
    }
  }
  return arr
}


let array = [3, 3, 6, 4, 2]
console.log(array.myUniq());

Array.prototype.twoSum = function () {
  const arr = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = (i+1); j < this.length; j++) {
      if ( this[i] + this[j] === 0 ) {
        arr.push([i, j]);
      }

    }

  }
  return arr
}

let array = [-3, 3, 6, 4, 2]
console.log(array.twoSum());

Array.prototype.myTranspose = function () {
    const arr = [];

    for (let i = 0; i < this.length; i++) {
            const newRow = [];
        for (let j = 0; j < this.length; j++) {
            newRow.push(this[j][i]);
        }
        arr.push(newRow);
    }
    return arr
}

let array = [[1, 2, 3], [4, 5, 6]]
console.log(array.myTranspose());