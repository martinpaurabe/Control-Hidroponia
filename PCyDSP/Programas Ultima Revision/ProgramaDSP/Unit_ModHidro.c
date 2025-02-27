#include "IO_Map.h"
#include "main.h"

#include <stdio.h>
#include <string.h>

#include "Unit_Disp.h"
#include "Unit_Sci.h"
#include "DataFlash.h"

//--------------------------------------------------------------------------------------------------------------


TModHidro ModHidro;


const TModHidro ModHidroFlash = 
{
  {//Nombre
    'M', 'o', 'd', 'u', 'l', 'o',' ', 'H', 'P', '1', 0, 0,
  }, //TConstModHidro Const
  {
  	{
      {
  	  	22000,
  	  },//TDato32 max;
  	  {
  		0,	
  	  },//TDato32 min;
  	  {
  		0,	
  	  },//TDato32 ADval;
  	  15.0,
  	  //float swtch;
  	  6.0,
  	  //float long;
  	  14.0,
  	  //float Offset;
  	  0.0,
  	  //float val;
    },//TSenNivel    DrenLSH;
    {
  	  {
  		26000,
  	  },//TDato32 max;
  	  {
  		0,	
  	  },//TDato32 min;
  	  {
  		0,	
  	  },//TDato32 ADval;
  	  8.0,
  	  //float swtch;
  	  10.0,
  	  //float long;
  	  0.0,
  	  //float Offset;
  	  0.0,
  	  //float val;
    },//TSenNivel    DrenLT;
    {
      {
  		26000,
      },//TDato32 max;
  	  0.1,
  	  //float swtch;
  	  0.0,
  	  //float long;
    },//TSenConduct TkCond;
    {
  	  {
  		22000,
  	  },//TDato32 max;
  	  {
  		0,	
  	  },//TDato32 min;
  	  {
  		0,	
  	  },//TDato32 ADval;
  	  25.0,
  	  //float swtch;
  	  6.0,
  	  //float long;
  	  15.0,
  	  //float Offset;
  	  0.0,
  	  //float val;
    },//TSenNivel    TkLSH;
    {
  	  {
  		26000,
  	  },//TDato32 max;
  	  {
  		0,	
  	  },//TDato32 min;
  	  {
  		0,	
  	  },//TDato32 ADval;
  	  18.0,
  	  //float swtch;
  	  10.0,
  	  //float long;
  	  10.0,
  	  //float Offset;
  	  0.0,
  	  //float val;
    },//TSenNivel    TkLSL;
    {
      {
  		26000,
      },//TDato32 max;
  	  0.1,
  	  //float swtch;
  	  0.0,
  	  //float long;
    },//TSenConduct TkCond;
  },//TGrupoSens GrpSens
  {
  	{
      {
  	    0,
  	    0,
  	    12,
 	    0,
      },// TTime TIME;
      {
  	    0,
  	    0,
  	    7,
 	    0,
      },// TTime IniDia;
      {
  	    0,
  	    0,
  	    20,
 	    0,
      },// TTime FinDia;
      {
  	    0,
  	    0,
  	    12,
 	    0,
      },// TTime IniMed;
      {
  	    0,
  	    0,
  	    14,
 	    0,
      },// TTime FinMed;
    },//TTimerGral	 TimerGral;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    0,
        10,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        0,
  	    0,
 	    0,
      },//TTime Val;
    },//TTimerOut TimerMod1;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    8,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    4,
 	    0,
      },//TTime Frec;
      {
  	    0,
        2,
  	    0,
 	    0,
      },//TTime Val;
    },//TTimerOut TimerMod2;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod3;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod4;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod5;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod6;
  },//TGrupoTimers Grp1Tmrs
  {
  	{
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    0,
        10,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        0,
  	    0,
 	    0,
      },//TTime Val;
    },//TTimerOut TimerMod7;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    8,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    4,
 	    0,
      },//TTime Frec;
      {
  	    0,
        2,
  	    0,
 	    0,
      },//TTime Val;
    },//TTimerOut TimerMod8;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod9;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod10;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod11;
    {
      {
  	    5,
        0,
  	    0,
 	    0,
      },//TTime TOn;
      {
  	    10,
        0,
  	    0,
 	    0,
      },//TTime TOff;
      {
  	    30,
        0,
  	    0,
 	    0,
      },//TTime TimeOn;
      {
  	    0,
        0,
  	    1,
 	    0,
      },//TTime Frec;
      {
  	    0,
        20,
  	    0,
 	    0,
      },//TTime Frec;
    },//TTimerOut TimerMod12;
  },//TGrupoTimers Grp2Tmrs
  {
   {
  	 0,
   }, //TDato32 Stt1
   {
     0,	
   }, //TDato32 Stt2
  }//TStatus Status
};//TModHidro;

