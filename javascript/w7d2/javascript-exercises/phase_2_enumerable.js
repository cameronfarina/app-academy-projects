const array = [1, 2, 3]

function myEachCallback(a) {
  return(a * 2)
}

Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

array.myEach(myEach);


// function myMapCallBack(el) {
//         return (el * 2);
//     };

// Array.prototype.myMap = function(cb) {
//     newArray = [];
//     this.myEach(function(el) {
//       newArray.push(cb(el));
//     }) 

//     return newArray;
// }

// array.myMap(myMapCallBack);



const array = [1, 2, 3]

function myReduceCallBack(acc, el) {
  return (acc + el);
}

Array.prototype.myReduce = function (cb, initialValue) {
  let acc;
    if (initialValue === undefined) {
      initialValue = this[0];
      this.slice(1).myEach(function(el) {
        initialValue = cb(initialValue, el)
      });
    } else {
      this.myEach(function(el) {
        initialValue = cb(initialValue, el)
      });
    }
    return initialValue

}
array.myReduce(myReduceCallBack, 25);

