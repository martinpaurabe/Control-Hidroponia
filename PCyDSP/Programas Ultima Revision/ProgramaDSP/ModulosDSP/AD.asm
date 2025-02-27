
	include "asmdef.h"

	SECTION AD ; declarations
		global FACUM_ADCA_ADRSLT0
		global FACUM_ADCA_ADRSLT1
		global FACUM_ADCA_ADRSLT2
		global FACUM_ADCA_ADRSLT3
		global FACUM_ADCA_ADRSLT4
		global FACUM_ADCA_ADRSLT5
		global FACUM_ADCA_ADRSLT6
		global FACUM_ADCA_ADRSLT7
	ENDSEC

	SECTION AD ; declarations
		global Finit_AD
	ENDSEC

	SECTION AD ; declarations
		global Flow_ADC_cal_0
		global Fhigh_ADC_cal_0
		global Flow_ADC_cal_1
		global Fhigh_ADC_cal_1
		global FlectAccAD0
		global FlectAccAD1
	ENDSEC

	SECTION AD ; declarations
		xref ARTU32_TO_F32
		xref ARTDIVF32UZ
	ENDSEC

	SECTION AD ; declarations
		global FM0
	ENDSEC

	SECTION AD ; declarations
		xref ARTMPYF32U
		xref ARTSUBF32U
		xref ARTF32_TO_U32U
	ENDSEC

	SECTION AD ; declarations
		global FB0
		global FM1
		global FB1
	ENDSEC

	SECTION AD ; declarations
		global FisrADCAConvCompl
	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT1:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT2:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT3:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT4:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT5:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT6:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FACUM_ADCA_ADRSLT7:	ds	2

	ENDSEC

	SECTION AD

	ORG	P:

;
;   31: Int32 lectAccAD1; 
;   32:  
;   33:  
;   34: void init_AD(void) 
;   35: { 
;   36: 	int i; 
;   37:  
;   38: //	setRegBit(ADCA_ADCR1, EOSIE);	//End-of-Scan Interrupt Enabled 
;
		subroutine "Finit_AD",Finit_AD,end_Finit_AD-Finit_AD
Finit_AD:
              adda        #<2,SP
;
;   39: 	clrRegBit(ADCA_ADCR1, CHNCFG);	//Single ended inputs 
;
              move.l      #$f200,R0
              bfclr       #$f0,X:(R0)
;
;   40:     setRegBitGroup(ADCA_ADCR1, SMODE, 0x01);	//Once Simultaneus 
;   41:  
;   42: //  COMENTO PORQUE VOY A UTILIZAR TODOS LOS CANALES 
;   43: //	setRegBitGroup(ADCA_ADLST1, SAMPLE0, 0x1);	//Uso entrada 1 
;   44: //	setRegBitGroup(ADCA_ADLST2, SAMPLE_40, 0x5);	//Uso entrada 5 
;   45: //	setRegBitGroup(ADCA_ADSDIS, DS, 0xEE);	//Deshabilito todos los canales excepto 0 y 4 
;
              move.l      #$f200,R1
              move.l      #$f200,R0
              move.w      X:(R0),A
              move.w      #>-8,B
              and.w       A,B
              move.w      #<1,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   46: 	setRegBit(ADCA_ADSTAT,EOSI);	//clear EOSI flag 
;
              move.l      #$f206,R0
              bfset       #$800,X:(R0)
;
;   47: 	clrRegBit(ADCA_ADCR1,STOP);	//Lo saco de STOP 
;   48:  
;   49: //  COMENTO PORQUE NO QUIERO MEDICIONES NEGATIVAS    
;   50: //	ADCA_ADOFS0 = (1 << 14); 
;   51: //	ADCA_ADOFS4 = (1 << 14); 
;   52:  
;
              move.l      #$f200,R0
              bfclr       #$4000,X:(R0)
;
;   53: 	low_ADC_cal_0 = 0;	//ADCA_0 result when VREFLO is routed to its input 
;
              clr.l       X:>>Flow_ADC_cal_0
;
;   54: 	high_ADC_cal_0 = 0;	//ADCA_0 result when VREFH is routed to its input 
;
              clr.l       X:>>Fhigh_ADC_cal_0
;
;   55: 	low_ADC_cal_1 = 0;	//ADCA_1 result when VREFLO is routed to its input 
;
              clr.l       X:>>Flow_ADC_cal_1
;
;   56: 	high_ADC_cal_1 = 0;	//ADCA_1 result when VREFH is routed to its input 
;
              clr.l       X:>>Fhigh_ADC_cal_1
;
;   57: 	for(i = 0; i < CANT_PROM; i++) 
;   58: 	{ 
;
              clr.w       X:(SP+>0)
              bra         <_L14_0	; *+6
;
;   59: 		CalibrateADC_simul(); 
;
_L14_1:
              jsr         >FCalibrateADC_simul
;
;   60: 	} 
;
              move.w      X:(SP),A
              add.w       #<1,A
              move.w      A1,X:(SP)
_L14_0:
              move.w      #<16,A
              cmp.w       X:(SP),A
              bgt         <_L14_1	; *-7
;
;   61: 	low_ADC_cal_0 /= CANT_PROM;	//ADCA_0 result when VREFLO is routed to its input 
;
              move.l      X:>>Flow_ADC_cal_0,A
              lsrr.l      #<4,A
              move.l      A10,X:>>Flow_ADC_cal_0
;
;   62: 	high_ADC_cal_0 /= CANT_PROM;	//ADCA_0 result when VREFH is routed to its input 
;
              move.l      X:>>Fhigh_ADC_cal_0,A
              lsrr.l      #<4,A
              move.l      A10,X:>>Fhigh_ADC_cal_0
;
;   63: 	low_ADC_cal_1 /= CANT_PROM;	//ADCA_1 result when VREFLO is routed to its input 
;
              move.l      X:>>Flow_ADC_cal_1,A
              lsrr.l      #<4,A
              move.l      A10,X:>>Flow_ADC_cal_1
;
;   64: 	high_ADC_cal_1 /= CANT_PROM;	//ADCA_1 result when VREFH is routed to its input 
;   65:  
;
              move.l      X:>>Fhigh_ADC_cal_1,A
              lsrr.l      #<4,A
              move.l      A10,X:>>Fhigh_ADC_cal_1
;
;   66: 	CalADC_Calc_m_and_b(); 
;   67: 	 
;
              jsr         >FCalADC_Calc_m_and_b
;
;   68: 	setRegBit( ADCA_ADCR1, START ); // single ended conversions 
;   69:  
;
              move.l      #$f200,R0
              bfset       #$2000,X:(R0)
;
;   70: 	lectAccAD0 = 0; 
;
              clr.l       X:>>FlectAccAD0
;
;   71: 	lectAccAD1 = 0; 
;
              clr.l       X:>>FlectAccAD1
;
;   72: } 
              suba        #<2,SP
              rts         
