class Trem {
  PImage imgTrem;
  float posX;
  float posY;
  float alt;
  float larg;

  Trem (float x, float y) {
    this.posX = x;
    this.posY = y;   
    this.alt = 150;
    this. larg = alt*0.3;
    imgTrem = loadImage(imagesUrl[int(random(imagesUrl.length))]);
  }

  void desenha() {
    image(imgTrem, posX, posY, larg, alt);
    if (stateGame == GAME) {
      if (posY < height)posY+=velocidade;
    }
  }
}

float [][] posTrens = new float [6][6];
int posY;
float lastY;

void initPosTrens () {
  // Position 0
  posTrens[0][0] = -450; // t1
  posTrens[0][1] = -150; // t2
  posTrens[0][2] = -150; // t3
  posTrens[0][3] = -450; // ultY

  //Position 1 
  posTrens[1][0] = -200;
  posTrens[1][1] = -500;
  posTrens[1][2] = -100;
  posTrens[1][3] = -500;

  //Position 2
  posTrens[2][0] = -150;
  posTrens[2][1] = -150;
  posTrens[2][2] = -450;
  posTrens[2][3] = -450;

  //Position 3
  posTrens[3][0] = -100;
  posTrens[3][1] = -500;
  posTrens[3][2] = -200;
  posTrens[3][3] = -500;

  //Position 4
  posTrens[4][0] = -500;
  posTrens[4][1] = -150;
  posTrens[4][2] = -500;
  posTrens[4][3] = -500;

  //Position 5
  posTrens[5][0] = -150;
  posTrens[5][1] = -450;
  posTrens[5][2] = -750;
  posTrens[5][3] = -750;
}

void gerarTrens (ArrayList<Trem> trens) {
  posY = int(random(6));
  lastY = posTrens[posY][3];

  if (trens.size() > 0) {
    for (int i = 0; i < 3; i++) {
      Trem trem = trens.get(i);
      trem.imgTrem = loadImage(imagesUrl[int(random(imagesUrl.length))]);
      trem.posY = posTrens[posY][i];
    }
  } else {
    float posX = 1.25*width/12;
    for (int i = 0; i < 3; i++) {
      trens.add(new Trem(posX, posTrens[posY][i]));
      posX+=4*width/12;
    }
  }
}

void desenhaTrens(ArrayList<Trem> trens) {
  for (int i = 0; i < 3; i++) {
    Trem trem = trens.get(i);
    trem.desenha();
  }
}

void verifyCollision () {
  for (int i = 0; i < trens.size(); i++) {
    Trem trem = trens.get(i);
    if (personagem.posX > trem.posX && personagem.posX < trem.posX+trem.larg && personagem.posY > trem.posY && personagem.posY+50 < trem.posY+trem.alt) {
      startRestart();
      stateGame  = OVER;
    }
  }
}
