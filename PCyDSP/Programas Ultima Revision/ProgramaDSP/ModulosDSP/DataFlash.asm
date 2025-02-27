
	include "asmdef.h"

	SECTION loader ; declarations
		global FDataFlash_SetGlobalProtection
		global FDataFlash_EraseFlash
		global FDataFlash_GetByteFlash
		global FDataFlash_SetWordFlash
		global FDataFlash_SetLongFlash
		global FDataFlash_SetBlockFlash
	ENDSEC

	SECTION loader

	ORG	P:

;
;   78: **         This method is internal. It is used by Processor Expert only. 
;   79: ** =================================================================== 
;   80: */ 
;   81: static byte OutOfRange(DataFlash_TAddress addr1,DataFlash_TAddress addr2) 
;   82: { 
;
		subroutine "FOutOfRange",FOutOfRange,end_FOutOfRange-FOutOfRange
FOutOfRange:
              adda        #<4,SP
              move.l      A10,X:(SP)
              move.l      B10,X:(SP-2)
;
;   83:   return ((addr1>addr2)||(addr1<DATA_FLASH_START)||(addr2>DATA_FLASH_END)); 
;
              move.w      #<1,Y1
              move.w      #<1,Y0
              move.l      X:(SP),B
              move.l      X:(SP-2),A
              cmp.l       B,A
              bcs         <_L6_0	; *+8
              nop         
              move.l      X:(SP),A
              cmp.l       #4096,A
              bcs         <_L6_0	; *+3
              nop         
              move.w      #<0,Y0
_L6_0:
              tst.w       Y0
              bne         <_L6_1	; *+8
              nop         
              move.l      X:(SP-2),A
              cmp.l       #8192,A
              bhi         <_L6_1	; *+3
              nop         
              move.w      #<0,Y1
_L6_1:
              zxt.b       Y1,Y0
;
;   84: } 
              suba        #<4,SP
              rts         
end_FOutOfRange:

	ENDSEC

	SECTION loader

	ORG	P:

