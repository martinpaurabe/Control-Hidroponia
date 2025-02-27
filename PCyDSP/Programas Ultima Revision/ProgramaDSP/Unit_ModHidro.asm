
	include "asmdef.h"

	SECTION Unit_ModHidro ; declarations
		global FModHidroFlash
	ENDSEC

	SECTION Unit_ModHidro ; declarations
		global FInit_Disp
	ENDSEC

	SECTION Unit_ModHidro ; declarations
		global FModHidro
	ENDSEC

	SECTION Unit_ModHidro ; declarations
		global FInc_Timer
		global FCtrl_Auto
		global FsciDataReceived
	ENDSEC

	SECTION Unit_ModHidro ; declarations
		xref FDataFlash_SetGlobalProtection
		xref FDataFlash_EraseFlash
		xref FDataFlash_SetBlockFlash
		xref FsendSciMsg
	ENDSEC

	SECTION Unit_ModHidro

	ORG	X:

;			*** INITIALIZED DATA (.const.data) ***

			align 2
		FModHidroFlash:
			dc	$6F4D,$7564,$6F6C,$4820,$3150,$0000,$55F0,$0000,$0000,$0000,$0000,$0000,$0000,$4170,$0000,$40C0,$0000,$4160,$0000,$0000		; 28493,30052,28524,18464,12624,0,22000,0,0,0,0,0,0,16752,0,16576,0,16736,0,0
			dc	$6590,$0000,$0000,$0000,$0000,$0000,$0000,$4100,$0000,$4120,$0000,$0000,$0000,$0000,$6590,$0000,$CCCD,$3DCC,$0000,$0000		; 26000,0,0,0,0,0,0,16640,0,16672,0,0,0,0,26000,0,52429,15820,0,0
			dc	$55F0,$0000,$0000,$0000,$0000,$0000,$0000,$41C8,$0000,$40C0,$0000,$4170,$0000,$0000,$6590,$0000,$0000,$0000,$0000,$0000		; 22000,0,0,0,0,0,0,16840,0,16576,0,16752,0,0,26000,0,0,0,0,0
			dc	$0000,$4190,$0000,$4120,$0000,$4120,$0000,$0000,$6590,$0000,$CCCD,$3DCC,$0000,$0000,$0000,$000C,$0000,$0007,$0000,$0014		; 0,16784,0,16672,0,16672,0,0,26000,0,52429,15820,0,0,0,12,0,7,0,20
			dc	$0000,$000C,$0000,$000E,$0005,$0000,$000A,$0000,$0A00,$0000,$0000,$0001,$0000,$0000,$0005,$0000,$000A,$0000,$0008,$0000		; 0,12,0,14,5,0,10,0,2560,0,0,1,0,0,5,0,10,0,8,0
			dc	$0000,$0004,$0200,$0000,$0005,$0000,$000A,$0000,$001E,$0000,$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000		; 0,4,512,0,5,0,10,0,30,0,0,1,5120,0,5,0,10,0,30,0
			dc	$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000,$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000		; 0,1,5120,0,5,0,10,0,30,0,0,1,5120,0,5,0,10,0,30,0
			dc	$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$0A00,$0000,$0000,$0001,$0000,$0000,$0005,$0000,$000A,$0000,$0008,$0000		; 0,1,5120,0,5,0,10,0,2560,0,0,1,0,0,5,0,10,0,8,0
			dc	$0000,$0004,$0200,$0000,$0005,$0000,$000A,$0000,$001E,$0000,$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000		; 0,4,512,0,5,0,10,0,30,0,0,1,5120,0,5,0,10,0,30,0
			dc	$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000,$0000,$0001,$1400,$0000,$0005,$0000,$000A,$0000,$001E,$0000		; 0,1,5120,0,5,0,10,0,30,0,0,1,5120,0,5,0,10,0,30,0
			dc	$0000,$0001,$1400,$0000,$0000,$0000,$0000,$0000		; 0,1,5120,0,0,0,0,0
	ENDSEC

	SECTION Unit_ModHidro

	ORG	P:

;
;  548: //-------------------------------------------------------------------------------------------------------------- 
;  549:  
;  550: void Init_Disp(void) 
;  551: { 
;  552:   ModHidro=ModHidroFlash; 
;  553:  
;  554: //Salidas que inician apagadas 
;
		subroutine "FInit_Disp",FInit_Disp,end_FInit_Disp-FInit_Disp
FInit_Disp:
              move.l      #>>FModHidro,R1
              move.l      #>>FModHidroFlash,R0
              move.w      #104,B
_L7_0:
              move.l      X:(R0)+,A
              move.l      A10,X:(R1)+
              dec.w       B
              bgt         <_L7_0	; *-3
;
;  555:   OutBbaMod1Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$40,X:(R0)
;
;  556:   OutBbaMod2Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
;  557:   OutBbaMod3Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
;  558:   OutBbaMod4Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$200,X:(R0)
;
;  559:   OutBbaMod5Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
;  560:   OutBbaMod6Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$800,X:(R0)
;
;  561:   OutBbaMod7Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$20,X:(R0)
;
;  562:   OutBbaMod8Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$10,X:(R0)
;
;  563:   OutBbaMod9Off; 
;
              move.l      #$f2e1,R0
              bfclr       #8,X:(R0)
;
;  564:   OutBbaMod10Off; 
;
              move.l      #$f2e1,R0
              bfclr       #4,X:(R0)
;
;  565:   OutBbaMod11Off; 
;
              move.l      #$f2e1,R0
              bfclr       #2,X:(R0)
;
;  566:   OutBbaMod12Off; 
;
              move.l      #$f2e1,R0
              bfclr       #1,X:(R0)
;
;  567:   OutLedWorkOff; 
;
              move.l      #$f311,R0
              bfclr       #8,X:(R0)
;
;  568:   OutLedErrorOff; 
;
              move.l      #$f311,R0
              bfclr       #$10,X:(R0)
;
;  569:   OutLedHoraOff; 
;
              move.l      #$f301,R0
              bfclr       #$10,X:(R0)
;
;  570:   OutLedMinutOff; 
;  571:  
;  572: //Salidas que inician encendidas 
;
              move.l      #$f301,R0
              bfclr       #$20,X:(R0)
;
;  573:   OutLedAutoOn; 
;
              move.l      #$f311,R0
              bfset       #4,X:(R0)
;
;  574:   ModHidro.Status.Stt1.dwrd |= STAT_MHI_MAN_AUT; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #8,X:(R0)
;
;  575:   OutLedWorkOn; 
;
              move.l      #$f311,R0
              bfset       #8,X:(R0)
;
;  576:   ModHidro.Status.Stt1.dwrd |= STAT_MHI_WRK_ON; 
;  577:     
;  578:     
;
              move.l      #>>FModHidro+204,R0
              bfset       #2,X:(R0)
;
;  579: } 
              rts         
end_FInit_Disp:

	ENDSEC

	SECTION Unit_ModHidro

	ORG	P:

;
;  580: //-------------------------------------------------------------------------------------------------------------- 
;  581: void Inc_Timer(void) 
;  582: { 
;  583:    
;  584:   //Actualizo el temporizador General 
;  585:   if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.seg>=60) 
;  586:   { 
;
		subroutine "FInc_Timer",FInc_Timer,end_FInc_Timer-FInc_Timer
FInc_Timer:
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_0	; *+50
;
;  587:   	ModHidro.Grp1Tmrs.TimerGral.Time.hms.seg=0; 
;
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  588:   	if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.min>=60) 
;  589:   	{ 
;
              move.l      #>>FModHidro+74,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_0	; *+29
;
;  590:   		ModHidro.Grp1Tmrs.TimerGral.Time.hms.min=0; 
;
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  591:   		if(++ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor>=24) 
;  592:   		{ 
;
              move.l      #>>FModHidro+74,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_0	; *+8
;
;  593:   			ModHidro.Grp1Tmrs.TimerGral.Time.hms.hor=0; 
;  594:   		} 
;  595:   		 
;  596:   	} 
;  597:  
;  598:   } 
;  599:    
;  600:   //Acualizo el temporizador del Modulo 1 
;
              move.l      #>>FModHidro+74,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  601:   if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.seg>=60) 
;  602:   { 
;
_L13_0:
              move.l      #>>FModHidro+92,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_1	; *+50
;
;  603:   	ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+92,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  604:   	if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.min>=60) 
;  605:   	{ 
;
              move.l      #>>FModHidro+92,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_1	; *+29
;
;  606:   		ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+92,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  607:   		if(++ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.hor>=24) 
;  608:   		{ 
;
              move.l      #>>FModHidro+92,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_1	; *+8
;
;  609:   			ModHidro.Grp1Tmrs.TimerMod1.Timer.hms.hor=0; 
;  610:   		} 
;  611:   		 
;  612:   	} 
;  613:   } 
;
              move.l      #>>FModHidro+92,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  614:   if(ModHidro.Grp1Tmrs.TimerMod1.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd) 
;
_L13_1:
              move.l      #>>FModHidro+90,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+92,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_2	; *+5
;
;  615:   	ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd=0; 
;  616:    
;  617:    
;  618:   //Acualizo el temporizador del Modulo 2 
;
              move.l      #>>FModHidro+92,R0
              clr.l       X:(R0)
;
;  619:   if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.seg>=60) 
;  620:   { 
;
_L13_2:
              move.l      #>>FModHidro+102,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_3	; *+50
;
;  621:   	ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+102,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  622:   	if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.min>=60) 
;  623:   	{ 
;
              move.l      #>>FModHidro+102,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_3	; *+29
;
;  624:   		ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+102,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  625:   		if(++ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.hor>=24) 
;  626:   		{ 
;
              move.l      #>>FModHidro+102,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_3	; *+8
;
;  627:   			ModHidro.Grp1Tmrs.TimerMod2.Timer.hms.hor=0; 
;  628:   		} 
;  629:   		 
;  630:   	} 
;  631:   } 
;
              move.l      #>>FModHidro+102,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  632:   if(ModHidro.Grp1Tmrs.TimerMod2.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd) 
;
_L13_3:
              move.l      #>>FModHidro+100,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+102,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_4	; *+5
;
;  633:   	ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd=0; 
;  634:  
;  635:  
;  636:   //Acualizo el temporizador del Modulo 3 
;
              move.l      #>>FModHidro+102,R0
              clr.l       X:(R0)
;
;  637:   if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.seg>=60) 
;  638:   { 
;
_L13_4:
              move.l      #>>FModHidro+112,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_5	; *+50
;
;  639:   	ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+112,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  640:   	if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.min>=60) 
;  641:   	{ 
;
              move.l      #>>FModHidro+112,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_5	; *+29
;
;  642:   		ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+112,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  643:   		if(++ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.hor>=24) 
;  644:   		{ 
;
              move.l      #>>FModHidro+112,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_5	; *+8
;
;  645:   			ModHidro.Grp1Tmrs.TimerMod3.Timer.hms.hor=0; 
;  646:   		} 
;  647:   		 
;  648:   	} 
;  649:   } 
;
              move.l      #>>FModHidro+112,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  650:   if(ModHidro.Grp1Tmrs.TimerMod3.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd) 
