
	include "asmdef.h"

	SECTION loader ; declarations
		global FInit_SCI
	ENDSEC

	SECTION SCI ; declarations
		global FsciRxBuf
	ENDSEC

	SECTION loader ; declarations
		global FisrSCI0_TDRE
		global FisrSCI0_RDRF
		global FsendSciMsg
	ENDSEC

	SECTION SCI ; declarations
		xref Fmemcpy
	ENDSEC

	SECTION loader ; declarations
		global FtxSci
	ENDSEC

	SECTION loader

	ORG	P:

;
;   40:  
;   41: void Init_SCI(void) 
;   42: { 
;   43: //	SCI0_SCIBR = 4; //921600 
;   44: 	SCI0_SCIBR = 33; //115200 
;   45:  
;   46:     //-----------RX------------- 
;
		subroutine "FInit_SCI",FInit_SCI,end_FInit_SCI-FInit_SCI
FInit_SCI:
              move.l      #$f280,R0
              move.w      #33,X:(R0)
;
;   47:     rxParser = PARSER_PRINC; 
;
              clr.bp      X:>>@lb(FrxParser)
;
;   48:     rxBuf = rxBuf1; 
;
              move.l      #>>@lb(FrxBuf1),R0
              move.l      R0,X:>>FrxBuf
;
;   49:     sciRxBuf = NULL; 
;   50:  
;
              move.w      #<0,R0
              move.l      R0,X:>>FsciRxBuf
;
;   51: 	setRegBit(SIM_GPS, TC0_ALT); 
;   52:  
;
              move.l      #$f35b,R0
              bfset       #$80,X:(R0)
;
;   53: 	setRegBit(SCI0_SCICR, RFIE); 
;
              move.l      #$f281,R0
              bfset       #$20,X:(R0)
;
;   54: 	setRegBit(SIM_GPS, TC1_ALT); 
;   55:  
;
              move.l      #$f35b,R0
              bfset       #$40,X:(R0)
;
;   56: 	setRegBit(SCI0_SCICR, TE); 
;
              move.l      #$f281,R0
              bfset       #8,X:(R0)
;
;   57: 	setRegBit(SCI0_SCICR, RE); 
;
              move.l      #$f281,R0
              bfset       #4,X:(R0)
;
;   58: } 
              rts         
end_FInit_SCI:

	ENDSEC

	SECTION loader

	ORG	P:

;
;   59:  
;   60:  
;   61:  
;   62: //-------------------------------------------------------------------------------------------- 
;   63:  
;   64:  
;   65: void isrSCI0_TDRE() 
;   66: { 
;   67: #pragma interrupt 
;   68:    
;
		subroutine "FisrSCI0_TDRE",FisrSCI0_TDRE,end_FisrSCI0_TDRE-FisrSCI0_TDRE
FisrSCI0_TDRE:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      B2,X:(SP)+
              move.l      B10,X:(SP)+
              move.l      R0,X:(SP)+
              move.l      R1,X:(SP)+
              move.l      R2,X:(SP)+
              move.l      M01,X:(SP)+
              suba        #<2,SP
              adda        #<2,SP
              bfset       #$ffff,M01
;
;   69:   byte *buf = ((byte *)txBuf); 
;   70:  
;
              move.l      #>>@lb(FtxBuf),R0
              move.l      R0,X:(SP)
;
;   71:   SCI0_SCISR; 
;
              move.l      #$f283,R0
              move.w      X:(R0),A
;
;   72:   SCI0_SCIDR = buf[txBufIdx++]; 
;   73:  
;
              moveu.bp    X:>>@lb(FtxBufIdx),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:>>@lb(FtxBufIdx)
              move.l      #$f284,R2
              move.l      X:(SP),R1
              zxt.b       B,B
              move.w      B1,A
              lsrr.l      #<$10,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,A
              move.w      A1,X:(R2)
;
;   74:   if(txBufIdx >= txCantBytes) 
;   75:   { 
;
              moveu.bp    X:>>@lb(FtxCantBytes),A
              cmp.bp      X:>>@lb(FtxBufIdx),A
              bhi         <_L12_0	; *+6
;
;   76:   	clrRegBit(SCI0_SCICR, TEIE);	//Disable transmitter empty interrupt: TEIE = 0 
;   77:   } 
;
              move.l      #$f281,R0
              bfclr       #$80,X:(R0)
;
;   78: } 
_L12_0:
              suba        #<2,SP
              move.l      X:(SP)-,M01
              move.l      X:(SP)-,R2
              move.l      X:(SP)-,R1
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,B
              move.l      X:(SP)-,B2
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrSCI0_TDRE:

	ENDSEC

	SECTION loader

	ORG	P:

;
;   79: //-------------------------------------------------------------------------------------------- 
;   80: void isrSCI0_RDRF() 
;   81: { 
;   82: #pragma interrupt 
;
		subroutine "FisrSCI0_RDRF",FisrSCI0_RDRF,end_FisrSCI0_RDRF-FisrSCI0_RDRF
FisrSCI0_RDRF:
              adda        #<2,SP
              move.l      A2,X:(SP)+
              move.l      A10,X:(SP)+
              move.l      B2,X:(SP)+
              move.l      B10,X:(SP)+
              move.l      R0,X:(SP)+
              move.l      R1,X:(SP)+
              move.l      M01,X:(SP)+
              suba        #<2,SP
              adda        #<2,SP
              bfset       #$ffff,M01
;
;   83: byte Data=0; 
;
              clr.b       X:(SP+>0)
;
;   84: 	SCI0_SCISR; 
;
              move.l      #$f283,R0
              move.w      X:(R0),A
;
;   85: 	SCI0_SCISR=0; 
;
              move.l      #$f283,R0
              move.w      #0,X:(R0)
;
;   86: 	Data=SCI0_SCIDR; 
;   87:    
;
              move.l      #$f284,R0
              move.w      X:(R0),A
              zxt.b       A,A
              move.b      A1,X:(SP)
;
;   88:     switch(rxParser) 
;   89:     { 
;   90:     case PARSER_PRINC: 
;
              moveu.bp    X:>>@lb(FrxParser),A
              zxt.b       A,A
              cmp.w       #<0,A
              beq         <_L18_0	; *+15
              nop         
              cmp.w       #<1,A
              beq         <_L18_1	; *+24
              nop         
              cmp.w       #<2,A
              beq         <_L18_2	; *+46
              nop         
              cmp.w       #<3,A
              beq         >_L18_3	; *+74
              nop         
              nop         
              bra         >_L18_4	; *+108
;
;   91:       if(Data == SFD) 
;   92:       { 
;
_L18_0:
              moveu.b     X:(SP),A
              cmp.b       #35,A
              bne         >_L18_4	; *+103
              nop         
;
;   93:         rxParser = PARSER_LENGTH; 
;   94:       } 
;   95:  
;
              move.w      #<1,A
              move.bp     A1,X:>>@lb(FrxParser)
;
;   96:     break; 
;   97:     case PARSER_LENGTH: 
;
              bra         >_L18_4	; *+96
;
;   98:       rxCantBytes = Data; 
;
_L18_1:
              moveu.b     X:(SP),A
              move.bp     A1,X:>>@lb(FrxCantBytes)
;
;   99:       if(rxCantBytes > SCI_RX_SZ) 
;  100:       { 
;
              moveu.bp    X:>>@lb(FrxCantBytes),A
              zxt.b       A,A
              cmp.w       #257,A
              ble         <_L18_5	; *+6
;
;  101:         rxParser = PARSER_PRINC; 
;
              clr.bp      X:>>@lb(FrxParser)
;
;  102:         return; 
;  103:       } 
;
              bra         >_L18_4	; *+80
;
;  104:       rxBufIdx = 0; 
;
_L18_5:
              clr.bp      X:>>@lb(FrxBufIdx)
;
;  105:       rxParser = PARSER_DATA; 
;  106:  
;
              move.w      #<2,A
              move.bp     A1,X:>>@lb(FrxParser)
;
;  107:     break; 
;  108:     case PARSER_DATA: 
;
              bra         >_L18_4	; *+71
;
;  109:       rxBuf[rxBufIdx++] = Data; 
;
_L18_2:
              moveu.bp    X:>>@lb(FrxBufIdx),B
              move.w      B1,A
              add.w       #<1,A
              move.bp     A1,X:>>@lb(FrxBufIdx)
              move.l      X:>>FrxBuf,R1
              zxt.b       B,B
              move.w      B1,A
              lsrr.l      #<$10,A
              move.l      A10,R0
              adda        R1,R0
              moveu.b     X:(SP),A
              move.bp     A1,X:(R0)
;
;  110:       if(rxBufIdx >= rxCantBytes) 
;  111: 	  { 
;
              moveu.bp    X:>>@lb(FrxCantBytes),A
              cmp.bp      X:>>@lb(FrxBufIdx),A
              bhi         <_L18_4	; *+45
              nop         
;
;  112:         rxParser = PARSER_EOF; 
;  113: 	  } 
;  114:  
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FrxParser)
;
;  115:     break; 
;  116:     case PARSER_EOF: 
;
              bra         <_L18_4	; *+39
;
;  117:       if(Data == EOFRAME) 
;  118:       { 
;
_L18_3:
              moveu.b     X:(SP),A
              cmp.b       #<13,A
              bne         <_L18_6	; *+33
;
;  119: 		if(sciRxBuf == NULL) 
;  120: 		{ 
;
              move.l      X:>>FsciRxBuf,R0
              tsta.l      R0
              bne         <_L18_6	; *+28
;
;  121:           sciRxBuf = rxBuf; 
;  122:            
;
              move.l      X:>>FrxBuf,R0
              move.l      R0,X:>>FsciRxBuf
;
;  123:           if(rxBuf == rxBuf1) 
;  124:           { 
;
              move.l      X:>>FrxBuf,R1
              move.l      #>>@lb(FrxBuf1),R0
              cmpa        R1,R0
              bne         <_L18_7	; *+8
;
;  125:             rxBuf = rxBuf2; 
;
              move.l      #>>@lb(FrxBuf2),R0
              move.l      R0,X:>>FrxBuf
;
;  126:           } 
;  127:           else 
;  128:           { 
;
              bra         <_L18_6	; *+7
;
;  129:             rxBuf = rxBuf1; 
;  130:           } 
;  131: 		} 
;  132:       } 
;  133:  
;
_L18_7:
              move.l      #>>@lb(FrxBuf1),R0
              move.l      R0,X:>>FrxBuf
;
;  134:       rxParser = PARSER_PRINC; 
;  135:  
;  136:     break; 
;  137:     } 
;
_L18_6:
              clr.bp      X:>>@lb(FrxParser)
