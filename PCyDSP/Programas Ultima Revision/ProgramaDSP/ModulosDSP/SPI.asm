
	include "asmdef.h"

	SECTION SPI ; declarations
		global Finit_SPI
		global FisrSPI0_Transmiter
		global FisrSPI0_Receiver
	ENDSEC

	SECTION SPI

	ORG	P:

;
;    7:  
;    8:  
;    9: void init_SPI(void) 
;   10: { 
;   11: 	setRegBitGroup(SPI0_SCR,SPR,0x1); 
;
		subroutine "Finit_SPI",Finit_SPI,end_Finit_SPI-Finit_SPI
Finit_SPI:
              move.l      #$f2a0,R1
              move.l      #$f2a0,R0
              move.w      X:(R0),B
              move.w      #8191,A
              and.w       B,A
              bfset       #$2000,A1
              move.w      A1,X:(R1)
;
;   12: 	clrRegBit(SPI0_SCR,CPHA); 
;
              move.l      #$f2a0,R0
              bfclr       #$40,X:(R0)
;
;   13: 	setRegBit(SPI0_SCR,ERRIE); 
;   14:  
;
              move.l      #$f2a0,R0
              bfset       #$800,X:(R0)
;
;   15: 	setRegBitGroup(SPI0_DSR,DS,0x8); 
;   16:  
;
              move.l      #$f2a1,R1
              move.l      #$f2a1,R0
              move.w      X:(R0),A
              move.w      #>-16,B
              and.w       A,B
              move.w      #<8,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   17: 	setRegBit(SPI0_SCR,SPE); 
;
              move.l      #$f2a0,R0
              bfset       #$20,X:(R0)
;
;   18: } 
              rts         
end_Finit_SPI:

	ENDSEC

	SECTION SPI

	ORG	P:

;
;   19: //-------------------------------------------------------------------------------------------- 
;   20:  
;   21:  
;   22: void isrSPI0_Transmiter(void) 
;   23: { 
;   24: #pragma interrupt 
;   25:  
;   26: } 
		subroutine "FisrSPI0_Transmiter",FisrSPI0_Transmiter,end_FisrSPI0_Transmiter-FisrSPI0_Transmiter
FisrSPI0_Transmiter:
              rti         
end_FisrSPI0_Transmiter:

	ENDSEC

	SECTION SPI

	ORG	P:

;
;   27: //-------------------------------------------------------------------------------------------- 
;   28:  
;   29:  
;   30: void isrSPI0_Receiver(void) 
;   31: { 
;   32: #pragma interrupt 
;   33:  
;
		subroutine "FisrSPI0_Receiver",FisrSPI0_Receiver,end_FisrSPI0_Receiver-FisrSPI0_Receiver
FisrSPI0_Receiver:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      R0,X:(SP)+
              move.l      M01,X:(SP)+
              suba        #<2,SP
              bfset       #$ffff,M01
;
;   34: 	setRegBit(GPIO_C_DR, D3);	//Debug 
;   35:  
;
              move.l      #$f311,R0
              bfset       #8,X:(R0)
;
;   36: 	SPI0_SCR;	//Borro el Flag de 
;
              move.l      #$f2a0,R0
              move.w      X:(R0),A
;
;   37: 	SPI0_DRR;	//Receiver Overflow 
;   38:  
;   39:  
;
              move.l      #$f2a2,R0
              move.w      X:(R0),A
;
;   40: 	clrRegBit(GPIO_C_DR, D3);	//Debug 
;
              move.l      #$f311,R0
              bfclr       #8,X:(R0)
;
;   41: } 
;
              move.l      X:(SP)-,M01
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrSPI0_Receiver:

	ENDSEC


	END