;
_L13_5:
              move.l      #>>FModHidro+110,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+112,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_6	; *+5
;
;  651:   	ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd=0; 
;  652:  
;  653:   
;  654:   
;  655:   //Acualizo el temporizador del Modulo 4 
;
              move.l      #>>FModHidro+112,R0
              clr.l       X:(R0)
;
;  656:   if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.seg>=60) 
;  657:   { 
;
_L13_6:
              move.l      #>>_L13_1,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_7	; *+50
;
;  658:   	ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.seg=0; 
;
              move.l      #>>_L13_1,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  659:   	if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.min>=60) 
;  660:   	{ 
;
              move.l      #>>_L13_1,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_7	; *+29
;
;  661:   		ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.min=0; 
;
              move.l      #>>_L13_1,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  662:   		if(++ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.hor>=24) 
;  663:   		{ 
;
              move.l      #>>_L13_1,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_7	; *+8
;
;  664:   			ModHidro.Grp1Tmrs.TimerMod4.Timer.hms.hor=0; 
;  665:   		} 
;  666:   		 
;  667:   	} 
;  668:   } 
;
              move.l      #>>_L13_1,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  669:   if(ModHidro.Grp1Tmrs.TimerMod4.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd) 
;
_L13_7:
              move.l      #>>FModHidro+120,R0
              move.l      X:(R0),B
              move.l      #>>_L13_1,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_8	; *+5
;
;  670:   	ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd=0; 
;  671:  
;  672:  
;  673:   //Acualizo el temporizador del Modulo 5 
;
              move.l      #>>_L13_1,R0
              clr.l       X:(R0)
;
;  674:   if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.seg>=60) 
;  675:   { 
;
_L13_8:
              move.l      #>>FModHidro+132,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_9	; *+50
;
;  676:   	ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+132,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  677:   	if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.min>=60) 
;  678:   	{ 
;
              move.l      #>>FModHidro+132,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_9	; *+29
;
;  679:   		ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+132,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  680:   		if(++ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.hor>=24) 
;  681:   		{ 
;
              move.l      #>>FModHidro+132,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_9	; *+8
;
;  682:   			ModHidro.Grp1Tmrs.TimerMod5.Timer.hms.hor=0; 
;  683:   		} 
;  684:   		 
;  685:   	} 
;  686:   } 
;
              move.l      #>>FModHidro+132,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  687:   if(ModHidro.Grp1Tmrs.TimerMod5.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd) 
;
_L13_9:
              move.l      #>>FModHidro+130,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+132,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_10	; *+5
;
;  688:   	ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd=0; 
;  689:  
;  690:  
;  691:   //Acualizo el temporizador del Modulo 6 
;
              move.l      #>>FModHidro+132,R0
              clr.l       X:(R0)
;
;  692:   if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.seg>=60) 
;  693:   { 
;
_L13_10:
              move.l      #>>FModHidro+142,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_11	; *+50
;
;  694:   	ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+142,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  695:   	if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.min>=60) 
;  696:   	{ 
;
              move.l      #>>FModHidro+142,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_11	; *+29
;
;  697:   		ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+142,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  698:   		if(++ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.hor>=24) 
;  699:   		{ 
;
              move.l      #>>FModHidro+142,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_11	; *+8
;
;  700:   			ModHidro.Grp1Tmrs.TimerMod6.Timer.hms.hor=0; 
;  701:   		} 
;  702:   		 
;  703:   	} 
;  704:   } 
;
              move.l      #>>FModHidro+142,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  705:   if(ModHidro.Grp1Tmrs.TimerMod6.Frec.ttl.dwrd<=ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd) 
;
_L13_11:
              move.l      #>>FModHidro+140,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+142,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_12	; *+5
;
;  706:   	ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd=0; 
;  707:  
;  708:   
;  709:   //Acualizo el temporizador del Modulo 7 
;
              move.l      #>>FModHidro+142,R0
              clr.l       X:(R0)
;
;  710:   if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.seg>=60) 
;  711:   { 
;
_L13_12:
              move.l      #>>FModHidro+152,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_13	; *+50
;
;  712:   	ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+152,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  713:   	if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.min>=60) 
;  714:   	{ 
;
              move.l      #>>FModHidro+152,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_13	; *+29
;
;  715:   		ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+152,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  716:   		if(++ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.hor>=24) 
;  717:   		{ 
;
              move.l      #>>FModHidro+152,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_13	; *+8
;
;  718:   			ModHidro.Grp2Tmrs.TimerMod7.Timer.hms.hor=0; 
;  719:   		} 
;  720:   		 
;  721:   	} 
;  722:   } 
;
              move.l      #>>FModHidro+152,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  723:   if(ModHidro.Grp2Tmrs.TimerMod7.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd) 
;
_L13_13:
              move.l      #>>FModHidro+150,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+152,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_14	; *+5
;
;  724:   	ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd=0; 
;  725:  
;  726:   
;  727:   //Acualizo el temporizador del Modulo 8 
;
              move.l      #>>FModHidro+152,R0
              clr.l       X:(R0)
;
;  728:   if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.seg>=60) 
;  729:   { 
;
_L13_14:
              move.l      #>>FModHidro+162,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_15	; *+50
;
;  730:   	ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+162,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  731:   	if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.min>=60) 
;  732:   	{ 
;
              move.l      #>>FModHidro+162,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_15	; *+29
;
;  733:   		ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+162,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  734:   		if(++ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.hor>=24) 
;  735:   		{ 
;
              move.l      #>>FModHidro+162,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_15	; *+8
;
;  736:   			ModHidro.Grp2Tmrs.TimerMod8.Timer.hms.hor=0; 
;  737:   		} 
;  738:   		 
;  739:   	} 
;  740:   } 
;
              move.l      #>>FModHidro+162,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  741:   if(ModHidro.Grp2Tmrs.TimerMod8.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd) 
;
_L13_15:
              move.l      #>>FModHidro+160,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+162,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_16	; *+5
;
;  742:   	ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd=0; 
;  743:  
;  744:   
;  745:   //Acualizo el temporizador del Modulo 9 
;
              move.l      #>>FModHidro+162,R0
              clr.l       X:(R0)
;
;  746:   if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.seg>=60) 
;  747:   { 
;
_L13_16:
              move.l      #>>FModHidro+172,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_17	; *+50
;
;  748:   	ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+172,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  749:   	if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.min>=60) 
;  750:   	{ 
;
              move.l      #>>FModHidro+172,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_17	; *+29
;
;  751:   		ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+172,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  752:   		if(++ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.hor>=24) 
;  753:   		{ 
;
              move.l      #>>FModHidro+172,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_17	; *+8
;
;  754:   			ModHidro.Grp2Tmrs.TimerMod9.Timer.hms.hor=0; 
;  755:   		} 
;  756:   		 
;  757:   	} 
;  758:   } 
;
              move.l      #>>FModHidro+172,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  759:   if(ModHidro.Grp2Tmrs.TimerMod9.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd) 
;
_L13_17:
              move.l      #>>FModHidro+170,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+172,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_18	; *+5
;
;  760:   	ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd=0; 
;  761:  
;  762:   
;  763:   //Acualizo el temporizador del Modulo 10 
;
              move.l      #>>FModHidro+172,R0
              clr.l       X:(R0)
;
;  764:   if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.seg>=60) 
;  765:   { 
;
_L13_18:
              move.l      #>>FModHidro+182,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_19	; *+50
;
;  766:   	ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+182,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  767:   	if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.min>=60) 
;  768:   	{ 
;
              move.l      #>>FModHidro+182,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_19	; *+29
;
;  769:   		ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+182,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  770:   		if(++ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.hor>=24) 
;  771:   		{ 
;
              move.l      #>>FModHidro+182,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_19	; *+8
;
;  772:   			ModHidro.Grp2Tmrs.TimerMod10.Timer.hms.hor=0; 
;  773:   		} 
;  774:   		 
;  775:   	} 
;  776:   } 
;
              move.l      #>>FModHidro+182,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  777:   if(ModHidro.Grp2Tmrs.TimerMod10.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd) 
;
_L13_19:
              move.l      #>>FModHidro+180,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+182,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_20	; *+5
;
;  778:   	ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd=0; 
;  779:  
;  780:   
;  781:   //Acualizo el temporizador del Modulo 11 
;
              move.l      #>>FModHidro+182,R0
              clr.l       X:(R0)
;
;  782:   if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.seg>=60) 
;  783:   { 
;
_L13_20:
              move.l      #>>FModHidro+192,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_21	; *+50
;
;  784:   	ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+192,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  785:   	if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.min>=60) 
;  786:   	{ 
;
              move.l      #>>FModHidro+192,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_21	; *+29
;
;  787:   		ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+192,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  788:   		if(++ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.hor>=24) 
;  789:   		{ 
;
              move.l      #>>FModHidro+192,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_21	; *+8
;
;  790:   			ModHidro.Grp2Tmrs.TimerMod11.Timer.hms.hor=0; 
;  791:   		} 
;  792:   		 
;  793:   	} 
;  794:   } 
;
              move.l      #>>FModHidro+192,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  795:   if(ModHidro.Grp2Tmrs.TimerMod11.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd) 
;
_L13_21:
              move.l      #>>FModHidro+190,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+192,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_22	; *+5
;
;  796:   	ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd=0; 
;  797:  
;  798:   
;  799:   //Acualizo el temporizador del Modulo 12 
;
              move.l      #>>FModHidro+192,R0
              clr.l       X:(R0)
;
;  800:   if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.seg>=60) 
;  801:   { 
;
_L13_22:
              move.l      #>>FModHidro+202,R0
              asla        R0,R0
              moveu.bp    X:(R0),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R0)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_23	; *+50
;
;  802:   	ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.seg=0; 
;
              move.l      #>>FModHidro+202,R0
              asla        R0,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  803:   	if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.min>=60) 
;  804:   	{ 
;
              move.l      #>>FModHidro+202,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<1,R0
              moveu.bp    X:(R0),B
              adda        #<1,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #60,B
              bcs         <_L13_23	; *+29
;
;  805:   		ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.min=0; 
;
              move.l      #>>FModHidro+202,R0
              asla        R0,R0
              adda        #<1,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  806:   		if(++ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.hor>=24) 
;  807:   		{ 
;
              move.l      #>>FModHidro+202,R0
              asla        R0,R1
              tfra        R1,R0
              adda        #<2,R0
              moveu.bp    X:(R0),B
              adda        #<2,R1
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:(R1)
              add.w       #<1,B
              cmp.b       #<$18,B
              bcs         <_L13_23	; *+8
;
;  808:   			ModHidro.Grp2Tmrs.TimerMod12.Timer.hms.hor=0; 
;  809:   		} 
;  810:   		 
;  811:   	} 
;  812:   } 
;
              move.l      #>>FModHidro+202,R0
              asla        R0,R0
              adda        #<2,R0
              move.w      #<0,A
              move.bp     A1,X:(R0)
