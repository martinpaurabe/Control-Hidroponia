#ifndef DEF_MODHIDRO_H
#define DEF_MODHIDRO_H
//==============================================================================================================

#include "Def_TipoDatos.h"
#include "GPIO.h"

//--------------------------------------------------------------------------------------------------------------

#define DIM_NOMBRE_AERO  12
#define PWM_MAX          32768
#define PWM_MED          16384


#define OutBbaMod12On    setRegBit(GPIO_A_DR,D0)
#define OutBbaMod12Off   clrRegBit(GPIO_A_DR,D0)
#define OutBbaMod11On    setRegBit(GPIO_A_DR,D1)
#define OutBbaMod11Off   clrRegBit(GPIO_A_DR,D1)
#define OutBbaMod10On    setRegBit(GPIO_A_DR,D2)
#define OutBbaMod10Off   clrRegBit(GPIO_A_DR,D2)
#define OutBbaMod9On     setRegBit(GPIO_A_DR,D3)
#define OutBbaMod9Off    clrRegBit(GPIO_A_DR,D3)
#define OutBbaMod8On  	 setRegBit(GPIO_A_DR,D4)
#define OutBbaMod8Off	 clrRegBit(GPIO_A_DR,D4)
#define OutBbaMod7On     setRegBit(GPIO_A_DR,D5)
#define OutBbaMod7Off    clrRegBit(GPIO_A_DR,D5)
#define OutBbaMod1On     setRegBit(GPIO_A_DR,D6)
#define OutBbaMod1Off    clrRegBit(GPIO_A_DR,D6)
#define OutBbaMod2On     setRegBit(GPIO_A_DR,D7)
#define OutBbaMod2Off    clrRegBit(GPIO_A_DR,D7)
#define OutBbaMod3On     setRegBit(GPIO_A_DR,D8)
#define OutBbaMod3Off    clrRegBit(GPIO_A_DR,D8)
#define OutBbaMod4On     setRegBit(GPIO_A_DR,D9)
#define OutBbaMod4Off    clrRegBit(GPIO_A_DR,D9)
#define OutBbaMod5On  	 setRegBit(GPIO_A_DR,D10)
#define OutBbaMod5Off	 clrRegBit(GPIO_A_DR,D10)
#define OutBbaMod6On     setRegBit(GPIO_A_DR,D11)
#define OutBbaMod6Off    clrRegBit(GPIO_A_DR,D11)
#define OutLedErrorOn    setRegBit(GPIO_C_DR,D4)
#define OutLedErrorOff   clrRegBit(GPIO_C_DR,D4)
#define OutLedWorkOn     setRegBit(GPIO_C_DR,D3)
#define OutLedWorkOff    clrRegBit(GPIO_C_DR,D3)
#define OutLedAutoOn   	 setRegBit(GPIO_C_DR,D2)
#define OutLedAutoOff  	 clrRegBit(GPIO_C_DR,D2)
#define OutLedHoraOn     setRegBit(GPIO_B_DR,D4)
#define OutLedHoraOff    clrRegBit(GPIO_B_DR,D4)
#define OutLedMinutOn    setRegBit(GPIO_B_DR,D5)
#define OutLedMinutOff   clrRegBit(GPIO_B_DR,D5)
#define OutLedAux5On     setRegBit(GPIO_B_DR,D6)
#define OutLedAux5Off    clrRegBit(GPIO_B_DR,D6)
#define OutLedAux4On   	 setRegBit(GPIO_B_DR,D7)
#define OutLedAux4Off  	 clrRegBit(GPIO_B_DR,D7)