;
;   85:  
;   86: /* 
;   87: ** =================================================================== 
;   88: **     Method      :  DataFlash_SectorSize (component IntFLASH) 
;   89: ** 
;   90: **     Description : 
;   91: **         The method returns flash memory sector (erase page) size of a  
;   92: **         desired area. 
;   93: **         This method is internal. It is used by Processor Expert only. 
;   94: ** =================================================================== 
;   95: */ 
;   96: #define SectorSize(addr) (DATA_FLASH_SECTOR_SIZE) 
;   97:  
;   98: /* 
;   99: ** =================================================================== 
;  100: **     Method      :  ClearFlags (component IntFLASH) 
;  101: ** 
;  102: **     Description : 
;  103: **         The method clears the flash memory interface complete and  
;  104: **         error flags. 
;  105: **         This method is internal. It is used by Processor Expert only. 
;  106: ** =================================================================== 
;  107: */ 
;  108: #define ClearFlags() setReg(FMUSTAT,0x30) 
;  109:  
;  110: /* 
;  111: ** =================================================================== 
;  112: **     Method      :  readflash (component IntFLASH) 
;  113: ** 
;  114: **     Description : 
;  115: **         The method reads 16-bit word from a flash memory. 
;  116: **         This method is internal. It is used by Processor Expert only. 
;  117: ** =================================================================== 
;  118: */ 
;  119: #define readflash(address) (*(word *)(address)) 
;  120:  
;  121: /* 
;  122: ** =================================================================== 
;  123: **     Method      :  writeflash (component IntFLASH) 
;  124: ** 
;  125: **     Description : 
;  126: **         The method writes 16-bit word to a flash memory. 
;  127: **         This method is internal. It is used by Processor Expert only. 
;  128: ** =================================================================== 
;  129: */ 
;  130: #define writeflash(address, data) (*(word *)(address)=data) 
;  131:  
;  132: /* 
;  133: ** =================================================================== 
;  134: **     Method      :  procflash (component IntFLASH) 
;  135: ** 
;  136: **     Description : 
;  137: **         The method programs 16-bit word to a flash memory. 
;  138: **         This method is internal. It is used by Processor Expert only. 
;  139: ** =================================================================== 
;  140: */ 
;  141: static byte procflash(DataFlash_TAddress address, word data, word command) 
;  142: { 
;
		subroutine "Fprocflash",Fprocflash,end_Fprocflash-Fprocflash
Fprocflash:
              adda        #<4,SP
              move.l      A10,X:(SP-2)
              move.w      Y0,X:(SP)
              move.w      Y1,X:(SP-1)
;
;  143:   setRegBit(FMUSTAT,CBEIF); 
;
              move.l      #$f413,R0
              bfset       #$80,X:(R0)
;
;  144:   if (DataFlash_Busy())                /* Is a command in progress in any of the flash devices? */ 
;
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L11_0	; *+27
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L11_1	; *+8
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.w      #<0,A
              bra         <_L11_2	; *+7
_L11_1:
              move.l      #$f401,R0
              bfchg       #3,X:(R0)
              move.w      #<1,A
_L11_2:
              bra         <_L11_3	; *+2
_L11_0:
              move.w      #<1,A
_L11_3:
              zxt.b       A,A
              tst.b       A
              beq         <_L11_4	; *+4
              nop         
;
;  145:     return ERR_BUSY;                   /* If yes then error */ 
;
              move.w      #<8,Y0
              bra         <_L11_5	; *+59
;
;  146:   ClearFlags();                        /* Clear all flags */ 
;
_L11_4:
              move.l      #$f413,R0
              move.w      #48,X:(R0)
;
;  147:   DataFlash_SetGlobalProtection(0); 
;
              move.w      #<0,Y0
              jsr         >FDataFlash_SetGlobalProtection
;
;  148:   writeflash(address, data);           /* Write given data to the flash memory */ 
;
              move.l      X:(SP-2),A
              move.l      A10,R0
              move.w      X:(SP),A
              move.w      A1,X:(R0)
;
;  149:   setReg(FMCMD,command);               /* Write given command to FMCMD register */ 
;
              move.l      #$f414,R0
              move.w      X:(SP-1),A
              move.w      A1,X:(R0)
;
;  150:   setReg(FMUSTAT,0x80);                /* launch the command */ 
;
              move.l      #$f413,R0
              move.w      #128,X:(R0)
;
;  151:   while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L11_6:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L11_6	; *-6
;
;  152:   if ((getRegBit(FMUSTAT,PVIOL))||(getRegBit(FMUSTAT,ACCERR))) /* Is protection violation or access error detected ? */ 
;  153:   { 
;  154:  
;
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$20,A1
              bcc         <_L11_7	; *+8
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$10,A1
              bcs         <_L11_8	; *+13
;
;  155: 	setRegBit(FMUSTAT,PVIOL); 
;
_L11_7:
              move.l      #$f413,R0
              bfset       #$20,X:(R0)
;
;  156: 	setRegBit(FMUSTAT,ACCERR); 
;
              move.l      #$f413,R0
              bfset       #$10,X:(R0)
;
;  157:     return ERR_NOTAVAIL;               /* If yes then return the error */ 
;  158:    
;  159:   } 
;
              move.w      #<9,Y0
              bra         <_L11_5	; *+4
;
;  160:   return Err; 
;
_L11_8:
              moveu.bp    X:>>@lb(FErr),Y0
;
;  161: } 
_L11_5:
              suba        #<4,SP
              rts         
