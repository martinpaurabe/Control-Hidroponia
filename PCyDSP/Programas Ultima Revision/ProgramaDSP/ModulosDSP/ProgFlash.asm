
	include "asmdef.h"

	SECTION ProgFlash ; declarations
		global FProgFlash_EraseFlash
		global FProgFlash_GetByteFlash
		global FProgFlash_SetGlobalProtection
		global FProgFlash_SetBlockFlash
	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;   74: **         This method is internal. It is used by Processor Expert only. 
;   75: ** =================================================================== 
;   76: */ 
;   77: static byte OutOfRange(ProgFlash_TAddress addr1,ProgFlash_TAddress addr2) 
;   78: { 
;
		subroutine "FOutOfRange",FOutOfRange,end_FOutOfRange-FOutOfRange
FOutOfRange:
              adda        #<4,SP
              move.l      A10,X:(SP)
              move.l      B10,X:(SP-2)
;
;   79:   return ((addr1>addr2)||((addr1>=BOOT_FLASH_START)?((addr2>BOOT_FLASH_END)):((addr1<PROG_FLASH_START)||(addr2>PROG_FLASH_END)))); 
;
              move.w      #<1,Y0
              move.l      X:(SP),B
              move.l      X:(SP-2),A
              cmp.l       B,A
              bcs         <_L6_0	; *+35
              nop         
              move.l      X:(SP),B
              move.l      #$20000,A
              cmp.l       B,A
              bhi         <_L6_1	; *+12
              nop         
              move.l      X:(SP-2),B
              move.l      #$20fff,A
              cmp.l       B,A
              clr.w       A
              bcc         <_L6_2	; *+3
              nop         
              move.w      #<1,A
_L6_2:
              bra         <_L6_3	; *+13
_L6_1:
              move.l      X:(SP-2),A
              cmp.l       #16383,A
              clr.w       A
              bls         <_L6_4	; *+3
              nop         
              move.w      #<1,A
_L6_4:
              tst.w       A1
              bftstl      #4,SR
              move.w      SR,A
              and.w       #<1,A
_L6_3:
              tst.w       A1
              bne         <_L6_0	; *+3
              nop         
              move.w      #<0,Y0
_L6_0:
              zxt.b       Y0,Y0
;
;   80: } 
              suba        #<4,SP
              rts         
end_FOutOfRange:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;   81:  
;   82: /* 
;   83: ** =================================================================== 
;   84: **     Method      :  ProgFlash_SectorSize (component IntFLASH) 
;   85: ** 
;   86: **     Description : 
;   87: **         The method returns flash memory sector (erase page) size of a  
;   88: **         desired area. 
;   89: **         This method is internal. It is used by Processor Expert only. 
;   90: ** =================================================================== 
;   91: */ 
;   92: #define SectorSize(addr) (addr+1>BOOT_FLASH_START-1?(BOOT_FLASH_SECTOR_SIZE):(PROG_FLASH_SECTOR_SIZE)) 
;   93:  
;   94: /* 
;   95: ** =================================================================== 
;   96: **     Method      :  ClearFlags (component IntFLASH) 
;   97: ** 
;   98: **     Description : 
;   99: **         The method clears the flash memory interface complete and  
;  100: **         error flags. 
;  101: **         This method is internal. It is used by Processor Expert only. 
;  102: ** =================================================================== 
;  103: */ 
;  104: #define ClearFlags() setReg(FMUSTAT,0x30) 
;  105:  
;  106: /* 
;  107: ** =================================================================== 
;  108: **     Method      :  readflash (component IntFLASH) 
;  109: ** 
;  110: **     Description : 
;  111: **         The method reads 16-bit word from a flash memory. 
;  112: **         This method is internal. It is used by Processor Expert only. 
;  113: ** =================================================================== 
;  114: */ 
;  115: /*lint -save -e745 -e939 -e533 -e82 Disable MISRA rule (75,83,84) checking. */ 
;  116: static asm word readflash(ProgFlash_TAddress address) 
;  117: { 
;  118:   move.l A10,R2;                       /* Move given address to pointer register */ 
;
		subroutine "Freadflash",Freadflash,end_Freadflash-Freadflash
Freadflash:
              move.l      A10,R2
;
;  119:   move.w p:(r2)+,y0;                   /* Read data from program memory */ 
;
              move.w      P:(R2)+,Y0
;
;  120:   rts; 
;  121: } 
              rts         
