#include "GPIO.h"

void init_GPIO(void)
{
	setRegBits(GPIO_A_PUR,    0x0000);	//Input Pull-Up is enable
	setRegBits(GPIO_A_DDR,    0x0FFF);	//Seteo como Salidas
	clrRegBits(GPIO_A_PER,    0x0FFF);	//Asigno pines a GPIO
	clrRegBits(GPIO_A_IENR,   0xFFFF);	//Asigno pines a GPIO



	setRegBits(GPIO_B_PUR,    0x0000);	//Input Pull-Up is enable
	setRegBits(GPIO_B_DDR,    0x00F0);	//Seteo como Output
	clrRegBits(GPIO_B_PER,    0x00F0);	//Asigno pines a GPIO


	setRegBits(GPIO_C_PUR,    0x0000);	//Input Pull-Up is enable
	setRegBits(GPIO_C_DDR,    0x001C);	//Seteo como Output
	clrRegBits(GPIO_C_PER,    0x001C);	//Asigno pines a GPIO


}