end_Fprocflash:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  162:  
;  163: /* 
;  164: ** =================================================================== 
;  165: **     Method      :  WriteBlock (component IntFLASH) 
;  166: ** 
;  167: **     Description : 
;  168: **         The metohd writes block of data to a flash memory. 
;  169: **         This method is internal. It is used by Processor Expert only. 
;  170: ** =================================================================== 
;  171: */ 
;  172: static byte WriteBlock(DataFlash_TAddress Source, DataFlash_TAddress Dest, dword Count) 
;  173: { 
;  174:   word i, DataToWrite; 
;  175:   dword s_index, Addr, LastAddr, Size; 
;  176:   bool ByteFirst, ByteLast; 
;  177:   TModHidro ModHidroSource,MosHidroDest; 
;  178:  
;  179:  
;
		subroutine "FWriteBlock",FWriteBlock,end_FWriteBlock-FWriteBlock
FWriteBlock:
              adda        #$10,SP,SP
              move.l      A10,X:(SP-12)
              move.l      B10,X:(SP-14)
;
;  180:   Err = ERR_OK; 
;
              clr.bp      X:>>@lb(FErr)
;
;  181:   Addr = (dword)Dest / 2; 
;
              move.l      X:(SP-14),A
              lsrr.l      #<1,A
              move.l      A10,X:(SP-6)
;
;  182:   if ((dword)Dest % 2 > 0) 
;
              move.l      X:(SP-14),A
              and.l       #<1,A
              tst.l       A
              beq         <_L17_0	; *+5
              nop         
;
;  183:     ByteFirst = TRUE; 
;  184:   else 
;
              move.w      #<1,A
              move.b      A1,X:(SP)
              bra         <_L17_1	; *+3
;
;  185:     ByteFirst = FALSE; 
;
_L17_0:
              clr.b       X:(SP+>0)
;
;  186:   LastAddr = (dword)Dest + Count; 
;
_L17_1:
              move.l      X:(SP-14),B
              move.l      X:(SP-$12),A
              add         B,A
              move.l      A10,X:(SP-8)
;
;  187:   if (LastAddr % 2 > 0) 
;
              move.l      X:(SP-8),A
              and.l       #<1,A
              tst.l       A
              beq         <_L17_2	; *+5
              nop         
;
;  188:     ByteLast = TRUE; 
;  189:   else 
;
              move.w      #<1,A
              move.b      A1,X:(SP-1)
              bra         <_L17_3	; *+3
;
;  190:     ByteLast = FALSE; 
;
_L17_2:
              clr.b       X:(SP->1)
;
;  191:   LastAddr = (LastAddr - 1) / 2; 
;
_L17_3:
              move.l      X:(SP-8),A
              add.l       #-1,A
              lsrr.l      #<1,A
              move.l      A10,X:(SP-8)
;
;  192:   Size = (LastAddr - Addr) + 1; 
;
              move.l      X:(SP-8),B
              move.l      X:(SP-6),A
              sub         A,B
              add.l       #1,B
              move.l      B10,X:(SP-10)
;
;  193:   if (OutOfRange(Addr,LastAddr))       /* Is the address out of range? */ 
;
              move.l      X:(SP-6),A
              move.l      X:(SP-8),B
              jsr         >FOutOfRange
              tst.b       Y0
              beq         <_L17_4	; *+5
              nop         
;
;  194:     return(ERR_RANGE);                 /* If yes then exit */ 
;
              move.w      #<2,Y0
              bra         >_L17_5	; *+289
;
;  195:   FMCLKD=0x52;						   /* Set Clk Divider */ 
;
_L17_4:
              move.l      #$f400,R0
              move.w      #82,X:(R0)
;
;  196:   s_index = 0; 
;
              clr.l       X:(SP->4)
;
;  197:   i=0; 
;
              clr.w       X:(SP->2)
;
;  198:   for (; i<Size; i++)  
;  199:   {             /* For all given data */ 
;
              bra         >_L17_6	; *+135
;
;  200:     while (getRegBit(FMUSTAT,CBEIF) == 0) {} /* Wait to command complete */ 
;
_L17_7:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$80,A1
              bcs         <_L17_7	; *-6
;
;  201:     SelectRegBank();                        /* Select Data_Flash register bank */ 
;
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<1,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  202:     if ((i == 0) && (ByteFirst)) 
;
              tst.w       X:(SP-2)
              bne         <_L17_8	; *+26
              tst.b       X:(SP+>0)
              beq         <_L17_8	; *+23
              nop         
;
;  203:       DataToWrite = (readflash(Addr) & 0x00ff) + (((word)((byte *)(Source))[s_index++]) << 8); 
;
              move.l      X:(SP-4),B
              tfr         B,A
              add.l       #1,A
              move.l      A10,X:(SP-4)
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      B10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              asll.w      #<8,B
              move.l      X:(SP-6),A
              move.l      A10,R0
              move.w      X:(R0),A
              move.w      #255,Y0
              and.w       A,Y0
              add         B,Y0
              move.w      Y0,X:(SP-3)
              bra         <_L17_9	; *+55
;
;  204:     else if ((i == Size - 1) && (ByteLast)) 
;
_L17_8:
              move.w      X:(SP-2),A
              move.w      A1,B
              lsrr.l      #<$10,B
              move.l      X:(SP-10),A
              add.l       #-1,A
              cmp.l       B,A
              bne         <_L17_10	; *+24
              tst.b       X:(SP->1)
              beq         <_L17_10	; *+21
              nop         
;
;  205:       DataToWrite = (readflash(Addr + i) & 0xff00) + ((byte *)(Source))[s_index]; 
;  206:     else { 
;
              move.l      X:(SP-6),B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              add         B,A
              move.l      A10,R0
              move.w      X:(R0),A
              move.w      #-256,B
              and.w       A,B
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,Y0
              add         B,Y0
              move.w      Y0,X:(SP-3)
              bra         <_L17_9	; *+24
;
;  207:       DataToWrite = ((byte *)Source)[s_index] + ((word)((byte *)(Source))[s_index + 1] << 8); 
;
_L17_10:
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              add.l       #1,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,Y0
              asll.w      #<8,Y0
              add         B,Y0
              move.w      Y0,X:(SP-3)
;
;  208:       s_index += 2; 
;  209:     } 
;
              move.l      X:(SP-4),A
              add.l       #2,A
              move.l      A10,X:(SP-4)
;
;  210:     if (readflash(Addr+i) != DataToWrite) /* Is the FLASH programming necessary? */ 
;
_L17_9:
              move.l      X:(SP-6),B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              add         B,A
              move.l      A10,R0
              move.w      X:(SP-3),A
              cmp.w       X:(R0),A
              beq         <_L17_11	; *+13
              nop         
;
;  211:       Err = procflash(Addr+i, DataToWrite, PROGRAM); /* If yes write new data to Flash */ 
;
              move.l      X:(SP-6),B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              add         B,A
              move.w      X:(SP-3),Y0
              move.w      #<32,Y1
              jsr         >Fprocflash
              move.bp     Y0,X:>>@lb(FErr)
;
;  212:     if (Err != ERR_OK) {               /* If an error occured then exit */ 
;
_L17_11:
              tst.bp      X:>>@lb(FErr)
              beq         <_L17_12	; *+6
;
;  213:       return Err; 
;  214:     } 
;
              moveu.bp    X:>>@lb(FErr),Y0
              bra         >_L17_5	; *+148
;
;  215:   } 
;
_L17_12:
              move.w      X:(SP-2),A
              add.w       #<1,A
              move.w      A1,X:(SP-2)
_L17_6:
              move.w      X:(SP-2),A
              move.w      A1,B
              lsrr.l      #<$10,B
              move.l      X:(SP-10),A
              cmp.l       B,A
              bhi         >_L17_7	; *-138
;
;  216:   while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L17_13:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L17_13	; *-6
;
;  217:   i = 0; 
;
              clr.w       X:(SP->2)
;
;  218:   s_index = 0; 
;
              clr.l       X:(SP->4)
;
;  219:   if ((Err == ERR_OK) && (ByteFirst))  
;  220:   { 
;
              tst.bp      X:>>@lb(FErr)
              bne         <_L17_14	; *+31
              tst.b       X:(SP+>0)
              beq         <_L17_14	; *+28
              nop         
;
;  221:     i++; 
;
              move.w      X:(SP-2),A
              add.w       #<1,A
              move.w      A1,X:(SP-2)
;
;  222:     if ((readflash(Addr) >> 8) != ((byte*)Source)[s_index++]) 
;
              move.l      X:(SP-4),B
              tfr         B,A
              add.l       #1,A
              move.l      A10,X:(SP-4)
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      B10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              move.l      X:(SP-6),A
              move.l      A10,R0
              move.w      X:(R0),A
              lsrr.w      #<8,A
              cmp.w       B,A
              nop         
              beq         <_L17_14	; *+6
              nop         
;
;  223:       Err = ERR_VALUE; 
;  224:   } 
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  225:   if (Err == ERR_OK)  
;  226:   { 
;
_L17_14:
              tst.bp      X:>>@lb(FErr)
              bne         <_L17_15	; *+57
              nop         
              nop         
;
;  227:     for (; i < Size - ByteLast; i++) { /* Check all given data were written good */ 
;
              bra         <_L17_16	; *+44
;
;  228:       if (readflash(Addr+i) != ((((byte*)Source)[s_index]) + ((word)((byte*)Source)[s_index + 1] << 8)))  
;  229:       { 
;
_L17_18:
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,B
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              add.l       #1,A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              zxt.b       A,Y0
              asll.w      #<8,Y0
              add         B,Y0
              move.l      X:(SP-6),B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              add         B,A
              move.l      A10,R0
              move.w      X:(R0),A
              cmp.w       Y0,A
              beq         <_L17_17	; *+11
              nop         
;
;  230:         s_index += 2; 
;
              move.l      X:(SP-4),A
              add.l       #2,A
              move.l      A10,X:(SP-4)
;
;  231:         Err = ERR_VALUE; 
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  232:         break; 
;  233:       } 
;  234:       else { 
;
              bra         <_L17_15	; *+18
;
;  235:         s_index += 2; 
;  236:       } 
;
_L17_17:
              move.l      X:(SP-4),A
              add.l       #2,A
              move.l      A10,X:(SP-4)
;
;  237:     } 
;  238:   } 
;
              move.w      X:(SP-2),A
              add.w       #<1,A
              move.w      A1,X:(SP-2)
_L17_16:
              move.l      X:(SP-10),B
              moveu.b     X:(SP-1),A
              zxt.b       A,A
              asr16       A,A
              sub         A,B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              cmp.l       B,A
              nop         
              bcs         <_L17_18	; *-52
;
;  239:   if ((Err == ERR_OK) && (ByteLast)) { 
;
_L17_15:
              tst.bp      X:>>@lb(FErr)
              bne         <_L17_19	; *+25
              tst.b       X:(SP->1)
              beq         <_L17_19	; *+22
              nop         
;
;  240:     if ((byte)(readflash(Addr+i)) != ((byte*)Source)[s_index]) 
;
              move.l      X:(SP-6),B
              move.w      X:(SP-2),A
              lsrr.l      #<$10,A
              add         B,A
              move.l      A10,R0
              move.w      X:(R0),A
              zxt.b       A,B
              move.l      X:(SP-12),A
              move.l      A10,R1
              move.l      X:(SP-4),A
              move.l      A10,R0
              adda        R1,R0
              moveu.bp    X:(R0),A
              cmp.b       B,A
              beq         <_L17_19	; *+6
              nop         
;
;  241:       Err = ERR_VALUE; 
;  242:   } 
;  243:  
;
              move.w      #<3,A
              move.bp     A1,X:>>@lb(FErr)
;
;  244:   return Err; 
;
_L17_19:
              moveu.bp    X:>>@lb(FErr),Y0
;
;  245: } 
_L17_5:
              suba        #<16,SP
              rts         