end_Freadflash:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  122: /*lint -restore */ 
;  123:  
;  124: /* 
;  125: ** =================================================================== 
;  126: **     Method      :  writeflash (component IntFLASH) 
;  127: ** 
;  128: **     Description : 
;  129: **         The method writes 16-bit word to a flash memory. 
;  130: **         This method is internal. It is used by Processor Expert only. 
;  131: ** =================================================================== 
;  132: */ 
;  133: /*lint -save -e745 -e939 -e533 -e82 Disable MISRA rule (75,83,84) checking. */ 
;  134: static asm word writeflash(ProgFlash_TAddress address, word data) 
;  135: { 
;  136:   move.l A10,R2;                       /* Move given address to pointer register */ 
;
		subroutine "Fwriteflash",Fwriteflash,end_Fwriteflash-Fwriteflash
Fwriteflash:
              move.l      A10,R2
;
;  137:   move.w Y0,p:(R2)+;                   /* Write given data to desired address in program memory */ 
;
              move.w      Y0,P:(R2)+
;
;  138:   rts; 
;  139: } 
              rts         
end_Fwriteflash:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  140: /*lint -restore */ 
;  141:  
;  142: /* 
;  143: ** =================================================================== 
;  144: **     Method      :  procflash (component IntFLASH) 
;  145: ** 
;  146: **     Description : 
;  147: **         The method programs 16-bit word to a flash memory. 
;  148: **         This method is internal. It is used by Processor Expert only. 
;  149: ** =================================================================== 
;  150: */ 
;  151: static byte procflash(ProgFlash_TAddress address, word data, word command) 
;  152: { 
;
		subroutine "Fprocflash",Fprocflash,end_Fprocflash-Fprocflash
Fprocflash:
              adda        #<4,SP
              move.l      A10,X:(SP-2)
              move.w      Y0,X:(SP)
              move.w      Y1,X:(SP-1)
;
;  153:   if (ProgFlash_Busy())                /* Is a command in progress in any of the flash devices? */ 
;
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L21_0	; *+27
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L21_1	; *+8
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.w      #<0,A
              bra         <_L21_2	; *+7
_L21_1:
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.w      #<1,A
_L21_2:
              bra         <_L21_3	; *+2
_L21_0:
              move.w      #<1,A
_L21_3:
              zxt.b       A,A
              tst.b       A
              beq         <_L21_4	; *+4
              nop         
;
;  154:     return ERR_BUSY;                   /* If yes then error */ 
;
              move.w      #<8,Y0
              bra         <_L21_5	; *+40
;
;  155:   ClearFlags();                        /* Clear all flags */ 
;
_L21_4:
              move.l      #$f413,R0
              move.w      #48,X:(R0)
;
;  156:   writeflash(address, data);           /* Write given data to the flash memory */ 
;
              move.l      X:(SP-2),A
              move.w      X:(SP),Y0
              jsr         >Fwriteflash
;
;  157:   setReg(FMCMD,command);               /* Write given command to FMCMD register */ 
;
              move.l      #$f414,R0
              move.w      X:(SP-1),A
              move.w      A1,X:(R0)
;
;  158:   setReg(FMUSTAT,0x80);                /* launch the command */ 
;
              move.l      #$f413,R0
              move.w      #128,X:(R0)
;
;  159:   if ((getRegBit(FMUSTAT,PVIOL))||(getRegBit(FMUSTAT,ACCERR))) /* Is protection violation or access error detected ? */ 
;
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$20,A1
              bcc         <_L21_6	; *+8
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$10,A1
              bcs         <_L21_7	; *+4
_L21_6:
              nop         
;
;  160:     return ERR_NOTAVAIL;               /* If yes then return the error */ 
;
              move.w      #<9,Y0
              bra         <_L21_5	; *+4
;
;  161:   return Err; 
;
_L21_7:
              moveu.bp    X:>>@lb(FErr),Y0
;
;  162: } 
_L21_5:
              suba        #<4,SP
              rts         
