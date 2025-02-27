//#include "MC56F8323.h"
#include <stdio.h>
#include <stdlib.h> 
#include <math.h> 
#include "IO_Map.h"
//#include "PE_Types.h"

#include "main.h"

#include "TMR.h"
#include "Unit_Disp.h"
#include "GPIO.h"
#include "tablaSen.h"
//--------------------------------------------------------------------------------------------
enum {FASE_1, FASE_2, FASE_3, FASE_4, FASE_5, FASE_6};
static int FASE=0;
//--------------------------------------------------------------------------------------------

// Chip is operating at 60 MHz
void init_Timer(void)
{
/*    //Seteo el Timer generacio de interrupcion
	setRegBitGroup(TMRA0_CTRL,PCS,0xF);
	setRegBit(TMRA0_CTRL,LENGTH);
	setRegBit(TMRA0_SCR,OPS);
   	setRegBit(TMRA0_COMSCR,TCF1EN);
	TMRA0_CMP1 = 166720.0/(AeroGene.Exita.Out.Freq * AeroGene.Exita.PPT.dwrd);	//Frecuencia timer = 300Hz
	TMRA0_CMP2 = 166720.0/(AeroGene.Exita.Out.Freq * AeroGene.Exita.PPT.dwrd);	//Frecuencia timer = 300Hz
	TMRA0_CNTR = 0;     // Reset counter register
	setRegBitGroup(TMRA0_CTRL,CM,0x02); // Run counter


    //Seteo el Timer para el Inyector 2 y 4
	setRegBitGroup(TMRA1_CTRL,PCS,0xF);
	setRegBit(TMRA1_CTRL,LENGTH);
	setRegBitGroup(TMRA1_CTRL,OM,0x4);
	setRegBit(TMRA1_SCR,OPS);


	//Seteo el Timer para que me guarde la posicion Angular Del Generador  
	setReg(TMRC0_CTRL,0x07A3);
	setReg(TMRC0_SCR,0x0000);
	setRegBit(TMRC0_SCR,IEFIE);
    setRegBit(TMRC0_COMSCR,TCF1);
 	setRegBit(TMRC0_COMSCR,TCF1EN);
	setRegBitGroup(TMRC0_COMSCR,CL_10,0x01); // Run counter 
	TMRC0_CMPLD1 = 1;
	TMRC0_CMP1 = 1;
	TMRC0_CMP2 = 0;
	TMRC0_CNTR = 0;
	setRegBitGroup(TMRC0_CTRL,CM,0x02); // Run counter 

	//Seteo el Timer para que me guarde los pulsos del anemometro
	setReg(TMRC1_CTRL,0x09A0);
	setReg(TMRC1_SCR,0x0000);
	setRegBit(TMRC1_SCR,IEFIE);
    setRegBit(TMRC1_COMSCR,TCF1);
 	setRegBit(TMRC1_COMSCR,TCF1EN);
	TMRC1_CMP1 = 2*AeroGene.Gen.PPT.dwrd;
	TMRC1_CNTR = 0;
	setRegBitGroup(TMRC1_CTRL,CM,0x02); // Run counter 

    //Seteo el Timer para que me Interrumpa cuando venga un pulso 
	setReg(TMRC2_CTRL,0x09A0);
	setReg(TMRC2_SCR,0x0000);
	setRegBit(TMRC2_SCR,IEFIE);
    setRegBit(TMRC2_COMSCR,TCF1);
 	setRegBit(TMRC2_COMSCR,TCF1EN);
	TMRC2_CMP1 = 1;
	TMRC2_CNTR = 0;
	setRegBitGroup(TMRC2_CTRL,CM,0x02); // Run counter 
*/
	//Seteo el Timer de Control
	setRegBitGroup(TMRC3_CTRL,PCS,0xF);
	setRegBit(TMRC3_CTRL,LENGTH);
	setRegBitGroup(TMRC3_CTRL,OM,0x4);
	setRegBit(TMRC3_SCR,OPS);
	setRegBit(TMRC3_COMSCR,TCF1EN);
	TMRC3_CMP1 = 3677;	//Frecuencia timer = 1Hz
	TMRC3_CMP2 = 3677;	//
	TMRC3_CNTR = 0; /* Reset counter register */
	setRegBitGroup(TMRC3_CTRL,CM,0x01); /* Run counter */

}
//--------------------------------------------------------------------------------------------
// Change State (Simulation Mode, Real Mode)
/*void Set_Stt_Timer(void)
{

    if(AeroGene.Status.dwrd & STAT_AEG_SIM_RPM)
    {
		//Seteo el Timer de Control
		setRegBitGroup(TMRC2_CTRL,PCS,0xF);
		setRegBit(TMRC2_CTRL,LENGTH);
		setRegBitGroup(TMRC2_CTRL,OM,0x4);
	
		setRegBit(TMRC2_SCR,OPS);

		setRegBit(TMRC2_COMSCR,TCF1EN);

		TMRC2_CMP1 = 46874;	//Frecuencia timer = 5Hz
		TMRC2_CMP2 = 46874;	//

		TMRC2_CNTR = 0; // Reset counter register 

		setRegBitGroup(TMRC2_CTRL,CM,0x01); // Run counter
    }
    else
    {
	    //Seteo el Timer para que me Interrumpa cuando venga un pulso 
		setReg(TMRC2_CTRL,0x07A0);
		setReg(TMRC2_SCR,0x0000);
		setRegBit(TMRC2_SCR,IEFIE);
    	setRegBit(TMRC2_COMSCR,TCF1);
 		setRegBit(TMRC2_COMSCR,TCF1EN);
		TMRC2_CMP1 = 1;
		TMRC2_CNTR = 0;
		setRegBitGroup(TMRC2_CTRL,CM,0x02); // Run counter
    }


}
*/
//--------------------------------------------------------------------------------------------

