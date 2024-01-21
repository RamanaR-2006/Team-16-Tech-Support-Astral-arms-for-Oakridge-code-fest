#include <Servo.h>
#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>
Adafruit_PWMServoDriver pwm = Adafruit_PWMServoDriver();
int pos0 = 102;
int pos180 = 512;
int x=110;
int y=45;
int z=45;
int down=0;
int down2=0;
int down3=0;
int down4=0;
void setServo(int servo, int angle) {
  int duty;
  duty = map(angle, 0, 180, pos0, pos180);
  pwm.setPWM(servo, 0, duty);
  delay(300);
}
void setup() 
{
  delay(5000);                            // <-- So I have time to get controller to starting position
  
  pwm.begin();
  pwm.setPWMFreq(50);            
  pinMode(13,INPUT_PULLUP);
  Serial.begin(9600);
  setServo(1, 0);
   setServo(1, 90);
   setServo(1, 45);
}



void loop() 
{
  // put your main code here, to run repeatedly:
  if(Serial.available())
  {
    char val = Serial.read();
    Serial.println(val);
    if(val == 'R')
    {
      if(x<=110)
      x=x+40;
      setServo(15, x);
    }
    if(val == 'L')
    {
      if(x>=110)
      x=x-40;
      setServo(15, x);
    }
    if(val == 'F')
    {
      if(y<=70)
      y=y+20;
      if(z>=110)
      z=z-20;
      setServo(2, y);
      setServo(3,z);

    }
   if(val == 'D')
    {
      if(y>=20)
      y=y-20;
      if(z<=70)
      z=z+20;
      setServo(2, y);
      setServo(3,z);
    }
  }
}