end_Fprocflash:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  163:  
;  164: /* 
;  165: ** =================================================================== 
;  166: **     Method      :  WriteBlock (component IntFLASH) 
;  167: ** 
;  168: **     Description : 
;  169: **         The metohd writes block of data to a flash memory. 
;  170: **         This method is internal. It is used by Processor Expert only. 
;  171: ** =================================================================== 
;  172: */ 
;  173: static byte WriteBlock(ProgFlash_TAddress Source, ProgFlash_TAddress Dest, dword Count) 
;  174: { 
;  175:   register word i, DataToWrite; 
;  176:   register dword s_index, Addr, LastAddr, Size; 
;  177:   register bool ByteFirst, ByteLast; 
;  178:  
;
		subroutine "FWriteBlock",FWriteBlock,end_FWriteBlock-FWriteBlock
FWriteBlock:
              adda        #<2,SP
              move.l      C10,X:(SP)+
              move.l      D10,X:(SP)
              adda        #<10,SP
              move.l      A10,X:(SP-6)
              move.l      B10,X:(SP-8)
;
;  179:   Err = ERR_OK; 
;
              clr.bp      X:>>@lb(FErr)
;
;  180:   Addr = (dword)Dest / 2; 
;
              move.l      X:(SP-8),D
              lsrr.l      #<1,D
;
;  181:   if ((dword)Dest % 2 > 0) 
;
              move.l      X:(SP-8),A
              and.l       #<1,A
              tst.l       A
              beq         <_L27_0	; *+4
;
;  182:     ByteFirst = TRUE; 
;  183:   else 
;
              move.w      #1,X:(SP-1)
              bra         <_L27_1	; *+3
;
;  184:     ByteFirst = FALSE; 
;
_L27_0:
              move.w      #0,X:(SP-1)
;
;  185:   LastAddr = (dword)Dest + Count; 
;
_L27_1:
              move.l      X:(SP-8),A
              move.l      X:(SP-$10),B
              add         A,B
;
;  186:   if (LastAddr % 2 > 0) 
;
              tfr         B,A
              and.l       #<1,A
              tst.l       A
              beq         <_L27_2	; *+4
;
;  187:     ByteLast = TRUE; 
;  188:   else 
;
              move.w      #1,X:(SP)
              bra         <_L27_3	; *+3
;
;  189:     ByteLast = FALSE; 
;
_L27_2:
              move.w      #0,X:(SP)
;
;  190:   LastAddr = (LastAddr - 1) / 2; 
;
_L27_3:
              add.l       #-1,B
              lsrr.l      #<1,B
;
;  191:   Size = (LastAddr - Addr) + 1; 
;
              move.l      B10,X:(SP-4)
              move.l      X:(SP-4),A
              sub         D,A
              move.l      A10,X:(SP-4)
              move.l      X:(SP-4),A
              add.l       #1,A
              move.l      A10,X:(SP-4)
;
;  192:   if (OutOfRange(Addr,LastAddr))       /* Is the address out of range? */ 
;
              tfr         D,A
              jsr         >FOutOfRange
              tst.b       Y0
              beq         <_L27_4	; *+5
              nop         
;
;  193:     return(ERR_RANGE);                 /* If yes then exit */ 
;
              move.w      #<2,Y0
              bra         >_L27_5	; *+284
;
;  194:   SelectRegBank();                     /* Select Program_Boot_Flash register bank */ 
;
_L27_4:
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<2,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  195:   s_index = 0; 
;
              move.l      #<0,C
;
;  196:   for (i=0; i<Size; i++) {             /* For all given data */ 
;
              move.w      #0,X:(SP-3)
              bra         >_L27_6	; *+130
;
;  197:     while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L27_7:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L27_7	; *-6
              nop         
;
;  198:     if ((i == 0) && (ByteFirst)) 
;
              tst.w       X:(SP-3)
              bne         <_L27_8	; *+29
              nop         
              move.w      X:(SP-1),A
              tst.b       A
              beq         <_L27_8	; *+25
              nop         
;
;  199:       DataToWrite = (readflash(Addr) & 0x00ff) + (((word)((byte *)(Source))[s_index++]) << 8); 
;
              tfr         D,A
              jsr         >Freadflash
              tfr         C,A
              tfr         A,C
              add.l       #1,C
              move.l      X:(SP-6),B
              move.l      B10,R1
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              asll.w      #<8,B
              move.w      #255,X:(SP-2)
              move.w      X:(SP-2),A
              and.w       Y0,A
              move.w      A1,X:(SP-2)
              move.w      X:(SP-2),Y0
              add         B,Y0
              move.w      Y0,X:(SP-2)
              bra         <_L27_9	; *+58
;
;  200:     else if ((i == Size - 1) && (ByteLast)) 
;
_L27_8:
              move.w      X:(SP-3),A
              move.w      A1,B
              lsrr.l      #<$10,B
              move.l      X:(SP-4),A
              add.l       #-1,A
              cmp.l       B,A
              bne         <_L27_10	; *+26
              nop         
              move.w      X:(SP),A
              tst.b       A
              beq         <_L27_10	; *+22
              nop         
;
;  201:       DataToWrite = (readflash(Addr + i) & 0xff00) + ((byte *)(Source))[s_index]; 
;  202:     else { 
;
              move.w      X:(SP-3),A
              lsrr.l      #<$10,A
              add         D,A
              jsr         >Freadflash
              move.l      X:(SP-6),A
              move.l      A10,R1
              move.l      C10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              move.w      #-256,X:(SP-2)
              move.w      X:(SP-2),A
              and.w       Y0,A
              move.w      A1,X:(SP-2)
              move.w      X:(SP-2),Y0
              add         B,Y0
              move.w      Y0,X:(SP-2)
              bra         <_L27_9	; *+25
;
;  203:       DataToWrite = ((byte *)Source)[s_index] + ((word)((byte *)(Source))[s_index + 1] << 8); 
;
_L27_10:
              move.l      X:(SP-6),A
              move.l      A10,R1
              move.l      C10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              move.l      X:(SP-6),A
              move.l      A10,R1
              tfr         C,A
              add.l       #1,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,A
              move.w      A1,X:(SP-2)
              move.w      X:(SP-2),A
              asll.w      #<8,A
              move.w      A1,X:(SP-2)
              move.w      X:(SP-2),Y0
              add         B,Y0
              move.w      Y0,X:(SP-2)
;
;  204:       s_index += 2; 
;  205:     } 
;
              add.l       #2,C
;
;  206:     if (readflash(Addr+i) != DataToWrite) /* Is the FLASH programming necessary? */ 
;
_L27_9:
              move.w      X:(SP-3),A
              lsrr.l      #<$10,A
              add         D,A
              jsr         >Freadflash
              move.w      Y0,B
              move.w      X:(SP-2),A
              cmp.w       A,B
              beq         <_L27_11	; *+13
              nop         
;
;  207:       Err = procflash(Addr+i, DataToWrite, PROGRAM); /* If yes write new data to Flash */ 
;
              move.w      X:(SP-3),A
              lsrr.l      #<$10,A
              add         D,A
              move.w      #<32,B
              move.w      X:(SP-2),Y0
              move.w      B1,Y1
              jsr         >Fprocflash
              move.bp     Y0,X:>>@lb(FErr)
;
;  208:     if (Err != ERR_OK) {               /* If an error occured then exit */ 
;
_L27_11:
              tst.bp      X:>>@lb(FErr)
              beq         <_L27_12	; *+6
;
;  209:       return Err; 
;  210:     } 
;
              moveu.bp    X:>>@lb(FErr),Y0
              bra         >_L27_5	; *+141
;
;  211:   } 
;
_L27_12:
              move.w      X:(SP-3),A
              add.w       #<1,A
              move.w      A1,X:(SP-3)
_L27_6:
              move.w      X:(SP-3),A
              move.w      A1,B
              lsrr.l      #<$10,B
              move.l      X:(SP-4),A
              cmp.l       B,A
              bhi         >_L27_7	; *-133
;
;  212:   while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L27_13:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L27_13	; *-6
;
;  213:   i = 0; 
;
              move.w      #0,X:(SP-3)
;
;  214:   s_index = 0; 
;
              move.l      #<0,C
;
;  215:   if ((Err == ERR_OK) && (ByteFirst)) { 
;
              tst.bp      X:>>@lb(FErr)
              bne         <_L27_14	; *+31
              nop         
              move.w      X:(SP-1),A
              tst.b       A
              beq         <_L27_14	; *+27
              nop         
;
;  216:     i++; 
;
              move.w      X:(SP-3),A
              add.w       #<1,A
              move.w      A1,X:(SP-3)
;
;  217:     if ((readflash(Addr) >> 8) != ((byte*)Source)[s_index++]) 
;
              tfr         D,A
              jsr         >Freadflash
              tfr         C,A
              tfr         A,C
              add.l       #1,C
              move.l      X:(SP-6),B
              move.l      B10,R1
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,A
              lsrr.w      #<8,Y0
              cmp.w       A,Y0
              nop         
              beq         <_L27_14	; *+6
              nop         
;
;  218:       Err = ERR_VALUE; 
;  219:   } 
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  220:   if (Err == ERR_OK) { 
;
_L27_14:
              tst.bp      X:>>@lb(FErr)
              bne         <_L27_15	; *+52
              nop         
              nop         
;
;  221:     for (; i < Size - ByteLast; i++) { /* Check all given data were written good */ 
;
              bra         <_L27_16	; *+39
;
;  222:       if (readflash(Addr+i) != ((((byte*)Source)[s_index]) + ((word)((byte*)Source)[s_index + 1] << 8))) { 
;
_L27_18:
              move.w      X:(SP-3),A
              lsrr.l      #<$10,A
              add         D,A
              jsr         >Freadflash
              move.w      Y0,B
              move.l      X:(SP-6),A
              move.l      A10,R1
              move.l      C10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,Y1
              move.l      X:(SP-6),A
              move.l      A10,R1
              tfr         C,A
              add.l       #1,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,Y0
              asll.w      #<8,Y0
              add         Y1,Y0
              cmp.w       Y0,B
              nop         
              beq         <_L27_17	; *+8
;
;  223:         s_index += 2; 
;
              add.l       #2,C
;
;  224:         Err = ERR_VALUE; 
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  225:         break; 
;  226:       } 
;  227:       else { 
;
              bra         <_L27_15	; *+16
;
;  228:         s_index += 2; 
;  229:       } 
;
_L27_17:
              add.l       #2,C
;
;  230:     } 
;  231:   } 
;
              move.w      X:(SP-3),A
              add.w       #<1,A
              move.w      A1,X:(SP-3)
_L27_16:
              move.w      X:(SP),A
              zxt.b       A,A
              asr16       A,B
              move.l      X:(SP-4),A
              sub         B,A
              move.w      X:(SP-3),B
              lsrr.l      #<$10,B
              cmp.l       A,B
              nop         
              bcs         <_L27_18	; *-47
;
;  232:   if ((Err == ERR_OK) && (ByteLast)) { 
;
_L27_15:
              tst.bp      X:>>@lb(FErr)
              bne         <_L27_19	; *+24
              nop         
              move.w      X:(SP),A
              tst.b       A
              beq         <_L27_19	; *+20
              nop         
;
;  233:     if ((byte)(readflash(Addr+i)) != ((byte*)Source)[s_index]) 
;
              move.w      X:(SP-3),A
              lsrr.l      #<$10,A
              add         D,A
              jsr         >Freadflash
              move.l      X:(SP-6),A
              move.l      A10,R1
              move.l      C10,R0
              adda        R1,R0
              moveu.bp    X:(R0),B
              zxt.b       Y0,A
              cmp.b       B,A
              beq         <_L27_19	; *+6
              nop         
;
;  234:       Err = ERR_VALUE; 
;  235:   } 
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  236:   return Err; 
;
_L27_19:
              moveu.bp    X:>>@lb(FErr),Y0
;
;  237: } 
_L27_5:
              suba        #<10,SP
              move.l      X:(SP)-,D
              move.l      X:(SP)-,C
              rts         
