// Array#uniq
Array.prototype.myUniq = function() {
  let uniqArr = [];
  this.forEach (function (el) {
    if (!uniqArr.includes(el)) {
      uniqArr.push(el);
    }
  });
  return uniqArr;
};

// Array#twosum
Array.prototype.myTwoSum = function() {
  let sumIdx = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        sumIdx.push([i, j]);
      }
    }
  }
  return sumIdx;
};

// Array#transpose
Array.prototype.myTranspose = function() {
  let transposed = [];
  for (let col = 0; col < this[0].length; col++) { 
    let currentRow = [];
    for (let row = 0; row < this.length; row++) {
      currentRow.push(this[row][col]);
    }
    transposed.push(currentRow);
  }
  return transposed;
};
