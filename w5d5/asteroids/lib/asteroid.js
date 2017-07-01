const movingObject = require ('./moving_object.js');
const Util = require('./util.js');



class Asteroid extends movingObject {

  constructor(opt = {}){
    const vel = Util.randomVec(2);
    const radius = 25;
    const color = "#00FF00";
    return new movingObject (opt['pos'], vel, radius, color);
  }


}


new Asteroid({ pos: [30, 30] });
module.exports = Asteroid;
