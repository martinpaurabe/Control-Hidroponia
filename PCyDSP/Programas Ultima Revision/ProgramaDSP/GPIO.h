#include "IO_Map.h"
#include "PE_Types.h"
//#include "MC56F8323.h"

//En PTA
#define PWM_FASE_1H     0x0001
#define PWM_FASE_1L     0x0002
#define PWM_FASE_2H     0x0004
#define PWM_FASE_2L     0x0008
#define PWM_FASE_3H     0x0010
#define PWM_FASE_3L     0x0020
#define HAB_MOT_A       0x0040
#define CAL_LAMB        0x0080
#define LED_INY_ON      0x0100
#define HAB_TEN_BUJ     0x0200
#define HAB_TEN_INJ     0x0400
#define INT_HOLD_KNOCK  0x0200

//En PTB
#define PTB0       0x0001
#define PTB1       0x0002
#define PTB2       0x0004
#define PTB3       0x0008
#define PTB4       0x0010
#define PTB5       0x0020
#define PTB6       0x0040
#define PTB7       0x0080
#define PTB8       0x0100
#define PTB9       0x0200
#define PTB10      0x0400
#define PTB11      0x0800
#define PTB12      0x1000
#define PTB13      0x4000
#define PTB14      0x6000
#define PTB15      0x8000

//En PTC
#define PTC0       0x0001
#define PTC1       0x0002
#define PTC2       0x0004
#define PTC3       0x0008
#define PTC4       0x0010
#define PTC5       0x0020
#define PTC6       0x0040
#define PTC7       0x0080
#define PTC8       0x0100
#define PTC9       0x0200
#define PTC10      0x0400
#define PTC11      0x0800
#define PTC12      0x1000
#define PTC13      0x4000
#define PTC14      0x6000
#define PTC15      0x8000

//En PTD
#define PTD0       0x0001
#define PTD1       0x0002
#define PTD2       0x0004
#define PTD3       0x0008
#define PTD4       0x0010
#define PTD5       0x0020
#define PTD6       0x0040
#define PTD7       0x0080
#define PTD8       0x0100
#define PTD9       0x0200
#define PTD10      0x0400
#define PTD11      0x0800
#define PTD12      0x1000
#define PTD13      0x4000
#define PTD14      0x6000
#define PTD15      0x8000

//Init Function
void init_GPIO(void);
