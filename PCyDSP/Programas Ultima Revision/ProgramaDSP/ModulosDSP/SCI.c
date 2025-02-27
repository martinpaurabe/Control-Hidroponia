//#include "MC56F8323.h"
#include "IO_Map.h"
#include "PE_Types.h"
#include <string.h>

#include "main.h"
#include "Unit_Sci.h"
#include "AD.h"
//--------------------------------------------------------------------------------------------

#define SCI_RX_ERRORES (SCI0SR1_OR_MASK | SCI0SR1_NF_MASK | SCI0SR1_FE_MASK | SCI0SR1_PF_MASK)

//Rx
static volatile byte rxBuf1[SCI_RX_SZ];
static volatile byte rxBuf2[SCI_RX_SZ];
static volatile byte *rxBuf;
static volatile byte rxBufIdx;
static volatile byte rxCantBytes;

enum {PARSER_PRINC, PARSER_LENGTH, PARSER_DATA, PARSER_EOF};
static volatile byte rxParser;

volatile byte *sciRxBuf;


//Tx
static byte txBuf[SCI_TX_SZ];
static volatile byte txBufIdx;
static byte txCantBytes; //Cantidad de datos a transmitir en buffer
//--------------------------------------------------------------------------------------------   


//sizeof(char) = 8 bits
//sizeof(void *) = 16 bits (SMD: small data memory)
//sizeof(int) = 16 bits
//--------------------------------------------------------------------------------------------

#pragma define_section loader_code "loader.text"  RX
#pragma section loader_code begin

void Init_SCI(void)
{
//	SCI0_SCIBR = 4; //921600
	SCI0_SCIBR = 33; //115200

    //-----------RX-------------
    rxParser = PARSER_PRINC;
    rxBuf = rxBuf1;
    sciRxBuf = NULL;

	setRegBit(SIM_GPS, TC0_ALT);

	setRegBit(SCI0_SCICR, RFIE);
	setRegBit(SIM_GPS, TC1_ALT);

	setRegBit(SCI0_SCICR, TE);
	setRegBit(SCI0_SCICR, RE);
}



//--------------------------------------------------------------------------------------------


void isrSCI0_TDRE()
{
#pragma interrupt
  
  byte *buf = ((byte *)txBuf);

  SCI0_SCISR;
  SCI0_SCIDR = buf[txBufIdx++];

  if(txBufIdx >= txCantBytes)
  {
  	clrRegBit(SCI0_SCICR, TEIE);	//Disable transmitter empty interrupt: TEIE = 0
  }
}
//--------------------------------------------------------------------------------------------
void isrSCI0_RDRF()
{
#pragma interrupt
byte Data=0;
	SCI0_SCISR;
	SCI0_SCISR=0;
	Data=SCI0_SCIDR;
  
    switch(rxParser)
    {
    case PARSER_PRINC:
      if(Data == SFD)
      {
        rxParser = PARSER_LENGTH;
      }

    break;
    case PARSER_LENGTH:
      rxCantBytes = Data;
      if(rxCantBytes > SCI_RX_SZ)
      {
        rxParser = PARSER_PRINC;
        return;
      }
      rxBufIdx = 0;
      rxParser = PARSER_DATA;

    break;
    case PARSER_DATA:
      rxBuf[rxBufIdx++] = Data;
      if(rxBufIdx >= rxCantBytes)
	  {
        rxParser = PARSER_EOF;
	  }

    break;
    case PARSER_EOF:
      if(Data == EOFRAME)
      {
		if(sciRxBuf == NULL)
		{
          sciRxBuf = rxBuf;
          
          if(rxBuf == rxBuf1)
          {
            rxBuf = rxBuf2;
          }
          else
          {
            rxBuf = rxBuf1;
          }
		}
      }

      rxParser = PARSER_PRINC;

    break;
    }
}

//--------------------------------------------------------------------------------------------   
void sendSciMsg(byte Comando, void *Data, byte DataLen)
{
  byte *buf = ((byte *)txBuf);

  if(DataLen > SCI_DLEN_MAX)
    return;

  buf[0] = SFD;
  buf[1] = DataLen+1;
  buf[2] = Comando;
  (void)memcpy(&buf[3], Data, DataLen);
  buf[3+DataLen] = EOFRAME;
  
  txCantBytes = 4 + DataLen;
  txBufIdx = 0;

  setRegBit(SCI0_SCICR, TEIE);	//enable transmitter empty interrupt: TEIE = 0
}
//-------------------------------------------------------------------------------------------


void txSci(void *Data, byte DataLen)
{
  byte *buf = ((byte *)txBuf);

  if(DataLen > SCI_DLEN_MAX)
    return;

  (void)memcpy(buf, Data, DataLen);
  
  txCantBytes = DataLen;
  txBufIdx = 0;

  setRegBit(SCI0_SCICR, TEIE);	//enable transmitter empty interrupt: TEIE = 0
}
//-------------------------------------------------------------------------------------------   

#pragma section loader_code end
