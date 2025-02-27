
	include "asmdef.h"

	SECTION PWM ; declarations
		global Finit_PWM
		global FisrPWMA_RL
	ENDSEC

	SECTION PWM

	ORG	P:

;
;   11: //-------------------------------------------------------------------------------------------- 
;   12: // Chip is operating at 60 MHz 
;   13: void init_PWM(void) 
;   14: { 
;   15: 	PWMA_PMDISMAP1 = 0; 
;
		subroutine "Finit_PWM",Finit_PWM,end_Finit_PWM-Finit_PWM
Finit_PWM:
              move.l      #$f14d,R0
              move.w      #0,X:(R0)
;
;   16: 	PWMA_PMDISMAP2 = 0; 
;   17:  
;
              move.l      #$f14e,R0
              move.w      #0,X:(R0)
;
;   18: 	PWMA_PWMCM = PWM_MAX; 
;
              move.l      #$f145,R0
              move.w      #-32768,X:(R0)
;
;   19: 	PWMA_PWMVAL0 = 0; 
;
              move.l      #$f146,R0
              move.w      #0,X:(R0)
;
;   20: 	PWMA_PWMVAL1 = 0; 
;
              move.l      #$f147,R0
              move.w      #0,X:(R0)
;
;   21: 	PWMA_PWMVAL2 = 0; 
;
              move.l      #$f148,R0
              move.w      #0,X:(R0)
;
;   22: 	PWMA_PWMVAL3 = 0; 
;
              move.l      #$f149,R0
              move.w      #0,X:(R0)
;
;   23: 	PWMA_PWMVAL4 = 0; 
;
              move.l      #$f14a,R0
              move.w      #0,X:(R0)
;
;   24: 	PWMA_PWMVAL5 = 0; 
;   25:  
;
              move.l      #$f14b,R0
              move.w      #0,X:(R0)
;
;   26: 	setRegBit(PWMA_PMCFG, EDG); 
;
              move.l      #$f14f,R0
              bfset       #$1000,X:(R0)
;
;   27: 	clrRegBit(PWMA_PMCFG, TOPNEG01); 
;
              move.l      #$f14f,R0
              bfclr       #$100,X:(R0)
;
;   28: 	clrRegBit(PWMA_PMCFG, BOTNEG01); 
;
              move.l      #$f14f,R0
              bfclr       #$10,X:(R0)
;
;   29: 	clrRegBit(PWMA_PMCFG, INDEP01); 
;
              move.l      #$f14f,R0
              bfclr       #2,X:(R0)
;
;   30: 	clrRegBit(PWMA_PMCFG, TOPNEG23); 
;
              move.l      #$f14f,R0
              bfclr       #$200,X:(R0)
;
;   31: 	clrRegBit(PWMA_PMCFG, BOTNEG23); 
;
              move.l      #$f14f,R0
              bfclr       #$20,X:(R0)
;
;   32: 	clrRegBit(PWMA_PMCFG, INDEP23); 
;
              move.l      #$f14f,R0
              bfclr       #4,X:(R0)
;
;   33: 	clrRegBit(PWMA_PMCFG, TOPNEG45); 
;
              move.l      #$f14f,R0
              bfclr       #$400,X:(R0)
;
;   34: 	clrRegBit(PWMA_PMCFG, BOTNEG45); 
;
              move.l      #$f14f,R0
              bfclr       #$40,X:(R0)
;
;   35: 	clrRegBit(PWMA_PMCFG, INDEP45); 
;   36:  
;
              move.l      #$f14f,R0
              bfclr       #8,X:(R0)
;
;   37: 	setRegBit(PWMA_PMCCR, MSK); 
;
              move.l      #$f150,R0
              bfset       #$3f00,X:(R0)
;
;   38: 	clrRegBit(PWMA_PMCCR, MSK0); 
;
              move.l      #$f150,R0
              bfclr       #$100,X:(R0)
;
;   39: 	clrRegBit(PWMA_PMCCR, MSK1); 
;
              move.l      #$f150,R0
              bfclr       #$200,X:(R0)
;
;   40: 	clrRegBit(PWMA_PMCCR, MSK2); 
;
              move.l      #$f150,R0
              bfclr       #$400,X:(R0)
;
;   41: 	clrRegBit(PWMA_PMCCR, MSK3); 
;
              move.l      #$f150,R0
              bfclr       #$800,X:(R0)
;
;   42: 	clrRegBit(PWMA_PMCCR, MSK4); 
;
              move.l      #$f150,R0
              bfclr       #$1000,X:(R0)
;
;   43: 	clrRegBit(PWMA_PMCCR, MSK5); 
;   44:  
;
              move.l      #$f150,R0
              bfclr       #$2000,X:(R0)
;
;   45: 	PWMA_PMCTL; 
;
              move.l      #$f140,R0
              move.w      X:(R0),A
;
;   46: 	clrRegBit(PWMA_PMCTL, PRSC0); 
;
              move.l      #$f140,R0
              bfclr       #$40,X:(R0)
;
;   47: 	clrRegBit(PWMA_PMCTL, PRSC1); 
;   48: 	 
;
              move.l      #$f140,R0
              bfclr       #$80,X:(R0)
;
;   49: 	setRegBit(PWMA_PMCTL, LDOK); 
;   50:  
;
              move.l      #$f140,R0
              bfset       #2,X:(R0)
;
;   51: 	setRegBit(PWMA_PMOUT, PAD_EN); 
;   52:  
;
              move.l      #$f143,R0
              bfset       #$8000,X:(R0)
;
;   53: 	setRegBit(PWMA_PMCTL, PWMRIE); 
;   54:  
;
              move.l      #$f140,R0
              bfset       #$20,X:(R0)
;
;   55: 	setRegBit(PWMA_PMCTL, PWMEN); 
;   56:  
;
              move.l      #$f140,R0
              bfset       #1,X:(R0)
;
;   57: 	setRegBit(PWMA_PMCFG, WP); 
;
              move.l      #$f14f,R0
              bfset       #1,X:(R0)
;
;   58: } 
              rts         
end_Finit_PWM:

	ENDSEC

	SECTION PWM

	ORG	P:

;
;   59: //-------------------------------------------------------------------------------------------- 
;   60:  
;   61: void isrPWMA_RL() 
;   62: { 
;   63: #pragma interrupt 
;   64:  
;   65:  
;
		subroutine "FisrPWMA_RL",FisrPWMA_RL,end_FisrPWMA_RL-FisrPWMA_RL
FisrPWMA_RL:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      R0,X:(SP)+
              move.l      M01,X:(SP)+
              suba        #<2,SP
              bfset       #$ffff,M01
;
;   66: 	PWMA_PMCTL;						//Borro flag 
;
              move.l      #$f140,R0
              move.w      X:(R0),A
;
;   67: 	clrRegBit(PWMA_PMCTL, PWMF);	//de PWMA Reload 
;   68:  
;
              move.l      #$f140,R0
              bfclr       #$10,X:(R0)
;
;   69: } 
;
              move.l      X:(SP)-,M01
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrPWMA_RL:

	ENDSEC


	END