//--------------------------------------------------------------------------------------------------------------

void Init_Disp(void)
{
  ModHidro=ModHidroFlash;

//Salidas que inician apagadas
  OutBbaMod1Off;
  OutBbaMod2Off;
  OutBbaMod3Off;
  OutBbaMod4Off;
  OutBbaMod5Off;
  OutBbaMod6Off;
  OutBbaMod7Off;
  OutBbaMod8Off;
  OutBbaMod9Off;
  OutBbaMod10Off;
  OutBbaMod11Off;
  OutBbaMod12Off;
  OutLedWorkOff;
  OutLedErrorOff;
  OutLedHoraOff;
  OutLedMinutOff;

//Salidas que inician encendidas
  OutLedAutoOn;
  ModHidro.Status.Stt1.dwrd |= STAT_MHI_MAN_AUT;
  OutLedWorkOn;
  ModHidro.Status.Stt1.dwrd |= STAT_MHI_WRK_ON;
   
   
}
//--------------------------------------------------------------------------------------------------------------
void Inc_Timer(void)
{
  
  //Actualizo el temporizador General
  if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerGral.Time.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerGral.Time.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor=0;
  		}
  		
  	}

  }
  
  //Acualizo el temporizador del Modulo 1
  if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod1.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd=0;
  
  
  //Acualizo el temporizador del Modulo 2
  if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod2.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd=0;


  //Acualizo el temporizador del Modulo 3
  if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod3.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd=0;

 
 
  //Acualizo el temporizador del Modulo 4
  if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod4.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd=0;


  //Acualizo el temporizador del Modulo 5
  if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod5.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd=0;


  //Acualizo el temporizador del Modulo 6
  if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.seg>=60)
  {
  	ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.seg=0;
  	if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.min>=60)
  	{
  		ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.min=0;
  		if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp1Tmrs.TimerMod6.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd)
  	ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 7
  if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod7.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 8
  if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod8.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 9
  if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod9.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 10
  if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod10.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 11
  if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod11.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd=0;

 
  //Acualizo el temporizador del Modulo 12
  if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.seg>=60)
  {
  	ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.seg=0;
  	if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.min>=60)
  	{
  		ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.min=0;
  		if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.hor>=24)
  		{
  			ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.hor=0;
  		}
  		
  	}
  }
  if(ModHidro.Grp2Tmrs.TimerMod12.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd)
  	ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd=0;


}  
  
