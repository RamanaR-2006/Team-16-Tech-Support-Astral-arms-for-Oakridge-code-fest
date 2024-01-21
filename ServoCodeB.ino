#define right_button 2
#define left_button 3
#define front_button 4
#define back_button 5
int value = 0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, INPUT_PULLUP);
}

void loop() {
  int v1 = digitalRead(2);
  int v2 = digitalRead(3);
  int v3 = digitalRead(4);
  int v4 = digitalRead(5);
  if(v1 == 0)
  {
    Serial.println("R");
    delay(20);
  }
  if(v2==0)
  {
    Serial.println("L");
    delay(20);
  }
 if(v3==0)
  {
    Serial.println("F");
    delay(20);
  }
  if(v4==0)
  {
    Serial.println("D");
    delay(20);
  }
  delay(200);
}