;
;  813:   if(ModHidro.Grp2Tmrs.TimerMod12.Frec.ttl.dwrd<=ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd) 
;
_L13_23:
              move.l      #>>FModHidro+200,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+202,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcs         <_L13_24	; *+5
;
;  814:   	ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd=0; 
;  815:  
;  816:  
;
              move.l      #>>FModHidro+202,R0
              clr.l       X:(R0)
;
;  817: }   
_L13_24:
              rts         
end_FInc_Timer:

	ENDSEC

	SECTION Unit_ModHidro

	ORG	P:

;
;  818:    
;  819: //-------------------------------------------------------------------------------------------------------------- 
;  820: void Ctrl_Auto(void) 
;  821: { 
;  822:  
;  823:   //Me fijo si esta en horario de operacion del control 
;  824:   if((ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.IniDia.ttl.dwrd)&&(ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.FinDia.ttl.dwrd) && !((ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.IniMed.ttl.dwrd)&&(ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.FinMed.ttl.dwrd))) 
;  825:   { 
;  826:     //Si esta en horario de operacion actualizo las salidas de acuerdo al control 
;  827:     //Actualizo control de Modulo 1 
;
		subroutine "FCtrl_Auto",FCtrl_Auto,end_FCtrl_Auto-FCtrl_Auto
FCtrl_Auto:
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+76,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         >_L19_0	; *+1023
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+78,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         >_L19_0	; *+1012
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+80,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_1	; *+12
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+82,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         >_L19_0	; *+991
;
;  828: 	if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD1_INTER) 
;  829:   	{ 
;
_L19_1:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #1024,A
              and.l       B,A
              tst.l       A
              beq         <_L19_2	; *+33
;
;  830:   	  if(ModHidro.Grp1Tmrs.TimerMod1.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod1.Timer.ttl.dwrd) 
;  831:   	  { 
;
              move.l      #>>FModHidro+88,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+92,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_3	; *+12
;
;  832:     	OutBbaMod1On; 
;
              move.l      #$f2e1,R0
              bfset       #$40,X:(R0)
;
;  833:   		ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$10,X:(R0)
;
;  834:   	  } 
;  835:   	  else 
;  836:   	  { 
;
              bra         <_L19_4	; *+53
;
;  837:    		OutBbaMod1Off; 
;
_L19_3:
              move.l      #$f2e1,R0
              bfclr       #$40,X:(R0)
;
;  838:   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1; 
;  839:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$10,X:(R0)
;
;  840:     } 
;  841:     else 
;  842:     { 
;
              bra         <_L19_4	; *+42
;
;  843:   	  if((ModHidro.Grp1Tmrs.TimerMod1.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod1.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
;  844:   	  { 
;
_L19_2:
              move.l      #>>_L19_2,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_5	; *+22
              move.l      #>>FModHidro+86,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_5	; *+12
;
;  845:     	OutBbaMod1On; 
;
              move.l      #$f2e1,R0
              bfset       #$40,X:(R0)
;
;  846:   		ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1; 
;  847:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$10,X:(R0)
;
;  848:   	  } 
;  849:   	  else 
;  850:   	  { 
;
              bra         <_L19_4	; *+11
;
;  851:     	OutBbaMod1Off; 
;
_L19_5:
              move.l      #$f2e1,R0
              bfclr       #$40,X:(R0)
;
;  852:   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1; 
;  853:   	  }	 
;  854:  	 
;  855:     } 
;  856:   	 
;  857:     //Actualizo control de Modulo 2 
;  858:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$10,X:(R0)
;
;  859:     if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD2_INTER) 
;  860:     { 
;
_L19_4:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #2048,A
              and.l       B,A
              tst.l       A
              beq         <_L19_6	; *+33
;
;  861:   	  if(ModHidro.Grp1Tmrs.TimerMod2.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod2.Timer.ttl.dwrd) 
;  862:   	  { 
;
              move.l      #>>FModHidro+98,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+102,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_7	; *+12
;
;  863:    		OutBbaMod2On; 
;
              move.l      #$f2e1,R0
              bfset       #$80,X:(R0)
;
;  864:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$20,X:(R0)
;
;  865:   	  } 
;  866:   	  else 
;  867:   	  { 
;
              bra         <_L19_8	; *+53
;
;  868:    		OutBbaMod2Off; 
;
_L19_7:
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
;  869:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2; 
;  870:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$20,X:(R0)
;
;  871:     } 
;  872:     else 
;  873:     { 
;
              bra         <_L19_8	; *+42
;
;  874:   	  if((ModHidro.Grp1Tmrs.TimerMod2.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod2.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
;  875:   	  { 
;
_L19_6:
              move.l      #>>FModHidro+94,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_9	; *+22
              move.l      #>>FModHidro+96,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_9	; *+12
;
;  876:    		OutBbaMod2On; 
;
              move.l      #$f2e1,R0
              bfset       #$80,X:(R0)
;
;  877:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2; 
;  878:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$20,X:(R0)
;
;  879:   	  } 
;  880:    	  else 
;  881:   	  { 
;
              bra         <_L19_8	; *+11
;
;  882:    		OutBbaMod2Off; 
;
_L19_9:
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
;  883:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2; 
;  884:   	  }	 
;  885:  	 
;  886:     } 
;  887:    
;  888:     //Actualizo control de Modulo 3 
;  889:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$20,X:(R0)
;
;  890:     if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD3_INTER) 
;  891:     { 
;
_L19_8:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #4096,A
              and.l       B,A
              tst.l       A
              beq         <_L19_10	; *+33
;
;  892:   	  if(ModHidro.Grp1Tmrs.TimerMod3.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod3.Timer.ttl.dwrd) 
;  893:   	  { 
;
              move.l      #>>FModHidro+108,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+112,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_11	; *+12
;
;  894:    		OutBbaMod3On; 
;
              move.l      #$f2e1,R0
              bfset       #$100,X:(R0)
;
;  895:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$40,X:(R0)
;
;  896:   	  } 
;  897:   	  else 
;  898:   	  { 
;
              bra         <_L19_12	; *+53
;
;  899:    		OutBbaMod3Off; 
;
_L19_11:
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
;  900:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3; 
;  901:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$40,X:(R0)
;
;  902:     } 
;  903:     else 
;  904:     { 
;
              bra         <_L19_12	; *+42
;
;  905:   	  if((ModHidro.Grp1Tmrs.TimerMod3.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod3.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
;  906:   	  { 
;
_L19_10:
              move.l      #>>FModHidro+104,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_13	; *+22
              move.l      #>>FModHidro+106,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_13	; *+12
;
;  907:    		OutBbaMod3On; 
;
              move.l      #$f2e1,R0
              bfset       #$100,X:(R0)
;
;  908:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3; 
;  909:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$40,X:(R0)
;
;  910:   	  } 
;  911:    	  else 
;  912:   	  { 
;
              bra         <_L19_12	; *+11
;
;  913:    		OutBbaMod3Off; 
;
_L19_13:
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
;  914:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3; 
;  915:   	  }	 
;  916:  	 
;  917:     } 
;  918:      
;  919:  
;  920:     //Actualizo control de Modulo 4 
;  921:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$40,X:(R0)
;
;  922:     if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD4_INTER) 
;  923:     { 
;
_L19_12:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #8192,A
              and.l       B,A
              tst.l       A
              beq         <_L19_14	; *+33
;
;  924:   	  if(ModHidro.Grp1Tmrs.TimerMod4.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod4.Timer.ttl.dwrd) 
;  925:   	  { 
;
              move.l      #>>FModHidro+118,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+122,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_15	; *+12
;
;  926:    		OutBbaMod4On; 
;
              move.l      #$f2e1,R0
              bfset       #$200,X:(R0)
;
;  927:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$80,X:(R0)
;
;  928:   	  } 
;  929:   	  else 
;  930:   	  { 
;
              bra         <_L19_16	; *+53
;
;  931:    		OutBbaMod4Off; 
;
_L19_15:
              move.l      #$f2e1,R0
              bfclr       #$200,X:(R0)
;
;  932:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4; 
;  933:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$80,X:(R0)
;
;  934:     } 
;  935:     else 
;  936:     { 
;
              bra         <_L19_16	; *+42
;
;  937:   	  if((ModHidro.Grp1Tmrs.TimerMod4.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod4.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
;  938:   	  { 
;
_L19_14:
              move.l      #>>FModHidro+114,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_17	; *+22
              move.l      #>>FModHidro+116,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_17	; *+12
;
;  939:    		OutBbaMod4On; 
;
              move.l      #$f2e1,R0
              bfset       #$200,X:(R0)
;
;  940:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4; 
;  941:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$80,X:(R0)
;
;  942:   	  } 
;  943:    	  else 
;  944:   	  { 
;
              bra         <_L19_16	; *+11
;
;  945:    		OutBbaMod4Off; 
;
_L19_17:
              move.l      #$f2e1,R0
              bfclr       #$200,X:(R0)
;
;  946:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4; 
;  947:   	  }	 
;  948:  	 
;  949:     } 
;  950:  
;  951:  
;  952:  
;  953:     //Actualizo control de Modulo 5 
;  954:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$80,X:(R0)
;
;  955:     if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD5_INTER) 
;  956:     { 
;
_L19_16:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #16384,A
              and.l       B,A
              tst.l       A
              beq         <_L19_18	; *+33
;
;  957:   	  if(ModHidro.Grp1Tmrs.TimerMod5.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod5.Timer.ttl.dwrd) 
;  958:   	  { 
;
              move.l      #>>FModHidro+128,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+132,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_19	; *+12
;
;  959:    		OutBbaMod5On; 
;
              move.l      #$f2e1,R0
              bfset       #$400,X:(R0)
;
;  960:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$100,X:(R0)
;
;  961:   	  } 
;  962:   	  else 
;  963:   	  { 
;
              bra         <_L19_20	; *+53
;
;  964:    		OutBbaMod5Off; 
;
_L19_19:
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
;  965:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5; 
;  966:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$100,X:(R0)
;
;  967:     } 
;  968:     else 
;  969:     { 
;
              bra         <_L19_20	; *+42
;
;  970:   	  if((ModHidro.Grp1Tmrs.TimerMod5.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod5.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
;  971:   	  { 
;
_L19_18:
              move.l      #>>FModHidro+124,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_21	; *+22
              move.l      #>>FModHidro+126,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_21	; *+12
;
;  972:    		OutBbaMod5On; 
;
              move.l      #$f2e1,R0
              bfset       #$400,X:(R0)
;
;  973:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5; 
;  974:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$100,X:(R0)
;
;  975:   	  } 
;  976:    	  else 
;  977:   	  { 
;
              bra         <_L19_20	; *+11
;
;  978:    		OutBbaMod5Off; 
;
_L19_21:
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
;  979:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5; 
;  980:   	  }	 
;  981:  	 
;  982:     } 
;  983:  
;  984:  
;  985:  
;  986:     //Actualizo control de Modulo 6 
;  987:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$100,X:(R0)
;
;  988:     if(ModHidro.Status.Stt1.dwrd & STAT_MHI_MOD6_INTER) 
;  989:     { 
;
_L19_20:
              move.l      #>>FModHidro+204,R0
              move.l      X:(R0),B
              move.l      #-32768,A
              and.l       B,A
              tst.l       A
              beq         <_L19_22	; *+33
;
;  990:   	  if(ModHidro.Grp1Tmrs.TimerMod6.TimeOn.ttl.dwrd>=ModHidro.Grp1Tmrs.TimerMod6.Timer.ttl.dwrd) 
;  991:   	  { 
;
              move.l      #>>FModHidro+138,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+142,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_23	; *+12
;
;  992:    		OutBbaMod6On; 
;
              move.l      #$f2e1,R0
              bfset       #$800,X:(R0)
;
;  993:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$200,X:(R0)
;
;  994:   	  } 
;  995:   	  else 
;  996:   	  { 
;
              bra         <_L19_24	; *+53
;
;  997:    		OutBbaMod6Off; 
;
_L19_23:
              move.l      #$f2e1,R0
              bfclr       #$800,X:(R0)
;
;  998:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6; 
;  999:   	  } 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$200,X:(R0)
;
; 1000:     } 
; 1001:     else 
; 1002:     { 
;
              bra         <_L19_24	; *+42
;
; 1003:   	  if((ModHidro.Grp1Tmrs.TimerMod6.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp1Tmrs.TimerMod6.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1004:   	  { 
;
_L19_22:
              move.l      #>>FModHidro+134,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_25	; *+22
              move.l      #>>FModHidro+136,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_25	; *+12
;
; 1005:    		OutBbaMod6On; 
;
              move.l      #$f2e1,R0
              bfset       #$800,X:(R0)
;
; 1006:    		ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6; 
; 1007:   	 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$200,X:(R0)
;
; 1008:   	  } 
; 1009:    	  else 
; 1010:   	  { 
;
              bra         <_L19_24	; *+11
;
; 1011:    		OutBbaMod6Off; 
;
_L19_25:
              move.l      #$f2e1,R0
              bfclr       #$800,X:(R0)
;
; 1012:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6; 
; 1013:   	  }	 
; 1014:  	 
; 1015:     } 
; 1016:  
; 1017:  
; 1018:  
; 1019:     //Actualizo control de Modulo 7 
; 1020:    
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$200,X:(R0)
;
; 1021:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD7_INTER) 
; 1022:     { 
;
_L19_24:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #1024,A
              and.l       B,A
              tst.l       A
              beq         <_L19_26	; *+33
;
; 1023:   	  if(ModHidro.Grp2Tmrs.TimerMod7.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod7.Timer.ttl.dwrd) 
; 1024:   	  { 
;
              move.l      #>>FModHidro+148,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+152,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_27	; *+12
;
; 1025:    		OutBbaMod7On; 
;
              move.l      #$f2e1,R0
              bfset       #$20,X:(R0)
;
; 1026:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD7; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$10,X:(R0)
;
; 1027:   	  } 
; 1028:   	  else 
; 1029:   	  { 
;
              bra         <_L19_28	; *+53
;
; 1030:    		OutBbaMod7Off; 
;
_L19_27:
              move.l      #$f2e1,R0
              bfclr       #$20,X:(R0)
;
; 1031:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7; 
; 1032:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$10,X:(R0)
;
; 1033:     } 
; 1034:     else 
; 1035:     { 
;
              bra         <_L19_28	; *+42
;
; 1036:   	  if((ModHidro.Grp2Tmrs.TimerMod7.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod7.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1037:   	  { 
;
_L19_26:
              move.l      #>>FModHidro+144,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_29	; *+22
              move.l      #>>FModHidro+146,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_29	; *+12
;
; 1038:    		OutBbaMod7On; 
;
              move.l      #$f2e1,R0
              bfset       #$20,X:(R0)
;
; 1039:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD7; 
; 1040:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$10,X:(R0)
;
; 1041:   	  } 
; 1042:    	  else 
; 1043:   	  { 
;
              bra         <_L19_28	; *+11
;
; 1044:    		OutBbaMod7Off; 
;
_L19_29:
              move.l      #$f2e1,R0
              bfclr       #$20,X:(R0)
;
; 1045:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7; 
; 1046:   	  }	 
; 1047:  	 
; 1048:     } 
; 1049:  
; 1050:  
; 1051:  
; 1052:     //Actualizo control de Modulo 8 
; 1053:    
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$10,X:(R0)
;
; 1054:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD8_INTER) 
; 1055:     { 
;
_L19_28:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #2048,A
              and.l       B,A
              tst.l       A
              beq         <_L19_30	; *+33
;
; 1056:   	  if(ModHidro.Grp2Tmrs.TimerMod8.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod8.Timer.ttl.dwrd) 
; 1057:   	  { 
;
              move.l      #>>FModHidro+158,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+162,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_31	; *+12
;
; 1058:    		OutBbaMod8On; 
;
              move.l      #$f2e1,R0
              bfset       #$10,X:(R0)
;
; 1059:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD8; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$20,X:(R0)
;
; 1060:   	  } 
; 1061:   	  else 
; 1062:   	  { 
;
              bra         <_L19_32	; *+53
;
; 1063:    		OutBbaMod8Off; 
;
_L19_31:
              move.l      #$f2e1,R0
              bfclr       #$10,X:(R0)
;
; 1064:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8; 
; 1065:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$20,X:(R0)
;
; 1066:     } 
; 1067:     else 
; 1068:     { 
;
              bra         <_L19_32	; *+42
;
; 1069:   	  if((ModHidro.Grp2Tmrs.TimerMod8.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod8.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1070:   	  { 
;
_L19_30:
              move.l      #>>FModHidro+154,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_33	; *+22
              move.l      #>>FModHidro+156,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_33	; *+12
;
; 1071:    		OutBbaMod8On; 
;
              move.l      #$f2e1,R0
              bfset       #$10,X:(R0)
;
; 1072:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD8; 
; 1073:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$20,X:(R0)
;
; 1074:   	  } 
; 1075:    	  else 
; 1076:   	  { 
;
              bra         <_L19_32	; *+11
;
; 1077:    		OutBbaMod8Off; 
;
_L19_33:
              move.l      #$f2e1,R0
              bfclr       #$10,X:(R0)
;
; 1078:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8; 
; 1079:   	  }	 
; 1080:  	 
; 1081:     } 
; 1082:  
; 1083:  
; 1084:  
; 1085:     //Actualizo control de Modulo 9 
; 1086:    
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$20,X:(R0)
;
; 1087:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD9_INTER) 
; 1088:     { 
;
_L19_32:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #4096,A
              and.l       B,A
              tst.l       A
              beq         <_L19_34	; *+33
;
; 1089:   	  if(ModHidro.Grp2Tmrs.TimerMod9.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod9.Timer.ttl.dwrd) 
; 1090:   	  { 
;
              move.l      #>>FModHidro+168,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+172,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_35	; *+12
;
; 1091:    		OutBbaMod9On; 
;
              move.l      #$f2e1,R0
              bfset       #8,X:(R0)
;
; 1092:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD9; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$40,X:(R0)
;
; 1093:   	  } 
; 1094:   	  else 
; 1095:   	  { 
;
              bra         <_L19_36	; *+53
;
; 1096:    		OutBbaMod9Off; 
;
_L19_35:
              move.l      #$f2e1,R0
              bfclr       #8,X:(R0)
;
; 1097:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9; 
; 1098:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$40,X:(R0)
;
; 1099:     } 
; 1100:     else 
; 1101:     { 
;
              bra         <_L19_36	; *+42
;
; 1102:   	  if((ModHidro.Grp2Tmrs.TimerMod9.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod9.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1103:   	  { 
;
_L19_34:
              move.l      #>>FModHidro+164,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_37	; *+22
              move.l      #>>_L19_6,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_37	; *+12
;
; 1104:    		OutBbaMod9On; 
;
              move.l      #$f2e1,R0
              bfset       #8,X:(R0)
;
; 1105:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD9; 
; 1106:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$40,X:(R0)
;
; 1107:   	  } 
; 1108:    	  else 
; 1109:   	  { 
;
              bra         <_L19_36	; *+11
;
; 1110:    		OutBbaMod9Off; 
;
_L19_37:
              move.l      #$f2e1,R0
              bfclr       #8,X:(R0)
;
; 1111:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9; 
; 1112:   	  }	 
; 1113:  	 
; 1114:     } 
; 1115:  
; 1116:  
; 1117:  
; 1118:     //Actualizo control de Modulo 10 
; 1119:    
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$40,X:(R0)
;
; 1120:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD10_INTER) 
; 1121:     { 
;
_L19_36:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #8192,A
              and.l       B,A
              tst.l       A
              beq         <_L19_38	; *+33
;
; 1122:   	  if(ModHidro.Grp2Tmrs.TimerMod10.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod10.Timer.ttl.dwrd) 
; 1123:   	  { 
;
              move.l      #>>FModHidro+178,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+182,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_39	; *+12
;
; 1124:    		OutBbaMod10On; 
;
              move.l      #$f2e1,R0
              bfset       #4,X:(R0)
;
; 1125:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD10; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$80,X:(R0)
;
; 1126:   	  } 
; 1127:   	  else 
; 1128:   	  { 
;
              bra         <_L19_40	; *+53
;
; 1129:    		OutBbaMod10Off; 
;
_L19_39:
              move.l      #$f2e1,R0
              bfclr       #4,X:(R0)
;
; 1130:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10; 
; 1131:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$80,X:(R0)
;
; 1132:     } 
; 1133:     else 
; 1134:     { 
;
              bra         <_L19_40	; *+42
;
; 1135:   	  if((ModHidro.Grp2Tmrs.TimerMod10.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod10.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1136:   	  { 
;
_L19_38:
              move.l      #>>FModHidro+174,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_41	; *+22
              move.l      #>>FModHidro+176,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_41	; *+12
;
; 1137:    		OutBbaMod10On; 
;
              move.l      #$f2e1,R0
              bfset       #4,X:(R0)
;
; 1138:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD10; 
; 1139:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$80,X:(R0)
;
; 1140:   	  } 
; 1141:    	  else 
; 1142:   	  { 
;
              bra         <_L19_40	; *+11
;
; 1143:    		OutBbaMod10Off; 
;
_L19_41:
              move.l      #$f2e1,R0
              bfclr       #4,X:(R0)
;
; 1144:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10; 
; 1145:   	  }	 
; 1146:  	 
; 1147:     } 
; 1148:  
; 1149:  
; 1150:  
; 1151:     //Actualizo control de Modulo 11 
; 1152:    
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$80,X:(R0)
;
; 1153:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD11_INTER) 
; 1154:     { 
;
_L19_40:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #16384,A
              and.l       B,A
              tst.l       A
              beq         <_L19_42	; *+33
;
; 1155:   	  if(ModHidro.Grp2Tmrs.TimerMod11.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod11.Timer.ttl.dwrd) 
; 1156:   	  { 
;
              move.l      #>>FModHidro+188,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+192,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_43	; *+12
;
; 1157:    		OutBbaMod11On; 
;
              move.l      #$f2e1,R0
              bfset       #2,X:(R0)
;
; 1158:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD11; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$100,X:(R0)
;
; 1159:   	  } 
; 1160:   	  else 
; 1161:   	  { 
;
              bra         <_L19_44	; *+53
;
; 1162:    		OutBbaMod11Off; 
;
_L19_43:
              move.l      #$f2e1,R0
              bfclr       #2,X:(R0)
;
; 1163:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11; 
; 1164:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$100,X:(R0)
;
; 1165:     } 
; 1166:     else 
; 1167:     { 
;
              bra         <_L19_44	; *+42
;
; 1168:   	  if((ModHidro.Grp2Tmrs.TimerMod11.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod11.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1169:   	  { 
;
_L19_42:
              move.l      #>>FModHidro+184,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_45	; *+22
              move.l      #>>FModHidro+186,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_45	; *+12
;
; 1170:    		OutBbaMod11On; 
;
              move.l      #$f2e1,R0
              bfset       #2,X:(R0)
;
; 1171:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD11; 
; 1172:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$100,X:(R0)
;
; 1173:   	  } 
; 1174:    	  else 
; 1175:   	  { 
;
              bra         <_L19_44	; *+11
;
; 1176:    		OutBbaMod11Off; 
;
_L19_45:
              move.l      #$f2e1,R0
              bfclr       #2,X:(R0)
;
; 1177:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11; 
; 1178:   	  }	 
; 1179:  	 
; 1180:     } 
; 1181:  
; 1182:  
; 1183:  
; 1184:     //Actualizo control de Modulo 12 
; 1185:    
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$100,X:(R0)
;
; 1186:     if(ModHidro.Status.Stt2.dwrd & STAT2_MHI_MOD12_INTER) 
; 1187:     { 
;
_L19_44:
              move.l      #>>FModHidro+206,R0
              move.l      X:(R0),B
              move.l      #-32768,A
              and.l       B,A
              tst.l       A
              beq         <_L19_46	; *+35
;
; 1188:   	  if(ModHidro.Grp2Tmrs.TimerMod12.TimeOn.ttl.dwrd>=ModHidro.Grp2Tmrs.TimerMod12.Timer.ttl.dwrd) 
; 1189:   	  { 
;
              move.l      #>>FModHidro+198,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+202,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bhi         <_L19_47	; *+13
;
; 1190:    		OutBbaMod12On; 
;
              move.l      #$f2e1,R0
              bfset       #1,X:(R0)
;
; 1191:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD12; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$200,X:(R0)
;
; 1192:   	  } 
; 1193:   	  else 
; 1194:   	  { 
;
              bra         >_L19_48	; *+178
;
; 1195:    		OutBbaMod12Off; 
;
_L19_47:
              move.l      #$f2e1,R0
              bfclr       #1,X:(R0)
;
; 1196:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12; 
; 1197:   	  } 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$200,X:(R0)
;
; 1198:     } 
; 1199:     else 
; 1200:     { 
;
              bra         >_L19_48	; *+166
;
; 1201:   	  if((ModHidro.Grp2Tmrs.TimerMod12.TOn.ttl.dwrd<ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd) && (ModHidro.Grp2Tmrs.TimerMod12.TOff.ttl.dwrd>ModHidro.Grp1Tmrs.TimerGral.Time.ttl.dwrd)) 
; 1202:   	  { 
;
_L19_46:
              move.l      #>>FModHidro+194,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bls         <_L19_49	; *+23
              move.l      #>>FModHidro+196,R0
              move.l      X:(R0),B
              move.l      #>>FModHidro+74,R0
              move.l      X:(R0),A
              cmp.l       B,A
              bcc         <_L19_49	; *+13
;
; 1203:    		OutBbaMod12On; 
;
              move.l      #$f2e1,R0
              bfset       #1,X:(R0)
;
; 1204:    		ModHidro.Status.Stt2.dwrd|=STAT2_MHI_MOD12; 
; 1205:   	 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$200,X:(R0)
;
; 1206:   	  } 
; 1207:    	  else 
; 1208:   	  { 
;
              bra         >_L19_48	; *+134
;
; 1209:    		OutBbaMod12Off; 
;
_L19_49:
              move.l      #$f2e1,R0
              bfclr       #1,X:(R0)
;
; 1210:    		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12; 
; 1211:   	  }	 
; 1212:  	 
; 1213:     } 
; 1214:  
; 1215:  
; 1216:  
; 1217: /* 
; 1218:     //Actualizo control de ingreso de agua 
; 1219:     if(ModHidro.GrpSens.TkLSL.val<ModHidro.GrpSens.TkLSL.swtch && ModHidro.GrpSens.DrenLT.val<ModHidro.GrpSens.DrenLT.swtch) 
; 1220:     { 
; 1221:       OutBbaMod4On; 
; 1222: 	  ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4; 
; 1223:     } 
; 1224:     else if(ModHidro.GrpSens.DrenLSH.val>ModHidro.GrpSens.DrenLSH.swtch || ModHidro.GrpSens.TkLSH.val>ModHidro.GrpSens.TkLSH.swtch) 
; 1225:     { 
; 1226:   	  OutBbaMod4Off; 
; 1227: 	  ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4; 
; 1228:     } 
; 1229: */ 
; 1230:  
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$200,X:(R0)
;
; 1231:   } 
; 1232:   //Si no esta en horario de operacion apago las salidas hasta el inicio. 
; 1233:   else 
; 1234:   { 
;
              bra         >_L19_48	; *+122
;
; 1235:     	OutBbaMod1Off; 
;
_L19_0:
              move.l      #$f2e1,R0
              bfclr       #$40,X:(R0)
;
; 1236:   		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$10,X:(R0)
;
; 1237:    		OutBbaMod2Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
; 1238:    		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$20,X:(R0)
;
; 1239:     	OutBbaMod3Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
; 1240: 		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$40,X:(R0)
;
; 1241:   		OutBbaMod4Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$200,X:(R0)
;
; 1242: 		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$80,X:(R0)
;
; 1243:   		OutBbaMod5Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
; 1244: 		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$100,X:(R0)
;
; 1245:   		OutBbaMod6Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$800,X:(R0)
;
; 1246: 		ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$200,X:(R0)
;
; 1247:   		OutBbaMod7Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$20,X:(R0)
;
; 1248: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$10,X:(R0)
;
; 1249:   		OutBbaMod8Off; 
;
              move.l      #$f2e1,R0
              bfclr       #$10,X:(R0)
;
; 1250: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$20,X:(R0)
;
; 1251:   		OutBbaMod9Off; 
;
              move.l      #$f2e1,R0
              bfclr       #8,X:(R0)
;
; 1252: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$40,X:(R0)
;
; 1253:   		OutBbaMod10Off; 
;
              move.l      #$f2e1,R0
              bfclr       #4,X:(R0)
;
; 1254: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$80,X:(R0)
;
; 1255:   		OutBbaMod11Off; 
;
              move.l      #$f2e1,R0
              bfclr       #2,X:(R0)
;
; 1256: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$100,X:(R0)
;
; 1257:   		OutBbaMod12Off; 
;
              move.l      #$f2e1,R0
              bfclr       #1,X:(R0)
;
; 1258: 		ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12; 
; 1259:  
; 1260:   } 
; 1261:  
; 1262: /* 
; 1263:   if(ModHidro.GrpSens.TkLSH.val>ModHidro.GrpSens.TkLSH.swtch) 
; 1264:   { 
; 1265: 	ModHidro.GrpSens.TkCond.max.dwrd=ModHidro.GrpSens.TkLSL.ADval.dwrd; 
; 1266: 	ModHidro.GrpSens.TkCond.val=ModHidro.GrpSens.TkCond.max.dwrd*ModHidro.GrpSens.TkCond.FEsc; 
; 1267: 	//ModHidro.TkLSL.max=ModHidro.TkLSL.ADval; 
; 1268:   } 
; 1269:    
; 1270:   //Actualizo control de Bomba de Trasvase 
; 1271:   //Esto lo tengo prendido siempre para evitar derrames 
; 1272:   if(ModHidro.GrpSens.DrenLSH.val>ModHidro.GrpSens.DrenLSH.swtch) 
; 1273:   { 
; 1274:   	OutBbaMod5On; 
; 1275:   	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5; 
; 1276: 	ModHidro.GrpSens.DrenCond.max.dwrd=ModHidro.GrpSens.DrenLT.ADval.dwrd; 
; 1277: 	ModHidro.GrpSens.DrenCond.val=ModHidro.GrpSens.DrenCond.max.dwrd*ModHidro.GrpSens.DrenCond.FEsc; 
; 1278: 	//ModHidro.DrenLT.max=ModHidro.DrenLT.ADval; 
; 1279:   } 
; 1280:   else if(ModHidro.GrpSens.DrenLT.val<ModHidro.GrpSens.DrenLT.swtch) 
; 1281:   { 
; 1282:   	OutBbaMod5Off; 
; 1283:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5; 
; 1284:   } 
; 1285:   
; 1286: */ 
; 1287:    
; 1288:  
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$200,X:(R0)
;
; 1289: } 
_L19_48:
              rts         
end_FCtrl_Auto:

	ENDSEC

	SECTION Unit_ModHidro

	ORG	P:

;
; 1290: //-------------------------------------------------------------------------------------------------------------- 
; 1291:  
; 1292: void sciDataReceived(byte *buf) 
; 1293: { 
; 1294:   TDato32 *dato; 
;
		subroutine "FsciDataReceived",FsciDataReceived,end_FsciDataReceived-FsciDataReceived
FsciDataReceived:
              adda        #<6,SP
              move.l      R2,X:(SP-4)
;
; 1295:   byte dataLen32=0; 
; 1296:   int i; 
; 1297:  
; 1298:  
;
              clr.b       X:(SP+>0)
;
; 1299:   switch(buf[0]) 
; 1300:   { 
; 1301:   //Caso en los que se recive un comando 
; 1302:   case CMD_MHI_SAVE: 
;
              move.l      X:(SP-4),R0
              moveu.bp    X:(R0),A
              zxt.b       A,A
              cmp.w       #146,A
              bgt         >_L25_0	; *+1502
              nop         
              cmp.w       #<0,A
              blt         >_L25_0	; *+1498
              add.w       #>0,A
              move.w      A1,N
              adda.l      #>>_L25_1,N,R0
              move.w      P:(R0)+,A1
              lsr16       A,A
              move.w      P:(R0)+,A1
              move.l      A10,N
              jmp         (N)
_L25_1:
              dc          _L25_2                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_3                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_5                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_6                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_7                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_8                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_9                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_10                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_11                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_12                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_13                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_14                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_15                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_16                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_17                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_18                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_19                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_20                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_21                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_22                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_23                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_24                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_25                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_26                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_27                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_28                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_29                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_30                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_31                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_32                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_33                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_34                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_35                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_36                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_37                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_38                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_39                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_40                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_41                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_42                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_43                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_44                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_45                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_46                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_47                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_48                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_49                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_50                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_51                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_52                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_53                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_54                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_55                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_56                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_57                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_58                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_0                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_59                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_60                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_61                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_62                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_63                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_64                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_65                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_66                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_67                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_68                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_69                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_70                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_71                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_72                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_73                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_74                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_75                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_76                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L25_77                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
;
; 1303:     dataLen32=DataFlash_SetGlobalProtection(0); 
;
_L25_2:
              move.w      #<0,Y0
              jsr         >FDataFlash_SetGlobalProtection
              move.b      Y0,X:(SP)
;
; 1304:     DataFlash_EraseFlash(0); 
;
              move.w      #<0,Y0
              jsr         >FDataFlash_EraseFlash
;
; 1305:     dataLen32=DataFlash_SetBlockFlash(2*(DataFlash_TAddress)&ModHidro, 2*(DataFlash_TAddress)&ModHidroFlash, sizeof(ModHidro)); 
;
              move.l      #>>FModHidro,R0
              move.l      R0,A
              asll.l      #<1,A
              move.l      #>>FModHidroFlash,R0
              move.l      R0,B
              asll.l      #<1,B
              move.w      #416,Y0
              jsr         >FDataFlash_SetBlockFlash
              move.b      Y0,X:(SP)
;
; 1306:     dataLen32=DataFlash_SetGlobalProtection(1); 
;
              move.w      #<1,Y0
              jsr         >FDataFlash_SetGlobalProtection
              move.b      Y0,X:(SP)
;
; 1307:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1308:   break; 
; 1309:   case CMD_MHI_STT_MOD1_ON: 
;
              bra         >_L25_78	; *+1158
;
; 1310:     OutBbaMod1On; 
;
_L25_3:
              move.l      #$f2e1,R0
              bfset       #$40,X:(R0)
;
; 1311:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD1; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$10,X:(R0)
;
; 1312:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1313:   break; 
; 1314:   case CMD_MHI_STT_MOD1_OFF: 
;
              bra         >_L25_78	; *+1137
;
; 1315:     OutBbaMod1Off; 
;
_L25_4:
              move.l      #$f2e1,R0
              bfclr       #$40,X:(R0)
;
; 1316:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$10,X:(R0)
;
; 1317:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1318:   break; 
; 1319:   case CMD_MHI_STT_MOD2_ON: 
;
              bra         >_L25_78	; *+1116
;
; 1320:     OutBbaMod2On; 
;
_L25_7:
              move.l      #$f2e1,R0
              bfset       #$80,X:(R0)
;
; 1321:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD2; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$20,X:(R0)
;
; 1322:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1323:   break; 
; 1324:   case CMD_MHI_STT_MOD2_OFF: 
;
              bra         >_L25_78	; *+1095
;
; 1325:     OutBbaMod2Off; 
;
_L25_8:
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
; 1326:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$20,X:(R0)
;
; 1327:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1328:   break; 
; 1329:   case CMD_MHI_STT_MOD3_ON: 
;
              bra         >_L25_78	; *+1074
;
; 1330:     OutBbaMod3On; 
;
_L25_11:
              move.l      #$f2e1,R0
              bfset       #$100,X:(R0)
;
; 1331:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD3; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$40,X:(R0)
;
; 1332:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1333:   break; 
; 1334:   case CMD_MHI_STT_MOD3_OFF: 
;
              bra         >_L25_78	; *+1053
;
; 1335:     OutBbaMod3Off; 
;
_L25_12:
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
; 1336:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$40,X:(R0)
;
; 1337:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1338:   break; 
; 1339:   case CMD_MHI_STT_MOD4_ON: 
;
              bra         >_L25_78	; *+1032
;
; 1340:     OutBbaMod4On; 
;
_L25_15:
              move.l      #$f2e1,R0
              bfset       #$200,X:(R0)
;
; 1341:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD4; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$80,X:(R0)
;
; 1342:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1343:   break; 
; 1344:   case CMD_MHI_STT_MOD4_OFF: 
;
              bra         >_L25_78	; *+1011
;
; 1345:     OutBbaMod4Off; 
;
_L25_16:
              move.l      #$f2e1,R0
              bfclr       #$200,X:(R0)
;
; 1346:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$80,X:(R0)
;
; 1347:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1348:   break; 
; 1349:   case CMD_MHI_STT_MOD5_ON: 
;
              bra         >_L25_78	; *+990
;
; 1350:     OutBbaMod5On; 
;
_L25_19:
              move.l      #$f2e1,R0
              bfset       #$400,X:(R0)
;
; 1351:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD5; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$100,X:(R0)
;
; 1352:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1353:   break; 
; 1354:   case CMD_MHI_STT_MOD5_OFF: 
;
              bra         >_L25_78	; *+969
;
; 1355:     OutBbaMod5Off; 
;
_L25_20:
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
; 1356:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$100,X:(R0)
;
; 1357:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1358:   break; 
; 1359:   case CMD_MHI_STT_MOD6_ON: 
;
              bra         >_L25_78	; *+948
;
; 1360:     OutBbaMod6On; 
;
_L25_23:
              move.l      #$f2e1,R0
              bfset       #$800,X:(R0)
;
; 1361:   	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MOD6; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #$200,X:(R0)
;
; 1362:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1363:   break; 
; 1364:   case CMD_MHI_STT_MOD6_OFF: 
;
              bra         >_L25_78	; *+927
;
; 1365:     OutBbaMod6Off; 
;
_L25_24:
              move.l      #$f2e1,R0
              bfclr       #$800,X:(R0)
;
; 1366:   	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #$200,X:(R0)
;
; 1367:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1368:   break; 
; 1369:   case CMD_MHI_STT_AUTO_ON: 
;
              bra         >_L25_78	; *+906
;
; 1370:   	OutLedAutoOn; 
;
_L25_51:
              move.l      #$f311,R0
              bfset       #4,X:(R0)
;
; 1371: 	ModHidro.Status.Stt1.dwrd|= STAT_MHI_MAN_AUT; 
;
              move.l      #>>FModHidro+204,R0
              bfset       #8,X:(R0)
;
; 1372:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1373:   break; 
; 1374:   case CMD_MHI_STT_AUTO_OFF: 
;
              bra         >_L25_78	; *+885
;
; 1375:   	OutLedAutoOff; 
;
_L25_52:
              move.l      #$f311,R0
              bfclr       #4,X:(R0)
;
; 1376: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MAN_AUT; 
;
              move.l      #>>FModHidro+204,R0
              bfclr       #8,X:(R0)
;
; 1377:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1378:   break; 
; 1379:   case CMD_MHI_STT_MOD1_INTON: 
;
              bra         >_L25_78	; *+864
;
; 1380: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD1_INTER; 
;
_L25_5:
              move.l      #>>FModHidro+204,R0
              bfset       #$400,X:(R0)
;
; 1381:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1382:   break; 
; 1383:   case CMD_MHI_STT_MOD1_INTOFF: 
;
              bra         >_L25_78	; *+848
;
; 1384: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD1_INTER; 
;
_L25_6:
              move.l      #>>FModHidro+204,R0
              bfclr       #$400,X:(R0)
;
; 1385:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1386:   break; 
; 1387:   case CMD_MHI_STT_MOD2_INTON: 
;
              bra         >_L25_78	; *+832
;
; 1388: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD2_INTER; 
;
_L25_9:
              move.l      #>>FModHidro+204,R0
              bfset       #$800,X:(R0)
;
; 1389:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1390:   break; 
; 1391:   case CMD_MHI_STT_MOD2_INTOFF: 
;
              bra         >_L25_78	; *+816
;
; 1392: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD2_INTER; 
;
_L25_10:
              move.l      #>>FModHidro+204,R0
              bfclr       #$800,X:(R0)
;
; 1393:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1394:   break; 
; 1395:   case CMD_MHI_STT_MOD3_INTON: 
;
              bra         >_L25_78	; *+800
;
; 1396: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD3_INTER; 
;
_L25_13:
              move.l      #>>FModHidro+204,R0
              bfset       #$1000,X:(R0)
;
; 1397:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1398:   break; 
; 1399:   case CMD_MHI_STT_MOD3_INTOFF: 
;
              bra         >_L25_78	; *+784
;
; 1400: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD3_INTER; 
;
_L25_14:
              move.l      #>>FModHidro+204,R0
              bfclr       #$1000,X:(R0)
;
; 1401:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1402:   break; 
; 1403:   case CMD_MHI_STT_MOD4_INTON: 
;
              bra         >_L25_78	; *+768
;
; 1404: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD4_INTER; 
;
_L25_17:
              move.l      #>>FModHidro+204,R0
              bfset       #$2000,X:(R0)
;
; 1405:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1406:   break; 
; 1407:   case CMD_MHI_STT_MOD4_INTOFF: 
;
              bra         >_L25_78	; *+752
;
; 1408: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD4_INTER; 
;
_L25_18:
              move.l      #>>FModHidro+204,R0
              bfclr       #$2000,X:(R0)
;
; 1409:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1410:   break; 
; 1411:   case CMD_MHI_STT_MOD5_INTON: 
;
              bra         >_L25_78	; *+736
;
; 1412: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD5_INTER; 
;
_L25_21:
              move.l      #>>FModHidro+204,R0
              bfset       #$4000,X:(R0)
;
; 1413:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1414:   break; 
; 1415:   case CMD_MHI_STT_MOD5_INTOFF: 
;
              bra         >_L25_78	; *+720
;
; 1416: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD5_INTER; 
;
_L25_22:
              move.l      #>>FModHidro+204,R0
              bfclr       #$4000,X:(R0)
;
; 1417:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1418:   break; 
; 1419:   case CMD_MHI_STT_MOD6_INTON: 
;
              bra         >_L25_78	; *+704
;
; 1420: 	ModHidro.Status.Stt1.dwrd|=STAT_MHI_MOD6_INTER; 
;
_L25_25:
              move.l      #>>FModHidro+204,R0
              bfset       #$8000,X:(R0)
              bfset       #$ffff,X:(R0+>1)
;
; 1421:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1422:   break; 
; 1423:   case CMD_MHI_STT_MOD6_INTOFF: 
;
              bra         >_L25_78	; *+685
;
; 1424: 	ModHidro.Status.Stt1.dwrd &=~ STAT_MHI_MOD6_INTER; 
;
_L25_26:
              move.l      #>>FModHidro+204,R0
              bfclr       #$8000,X:(R0)
              clr.w       X:(R0+>1)
;
; 1425:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1426:   break; 
; 1427:   case CMD_MHI_STT_MOD7_ON: 
;
              bra         >_L25_78	; *+667
;
; 1428:     OutBbaMod7On; 
;
_L25_27:
              move.l      #$f2e1,R0
              bfset       #$20,X:(R0)
;
; 1429:   	ModHidro.Status.Stt2.dwrd|= STAT2_MHI_MOD7; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$10,X:(R0)
;
; 1430:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1431:   break; 
; 1432:   case CMD_MHI_STT_MOD7_OFF: 
;
              bra         >_L25_78	; *+646
;
; 1433:     OutBbaMod7Off; 
;
_L25_28:
              move.l      #$f2e1,R0
              bfclr       #$20,X:(R0)
;
; 1434:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$10,X:(R0)
;
; 1435:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1436:   break; 
; 1437:   case CMD_MHI_STT_MOD8_ON: 
;
              bra         >_L25_78	; *+625
;
; 1438:     OutBbaMod8On; 
;
_L25_31:
              move.l      #$f2e1,R0
              bfset       #$10,X:(R0)
;
; 1439:   	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD8; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$20,X:(R0)
;
; 1440:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1441:   break; 
; 1442:   case CMD_MHI_STT_MOD8_OFF: 
;
              bra         >_L25_78	; *+604
;
; 1443:     OutBbaMod8Off; 
;
_L25_32:
              move.l      #$f2e1,R0
              bfclr       #$10,X:(R0)
;
; 1444:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$20,X:(R0)
;
; 1445:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1446:   break; 
; 1447:   case CMD_MHI_STT_MOD9_ON: 
;
              bra         >_L25_78	; *+583
;
; 1448:     OutBbaMod9On; 
;
_L25_35:
              move.l      #$f2e1,R0
              bfset       #8,X:(R0)
;
; 1449:   	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD9; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$40,X:(R0)
;
; 1450:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1451:   break; 
; 1452:   case CMD_MHI_STT_MOD9_OFF: 
;
              bra         >_L25_78	; *+562
;
; 1453:     OutBbaMod9Off; 
;
_L25_36:
              move.l      #$f2e1,R0
              bfclr       #8,X:(R0)
;
; 1454:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$40,X:(R0)
;
; 1455:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1456:   break; 
; 1457:   case CMD_MHI_STT_MOD10_ON: 
;
              bra         >_L25_78	; *+541
;
; 1458:     OutBbaMod10On; 
;
_L25_39:
              move.l      #$f2e1,R0
              bfset       #4,X:(R0)
;
; 1459:   	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD10; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$80,X:(R0)
;
; 1460:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1461:   break; 
; 1462:   case CMD_MHI_STT_MOD10_OFF: 
;
              bra         >_L25_78	; *+520
;
; 1463:     OutBbaMod10Off; 
;
_L25_40:
              move.l      #$f2e1,R0
              bfclr       #4,X:(R0)
;
; 1464:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$80,X:(R0)
;
; 1465:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1466:   break; 
; 1467:   case CMD_MHI_STT_MOD11_ON: 
;
              bra         >_L25_78	; *+499
;
; 1468:     OutBbaMod11On; 
;
_L25_43:
              move.l      #$f2e1,R0
              bfset       #2,X:(R0)
;
; 1469:   	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD11; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$100,X:(R0)
;
; 1470:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1471:   break; 
; 1472:   case CMD_MHI_STT_MOD11_OFF: 
;
              bra         >_L25_78	; *+478
;
; 1473:     OutBbaMod11Off; 
;
_L25_44:
              move.l      #$f2e1,R0
              bfclr       #2,X:(R0)
;
; 1474:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$100,X:(R0)
;
; 1475:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1476:   break; 
; 1477:   case CMD_MHI_STT_MOD12_ON: 
;
              bra         >_L25_78	; *+457
;
; 1478:     OutBbaMod12On; 
;
_L25_47:
              move.l      #$f2e1,R0
              bfset       #1,X:(R0)
;
; 1479:   	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD12; 
;
              move.l      #>>FModHidro+206,R0
              bfset       #$200,X:(R0)
;
; 1480:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1481:   break; 
; 1482:   case CMD_MHI_STT_MOD12_OFF: 
;
              bra         >_L25_78	; *+436
;
; 1483:     OutBbaMod12Off; 
;
_L25_48:
              move.l      #$f2e1,R0
              bfclr       #1,X:(R0)
;
; 1484:   	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12; 
;
              move.l      #>>FModHidro+206,R0
              bfclr       #$200,X:(R0)
;
; 1485:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1486:   break; 
; 1487: case CMD_MHI_STT_MOD7_INTON: 
;
              bra         >_L25_78	; *+415
;
; 1488: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD7_INTER; 
;
_L25_29:
              move.l      #>>FModHidro+206,R0
              bfset       #$400,X:(R0)
;
; 1489:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1490:   break; 
; 1491:   case CMD_MHI_STT_MOD7_INTOFF: 
;
              bra         >_L25_78	; *+399
;
; 1492: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD7_INTER; 
;
_L25_30:
              move.l      #>>FModHidro+206,R0
              bfclr       #$400,X:(R0)
;
; 1493:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1494:   break; 
; 1495:   case CMD_MHI_STT_MOD8_INTON: 
;
              bra         >_L25_78	; *+383
;
; 1496: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD8_INTER; 
;
_L25_33:
              move.l      #>>FModHidro+206,R0
              bfset       #$800,X:(R0)
;
; 1497:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1498:   break; 
; 1499:   case CMD_MHI_STT_MOD8_INTOFF: 
;
              bra         >_L25_78	; *+367
;
; 1500: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD8_INTER; 
;
_L25_34:
              move.l      #>>FModHidro+206,R0
              bfclr       #$800,X:(R0)
;
; 1501:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1502:   break; 
; 1503:   case CMD_MHI_STT_MOD9_INTON: 
;
              bra         >_L25_78	; *+351
;
; 1504: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD9_INTER; 
;
_L25_37:
              move.l      #>>FModHidro+206,R0
              bfset       #$1000,X:(R0)
;
; 1505:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1506:   break; 
; 1507:   case CMD_MHI_STT_MOD9_INTOFF: 
;
              bra         >_L25_78	; *+335
;
; 1508: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD9_INTER; 
;
_L25_38:
              move.l      #>>FModHidro+206,R0
              bfclr       #$1000,X:(R0)
;
; 1509:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1510:   break; 
; 1511:   case CMD_MHI_STT_MOD10_INTON: 
;
              bra         >_L25_78	; *+319
;
; 1512: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD10_INTER; 
;
_L25_41:
              move.l      #>>FModHidro+206,R0
              bfset       #$2000,X:(R0)
;
; 1513:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1514:   break; 
; 1515:   case CMD_MHI_STT_MOD10_INTOFF: 
;
              bra         >_L25_78	; *+303
;
; 1516: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD10_INTER; 
;
_L25_42:
              move.l      #>>FModHidro+206,R0
              bfclr       #$2000,X:(R0)
;
; 1517:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1518:   break; 
; 1519:   case CMD_MHI_STT_MOD11_INTON: 
;
              bra         >_L25_78	; *+287
;
; 1520: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD11_INTER; 
;
_L25_45:
              move.l      #>>FModHidro+206,R0
              bfset       #$4000,X:(R0)
;
; 1521:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1522:   break; 
; 1523:   case CMD_MHI_STT_MOD11_INTOFF: 
;
              bra         >_L25_78	; *+271
;
; 1524: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD11_INTER; 
;
_L25_46:
              move.l      #>>FModHidro+206,R0
              bfclr       #$4000,X:(R0)
;
; 1525:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1526:   break; 
; 1527:   case CMD_MHI_STT_MOD12_INTON: 
;
              bra         >_L25_78	; *+255
;
; 1528: 	ModHidro.Status.Stt2.dwrd |= STAT2_MHI_MOD12_INTER; 
;
_L25_49:
              move.l      #>>FModHidro+206,R0
              bfset       #$8000,X:(R0)
              bfset       #$ffff,X:(R0+>1)
;
; 1529:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1530:   break; 
; 1531:   case CMD_MHI_STT_MOD12_INTOFF: 
;
              bra         >_L25_78	; *+236
;
; 1532: 	ModHidro.Status.Stt2.dwrd &=~ STAT2_MHI_MOD12_INTER; 
;
_L25_50:
              move.l      #>>FModHidro+206,R0
              bfclr       #$8000,X:(R0)
              clr.w       X:(R0+>1)
;
; 1533:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1534:   break; 
; 1535:    
; 1536:  
; 1537:   //Caso en los que se recive un pedido de Datos 
; 1538:   case DRQ_MHI: 
;
              bra         >_L25_78	; *+218
;
; 1539:     sendSciMsg(DATA_MHI, &ModHidro, sizeof(ModHidro)); 
;
_L25_53:
              move.w      #128,Y0
              move.l      #>>FModHidro,R0
              asla        R0,R2
              move.w      #160,Y1
              jsr         >FsendSciMsg
;
; 1540:   break; 
; 1541:   case DRQ_MHI_STATUS: 
;
              bra         >_L25_78	; *+206
;
; 1542:     sendSciMsg(DATA_MHI_SET_STATUS, &ModHidro.Status, sizeof(ModHidro.Status)); 
;
_L25_54:
              move.w      #129,Y0
              move.l      #>>FModHidro+204,R0
              asla        R0,R2
              move.w      #<8,Y1
              jsr         >FsendSciMsg
;
; 1543:   break; 
; 1544:   case DRQ_MHI_CONST: 
;
              bra         >_L25_78	; *+195
;
; 1545:     sendSciMsg(DATA_MHI_SET_CONST, &ModHidro.Const, sizeof(ModHidro.Const)); 
;
_L25_55:
              move.w      #130,Y0
              move.l      #>>FModHidro,R0
              asla        R0,R2
              move.w      #<12,Y1
              jsr         >FsendSciMsg
;
; 1546:   break; 
; 1547:   case DRQ_MHI_TMRS1: 
;
              bra         >_L25_78	; *+184
;
; 1548:     sendSciMsg(DATA_MHI_SET_TMRS1, &ModHidro.Grp1Tmrs, sizeof(ModHidro.Grp1Tmrs)); 
;
_L25_56:
              move.w      #131,Y0
              move.l      #>>FModHidro+74,R0
              asla        R0,R2
              move.w      #140,Y1
              jsr         >FsendSciMsg
;
; 1549:   break; 
; 1550:   case DRQ_MHI_TMRS2: 
;
              bra         >_L25_78	; *+172
;
; 1551:     sendSciMsg(DATA_MHI_SET_TMRS2, &ModHidro.Grp2Tmrs, sizeof(ModHidro.Grp2Tmrs)); 
;
_L25_57:
              move.w      #132,Y0
              move.l      #>>FModHidro+144,R0
              asla        R0,R2
              move.w      #120,Y1
              jsr         >FsendSciMsg
;
; 1552:   break; 
; 1553:   case DRQ_MHI_SENS: 
;
              bra         >_L25_78	; *+160
;
; 1554:     sendSciMsg(DATA_MHI_SET_SENS, &ModHidro.GrpSens, sizeof(ModHidro.GrpSens)); 
;
_L25_58:
              move.w      #133,Y0
              move.l      #>>FModHidro+6,R0
              asla        R0,R2
              move.w      #136,Y1
              jsr         >FsendSciMsg
;
; 1555:   break; 
; 1556:    
; 1557:   
; 1558:   //Caso en los que se reciven Datos 
; 1559:   case DATA_MHI: 
;
              bra         >_L25_78	; *+148
;
; 1560:     dato = (TDato32 *)&ModHidro; 
;
_L25_59:
              move.l      #>>FModHidro,R0
              move.l      R0,X:(SP-2)
;
; 1561:     dataLen32 = sizeof(ModHidro)/4; 
;
              move.w      #104,A
              move.b      A1,X:(SP)
;
; 1562:   break; 
; 1563:   case DATA_MHI_SET_STATUS: 
;
              bra         >_L25_78	; *+139
;
; 1564:     dato = (TDato32 *)&ModHidro.Status; 
;
_L25_60:
              move.l      #>>FModHidro+204,R0
              move.l      R0,X:(SP-2)
;
; 1565:     dataLen32 = sizeof(ModHidro.Status)/4; 
;
              move.w      #<2,A
              move.b      A1,X:(SP)
;
; 1566:   break; 
; 1567:   case DATA_MHI_SET_CONST: 
;
              bra         >_L25_78	; *+131
;
; 1568:     dato = (TDato32 *)&ModHidro.Const; 
;
_L25_61:
              move.l      #>>FModHidro,R0
              move.l      R0,X:(SP-2)
;
; 1569:     dataLen32 = sizeof(ModHidro.Const)/4; 
;
              move.w      #<3,A
              move.b      A1,X:(SP)
;
; 1570:   break; 
; 1571:   case DATA_MHI_SET_TMRS1: 
;
              bra         >_L25_78	; *+123
;
; 1572:     dato = (TDato32 *)&ModHidro.Grp1Tmrs; 
;
_L25_62:
              move.l      #>>FModHidro+74,R0
              move.l      R0,X:(SP-2)
;
; 1573:     dataLen32 = sizeof(ModHidro.Grp1Tmrs)/4; 
;
              move.w      #<35,A
              move.b      A1,X:(SP)
;
; 1574:   break; 
; 1575:   case DATA_MHI_SET_TMRS2: 
;
              bra         >_L25_78	; *+115
;
; 1576:     dato = (TDato32 *)&ModHidro.Grp2Tmrs; 
;
_L25_63:
              move.l      #>>FModHidro+144,R0
              move.l      R0,X:(SP-2)
;
; 1577:     dataLen32 = sizeof(ModHidro.Grp2Tmrs)/4; 
;
              move.w      #<30,A
              move.b      A1,X:(SP)
;
; 1578:   break; 
; 1579:   case DATA_MHI_SET_SENS: 
;
              bra         >_L25_78	; *+107
;
; 1580:     dato = (TDato32 *)&ModHidro.GrpSens; 
;
_L25_64:
              move.l      #>>FModHidro+6,R0
              move.l      R0,X:(SP-2)
;
; 1581:     dataLen32 = sizeof(ModHidro.GrpSens)/4; 
;
              move.w      #<34,A
              move.b      A1,X:(SP)
;
; 1582:   break; 
; 1583:   case DATA_MHI_SET_TIMEGRAL: 
;
              bra         >_L25_78	; *+99
;
; 1584:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerGral; 
;
_L25_65:
              move.l      #>>FModHidro+74,R0
              move.l      R0,X:(SP-2)
;
; 1585:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerGral)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1586:   break; 
; 1587:   case DATA_MHI_SET_TIMER_M1: 
;
              bra         >_L25_78	; *+91
;
; 1588:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod1; 
;
_L25_66:
              move.l      #>>FModHidro+84,R0
              move.l      R0,X:(SP-2)
;
; 1589:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod1)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1590:   break; 
; 1591:   case DATA_MHI_SET_TIMER_M2: 
;
              bra         >_L25_78	; *+83
;
; 1592:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod2; 
;
_L25_67:
              move.l      #>>FModHidro+94,R0
              move.l      R0,X:(SP-2)
;
; 1593:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod2)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1594:   break; 
; 1595:   case DATA_MHI_SET_TIMER_M3: 
;
              bra         >_L25_78	; *+75
;
; 1596:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod3; 
;
_L25_68:
              move.l      #>>FModHidro+104,R0
              move.l      R0,X:(SP-2)
;
; 1597:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod3)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1598:   break; 
; 1599:   case DATA_MHI_SET_TIMER_M4: 
;
              bra         >_L25_78	; *+67
;
; 1600:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod4; 
;
_L25_69:
              move.l      #>>FModHidro+114,R0
              move.l      R0,X:(SP-2)
;
; 1601:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod4)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1602:   break; 
; 1603:   case DATA_MHI_SET_TIMER_M5: 
;
              bra         <_L25_78	; *+59
;
; 1604:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod5; 
;
_L25_70:
              move.l      #>>FModHidro+124,R0
              move.l      R0,X:(SP-2)
;
; 1605:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod5)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1606:   break; 
; 1607:   case DATA_MHI_SET_TIMER_M6: 
;
              bra         <_L25_78	; *+52
;
; 1608:     dato = (TDato32 *)&ModHidro.Grp1Tmrs.TimerMod6; 
;
_L25_71:
              move.l      #>>FModHidro+134,R0
              move.l      R0,X:(SP-2)
;
; 1609:     dataLen32 = sizeof(ModHidro.Grp1Tmrs.TimerMod6)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1610:   break; 
; 1611:   case DATA_MHI_SET_TIMER_M7: 
;
              bra         <_L25_78	; *+45
;
; 1612:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod7; 
;
_L25_72:
              move.l      #>>FModHidro+144,R0
              move.l      R0,X:(SP-2)
;
; 1613:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod7)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1614:   break; 
; 1615:   case DATA_MHI_SET_TIMER_M8: 
;
              bra         <_L25_78	; *+38
;
; 1616:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod8; 
;
_L25_73:
              move.l      #>>FModHidro+154,R0
              move.l      R0,X:(SP-2)
;
; 1617:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod8)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1618:   break; 
; 1619:   case DATA_MHI_SET_TIMER_M9: 
;
              bra         <_L25_78	; *+31
;
; 1620:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod9; 
;
_L25_74:
              move.l      #>>FModHidro+164,R0
              move.l      R0,X:(SP-2)
;
; 1621:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod9)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1622:   break; 
; 1623:   case DATA_MHI_SET_TIMER_M10: 
;
              bra         <_L25_78	; *+24
;
; 1624:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod10; 
;
_L25_75:
              move.l      #>>FModHidro+174,R0
              move.l      R0,X:(SP-2)
;
; 1625:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod10)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1626:   break; 
; 1627:   case DATA_MHI_SET_TIMER_M11: 
;
              bra         <_L25_78	; *+17
;
; 1628:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod11; 
;
_L25_76:
              move.l      #>>FModHidro+184,R0
              move.l      R0,X:(SP-2)
;
; 1629:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod11)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1630:   break; 
; 1631:   case DATA_MHI_SET_TIMER_M12: 
;
              bra         <_L25_78	; *+10
;
; 1632:     dato = (TDato32 *)&ModHidro.Grp2Tmrs.TimerMod12; 
;
_L25_77:
              move.l      #>>FModHidro+194,R0
              move.l      R0,X:(SP-2)
;
; 1633:     dataLen32 = sizeof(ModHidro.Grp2Tmrs.TimerMod12)/4; 
;
              move.w      #<5,A
              move.b      A1,X:(SP)
;
; 1634:   break; 
; 1635:    
; 1636:    
; 1637:   default: 
;
              bra         <_L25_78	; *+3
;
; 1638:   return; 
; 1639:   } 
; 1640:  
;
_L25_0:
              bra         >_L25_79	; *+81
;
; 1641:   for(i = 0; i < dataLen32; i++) 
; 1642:   { 
;
_L25_78:
              clr.w       X:(SP->1)
              bra         >_L25_80	; *+72
;
; 1643:     dato[i].byt[0] = buf[4*i+1]; 
;
_L25_81:
              move.l      X:(SP-2),R1
              move.w      X:(SP-1),A
              asr16       A,A
              asll.l      #<1,A
              move.l      A10,R0
              adda        R1,R0
              asla        R0,R2
              move.l      X:(SP-4),R1
              move.w      X:(SP-1),A
              asll.w      #<2,A
              add.w       #<1,A
              asr16       A,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              move.bp     A1,X:(R2)
;
; 1644:     dato[i].byt[1] = buf[4*i+2]; 
;
              move.l      X:(SP-2),R1
              move.w      X:(SP-1),A
              asr16       A,A
              asll.l      #<1,A
              move.l      A10,R0
              adda        R1,R0
              asla        R0,R2
              adda        #<1,R2
              move.l      X:(SP-4),R1
              move.w      X:(SP-1),A
              asll.w      #<2,A
              add.w       #<2,A
              asr16       A,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              move.bp     A1,X:(R2)
;
; 1645:     dato[i].byt[2] = buf[4*i+3]; 
;
              move.l      X:(SP-2),R1
              move.w      X:(SP-1),A
              asr16       A,A
              asll.l      #<1,A
              move.l      A10,R0
              adda        R1,R0
              asla        R0,R2
              adda        #<2,R2
              move.l      X:(SP-4),R1
              move.w      X:(SP-1),A
              asll.w      #<2,A
              add.w       #<3,A
              asr16       A,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              move.bp     A1,X:(R2)
;
; 1646:     dato[i].byt[3] = buf[4*i+4]; 
;
              move.l      X:(SP-2),R1
              move.w      X:(SP-1),A
              asr16       A,A
              asll.l      #<1,A
              move.l      A10,R0
              adda        R1,R0
              asla        R0,R2
              adda        #<3,R2
              move.l      X:(SP-4),R1
              move.w      X:(SP-1),A
              asll.w      #<2,A
              add.w       #<4,A
              asr16       A,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              move.bp     A1,X:(R2)
;
; 1647:   } 
; 1648:  
;
              move.w      X:(SP-1),A
              add.w       #<1,A
              move.w      A1,X:(SP-1)
_L25_80:
              moveu.b     X:(SP),A
              zxt.b       A,A
              cmp.w       X:(SP-1),A
              bgt         >_L25_81	; *-73
_L25_79:
              nop         
;
; 1649: } 
;
              suba        #<6,SP
              rts         
end_FsciDataReceived:

	ENDSEC

	SECTION Unit_ModHidro

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FModHidro:	ds	208

	ENDSEC


	END
