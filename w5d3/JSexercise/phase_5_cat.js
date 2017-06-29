function Cat(name, owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}` ;
};

var jeff = new Cat("jeff", "aa");
var Ravi = new Cat("ravi", "haight");
var Young = new Cat("young", "mission");

// document.write(jeff.cuteStatement());

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}`;
};

// document.write(jeff.cuteStatement());
// document.write(Ravi.cuteStatement());

Cat.prototype.meow = function() {
  document.write("meow");
};

// Ravi.meow();

Young.meow = function() {
  document.write("different meow");
};

// Ravi.meow();
// Young.meow();
