const readline = require('readline');
const reader = readline.createInterface( {
  // 1. output the prompt to the standard output (console)
  // 2. read input from the standard input (again, console)
  input: process.stdin,
  output: process.stdout
});

const addNumbers = (sum, numsLeft, completionCallback) => {
  if ( numsLeft > 0) {
    reader.question('Enter a number: ', function(int) {
      let result = parseInt(int, 10);
      sum += result;
      console.log(sum);
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else if ( numsLeft === 0 ) {
    completionCallback(sum);
  }
};

addNumbers(0, 5, sum => console.log(`Total Sum: ${sum}`));