end_FWriteBlock:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  246:  
;  247: /* 
;  248: ** =================================================================== 
;  249: **     Method      :  DataFlash_Busy (component IntFLASH) 
;  250: ** 
;  251: **     Description : 
;  252: **         Method return status of the FLASH device 
;  253: **     Parameters  : 
;  254: **         NAME            - DESCRIPTION 
;  255: **         Block           - Block number. Not used for Freescale 
;  256: **                           56800 and HCS12X derivates - any value may be passed. 
;  257: **     Returns     : 
;  258: **         ---             - TRUE/FALSE - FLASH is busy/ready 
;  259: ** =================================================================== 
;  260: */ 
;  261: /* 
;  262: bool DataFlash_Busy(byte Block) 
;  263:  
;  264: **      This method is implemented as macro. See DataFlash.h file.      ** 
;  265: */ 
;  266:  
;  267: /* 
;  268: ** =================================================================== 
;  269: **     Method      :  DataFlash_EraseFlash (component IntFLASH) 
;  270: ** 
;  271: **     Description : 
;  272: **         Erase all memory array of the selected Flash block. 
;  273: **     Parameters  : 
;  274: **         NAME            - DESCRIPTION 
;  275: **         Block           - Block number. Not used for Freescale 
;  276: **                           56800 derivates except for 
;  277: **                           the Program_Boot_Flash on 56F83xx and 
;  278: **                           56F81xx derivatives. 
;  279: **     Returns     : 
;  280: **         ---             - Error code, possible codes: 
;  281: **                           - ERR_OK - OK 
;  282: **                           - ERR_NOTAVAIL - Desired program/erase 
;  283: **                           operation is not available 
;  284: **                           - ERR_RANGE - Block number is out of 
;  285: **                           range 
;  286: **                           - ERR_SPEED - This device does not work 
;  287: **                           in the active speed mode 
;  288: ** =================================================================== 
;  289: */ 
;  290: byte DataFlash_EraseFlash(byte Block) 
;  291: { 
;  292: //#pragma unused(Block) 
;  293:   Err = ERR_OK; 
;
		subroutine "FDataFlash_EraseFlash",FDataFlash_EraseFlash,end_FDataFlash_EraseFlash-FDataFlash_EraseFlash
FDataFlash_EraseFlash:
              clr.bp      X:>>@lb(FErr)
;
;  294:   SelectRegBank();                     /* Select Data_Flash register bank */ 
;
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<1,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  295:   Err = procflash(DATA_FLASH_START, 0, MASS_ERASE); /* Erase entire FLASH memory array */ 
;
              move.l      #4096,A
              move.w      #<0,Y0
              move.w      #65,Y1
              jsr         >Fprocflash
              move.bp     Y0,X:>>@lb(FErr)
;
;  296:   while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */ 
;
_L23_0:
              move.l      #$f413,R0
              move.w      X:(R0),A
              bftstl      #$40,A1
              bcs         <_L23_0	; *-6
;
;  297:   return Err; 
;
              moveu.bp    X:>>@lb(FErr),Y0
;
;  298: } 
              rts         
