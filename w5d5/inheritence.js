Function.prototype.inherits1 = function(SuperClass) {
  let Subclass = this;
  function Surrogate() {}
  Surrogate.prototype = SuperClass.prototype;
  Subclass.prototype = new Surrogate();
  Subclass.prototype.constructor = Subclass;
};

Function.prototype.inherits2 = function(SuperClass) {
  let SubClass = this;
SubClass.prototype = Object.create(SuperClass.prototype);
};


function Dog (name) {
  this.name = name;
}

Dog.prototype.bark = function () {
  console.log(this.name + " barks!");
};

function Corgi (name) {
  Dog.call(this, name);
}

Corgi.inherits1(Dog);

Corgi.prototype.waddle = function () {
  console.log(this.name + " waddles!");
};


const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();
