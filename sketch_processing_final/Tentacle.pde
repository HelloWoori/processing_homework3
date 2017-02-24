/* Tentacle class */
class Tentacle {
  float x, y;
  float radius;
  float decrease;
  boolean dead;
  float vx;
  float vy;
  float sat = 0;
  float bright = 91;

  Tentacle(float xx, float yy) {
    x = xx;
    y = yy;
    radius = random(10, 80);

    vx = width/2 + random(-100, 100);
    vy = height/2 + random(-100, 100);
    decrease = random(-0.3, -0.02);
  }

  void update() {
    radius = radius + decrease;
    vx = vx + 0.05;
    vy = vy + 0.02;
    x = x + (noise(vx) - 0.5) * noiseScale;
    y = y + (noise(vy) - 0.5) * noiseScale;
    if (radius < 0) dead = true;
  }

  void display() {
    fill(255, 10);
    bright += 0.2;
    ellipse(x, y, radius, radius);
  }

  void setColor(int colorSet) { //숫자넘기면 해당컬러로 전환
    switch(colorSet) {
    case 0: 
      stroke(#fccf1c); //노랑
      break;
    case 1: 
      stroke(#fa5f02); // 주황
      break;
    case 2:
      stroke(#fc3b67); //핑크
      break;
    case 3:
      stroke(#a23670); //보
      break;
    }//switch()문
  }
}