end_Finit_AD:

	ENDSEC

	SECTION AD

	ORG	P:

;
;   73: //-------------------------------------------------------------------------------------------- 
;   74:  
;   75:  
;   76: static void CalibrateADC_simul(void) 
;   77: { 
;   78: 	UInt16 save_ADCR1, save_ADSDIS; 
;   79:  
;
		subroutine "FCalibrateADC_simul",FCalibrateADC_simul,end_FCalibrateADC_simul-FCalibrateADC_simul
FCalibrateADC_simul:
              adda        #<2,SP
;
;   80: 	save_ADCR1 = getReg( ADCA_ADCR1 ); 
;
              move.l      #$f200,R0
              move.w      X:(R0),A
              move.w      A1,X:(SP)
;
;   81: 	save_ADSDIS = getReg( ADCA_ADSDIS ); 
;   82:  
;   83: 	/* ADCA_ADCR1: ??=0,STOP=1,START=0,SYNC=0,EOSIE=0,ZCIE=0,LLMTIE=0,HLMTIE=0,	CHNCFG=0,??=0,SMODE=1 */ 
;
              move.l      #$f205,R0
              move.w      X:(R0),A
              move.w      A1,X:(SP-1)
;
;   84: 	setReg(ADCA_ADCR1,0x4001);	// stop the current ADC operation, 
;   85: 								// set single ended mode, 
;   86: 								// once simultaneous operation 
;   87:  
;
              move.l      #$f200,R0
              move.w      #16385,X:(R0)
;
;   88: 	clrRegBit( ADCA_ADCR1, STOP );	// clear the stop bit so we can do 
;   89:  
;   90: 	//calibration 
;
              move.l      #$f200,R0
              bfclr       #$4000,X:(R0)
;
;   91: 	setReg( ADCA_CAL, 0x7 ); // cal_0 high, cal_1 low reference 
;   92:  
;
              move.l      #$f22a,R0
              move.w      #7,X:(R0)
;
;   93: 	setReg( ADCA_ADSDIS, 0xEE ); // enable Sample0 and Sample4, only 
;   94:  
;
              move.l      #$f205,R0
              move.w      #238,X:(R0)
;
;   95: 	setRegBit( ADCA_ADCR1, START ); // single ended conversions 
;
              move.l      #$f200,R0
              bfset       #$2000,X:(R0)
;
;   96: 	while ( !getRegBit( ADCA_ADSTAT, EOSI ) ); // wait for conversion to complete 
;
_L20_0:
              move.l      #$f206,R0
              move.w      X:(R0),A
              bftstl      #$800,A1
              bcs         <_L20_0	; *-6
;
;   97: 	setReg(ADCA_ADSTAT,0x0800); // Clear EOSI flag 
;   98:  
;   99: //	high_ADC_cal_0 = getReg( ADCA_ADRSLT0 ); 
;  100: //	low_ADC_cal_1 = getReg( ADCA_ADRSLT4 ); 
;
              move.l      #$f206,R0
              move.w      #2048,X:(R0)
;
;  101: 	high_ADC_cal_0 += ADCA_ADRSLT0; 
;
              move.l      #$f209,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>Fhigh_ADC_cal_0,A
              move.l      A10,X:>>Fhigh_ADC_cal_0
;
;  102: 	low_ADC_cal_1 += ADCA_ADRSLT4; 
;  103:  
;
              move.l      #$f20d,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>Flow_ADC_cal_1,A
              move.l      A10,X:>>Flow_ADC_cal_1
;
;  104: 	setReg( ADCA_CAL, 0xD );	// cal_0 low, cal_1 high reference 
;  105:  
;
              move.l      #$f22a,R0
              move.w      #13,X:(R0)
;
;  106: 	setRegBit( ADCA_ADCR1, START );	// single ended conversions 
;
              move.l      #$f200,R0
              bfset       #$2000,X:(R0)
;
;  107: 	while ( !getRegBit( ADCA_ADSTAT, EOSI ) );	// wait for conversion to complete 
;
_L20_1:
              move.l      #$f206,R0
              move.w      X:(R0),A
              bftstl      #$800,A1
              bcs         <_L20_1	; *-6
;
;  108: 	setReg(ADCA_ADSTAT,0x0800);	// Clear EOSI flag 
;  109:  
;  110: //	low_ADC_cal_0 = getReg( ADCA_ADRSLT0 ); 
;  111: //	high_ADC_cal_1 = getReg( ADCA_ADRSLT4 ); 
;
              move.l      #$f206,R0
              move.w      #2048,X:(R0)
;
;  112: 	low_ADC_cal_0 += ADCA_ADRSLT0; 
;
              move.l      #$f209,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>Flow_ADC_cal_0,A
              move.l      A10,X:>>Flow_ADC_cal_0
;
;  113: 	high_ADC_cal_1 += ADCA_ADRSLT4; 
;  114:  
;
              move.l      #$f20d,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>Fhigh_ADC_cal_1,A
              move.l      A10,X:>>Fhigh_ADC_cal_1
;
;  115: 	setReg( ADCA_CAL, 0 );	// return to normal ADC operation 
;  116:  
;
              move.l      #$f22a,R0
              move.w      #0,X:(R0)
;
;  117: 	setReg( ADCA_ADSDIS, save_ADSDIS );	// restore registers to previous mode of 
;
              move.l      #$f205,R0
              move.w      X:(SP-1),A
              move.w      A1,X:(R0)
;
;  118: 	setReg( ADCA_ADCR1, save_ADCR1 );	// operation 
;
              move.l      #$f200,R0
              move.w      X:(SP),A
              move.w      A1,X:(R0)
;
;  119: } 
              suba        #<2,SP
              rts         
