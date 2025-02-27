
	include "asmdef.h"

	SECTION TMR ; declarations
		global FtablaSen
	ENDSEC

	SECTION TMR ; declarations
		global Finit_Timer
		global FisrTimerA0
		global FisrTimerA1
		global FisrTimerA2
		global FisrTimerA3
		global FisrTimerC0
		global FisrTimerC1
		global FisrTimerC2
		global FisrTimerC3
	ENDSEC

	SECTION TMR ; declarations
		xref FTimerCumplido
	ENDSEC

	SECTION TMR

	ORG	X:

;			*** INITIALIZED DATA (.const.data.pmem) ***

			align 2
		FtablaSen:
			dc	$0000,$011E,$023C,$0359,$0477,$0594,$06B0,$07CD,$08E8,$0A03,$0B1D,$0C36,$0D4E,$0E65,$0F7B,$1090,$11A4,$12B6,$13C7,$14D6		; 0,286,572,857,1143,1428,1712,1997,2280,2563,2845,3126,3406,3685,3963,4240,4516,4790,5063,5334
			dc	$15E3,$16EF,$17F9,$1901,$1A08,$1B0C,$1C0E,$1D0E,$1E0B,$1F07,$1FFF,$20F6,$21EA,$22DB,$23C9,$24B5,$259E,$2684,$2766,$2846		; 5603,5871,6137,6401,6664,6924,7182,7438,7691,7943,8191,8438,8682,8923,9161,9397,9630,9860,10086,10310
			dc	$2923,$29FC,$2AD2,$2BA5,$2C75,$2D41,$2E09,$2ECE,$2F8F,$304C,$3106,$31BC,$326E,$331C,$33C6,$346C,$350E,$35AC,$3646,$36DB		; 10531,10748,10962,11173,11381,11585,11785,11982,12175,12364,12550,12732,12910,13084,13254,13420,13582,13740,13894,14043
			dc	$376C,$37F9,$3881,$3905,$3985,$3A00,$3A77,$3AE9,$3B56,$3BBF,$3C23,$3C82,$3CDD,$3D33,$3D84,$3DD1,$3E18,$3E5B,$3E99,$3ED2		; 14188,14329,14465,14597,14725,14848,14967,15081,15190,15295,15395,15490,15581,15667,15748,15825,15896,15963,16025,16082
			dc	$3F06,$3F35,$3F60,$3F85,$3FA5,$3FC1,$3FD7,$3FE9,$3FF5,$3FFD,$3FFF,$3FFD,$3FF5,$3FE9,$3FD7,$3FC1,$3FA5,$3F85,$3F60,$3F35		; 16134,16181,16224,16261,16293,16321,16343,16361,16373,16381,16383,16381,16373,16361,16343,16321,16293,16261,16224,16181
			dc	$3F06,$3ED2,$3E99,$3E5B,$3E18,$3DD1,$3D84,$3D33,$3CDD,$3C82,$3C23,$3BBF,$3B56,$3AE9,$3A77,$3A00,$3985,$3905,$3881,$37F9		; 16134,16082,16025,15963,15896,15825,15748,15667,15581,15490,15395,15295,15190,15081,14967,14848,14725,14597,14465,14329
			dc	$376C,$36DB,$3646,$35AC,$350E,$346C,$33C6,$331C,$326E,$31BC,$3106,$304C,$2F8F,$2ECE,$2E09,$2D41,$2C75,$2BA5,$2AD2,$29FC		; 14188,14043,13894,13740,13582,13420,13254,13084,12910,12732,12550,12364,12175,11982,11785,11585,11381,11173,10962,10748
			dc	$2923,$2846,$2766,$2684,$259E,$24B5,$23C9,$22DB,$21EA,$20F6,$1FFF,$1F07,$1E0B,$1D0E,$1C0E,$1B0C,$1A08,$1901,$17F9,$16EF		; 10531,10310,10086,9860,9630,9397,9161,8923,8682,8438,8191,7943,7691,7438,7182,6924,6664,6401,6137,5871
			dc	$15E3,$14D6,$13C7,$12B6,$11A4,$1090,$0F7B,$0E65,$0D4E,$0C36,$0B1D,$0A03,$08E8,$07CD,$06B0,$0594,$0477,$0359,$023C,$011E		; 5603,5334,5063,4790,4516,4240,3963,3685,3406,3126,2845,2563,2280,1997,1712,1428,1143,857,572,286
			dc	$0000,$FEE2,$FDC4,$FCA7,$FB89,$FA6C,$F950,$F833,$F718,$F5FD,$F4E3,$F3CA,$F2B2,$F19B,$F085,$EF70,$EE5C,$ED4A,$EC39,$EB2A		; 0,65250,64964,64679,64393,64108,63824,63539,63256,62973,62691,62410,62130,61851,61573,61296,61020,60746,60473,60202
			dc	$EA1D,$E911,$E807,$E6FF,$E5F8,$E4F4,$E3F2,$E2F2,$E1F5,$E0F9,$E000,$DF0A,$DE16,$DD25,$DC37,$DB4B,$DA62,$D97C,$D89A,$D7BA		; 59933,59665,59399,59135,58872,58612,58354,58098,57845,57593,57344,57098,56854,56613,56375,56139,55906,55676,55450,55226
			dc	$D6DD,$D604,$D52E,$D45B,$D38B,$D2BF,$D1F7,$D132,$D071,$CFB4,$CEFA,$CE44,$CD92,$CCE4,$CC3A,$CB94,$CAF2,$CA54,$C9BA,$C925		; 55005,54788,54574,54363,54155,53951,53751,53554,53361,53172,52986,52804,52626,52452,52282,52116,51954,51796,51642,51493
			dc	$C894,$C807,$C77F,$C6FB,$C67B,$C600,$C589,$C517,$C4AA,$C441,$C3DD,$C37E,$C323,$C2CD,$C27C,$C22F,$C1E8,$C1A5,$C167,$C12E		; 51348,51207,51071,50939,50811,50688,50569,50455,50346,50241,50141,50046,49955,49869,49788,49711,49640,49573,49511,49454
			dc	$C0FA,$C0CB,$C0A0,$C07B,$C05B,$C03F,$C029,$C017,$C00B,$C003,$C001,$C003,$C00B,$C017,$C029,$C03F,$C05B,$C07B,$C0A0,$C0CB		; 49402,49355,49312,49275,49243,49215,49193,49175,49163,49155,49153,49155,49163,49175,49193,49215,49243,49275,49312,49355
			dc	$C0FA,$C12E,$C167,$C1A5,$C1E8,$C22F,$C27C,$C2CD,$C323,$C37E,$C3DD,$C441,$C4AA,$C517,$C589,$C600,$C67B,$C6FB,$C77F,$C807		; 49402,49454,49511,49573,49640,49711,49788,49869,49955,50046,50141,50241,50346,50455,50569,50688,50811,50939,51071,51207
			dc	$C894,$C925,$C9BA,$CA54,$CAF2,$CB94,$CC3A,$CCE4,$CD92,$CE44,$CEFA,$CFB4,$D071,$D132,$D1F7,$D2BF,$D38B,$D45B,$D52E,$D604		; 51348,51493,51642,51796,51954,52116,52282,52452,52626,52804,52986,53172,53361,53554,53751,53951,54155,54363,54574,54788
			dc	$D6DD,$D7BA,$D89A,$D97C,$DA62,$DB4B,$DC37,$DD25,$DE16,$DF0A,$E001,$E0F9,$E1F5,$E2F2,$E3F2,$E4F4,$E5F8,$E6FF,$E807,$E911		; 55005,55226,55450,55676,55906,56139,56375,56613,56854,57098,57345,57593,57845,58098,58354,58612,58872,59135,59399,59665
			dc	$EA1D,$EB2A,$EC39,$ED4A,$EE5C,$EF70,$F085,$F19B,$F2B2,$F3CA,$F4E3,$F5FD,$F718,$F833,$F950,$FA6C,$FB89,$FCA7,$FDC4,$FEE2		; 59933,60202,60473,60746,61020,61296,61573,61851,62130,62410,62691,62973,63256,63539,63824,64108,64393,64679,64964,65250
	ENDSEC

	SECTION TMR

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FFASE:	ds	1

	ENDSEC

	SECTION TMR

	ORG	P:

;
;   70: 	TMRC2_CNTR = 0; 
;   71: 	setRegBitGroup(TMRC2_CTRL,CM,0x02); // Run counter  
;   72: */ 
;   73: 	//Seteo el Timer de Control 
;   74: 	setRegBitGroup(TMRC3_CTRL,PCS,0xF); 
;
		subroutine "Finit_Timer",Finit_Timer,end_Finit_Timer-Finit_Timer
Finit_Timer:
              move.l      #$f0f6,R1
              move.l      #$f0f6,R0
              move.w      X:(R0),B
              move.w      #-7681,A
              and.w       B,A
              bfset       #$1e00,A1
              move.w      A1,X:(R1)
;
;   75: 	setRegBit(TMRC3_CTRL,LENGTH); 
;
              move.l      #$f0f6,R0
              bfset       #$20,X:(R0)
;
;   76: 	setRegBitGroup(TMRC3_CTRL,OM,0x4); 
;
              move.l      #$f0f6,R1
              move.l      #$f0f6,R0
              move.w      X:(R0),A
              move.w      #>-8,B
              and.w       A,B
              move.w      #<4,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;   77: 	setRegBit(TMRC3_SCR,OPS); 
;
              move.l      #$f0f7,R0
              bfset       #2,X:(R0)
;
;   78: 	setRegBit(TMRC3_COMSCR,TCF1EN); 
;
              move.l      #$f0fa,R0
              bfset       #$40,X:(R0)
