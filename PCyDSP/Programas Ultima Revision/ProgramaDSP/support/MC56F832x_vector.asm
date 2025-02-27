
 
 

; metrowerks sample code



	section interrupt_routines
	org	p:
	
M56832x_intRoutine:
	debughlt
	nop
	nop
	rti

M56832x_illegal:
	debughlt	; illegal instruction interrupt ($04)
	nop
	nop
	rti
	
M56832x_HWSOverflow:
	debughlt	; hardware stack overflow interrupt ($08)
	nop
	nop
	rti
	
M56832x_misalign:
	debughlt	; misaligned long word access interrupt ($0A)
	nop
	nop
	rti

M56832x_PLL:
	debughlt	; PLL lost of lock interrupt ($28)
	nop
	nop 
	rti

    endsec
  
  
  
    
	section interrupt_vectors
	org	p:
	
	global	FM56832x_intVec

FM56832x_intVec:

	jsr >Finit_MC56F83xx_      ; RESET                                           ($00)
	jsr >M56832x_intRoutine    ; COP Watchdog reset                              ($02)
	jsr >M56832x_illegal       ; illegal instruction                             ($04)
	jsr >M56832x_intRoutine    ; software interrupt 3                            ($06)
	jsr >M56832x_HWSOverflow   ; hardware stack overflow                         ($08)
	jsr >M56832x_misalign      ; misaligned long word access                     ($0A)
	jsr >M56832x_intRoutine    ; EOnCE step counter                              ($0C)
	jsr >M56832x_intRoutine    ; EOnCE breakpoint unit 0                         ($0E)
	jsr >M56832x_intRoutine    ; reserved                                        ($10)
	jsr >M56832x_intRoutine    ; EOnCE trace buffer                              ($12)
	jsr >M56832x_intRoutine    ; EOnCE transmit register empty                   ($14)
	jsr >M56832x_intRoutine    ; EOnCE receive register full                     ($16)
	jsr >M56832x_intRoutine    ; reserved                                        ($18)
	jsr >M56832x_intRoutine    ; reserved                                        ($1A)
	jsr >M56832x_intRoutine    ; software interrupt 2                            ($1C)
	jsr >M56832x_intRoutine    ; software interrupt 1                            ($1E)
	jsr >M56832x_intRoutine    ; software interrupt 0                            ($20)
	jsr >M56832x_intRoutine    ; IRQA                                            ($22)
	jsr >M56832x_intRoutine    ; reserved                                        ($24)
	jsr >M56832x_intRoutine    ; reserved                                        ($26)
	jsr >M56832x_intRoutine    ; Low Voltage Detector (power sense)              ($28)
	jsr >M56832x_PLL           ; PLL                                             ($2A)
	jsr >M56832x_intRoutine    ; FM Error Interrupt                              ($2C)
	jsr >M56832x_intRoutine    ; FM Command Complete                             ($2E)
	jsr >M56832x_intRoutine    ; FM Command, data and address Buffers Empty      ($30)
	jsr >M56832x_intRoutine    ; reserved                                        ($32)
	jsr >M56832x_intRoutine    ; FLEXCAN Bus Off                                 ($34)
	jsr >M56832x_intRoutine    ; FLEXCAN Error                                   ($36)
	jsr >M56832x_intRoutine    ; FLEXCAN Wake Up                                 ($38)
	jsr >M56832x_intRoutine    ; FLEXCAN Message Buffer Interrupt                ($3A)
	jsr >M56832x_intRoutine    ; reserved                                        ($3C)
	jsr >M56832x_intRoutine    ; reserved                                        ($3E)
	jsr >M56832x_intRoutine    ; reserved                                        ($40)
	jsr >M56832x_intRoutine    ; GPIO C                                          ($42)
	jsr >M56832x_intRoutine    ; GPIO B                                          ($44)
	jsr >M56832x_intRoutine    ; GPIO A                                          ($46)
	jsr >M56832x_intRoutine    ; reserved                                        ($48)
	jsr >M56832x_intRoutine    ; reserved                                        ($4A)
	jsr >M56832x_intRoutine    ; SPI 1 receiver full                             ($4C)
	jsr >M56832x_intRoutine    ; SPI 1 transmitter empty                         ($4E)
	jsr >FisrSPI0_Receiver		; SPI 0 receiver                                  ($50)
	jsr >FisrSPI0_Transmiter	; SPI 0 transmitter                               ($52)
	jsr >M56832x_intRoutine    ; SCI 1 transmitter empty                         ($54)
	jsr >M56832x_intRoutine    ; SCI 1 transmitter idle                          ($56)
	jsr >M56832x_intRoutine    ; reserved                                        ($58)
	jsr >M56832x_intRoutine    ; SCI 1 receiver error                            ($5A)
	jsr >M56832x_intRoutine    ; SCI 1 receiver full                             ($5C)
	jsr >M56832x_intRoutine    ; reserved                                        ($5E)
	jsr >M56832x_intRoutine    ; reserved                                        ($60)
	jsr >M56832x_intRoutine    ; quadrature decoder #0 home switch or watchdog   ($62)
	jsr >M56832x_intRoutine    ; quadrature decoder #0 index pulse               ($64)
	jsr >M56832x_intRoutine    ; reserved                                        ($66)
	jsr >M56832x_intRoutine    ; reserved                                        ($68)
	jsr >M56832x_intRoutine    ; reserved                                        ($6A)
	jsr >M56832x_intRoutine    ; reserved                                        ($6C)
	jsr >M56832x_intRoutine    ; reserved                                        ($6E)
	jsr >FisrTimerC0           ; timer C channel 0                               ($70)
	jsr >FisrTimerC1           ; timer C channel 1                               ($72)
	jsr >FisrTimerC2           ; timer C channel 2                               ($74)
	jsr >FisrTimerC3	       ; timer C channel 3                               ($76)
	jsr >M56832x_intRoutine    ; reserved                                        ($78)
	jsr >M56832x_intRoutine    ; reserved                                        ($7A)
	jsr >M56832x_intRoutine    ; reserved                                        ($7C)
	jsr >M56832x_intRoutine    ; reserved                                        ($7E)
	jsr >FisrTimerA0     	   ; timer A channel 0                               ($80)
	jsr >FisrTimerA1           ; timer A channel 1                               ($82)
	jsr >FisrTimerA2           ; timer A channel 2                               ($84)
	jsr >FisrTimerA3           ; timer A channel 3                               ($86)
	jsr >FisrSCI0_TDRE	       ; SCI 0 transmitter empty                         ($88)
	jsr >M56832x_intRoutine    ; SCI 0 transmitter idle                          ($8A)
	jsr >M56832x_intRoutine    ; reserved                                        ($8C)
	jsr >M56832x_intRoutine    ; SCI 0 receiver error                            ($8E)
	jsr >FisrSCI0_RDRF			; SCI 0 receiver full                             ($90)
	jsr >M56832x_intRoutine    ; reserved                                        ($92)
	jsr >FisrADCAConvCompl		; ADC A conversion complete                       ($94)
	jsr >M56832x_intRoutine    ; reserved                                        ($96)
	jsr >M56832x_intRoutine    ; ADC A zero crossing of limit error              ($98)
	jsr >M56832x_intRoutine    ; reserved                                        ($9A)
	jsr >FisrPWMA_RL				; reload PWM A                                    ($9C)
	jsr >M56832x_intRoutine    ; reserved                                        ($9E)
	jsr >M56832x_intRoutine    ; PWM A fault                                     ($A0)
    jsr >M56832x_intRoutine    ; SW interrupt LP                                 ($A2)
 
	endsec	

	end