end_FWriteBlock:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  238:  
;  239: /* 
;  240: ** =================================================================== 
;  241: **     Method      :  BlockAddress (component IntFLASH) 
;  242: ** 
;  243: **     Description : 
;  244: **         If the served flash memory is composed from several memory  
;  245: **         blocks, the method returns a start address of the memory block  
;  246: **         given as an input parameter. 
;  247: **         This method is internal. It is used by Processor Expert only. 
;  248: ** =================================================================== 
;  249: */ 
;  250: #define BlockAddress(Block) (ProgFlash_TAddress)(Block == BOOT_FLASH_BLOCK ? BOOT_FLASH_START : PROG_FLASH_START) 
;  251:  
;  252: /* 
;  253: ** =================================================================== 
;  254: **     Method      :  BlockOutOfRange (component IntFLASH) 
;  255: ** 
;  256: **     Description : 
;  257: **         The method returns FALSE, if the input parameter is in an  
;  258: **         allowed flash memory blocks range. If the parameter is out of  
;  259: **         the range, return TRUE. 
;  260: **         This method is internal. It is used by Processor Expert only. 
;  261: ** =================================================================== 
;  262: */ 
;  263: #define BlockOutOfRange(Block) (Block > PROG_BOOT_FLASH_MAX_BLOCK_NUM) 
;  264:  
;  265: /* 
;  266: ** =================================================================== 
;  267: **     Method      :  ProgFlash_Busy (component IntFLASH) 
;  268: ** 
;  269: **     Description : 
;  270: **         Method return status of the FLASH device 
;  271: **     Parameters  : 
;  272: **         NAME            - DESCRIPTION 
;  273: **         Block           - Block number. Not used for Freescale 
;  274: **                           56800 and HCS12X derivates - any value may be passed. 
;  275: **     Returns     : 
;  276: **         ---             - TRUE/FALSE - FLASH is busy/ready 
;  277: ** =================================================================== 
;  278: */ 
;  279: /* 
;  280: bool ProgFlash_Busy(byte Block) 
;  281:  
;  282: **      This method is implemented as macro. See ProgFlash.h file.      ** 
;  283: */ 
;  284:  
;  285: /* 
;  286: ** =================================================================== 
;  287: **     Method      :  ProgFlash_EraseFlash (component IntFLASH) 
;  288: ** 
;  289: **     Description : 
;  290: **         Erase all memory array of the selected Flash block. 
;  291: **     Parameters  : 
;  292: **         NAME            - DESCRIPTION 
;  293: **         Block           - Block number. 
;  294: **                           Possible values: 
;  295: **                            - PROG_FLASH_BLOCK 
;  296: **                            - BOOT_FLASH_BLOCK 
;  297: **     Returns     : 
;  298: **         ---             - Error code, possible codes: 
;  299: **                           - ERR_OK - OK 
;  300: **                           - ERR_NOTAVAIL - Desired program/erase 
;  301: **                           operation is not available 
;  302: **                           - ERR_RANGE - Block number is out of 
;  303: **                           range 
;  304: **                           - ERR_SPEED - This device does not work 
;  305: **                           in the active speed mode 
;  306: ** =================================================================== 
;  307: */ 
;  308: byte ProgFlash_EraseFlash(byte Block) 
;  309: { 
;
		subroutine "FProgFlash_EraseFlash",FProgFlash_EraseFlash,end_FProgFlash_EraseFlash-FProgFlash_EraseFlash
FProgFlash_EraseFlash:
              adda        #<2,SP
              move.b      Y0,X:(SP)
;
;  310:   Err = ERR_OK; 
;
              clr.bp      X:>>@lb(FErr)
;
;  311:   if (BlockOutOfRange(Block))          /* Is the block number in the allowed range? */ 
;
              moveu.b     X:(SP),A
              cmp.b       #<1,A
              bls         <_L33_0	; *+4
              nop         
;
;  312:     return ERR_RANGE;                  /* If no then error */ 
;
              move.w      #<2,Y0
              bra         <_L33_1	; *+40
;
;  313:   SelectRegBank();                     /* Select Program_Boot_Flash register bank */ 
;
_L33_0:
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<2,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  314:   Err = procflash(BlockAddress(Block), 0, MASS_ERASE); /* Erase the FLASH memory block */ 
;
              moveu.b     X:(SP),A
              cmp.b       #<1,A
              bne         <_L33_2	; *+5
              move.l      #$20000,A
              bra         <_L33_3	; *+2
_L33_2:
              move.l      #<0,A
_L33_3:
              move.w      #<0,Y0
              move.w      #65,Y1
              jsr         >Fprocflash
              move.bp     Y0,X:>>@lb(FErr)
;
;  315:   while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L33_4:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L33_4	; *-6
;
;  316:   return Err; 
;
              moveu.bp    X:>>@lb(FErr),Y0
;
;  317: } 
_L33_1:
              suba        #<2,SP
              rts         