end_FDataFlash_EraseFlash:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  299:  
;  300:  
;  301: /* 
;  302: ** =================================================================== 
;  303: **     Method      :  DataFlash_GetByteFlash (component IntFLASH) 
;  304: ** 
;  305: **     Description : 
;  306: **         Get byte from address in FLASH. 
;  307: **     Parameters  : 
;  308: **         NAME            - DESCRIPTION 
;  309: **         Addr            - Address to FLASH 
;  310: **           Note: An address of the byte location is an 16-bit word 
;  311: **                 location address multiplied by 2 and then the 
;  312: **                 even/odd bytes are discriminated by LSB: 
;  313: **                 0 for even byte, 1 for odd byte. 
;  314: **       * Data            - Pointer to returned 8-bit data 
;  315: **     Returns     : 
;  316: **         ---             - Error code, possible codes: 
;  317: **                           - ERR_OK - OK 
;  318: **                           - ERR_RANGE - Address is out of range 
;  319: ** =================================================================== 
;  320: */ 
;  321: byte DataFlash_GetByteFlash(DataFlash_TAddress Addr,byte *Data) 
;  322: { 
;  323:   word Data16; 
;
		subroutine "FDataFlash_GetByteFlash",FDataFlash_GetByteFlash,end_FDataFlash_GetByteFlash-FDataFlash_GetByteFlash
FDataFlash_GetByteFlash:
              adda        #<6,SP
              move.l      A10,X:(SP-2)
              move.l      R2,X:(SP-4)
;
;  324:   if (OutOfRange(Addr/2,Addr/2))       /* Check range of address */ 
;
              move.l      X:(SP-2),A
              lsrr.l      #<1,A
              move.l      X:(SP-2),B
              lsrr.l      #<1,B
              jsr         >FOutOfRange
              tst.b       Y0
              beq         <_L29_0	; *+4
              nop         
;
;  325:     return ERR_RANGE; 
;
              move.w      #<2,Y0
              bra         <_L29_1	; *+17
;
;  326:   Data16 = readflash((Addr/2));        /* Read word from FLASH */ 
;
_L29_0:
              move.l      X:(SP-2),A
              lsrr.l      #<1,A
              move.l      A10,R0
              move.w      X:(R0),A
              move.w      A1,X:(SP)
;
;  327:   *Data = *(((byte *)(&Data16))+Addr%2); /* Set desired byte data */ 
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
;  328:   return ERR_OK; 
;
              move.w      #<0,Y0
;
;  329: } 
_L29_1:
              suba        #<6,SP
              rts         
