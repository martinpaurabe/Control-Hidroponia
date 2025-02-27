#include <stdio.h>
#include <stdlib.h> 


//#include "MC56F8323.h"

// CPU C
#include "PE_Types.h"
#include "IO_Map.h"
#include <string.h>
//#include "PE_Error.h"
//#include "PE_Const.h"
//#include "Cpu.h"

#include "main.h"
#include "ISR.h"
#include "TMR.h"
#include "GPIO.h"
#include "SPI.h"
#include "Unit_Sci.h"
#include "PWM.h"
#include "Unit_Disp.h"
#include "AD.h"


// prototype (Ejemplo funcion asembler)
int asmadd(int, int);
//--------------------------------------------------------------------------------------------

//Variables globales
bool TimerCumplido=FALSE;
int NumPulsesFracFin=0, NumPulseTurn=0;
//--------------------------------------------------------------------------------------------

int main(void)
{
    int AcumTimer=0, AcumTimer2=0;
    int flag=29;
	byte ShowHora=0, ShowDecMin=0;

	init_GPIO();
	Init_Disp();
	init_Timer();
//	init_SPI();
	Init_SCI();
//	init_PWM();
	init_AD();
	Init_ISR();
	
	
	while(1)
	{
 		if(sciRxBuf)	
        {
           sciDataReceived((byte *)sciRxBuf);
           sciRxBuf = NULL;
	    }
	    if(TimerCumplido)
	    {
		  TimerCumplido=FALSE;
          
          if(getRegBit( ADCA_ADSTAT, EOSI ))
  	      	isrADCAConvCompl();
		  
		  AcumTimer++;
		  
		  if(AcumTimer>=32)
		  {
    	  	AcumTimer=0;
    	  	
 			ModHidro.GrpSens.TkLSL.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT4>>5);
		    ModHidro.GrpSens.TkLSH.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT5>>5);
			ModHidro.GrpSens.DrenLSH.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT6>>5);
			ModHidro.GrpSens.DrenLT.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT7>>5);

			ModHidro.GrpSens.TkLSL.val = (ModHidro.GrpSens.TkLSL.ADval.dwrd-ModHidro.GrpSens.TkLSL.min.dwrd)*ModHidro.GrpSens.TkLSL.lng/(ModHidro.GrpSens.TkLSL.max.dwrd-ModHidro.GrpSens.TkLSL.min.dwrd);
		    ModHidro.GrpSens.DrenLSH.val = (ModHidro.GrpSens.DrenLSH.ADval.dwrd-ModHidro.GrpSens.DrenLSH.min.dwrd)*ModHidro.GrpSens.DrenLSH.lng/(ModHidro.GrpSens.DrenLSH.max.dwrd-ModHidro.GrpSens.DrenLSH.min.dwrd);
			ModHidro.GrpSens.DrenLT.val = (ModHidro.GrpSens.DrenLT.ADval.dwrd-ModHidro.GrpSens.DrenLT.min.dwrd)*ModHidro.GrpSens.DrenLT.lng/(ModHidro.GrpSens.DrenLT.max.dwrd-ModHidro.GrpSens.DrenLT.min.dwrd);
			ModHidro.GrpSens.TkLSH.val = (ModHidro.GrpSens.TkLSH.ADval.dwrd-ModHidro.GrpSens.TkLSH.min.dwrd)*ModHidro.GrpSens.TkLSH.lng/(ModHidro.GrpSens.TkLSH.max.dwrd-ModHidro.GrpSens.TkLSH.min.dwrd);
			
			ModHidro.GrpSens.TkLSL.val += ModHidro.GrpSens.TkLSL.Offset;
		    ModHidro.GrpSens.DrenLSH.val += ModHidro.GrpSens.DrenLSH.Offset;
			ModHidro.GrpSens.DrenLT.val += ModHidro.GrpSens.DrenLT.Offset;
			ModHidro.GrpSens.TkLSH.val += ModHidro.GrpSens.TkLSH.Offset;
			
			
			
			
			
			ACUM_ADCA_ADRSLT0=0;
			ACUM_ADCA_ADRSLT1=0;
			ACUM_ADCA_ADRSLT2=0;
			ACUM_ADCA_ADRSLT3=0;
			ACUM_ADCA_ADRSLT4=0;
			ACUM_ADCA_ADRSLT5=0;
			ACUM_ADCA_ADRSLT6=0;
			ACUM_ADCA_ADRSLT7=0;
		  
	  
		    	
		   // if(ModHidro.Status.Stt1.dwrd & STAT_MHI_WRK_ON)
		    if(flag)
		    {
		    	flag=0;
		    	OutLedMinutOff;
		    	OutLedHoraOff;
	    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_WRK_ON;	
				Inc_Timer();
				if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MAN_AUT)
					Ctrl_Auto();
    	    }
		   	else
		    {
		    	flag=1;
		    	ShowHora++;
		    	ShowHora%=24;
		    	ShowDecMin=(ShowHora+1)*10;
		    	if(ShowHora<ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor)
		    	{
		    		OutLedHoraOn;
		    	}
		    	if(ShowDecMin<ModHidro.Grp1Tmrs.TimerGral.Time.hms.min)
		    	{
		    		OutLedMinutOn;
		    	}

	    		ModHidro.Status.Stt1.dwrd |= STAT_MHI_WRK_ON;	

		    }	
		  }
	    }

		asm
		{
			nop  //Por si se quiere agragar algo en assembler
			nop
			nop
			nop
			nop
			nop
		}
	}
	
	return(0);
}