//Comandos Sci
//*********************************
//Ordenes
#define CMD_MHI_SAVE             	0x00
#define CMD_MHI_STATUS         		0x01
#define CMD_MHI_STT_MOD1_ON    		0x02
#define CMD_MHI_STT_MOD1_OFF   		0x03
#define CMD_MHI_STT_MOD1_INTON 		0x04
#define CMD_MHI_STT_MOD1_INTOFF 	0x05
#define CMD_MHI_STT_MOD1_RSTTMR 	0x06
#define CMD_MHI_STT_MOD2_ON    		0x07
#define CMD_MHI_STT_MOD2_OFF   		0x08
#define CMD_MHI_STT_MOD2_INTON 		0x09
#define CMD_MHI_STT_MOD2_INTOFF 	0x0A
#define CMD_MHI_STT_MOD2_RSTTMR 	0x0B
#define CMD_MHI_STT_MOD3_ON    		0x0C
#define CMD_MHI_STT_MOD3_OFF   		0x0D
#define CMD_MHI_STT_MOD3_INTON 		0x0E
#define CMD_MHI_STT_MOD3_INTOFF 	0x0F
#define CMD_MHI_STT_MOD3_RSTTMR 	0x10
#define CMD_MHI_STT_MOD4_ON     	0x11
#define CMD_MHI_STT_MOD4_OFF    	0x12
#define CMD_MHI_STT_MOD4_INTON 		0x13
#define CMD_MHI_STT_MOD4_INTOFF 	0x14
#define CMD_MHI_STT_MOD4_RSTTMR 	0x15
#define CMD_MHI_STT_MOD5_ON    		0x16
#define CMD_MHI_STT_MOD5_OFF   		0x17
#define CMD_MHI_STT_MOD5_INTON 		0x18
#define CMD_MHI_STT_MOD5_INTOFF 	0x19
#define CMD_MHI_STT_MOD5_RSTTMR 	0x1A
#define CMD_MHI_STT_MOD6_ON    		0x1B
#define CMD_MHI_STT_MOD6_OFF   		0x1C
#define CMD_MHI_STT_MOD6_INTON 		0x1D
#define CMD_MHI_STT_MOD6_INTOFF 	0x1E
#define CMD_MHI_STT_MOD6_RSTTMR 	0x1F
#define CMD_MHI_STT_MOD7_ON    		0x20
#define CMD_MHI_STT_MOD7_OFF   		0x21
#define CMD_MHI_STT_MOD7_INTON 		0x22
#define CMD_MHI_STT_MOD7_INTOFF 	0x23
#define CMD_MHI_STT_MOD7_RSTTMR 	0x24
#define CMD_MHI_STT_MOD8_ON    		0x25
#define CMD_MHI_STT_MOD8_OFF   		0x26
#define CMD_MHI_STT_MOD8_INTON 		0x27
#define CMD_MHI_STT_MOD8_INTOFF 	0x28
#define CMD_MHI_STT_MOD8_RSTTMR 	0x29
#define CMD_MHI_STT_MOD9_ON     	0x2A
#define CMD_MHI_STT_MOD9_OFF    	0x2B
#define CMD_MHI_STT_MOD9_INTON 		0x2C
#define CMD_MHI_STT_MOD9_INTOFF 	0x2D
#define CMD_MHI_STT_MOD9_RSTTMR 	0x2E
#define CMD_MHI_STT_MOD10_ON    	0x2F
#define CMD_MHI_STT_MOD10_OFF   	0x30
#define CMD_MHI_STT_MOD10_INTON 	0x31
#define CMD_MHI_STT_MOD10_INTOFF 	0x32
#define CMD_MHI_STT_MOD10_RSTTMR 	0x33
#define CMD_MHI_STT_MOD11_ON     	0x34
#define CMD_MHI_STT_MOD11_OFF    	0x35
#define CMD_MHI_STT_MOD11_INTON 	0x36
#define CMD_MHI_STT_MOD11_INTOFF 	0x37
#define CMD_MHI_STT_MOD11_RSTTMR 	0x38
#define CMD_MHI_STT_MOD12_ON    	0x39
#define CMD_MHI_STT_MOD12_OFF   	0x3A
#define CMD_MHI_STT_MOD12_INTON 	0x3B
#define CMD_MHI_STT_MOD12_INTOFF 	0x3C
#define CMD_MHI_STT_MOD12_RSTTMR 	0x3D
#define CMD_MHI_STT_AUTO_ON    		0x3E
#define CMD_MHI_STT_AUTO_OFF   		0x3F



