
	include "asmdef.h"

	SECTION GPIO ; declarations
		global Finit_GPIO
	ENDSEC

	SECTION GPIO

	ORG	P:

;
;    1: #include "GPIO.h" 
;    2:  
;    3: void init_GPIO(void) 
;    4: { 
;    5: 	setRegBits(GPIO_A_PUR,    0x0000);	//Input Pull-Up is enable 
;
		subroutine "Finit_GPIO",Finit_GPIO,end_Finit_GPIO-Finit_GPIO
Finit_GPIO:
              move.l      #$f2e0,R0
              move.w      X:(R0),A
;
;    6: 	setRegBits(GPIO_A_DDR,    0x0FFF);	//Seteo como Salidas 
;
              move.l      #$f2e2,R0
              bfset       #$fff,X:(R0)
;
;    7: 	clrRegBits(GPIO_A_PER,    0x0FFF);	//Asigno pines a GPIO 
;
              move.l      #$f2e3,R0
              bfclr       #$fff,X:(R0)
;
;    8: 	clrRegBits(GPIO_A_IENR,   0xFFFF);	//Asigno pines a GPIO 
;    9:  
;   10:  
;   11:  
;
              move.l      #$f2e5,R0
              bfclr       #$ffff,X:(R0)
;
;   12: 	setRegBits(GPIO_B_PUR,    0x0000);	//Input Pull-Up is enable 
;
              move.l      #$f300,R0
              move.w      X:(R0),A
;
;   13: 	setRegBits(GPIO_B_DDR,    0x00F0);	//Seteo como Output 
;
              move.l      #$f302,R0
              bfset       #$f0,X:(R0)
;
;   14: 	clrRegBits(GPIO_B_PER,    0x00F0);	//Asigno pines a GPIO 
;   15:  
;   16:  
;
              move.l      #$f303,R0
              bfclr       #$f0,X:(R0)
;
;   17: 	setRegBits(GPIO_C_PUR,    0x0000);	//Input Pull-Up is enable 
;
              move.l      #$f310,R0
              move.w      X:(R0),A
;
;   18: 	setRegBits(GPIO_C_DDR,    0x001C);	//Seteo como Output 
;
              move.l      #$f312,R0
              bfset       #$1c,X:(R0)
;
;   19: 	clrRegBits(GPIO_C_PER,    0x001C);	//Asigno pines a GPIO 
;   20:  
;   21:  
;
              move.l      #$f313,R0
              bfclr       #$1c,X:(R0)
;
;   22: } 
;
              rts         
end_Finit_GPIO:

	ENDSEC


	END
