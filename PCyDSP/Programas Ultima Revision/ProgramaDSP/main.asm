
	include "asmdef.h"

	SECTION main ; declarations
		global FTimerCumplido
		global FNumPulsesFracFin
		global FNumPulseTurn
	ENDSEC

	SECTION main ; declarations
		global Fmain
	ENDSEC

	SECTION main ; declarations
		xref ARTMAIN
		xref Finit_GPIO
		xref FInit_Disp
		xref Finit_Timer
		xref FInit_SCI
		xref Finit_AD
		xref FInit_ISR
		xref FsciRxBuf
		xref FsciDataReceived
		xref FisrADCAConvCompl
		xref FB1
		xref ARTU32_TO_F32
		xref FACUM_ADCA_ADRSLT4
		xref FM1
		xref ARTMPYF32U
		xref ARTADDF32U
		xref ARTF32_TO_U32U
		xref FModHidro
		xref FACUM_ADCA_ADRSLT5
		xref FACUM_ADCA_ADRSLT6
		xref FACUM_ADCA_ADRSLT7
		xref ARTDIVF32UZ
		xref FACUM_ADCA_ADRSLT0
		xref FACUM_ADCA_ADRSLT1
		xref FACUM_ADCA_ADRSLT2
		xref FACUM_ADCA_ADRSLT3
		xref FInc_Timer
		xref FCtrl_Auto
		xref ARTDIVREC_S16
	ENDSEC

	SECTION main

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FTimerCumplido:	dsb	1

	ENDSEC

	SECTION main

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FNumPulsesFracFin:	ds	1

	ENDSEC

	SECTION main

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FNumPulseTurn:	ds	1

	ENDSEC

	SECTION main

	ORG	P:

