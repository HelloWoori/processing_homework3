#include <NewPing.h>
const int trigPin = 9;
const int echoPin = 10;

long duration;
int distance;

int dir = 1;
NewPing sonar(trigPin, echoPin, 100);

void setup() {
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600);
}

void loop() {
  delay(50);
  getDistanceAndSendSerial();
}

int getDistanceAndSendSerial() {
  int cm = sonar.ping_cm();
  Serial.println(cm, DEC);
}
