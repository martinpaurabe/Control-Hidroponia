
	include "asmdef.h"

	SECTION Encoder ; declarations
		global Finit_Encoder
		global FInt_Index
		global FInt_Home
	ENDSEC

	SECTION Encoder

	ORG	P:

;
;   10:  
;   11: void init_Encoder(void) 
;   12: { 
;   13:  
;   14: 	setRegBitGroup(DEC0_DECCR,MODE,0x2); 
;
		subroutine "Finit_Encoder",Finit_Encoder,end_Finit_Encoder-Finit_Encoder
Finit_Encoder:
              move.l      #$f180,R1
              move.l      #$f180,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<2,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   15: 	setRegBit(DEC0_DECCR, XIP); //Habilito la entrada index para resetar la posicion del encoder  
;
              move.l      #$f180,R0
              bfset       #$40,X:(R0)
;
;   16: 	setRegBit(DEC0_DECCR, XIE); 
;   17:  
;   18: 	//Seteo la entrada Home para  
;
              move.l      #$f180,R0
              bfset       #$80,X:(R0)
;
;   19: 	setRegBit(DEC0_DECCR, HIE); 
;
              move.l      #$f180,R0
              bfset       #$4000,X:(R0)
;
;   20:     setRegBit(DEC0_DECCR, REV); 
;
              move.l      #$f180,R0
              bfset       #$400,X:(R0)
;
;   21:     DEC0_UIR=0;   //Aca tengo que poner cual es la posicion de cierre  
;
              move.l      #$f18b,R0
              move.w      #0,X:(R0)
;
;   22:     DEC0_LIR=0;   //Positivo a Operacion, Negativo Venteo  
;
              move.l      #$f18c,R0
              move.w      #0,X:(R0)
;
;   23:     DEC0_LPOS=0;	 
;   24: 	 
;
              move.l      #$f188,R0
              move.w      #0,X:(R0)
;
;   25: } 
              rts         
end_Finit_Encoder:

	ENDSEC

	SECTION Encoder

	ORG	P:

;
;   26:  
;   27: //-------------------------------------------------------------------------------------------- 
;   28:  
;   29: void Int_Index() 
;   30: { 
;   31: #pragma interrupt 
;
		subroutine "FInt_Index",FInt_Index,end_FInt_Index-FInt_Index
FInt_Index:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;   32: 	setRegBit(DEC0_DECCR, XIRQ); 
;
              move.l      #$f180,R0
              bfset       #$100,X:(R0)
;
;   33: } 
              move.l      X:(SP)-,R0
              rti         
end_FInt_Index:

	ENDSEC

	SECTION Encoder

	ORG	P:

;
;   34:  
;   35: //-------------------------------------------------------------------------------------------- 
;   36:  
;   37: void Int_Home() 
;   38: { 
;   39: #pragma interrupt 
;
		subroutine "FInt_Home",FInt_Home,end_FInt_Home-FInt_Home
FInt_Home:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;   40: 	setRegBit(DEC0_DECCR, HIRQ); 
;
              move.l      #$f180,R0
              bfset       #$8000,X:(R0)
;
;   41: } 
;
              move.l      X:(SP)-,R0
              rti         
end_FInt_Home:

	ENDSEC


	END