;
;   79: 	TMRC3_CMP1 = 3677;	//Frecuencia timer = 1Hz 
;
              move.l      #$f0f0,R0
              move.w      #3677,X:(R0)
;
;   80: 	TMRC3_CMP2 = 3677;	// 
;
              move.l      #$f0f1,R0
              move.w      #3677,X:(R0)
;
;   81: 	TMRC3_CNTR = 0; /* Reset counter register */ 
;
              move.l      #$f0f5,R0
              move.w      #0,X:(R0)
;
;   82: 	setRegBitGroup(TMRC3_CTRL,CM,0x01); /* Run counter */ 
;   83:  
;
              move.l      #$f0f6,R1
              move.l      #$f0f6,R0
              move.w      X:(R0),B
              move.w      #8191,A
              and.w       B,A
              bfset       #$2000,A1
              move.w      A1,X:(R1)
;
;   84: } 
;   85: //-------------------------------------------------------------------------------------------- 
;   86: // Change State (Simulation Mode, Real Mode) 
;   87: /*void Set_Stt_Timer(void) 
;   88: { 
;   89:  
;   90:     if(AeroGene.Status.dwrd & STAT_AEG_SIM_RPM) 
;   91:     { 
;   92: 		//Seteo el Timer de Control 
;   93: 		setRegBitGroup(TMRC2_CTRL,PCS,0xF); 
;   94: 		setRegBit(TMRC2_CTRL,LENGTH); 
;   95: 		setRegBitGroup(TMRC2_CTRL,OM,0x4); 
;   96: 	 
;   97: 		setRegBit(TMRC2_SCR,OPS); 
;   98:  
;   99: 		setRegBit(TMRC2_COMSCR,TCF1EN); 
;  100:  
;  101: 		TMRC2_CMP1 = 46874;	//Frecuencia timer = 5Hz 
;  102: 		TMRC2_CMP2 = 46874;	// 
;  103:  
;  104: 		TMRC2_CNTR = 0; // Reset counter register  
;  105:  
;  106: 		setRegBitGroup(TMRC2_CTRL,CM,0x01); // Run counter 
;  107:     } 
              rts         
end_Finit_Timer:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  108:     else 
;  109:     { 
;  110: 	    //Seteo el Timer para que me Interrumpa cuando venga un pulso  
;  111: 		setReg(TMRC2_CTRL,0x07A0); 
;  112: 		setReg(TMRC2_SCR,0x0000); 
;  113: 		setRegBit(TMRC2_SCR,IEFIE); 
;  114:     	setRegBit(TMRC2_COMSCR,TCF1); 
;  115:  		setRegBit(TMRC2_COMSCR,TCF1EN); 
;  116: 		TMRC2_CMP1 = 1; 
;  117: 		TMRC2_CNTR = 0; 
;  118: 		setRegBitGroup(TMRC2_CTRL,CM,0x02); // Run counter 
;  119:     } 
;  120:  
;  121:  
;  122: } 
;  123: */ 
;  124: //-------------------------------------------------------------------------------------------- 
;  125:  
;  126: void isrTimerA0(void) 
;  127: { 
;  128: #pragma interrupt 
;  129:  
;
		subroutine "FisrTimerA0",FisrTimerA0,end_FisrTimerA0-FisrTimerA0
FisrTimerA0:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      R0,X:(SP)
              adda        #<2,SP
;
;  130: float Factor=0; 
;
              move.l      #>>0,A
              move.l      A10,X:(SP)
;
;  131: 	clrRegBit(TMRA0_COMSCR,TCF1);	//Borro flag de interrupcion 
;  132: /* 
;  133:     AeroGene.Exita.Pos.dwrd+=360/AeroGene.Exita.PPT.dwrd; 
;  134:     AeroGene.Exita.Turn.dwrd+=AeroGene.Exita.Pos.dwrd/360; 
;  135:     AeroGene.Exita.Pos.dwrd%=360; 
;  136:     PWMA_PWMVAL0 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase1.dwrd)%360])+PWM_MED; 
;  137:    	PWMA_PWMVAL2 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase2.dwrd)%360])+PWM_MED; 
;  138:    	PWMA_PWMVAL4 = AeroGene.Exita.Out.Ten*(tablaSen[(AeroGene.Exita.Pos.dwrd+AeroGene.Fase3.dwrd)%360])+PWM_MED; 
;  139:    	setRegBit(PWMA_PMCTL, LDOK); 
;  140: */ 
;  141:      
;
              move.l      #$f04a,R0
              bfclr       #$10,X:(R0)
;
;  142: } 
              suba        #<2,SP
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrTimerA0:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  143: //-------------------------------------------------------------------------------------------- 
;  144: void isrTimerA1() 
;  145: { 
;  146: #pragma interrupt 
;
		subroutine "FisrTimerA1",FisrTimerA1,end_FisrTimerA1-FisrTimerA1
FisrTimerA1:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  147: 	clrRegBit(TMRA1_COMSCR,TCF1);	//Borro flag de interrupcion 
;
              move.l      #$f05a,R0
              bfclr       #$10,X:(R0)
;
;  148: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerA1:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  149: //-------------------------------------------------------------------------------------------- 
;  150: void isrTimerA2() 
;  151: { 
;  152: #pragma interrupt 
;  153:  
;
		subroutine "FisrTimerA2",FisrTimerA2,end_FisrTimerA2-FisrTimerA2
FisrTimerA2:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  154: 	clrRegBit(TMRA2_COMSCR,TCF1);	//Borro flag de interrupcion 
;  155:      
;
              move.l      #$f06a,R0
              bfclr       #$10,X:(R0)
;
;  156: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerA2:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  157: //-------------------------------------------------------------------------------------------- 
;  158: void isrTimerA3() 
;  159: { 
;  160: #pragma interrupt 
;  161:  
;
		subroutine "FisrTimerA3",FisrTimerA3,end_FisrTimerA3-FisrTimerA3
FisrTimerA3:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  162: 	clrRegBit(TMRA3_COMSCR,TCF1);	//Borro flag de interrupcion 
;  163:      
;
              move.l      #$f07a,R0
              bfclr       #$10,X:(R0)
;
;  164: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerA3:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  165: //-------------------------------------------------------------------------------------------- 
;  166: void isrTimerC0() 
;  167: { 
;  168: #pragma interrupt 
;  169:  
;  170:  
;
		subroutine "FisrTimerC0",FisrTimerC0,end_FisrTimerC0-FisrTimerC0
FisrTimerC0:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  171: 	clrRegBit(TMRC0_COMSCR,TCF1);	//Borro flag de interrupcion 
;  172:          
;
              move.l      #$f0ca,R0
              bfclr       #$10,X:(R0)
;
;  173: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerC0:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  174: //-------------------------------------------------------------------------------------------- 
;  175:  
;  176: void isrTimerC1() 
;  177: { 
;  178: #pragma interrupt 
;  179:  
;  180:  
;
		subroutine "FisrTimerC1",FisrTimerC1,end_FisrTimerC1-FisrTimerC1
FisrTimerC1:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  181: 	clrRegBit(TMRC1_COMSCR,TCF1); 
;  182: //    NumPulseTurn+=(2*AeroGene.Gen.PPT.dwrd); 
;  183:      
;
              move.l      #$f0da,R0
              bfclr       #$10,X:(R0)
;
;  184: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerC1:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  185: //-------------------------------------------------------------------------------------------- 
;  186:  
;  187: void isrTimerC2() 
;  188: { 
;  189: #pragma interrupt 
;  190:  
;
		subroutine "FisrTimerC2",FisrTimerC2,end_FisrTimerC2-FisrTimerC2
FisrTimerC2:
              adda        #<2,SP
              move.l      R0,X:(SP)
;
;  191: 	clrRegBit(TMRC2_COMSCR,TCF1); 
;  192: 	 
;  193:  
;
              move.l      #$f0ea,R0
              bfclr       #$10,X:(R0)
;
;  194: } 
              move.l      X:(SP)-,R0
              rti         
end_FisrTimerC2:

	ENDSEC

	SECTION TMR

	ORG	P:

;
;  195: //-------------------------------------------------------------------------------------------- 
;  196:  
;  197: void isrTimerC3() 
;  198: { 
;  199: #pragma interrupt 
;  200:  
;
		subroutine "FisrTimerC3",FisrTimerC3,end_FisrTimerC3-FisrTimerC3
FisrTimerC3:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      R0,X:(SP)
;
;  201: 	clrRegBit(TMRC3_COMSCR,TCF1); 
;
              move.l      #$f0fa,R0
              bfclr       #$10,X:(R0)
;
;  202:     TimerCumplido=TRUE; //Le informo que puede correr la logica de control      
;  203:       
;
              move.w      #<1,A
              move.bp     A1,X:>>@lb(FTimerCumplido)
;
;  204: } 
;
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrTimerC3:

	ENDSEC


	END