//--------------------------------------------------------------------------------------------------------------
void Ctrl_Auto(void)
{

  //Me fijo si esta en horario de operacion del control
  if((ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.IniDia.ttl.dwrd)&&(ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.FinDia.ttl.dwrd) && !((ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.IniMed.ttl.dwrd)&&(ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.FinMed.ttl.dwrd)))
  {
    //Si esta en horario de operacion actualizo las salidas de acuerdo al control
    //Actualizo control de Modulo 1
	if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD1_INTER)
  	{
  	  if(ModHidro.Grp1Tmrs.TimerMod1.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd)
  	  {
    	OutBbaMod1On;
  		ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1;
  	  }
  	  else
  	  {
   		OutBbaMod1Off;
  		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod1.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod1.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
    	OutBbaMod1On;
  		ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1;
  	
  	  }
  	  else
  	  {
    	OutBbaMod1Off;
  		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1;
  	  }	
 	
    }
  	
    //Actualizo control de Modulo 2
  
    if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD2_INTER)
    {
  	  if(ModHidro.Grp1Tmrs.TimerMod2.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd)
  	  {
   		OutBbaMod2On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2;
  	  }
  	  else
  	  {
   		OutBbaMod2Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod2.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod2.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod2On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2;
  	
  	  }
   	  else
  	  {
   		OutBbaMod2Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2;
  	  }	
 	
    }
  
    //Actualizo control de Modulo 3
  
    if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD3_INTER)
    {
  	  if(ModHidro.Grp1Tmrs.TimerMod3.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd)
  	  {
   		OutBbaMod3On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3;
  	  }
  	  else
  	  {
   		OutBbaMod3Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod3.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod3.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod3On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3;
  	
  	  }
   	  else
  	  {
   		OutBbaMod3Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3;
  	  }	
 	
    }
    

    //Actualizo control de Modulo 4
  
    if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD4_INTER)
    {
  	  if(ModHidro.Grp1Tmrs.TimerMod4.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd)
  	  {
   		OutBbaMod4On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4;
  	  }
  	  else
  	  {
   		OutBbaMod4Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod4.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod4.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod4On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4;
  	
  	  }
   	  else
  	  {
   		OutBbaMod4Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4;
  	  }	
 	
    }



    //Actualizo control de Modulo 5
  
    if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD5_INTER)
    {
  	  if(ModHidro.Grp1Tmrs.TimerMod5.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd)
  	  {
   		OutBbaMod5On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5;
  	  }
  	  else
  	  {
   		OutBbaMod5Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod5.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod5.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod5On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5;
  	
  	  }
   	  else
  	  {
   		OutBbaMod5Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5;
  	  }	
 	
    }



    //Actualizo control de Modulo 6
  
    if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD6_INTER)
    {
  	  if(ModHidro.Grp1Tmrs.TimerMod6.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd)
  	  {
   		OutBbaMod6On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6;
  	  }
  	  else
  	  {
   		OutBbaMod6Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp1Tmrs.TimerMod6.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod6.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod6On;
   		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6;
  	
  	  }
   	  else
  	  {
   		OutBbaMod6Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6;
  	  }	
 	
    }



    //Actualizo control de Modulo 7
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD7_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod7.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd)
  	  {
   		OutBbaMod7On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD7;
  	  }
  	  else
  	  {
   		OutBbaMod7Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod7.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod7.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod7On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD7;
  	
  	  }
   	  else
  	  {
   		OutBbaMod7Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7;
  	  }	
 	
    }



    //Actualizo control de Modulo 8
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD8_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod8.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd)
  	  {
   		OutBbaMod8On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD8;
  	  }
  	  else
  	  {
   		OutBbaMod8Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod8.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod8.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod8On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD8;
  	
  	  }
   	  else
  	  {
   		OutBbaMod8Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8;
  	  }	
 	
    }



    //Actualizo control de Modulo 9
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD9_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod9.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd)
  	  {
   		OutBbaMod9On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD9;
  	  }
  	  else
  	  {
   		OutBbaMod9Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod9.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod9.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod9On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD9;
  	
  	  }
   	  else
  	  {
   		OutBbaMod9Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9;
  	  }	
 	
    }



    //Actualizo control de Modulo 10
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD10_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod10.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd)
  	  {
   		OutBbaMod10On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD10;
  	  }
  	  else
  	  {
   		OutBbaMod10Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod10.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod10.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod10On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD10;
  	
  	  }
   	  else
  	  {
   		OutBbaMod10Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10;
  	  }	
 	
    }



    //Actualizo control de Modulo 11
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD11_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod11.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd)
  	  {
   		OutBbaMod11On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD11;
  	  }
  	  else
  	  {
   		OutBbaMod11Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod11.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod11.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod11On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD11;
  	
  	  }
   	  else
  	  {
   		OutBbaMod11Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11;
  	  }	
 	
    }



    //Actualizo control de Modulo 12
  
    if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD12_INTER)
    {
  	  if(ModHidro.Grp2Tmrs.TimerMod12.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd)
  	  {
   		OutBbaMod12On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD12;
  	  }
  	  else
  	  {
   		OutBbaMod12Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12;
  	  }
    }
    else
    {
  	  if((ModHidro.Grp2Tmrs.TimerMod12.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod12.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd))
  	  {
   		OutBbaMod12On;
   		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD12;
  	
  	  }
   	  else
  	  {
   		OutBbaMod12Off;
   		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12;
  	  }	
 	
    }