end_FCalibrateADC_simul:

	ENDSEC

	SECTION AD

	ORG	P:

;
;  120: //-------------------------------------------------------------------------------------------- 
;  121:  
;  122:  
;  123: #define REF_HIGH 24570	//(4095 * 0.75) * 8 
;  124: #define REF_LOW 8190	//(4095 * 0.25) * 8 
;  125:  
;  126: static void CalADC_Calc_m_and_b( void ) 
;  127: { 
;  128:  
;  129: 	M0=(24568.0-8184.0)/(float)(high_ADC_cal_0-low_ADC_cal_0); 
;
		subroutine "FCalADC_Calc_m_and_b",FCalADC_Calc_m_and_b,end_FCalADC_Calc_m_and_b-FCalADC_Calc_m_and_b
FCalADC_Calc_m_and_b:
              move.l      X:>>Fhigh_ADC_cal_0,A
              sub.l       X:>>Flow_ADC_cal_0,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #$46800000,A
              jsr         >ARTDIVF32UZ
              move.l      A10,X:>>FM0
;
;  130: 	B0=24568-M0*(float)high_ADC_cal_0; 
;  131:  
;
              move.l      X:>>Fhigh_ADC_cal_0,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM0,A
              jsr         >ARTMPYF32U
              tfr         A,B
              move.l      #$46bff000,A
              jsr         >ARTSUBF32U
              jsr         >ARTF32_TO_U32U
              move.l      A10,X:>>FB0
;
;  132: 	M1=(24568.0-8184.0)/(float)(high_ADC_cal_1-low_ADC_cal_1); 
;
              move.l      X:>>Fhigh_ADC_cal_1,A
              sub.l       X:>>Flow_ADC_cal_1,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      #$46800000,A
              jsr         >ARTDIVF32UZ
              move.l      A10,X:>>FM1
;
;  133: 	B1=24568-M1*(float)high_ADC_cal_1; 
;
              move.l      X:>>Fhigh_ADC_cal_1,A
              jsr         >ARTU32_TO_F32
              tfr         A,B
              move.l      X:>>FM1,A
              jsr         >ARTMPYF32U
              tfr         A,B
              move.l      #$46bff000,A
              jsr         >ARTSUBF32U
              jsr         >ARTF32_TO_U32U
              move.l      A10,X:>>FB1
;
;  134: } 
              rts         
