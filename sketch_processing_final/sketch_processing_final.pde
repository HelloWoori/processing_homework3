import processing.serial.*;
int MAX_DISTANCE = 100;

Serial myPort;
String comPortString;

int distance;
//여기까지 프로세싱 관련

/* variables */
Tentacle[] tts;
float noiseScale = 3;
int radius = 0;

/* setup */
void setup() {
  size(1200, 500);

  myPort = new Serial(this, "/dev/cu.wchusbserial1410", 9600);
  myPort.bufferUntil('\n');

  background(255);
  frameRate(30);
  strokeWeight(0.1);

  int num = 100;
  int dia = width/num;
  tts = new Tentacle[num];

  for (int i=0; i<tts.length; i++) {
    float x = dia/2 + i*dia;
    tts[i] = new Tentacle(x, 300);
  }
}

/* draw */
void draw() {

  comPortString = myPort.readStringUntil('\n');
  if (comPortString != null) {
    comPortString=trim(comPortString);
    String[] values = split(comPortString, ',');
    try {
      distance = Integer.parseInt(values[0]);
    }
    catch(Exception e) {
      println(distance);
    }
  }  


  for (int i=0; i<tts.length; i++) {
    tts[i].update();
    if (distance == 0)tts[i].setColor(0);
    else if (distance == 1) tts[i].setColor(1);
    else if (distance == 2) tts[i].setColor(2);
    else if (distance == 3) tts[i].setColor(3);
    else tts[i].setColor(4);
    tts[i].display();
    if (tts[i].dead == true) {
      tts[i].radius = 0.0;
    }
  }
}