// sum
const sum1 = function(args) {
  let myArg = Array.prototype.slice.call(arguments);
  let totalSum = 0;
  myArg.forEach(num => (totalSum += num));
  return totalSum;
};

const sum2 = function(...args) {
  let myArg = args;
  let totalSum = 0;
  myArg.forEach(num => (totalSum += num));
  return totalSum;
};

// bind with args
class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");


Function.prototype.myBind = function(arg, ...bindArgs) {
  return (...callArgs) => this.apply(arg, bindArgs.concat(callArgs));
};


// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");

// markov.says.myBind(breakfast, "meow", "Kush")();

// curriedSum
const curriedSum = function (numArgs) {
  let numbers = [];
  let _curriedSum = function (num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      return numbers.reduce( (sum, value) => sum + value );
    } else {
      return _curriedSum;
    }
  };

  return _curriedSum;
};

// const sumThis = curriedSum(4);
// console.log(sumThis(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  let args = [];
  let fn = this;
  let innerCurry = function (arg) {
    args.push(arg);
    if ( args.length === numArgs) {
      return fn.apply(5, args);
    } else {
      return innerCurry;
    }
  };

  return innerCurry;
};

function sumThree(num1, num2, num3) {
  console.log(num1 + num2 + num3);
}

console.log(sumThree.curry(3)(4)(20)(6));// == 30