end_FCalADC_Calc_m_and_b:

	ENDSEC

	SECTION AD

	ORG	P:

;
;  135: //-------------------------------------------------------------------------------------------- 
;  136:  
;  137:  
;  138: void isrADCAConvCompl() 
;  139: { 
;  140: #pragma interrupt 
;  141:  
;
		subroutine "FisrADCAConvCompl",FisrADCAConvCompl,end_FisrADCAConvCompl-FisrADCAConvCompl
FisrADCAConvCompl:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      R0,X:(SP)+
              move.l      M01,X:(SP)+
              suba        #<2,SP
              bfset       #$ffff,M01
;
;  142: 	ACUM_ADCA_ADRSLT0 += (UInt32)ADCA_ADRSLT0; 
;
              move.l      #$f209,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT0,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT0
;
;  143: 	ACUM_ADCA_ADRSLT1 += (UInt32)ADCA_ADRSLT1; 
;
              move.l      #$f20a,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT1,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT1
;
;  144: 	ACUM_ADCA_ADRSLT2 += (UInt32)ADCA_ADRSLT2; 
;
              move.l      #$f20b,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT2,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT2
;
;  145: 	ACUM_ADCA_ADRSLT3 += (UInt32)ADCA_ADRSLT3; 
;
              move.l      #$f20c,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT3,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT3
;
;  146: 	ACUM_ADCA_ADRSLT4 += (UInt32)ADCA_ADRSLT4; 
;
              move.l      #$f20d,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT4,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT4
;
;  147: 	ACUM_ADCA_ADRSLT5 += (UInt32)ADCA_ADRSLT5; 
;
              move.l      #$f20e,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT5,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT5
;
;  148: 	ACUM_ADCA_ADRSLT6 += (UInt32)ADCA_ADRSLT6; 
;
              move.l      #$f20f,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT6,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT6
;
;  149: 	ACUM_ADCA_ADRSLT7 += (UInt32)ADCA_ADRSLT7; 
;  150: 	 
;
              move.l      #$f210,R0
              move.w      X:(R0),A
              lsrr.l      #<$10,A
              add.l       X:>>FACUM_ADCA_ADRSLT7,A
              move.l      A10,X:>>FACUM_ADCA_ADRSLT7
;
;  151: 	setRegBit(ADCA_ADSTAT,EOSI);	//clear EOSI flag 
;
              move.l      #$f206,R0
              bfset       #$800,X:(R0)
;
;  152: 	setRegBit( ADCA_ADCR1, START ); // single ended conversions 
;  153:  
;
              move.l      #$f200,R0
              bfset       #$2000,X:(R0)
;
;  154: } 
;
              move.l      X:(SP)-,M01
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrADCAConvCompl:

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		Flow_ADC_cal_0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		Fhigh_ADC_cal_0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		Flow_ADC_cal_1:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		Fhigh_ADC_cal_1:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FlectAccAD0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FlectAccAD1:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FM0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FB0:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FM1:	ds	2

	ENDSEC

	SECTION AD

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FB1:	ds	2

	ENDSEC


	END