;
;   32: int NumPulsesFracFin=0, NumPulseTurn=0; 
;   33: //-------------------------------------------------------------------------------------------- 
;   34:  
;   35: int main(void) 
;   36: { 
;
		subroutine "Fmain",Fmain,end_Fmain-Fmain
Fmain:
              adda        #<2,SP
              move.l      C10,X:(SP)+
              move.l      R5,X:(SP)
              adda        #<6,SP
;
;   37:     int AcumTimer=0, AcumTimer2=0; 
;
              clr.w       X:(SP->3)
              clr.w       X:(SP->4)
;
;   38:     int flag=29; 
;
              move.w      #29,X:(SP-5)
;
;   39: 	byte ShowHora=0, ShowDecMin=0; 
;   40:  
;
              clr.b       X:(SP+>0)
              clr.b       X:(SP->1)
;
;   41: 	init_GPIO(); 
;
              jsr         >Finit_GPIO
;
;   42: 	Init_Disp(); 
;
              jsr         >FInit_Disp
;
;   43: 	init_Timer(); 
;   44: //	init_SPI(); 
;
              jsr         >Finit_Timer
;
;   45: 	Init_SCI(); 
;   46: //	init_PWM(); 
;
              jsr         >FInit_SCI
;
;   47: 	init_AD(); 
;
              jsr         >Finit_AD
;
;   48: 	Init_ISR(); 
;   49: 	 
;   50: 	 
;   51: 	while(1) 
;   52: 	{ 
;
              jsr         >FInit_ISR
;
;   53:  		if(sciRxBuf)	 
;   54:         { 
;
_L9_6:
              move.l      X:>>FsciRxBuf,R0
              tsta.l      R0
              beq         <_L9_0	; *+10
;
;   55:            sciDataReceived((byte *)sciRxBuf); 
;
              move.l      X:>>FsciRxBuf,R2
              jsr         >FsciDataReceived
;
;   56:            sciRxBuf = NULL; 
;   57: 	    } 
;
              move.w      #<0,R0
              move.l      R0,X:>>FsciRxBuf
;
;   58: 	    if(TimerCumplido) 
;   59: 	    { 
;
_L9_0:
              tst.bp      X:>>@lb(FTimerCumplido)
              beq         >_L9_1	; *+468
;
;   60: 		  TimerCumplido=FALSE; 
;   61:            
;
              clr.bp      X:>>@lb(FTimerCumplido)
;
;   62:           if(getRegBit( ADCA_ADSTAT, EOSI )) 
;
              move.l      #$f206,R0
              move.w      X:(R0),A
              bftstl      #$800,A1
              bcs         <_L9_2	; *+3
;
;   63:   	      	isrADCAConvCompl(); 
;   64: 		   
;
              jsr         >FisrADCAConvCompl
;
;   65: 		  AcumTimer++; 
;   66: 		   
;
_L9_2:
              move.w      X:(SP-3),A
              add.w       #<1,A
              move.w      A1,X:(SP-3)
;
;   67: 		  if(AcumTimer>=32) 
;   68: 		  { 
;
              move.w      #<32,A
              cmp.w       X:(SP-3),A
              bgt         >_L9_1	; *+449
;
;   69:     	  	AcumTimer=0; 
;   70:     	  	 
;
              clr.w       X:(SP->3)
;
;   71:  			ModHidro.GrpSens.TkLSL.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT4>>5); 
;
              move.l      X:>>FB1,A
              jsr         >ARTU32_TO_F32
              tfr         A,C
              move.l      X:>>FACUM_ADCA_ADRSLT4,A
              lsrr.l      #<5,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM1,A
              jsr         >ARTMPYF32U
              tfr         A,B
              tfr         C,A
              jsr         >ARTADDF32U
              jsr         >ARTF32_TO_U32U
              move.l      #>>FModHidro+58,R0
              move.l      A10,X:(R0)
;
;   72: 		    ModHidro.GrpSens.TkLSH.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT5>>5); 
;
              move.l      X:>>FB1,A
              jsr         >ARTU32_TO_F32
              tfr         A,C
              move.l      X:>>FACUM_ADCA_ADRSLT5,A
              lsrr.l      #<5,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM1,A
              jsr         >ARTMPYF32U
              tfr         A,B
              tfr         C,A
              jsr         >ARTADDF32U
              jsr         >ARTF32_TO_U32U
              move.l      #>>FModHidro+44,R0
              move.l      A10,X:(R0)
;
;   73: 			ModHidro.GrpSens.DrenLSH.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT6>>5); 
;
              move.l      X:>>FB1,A
              jsr         >ARTU32_TO_F32
              tfr         A,C
              move.l      X:>>FACUM_ADCA_ADRSLT6,A
              lsrr.l      #<5,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM1,A
              jsr         >ARTMPYF32U
              tfr         A,B
              tfr         C,A
              jsr         >ARTADDF32U
              jsr         >ARTF32_TO_U32U
              move.l      #>>FModHidro+10,R0
              move.l      A10,X:(R0)
;
;   74: 			ModHidro.GrpSens.DrenLT.ADval.dwrd = (UInt32)CORREGIR_AD1(ACUM_ADCA_ADRSLT7>>5); 
;   75:  
;
              move.l      X:>>FB1,A
              jsr         >ARTU32_TO_F32
              tfr         A,C
              move.l      X:>>FACUM_ADCA_ADRSLT7,A
              lsrr.l      #<5,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM1,A
              jsr         >ARTMPYF32U
              tfr         A,B
              tfr         C,A
              jsr         >ARTADDF32U
              jsr         >ARTF32_TO_U32U
              move.l      #>>FModHidro+24,R0
              move.l      A10,X:(R0)
;
;   76: 			ModHidro.GrpSens.TkLSL.val = (ModHidro.GrpSens.TkLSL.ADval.dwrd-ModHidro.GrpSens.TkLSL.min.dwrd)*ModHidro.GrpSens.TkLSL.lng/(ModHidro.GrpSens.TkLSL.max.dwrd-ModHidro.GrpSens.TkLSL.min.dwrd); 
;
              move.l      #>>FModHidro+58,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+56,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #>>FModHidro+62,R0
              move.l      X:(R0),A
              jsr         >ARTMPYF32U
              tfr         A,C
              move.l      #>>FModHidro+54,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+56,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              tfr         C,A
              jsr         >ARTDIVF32UZ
              move.l      #>>FModHidro+66,R0
              move.l      A10,X:(R0)
;
;   77: 		    ModHidro.GrpSens.DrenLSH.val = (ModHidro.GrpSens.DrenLSH.ADval.dwrd-ModHidro.GrpSens.DrenLSH.min.dwrd)*ModHidro.GrpSens.DrenLSH.lng/(ModHidro.GrpSens.DrenLSH.max.dwrd-ModHidro.GrpSens.DrenLSH.min.dwrd); 
;
              move.l      #>>FModHidro+10,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+8,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #>>FModHidro+14,R0
              move.l      X:(R0),A
              jsr         >ARTMPYF32U
              tfr         A,C
              move.l      #>>FModHidro+6,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+8,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              tfr         C,A
              jsr         >ARTDIVF32UZ
              move.l      #>>FModHidro+18,R0
              move.l      A10,X:(R0)
;
;   78: 			ModHidro.GrpSens.DrenLT.val = (ModHidro.GrpSens.DrenLT.ADval.dwrd-ModHidro.GrpSens.DrenLT.min.dwrd)*ModHidro.GrpSens.DrenLT.lng/(ModHidro.GrpSens.DrenLT.max.dwrd-ModHidro.GrpSens.DrenLT.min.dwrd); 
;
              move.l      #>>FModHidro+24,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+22,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #>>FModHidro+28,R0
              move.l      X:(R0),A
              jsr         >ARTMPYF32U
              tfr         A,C
              move.l      #>>FModHidro+20,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+22,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              tfr         C,A
              jsr         >ARTDIVF32UZ
              move.l      #>>FModHidro+32,R0
              move.l      A10,X:(R0)
;
;   79: 			ModHidro.GrpSens.TkLSH.val = (ModHidro.GrpSens.TkLSH.ADval.dwrd-ModHidro.GrpSens.TkLSH.min.dwrd)*ModHidro.GrpSens.TkLSH.lng/(ModHidro.GrpSens.TkLSH.max.dwrd-ModHidro.GrpSens.TkLSH.min.dwrd); 
;   80: 			 
;
              move.l      #>>FModHidro+44,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+42,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #>>FModHidro+48,R0
              move.l      X:(R0),A
              jsr         >ARTMPYF32U
              tfr         A,C
              move.l      #>>_L9_0,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+42,R0
              move.l      X:(R0),B
              sub         B,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              tfr         C,A
              jsr         >ARTDIVF32UZ
              move.l      #>>FModHidro+52,R0
              move.l      A10,X:(R0)
;
;   81: 			ModHidro.GrpSens.TkLSL.val += ModHidro.GrpSens.TkLSL.Offset; 
;
              move.l      #>>FModHidro,R5
              adda        #$42,R5,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+64,R0
              move.l      X:(R0),B
              jsr         >ARTADDF32U
              move.l      A10,X:(R5+>$42)
;
;   82: 		    ModHidro.GrpSens.DrenLSH.val += ModHidro.GrpSens.DrenLSH.Offset; 
;
              move.l      #>>FModHidro,R5
              adda        #$12,R5,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+16,R0
              move.l      X:(R0),B
              jsr         >ARTADDF32U
              move.l      A10,X:(R5+>$12)
;
;   83: 			ModHidro.GrpSens.DrenLT.val += ModHidro.GrpSens.DrenLT.Offset; 
;
              move.l      #>>FModHidro,R5
              adda        #$20,R5,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+30,R0
              move.l      X:(R0),B
              jsr         >ARTADDF32U
              move.l      A10,X:(R5+>$20)
;
;   84: 			ModHidro.GrpSens.TkLSH.val += ModHidro.GrpSens.TkLSH.Offset; 
;   85: 			 
;   86: 			 
;   87: 			 
;   88: 			 
;   89: 			 
;
              move.l      #>>FModHidro,R5
              adda        #$34,R5,R0
              move.l      X:(R0),A
              move.l      #>>FModHidro+50,R0
              move.l      X:(R0),B
              jsr         >ARTADDF32U
              move.l      A10,X:(R5+>$34)
;
;   90: 			ACUM_ADCA_ADRSLT0=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT0
;
;   91: 			ACUM_ADCA_ADRSLT1=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT1
;
;   92: 			ACUM_ADCA_ADRSLT2=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT2
;
;   93: 			ACUM_ADCA_ADRSLT3=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT3
;
;   94: 			ACUM_ADCA_ADRSLT4=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT4
;
;   95: 			ACUM_ADCA_ADRSLT5=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT5
;
;   96: 			ACUM_ADCA_ADRSLT6=0; 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT6
;
;   97: 			ACUM_ADCA_ADRSLT7=0; 
;   98: 		   
;   99: 	   
;  100: 		    	 
;  101: 		   // if(ModHidro.Status.Stt1.dwrd & STAT_MHI_WRK_ON) 
;
              clr.l       X:>>FACUM_ADCA_ADRSLT7
;
;  102: 		    if(flag) 
;  103: 		    { 
;
              tst.w       X:(SP-5)
              beq         <_L9_3	; *+32
;
;  104: 		    	flag=0; 
;
              clr.w       X:(SP->5)
;
;  105: 		    	OutLedMinutOff; 
;
              move.l      #$f301,R0
              bfclr       #$20,X:(R0)
;
;  106: 		    	OutLedHoraOff; 
;
              move.l      #$f301,R0
              bfclr       #$10,X:(R0)
;
;  107: 	    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_WRK_ON;	 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #2,X:(R0)
;
;  108: 				Inc_Timer(); 
;
              jsr         >FInc_Timer
;
;  109: 				if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MAN_AUT) 
;
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),A
              and.l       #<8,A
              tst.l       A
              beq         >_L9_1	; *+74
