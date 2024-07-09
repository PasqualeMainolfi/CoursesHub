#include <Conceptinetics.h>

#define MAXCHNS (512)
#define DEPIN (2)

DMX_Master master(MAXCHNS, DEPIN);

void setup() 
{
  master.enable();
  master.setChannelRange(1, 8, 10);
  master.setChannelRange(9, 16, 10);
}


void loop()
{

  // for (int j = 1; j <= 5; ++j) {
  //   for (int i = 0; i <= 255; ++i) {
  //     master.setChannelValue(j, i);
  //     delay(5);
  //   }
  // }
  // master.setChannelRange(2, 6, 255);
  // delay(100);
  // delay(100);
  // master.setChannelValue(3, 255);
  // delay(1000);
  // master.setChannelValue(3, 10);
  // delay(1000);
  // master.setChannelValue(2, 255);
  // delay(1000);
  // master.setChannelValue(2, 10);
  // delay(1000);

  master.setChannelValue(10, 255);
  delay(1000);
  master.setChannelValue(10, 10);
  delay(1000);
  master.setChannelValue(11, 255);
  delay(1000);
  master.setChannelValue(11, 10);
  delay(1000);

  // master.setChannelValue(11, 255);
  // delay(100);
  // master.setChannelValue(11, 10);
  // delay(100);

  // master.setChannelValue(10, 255);
  // delay(100);
  // master.setChannelValue(10, 1);
  // delay(100);

  // for (int i = 0; i <= 255; ++i) {
  //   master.setChannelValue(9, i);
  //   delay(25);
  // }


}