end_FDataFlash_GetByteFlash:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  330:  
;  331: /* 
;  332: ** =================================================================== 
;  333: **     Method      :  DataFlash_SetWordFlash (component IntFLASH) 
;  334: ** 
;  335: **     Description : 
;  336: **         Write word to address in FLASH. 
;  337: **     Parameters  : 
;  338: **         NAME            - DESCRIPTION 
;  339: **         Addr            - Address to FLASH. 
;  340: **         Data            - Data to write. 
;  341: **     Returns     : 
;  342: **         ---             - Error code, possible codes: 
;  343: **                           - ERR_OK - OK 
;  344: **                           - ERR_NOTAVAIL - Desired program/erase 
;  345: **                           operation is not available 
;  346: **                           - ERR_RANGE - Address is out of range 
;  347: **                           - ERR_VALUE - Read value is not equal to 
;  348: **                           written value 
;  349: **                           - ERR_SPEED - This device does not work 
;  350: **                           in the active speed mode 
;  351: ** =================================================================== 
;  352: */ 
;  353: byte DataFlash_SetWordFlash(DataFlash_TAddress Addr,word Data) 
;  354: { 
;
		subroutine "FDataFlash_SetWordFlash",FDataFlash_SetWordFlash,end_FDataFlash_SetWordFlash-FDataFlash_SetWordFlash
FDataFlash_SetWordFlash:
              adda        #<4,SP
              move.l      A10,X:(SP-2)
              move.w      Y0,X:(SP)
;
;  355:   return WriteBlock((dword)((byte *)&Data), Addr*2, sizeof(Data)); /* Write data to FLASH - use block method */ 
;
              adda        #<2,SP
              move.l      #<2,A
              move.l      A10,X:(SP)
              adda        #-2,SP,R0
              asla        R0,R0
              move.l      R0,A
              move.l      X:(SP-4),B
              asll.l      #<1,B
              jsr         >FWriteBlock
              suba        #<2,SP
;
;  356: } 
              suba        #<4,SP
              rts         
