#include "IO_Map.h"
#include "PE_Types.h"

#include "Unit_Disp.h"
#include "AD.h"


static void CalibrateADC_simul(void);
static void CalADC_Calc_m_and_b(void);

//Define calibration reading variables in global scope
UInt32 low_ADC_cal_0;	//ADCA_0 result when VREFLO is routed to its input
UInt32 high_ADC_cal_0;	//ADCA_0 result when VREFH is routed to its input
UInt32 low_ADC_cal_1;	//ADCA_1 result when VREFLO is routed to its input
UInt32 high_ADC_cal_1;	//ADCA_1 result when VREFH is routed to its input
float M0,M1;
UInt32 B0,B1;
UInt32 ACUM_ADCA_ADRSLT0=0;	//Acumuladores para Filtro digital
UInt32 ACUM_ADCA_ADRSLT1=0;	
UInt32 ACUM_ADCA_ADRSLT2=0;	
UInt32 ACUM_ADCA_ADRSLT3=0;
UInt32 ACUM_ADCA_ADRSLT4=0;	
UInt32 ACUM_ADCA_ADRSLT5=0;	
UInt32 ACUM_ADCA_ADRSLT6=0;	
UInt32 ACUM_ADCA_ADRSLT7=0;

//--------------------------------------------------------------------------------------------

//Lecturas acumuladas
Int32 lectAccAD0;
Int32 lectAccAD1;


void init_AD(void)
{
	int i;

//	setRegBit(ADCA_ADCR1, EOSIE);	//End-of-Scan Interrupt Enabled
	clrRegBit(ADCA_ADCR1, CHNCFG);	//Single ended inputs
    setRegBitGroup(ADCA_ADCR1, SMODE, 0x01);	//Once Simultaneus

//  COMENTO PORQUE VOY A UTILIZAR TODOS LOS CANALES
//	setRegBitGroup(ADCA_ADLST1, SAMPLE0, 0x1);	//Uso entrada 1
//	setRegBitGroup(ADCA_ADLST2, SAMPLE_40, 0x5);	//Uso entrada 5
//	setRegBitGroup(ADCA_ADSDIS, DS, 0xEE);	//Deshabilito todos los canales excepto 0 y 4
	setRegBit(ADCA_ADSTAT,EOSI);	//clear EOSI flag
	clrRegBit(ADCA_ADCR1,STOP);	//Lo saco de STOP

//  COMENTO PORQUE NO QUIERO MEDICIONES NEGATIVAS   
//	ADCA_ADOFS0 = (1 << 14);
//	ADCA_ADOFS4 = (1 << 14);

	low_ADC_cal_0 = 0;	//ADCA_0 result when VREFLO is routed to its input
	high_ADC_cal_0 = 0;	//ADCA_0 result when VREFH is routed to its input
	low_ADC_cal_1 = 0;	//ADCA_1 result when VREFLO is routed to its input
	high_ADC_cal_1 = 0;	//ADCA_1 result when VREFH is routed to its input
	for(i = 0; i < CANT_PROM; i++)
	{
		CalibrateADC_simul();
	}
	low_ADC_cal_0 /= CANT_PROM;	//ADCA_0 result when VREFLO is routed to its input
	high_ADC_cal_0 /= CANT_PROM;	//ADCA_0 result when VREFH is routed to its input
	low_ADC_cal_1 /= CANT_PROM;	//ADCA_1 result when VREFLO is routed to its input
	high_ADC_cal_1 /= CANT_PROM;	//ADCA_1 result when VREFH is routed to its input

	CalADC_Calc_m_and_b();
	
	setRegBit( ADCA_ADCR1, START ); // single ended conversions

	lectAccAD0 = 0;
	lectAccAD1 = 0;
}
//--------------------------------------------------------------------------------------------


