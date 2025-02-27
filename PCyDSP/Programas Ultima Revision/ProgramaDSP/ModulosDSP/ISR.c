#include "IO_Map.h"
#include "PE_Types.h"
//#include "MC56F8323.h"

#include <stdio.h>
#include "ISR.h"



void Init_ISR(void)
{


	clrRegBit(TMRA0_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR7,TMRA_0_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRA1_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR8,TMRA_1_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRA2_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR8,TMRA_2_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRA3_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR8,TMRA_3_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRC0_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR6,TMRC_0_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRC1_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR7,TMRC_1_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRC2_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR7,TMRC_2_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)

	clrRegBit(TMRC3_SCR,IEF);	//Borro flag de interrupcion TMRC3
	setRegBitGroup(INTC_IPR7,TMRC_3_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2)



	SPI0_SCR;	//Borro el Flag de
	SPI0_DRR;	//Receiver Overflow
//	setRegBitGroup(INTC_IPR4,SPI0_RCV_IPL,0x3);	//Habilito interrupcion SPI0 Receiver (priority 2)

	SCI0_SCISR;	//Borro el Flag de
	SCI0_SCISR=0;//OR situation
	SCI0_SCISR;	//Borro el Flag de
	SCI0_SCIDR;	//Receiver Full
    setRegBitGroup(INTC_IPR8,SCI0_RCV_IPL,0x3);	//Habilito interrupcion SCI0 Receiver (priority 2)

	SCI0_SCISR;
	SCI0_SCIDR = 0;
	setRegBitGroup(INTC_IPR8,SCI0_XMIT_IPL,0x3);	//Habilito interrupcion SCI0 Transmiter (priority 2)

	PWMA_PMCTL;						//Borro flag
	clrRegBit(PWMA_PMCTL, PWMF);	//de PWMA Reload
	setRegBitGroup(INTC_IPR9, PWMA_RL_IPL, 0x3);	//Habilito interrupcion PWMA Reload (priority 2)

	setRegBit(DEC0_DECCR, XIRQ);	//Borro el Flag de HOME
	setRegBitGroup(INTC_IPR6,DEC0_XIRQ_IPL,0x3);	//Habilito interrupcion DEC0_HOME (priority 2)

	asm (bfclr #$0300,sr);		//allow lowest priority (all Priority Levels are allowed: 0, 1, 2, 3)
//	asm (bfset #$000F,X:IPR2);	// bits 0-3: IRQA  = priority 2
}



void isrIRQA()
{
#pragma interrupt
}