end_FDataFlash_SetWordFlash:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  357:  
;  358: /* 
;  359: ** =================================================================== 
;  360: **     Method      :  DataFlash_SetLongFlash (component IntFLASH) 
;  361: ** 
;  362: **     Description : 
;  363: **         Write long word to address in FLASH. 
;  364: **     Parameters  : 
;  365: **         NAME            - DESCRIPTION 
;  366: **         Addr            - Address to FLASH. 
;  367: **         Data            - Data to write. 
;  368: **     Returns     : 
;  369: **         ---             - Error code, possible codes: 
;  370: **                           - ERR_OK - OK 
;  371: **                           - ERR_NOTAVAIL - Desired program/erase 
;  372: **                           operation is not available 
;  373: **                           - ERR_RANGE - Address is out of range 
;  374: **                           - ERR_VALUE - Read value is not equal to 
;  375: **                           written value 
;  376: **                           - ERR_SPEED - This device does not work 
;  377: **                           in the active speed mode 
;  378: ** =================================================================== 
;  379: */ 
;  380: byte DataFlash_SetLongFlash(DataFlash_TAddress Addr,dword Data) 
;  381: { 
;
		subroutine "FDataFlash_SetLongFlash",FDataFlash_SetLongFlash,end_FDataFlash_SetLongFlash-FDataFlash_SetLongFlash
FDataFlash_SetLongFlash:
              adda        #<4,SP
              move.l      A10,X:(SP)
              move.l      B10,X:(SP-2)
;
;  382:   return WriteBlock((dword)((byte *)&Data), Addr*2, sizeof(Data)); /* Write data to FLASH - use block method */ 
;
              adda        #<2,SP
              move.l      #<4,A
              move.l      A10,X:(SP)
              adda        #-5,SP,R0
              asla        R0,R0
              move.l      R0,A
              move.l      X:(SP-2),B
              asll.l      #<1,B
              jsr         >FWriteBlock
              suba        #<2,SP
;
;  383: } 
              suba        #<4,SP
              rts         