;
;  138: } 
_L18_4:
              suba        #<2,SP
              move.l      X:(SP)-,M01
              move.l      X:(SP)-,R1
              move.l      X:(SP)-,R0
              move.l      X:(SP)-,B
              move.l      X:(SP)-,B2
              move.l      X:(SP)-,A
              move.l      X:(SP)-,A2
              rti         
end_FisrSCI0_RDRF:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  139:  
;  140: //--------------------------------------------------------------------------------------------    
;  141: void sendSciMsg(byte Comando, void *Data, byte DataLen) 
;  142: { 
;
		subroutine "FsendSciMsg",FsendSciMsg,end_FsendSciMsg-FsendSciMsg
FsendSciMsg:
              adda        #<6,SP
              move.b      Y0,X:(SP)
              move.l      R2,X:(SP-4)
              move.b      Y1,X:(SP-1)
;
;  143:   byte *buf = ((byte *)txBuf); 
;  144:  
;
              move.l      #>>@lb(FtxBuf),R0
              move.l      R0,X:(SP-2)
;
;  145:   if(DataLen > SCI_DLEN_MAX) 
;  146:     return; 
;  147:  
;
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              cmp.w       #256,A
              bgt         <_L24_0	; *+48
              nop         
;
;  148:   buf[0] = SFD; 
;
              move.l      X:(SP-2),R0
              move.w      #<35,A
              move.bp     A1,X:(R0)
;
;  149:   buf[1] = DataLen+1; 
;
              move.l      X:(SP-2),R0
              adda        #<1,R0
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              add.w       #<1,A
              zxt.b       A,A
              move.bp     A1,X:(R0)
;
;  150:   buf[2] = Comando; 
;
              move.l      X:(SP-2),R0
              adda        #<2,R0
              moveu.b     X:(SP),A
              move.bp     A1,X:(R0)
;
;  151:   (void)memcpy(&buf[3], Data, DataLen); 
;
              move.l      X:(SP-2),R2
              adda        #<3,R2
              move.l      X:(SP-4),R3
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              lsrr.l      #<$10,A
              jsr         >Fmemcpy
;
;  152:   buf[3+DataLen] = EOFRAME; 
;  153:    
;
              move.l      X:(SP-2),R1
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              add.w       #<3,A
              asr16       A,A
              move.l      A10,R0
              adda        R1,R0
              move.w      #<13,A
              move.bp     A1,X:(R0)
;
;  154:   txCantBytes = 4 + DataLen; 
;
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              add.w       #<4,A
              zxt.b       A,A
              move.bp     A1,X:>>@lb(FtxCantBytes)
;
;  155:   txBufIdx = 0; 
;  156:  
;
              clr.bp      X:>>@lb(FtxBufIdx)
;
;  157:   setRegBit(SCI0_SCICR, TEIE);	//enable transmitter empty interrupt: TEIE = 0 
;
              move.l      #$f281,R0
              bfset       #$80,X:(R0)
;
;  158: } 
_L24_0:
              suba        #<6,SP
              rts         
