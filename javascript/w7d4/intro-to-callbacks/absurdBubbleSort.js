const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});



function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) { 
    if (madeAnySwaps === true) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else { 
      sortCompletionCallback(arr);
      reader.close();
    }
  }

  outerBubbleSortLoop(true);
}

function askIfGreaterThan(el1, el2, cb) {
  reader.question(`Is ${el1} > ${el2} ?   `, answer => {
    if (!['yes','Yes', 'y', 'Y', 'No', 'no', 'n'].includes(answer)) {
      console.log('Please enter yes or no');
      askIfGreaterThan(el1, el2, cb);
    } else {
      if (['yes','Yes', 'y', 'Y'].includes(answer)) {
        cb(true);
      } else { 
        cb(false);
       }
    }
  });

}


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i < arr.length - 1) {
    askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
      if (isGreaterThan) { 
        [arr[i], arr[i + 1]] = [arr[i + 1], arr[i]]
        madeAnySwaps = true;
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
      } else {
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop);
      }
    });
  } else { 
    outerBubbleSortLoop(madeAnySwaps);
  }
}


absurdBubbleSort([6, 1, 5, 2, 3], arr => console.log(arr));