end_FProgFlash_EraseFlash:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  318:  
;  319: /* 
;  320: ** =================================================================== 
;  321: **     Method      :  ProgFlash_GetByteFlash (component IntFLASH) 
;  322: ** 
;  323: **     Description : 
;  324: **         Get byte from address in FLASH. 
;  325: **     Parameters  : 
;  326: **         NAME            - DESCRIPTION 
;  327: **         Addr            - Address to FLASH 
;  328: **           Note: An address of the byte location is an 16-bit word 
;  329: **                 location address multiplied by 2 and then the 
;  330: **                 even/odd bytes are discriminated by LSB: 
;  331: **                 0 for even byte, 1 for odd byte. 
;  332: **       * Data            - Pointer to returned 8-bit data 
;  333: **     Returns     : 
;  334: **         ---             - Error code, possible codes: 
;  335: **                           - ERR_OK - OK 
;  336: **                           - ERR_RANGE - Address is out of range 
;  337: ** =================================================================== 
;  338: */ 
;  339: byte ProgFlash_GetByteFlash(ProgFlash_TAddress Addr,byte *Data) 
;  340: { 
;  341:   word Data16; 
;
		subroutine "FProgFlash_GetByteFlash",FProgFlash_GetByteFlash,end_FProgFlash_GetByteFlash-FProgFlash_GetByteFlash
FProgFlash_GetByteFlash:
              adda        #<6,SP
              move.l      A10,X:(SP-2)
              move.l      R2,X:(SP-4)
;
;  342:   if (OutOfRange(Addr/2,Addr/2))       /* Check range of address */ 
;
              move.l      X:(SP-2),A
              lsrr.l      #<1,A
              move.l      X:(SP-2),B
              lsrr.l      #<1,B
              jsr         >FOutOfRange
              tst.b       Y0
              beq         <_L39_0	; *+4
              nop         
;
;  343:     return ERR_RANGE; 
;
              move.w      #<2,Y0
              bra         <_L39_1	; *+17
;
;  344:   Data16 = readflash((Addr/2));        /* Read word from FLASH */ 
;
_L39_0:
              move.l      X:(SP-2),A
              lsrr.l      #<1,A
              jsr         >Freadflash
              move.w      Y0,X:(SP)
;
;  345:   *Data = *(((byte *)(&Data16))+Addr%2); /* Set desired byte data */ 
;
              move.l      X:(SP-4),R2
              adda        #0,SP,R0
              asla        R0,R1
              move.l      X:(SP-2),A
              and.l       #<1,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              move.bp     A1,X:(R2)
;
;  346:   return ERR_OK; 
;
              move.w      #<0,Y0
;
;  347: } 
_L39_1:
              suba        #<6,SP
              rts         
