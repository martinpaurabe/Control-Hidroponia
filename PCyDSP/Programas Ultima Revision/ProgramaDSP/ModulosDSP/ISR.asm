
	include "asmdef.h"

	SECTION ISR ; declarations
		global FInit_ISR
		global FisrIRQA
	ENDSEC

	SECTION ISR

	ORG	P:

;
;   10: void Init_ISR(void) 
;   11: { 
;   12:  
;   13:  
;   14: 	clrRegBit(TMRA0_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
		subroutine "FInit_ISR",FInit_ISR,end_FInit_ISR-FInit_ISR
FInit_ISR:
              move.l      #$f047,R0
              bfclr       #$800,X:(R0)
;
;   15: 	setRegBitGroup(INTC_IPR7,TMRA_0_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   16:  
;
              move.l      #$f1a7,R1
              move.l      #$f1a7,R0
              move.w      X:(R0),B
              move.w      #16383,A
              and.w       B,A
              bfset       #$c000,A1
              move.w      A1,X:(R1)
;
;   17: 	clrRegBit(TMRA1_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f057,R0
              bfclr       #$800,X:(R0)
;
;   18: 	setRegBitGroup(INTC_IPR8,TMRA_1_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   19:  
;
              move.l      #$f1a8,R1
              move.l      #$f1a8,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<3,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   20: 	clrRegBit(TMRA2_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f067,R0
              bfclr       #$800,X:(R0)
;
;   21: 	setRegBitGroup(INTC_IPR8,TMRA_2_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   22:  
;
              move.l      #$f1a8,R1
              move.l      #$f1a8,R0
              move.w      X:(R0),A
              move.w      #>-13,B
              and.w       A,B
              move.w      #<12,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   23: 	clrRegBit(TMRA3_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f077,R0
              bfclr       #$800,X:(R0)
;
;   24: 	setRegBitGroup(INTC_IPR8,TMRA_3_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   25:  
;
              move.l      #$f1a8,R1
              move.l      #$f1a8,R0
              move.w      X:(R0),A
              move.w      #>-49,B
              and.w       A,B
              move.w      #<48,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   26: 	clrRegBit(TMRC0_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f0c7,R0
              bfclr       #$800,X:(R0)
;
;   27: 	setRegBitGroup(INTC_IPR6,TMRC_0_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   28:  
;
              move.l      #$f1a6,R1
              move.l      #$f1a6,R0
              move.w      X:(R0),B
              move.w      #16383,A
              and.w       B,A
              bfset       #$c000,A1
              move.w      A1,X:(R1)
;
;   29: 	clrRegBit(TMRC1_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f0d7,R0
              bfclr       #$800,X:(R0)
;
;   30: 	setRegBitGroup(INTC_IPR7,TMRC_1_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   31:  
;
              move.l      #$f1a7,R1
              move.l      #$f1a7,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<3,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   32: 	clrRegBit(TMRC2_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f0e7,R0
              bfclr       #$800,X:(R0)
;
;   33: 	setRegBitGroup(INTC_IPR7,TMRC_2_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   34:  
;
              move.l      #$f1a7,R1
              move.l      #$f1a7,R0
              move.w      X:(R0),A
              move.w      #>-13,B
              and.w       A,B
              move.w      #<12,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   35: 	clrRegBit(TMRC3_SCR,IEF);	//Borro flag de interrupcion TMRC3 
;
              move.l      #$f0f7,R0
              bfclr       #$800,X:(R0)
;
;   36: 	setRegBitGroup(INTC_IPR7,TMRC_3_IPL,0x3);	//Habilito interrupcion TMRC3 (priority 2) 
;   37:  
;   38:  
;   39:  
;
              move.l      #$f1a7,R1
              move.l      #$f1a7,R0
              move.w      X:(R0),A
              move.w      #>-49,B
              and.w       A,B
              move.w      #<48,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   40: 	SPI0_SCR;	//Borro el Flag de 
;
              move.l      #$f2a0,R0
              move.w      X:(R0),A
;
;   41: 	SPI0_DRR;	//Receiver Overflow 
;   42: //	setRegBitGroup(INTC_IPR4,SPI0_RCV_IPL,0x3);	//Habilito interrupcion SPI0 Receiver (priority 2) 
;   43:  
;
              move.l      #$f2a2,R0
              move.w      X:(R0),A
;
;   44: 	SCI0_SCISR;	//Borro el Flag de 
;
              move.l      #$f283,R0
              move.w      X:(R0),A
;
;   45: 	SCI0_SCISR=0;//OR situation 
;
              move.l      #$f283,R0
              move.w      #0,X:(R0)
;
;   46: 	SCI0_SCISR;	//Borro el Flag de 
;
              move.l      #$f283,R0
              move.w      X:(R0),A
;
;   47: 	SCI0_SCIDR;	//Receiver Full 
;
              move.l      #$f284,R0
              move.w      X:(R0),A
;
;   48:     setRegBitGroup(INTC_IPR8,SCI0_RCV_IPL,0x3);	//Habilito interrupcion SCI0 Receiver (priority 2) 
;   49:  
;
              move.l      #$f1a8,R1
              move.l      #$f1a8,R0
              move.w      X:(R0),B
              move.w      #16383,A
              and.w       B,A
              bfset       #$c000,A1
              move.w      A1,X:(R1)
;
;   50: 	SCI0_SCISR; 
;
              move.l      #$f283,R0
              move.w      X:(R0),A
;
;   51: 	SCI0_SCIDR = 0; 
;
              move.l      #$f284,R0
              move.w      #0,X:(R0)
;
;   52: 	setRegBitGroup(INTC_IPR8,SCI0_XMIT_IPL,0x3);	//Habilito interrupcion SCI0 Transmiter (priority 2) 
;   53:  
;
              move.l      #$f1a8,R1
              move.l      #$f1a8,R0
              move.w      X:(R0),B
              move.w      #-193,A
              and.w       B,A
              bfset       #$c0,A1
              move.w      A1,X:(R1)
;
;   54: 	PWMA_PMCTL;						//Borro flag 
;
              move.l      #$f140,R0
              move.w      X:(R0),A
;
;   55: 	clrRegBit(PWMA_PMCTL, PWMF);	//de PWMA Reload 
;
              move.l      #$f140,R0
              bfclr       #$10,X:(R0)
;
;   56: 	setRegBitGroup(INTC_IPR9, PWMA_RL_IPL, 0x3);	//Habilito interrupcion PWMA Reload (priority 2) 
;   57:  
;
              move.l      #$f1a9,R1
              move.l      #$f1a9,R0
              move.w      X:(R0),B
              move.w      #-3073,A
              and.w       B,A
              bfset       #$c00,A1
              move.w      A1,X:(R1)
;
;   58: 	setRegBit(DEC0_DECCR, XIRQ);	//Borro el Flag de HOME 
;
              move.l      #$f180,R0
              bfset       #$100,X:(R0)
;
;   59: 	setRegBitGroup(INTC_IPR6,DEC0_XIRQ_IPL,0x3);	//Habilito interrupcion DEC0_HOME (priority 2) 
;   60:  
;
              move.l      #$f1a6,R1
              move.l      #$f1a6,R0
              move.w      X:(R0),A
              move.w      #>-13,B
              and.w       A,B
              move.w      #<12,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   61: 	asm (bfclr #$0300,sr);		//allow lowest priority (all Priority Levels are allowed: 0, 1, 2, 3) 
;   62: //	asm (bfset #$000F,X:IPR2);	// bits 0-3: IRQA  = priority 2 
;
              bfclr       #$300,SR
;
;   63: } 
              rts         
end_FInit_ISR:

	ENDSEC

	SECTION ISR

	ORG	P:

;
;   64:  
;   65:  
;   66:  
;   67: void isrIRQA() 
;   68: { 
;   69: #pragma interrupt 
;   70: } 
;
		subroutine "FisrIRQA",FisrIRQA,end_FisrIRQA-FisrIRQA
FisrIRQA:
              rti         
end_FisrIRQA:

	ENDSEC


	END
