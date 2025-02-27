
	include "asmdef.h"

	SECTION Unit_AeroGen ; declarations
		global FAeroGeneFlash
	ENDSEC

	SECTION Unit_AeroGen ; declarations
		global FInit_Disp
	ENDSEC

	SECTION Unit_AeroGen ; declarations
		global FAeroGene
	ENDSEC

	SECTION Unit_AeroGen ; declarations
		global FsciDataReceived
	ENDSEC

	SECTION Unit_AeroGen ; declarations
		xref FDataFlash_SetGlobalProtection
		xref FDataFlash_EraseFlash
		xref FDataFlash_SetBlockFlash
		xref FsendSciMsg
	ENDSEC

	SECTION Unit_AeroGen

	ORG	X:

;			*** INITIALIZED DATA (.const.data) ***

			align 2
		FAeroGeneFlash:
			dc	$6541,$6F72,$6547,$656E,$6172,$0000,$0000,$0000,$003C,$0000,$0000,$4270,$0000,$0000,$0000,$0000,$003C,$0000,$0000,$4270		; 25921,28530,25927,25966,24946,0,0,0,60,0,0,17008,0,0,0,0,60,0,0,17008
			dc	$0000,$0000,$0000,$0000,$000C,$0000,$0000,$0000,$0000,$40A0,$CCCD,$3DCC,$0000,$3F80,$0000,$0000,$0000,$0000,$0078,$0000		; 0,0,0,0,12,0,0,0,0,16544,52429,15820,0,16256,0,0,0,0,120,0
			dc	$00F0,$0000,$0000,$0000		; 240,0,0,0
	ENDSEC

	SECTION Unit_AeroGen

	ORG	P:

;
;   81:  
;   82:  
;   83: void Init_Disp(void) 
;   84: { 
;   85:   AeroGene=AeroGeneFlash; 
;
		subroutine "FInit_Disp",FInit_Disp,end_FInit_Disp-FInit_Disp
FInit_Disp:
              move.l      #>>FAeroGene,R1
              move.l      #>>FAeroGeneFlash,R0
              move.w      #<22,B
_L7_0:
              move.l      X:(R0)+,A
              move.l      A10,X:(R1)+
              dec.w       B
              bgt         <_L7_0	; *-3
;
;   86:   AeroGene.Gen.Pos.dwrd=0; 
;
              move.l      #>>FAeroGene+6,R0
              clr.l       X:(R0)
;
;   87:   AeroGene.Gen.Turn.dwrd=0; 
;
              move.l      #>>FAeroGene+12,R0
              clr.l       X:(R0)
;
;   88:   AeroGene.GenSim.Pos.dwrd=0; 
;
              move.l      #>>FAeroGene+14,R0
              clr.l       X:(R0)
;
;   89:   AeroGene.GenSim.Turn.dwrd=0; 
;
              move.l      #>>FAeroGene+20,R0
              clr.l       X:(R0)
;
;   90:   AeroGene.Exita.Pos.dwrd=0; 
;
              move.l      #>>FAeroGene+22,R0
              clr.l       X:(R0)
;
;   91:   AeroGene.Exita.Turn.dwrd=0; 
;
              move.l      #>>FAeroGene+26,R0
              clr.l       X:(R0)
;
;   92:   AeroGene.Status.dwrd=0; 
;
              move.l      #>>FAeroGene+42,R0
              clr.l       X:(R0)
;
;   93:   IntCircuitOff; 
;
              move.l      #$f311,R0
              bfclr       #4,X:(R0)
;
;   94:   OutExitatrizOff; 
;
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
;   95:   OutLedExitOff; 
;
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
;   96:   OutGeneratorOff; 
;
              move.l      #$f311,R0
              bfclr       #8,X:(R0)
;
;   97:   OutLambdaOff; 
;
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
;   98: } 
              rts         
end_FInit_Disp:

	ENDSEC

	SECTION Unit_AeroGen

	ORG	P:

;
;   99: //-------------------------------------------------------------------------------------------------------------- 
;  100:  
;  101: void sciDataReceived(byte *buf) 
;  102: { 
;  103:   TDato32 *dato; 
;
		subroutine "FsciDataReceived",FsciDataReceived,end_FsciDataReceived-FsciDataReceived
FsciDataReceived:
              adda        #<6,SP
              move.l      R2,X:(SP-4)
;
;  104:   byte dataLen32=0; 
;  105:   int i; 
;  106:  
;  107:  
;
              clr.b       X:(SP+>0)
;
;  108:   switch(buf[0]) 
;  109:   { 
;  110:   //Caso en los que se recive un comando 
;  111:   case CMD_AEG_SAVE: 
;
              move.l      X:(SP-4),R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              cmp.w       #49,B
              bgt         >_L13_0	; *+104
              cmp.w       #49,B
              blt         <_L13_1	; *+5
              nop         
              nop         
              bra         >_L13_2	; *+352
_L13_1:
              cmp.w       #32,B
              bgt         >_L13_3	; *+85
              nop         
              cmp.w       #<0,B
              blt         >_L13_4	; *+400
              nop         
              move.w      B1,A
              add.w       #>0,A
              move.w      A1,N
              adda.l      #>>_L13_5,N,R0
              move.w      P:(R0)+,A1
              lsr16       A,A
              move.w      P:(R0)+,A1
              move.l      A10,N
              jmp         (N)
_L13_5:
              dc          _L13_6                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_7                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_8                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_9                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_10                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_11                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_12                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_13                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_14                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_15                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_16                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_17                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_18                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_19                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_4                      ; Switch Table Entry
              add         B,A           A,X:(R0)+
              dc          _L13_20                     ; Switch Table Entry
              add         B,A           A,X:(R0)+
_L13_3:
              cmp.w       #48,B
              beq         >_L13_21	; *+254
              nop         
              nop         
              bra         >_L13_4	; *+313
_L13_0:
              cmp.w       #81,B
              bgt         <_L13_22	; *+16
              cmp.w       #81,B
              blt         <_L13_23	; *+5
              nop         
              nop         
              bra         >_L13_24	; *+286
_L13_23:
              cmp.w       #80,B
              beq         >_L13_25	; *+271
              nop         
              nop         
              bra         >_L13_4	; *+295
_L13_22:
              cmp.w       #165,B
              beq         >_L13_26	; *+284
              nop         
              nop         
              bra         >_L13_4	; *+287
;
;  112:     dataLen32=DataFlash_SetGlobalProtection(0); 
;
_L13_6:
              move.w      #<0,Y0
              jsr         >FDataFlash_SetGlobalProtection
              move.b      Y0,X:(SP)
;
;  113:     DataFlash_EraseFlash(0); 
;
              move.w      #<0,Y0
              jsr         >FDataFlash_EraseFlash
;
;  114:     dataLen32=DataFlash_SetBlockFlash(2*(DataFlash_TAddress)&AeroGene, 2*(DataFlash_TAddress)&AeroGeneFlash, sizeof(AeroGene)); 
;
              move.l      #>>FAeroGene,R0
              move.l      R0,A
              asll.l      #<1,A
              move.l      #>>FAeroGeneFlash,R0
              move.l      R0,B
              asll.l      #<1,B
              move.w      #88,Y0
              jsr         >FDataFlash_SetBlockFlash
              move.b      Y0,X:(SP)
;
;  115:     dataLen32=DataFlash_SetGlobalProtection(1); 
;
              move.w      #<1,Y0
              jsr         >FDataFlash_SetGlobalProtection
              move.b      Y0,X:(SP)
;
;  116:     dato = (TDato32 *)&AeroGene; 
;
              move.l      #>>FAeroGene,R0
              move.l      R0,X:(SP-2)
;
;  117:     dataLen32 = sizeof(AeroGene)/4; 
;
              move.w      #<22,A
              move.b      A1,X:(SP)
;
;  118:   break; 
;  119:   case CMD_AEG_STATUS: 
;
              bra         >_L13_27	; *+255
;
;  120:     dato = (TDato32 *)&AeroGene.Status; 
;
_L13_7:
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  121:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  122:   break; 
;  123:   case CMD_AEG_STT_INTC_ON: 
;
              bra         >_L13_27	; *+247
;
;  124:     IntCircuitOn; 
;
_L13_8:
              move.l      #$f311,R0
              bfset       #4,X:(R0)
;
;  125:   	AeroGene.Status.dwrd|=STAT_AEG_INTC; 
;
              move.l      #>>FAeroGene+42,R0
              bfset       #2,X:(R0)
;
;  126:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  127:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  128:   break; 
;  129:   case CMD_AEG_STT_INTC_OFF: 
;
              bra         >_L13_27	; *+229
;
;  130:     IntCircuitOff; 
;
_L13_9:
              move.l      #$f311,R0
              bfclr       #4,X:(R0)
;
;  131:   	AeroGene.Status.dwrd &=~ STAT_AEG_INTC; 
;
              move.l      #>>FAeroGene+42,R0
              bfclr       #2,X:(R0)
;
;  132:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  133:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  134:   break; 
;  135:   case CMD_AEG_STT_EXIT_ON: 
;
              bra         >_L13_27	; *+211
;
;  136:   	OutExitatrizOn; 
;
_L13_10:
              move.l      #$f2e1,R0
              bfset       #$400,X:(R0)
;
;  137:   	OutLedExitOn; 
;
              move.l      #$f2e1,R0
              bfset       #$100,X:(R0)
;
;  138:   	AeroGene.Status.dwrd|=STAT_AEG_EXIT; 
;
              move.l      #>>FAeroGene+42,R0
              bfset       #1,X:(R0)
;
;  139:     AeroGene.Status.dwrd|=STAT_AEG_LEDEXIT; 
;
              move.l      #>>FAeroGene+42,R0
              bfset       #$10,X:(R0)
;
;  140:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  141:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  142:   break; 
;  143:   case CMD_AEG_STT_EXIT_OFF: 
;
              bra         >_L13_27	; *+183
;
;  144:   	OutExitatrizOff; 
;
_L13_11:
              move.l      #$f2e1,R0
              bfclr       #$400,X:(R0)
;
;  145:   	OutLedExitOff; 
;
              move.l      #$f2e1,R0
              bfclr       #$100,X:(R0)
;
;  146:   	AeroGene.Status.dwrd &=~ STAT_AEG_EXIT; 
;
              move.l      #>>FAeroGene+42,R0
              bfclr       #1,X:(R0)
;
;  147:     AeroGene.Status.dwrd &=~ STAT_AEG_LEDEXIT; 
;
              move.l      #>>FAeroGene+42,R0
              bfclr       #$10,X:(R0)
;
;  148:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  149:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  150:   break; 
;  151:   case CMD_AEG_STT_GEN_ON: 
;
              bra         >_L13_27	; *+155
;
;  152:   	OutGeneratorOn; 
;
_L13_12:
              move.l      #$f311,R0
              bfset       #8,X:(R0)
;
;  153: 	AeroGene.Status.dwrd|=STAT_AEG_GEN; 
;
              move.l      #>>FAeroGene+42,R0
              bfset       #4,X:(R0)
;
;  154:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  155:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  156:   break; 
;  157:   case CMD_AEG_STT_GEN_OFF: 
;
              bra         >_L13_27	; *+137
;
;  158:   	OutGeneratorOff; 
;
_L13_13:
              move.l      #$f311,R0
              bfclr       #8,X:(R0)
;
;  159: 	AeroGene.Status.dwrd &=~ STAT_AEG_GEN; 
;
              move.l      #>>FAeroGene+42,R0
              bfclr       #4,X:(R0)
;
;  160:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  161:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  162:   break; 
;  163:   case CMD_AEG_STT_LAM_ON: 
;
              bra         >_L13_27	; *+119
;
;  164:   	OutLambdaOn; 
;
_L13_14:
              move.l      #$f2e1,R0
              bfset       #$80,X:(R0)
;
;  165: 	AeroGene.Status.dwrd|=STAT_AEG_LAMB; 
;
              move.l      #>>FAeroGene+42,R0
              bfset       #8,X:(R0)
;
;  166:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  167:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  168:   break; 
;  169:   case CMD_AEG_STT_LAM_OFF: 
;
              bra         >_L13_27	; *+101
;
;  170:   	OutLambdaOff; 
;
_L13_15:
              move.l      #$f2e1,R0
              bfclr       #$80,X:(R0)
;
;  171: 	AeroGene.Status.dwrd &=~ STAT_AEG_LAMB; 
;
              move.l      #>>FAeroGene+42,R0
              bfclr       #8,X:(R0)
;
;  172:     dato = (TDato32 *)&AeroGene.Status; 
;
              move.l      #>>FAeroGene+42,R0
              move.l      R0,X:(SP-2)
;
;  173:     dataLen32 = sizeof(AeroGene.Status)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  174:   break; 
;  175:   case CMD_AEG_GEN: 
;
              bra         >_L13_27	; *+83
;
;  176:     dato = (TDato32 *)&AeroGene.GenSim; 
;
_L13_16:
              move.l      #>>FAeroGene+14,R0
              move.l      R0,X:(SP-2)
;
;  177:     dataLen32 = sizeof(AeroGene.GenSim)/4; 
;
              move.w      #<4,A
              move.b      A1,X:(SP)
;
;  178:   break; 
;  179:   case CMD_AEG_GENSIM: 
;
              bra         >_L13_27	; *+75
;
;  180:     dato = (TDato32 *)&AeroGene.GenSim; 
;
_L13_20:
              move.l      #>>FAeroGene+14,R0
              move.l      R0,X:(SP-2)
;
;  181:     dataLen32 = sizeof(AeroGene.GenSim)/4; 
;
              move.w      #<4,A
              move.b      A1,X:(SP)
;
;  182:   break; 
;  183:   case CMD_AEG_EXITA: 
;
              bra         >_L13_27	; *+67
;
;  184:     dato = (TDato32 *)&AeroGene.Exita; 
;
_L13_21:
              move.l      #>>FAeroGene+22,R0
              move.l      R0,X:(SP-2)
;
;  185:     dataLen32 = sizeof(AeroGene.Exita)/4; 
;
              move.w      #<7,A
              move.b      A1,X:(SP)
;
;  186:   break; 
;  187:   case CMD_AEG_EXITA_OUT: 
;
              bra         <_L13_27	; *+59
;
;  188:     dato = (TDato32 *)&AeroGene.Exita.Out; 
;
_L13_2:
              move.l      #>>FAeroGene+28,R0
              move.l      R0,X:(SP-2)
;
;  189:     dataLen32 = sizeof(AeroGene.Exita.Out)/4; 
;
              move.w      #<2,A
              move.b      A1,X:(SP)
;
;  190:   break; 
;  191:   case CMD_AEG_SET_FASE1: 
;
              bra         <_L13_27	; *+52
;
;  192:     dato = (TDato32 *)&AeroGene.Fase1; 
;
_L13_17:
              move.l      #>>FAeroGene+36,R0
              move.l      R0,X:(SP-2)
;
;  193:     dataLen32 = sizeof(AeroGene.Fase1)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  194:   break; 
;  195:   case CMD_AEG_SET_FASE2: 
;
              bra         <_L13_27	; *+45
;
;  196:     dato = (TDato32 *)&AeroGene.Fase2; 
;
_L13_18:
              move.l      #>>FAeroGene+38,R0
              move.l      R0,X:(SP-2)
;
;  197:     dataLen32 = sizeof(AeroGene.Fase2)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  198:   break; 
;  199:   case CMD_AEG_SET_FASE3: 
;
              bra         <_L13_27	; *+38
;
;  200:     dato = (TDato32 *)&AeroGene.Fase3; 
;
_L13_19:
              move.l      #>>FAeroGene+40,R0
              move.l      R0,X:(SP-2)
;
;  201:     dataLen32 = sizeof(AeroGene.Fase3)/4; 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
;
;  202:   break; 
;  203:  
;  204:  
;  205:   //Caso en los que se recive un pedido de Datos 
;  206:   case DRQ_AEG: 
;
              bra         <_L13_27	; *+31
;
;  207:     sendSciMsg(DATA_AEG, &AeroGene, sizeof(AeroGene)); 
;
_L13_25:
              move.w      #160,Y0
              move.l      #>>FAeroGene,R0
              asla        R0,R2
              move.w      #88,Y1
              jsr         >FsendSciMsg
;
;  208:   break; 
;  209:   case DRQ_AEG_STATUS: 
;
              bra         <_L13_27	; *+20
;
;  210:     sendSciMsg(DATA_AEG_STATUS, &AeroGene.Status, sizeof(AeroGene.Status)); 
;
_L13_24:
              move.w      #161,Y0
              move.l      #>>FAeroGene+42,R0
              asla        R0,R2
              move.w      #<4,Y1
              jsr         >FsendSciMsg
;
;  211:   break; 
;  212:    
;  213:    
;  214:    
;  215:    
;  216:   case DATA_AEG_SET_CONST: 
;
              bra         <_L13_27	; *+10
;
;  217:     dato = (TDato32 *)&AeroGene.Const; 
;
_L13_26:
              move.l      #>>FAeroGene,R0
              move.l      R0,X:(SP-2)
;
;  218:     dataLen32 = sizeof(AeroGene.Const)/4; 
;
              move.w      #<3,A
              move.b      A1,X:(SP)
;
;  219:   break; 
;  220:    
;  221:    
;  222:   default: 
;
              bra         <_L13_27	; *+3
;
;  223:   return; 
;  224:   } 
;  225:  
;
_L13_4:
              bra         >_L13_28	; *+81
;
;  226:   for(i = 0; i < dataLen32; i++) 
;  227:   { 
;
_L13_27:
              clr.w       X:(SP->1)
              bra         >_L13_29	; *+72
;
;  228:     dato[i].byt[0] = buf[4*i+1]; 
;
_L13_30:
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
;  229:     dato[i].byt[1] = buf[4*i+2]; 
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
;  230:     dato[i].byt[2] = buf[4*i+3]; 
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
;  231:     dato[i].byt[3] = buf[4*i+4]; 
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
;  232:   } 
;  233:  
;
              move.w      X:(SP-1),A
              add.w       #<1,A
              move.w      A1,X:(SP-1)
_L13_29:
              moveu.b     X:(SP),A
              zxt.b       A,A
              cmp.w       X:(SP-1),A
              bgt         >_L13_30	; *-73
_L13_28:
              nop         
;
;  234: } 
;
              suba        #<6,SP
              rts         
end_FsciDataReceived:

	ENDSEC

	SECTION Unit_AeroGen

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FAeroGene:	ds	44

	ENDSEC


	END
