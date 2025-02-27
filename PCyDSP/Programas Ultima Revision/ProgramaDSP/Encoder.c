#include <stdio.h>
#include <stdlib.h> 
#include "IO_Map.h"
#include "PE_Types.h"

#include "main.h"
#include "Encoder.h"
#include "GPIO.h"


void init_Encoder(void)
{

	setRegBitGroup(DEC0_DECCR,MODE,0x2);
	setRegBit(DEC0_DECCR, XIP); //Habilito la entrada index para resetar la posicion del encoder 
	setRegBit(DEC0_DECCR, XIE);

	//Seteo la entrada Home para 
	setRegBit(DEC0_DECCR, HIE);
    setRegBit(DEC0_DECCR, REV);
    DEC0_UIR=0;   //Aca tengo que poner cual es la posicion de cierre 
    DEC0_LIR=0;   //Positivo a Operacion, Negativo Venteo 
    DEC0_LPOS=0;	
	
}

//--------------------------------------------------------------------------------------------

void Int_Index()
{
#pragma interrupt
	setRegBit(DEC0_DECCR, XIRQ);
}

//--------------------------------------------------------------------------------------------

void Int_Home()
{
#pragma interrupt
	setRegBit(DEC0_DECCR, HIRQ);
}
