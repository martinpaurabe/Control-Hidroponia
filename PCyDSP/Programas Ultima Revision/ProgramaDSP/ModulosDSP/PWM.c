#include "IO_Map.h"
//#include "PE_Types.h"

#include "main.h"

#include <stdio.h>

#include "PWM.h"
#include "GPIO.h"
#include "Unit_Disp.h"
//--------------------------------------------------------------------------------------------
// Chip is operating at 60 MHz
void init_PWM(void)
{
	PWMA_PMDISMAP1 = 0;
	PWMA_PMDISMAP2 = 0;

	PWMA_PWMCM = PWM_MAX;
	PWMA_PWMVAL0 = 0;
	PWMA_PWMVAL1 = 0;
	PWMA_PWMVAL2 = 0;
	PWMA_PWMVAL3 = 0;
	PWMA_PWMVAL4 = 0;
	PWMA_PWMVAL5 = 0;

	setRegBit(PWMA_PMCFG, EDG);
	clrRegBit(PWMA_PMCFG, TOPNEG01);
	clrRegBit(PWMA_PMCFG, BOTNEG01);
	clrRegBit(PWMA_PMCFG, INDEP01);
	clrRegBit(PWMA_PMCFG, TOPNEG23);
	clrRegBit(PWMA_PMCFG, BOTNEG23);
	clrRegBit(PWMA_PMCFG, INDEP23);
	clrRegBit(PWMA_PMCFG, TOPNEG45);
	clrRegBit(PWMA_PMCFG, BOTNEG45);
	clrRegBit(PWMA_PMCFG, INDEP45);

	setRegBit(PWMA_PMCCR, MSK);
	clrRegBit(PWMA_PMCCR, MSK0);
	clrRegBit(PWMA_PMCCR, MSK1);
	clrRegBit(PWMA_PMCCR, MSK2);
	clrRegBit(PWMA_PMCCR, MSK3);
	clrRegBit(PWMA_PMCCR, MSK4);
	clrRegBit(PWMA_PMCCR, MSK5);

	PWMA_PMCTL;
	clrRegBit(PWMA_PMCTL, PRSC0);
	clrRegBit(PWMA_PMCTL, PRSC1);
	
	setRegBit(PWMA_PMCTL, LDOK);

	setRegBit(PWMA_PMOUT, PAD_EN);

	setRegBit(PWMA_PMCTL, PWMRIE);

	setRegBit(PWMA_PMCTL, PWMEN);

	setRegBit(PWMA_PMCFG, WP);
}
//--------------------------------------------------------------------------------------------

void isrPWMA_RL()
{
#pragma interrupt


	PWMA_PMCTL;						//Borro flag
	clrRegBit(PWMA_PMCTL, PWMF);	//de PWMA Reload

}
//--------------------------------------------------------------------------------------------
