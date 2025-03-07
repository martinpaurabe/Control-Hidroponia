/** ###################################################################
**     THIS COMPONENT MODULE IS GENERATED BY THE TOOL. DO NOT MODIFY IT.
**     Filename  : ProgFlash.C
**     Project   : demo_serial_bootloader
**     Processor : 56F8323
**     Component : IntFLASH
**     Version   : Component 02.362, Driver 02.07, CPU db: 2.87.081
**     Compiler  : Metrowerks DSP C Compiler
**     Date/Time : 27/11/2020, 18:24
**     Abstract  :
**         This bean "IntFLASH" implements an access to internal FLASH.
**         The bean support reading/writing data into FLASH, erasing of
**         selected sector.
**         The bean supports events if the write interrupt is supported.
**         The bean supports following modes of write operations:
**           - Write - writing without any test.
**           - Destructive write - sector is erased if necessary.
**           - Safe write - user event is invoked to save and resore data
**                          from the current sector.
**         The bean requires on-chip FLASH memory (not used/allocated by
**         other beans).
**     Settings  :
**         FLASH memory type                 : Program and Boot FLASH
**         Total Program FLASH memory size   : 16384 words
**         Program FLASH memory sector size  : 512 words
**         Total Boot FLASH memory size      : 4096 words
**         Boot FLASH memory sector size     : 256 words
**         Interrupt service                 : Disabled
**         Write method                      : Write
**         Wait in RAM                       : no
**     Contents  :
**         Busy                - bool ProgFlash_Busy(byte Block);
**         EraseFlash          - byte ProgFlash_EraseFlash(byte Block);
**         SetGlobalProtection - byte ProgFlash_SetGlobalProtection(bool ProtectAll);
**         GetByteFlash        - byte ProgFlash_GetByteFlash(ProgFlash_TAddress Addr, byte *Data);
**         SetBlockFlash       - byte ProgFlash_SetBlockFlash(ProgFlash_TDataAddress Source,...
**         DataPtr2Addr        - ProgFlash_TAddress ProgFlash_DataPtr2Addr(void* Addr);
**         FuncPtr2Addr        - ProgFlash_TAddress ProgFlash_FuncPtr2Addr(void(*Addr)());
**
**     Copyright : 1997 - 2009 Freescale Semiconductor, Inc. All Rights Reserved.
**     
**     http      : www.freescale.com
**     mail      : support@freescale.com
** ###################################################################*/
/* MODULE ProgFlash. */

#include "ProgFlash.h"

/* Registers for usage in asm macros/functions */
#define FMCMD_ASM X:62484
#define FMCR_ASM X:62465
#define FMUSTAT_ASM X:62483

static byte Err;                       /* Error state of current process */

/*
** ===================================================================
**     Method      :  ProgFlash_SelectRegBank (component IntFLASH)
**
**     Description :
**         The method selects the Program / data flash register bank.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
#define SelectRegBank() setRegBitGroup(FMCR,BKSEL,PROG_REG_BANK)
/*
** ===================================================================
**     Method      :  ProgFlash_OutOfRange (component IntFLASH)
**
**     Description :
**         The method returns FALSE, if both of the input parameters are 
**         in an allowed flash memory address range. If at least one of 
**         the parameters is out of the range, return TRUE.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static byte OutOfRange(ProgFlash_TAddress addr1,ProgFlash_TAddress addr2)
{
  return ((addr1>addr2)||((addr1>=BOOT_FLASH_START)?((addr2>BOOT_FLASH_END)):((addr1<PROG_FLASH_START)||(addr2>PROG_FLASH_END))));
}

/*
** ===================================================================
**     Method      :  ProgFlash_SectorSize (component IntFLASH)
**
**     Description :
**         The method returns flash memory sector (erase page) size of a 
**         desired area.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
#define SectorSize(addr) (addr+1>BOOT_FLASH_START-1?(BOOT_FLASH_SECTOR_SIZE):(PROG_FLASH_SECTOR_SIZE))

/*
** ===================================================================
**     Method      :  ClearFlags (component IntFLASH)
**
**     Description :
**         The method clears the flash memory interface complete and 
**         error flags.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
#define ClearFlags() setReg(FMUSTAT,0x30)

/*
** ===================================================================
**     Method      :  readflash (component IntFLASH)
**
**     Description :
**         The method reads 16-bit word from a flash memory.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
/*lint -save -e745 -e939 -e533 -e82 Disable MISRA rule (75,83,84) checking. */
static asm word readflash(ProgFlash_TAddress address)
{
  move.l A10,R2;                       /* Move given address to pointer register */
  move.w p:(r2)+,y0;                   /* Read data from program memory */
  rts;
}
/*lint -restore */

