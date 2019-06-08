#include<Wire.h>
const int MPU=0x68; 
int16_t AcX,AcY,AcZ,Tmp,AcXnew,AcYnew,AcZnew;
int x=1,AcXold=0,AcYold=0,AcZold=0;

void setup(){
  Wire.begin();
  Wire.beginTransmission(MPU);
  Wire.write(0x6B); 
  Wire.write(0);    
  Wire.endTransmission(true);
  Serial.begin(9600);
 
}
void loop(){
  Wire.beginTransmission(MPU);
  Wire.write(0x3B);  
  Wire.endTransmission(false);
  Wire.requestFrom(MPU,12,true);  
  AcX=Wire.read()<<8|Wire.read();  
  AcY=Wire.read()<<8|Wire.read();  
  AcZ=Wire.read()<<8|Wire.read();
 

Serial.println(AcX);

Serial.println(AcY);

Serial.println(AcZ);
delay(200);





/*
Serial.print(AcX);
Serial.print(" ");
Serial.print(AcY);
Serial.print(" ");
Serial.println(AcZ);*/


  

}
