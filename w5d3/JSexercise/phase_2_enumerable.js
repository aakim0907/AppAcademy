// myEach
Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

// myMap
Array.prototype.myMap = function (func) {
  const mappedArray = [];

  this.myEach(element => mappedArray.push(func(element)) );

  return mappedArray;
};

//myReduce
Array.prototype.myReduce = function (callback, optional) {
  let iterArr = this;
  let res;

  if (!optional) {
    res = this[0];
    iterArr = this.slice(1);
  } else {
    res = optional;
  }
}