/*
** ===================================================================
**     Method      :  writeflash (component IntFLASH)
**
**     Description :
**         The method writes 16-bit word to a flash memory.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
/*lint -save -e745 -e939 -e533 -e82 Disable MISRA rule (75,83,84) checking. */
static asm word writeflash(ProgFlash_TAddress address, word data)
{
  move.l A10,R2;                       /* Move given address to pointer register */
  move.w Y0,p:(R2)+;                   /* Write given data to desired address in program memory */
  rts;
}
/*lint -restore */

/*
** ===================================================================
**     Method      :  procflash (component IntFLASH)
**
**     Description :
**         The method programs 16-bit word to a flash memory.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static byte procflash(ProgFlash_TAddress address, word data, word command)
{
  if (ProgFlash_Busy())                /* Is a command in progress in any of the flash devices? */
    return ERR_BUSY;                   /* If yes then error */
  ClearFlags();                        /* Clear all flags */
  writeflash(address, data);           /* Write given data to the flash memory */
  setReg(FMCMD,command);               /* Write given command to FMCMD register */
  setReg(FMUSTAT,0x80);                /* launch the command */
  if ((getRegBit(FMUSTAT,PVIOL))||(getRegBit(FMUSTAT,ACCERR))) /* Is protection violation or access error detected ? */
    return ERR_NOTAVAIL;               /* If yes then return the error */
  return Err;
}

/*
** ===================================================================
**     Method      :  WriteBlock (component IntFLASH)
**
**     Description :
**         The metohd writes block of data to a flash memory.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
static byte WriteBlock(ProgFlash_TAddress Source, ProgFlash_TAddress Dest, dword Count)
{
  register word i, DataToWrite;
  register dword s_index, Addr, LastAddr, Size;
  register bool ByteFirst, ByteLast;

  Err = ERR_OK;
  Addr = (dword)Dest / 2;
  if ((dword)Dest % 2 > 0)
    ByteFirst = TRUE;
  else
    ByteFirst = FALSE;
  LastAddr = (dword)Dest + Count;
  if (LastAddr % 2 > 0)
    ByteLast = TRUE;
  else
    ByteLast = FALSE;
  LastAddr = (LastAddr - 1) / 2;
  Size = (LastAddr - Addr) + 1;
  if (OutOfRange(Addr,LastAddr))       /* Is the address out of range? */
    return(ERR_RANGE);                 /* If yes then exit */
  SelectRegBank();                     /* Select Program_Boot_Flash register bank */
  s_index = 0;
  for (i=0; i<Size; i++) {             /* For all given data */
    while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */
    if ((i == 0) && (ByteFirst))
      DataToWrite = (readflash(Addr) & 0x00ff) + (((word)((byte *)(Source))[s_index++]) << 8);
    else if ((i == Size - 1) && (ByteLast))
      DataToWrite = (readflash(Addr + i) & 0xff00) + ((byte *)(Source))[s_index];
    else {
      DataToWrite = ((byte *)Source)[s_index] + ((word)((byte *)(Source))[s_index + 1] << 8);
      s_index += 2;
    }
    if (readflash(Addr+i) != DataToWrite) /* Is the FLASH programming necessary? */
      Err = procflash(Addr+i, DataToWrite, PROGRAM); /* If yes write new data to Flash */
    if (Err != ERR_OK) {               /* If an error occured then exit */
      return Err;
    }
  }
  while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */
  i = 0;
  s_index = 0;
  if ((Err == ERR_OK) && (ByteFirst)) {
    i++;
    if ((readflash(Addr) >> 8) != ((byte*)Source)[s_index++])
      Err = ERR_VALUE;
  }
  if (Err == ERR_OK) {
    for (; i < Size - ByteLast; i++) { /* Check all given data were written good */
      if (readflash(Addr+i) != ((((byte*)Source)[s_index]) + ((word)((byte*)Source)[s_index + 1] << 8))) {
        s_index += 2;
        Err = ERR_VALUE;
        break;
      }
      else {
        s_index += 2;
      }
    }
  }
  if ((Err == ERR_OK) && (ByteLast)) {
    if ((byte)(readflash(Addr+i)) != ((byte*)Source)[s_index])
      Err = ERR_VALUE;
  }
  return Err;
}