/*
    //Actualizo control de ingreso de agua
    if(ModHidro.GrpSens.TkLSL.val<ModHidro.GrpSens.TkLSL.swtch && ModHidro.GrpSens.DrenLT.val<ModHidro.GrpSens.DrenLT.swtch)
    {
      OutBbaMod4On;
	  ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4;
    }
    else if(ModHidro.GrpSens.DrenLSH.val>ModHidro.GrpSens.DrenLSH.swtch || ModHidro.GrpSens.TkLSH.val>ModHidro.GrpSens.TkLSH.swtch)
    {
  	  OutBbaMod4Off;
	  ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4;
    }
*/

  }
  //Si no esta en horario de operacion apago las salidas hasta el inicio.
  else
  {
    	OutBbaMod1Off;
  		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1;
   		OutBbaMod2Off;
   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2;
    	OutBbaMod3Off;
		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3;
  		OutBbaMod4Off;
		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4;
  		OutBbaMod5Off;
		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5;
  		OutBbaMod6Off;
		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6;
  		OutBbaMod7Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7;
  		OutBbaMod8Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8;
  		OutBbaMod9Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9;
  		OutBbaMod10Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10;
  		OutBbaMod11Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11;
  		OutBbaMod12Off;
		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12;

  }

/*
  if(ModHidro.GrpSens.TkLSH.val>ModHidro.GrpSens.TkLSH.swtch)
  {
	ModHidro.GrpSens.TkCond.max.dwrd=ModHidro.GrpSens.TkLSL.ADval.dwrd;
	ModHidro.GrpSens.TkCond.val=ModHidro.GrpSens.TkCond.max.dwrd*ModHidro.GrpSens.TkCond.FEsc;
	//ModHidro.TkLSL.max=ModHidro.TkLSL.ADval;
  }
  
  //Actualizo control de Bomba de Trasvase
  //Esto lo tengo prendido siempre para evitar derrames
  if(ModHidro.GrpSens.DrenLSH.val>ModHidro.GrpSens.DrenLSH.swtch)
  {
  	OutBbaMod5On;
  	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5;
	ModHidro.GrpSens.DrenCond.max.dwrd=ModHidro.GrpSens.DrenLT.ADval.dwrd;
	ModHidro.GrpSens.DrenCond.val=ModHidro.GrpSens.DrenCond.max.dwrd*ModHidro.GrpSens.DrenCond.FEsc;
	//ModHidro.DrenLT.max=ModHidro.DrenLT.ADval;
  }
  else if(ModHidro.GrpSens.DrenLT.val<ModHidro.GrpSens.DrenLT.swtch)
  {
  	OutBbaMod5Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5;
  }
 
*/
  

}
//--------------------------------------------------------------------------------------------------------------