//Pedido de Datos
#define DRQ_MHI                		0x50
#define DRQ_MHI_STATUS         		0x51
#define DRQ_MHI_CONST         		0x52
#define DRQ_MHI_TMRS1         		0x53
#define DRQ_MHI_TMRS2         		0x54
#define DRQ_MHI_SENS         		0x55

//Datos
#define DATA_MHI               		0x80
#define DATA_MHI_SET_STATUS    		0x81
#define DATA_MHI_SET_CONST     		0x82
#define DATA_MHI_SET_TMRS1    		0x83
#define DATA_MHI_SET_TMRS2    		0x84
#define DATA_MHI_SET_SENS     		0x85
#define DATA_MHI_SET_TIMEGRAL  		0x86
#define DATA_MHI_SET_TIMER_M1  		0x87
#define DATA_MHI_SET_TIMER_M2  		0x88
#define DATA_MHI_SET_TIMER_M3  		0x89
#define DATA_MHI_SET_TIMER_M4  		0x8A
#define DATA_MHI_SET_TIMER_M5  		0x8B
#define DATA_MHI_SET_TIMER_M6  		0x8C
#define DATA_MHI_SET_TIMER_M7  		0x8D
#define DATA_MHI_SET_TIMER_M8  		0x8E
#define DATA_MHI_SET_TIMER_M9  		0x8F
#define DATA_MHI_SET_TIMER_M10 		0x90
#define DATA_MHI_SET_TIMER_M11 		0x91
#define DATA_MHI_SET_TIMER_M12 		0x92
//*********************************


typedef struct
{
  char Nombre[DIM_NOMBRE_AERO];
} TConstModHidro;


typedef struct
{
  byte seg;
  byte min;
  byte hor;
  byte DummyOn;
} TTimeDistri;


typedef union
{
	TTimeDistri hms;
	TDato32 ttl;
}TypTime;

typedef struct
{
  TypTime TOn;
  TypTime TOff;
  TypTime TimeOn;
  TypTime Frec;
  TypTime Timer;
} TTimerOut;

typedef struct
{
  TypTime	     Time;
  TypTime	     IniDia;
  TypTime	     FinDia;
  TypTime	     IniMed;
  TypTime	     FinMed;
} TTimerGral;


typedef struct
{
  TDato32 max;
  TDato32 min;
  TDato32 ADval;
  float swtch;
  float lng;
  float Offset;
  float val;
} TSenNivel;

typedef struct
{
  TDato32 max;
  float FEsc;
  float val;
} TSenConduct;

typedef struct
{
  TSenNivel      DrenLSH;
  TSenNivel      DrenLT;
  TSenConduct    DrenCond;
  TSenNivel      TkLSH;
  TSenNivel      TkLSL;
  TSenConduct    TkCond;
}TGrupoSens;

typedef struct
{
  TTimerGral	 TimerGral;
  TTimerOut	     TimerMod1;
  TTimerOut	     TimerMod2;
  TTimerOut	     TimerMod3;
  TTimerOut	     TimerMod4;
  TTimerOut	     TimerMod5;
  TTimerOut	     TimerMod6;
 }TGrupo1Timers;

typedef struct
{
  TTimerOut	     TimerMod7;
  TTimerOut	     TimerMod8;
  TTimerOut	     TimerMod9;
  TTimerOut	     TimerMod10;
  TTimerOut	     TimerMod11;
  TTimerOut	     TimerMod12;
 }TGrupo2Timers;

typedef struct
{
  TDato32	     Stt1;
  TDato32	     Stt2;
}TStatus;