/*
** ===================================================================
**     Method      :  BlockAddress (component IntFLASH)
**
**     Description :
**         If the served flash memory is composed from several memory 
**         blocks, the method returns a start address of the memory block 
**         given as an input parameter.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
#define BlockAddress(Block) (ProgFlash_TAddress)(Block == BOOT_FLASH_BLOCK ? BOOT_FLASH_START : PROG_FLASH_START)

/*
** ===================================================================
**     Method      :  BlockOutOfRange (component IntFLASH)
**
**     Description :
**         The method returns FALSE, if the input parameter is in an 
**         allowed flash memory blocks range. If the parameter is out of 
**         the range, return TRUE.
**         This method is internal. It is used by Processor Expert only.
** ===================================================================
*/
#define BlockOutOfRange(Block) (Block > PROG_BOOT_FLASH_MAX_BLOCK_NUM)

/*
** ===================================================================
**     Method      :  ProgFlash_Busy (component IntFLASH)
**
**     Description :
**         Method return status of the FLASH device
**     Parameters  :
**         NAME            - DESCRIPTION
**         Block           - Block number. Not used for Freescale
**                           56800 and HCS12X derivates - any value may be passed.
**     Returns     :
**         ---             - TRUE/FALSE - FLASH is busy/ready
** ===================================================================
*/
/*
bool ProgFlash_Busy(byte Block)

**      This method is implemented as macro. See ProgFlash.h file.      **
*/

/*
** ===================================================================
**     Method      :  ProgFlash_EraseFlash (component IntFLASH)
**
**     Description :
**         Erase all memory array of the selected Flash block.
**     Parameters  :
**         NAME            - DESCRIPTION
**         Block           - Block number.
**                           Possible values:
**                            - PROG_FLASH_BLOCK
**                            - BOOT_FLASH_BLOCK
**     Returns     :
**         ---             - Error code, possible codes:
**                           - ERR_OK - OK
**                           - ERR_NOTAVAIL - Desired program/erase
**                           operation is not available
**                           - ERR_RANGE - Block number is out of
**                           range
**                           - ERR_SPEED - This device does not work
**                           in the active speed mode
** ===================================================================
*/
byte ProgFlash_EraseFlash(byte Block)
{
  Err = ERR_OK;
  if (BlockOutOfRange(Block))          /* Is the block number in the allowed range? */
    return ERR_RANGE;                  /* If no then error */
  SelectRegBank();                     /* Select Program_Boot_Flash register bank */
  Err = procflash(BlockAddress(Block), 0, MASS_ERASE); /* Erase the FLASH memory block */
  while (getRegBit(FMUSTAT,CCIF) == 0) {} /* Wait to command complete */
  return Err;
}

