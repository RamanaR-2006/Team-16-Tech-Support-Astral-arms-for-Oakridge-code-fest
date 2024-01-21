
const int flexPin = A0; 
 
void setup() 
{ 
  Serial.begin(9600);
} 
 
void loop() 
{ 
  int flexValue;
  flexValue = analogRead(flexPin);
  Serial.print("sensor: ");
  Serial.println(flexValue);
  
  delay(20);
} 
