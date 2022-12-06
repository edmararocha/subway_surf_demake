float linhas[] = new float[7];

void cenario () {
  background(120);
  stroke(180);
  strokeWeight(2);
  line(width/3, 0, width/3, height);
  line(2*width/3, 0, 2*width/3, height);
  desenhaLinhas(width/2);
  desenhaLinhas(0.5*width/3);
  desenhaLinhas(2.5*width/3);
}

void desenhaLinhas (float x) {
  noStroke();
  fill(180);
  for (int i = 0; i < linhas.length; i++) {
    rect(x, linhas[i], 5, height/12);
  }
}

void initLinhas() {
  for (int i = 0; i < 7; i++) {
    linhas[i] = i*85;
  }
}