end_FsendSciMsg:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  159: //------------------------------------------------------------------------------------------- 
;  160:  
;  161:  
;  162: void txSci(void *Data, byte DataLen) 
;  163: { 
;
		subroutine "FtxSci",FtxSci,end_FtxSci-FtxSci
FtxSci:
              adda        #<6,SP
              move.l      R2,X:(SP-4)
              move.b      Y0,X:(SP)
;
;  164:   byte *buf = ((byte *)txBuf); 
;  165:  
;
              move.l      #>>@lb(FtxBuf),R0
              move.l      R0,X:(SP-2)
;
;  166:   if(DataLen > SCI_DLEN_MAX) 
;  167:     return; 
;  168:  
;
              moveu.b     X:(SP),A
              zxt.b       A,A
              cmp.w       #256,A
              bgt         <_L30_0	; *+21
              nop         
;
;  169:   (void)memcpy(buf, Data, DataLen); 
;  170:    
;
              move.l      X:(SP-2),R2
              move.l      X:(SP-4),R3
              moveu.b     X:(SP),A
              zxt.b       A,A
              lsrr.l      #<$10,A
              jsr         >Fmemcpy
;
;  171:   txCantBytes = DataLen; 
;
              moveu.b     X:(SP),A
              move.bp     A1,X:>>@lb(FtxCantBytes)
;
;  172:   txBufIdx = 0; 
;  173:  
;
              clr.bp      X:>>@lb(FtxBufIdx)
;
;  174:   setRegBit(SCI0_SCICR, TEIE);	//enable transmitter empty interrupt: TEIE = 0 
;
              move.l      #$f281,R0
              bfset       #$80,X:(R0)
;
;  175: } 
;
_L30_0:
              suba        #<6,SP
              rts         
end_FtxSci:

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxParser:	dsb	1

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FtxBufIdx:	dsb	1

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FtxBuf:	dsb	260

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxBuf:	ds	2

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FtxCantBytes:	dsb	1

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxCantBytes:	dsb	1

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxBufIdx:	dsb	1

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FsciRxBuf:	ds	2

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxBuf1:	dsb	257

	ENDSEC

	SECTION SCI

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FrxBuf2:	dsb	257

	ENDSEC


	END