end_FProgFlash_GetByteFlash:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  348:  
;  349: /* 
;  350: ** =================================================================== 
;  351: **     Method      :  ProgFlash_SetGlobalProtection (component IntFLASH) 
;  352: ** 
;  353: **     Description : 
;  354: **         Method makes all memory array of the selected FLASH 
;  355: **         protected or unprotected. The protection state changes 
;  356: **         are active till system reset. 
;  357: **     Parameters  : 
;  358: **         NAME            - DESCRIPTION 
;  359: **         ProtectAll      - TRUE - The whole flash 
;  360: **                           memory array of the selected flash is 
;  361: **                           protected; FALSE - The whole flash 
;  362: **                           memory array of the selected flash is 
;  363: **                           unprotected. 
;  364: **     Returns     : 
;  365: **         ---             - Error code, possible codes: 
;  366: **                           - ERR_OK - OK 
;  367: **                           - ERR_NOTAVAIL - Desired program/erase 
;  368: **                           operation is not available 
;  369: **                           - ERR_VALUE - Read value is not equal to 
;  370: **                           written value 
;  371: **                           - ERR_SPEED - This device does not work 
;  372: **                           in the active speed mode 
;  373: ** =================================================================== 
;  374: */ 
;  375: byte ProgFlash_SetGlobalProtection(bool ProtectAll) 
;  376: { 
;  377:   register word data; 
;
		subroutine "FProgFlash_SetGlobalProtection",FProgFlash_SetGlobalProtection,end_FProgFlash_SetGlobalProtection-FProgFlash_SetGlobalProtection
FProgFlash_SetGlobalProtection:
              adda        #<2,SP
              move.b      Y0,X:(SP)
;
;  378:   if (ProtectAll)                      /* Determine protection word */ 
;
              tst.b       X:(SP+>0)
              beq         <_L45_0	; *+4
;
;  379:     data=0xffff; 
;  380:   else 
;
              move.w      #>-1,Y0
              bra         <_L45_1	; *+2
;
;  381:     data=0; 
;
_L45_0:
              move.w      #<0,Y0
;
;  382:   SelectRegBank();                     /* Select Program_Boot_Flash register bank */ 
;
_L45_1:
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<2,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  383:   setReg(FMPROT,data);                 /* Write ProtectionWord to FMPROT register */ 
;
              move.l      #$f410,R0
              move.w      Y0,X:(R0)
;
;  384:   if (data != getReg(FMPROT)) {        /* If the read value is not equal to written value then exit */ 
;
              move.l      #$f410,R0
              move.w      X:(R0),A
              cmp.w       Y0,A
              beq         <_L45_2	; *+4
              nop         
;
;  385:     return ERR_VALUE; 
;  386:   } 
;
              move.w      #<3,Y0
              bra         <_L45_3	; *+16
;
;  387:   setReg(FMPROTB,data);                /* Write ProtectionWord to FMPROTB register */ 
;
_L45_2:
              move.l      #$f411,R0
              move.w      Y0,X:(R0)
;
;  388:   if ((data & 0x000f) != getReg(FMPROTB)) { /* If the read value is not equal to written value then exit */ 
;
              and.w       #<15,Y0
              move.l      #$f411,R0
              move.w      X:(R0),A
              cmp.w       Y0,A
              beq         <_L45_4	; *+4
              nop         
;
;  389:     return ERR_VALUE; 
;  390:   } 
;
              move.w      #<3,Y0
              bra         <_L45_3	; *+2
;
;  391:   return ERR_OK; 
;
_L45_4:
              move.w      #<0,Y0
;
;  392: } 
_L45_3:
              suba        #<2,SP
              rts         