void sciDataReceived(byte *buf)
{
  TDato32 *dato;
  byte dataLen32=0;
  int i;


  switch(buf[0])
  {
  //Caso en los que se recive un comando
  case CMD_MHI_SAVE:
    dataLen32=DataFlash_SetGlobalProtection(0);
    DataFlash_EraseFlash(0);
    dataLen32=DataFlash_SetBlockFlash(2*(DataFlash_TAddress)&ModHidro, 2*(DataFlash_TAddress)&ModHidroFlash, sizeof(ModHidro));
    dataLen32=DataFlash_SetGlobalProtection(1);
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD1_ON:
    OutBbaMod1On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD1_OFF:
    OutBbaMod1Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD2_ON:
    OutBbaMod2On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD2;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD2_OFF:
    OutBbaMod2Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD3_ON:
    OutBbaMod3On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD3;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD3_OFF:
    OutBbaMod3Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD4_ON:
    OutBbaMod4On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD4;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD4_OFF:
    OutBbaMod4Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD5_ON:
    OutBbaMod5On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD5;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD5_OFF:
    OutBbaMod5Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD6_ON:
    OutBbaMod6On;
  	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD6;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD6_OFF:
    OutBbaMod6Off;
  	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_AUTO_ON:
  	OutLedAutoOn;
	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MAN_AUT;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_AUTO_OFF:
  	OutLedAutoOff;
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MAN_AUT;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD1_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD1_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD1_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD2_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD2_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD3_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD3_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD4_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD4_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD5_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD5_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD6_INTON:
	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD6_INTOFF:
	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD7_ON:
    OutBbaMod7On;
  	ModHidro.Status.Stt2.dwrd|= STAT2_MHI_MOD7;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD7_OFF:
    OutBbaMod7Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD8_ON:
    OutBbaMod8On;
  	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD8;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD8_OFF:
    OutBbaMod8Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD9_ON:
    OutBbaMod9On;
  	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD9;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD9_OFF:
    OutBbaMod9Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD10_ON:
    OutBbaMod10On;
  	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD10;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD10_OFF:
    OutBbaMod10Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD11_ON:
    OutBbaMod11On;
  	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD11;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD11_OFF:
    OutBbaMod11Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD12_ON:
    OutBbaMod12On;
  	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD12;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD12_OFF:
    OutBbaMod12Off;
  	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
case CMD_MHI_STT_MOD7_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD7_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD7_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD8_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD8_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD8_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD9_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD9_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD9_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD10_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD10_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD10_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD11_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD11_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD11_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD12_INTON:
	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD12_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case CMD_MHI_STT_MOD12_INTOFF:
	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12_INTER;
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  

  //Caso en los que se recive un pedido de Datos
  case DRQ_MHI:
    sendSciMsg(DATA_MHI, &ModHidro, sizeof(ModHidro));
  break;
  case DRQ_MHI_STATUS:
    sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status));
  break;
  case DRQ_MHI_CONST:
    sendSciMsg(DATA_MHI_SET_CONST, &ModHidro.Const, sizeof(ModHidro.Const));
  break;
  case DRQ_MHI_TMRS1:
    sendSciMsg(DATA_MHI_SET_TMRS1, &ModHidro.Grp1Tmrs, sizeof(ModHidro.Grp1Tmrs));
  break;
  case DRQ_MHI_TMRS2:
    sendSciMsg(DATA_MHI_SET_TMRS2, &ModHidro.Grp2Tmrs, sizeof(ModHidro.Grp2Tmrs));
  break;
  case DRQ_MHI_SENS:
    sendSciMsg(DATA_MHI_SET_SENS, &ModHidro.GrpSens, sizeof(ModHidro.GrpSens));
  break;
  
 
  //Caso en los que se reciven Datos
  case DATA_MHI:
    dato = (TDato32 *)&ModHidro;
    dataLen32 = sizeof(ModHidro)/4;
  break;
  case DATA_MHI_SET_STATUS:
    dato = (TDato32 *)&ModHidro.Status;
    dataLen32 = sizeof(ModHidro.Status)/4;
  break;
  case DATA_MHI_SET_CONST:
    dato = (TDato32 *)&ModHidro.Const;
    dataLen32 = sizeof(ModHidro.Const)/4;
  break;
  case DATA_MHI_SET_TMRS1:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs)/4;
  break;
  case DATA_MHI_SET_TMRS2:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs)/4;
  break;
  case DATA_MHI_SET_SENS:
    dato = (TDato32 *)&ModHidro.GrpSens;
    dataLen32 = sizeof(ModHidro.GrpSens)/4;
  break;
  case DATA_MHI_SET_TIMEGRAL:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerGral;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerGral)/4;
  break;
  case DATA_MHI_SET_TIMER_M1:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod1;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod1)/4;
  break;
  case DATA_MHI_SET_TIMER_M2:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod2;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod2)/4;
  break;
  case DATA_MHI_SET_TIMER_M3:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod3;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod3)/4;
  break;
  case DATA_MHI_SET_TIMER_M4:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod4;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod4)/4;
  break;
  case DATA_MHI_SET_TIMER_M5:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod5;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod5)/4;
  break;
  case DATA_MHI_SET_TIMER_M6:
    dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod6;
    dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod6)/4;
  break;
  case DATA_MHI_SET_TIMER_M7:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod7;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod7)/4;
  break;
  case DATA_MHI_SET_TIMER_M8:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod8;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod8)/4;
  break;
  case DATA_MHI_SET_TIMER_M9:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod9;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod9)/4;
  break;
  case DATA_MHI_SET_TIMER_M10:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod10;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod10)/4;
  break;
  case DATA_MHI_SET_TIMER_M11:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod11;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod11)/4;
  break;
  case DATA_MHI_SET_TIMER_M12:
    dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod12;
    dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod12)/4;
  break;
  
  
  default:
  return;
  }

  for(i = 0; i < dataLen32; i++)
  {
    dato[i].byt[0] = buf[4*i+1];
    dato[i].byt[1] = buf[4*i+2];
    dato[i].byt[2] = buf[4*i+3];
    dato[i].byt[3] = buf[4*i+4];
  }

}
//--------------------------------------------------------------------------------------------------------------

