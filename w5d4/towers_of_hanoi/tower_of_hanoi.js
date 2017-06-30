const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
  });

class Game {
  constructor (){
    this.tower = [[1, 2, 3],[],[]];
  }

  promptMove () {
    console.log(this.tower);
    reader.question('From which tower?: ', function (startTowerIdx) {
      reader.question ('To which tower?: ', function (endTowerIdx) {
        console.log(startTowerIdx, endTowerIdx);
        //parse number
      });
    }
  );
  }

  isValidMove (startTowerIdx, endTowerIdx) {
    const startTower = this.tower[startTowerIdx];
    const endTower = this.tower[endTowerIdx];

    if (startTower.length === 0) {
      return false;
    } else if (endTower.length === 0) {
      return true;
    } else {
      const topStartDisc = startTower[startTower.length - 1]
    }

  }

}