end_FProgFlash_SetGlobalProtection:

	ENDSEC

	SECTION ProgFlash

	ORG	P:

;
;  393:  
;  394: /* 
;  395: ** =================================================================== 
;  396: **     Method      :  ProgFlash_SetBlockFlash (component IntFLASH) 
;  397: ** 
;  398: **     Description : 
;  399: **         Writes data to FLASH. 
;  400: **     Parameters  : 
;  401: **         NAME            - DESCRIPTION 
;  402: **         Source          - Source address of the data 
;  403: **         Dest            - Destination address in FLASH 
;  404: **         Count           - Count of the data fields in the 
;  405: **                           smallest addressable units. 
;  406: **           Note 1: The smallest addressable unit for the used CPU 
;  407: **                   is byte. 
;  408: **           Note 2: An address of a byte location is an 16-bit word 
;  409: **                   location address multiplied by 2 and then the 
;  410: **                   even/odd bytes are discriminated by LSB: 
;  411: **                   0 for even byte, 1 for odd byte. 
;  412: **     Returns     : 
;  413: **         ---             - Error code 
;  414: ** =================================================================== 
;  415: */ 
;  416: byte ProgFlash_SetBlockFlash(ProgFlash_TDataAddress Source,ProgFlash_TAddress Dest,word Count) 
;  417: { 
;
		subroutine "FProgFlash_SetBlockFlash",FProgFlash_SetBlockFlash,end_FProgFlash_SetBlockFlash-FProgFlash_SetBlockFlash
FProgFlash_SetBlockFlash:
              adda        #<6,SP
              move.l      A10,X:(SP-2)
              move.l      B10,X:(SP-4)
              move.w      Y0,X:(SP)
;
;  418:   return WriteBlock(Source, Dest, Count); 
;
              adda        #<2,SP
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              move.l      A10,X:(SP)
              move.l      X:(SP-4),A
              move.l      X:(SP-6),B
              jsr         >FWriteBlock
              suba        #<2,SP
;
;  419: } 
;
              suba        #<6,SP
              rts         
end_FProgFlash_SetBlockFlash:

	ENDSEC

	SECTION ProgFlash

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FErr:	dsb	1

	ENDSEC


	END
