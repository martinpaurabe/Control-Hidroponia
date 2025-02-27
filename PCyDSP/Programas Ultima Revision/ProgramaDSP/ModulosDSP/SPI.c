#include "IO_Map.h"
#include "PE_Types.h"
//#include "MC56F8323.h"

#include "SPI.h"
#include "GPIO.h"


void init_SPI(void)
{
	setRegBitGroup(SPI0_SCR,SPR,0x1);
	clrRegBit(SPI0_SCR,CPHA);
	setRegBit(SPI0_SCR,ERRIE);

	setRegBitGroup(SPI0_DSR,DS,0x8);

	setRegBit(SPI0_SCR,SPE);
}
//--------------------------------------------------------------------------------------------


void isrSPI0_Transmiter(void)
{
#pragma interrupt

}
//--------------------------------------------------------------------------------------------


void isrSPI0_Receiver(void)
{
#pragma interrupt

	setRegBit(GPIO_C_DR, D3);	//Debug

	SPI0_SCR;	//Borro el Flag de
	SPI0_DRR;	//Receiver Overflow


	clrRegBit(GPIO_C_DR, D3);	//Debug
}
//--------------------------------------------------------------------------------------------
