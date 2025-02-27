#ifndef INCLUDE_SCI_H
#define INCLUDE_SCI_H
//===========================================================================================

#include "Def_TipoDatos.h"
//--------------------------------------------------------------------------------------------------------------


#define SFD      '#'
#define EOFRAME   13

#define SCI_DLEN_MAX    256
#define SCI_RX_SZ       (SCI_DLEN_MAX + 1)
#define SCI_TX_SZ       (SCI_DLEN_MAX + 4)


void Init_SCI(void);

void sendSciMsg(byte Comando, void *Data, byte DataLen);
void txSci(void *Data, byte DataLen);

//Rutinas de interrupcion
void isrSCI0_TDRE();
void isrSCI0_RDRF();

//Variables Globales
extern volatile byte *sciRxBuf;

//===========================================================================================
#endif
