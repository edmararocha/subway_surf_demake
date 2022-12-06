final int MENU = 0;
final int GAME = 1;
final int ABOUT = 2;
final int PAUSE = 3;
final int OVER = 4;
int stateGame;

PImage imgM, imgO, imgA, imgReset, imgHome, imgP, imgMoeda, imgPause, imgStar;
String imagesUrl [] = {"t1.png", "t2.png", "t3.png"};
PFont fontAtari;

Personagem personagem;
ArrayList<Trem> trens;
ArrayList<Moeda> moedas;
int velocidade;
int qntMoedas, qntMoedasP, qntMoedasGeral;
int score, scoreP, scoreGeral;

void setup () {
  size(300, 600);
  stateGame = MENU;
  imgM = loadImage("1.png");
  imgA = loadImage("2.png");
  imgO = loadImage("3.png");
  imgP = loadImage("4.png");
  imgReset = loadImage("voltar.png");
  imgHome = loadImage("home.png");
  imgMoeda = loadImage("moeda.png");
  imgPause = loadImage("pause.png");
  imgStar = loadImage("star.png");
  fontAtari = createFont("AtariSmall.otf", 50);
  textFont(fontAtari, 50);
  initLinhas();
  initPosTrens();
  initPosMoedas();
  startRestart();
}
void draw () {
  for (int j =0; j < 7; j++) {
    if (linhas[j] < height) {
      linhas[j]+=velocidade+2;
    } else {
      linhas[j] = 0;
    }
  }

  managementStates(stateGame);
  stroke(255, 0, 0);
  //for (int i = 1; i < 20; i++) {
  //  line(0, i*30, width, i*30);
  //  println(i);
  //}
  //for (int i = 1; i < 10; i++) {
  //  line(i*30, 0, i*30, height);
  //}
}

void mousePressed () {
  switch (stateGame) {
  case MENU:
    if (mousePressed) {
      if (mouseX > 90 && mouseX < 210 && mouseY > 250 && mouseY < 300) stateGame = GAME;
      if (mouseX > 90 && mouseX < 210 && mouseY > 325 && mouseY < 375) stateGame = ABOUT;
    }
    break;
  case GAME:
    if (mousePressed) {
      if (mouseX > 245 && mouseX < 280 && mouseY > 14 && mouseY < 49) stateGame = PAUSE;
    }
    break;
  case ABOUT:
    if (mousePressed) {
      if (mouseX > 225 && mouseX < 295 && mouseY > 15 && mouseY < 55) stateGame = MENU;
    }
    break;
  case PAUSE:
    if (mousePressed) {
      if (mouseX > 20 && mouseX < 70 && mouseY > 20 && mouseY < 70) stateGame = GAME;
      if (mouseX > 230 && mouseX < 285 && mouseY > 20 && mouseY < 70) { 
        startRestart();
        stateGame = MENU;
      }
    }
    break;
  case OVER:
    if (mousePressed) {
      if (mouseX > 100 && mouseX < 220 && mouseY > 270 && mouseY < 320) stateGame = GAME;
      if (mouseX > 100 && mouseX < 220 && mouseY > 335 && mouseY < 385) { 
        startRestart();
        stateGame = MENU;
      }
    }
    break;
  }
}

void keyPressed () {
  personagem.moveMEF();
}

void managementStates (int state) {
  switch (state) {
  case MENU:
    menu();
    break;
  case GAME:
    game();
    break;
  case ABOUT:
    about();
    break;
  case PAUSE:
    pause();
    break;
  case OVER:
    over();
    break;
  }
}

void menu () {
  image(imgM, 0, 0);
}
void game () {
  cenario();
  desenhaTrens(trens);
  desenhaMoedas(moedas);
  personagem.mostraPer();
  header();
  if (lastY > height) {
    gerarTrens(trens);
    gerarMoedas(moedas);
  }
  lastY+=velocidade;
  if (frameCount%700 == 0 && velocidade < 10) velocidade++;
  if (frameCount%10 == 0) score+=velocidade;
  verifyCollision();
  verifyCollisionCoin();
}
void about () {
  image(imgA, 0, 0);
}
void pause () {
  image(imgP, 0, 0);
  image(imgReset, 20, 10, 50, 70);
  image(imgHome, 220, 20, 75, 50);
}
void over() {
  image(imgO, 0, 0);
  text(scoreGeral, 130, 455);
}

void header() {
  fill(255);
  textSize(25);
  image(imgMoeda, 10, 55, 40, 45);
  text(qntMoedas, 50, 85);
  image(imgStar, 10, 10, 40, 40);
  text(score, 60, 40);  
  image(imgPause, 220, -15, 85, 95);
}

void startRestart () {
  qntMoedasP = qntMoedas;
  scoreP = score;
  if (scoreP > scoreGeral) scoreGeral = scoreP;
  personagem = new Personagem();
  trens = new ArrayList<Trem>();
  moedas = new ArrayList<Moeda>();
  velocidade = 3;
  qntMoedas = 0;
  score = 0;
  gerarTrens(trens);
  gerarMoedas(moedas);
}
