// function sum() {
//     let total = 0;
//     for (let i = 0; i < arguments.length; i++) {
//         total += arguments[i];
//     }
//     return total;
// }

// function sum(...arguments) {
//     let total = 0;
//     for (let i = 0; i < arguments.length; i++) {
//         total += arguments[i];
//     }
//     return total;
// }

// Function.prototype.myBind = function (context) {
//     const that = this;
//     const bindArgs = [].slice.call(arguments, 1);
//     return function () {
//         const callArgs = [].slice.call(arguments);
//         return that.apply(context, bindArgs.concat(callArgs));
//     };
// };


// Function.prototype.myBind2 = function (context, ...bindArgs) {
//     return (...callArgs) => this.apply(context, bindArgs.concat(callArgs));
// }

// function curriedSum (numArgs) {
//   const numbers = [];
  
//   function _curriedSum (num) {
//     numbers.push(num);
//     if (numbers.length === numArgs) {
//       let result = 0;
//       numbers.forEach((num) => {result += num;} );
//       return result;
//     } else {
//       return _curriedSum;
//     }
//   }
//   return _curriedSum;
// }


// const curriedAdd = curriedSum(4);
// console.log(curriedAdd(5)(30)(20)(1)); // => 56

//----------apply---------------------- //
// Function.prototype.curry = function (numArgs) {
//   const numbersArray = [];
//   const random = this;

//   function _curriedSum(num) {
//     numbersArray.push(num);
    
//     if (numbersArray.length === numArgs) {
//       return random.apply(null, numbersArray);
//     } else {
//       return _curriedSum;
//     }
//   }
//   return _curriedSum;
// };

// function sumThree(num1, num2, num3) {
//     console.log(this);
//     return num1 + num2 + num3;
// }


// curry_add1 = sumThree.curry(3);
// console.log(curry_add1(5)(30)(20)); // => 55

Function.prototype.curry = function (numArgs) {
  const numbersArray = [];

  const _curriedSum = (num) => {
    numbersArray.push(num);
    
    if (numbersArray.length === numArgs) {
      return this(...numbersArray);
    } else {
      return _curriedSum;
    }
    
  };
  return _curriedSum;
};

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

const curry_add1 = sumThree.curry(3);
console.log(curry_add1(5)(30)(20)); // => 55
