const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft) {
    if (numsLeft > 0) {
        reader.question('Give me a num:  ', (input) => {
            const parsedNum = parseInt(input);
            sum += parsedNum;
            console.log(`This is the sum: ${sum}`);
            addNumbers(sum, numsLeft - 1);
        });
  } else {
    reader.close();
    return sum;
  }
};

addNumbers(0, 3);
