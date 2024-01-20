//Arduino Uno board being used:
#define sensorPin  A0 // flex sensor is connected to A0 pin
#define PWMPin  6 // LED is attached to this 
float VCC = 5; // arduino is powered with 5V VCC pins
float R2 = 10000; // two 10K resistors are used
// property of the flex sensor (what I refer to as the Flex later on) is that as it is bent, resistance should increase (bent in one direction only). Flat flex sensor = least resistance)
float minResistance = 16700; // value of the Flex when its flat
float maxResistance = 18200; // value of the Flex when its bent (max degrees = 90)


void setup() {
  Serial.begin(9600); // initialise the serial monitor and plotter baud rates
  pinMode(sensorPin, INPUT); // sensor pin accepts input

}


void loop() {
  int ADCRaw = analogRead(sensorPin);
  float ADCVoltage = (ADCRaw * VCC) / 1023; // get the voltage value
  float Resistance = R2 * (VCC / ADCVoltage - 1); // calculate resistance as you bend/keep it flat
  uint8_t ReadValue = map(Resistance, minResistance, maxResistance, 0, 255); // map the values 16700 to 0  18200 to 255
  analogWrite(PWMPin, ReadValue); // Generate PWM Signal

  // information for debugging 
  Serial.print(Resistance);
  Serial.print("  ");
  Serial.println(ReadValue);
  delay(100);

}
