class Moeda {
  float posX;
  float posY;
  PImage imgCoin1 = loadImage("moeda_v.png");
  PImage imgCoin2 = loadImage("moeda_h.png");
  PImage img;
  final int CIMA = 1;
  final int LADO = 2;
  int time;
  int estado;

  Moeda (float x, float y) {
    this.posX = x;
    this.posY = y;
    estado = CIMA;
    img = imgCoin1;
    time = 0;
  }

  void desenha() {
    this.time++;
    if (this.time>= 0 && this.time<=29) {
      this.img = imgCoin1;
    }
    if (this.time>=30 && this.time<=60) {
      this.img=imgCoin2; 
      if (this.time >= 60) {
        this.time=0;
      }
    }
    image(this.img, posX-25, posY, 50, 50);
    if (stateGame == GAME) {
      if (posY < height+10) posY+=velocidade;
    }
  }
}

float [][] posMoedas = new float [6][11];

void initPosMoedas () {
  // Position 0
  posMoedas[0][0] = 2.1*width/12; 
  posMoedas[0][1] = 6.1*width/12; 
  posMoedas[0][2] = 10.1*width/12; 
  posMoedas[0][3] = -10; 
  posMoedas[0][4] = -90; 
  posMoedas[0][5] = -170; 
  posMoedas[0][6] = -250;  
  posMoedas[0][7] = -250; 
  posMoedas[0][8] = -330; 
  posMoedas[0][9] = -410; 
  posMoedas[0][10] = -490; 

  //Position 1 
  posMoedas[1][0] = 2.1*width/12; 
  posMoedas[1][1] = 6.1*width/12; 
  posMoedas[1][2] = 10.1*width/12; 
  posMoedas[1][3] = -10; 
  posMoedas[1][4] = -90; 
  posMoedas[1][5] = -170; 
  posMoedas[1][6] = -250;  
  posMoedas[1][7] = -250; 
  posMoedas[1][8] = -330; 
  posMoedas[1][9] = -410; 
  posMoedas[1][10] = -490; 

  //Position 2
  posMoedas[2][0] = 2.1*width/12; 
  posMoedas[2][1] = 6.1*width/12; 
  posMoedas[2][2] = 10.1*width/12; 
  posMoedas[2][3] = -250; 
  posMoedas[2][4] = -330; 
  posMoedas[2][5] = -410; 
  posMoedas[2][6] = -490;  
  posMoedas[2][7] = -10; 
  posMoedas[2][8] = -90; 
  posMoedas[2][9] = -170; 
  posMoedas[2][10] = -250; 

  //Position 3
  posMoedas[3][0] = 2.1*width/12; 
  posMoedas[3][1] = 6.1*width/12; 
  posMoedas[3][2] = 10.1*width/12; 
  posMoedas[3][3] = -250; 
  posMoedas[3][4] = -330; 
  posMoedas[3][5] = -410; 
  posMoedas[3][6] = -490;  
  posMoedas[3][7] = -10; 
  posMoedas[3][8] = -90; 
  posMoedas[3][9] = -170; 
  posMoedas[3][10] = -250; 

  //Position 4
  posMoedas[4][0] = 2.1*width/12; 
  posMoedas[4][1] = 6.1*width/12; 
  posMoedas[4][2] = 10.1*width/12; 
  posMoedas[4][3] = -10; 
  posMoedas[4][4] = -90; 
  posMoedas[4][5] = -170; 
  posMoedas[4][6] = -250;  
  posMoedas[4][7] = -250; 
  posMoedas[4][8] = -330; 
  posMoedas[4][9] = -410; 
  posMoedas[4][10] = -490; 

  //Position 5
  posMoedas[5][0] = 2.1*width/12; 
  posMoedas[5][1] = 6.1*width/12; 
  posMoedas[5][2] = 10.1*width/12; 
  posMoedas[5][3] = -250; 
  posMoedas[5][4] = -330; 
  posMoedas[5][5] = -420; 
  posMoedas[5][6] = -490;  
  posMoedas[5][7] = -10; 
  posMoedas[5][8] = -90; 
  posMoedas[5][9] = -170; 
  posMoedas[5][10] = -250;
}

void gerarMoedas (ArrayList<Moeda> moedas) {
  for (int i = 0; i < 8; i++) {
    if (posY == 0 || posY == 5 || posY == 3 || posY == 4) {
      if (i < 4) {
        moedas.add(new Moeda(posMoedas[posY][0], posMoedas[posY][i+3]));
      } else {
        moedas.add(new Moeda(posMoedas[posY][1], posMoedas[posY][i+3]));
      }
    } else {
      if (i < 4) {
        moedas.add(new Moeda(posMoedas[posY][1], posMoedas[posY][i+3]));
      } else {
        moedas.add(new Moeda(posMoedas[posY][2], posMoedas[posY][i+3]));
      }
    }
  }
}

void desenhaMoedas(ArrayList<Moeda> moedas) {
  for (int i = 0; i < moedas.size(); i++) {
    Moeda moeda = moedas.get(i);
    moeda.desenha();
  }
}

void verifyCollisionCoin () {
  for (int i = 0; i < moedas.size(); i++) {
    Moeda moeda = moedas.get(i);
    if (personagem.posX > moeda.posX-10 && personagem.posX < moeda.posX+50 && personagem.posY > moeda.posY-50 && personagem.posY+50 < moeda.posY+50) {
      qntMoedas++;
      moedas.remove(moeda);
    }
    if (moeda.posY+10 > height) moedas.remove(moeda);
  }
}