static void CalibrateADC_simul(void)
{
	UInt16 save_ADCR1, save_ADSDIS;

	save_ADCR1 = getReg( ADCA_ADCR1 );
	save_ADSDIS = getReg( ADCA_ADSDIS );

	/* ADCA_ADCR1: ??=0,STOP=1,START=0,SYNC=0,EOSIE=0,ZCIE=0,LLMTIE=0,HLMTIE=0,	CHNCFG=0,??=0,SMODE=1 */
	setReg(ADCA_ADCR1,0x4001);	// stop the current ADC operation,
								// set single ended mode,
								// once simultaneous operation

	clrRegBit( ADCA_ADCR1, STOP );	// clear the stop bit so we can do

	//calibration
	setReg( ADCA_CAL, 0x7 ); // cal_0 high, cal_1 low reference

	setReg( ADCA_ADSDIS, 0xEE ); // enable Sample0 and Sample4, only

	setRegBit( ADCA_ADCR1, START ); // single ended conversions
	while ( !getRegBit( ADCA_ADSTAT, EOSI ) ); // wait for conversion to complete
	setReg(ADCA_ADSTAT,0x0800); // Clear EOSI flag

//	high_ADC_cal_0 = getReg( ADCA_ADRSLT0 );
//	low_ADC_cal_1 = getReg( ADCA_ADRSLT4 );
	high_ADC_cal_0 += ADCA_ADRSLT0;
	low_ADC_cal_1 += ADCA_ADRSLT4;

	setReg( ADCA_CAL, 0xD );	// cal_0 low, cal_1 high reference

	setRegBit( ADCA_ADCR1, START );	// single ended conversions
	while ( !getRegBit( ADCA_ADSTAT, EOSI ) );	// wait for conversion to complete
	setReg(ADCA_ADSTAT,0x0800);	// Clear EOSI flag

//	low_ADC_cal_0 = getReg( ADCA_ADRSLT0 );
//	high_ADC_cal_1 = getReg( ADCA_ADRSLT4 );
	low_ADC_cal_0 += ADCA_ADRSLT0;
	high_ADC_cal_1 += ADCA_ADRSLT4;

	setReg( ADCA_CAL, 0 );	// return to normal ADC operation

	setReg( ADCA_ADSDIS, save_ADSDIS );	// restore registers to previous mode of
	setReg( ADCA_ADCR1, save_ADCR1 );	// operation
}
//--------------------------------------------------------------------------------------------


#define REF_HIGH 24570	//(4095 * 0.75) * 8
#define REF_LOW 8190	//(4095 * 0.25) * 8

static void CalADC_Calc_m_and_b( void )
{

	M0=(24568.0-8184.0)/(float)(high_ADC_cal_0-low_ADC_cal_0);
	B0=24568-M0*(float)high_ADC_cal_0;

	M1=(24568.0-8184.0)/(float)(high_ADC_cal_1-low_ADC_cal_1);
	B1=24568-M1*(float)high_ADC_cal_1;
}
//--------------------------------------------------------------------------------------------


void isrADCAConvCompl()
{
#pragma interrupt

	ACUM_ADCA_ADRSLT0 += (UInt32)ADCA_ADRSLT0;
	ACUM_ADCA_ADRSLT1 += (UInt32)ADCA_ADRSLT1;
	ACUM_ADCA_ADRSLT2 += (UInt32)ADCA_ADRSLT2;
	ACUM_ADCA_ADRSLT3 += (UInt32)ADCA_ADRSLT3;
	ACUM_ADCA_ADRSLT4 += (UInt32)ADCA_ADRSLT4;
	ACUM_ADCA_ADRSLT5 += (UInt32)ADCA_ADRSLT5;
	ACUM_ADCA_ADRSLT6 += (UInt32)ADCA_ADRSLT6;
	ACUM_ADCA_ADRSLT7 += (UInt32)ADCA_ADRSLT7;
	
	setRegBit(ADCA_ADSTAT,EOSI);	//clear EOSI flag
	setRegBit( ADCA_ADCR1, START ); // single ended conversions

}
//--------------------------------------------------------------------------------------------