;
;  110: 					Ctrl_Auto(); 
;
              jsr         >FCtrl_Auto
;
;  111:     	    } 
;  112: 		   	else 
;  113: 		    { 
;
              bra         >_L9_1	; *+70
;
;  114: 		    	flag=1; 
;
_L9_3:
              move.w      #1,X:(SP-5)
;
;  115: 		    	ShowHora++; 
;
              moveu.b     X:(SP),A
              add.w       #<1,A
              move.b      A1,X:(SP)
;
;  116: 		    	ShowHora%=24; 
;
              moveu.b     X:(SP),A
              zxt.b       A,A
              move.w      A1,X:(SP-2)
              move.l      #$2aaaaaab,A
              move.w      X:(SP-2),Y0
              jsr         >ARTDIVREC_S16
              asrr.w      #<2,Y0
              move.w      X:(SP-2),A
              lsrr.w      #<15,A
              add         A,Y0
              move.w      #<24,A
              impy.l      A1,Y0,A
              move.w      A0,A
              move.w      X:(SP-2),Y0
              sub         A,Y0
              move.w      Y0,X:(SP-2)
              move.w      X:(SP-2),A
              zxt.b       A,A
              move.b      A1,X:(SP)
;
;  117: 		    	ShowDecMin=(ShowHora+1)*10; 
;
              moveu.b     X:(SP),A
              zxt.b       A,B
              add.w       #<1,B
              move.w      #<10,A
              impy.l      A1,B1,A
              move.w      A0,A
              zxt.b       A,A
              move.b      A1,X:(SP-1)
;
;  118: 		    	if(ShowHora<ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor) 
;  119: 		    	{ 
;
              moveu.b     X:(SP),B
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              adda        #<2,R0
              moveu.bp    X:(R0),A
              cmp.b       B,A
              bls         <_L9_4	; *+6
;
;  120: 		    		OutLedHoraOn; 
;  121: 		    	} 
;
              move.l      #$f301,R0
              bfset       #$10,X:(R0)
;
;  122: 		    	if(ShowDecMin<ModHidro.Grp1Tmrs.TimerGral.Time.hms.min) 
;  123: 		    	{ 
;
_L9_4:
              moveu.b     X:(SP-1),B
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              adda        #<1,R0
              moveu.bp    X:(R0),A
              cmp.b       B,A
              bls         <_L9_5	; *+6
;
;  124: 		    		OutLedMinutOn; 
;  125: 		    	} 
;  126:  
;
              move.l      #$f301,R0
              bfset       #$20,X:(R0)
;
;  127: 	    		ModHidro.Status.Stt1.dwrd |= STAT_MHI_WRK_ON;	 
;  128:  
;  129: 		    }	 
;  130: 		  } 
;  131: 	    } 
;  132:  
;  133: 		asm 
;  134: 		{ 
;
_L9_5:
              move.l      #>>FModHidro+204,R0
              bfset       #2,X:(R0)
;
;  135: 			nop  //Por si se quiere agragar algo en assembler 
;
_L9_1:
              nop         
;
;  136: 			nop 
;
              nop         
;
;  137: 			nop 
;
              nop         
;
;  138: 			nop 
;
              nop         
;
;  139: 			nop 
;
              nop         
;
;  140: 			nop 
;  141: 		} 
;
              nop         
;
;  142: 	} 
;
              bra         >_L9_6	; *-491
end_Fmain:

	ENDSEC


	END
