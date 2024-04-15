#include <Conceptinetics.h>

#define MAXCHNS (3);
#define SWITCHPIN (2);

DMX_Master dmx(MAXCHNS, SWITCHPIN);

void setup() 
{
  dmx.enable();

}


void loop()
{

  dmx.setChannelValue(ch, value); // ch = canale, value = valore 0 0 - 255

}