void isrTimerA0(void)
{
#pragma interrupt

float Factor=0;
	clrRegBit(TMRA0_COMSCR,TCF1);	//Borro flag de interrupcion
/*
    AeroGene.Exita.Pos.dwrd+=360/AeroGene.Exita.PPT.dwrd;
    AeroGene.Exita.Turn.dwrd+=AeroGene.Exita.Pos.dwrd/360;
    AeroGene.Exita.Pos.dwrd%=360;
    PWMA_PWMVAL0 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase1.dwrd)%360])+PWM_MED;
   	PWMA_PWMVAL2 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase2.dwrd)%360])+PWM_MED;
   	PWMA_PWMVAL4 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase3.dwrd)%360])+PWM_MED;
   	setRegBit(PWMA_PMCTL, LDOK);
*/
    
}
//--------------------------------------------------------------------------------------------
void isrTimerA1()
{
#pragma interrupt
	clrRegBit(TMRA1_COMSCR,TCF1);	//Borro flag de interrupcion
}
//--------------------------------------------------------------------------------------------
void isrTimerA2()
{
#pragma interrupt

	clrRegBit(TMRA2_COMSCR,TCF1);	//Borro flag de interrupcion
    
}
//--------------------------------------------------------------------------------------------
void isrTimerA3()
{
#pragma interrupt

	clrRegBit(TMRA3_COMSCR,TCF1);	//Borro flag de interrupcion
    
}
//--------------------------------------------------------------------------------------------
void isrTimerC0()
{
#pragma interrupt


	clrRegBit(TMRC0_COMSCR,TCF1);	//Borro flag de interrupcion
        
}
//--------------------------------------------------------------------------------------------

void isrTimerC1()
{
#pragma interrupt


	clrRegBit(TMRC1_COMSCR,TCF1);
//    NumPulseTurn+=(2*AeroGene.Gen.PPT.dwrd);
    
}
//--------------------------------------------------------------------------------------------

void isrTimerC2()
{
#pragma interrupt

	clrRegBit(TMRC2_COMSCR,TCF1);
	

}
//--------------------------------------------------------------------------------------------

void isrTimerC3()
{
#pragma interrupt

	clrRegBit(TMRC3_COMSCR,TCF1);
    TimerCumplido=TRUE; //Le informo que puede correr la logica de control     
     
}
//--------------------------------------------------------------------------------------------