/*
** ===================================================================
**     Method      :  ProgFlash_GetByteFlash (component IntFLASH)
**
**     Description :
**         Get byte from address in FLASH.
**     Parameters  :
**         NAME            - DESCRIPTION
**         Addr            - Address to FLASH
**           Note: An address of the byte location is an 16-bit word
**                 location address multiplied by 2 and then the
**                 even/odd bytes are discriminated by LSB:
**                 0 for even byte, 1 for odd byte.
**       * Data            - Pointer to returned 8-bit data
**     Returns     :
**         ---             - Error code, possible codes:
**                           - ERR_OK - OK
**                           - ERR_RANGE - Address is out of range
** ===================================================================
*/
byte ProgFlash_GetByteFlash(ProgFlash_TAddress Addr,byte *Data)
{
  word Data16;
  if (OutOfRange(Addr/2,Addr/2))       /* Check range of address */
    return ERR_RANGE;
  Data16 = readflash((Addr/2));        /* Read word from FLASH */
  *Data = *(((byte *)(&Data16))+Addr%2); /* Set desired byte data */
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  ProgFlash_SetGlobalProtection (component IntFLASH)
**
**     Description :
**         Method makes all memory array of the selected FLASH
**         protected or unprotected. The protection state changes
**         are active till system reset.
**     Parameters  :
**         NAME            - DESCRIPTION
**         ProtectAll      - TRUE - The whole flash
**                           memory array of the selected flash is
**                           protected; FALSE - The whole flash
**                           memory array of the selected flash is
**                           unprotected.
**     Returns     :
**         ---             - Error code, possible codes:
**                           - ERR_OK - OK
**                           - ERR_NOTAVAIL - Desired program/erase
**                           operation is not available
**                           - ERR_VALUE - Read value is not equal to
**                           written value
**                           - ERR_SPEED - This device does not work
**                           in the active speed mode
** ===================================================================
*/
byte ProgFlash_SetGlobalProtection(bool ProtectAll)
{
  register word data;
  if (ProtectAll)                      /* Determine protection word */
    data=0xffff;
  else
    data=0;
  SelectRegBank();                     /* Select Program_Boot_Flash register bank */
  setReg(FMPROT,data);                 /* Write ProtectionWord to FMPROT register */
  if (data != getReg(FMPROT)) {        /* If the read value is not equal to written value then exit */
    return ERR_VALUE;
  }
  setReg(FMPROTB,data);                /* Write ProtectionWord to FMPROTB register */
  if ((data & 0x000f) != getReg(FMPROTB)) { /* If the read value is not equal to written value then exit */
    return ERR_VALUE;
  }
  return ERR_OK;
}

/*
** ===================================================================
**     Method      :  ProgFlash_SetBlockFlash (component IntFLASH)
**
**     Description :
**         Writes data to FLASH.
**     Parameters  :
**         NAME            - DESCRIPTION
**         Source          - Source address of the data
**         Dest            - Destination address in FLASH
**         Count           - Count of the data fields in the
**                           smallest addressable units.
**           Note 1: The smallest addressable unit for the used CPU
**                   is byte.
**           Note 2: An address of a byte location is an 16-bit word
**                   location address multiplied by 2 and then the
**                   even/odd bytes are discriminated by LSB:
**                   0 for even byte, 1 for odd byte.
**     Returns     :
**         ---             - Error code
** ===================================================================
*/
byte ProgFlash_SetBlockFlash(ProgFlash_TDataAddress Source,ProgFlash_TAddress Dest,word Count)
{
  return WriteBlock(Source, Dest, Count);
}

/*
** ===================================================================
**     Method      :  ProgFlash_DataPtr2Addr (component IntFLASH)
**
**     Description :
**         This method converts data pointer to format of a bean method
**         address parameter. Generally a data pointer format is
**         different from format of a method Addr parameter.
**     Parameters  :
**         NAME            - DESCRIPTION
**       * Addr            - Data pointer.
**     Returns     :
**         ---             - Address in the format used in the bean
**                           methods.
**                           Version specific information for 56800
**                           derivatives ] 
**                           The return value is address of a byte
**                           location of the object the input parameter
**                           - pointer pointing at (address of a 16 bit
**                           word location multiplied by 2 and the least
**                           significant bit determines even or odd byte).
** ===================================================================
*/
/*
ProgFlash_TAddress ProgFlash_DataPtr2Addr(void DataPtr)

**  This method is implemented as a macro. See ProgFlash.h file.  **
*/

/*
** ===================================================================
**     Method      :  ProgFlash_FuncPtr2Addr (component IntFLASH)
**
**     Description :
**         This method converts function pointer to format of a bean
**         method address parameter. Generally a function pointer
**         format is different from format of a method Addr parameter.
**     Parameters  :
**         NAME            - DESCRIPTION
**       * Addr            - Function pointer.
**     Returns     :
**         ---             - Address in the format used in the bean
**                           methods.
**                           Version specific information for 56800
**                           derivatives ] 
**                           The return value is address of a byte
**                           location of the object the input parameter
**                           - pointer pointing at (address of a 16 bit
**                           word location multiplied by 2 and the least
**                           significant bit determines even or odd byte).
** ===================================================================
*/
/*
ProgFlash_TAddress ProgFlash_FuncPtr2Addr(void FuncPtr)

**  This method is implemented as a macro. See ProgFlash.h file.  **
*/

/* END ProgFlash. */
/*
** ###################################################################
**
**     This file was created by Processor Expert 3.00 [04.35]
**     for the Freescale 56800 series of microcontrollers.
**
** ###################################################################
*/
