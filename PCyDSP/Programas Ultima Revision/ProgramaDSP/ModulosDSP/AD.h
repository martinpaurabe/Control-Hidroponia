#include "PE_Types.h"

#define CANT_PROM 16

void init_AD(void);

void isrADCAConvCompl();

//Variables de Correxion de Medicion
extern float M0,M1;
extern UInt32 B0,B1;

#define CORREGIR_AD0(x)  ((M0*(x))+B0)
#define CORREGIR_AD1(x)  ((M1*(x))+B1)

//declaracion de varialbles acumuladoras para filtro digital.
extern UInt32 ACUM_ADCA_ADRSLT0;
extern UInt32 ACUM_ADCA_ADRSLT1;	
extern UInt32 ACUM_ADCA_ADRSLT2;	
extern UInt32 ACUM_ADCA_ADRSLT3;
extern UInt32 ACUM_ADCA_ADRSLT4;	
extern UInt32 ACUM_ADCA_ADRSLT5;	
extern UInt32 ACUM_ADCA_ADRSLT6;	
extern UInt32 ACUM_ADCA_ADRSLT7;
