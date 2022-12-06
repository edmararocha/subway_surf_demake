class Personagem {
  PImage imgCentroD = loadImage("centroD.png");
  PImage imgCentroE = loadImage("centroE.png");
  final int CENTRO = 0;
  final int ESQUERDA = 1;
  final int DIREITA = 2;
  
  final int pernaE = 4;
  final int pernaD = 5;
  int tempo;
  int state;
  PImage img;

  float posX;
  float posY;

  Personagem() {
    state = CENTRO;
    posX = width/2;
    posY = (2.5 * height / 3)-50;
    img = imgCentroD;
    tempo = 0;
  }

  void checkMoves() {
    switch (this.state) {
    case CENTRO:
      this.posX = width/2;
      break;
    case ESQUERDA:
      this.posX = 0.5*width/3;
      break;
    case DIREITA:
      this.posX = 2.5*width/3;
      break;
    }
  }

  void moveMEF() {
    if (this.state == CENTRO) {
      if (keyCode == LEFT) {
        this.state = ESQUERDA;
      }
      if (keyCode == RIGHT) {
        this.state = DIREITA;
      }
    }
    
    if (this.state == ESQUERDA) {
      if (keyCode == RIGHT) {
        this.state = CENTRO;
      }
    }

    if (this.state == DIREITA) {
      if (keyCode == LEFT) {
        this.state = CENTRO;
      }
    }
    this.checkMoves();
  }
  
  void mostraPer () {
    this.tempo++;
    if (this.tempo >= 0 && this.tempo<=29) {
      this.img = imgCentroD;
      //println("D");
    } 
    if (this.tempo >= 30 && this.tempo<=60) {
      this.img = imgCentroE;
      //println("E");
      if (this.tempo >= 60) {
        this.tempo = 0;
      }
    }
    image(this.img, posX-50, posY, 100, 100);
  }
}