end_FDataFlash_SetLongFlash:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  384:  
;  385: /* 
;  386: ** =================================================================== 
;  387: **     Method      :  DataFlash_SetGlobalProtection (component IntFLASH) 
;  388: ** 
;  389: **     Description : 
;  390: **         Method makes all memory array of the selected FLASH 
;  391: **         protected or unprotected. The protection state changes 
;  392: **         are active till system reset. 
;  393: **     Parameters  : 
;  394: **         NAME            - DESCRIPTION 
;  395: **         ProtectAll      - TRUE - The whole flash 
;  396: **                           memory array of the selected flash is 
;  397: **                           protected; FALSE - The whole flash 
;  398: **                           memory array of the selected flash is 
;  399: **                           unprotected. 
;  400: **     Returns     : 
;  401: **         ---             - Error code, possible codes: 
;  402: **                           - ERR_OK - OK 
;  403: **                           - ERR_NOTAVAIL - Desired program/erase 
;  404: **                           operation is not available 
;  405: **                           - ERR_VALUE - Read value is not equal to 
;  406: **                           written value 
;  407: **                           - ERR_SPEED - This device does not work 
;  408: **                           in the active speed mode 
;  409: ** =================================================================== 
;  410: */ 
;  411: byte DataFlash_SetGlobalProtection(bool ProtectAll) 
;  412: { 
;  413:   register word data; 
;
		subroutine "FDataFlash_SetGlobalProtection",FDataFlash_SetGlobalProtection,end_FDataFlash_SetGlobalProtection-FDataFlash_SetGlobalProtection
FDataFlash_SetGlobalProtection:
              adda        #<2,SP
              move.b      Y0,X:(SP)
;
;  414:   if (ProtectAll)                      /* Determine protection word */ 
;
              tst.b       X:(SP+>0)
              beq         <_L47_0	; *+4
;
;  415:     data=0xffff; 
;  416:   else 
;
              move.w      #>-1,Y0
              bra         <_L47_1	; *+2
;
;  417:     data=0; 
;
_L47_0:
              move.w      #<0,Y0
;
;  418:   SelectRegBank();                     /* Select Data_Flash register bank */ 
;
_L47_1:
              move.l      #$f401,R1
              move.l      #$f401,R0
              move.w      X:(R0),A
              move.w      #>-4,B
              and.w       A,B
              move.w      #<1,A
              or.w        B,A
              move.w      A1,X:(R1)
;
;  419:   setReg(FMPROT,data);                 /* Write ProtectionWord to FMPROT register */ 
;
              move.l      #$f410,R0
              move.w      Y0,X:(R0)
;
;  420:   if (data != getReg(FMPROT)) {        /* If the read value is not equal to written value then exit */ 
;
              move.l      #$f410,R0
              move.w      X:(R0),A
              cmp.w       Y0,A
              beq         <_L47_2	; *+4
              nop         
;
;  421:     return ERR_VALUE; 
;  422:   } 
;
              move.w      #<3,Y0
              bra         <_L47_3	; *+2
;
;  423:   return ERR_OK; 
;
_L47_2:
              move.w      #<0,Y0
;
;  424: } 
_L47_3:
              suba        #<2,SP
              rts         
end_FDataFlash_SetGlobalProtection:

	ENDSEC

	SECTION loader

	ORG	P:

;
;  425:  
;  426: /* 
;  427: ** =================================================================== 
;  428: **     Method      :  DataFlash_SetBlockFlash (component IntFLASH) 
;  429: ** 
;  430: **     Description : 
;  431: **         Writes data to FLASH. 
;  432: **     Parameters  : 
;  433: **         NAME            - DESCRIPTION 
;  434: **         Source          - Source address of the data 
;  435: **         Dest            - Destination address in FLASH 
;  436: **         Count           - Count of the data fields in the 
;  437: **                           smallest addressable units. 
;  438: **           Note 1: The smallest addressable unit for the used CPU 
;  439: **                   is byte. 
;  440: **           Note 2: An address of a byte location is an 16-bit word 
;  441: **                   location address multiplied by 2 and then the 
;  442: **                   even/odd bytes are discriminated by LSB: 
;  443: **                   0 for even byte, 1 for odd byte. 
;  444: **     Returns     : 
;  445: **         ---             - Error code 
;  446: ** =================================================================== 
;  447: */ 
;  448: byte DataFlash_SetBlockFlash(DataFlash_TDataAddress Source,DataFlash_TAddress Dest,word Count) 
;  449: { 
;
		subroutine "FDataFlash_SetBlockFlash",FDataFlash_SetBlockFlash,end_FDataFlash_SetBlockFlash-FDataFlash_SetBlockFlash
FDataFlash_SetBlockFlash:
              adda        #<6,SP
              move.l      A10,X:(SP-2)
              move.l      B10,X:(SP-4)
              move.w      Y0,X:(SP)
;
;  450:   return WriteBlock(Source, Dest, Count); 
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
;  451: } 
;
              suba        #<6,SP
              rts         
end_FDataFlash_SetBlockFlash:

	ENDSEC

	SECTION DataFlash

	ORG	X:


;			*** UNINITIALIZED DATA (.bss) ***

			align 2
		FErr:	dsb	1

	ENDSEC


	END
