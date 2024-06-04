#include <Conceptinetics.h>

#define MAXCHNS (5)
#define SWITCHPIN (2)

DMX_Master master(MAXCHNS, SWITCHPIN);

void setup() 
{
  master.enable();
  master.setChannelRange(1, 5, 10); // init channels state
}


void loop()
{
  
  for (int i = 0; i <= 255; ++i) {
    master.setChannelValue(4, i);
    delay(25);
  }

  // delay(50);

  // for (int i = 0; i <= 255; ++i) {
  //   master.setChannelValue(9, i);
  //   delay(25);
  // }


}


