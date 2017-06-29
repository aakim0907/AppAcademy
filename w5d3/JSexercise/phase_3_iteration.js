// Bubble Sort
Array.prototype.bubbleSort = function() {
  let bubbled = this;
  let sorted = false;

  while (!sorted) {
    sorted = true;
    for (let i = 0; i < bubbled.length - 1; i++) {
      if (bubbled[i] > bubbled[i + 1]) {
        // let first = bubbled[i];
        // bubbled[i] = bubbled[i + 1];
        // bubbled[i + 1] = first;
        [bubbled[i], bubbled[i + 1]] = [bubbled[i + 1], bubbled[i]];
        sorted = false;
      }
    }
  }
  return bubbled;
};

// substrings
String.prototype.substrings = function() {
  let subs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1 ; j <= this.length; j++) {
      subs.push(this.substring(i, j));
    }
  }
  return subs;
};