typedef struct
{
  TConstModHidro    Const;
  TGrupoSens        GrpSens;
  TGrupo1Timers     Grp1Tmrs;
  TGrupo2Timers		Grp2Tmrs;

//Definicion de Salidas Manejo en 32 Bits
#define STAT_MHI_RSRV_0           (0x00000001<<0)
#define STAT_MHI_WRK_ON           (0x00000001<<1)
#define STAT_MHI_ERR_ON           (0x00000001<<2)
#define STAT_MHI_MAN_AUT          (0x00000001<<3)
#define STAT_MHI_MOD1             (0x00000001<<4)
#define STAT_MHI_MOD2             (0x00000001<<5)
#define STAT_MHI_MOD3             (0x00000001<<6)
#define STAT_MHI_MOD4             (0x00000001<<7)
#define STAT_MHI_MOD5             (0x00000001<<8)
#define STAT_MHI_MOD6             (0x00000001<<9)
#define STAT_MHI_MOD1_INTER       (0x00000001<<10)
#define STAT_MHI_MOD2_INTER       (0x00000001<<11)
#define STAT_MHI_MOD3_INTER       (0x00000001<<12)
#define STAT_MHI_MOD4_INTER       (0x00000001<<13)
#define STAT_MHI_MOD5_INTER       (0x00000001<<14)
#define STAT_MHI_MOD6_INTER       (0x00000001<<15)
#define STAT_MHI_RSRV_16          (0x00000001<<16)
#define STAT_MHI_RSRV_17          (0x00000001<<17)
#define STAT_MHI_RSRV_18          (0x00000001<<18)
#define STAT_MHI_RSRV_19          (0x00000001<<19)
#define STAT_MHI_MOD7             (0x00000001<<20)
#define STAT_MHI_MOD8             (0x00000001<<21)
#define STAT_MHI_MOD9             (0x00000001<<22)
#define STAT_MHI_MOD10            (0x00000001<<23)
#define STAT_MHI_MOD11            (0x00000001<<24)
#define STAT_MHI_MOD12            (0x00000001<<25)
#define STAT_MHI_MOD7_INTER       (0x00000001<<26)
#define STAT_MHI_MOD8_INTER       (0x00000001<<27)
#define STAT_MHI_MOD9_INTER       (0x00000001<<28)
#define STAT_MHI_MOD10_INTER      (0x00000001<<29)
#define STAT_MHI_MOD11_INTER      (0x00000001<<30)
#define STAT_MHI_MOD12_INTER      (0x00000001<<31)

//Definicion de Salidas Manejo en 16 Bits
#define STAT2_MHI_RSRV_16          (0x00000001<<0)
#define STAT2_MHI_RSRV_17          (0x00000001<<1)
#define STAT2_MHI_RSRV_18          (0x00000001<<2)
#define STAT2_MHI_RSRV_19          (0x00000001<<3)
#define STAT2_MHI_MOD7             (0x00000001<<4)
#define STAT2_MHI_MOD8             (0x00000001<<5)
#define STAT2_MHI_MOD9             (0x00000001<<6)
#define STAT2_MHI_MOD10            (0x00000001<<7)
#define STAT2_MHI_MOD11            (0x00000001<<8)
#define STAT2_MHI_MOD12            (0x00000001<<9)
#define STAT2_MHI_MOD7_INTER       (0x00000001<<10)
#define STAT2_MHI_MOD8_INTER       (0x00000001<<11)
#define STAT2_MHI_MOD9_INTER       (0x00000001<<12)
#define STAT2_MHI_MOD10_INTER      (0x00000001<<13)
#define STAT2_MHI_MOD11_INTER      (0x00000001<<14)
#define STAT2_MHI_MOD12_INTER      (0x00000001<<15)

  TStatus Status;

} TModHidro;


//==============================================================================================================
#endif  //End of DEF_MODHIDRO_H//